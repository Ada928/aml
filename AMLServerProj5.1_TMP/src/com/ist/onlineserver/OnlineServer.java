package com.ist.onlineserver;

/**
 * <p>Title: ��ʱ��������</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: �������ڿƼ��������޹�˾</p>
 * @author ������
 * @version 1.0
 */

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import com.ist.common.LogUtils;
import com.ist.common.context.ContextLoader;
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.common.DbException;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.onlineserver.cal.BaseCalTask;
import com.ist.onlineserver.cal.CalTaskBO;
import com.ist.onlineserver.dao.T18_onlineserverDao;
import com.ist.onlineserver.dto.T18_online_task_fact;
import com.ist.onlineserver.dto.T18_online_task_para;
import com.ist.onlineserver.dto.T18_online_task_type;
import com.ist.onlineserver.thread.ThreadPool;

public class OnlineServer {

	public static final String MAIN_SERVER_LOG_FILE = "log4j.properties";
	static {
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()
				+ File.separator + MAIN_SERVER_LOG_FILE);
	}
	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(OnlineServer.class
			.getName());

	/** �̳߳� */
	public ThreadPool threadPool;

	/** ��ʱ�� */
	private final Timer timer = new Timer();

	/** ͨ�������ļ���ȡ ��λΪ���ӣ�X * 60 * 1000�� */
	private int scan_timespace = 1 * 60 * 1000;

	/** ��ǰSERVER�ı�� ���ڳ־ü�¼��ǰSERVERKEY */
	private String serverkey = "";

	/**
	 * ���캯��
	 */
	public OnlineServer() {
	}

	/**
	 * ����AuditServer��ÿ��һ��ʱ�����һ��ɨ�� ��ϵͳ�Ƿ���������Ҫִ��
	 * 
	 * �������ִ��ʱ��Ƚϳ�������ɨ���ʱ������Timer������� ����ִ����Ϻ�����ִ����һ��ɨ�裬ͬһ��Server�ڸ�������ֻ�����Ǵ���
	 */
	public void startServer() {
		logger.info("ϵͳ�����ɹ���");
		logger.info("");
		threadPool = new ThreadPool();// ��ʼ���̳߳�
		timer.schedule(new TimerTask() {
			@Override
			public void run() {

				try {
					executeTasks();
				} catch (Exception e) {
					e.printStackTrace();
				}
				// ֹͣ��ʱ��������Ӱ������ִ�е�����ϵͳ�Ὣ��������ִ�����
				// timer.cancel();
			}
			// ��ǰʱ�俪ʼ��ÿ�� scan_timespace ����ʱ����ִ��һ�� TimerTask
		}, new Date(), scan_timespace); // ִ��һ��
	}

	/**
	 * ����BMserver��ÿ��һ��ʱ�����һ�μ�� �����ʽ��
	 * 
	 */
	public void executeTasks() {

		CalTaskBO calTaskBO = new CalTaskBO();
		
		int freeThreadCount = 0;// �����߳���
		int maxPools = 0;// �߳�����
		try {

			maxPools = Integer.parseInt(SysConfig
					.getProperty("onlineserver.threadpool.maxpools"));
			int poolsnum = Integer.parseInt(SysConfig
					.getProperty("onlineserver.threadpool.poolsnum"));// ����̵߳ı����������̳߳ص�����

			// 1.��ȡ��ǰ��ִ�е������б�
			ArrayList taskList = calTaskBO.getWillExecuteTask(maxPools
					* poolsnum);
			logger.debug("��ǰ����ִ����������" + taskList.size());

			// 2.�޸ķ����̳߳ص�����Ϊ�ȴ�����״̬
			this.modiTaskWaieStatus(taskList);

			while (true) {
				if (taskList != null && taskList.size() > 0)
				{
					// 3.������Ҫִ�е�����,�����̳߳�
					Iterator iter = taskList.iterator();
					while (iter.hasNext()) {
						BaseCalTask baseCalTask = null;
						T18_online_task_fact t18_online_task_fact = (T18_online_task_fact) iter
								.next();
						if (t18_online_task_fact == null
								|| t18_online_task_fact.getTaskkey().equals("")) {
							continue;
						}
						// 3.��ʼ�����������Ϣ
						t18_online_task_fact = this.initTaskFact(
								t18_online_task_fact, calTaskBO);
						// 4.��������
						freeThreadCount = threadPool.run(t18_online_task_fact);
					}

					if (freeThreadCount > 0) {
						taskList = calTaskBO.getWillExecuteTask(maxPools
								* poolsnum);
					} else
						break;
				} else {
					break;
				}
			}

		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		}

	}

	public T18_online_task_fact initTaskFact(
			T18_online_task_fact t18_online_task_fact, CalTaskBO calTaskBO) {
		CatchManager cm = new CatchManager();

		try {
			// ��ʼ������LIST
			HashMap t18_task_typeMap = cm
					.getMapFromCache("T18_TASK_ONLINETYPEMAP");
			String businesskey = t18_online_task_fact.getBusinesskey();
			t18_online_task_fact.setServerkey(this.getServerkey());
			if (t18_task_typeMap.containsKey(businesskey)) {
				t18_online_task_fact
						.setT18_online_task_type((T18_online_task_type) t18_task_typeMap
								.get(businesskey));

			}

			// ��ʼ���������T18_ONLINE_TASK_PARA
			HashMap paraHash = new HashMap();
			HashMap subparaHash = new HashMap();
			ArrayList paraList = calTaskBO.getTaskPara(t18_online_task_fact
					.getTaskkey());
			T18_online_task_para t18_online_task_para = new T18_online_task_para();
			// 2.������Ҫִ�е�����
			Iterator iter = paraList.iterator();
			while (iter.hasNext()) {
				t18_online_task_para = (T18_online_task_para) iter.next();
				if (t18_online_task_para.getSubnum() != null
						&& !"".equals(t18_online_task_para.getSubnum())) {
					if (paraHash.containsKey(t18_online_task_para
							.getPara_code())) {
						subparaHash = (HashMap) paraHash
								.get(t18_online_task_para.getPara_code());
						subparaHash.put(t18_online_task_para.getSubnum(),
								t18_online_task_para.getPara_val());
					} else {
						subparaHash = new HashMap();
						subparaHash.put(t18_online_task_para.getSubnum(),
								t18_online_task_para.getPara_val());
						paraHash.put(t18_online_task_para.getPara_code(),
								subparaHash);
					}
				} else {
					paraHash.put(t18_online_task_para.getPara_code(),
							t18_online_task_para.getPara_val());

				}

				t18_online_task_fact.setParamap(paraHash);
			}

		} catch (Exception ex) {

		}
		return t18_online_task_fact;
	}

	/**
	 * ��ʼ��AuditServerϵͳ
	 * 
	 * @param serverkey
	 *            �����������
	 * @throws Exception
	 */
	private void init(String serverkey) throws Exception {
		// ��ʼ��ϵͳɨ��ʱ��
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;
		this.setServerkey(serverkey);
		try {
			int resetNum = this.resetTaskFactStatus(serverkey);
			if (resetNum > 0) {
				logger.info("����" + resetNum
						+ "������������ִ�е�״̬���Ѿ�����̬��λ����ȷ��û������Server�������У�");
			}

		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "ϵͳ��ʼ��ʧ�ܣ�";
			logger.error(errMsg);
			throw new Exception(errMsg + "--" + e.getMessage());
		}
	}

	public int resetTaskFactStatus(String serverkey) throws Exception {
		int isSucc = 0;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_onlineserverDao t18_onlineserverDao = new T18_onlineserverDao();
			isSucc = t18_onlineserverDao.resetStatus(conn, serverkey);
		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
				logger.error("���ݿ�رմ���" + ec);
			}
		}
		return isSucc;
	}

	public boolean modiTaskWaieStatus(ArrayList taskList) throws Exception {
		boolean isSucc = false;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_onlineserverDao t18_onlineserverDao = new T18_onlineserverDao();
			isSucc = t18_onlineserverDao.modiT18_online_task_factStatusWait(
					conn, taskList);
		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
				logger.error("���ݿ�رմ���" + ec);
			}
		}
		return isSucc;
	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}

	public static void main(String[] args) {
		OnlineServer onlineServer1 = new OnlineServer();

		try {
			// ������в���
			String serverkey = "S1001";
			if (args.length > 0) {
				serverkey = args[0];
			}

			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      ��������ϵͳ��ʱ�������� IST ONLINE SERVER             **********");
			logger
					.info("********************************************************************************");
			logger.info("ϵͳ��ʼ��..............................");
			// ��ʼ��onlineserverϵͳ
			onlineServer1.init(serverkey);
			logger.info("ϵͳ��������............................");
			ContextLoader.loadContext();
			// ִ��
			onlineServer1.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}

	}

}