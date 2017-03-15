package com.ist.server;

/**
 * <p>Title: ����DM��ʱ����SERVER</p>
 * <p>
 * SERVER������ÿ��һ����ʱ����������Ƿ���������Ҫִ�У�Ȼ��˳��ִ�С�
 * ϵͳ�����������������ļ���ϵͳ��־���������ȷ��
 *
 * �����ļ�:classes/system_config.xml ϵͳ�������ļ�
 *         classes/system_init.properties ��ʶ�����ļ�����Ŀ¼
 * </p>
 * <p>Copyright: Copyright (c) 2005.10</p>
 * <p>Company: ��������</p>
 * @author ������
 * @version 1.0
 */

import java.io.File;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.commons.lang.math.NumberUtils;
import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.ist.common.Constants;
import com.ist.common.LogUtils;
import com.ist.common.database.ConnectionManager;
import com.ist.common.database.Out_ConnectionManager;
import com.ist.common.database.common.BaseDbUtils;
import com.ist.common.database.common.DbException;
import com.ist.common.database.common.DbUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.CalTaskBO;
import com.ist.server.cal.CalTaskFactory;
import com.ist.server.dao.T18_task_cal_logDAO;
import com.ist.server.dao.T18_task_factDAO;
import com.ist.server.dto.T18_datasource;
import com.ist.server.dto.T18_ods2dmetl;
import com.ist.server.dto.T18_ods_dblink;
import com.ist.server.dto.T18_ods_fetch;
import com.ist.server.dto.T18_ods_load;
import com.ist.server.dto.T18_task_cal_log;
import com.ist.server.dto.T18_task_fact;
import com.ist.server.dto.T18_task_type;
import com.ist.server.dto.T18_tasklist;
public class MainServer {

