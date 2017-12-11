package com.ist.server;

/**
 * <p>Title: ��ʱ��������Server</p>
 * <p>
 * �������ð������ࣺ
 * 1-�ⲿ����Դ׼����ϣ����ó�ȡ�����������Ҫ��ȡ�������ü�������
 * 2-���ݳ�ȡ��ϣ����ü�������
 * 3-����ϵͳ��������(ODS->DM��DM����)
 * </p>
 * <p>Copyright: Copyright (c) 2008.03</p>
 * <p>Company: IST</p>
 * @author hubq
 * @version 1.0
 */

import java.io.File;
import java.sql.Connection;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Timer;
import java.util.TimerTask;

import org.apache.log4j.Logger;
import org.apache.log4j.PropertyConfigurator;

import com.ist.common.Constants;
import com.ist.common.LogUtils;
import com.ist.common.database.ConnectionManager;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;
import com.ist.server.cfg.BaseConfigTask;
import com.ist.server.cfg.ConfigTaskFactory;
import com.ist.server.dao.T18_task_cfg_logDAO;
import com.ist.server.dao.T18_task_factDAO;
import com.ist.server.dao.T18_tasklistDAO;
import com.ist.server.dto.T18_task_type;

public class ConfigServer {

	public static final String CONFIG_SERVER_LOG_FILE = "log4j-config.properties";
	static {
		PropertyConfigurator.configure(SysConfig.getSysHomeDir()
				+ File.separator + CONFIG_SERVER_LOG_FILE);
	}
	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(ConfigServer.class
			.getName());

	/** ��ʱ�� */
	private final Timer timer = new Timer();

	/** ͨ�������ļ���ȡ ��λΪ���ӣ�X * 60 * 1000�� */
	private int scan_timespace = 0 * 60 * 1000;

	/** ÿ������Ŀ�ʼʱ�� */
	private String beginTimeStr = "";
	/** ÿ������Ľ���ʱ�� */
	private String endTimeStr = "";

	private String serverkey = "";

	/** ���캯�� */
	public ConfigServer() {
	}

	/**
	 * ����Server��ÿ��һ��ʱ�����һ��ɨ�� ��ϵͳ�Ƿ���������Ҫִ��
	 * 
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
			}
			// ��ǰʱ�俪ʼ��ÿ�� scan_timespace ����ʱ����ִ��һ�� TimerTask
		}, 0, scan_timespace); // ִ��һ��
	}

	/**
	 * @return �Ƿ�ɹ�
	 */

