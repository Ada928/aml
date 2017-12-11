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
import java.lang.reflect.Field;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Calendar;
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
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.common.DbException;
import com.ist.common.database.common.DbUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.onlineserver.cal.BaseCalTask;
import com.ist.onlineserver.cal.CalTaskBO;
import com.ist.onlineserver.dao.T18_onlineserverDao;
import com.ist.onlineserver.dto.T18_online_task_fact;
import com.ist.onlineserver.dto.T18_online_task_para;
import com.ist.onlineserver.dto.T18_online_task_type;
import com.ist.onlineserver.thread.ThreadPool;

public class ConfigOnlineServer {

	public static final String MAIN_SERVER_LOG_FILE = "log4j-online.properties";
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
	private int scan_timespace = 5 * 60 * 1000;

	/** ��ǰSERVER�ı�� ���ڳ־ü�¼��ǰSERVERKEY */
	private String serverkey = "";

	/**
	 * ���캯��
	 */
	public ConfigOnlineServer() {
	}

	/**
	 * ����AuditServer��ÿ��һ��ʱ�����һ��ɨ�� ��ϵͳ�Ƿ���������Ҫִ��
	 * 
	 * �������ִ��ʱ��Ƚϳ�������ɨ���ʱ������Timer������� ����ִ����Ϻ�����ִ����һ��ɨ�裬ͬһ��Server�ڸ�������ֻ�����Ǵ���
	 */
	public void startServer() {
		logger.info("ϵͳ�����ɹ���");
		logger.info("");

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
		Connection conn=null;
		try {
			CalTaskBO calTaskBO = new CalTaskBO();
		    conn = ConnectionManager.getConnection();
			// 1����ȡ��Ҫ�Զ����õ�������Ϣ
			ArrayList list = calTaskBO.getIsSetTaskListExecute();
			for (Iterator iter = list.iterator(); iter.hasNext();) {
				T18_online_task_fact t18_online_task = (T18_online_task_fact) iter
						.next();
				t18_online_task.setStatisticdate(DateUtils.getCurrShortDateStr());
				//2����֯��Ҫ���������ʱ��
				String settime = t18_online_task.getSettasktime();
				String[] settimeStr=null;
				if (settime.indexOf(",") > -1) {
					 settimeStr = StringUtils.split(settime, ",");
				} else {
					settimeStr=new String[1];
					settimeStr[0]=settime;
				}
				//3����������ʱ�������������
				for (int i = 0; i < settimeStr.length; i++) {
					int time = Integer.valueOf(settimeStr[i]);
					// 4���ж��Ƿ��Ѿ�����Ҫ���������ʱ��
					int currtime = Integer.valueOf(DateUtils
							.getHour(DateUtils.getCurrDateTime()));
					if (currtime >= time) {
						// 5����������Ƿ����ù�
						if (!calTaskBO.taskIsSet(conn, t18_online_task,
								String.valueOf(time))) {
							// 6��δ���ù�������������
							boolean isuss = calTaskBO.insertOnlineTask(
									conn, t18_online_task, String
											.valueOf(time));
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		} finally {
			DbUtils.close(conn);
			logger.debug("��������ر�������Ԫ�������ӳɹ�......");

		}

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

	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}

	public static void main(String[] args) {
		ConfigOnlineServer onlineServer1 = new ConfigOnlineServer();

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

			logger.info("ϵͳ��������............................");
			// ִ��
			onlineServer1.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}

	}

}