	public	static	final	String	MAIN_SERVER_LOG_FILE="log4j-audit.properties";
    static{
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()+File.separator+MAIN_SERVER_LOG_FILE);
    }
	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(MainServer.class
			.getName());

	/** ��ʱ�� */
	private final Timer timer = new Timer();

	/** ͨ�������ļ���ȡ ��λΪ���ӣ�X * 60 * 1000�� */
	private int scan_timespace = 5 * 60 * 1000;

	/** ��ǰSERVER�ı�� ���ڳ־ü�¼��ǰSERVERKEY */
	private String serverkey = "";
	/**ִ�������server*/
	private String exec_server = "";

	private BaseDbUtils bdu = new BaseDbUtils();

	/** ���캯�� */
	public MainServer() {
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
	 * ����ִ���� ���񹲷�Ϊ���࣬�˴�֮��û��ֱ�ӹ�ϵ�����Ե���ִ�� 1����ODS����������м�� 2����DM����������м��
	 * 
	 * @return �Ƿ�ɹ�
	 */
	private void executeTasks() {
		CalTaskBO calTaskBO = new CalTaskBO();
		try {
			// 1.��ȡ��ǰ��ִ�е������б�
			ArrayList taskList = calTaskBO.getWillExecuteTask(this.exec_server);
		    logger.debug("��Ҫִ����������"+taskList.size());
		    
			// 2.������Ҫִ�е�����
			Iterator iter = taskList.iterator();
			while (iter.hasNext()) {
				   BaseCalTask baseCalTask = null;
					T18_task_fact t18_task_fact = (T18_task_fact) iter.next();
					if (t18_task_fact == null
							|| t18_task_fact.getTaskkey().equals("")) {
						continue;
					}
					// 3.��ʼ�����������Ϣ
					t18_task_fact = this.initTaskFact(t18_task_fact);
					// 4.��������
					CalTaskFactory calTaskFactory = new CalTaskFactory();
					baseCalTask = calTaskFactory.getCaltaskInstance(t18_task_fact);
					baseCalTask.run();	
			}
		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
			DbException.saveExceptionLog(logger, DbException.ERROR, e);
		}
	}

	public T18_task_fact initTaskFact(T18_task_fact t18_task_fact) {
		CatchManager cm = new CatchManager();
		 
		HashMap t18_ods_fetchMap = cm.getMapFromCache("T18_ODS_FETCHMAP");
		HashMap t18_task_typeMap = cm.getMapFromCache("T18_TASK_TYPEMAP");
		HashMap t18_datasourceMap = cm.getMapFromCache("T18_DATASOURCEMAP");
		HashMap t18_ods_loadMap = cm.getMapFromCache("T18_ODS_LOADMAP");
		HashMap t18_ods2dmetlMap = cm.getMapFromCache("T18_ODS2DMETLMAP");
		HashMap t18_tasklistMap = cm.getMapFromCache("T18_TASKLISTMAP");

		// ���dblink���� add by lingjiang.zhou 2012-08-27
		HashMap t18_ods_dblinkMap = cm.getMapFromCache("T18_ODS_DBLINKMAP");

		String task_type = t18_task_fact.getTasktype();
		String dskey = t18_task_fact.getDskey();
		String tableename = t18_task_fact.getBusinesskey();
		t18_task_fact.setServerkey(this.getServerkey());
		if (t18_task_typeMap.containsKey(task_type)) {
			t18_task_fact.setT18_task_type((T18_task_type) t18_task_typeMap
					.get(task_type));
			
		}
		if (t18_datasourceMap.containsKey(dskey)) {
			t18_task_fact.setT18_datasource((T18_datasource) t18_datasourceMap
					.get(dskey));
		}

		if (t18_ods_fetchMap.containsKey(dskey + "-" + tableename)) {
			t18_task_fact.setT18_ods_fetch((T18_ods_fetch) t18_ods_fetchMap
					.get(dskey + "-" + tableename));
		}
		if (t18_ods_loadMap.containsKey(dskey + "-" + tableename)) {
			t18_task_fact.setT18_ods_load((T18_ods_load) t18_ods_loadMap
					.get(dskey + "-" + tableename));
		}
		if (t18_ods2dmetlMap.containsKey(tableename)) {
			t18_task_fact.setT18_ods2dmetl((T18_ods2dmetl) t18_ods2dmetlMap
					.get(tableename));
		}
		// ���dblink��ȡ��Ҫ�ĳ�ʼ����t18_task_fact���󣩲��� add by lingjiang.zhou 2012-08-27
		if (t18_ods_dblinkMap.containsKey(tableename)) {
			t18_task_fact.setT18_ods_dblink((T18_ods_dblink) t18_ods_dblinkMap
					.get(tableename));
		}
		
		if (t18_tasklistMap.containsKey(t18_task_fact.getO_businesskey()+"-"+t18_task_fact.getTasktype()+"-"+t18_task_fact.getGranularity())) {			
			T18_tasklist list=(T18_tasklist)t18_tasklistMap.get(t18_task_fact.getO_businesskey()+"-"+t18_task_fact.getTasktype()+"-"+t18_task_fact.getGranularity());
			t18_task_fact.setTasknum(list.getSubtasknum());
			
		}
		return t18_task_fact;
	}

	/**
	 * ��ʼ��AuditServerϵͳ
	 * 
	 * @param serverkey
	 *            �����������
	 * @throws Exception
	 */
	private void init(String serverkey,String exec_server) throws Exception {
		// ��ʼ��ϵͳɨ��ʱ��
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;

		CatchManager cm = CatchManager.getInstance();
		this.setServerkey(serverkey);
		this.setExec_server(exec_server);
		try {
			cm.putCatch("test", "aaa");
			String aa=(String)cm.getObjFromCache("test");
			
			cm.getMapFromCache("T18_DATASOURCEMAP");
			cm.getMapFromCache("T18_TASK_TYPELIST");
			cm.getMapFromCache("T18_DATASOURCELIST");
			cm.getMapFromCache("T18_TASK_TYPEMAP");
			cm.getMapFromCache("T18_ODS_FETCHMAP");
			cm.getMapFromCache("T18_ODS_LOADMAP");
			cm.getMapFromCache("T18_ODS2DMETLMAP");
			
			//����״̬��λ
			
			int resetNum = this.resetTaskFactStatus(serverkey,exec_server);
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
	public int resetTaskFactStatus(String serverkey,String exec_server) throws Exception {
		int isSucc = 0;
		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_task_factDAO t18_task_factDAO = new T18_task_factDAO();
			isSucc=t18_task_factDAO.resetStatus(conn, serverkey,exec_server);
		} catch (Exception e) {
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
		} finally {
			DbUtils.close(conn);
		}
		return isSucc;
	}
	/**
	 * ִ��������
	 * 
	 * @param args
	 *            ���в��� args[0]=serverkey
	 */
	public static void main(String[] args) {
		MainServer mainServer = new MainServer();
		try {
			// ������в���
			String serverkey = "S1001";
			String exec_server="";
			if (args.length > 0) {
				serverkey = args[0];
				logger.debug("serverkey:"+serverkey);
			}
			if (args.length > 1) {
				exec_server=args[1];
				logger.debug("exec_server:"+exec_server);
			}
			
			// else{
			// throw new Exception("ȱ�����в��������������е�SERVERKEY��");
			// }
			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      ��������ϵͳ��ʱ��������  **********");
			logger
					.info("********************************************************************************");
			logger.info("ϵͳ��ʼ��..............................");
			// ��ʼ��AuditServerϵͳ
			mainServer.init(serverkey,exec_server);
			logger.info("ϵͳ��������............................");
			// ִ��
			mainServer.startServer();

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}

	public String getServerkey() {
		return serverkey;
	}

	public void setServerkey(String serverkey) {
		this.serverkey = serverkey;
	}
	public String getExec_server() {
		return exec_server;
	}

	public void setExec_server(String execServer) {
		exec_server = execServer;
	}
	public void task_final_exe(Connection conn, T18_task_fact t18_task_fact) {
		String dbdriver = "oracle.jdbc.driver.OracleDriver";// Զ�����ݿ�(10.227.1.137)��������
		String dburl = "jdbc:oracle:thin:@10.6.50.246:1521:istora";// Զ�����ݿ�url,�����ֳ���Ҫ�����ʵ�����
		String dbuser = "awp4";// Զ�����ݿ��û���,�����ֳ���Ҫ�����ʵ�����
		String dbpwd = "awp4";// Զ�����ݿ��û�����,�����ֳ���Ҫ�����ʵ�����
		Connection conn_out = null;
		T18_task_factDAO t18_task_factDao = null;
		boolean isDone = false;
		try {
			t18_task_factDao = new T18_task_factDAO();
			isDone = t18_task_factDao.t18_task_factIsHavenDone(conn,
					t18_task_fact.getStatisticdate());
			T18_task_cal_log t18_task_cal_log = new T18_task_cal_log();

			// ����Զ�����ݿ�
			conn_out = Out_ConnectionManager.getConnection(dbdriver, dburl,
					dbuser, dbpwd);
			t18_task_cal_log.setStatisticdate(t18_task_fact.getStatisticdate());
			t18_task_cal_log.setBegintime(t18_task_factDao.getTask_begin_Time(
					conn, t18_task_fact.getStatisticdate()));
			// ��������������
			if (isDone) {
				t18_task_cal_log.setEndtime(t18_task_factDao
						.getTask_MaxendTime(conn, t18_task_fact
								.getStatisticdate()));
				t18_task_cal_log.setCalstatus("1");
				t18_task_cal_logCommonExe(conn_out, t18_task_fact
						.getStatisticdate(), t18_task_cal_log);
			} else {// ��������û�м������

				t18_task_cal_log.setEndtime(DateUtils.getCurrTime());
				t18_task_cal_log.setCalstatus("0");
				t18_task_cal_logCommonExe(conn_out, t18_task_fact
						.getStatisticdate(), t18_task_cal_log);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				conn_out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public void t18_task_cal_logCommonExe(Connection conn_out,
			String statisticdate, T18_task_cal_log t18_task_cal_log)
			throws Exception {
		T18_task_cal_logDAO t18_task_cal_logDAO = new T18_task_cal_logDAO();
		if (!t18_task_cal_logDAO.haveT18_task_cal_log(conn_out, statisticdate)) {
			t18_task_cal_logDAO.insertT18_task_cal_log(conn_out,
					t18_task_cal_log);
		} else {
			t18_task_cal_logDAO.updateT18_task_cal_log(conn_out,
					t18_task_cal_log);
		}
	}
}