	private boolean executeTasks() {
		boolean isSucc = true;
		// ���ж�ִ��ʱ���Ƿ��ڼ���ʱ�䷶Χ�ڣ���������
		Timestamp beginTime = Timestamp.valueOf(DateUtils.getCurrDate() + " "
				+ beginTimeStr + ".000000000");
		Timestamp endTime = Timestamp.valueOf(DateUtils.getCurrDate() + " "
				+ endTimeStr + ".000000000");
		Timestamp nowTime = new Timestamp(System.currentTimeMillis());
		if (nowTime.before(beginTime) || nowTime.after(endTime)) {
			logger.debug("���ڿɹ���ʱ�䣬�Ժ���ٴ�ִ��....");
			return isSucc;
		}

		CatchManager cm = new CatchManager();

		ConfigTaskFactory configTaskFactory = new ConfigTaskFactory();
		T18_task_cfg_logDAO t18_task_cfg_logDAO = new T18_task_cfg_logDAO();
		T18_task_factDAO t18_task_factDAO = new T18_task_factDAO();
		Connection conn = null;
		try {

			conn = ConnectionManager.getConnection();
			conn.setAutoCommit(false);

			DateUtils du = new DateUtils();
			// modified by lingjiang.zhou 2012-09-11
			String currdate = DateUtils.getCurrDate();

			// ��ȡĿǰ�Ѿ���ʼ�������ã�����û����ȫ������ϵ����������б�
			// Ŀ�ģ�����̽�⣬�Ƿ���Լ�����������δ�������
			ArrayList statisticdateList = t18_task_cfg_logDAO
					.getT18_task_cfg_logListForNoFinished(conn);

			// ȡ��������־���������ڣ����Ѿ���ɵĺ�δ��ɵģ�
			// ����ɨ�裺���
			String maxStatisticdate = t18_task_cfg_logDAO
					.getT18_task_cfg_logMaxDT(conn);

			// ȡ�õ�ǰ�Ѿ���ɵ�����׼�����̽������101���񣩵�������ڣ�
			// ʵ����ɣ����
			String nowDOmaxStatisticdate = t18_task_factDAO
					.getT18_task_factNowDOMaxDT(conn);

			// �Ƿ���������������������������Ҫ���⴦��
			HashMap t18_task_ListMap = cm
					.getMapFromCache("T18_TASKLISTMAP");
			Iterator iterTask = t18_task_ListMap.keySet().iterator();
			String granularityType = "4";
			while (iterTask.hasNext()) {
				String taskKey = (String) iterTask.next();
				if (taskKey.endsWith("1")){
					granularityType = "1";
				    break;	
				}
			}
			/**
			 * �жϣ� ����N�춼û���κ�����Դ��������ôϵͳ�����ټ���ִ�к����ļ��أ��ȴ����� N�������ã�û�е������жϣ�ͨ��101�����ִ��
			 * 
			 * ˵���� ȫ�������������ʼ�����ǣ��Ƿ�̽������Դ׼�����
			 */
			if (!maxStatisticdate.equals("")
					&& !nowDOmaxStatisticdate.equals("")
					&& DateUtils.diffTwoDateDay(DateUtils
							.stringToDateShort(maxStatisticdate), DateUtils
							.stringToDateShort(nowDOmaxStatisticdate)) < Constants.DATA_SETSTATUS_DATESPACE) {
				// ������������ʱ�Ĵ���ʽ
				if ("1".equals(granularityType)) {
					if (DateUtils.diffTwoDateDay(DateUtils
							.stringToDateShort(maxStatisticdate), DateUtils
							.stringToDateShort(currdate)) <= 0) {

						// ����������������̽������
						String nexDt = du.getDateChangeALL(maxStatisticdate,
								"d", 1);
						statisticdateList.add(nexDt);
					}
				}
				// ������������Ĵ���ʽ
				if ("4".equals(granularityType)) {
					DateUtils dt =new DateUtils();
					Date date = dt.stringToDateShort(currdate);
					if (DateUtils.diffTwoDateDay(dt.getMonthEnd(date), DateUtils
							.stringToDateShort(currdate)) == 0) {
                        //��������������
						statisticdateList.add(currdate);
					}
				}

			} else if (maxStatisticdate.equals("")
					|| nowDOmaxStatisticdate.equals("")) {// ��ϵͳ��û�������

				logger
						.error("�µ�ϵͳ����û����ɵ�һ��������������T18_TASK_CFG_LOG��������һ�����ɼ�¼����T18_TASK_FACT�������Ӷ�Ӧ����101�������ɼ�¼������������ϵͳ���ɽ��м��㣻");

			} else {

				logger.error("ϵͳ�Ѿ�����" + Constants.DATA_SETSTATUS_DATESPACE
						+ "��û�������ṩ���������ݵ�����ϵͳ���Զ���������!");

			}
			logger.info("�������ã���̽�����������б�(��" + statisticdateList.size() + "��)="
					+ statisticdateList);
			Iterator dtIter = statisticdateList.iterator();
			while (dtIter.hasNext()) {
				String statisticdate = (String) dtIter.next();
				ArrayList granularityList = this
						.getGranularityList(statisticdate);

				logger.info("��ʼ��������=" + statisticdate + "�ļ�������!���ȷ�Χ(��"
						+ granularityList.size() + "��):" + granularityList);

				for (int i = 0; i < granularityList.size(); i++) {
					String granularity = (String) granularityList.get(i);

					ArrayList t18_task_typeList = cm
							.getListFromCache("T18_TASK_TYPELIST");
					Iterator iter = t18_task_typeList.iterator();
					while (iter.hasNext()) {
						T18_task_type _t18_task_type = (T18_task_type) iter
								.next();
						logger.info("��������=" + _t18_task_type.getTasktype()
								+ "-" + _t18_task_type.getTypename() + ":"
								+ _t18_task_type.getCfgclass() + ":����="
								+ granularity);
						// ���ڱȽ������Ժ��Ƿ���Ҫ�ж�������ϵ
						_t18_task_type.setMaxStatisticdate(maxStatisticdate);
						_t18_task_type.setStatisticdateList(statisticdateList);

						try {
							BaseConfigTask configTask = configTaskFactory
									.getCfgtaskInstance(_t18_task_type);
							configTask.run(conn, statisticdate, granularity);
						} catch (Exception e) {
							logger.error("�������=" + _t18_task_type.getTasktype()
									+ "-" + _t18_task_type.getTypename() + ":"
									+ e.getMessage());
							e.printStackTrace();
						}
					}
				}
			}

		} catch (Exception e) {
			isSucc = false;
			logger.error("����ִ��ʧ�ܣ�" + e.getMessage());
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (Exception ec) {
				logger.error("���ݻع�����" + ec);
			}
		} finally {
			try {
				conn.setAutoCommit(true);
				conn.close();
			} catch (Exception ec) {
				logger.error("���ݿ�رմ���" + ec);
			}
		}

		return isSucc;
	}

	private ArrayList getGranularityList(String statisticdate) {
		ArrayList list = new ArrayList();
		DateUtils dutils = new DateUtils();
		Date date = DateUtils.stringToDateShort(statisticdate);

		String[] str = StringUtils.split(Constants.CANCAL_GRANULARITYS, ";");

		//
		for (int i = 0; i < str.length; i++) {
			String granularity = str[i];
			// ������
			if (granularity.equals("1")) {
				list.add(granularity);
			}
			// ��δ����
			if (dutils.getWeekEnd(date).equals(date)&&granularity.equals("2")) {
				list.add(granularity);
			}
			// Ѯ����
			if (dutils.getPeriodEnd(date).equals(date)&&granularity.equals("3")) {
				list.add(granularity);
			}
			// ������
			if (dutils.getMonthEnd(date).compareTo(date) == 0
					&& granularity.equals("4")) {
				list.add(granularity);
			}
			// ������
			if (dutils.getSeasonEnd(date).equals(date)
					&& granularity.equals("5")) {
				list.add(granularity);
			}
			// ��������
			if (dutils.getHalfYearEnd(date).equals(date)
					&& granularity.equals("6")) {
				list.add(granularity);
			}
			// ������
			if (dutils.getYearEnd(date).equals(date) && granularity.equals("7"))
				list.add(granularity);
		}
		return list;
	}

	/**
	 * ��ʼ��Server
	 * 
	 * @throws Exception
	 */
	private void init(String _serverkey) throws Exception {

		serverkey = _serverkey;

		// ��ʼ��ϵͳɨ��ʱ����
		scan_timespace = Integer.parseInt(SysConfig
				.getProperty("server.server_" + serverkey + ".scan_timespace")) * 60 * 1000;
		// ��ʼɨ��ʱ��
		beginTimeStr = SysConfig.getProperty("server.server_" + serverkey
				+ ".cal_time_begin");
		// ����ɨ��ʱ��
		endTimeStr = SysConfig.getProperty("server.server_" + serverkey
				+ ".cal_time_end");

		CatchManager cm = CatchManager.getInstance();
		try {
			ArrayList t18_task_typeList = cm
					.getListFromCache("T18_TASK_TYPELIST");
			ArrayList t18_datasourceList = cm
					.getListFromCache("T18_DATASOURCELIST");
			HashMap t18_time_depandonMap = cm
					.getMapFromCache("T18_TIME_DEPANDONMAP");

			logger.info("�����������" + t18_task_typeList.size() + "����");
		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "ϵͳ��ʼ��ʧ�ܣ�";
			logger.error(errMsg);
			throw new Exception(errMsg + "--" + e.getMessage());
		}

		Connection conn = null;
		try {
			conn = ConnectionManager.getConnection();
			T18_tasklistDAO t18_tasklistDAO = new T18_tasklistDAO();
			t18_tasklistDAO.initDepandonType(conn);

		} catch (Exception e) {
			e.printStackTrace();
			String errMsg = "��ȡSERVER��Ϣ����";
			logger.error(errMsg);
		} finally {
			try {
				conn.close();
			} catch (Exception ec) {
			}
		}

	}

	/**
	 * ִ��������
	 * 
	 * @param args
	 *            ���в��� args[0]=serverkey ������������Ŀ��SERVER�� �������������SERVER ���в���
	 */
	public static void main(String[] args) {
		ConfigServer mainServer = new ConfigServer();
		try {
			String serverkey = "";

			if (args.length > 0) {
				serverkey = args[0];
			} else {
				serverkey = "S1002";
				// throw new Exception("ȱ�����в��������������е�SERVERKEY��");
			}

			logger
					.info("********************************************************************************");
			logger
					.info("**********                                                            **********");
			logger
					.info("**********      ��������ϵͳ��ʱ�������� IST AUDIT SERVER V4.0            **********");
			logger
					.info("**********      �����趨������                                               **********");
			logger
					.info("**********      ������������Ŀ��  ʱ�䣺2003-12�¡�2011-12��               **********");
			logger
					.info("********************************************************************************");
			logger.info("ϵͳ��ʼ��..............................");
			// ��ʼ��AuditServerϵͳ
			mainServer.init(serverkey);
			logger.info("ϵͳ��������............................");
			// ִ��
			mainServer.startServer();
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
		}
	}
}
