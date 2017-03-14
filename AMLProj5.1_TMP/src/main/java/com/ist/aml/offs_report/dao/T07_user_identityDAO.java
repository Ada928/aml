/**
 * 
 */
package com.ist.aml.offs_report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.offs_report.dto.T07_user_identity;
import com.ist.aml.offs_report.dto.T09_new_party_statistics;

import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;

/**
 * @author Administrator
 * 
 */
public class T07_user_identityDAO extends BaseDAO {

	private static Logger logger = LogUtils
			.getLogger(T07_user_identityDAO.class.getName());

	/**
	 * ���캯��
	 */
	public T07_user_identityDAO() {

	}

	/**
	 * �������
	 * 
	 * @param sqlMap
	 * @param t07_user_identitylist
	 * @return
	 * @throws SQLException
	 */
	public int insertT07_user_identity(SqlMapClient sqlMap,
			ArrayList t07_user_identitylist) throws SQLException {
		// TODO Auto-generated method stub
		int row = 0;
		Date updatedate = DateUtils.getCurrDateTime();
		T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identitylist
				.get(0);
		String identitykey = "" + t07_user_identity1.getStatisticdate()
				+ t07_user_identity1.getOrgankey();
		for (int i = 0; i < t07_user_identitylist.size(); i++) {
			T07_user_identity t07_user_identity = (T07_user_identity) t07_user_identitylist
					.get(i);
			t07_user_identity.setIdentitykey(identitykey);
			t07_user_identity.setUpdatetime(updatedate);
			row = sqlMap.update("insertT07_user_identity", t07_user_identity);
		}
		return row;
	}

	/**
	 * ���²���
	 * 
	 * @param sqlMap
	 * @param t07_user_identitylist
	 * @return
	 * @throws SQLException
	 */
	public int modifyT07_user_identity(SqlMapClient sqlMap,
			ArrayList t07_user_identitylist) throws SQLException {
		// TODO Auto-generated method stub
		int row = 0;
		Date updatedate = DateUtils.getCurrDateTime();
		for (int i = 0; i < t07_user_identitylist.size(); i++) {
			T07_user_identity t07_user_identity = (T07_user_identity) t07_user_identitylist
					.get(i);
			t07_user_identity.setUpdatetime(updatedate);
			row = sqlMap.update("modifyT07_user_identity", t07_user_identity);
			logger.info("-----------modify row = " + row + "---------");
		}
		logger.info("----------- after modify row = " + row + "---------");
		return row;
	}

	/**
	 * ɾ������
	 * 
	 * @param sqlMap
	 * @param identitykey
	 * @param identitytype
	 * @return
	 * @throws SQLException
	 */
	public int delT07_user_identity(SqlMapClient sqlMap, String identitykey,
			String identitytype) throws SQLException {
		int row = 0;
		T07_user_identity t07_user_identity = new T07_user_identity();
		t07_user_identity.setIdentitytype(identitytype);
		t07_user_identity.setIdentitykey(identitykey);
		row = sqlMap.update("delT07_user_identity", t07_user_identity);
		logger.info("-----------modify row = " + row + "---------");
		return row;
	}

	/*
	 * begin======================================================================
	 * =====
	 */
	/**
	 * new add 2009-02-04 ����״̬����
	 * 
	 * @param sqlMap
	 * @param identitykey
	 * @param identitytype
	 * @param changeStatus
	 * @return
	 * @throws SQLException
	 */
	public int updateT07_user_identityStatus(SqlMapClient sqlMap,
			String identitykey, String identitytype, String changeStatus)
			throws SQLException {
		int row = 0;
		T07_user_identity t07_user_identity = new T07_user_identity();
		t07_user_identity.setIdentitytype(identitytype);
		t07_user_identity.setIdentitykey(identitykey);
		// ���ø���ʱ��
		Date updatedate = DateUtils.getCurrDateTime();
		t07_user_identity.setUpdatetime(updatedate);
		// ���ø���״̬
		t07_user_identity.setStatus_cd(changeStatus);
		// ִ�и���
		row = sqlMap.update("updateT07_user_identityStatus", t07_user_identity);
		return row;
	}

	/**
	 * new add 2009-02-18 ����״̬����
	 * 
	 * @param sqlMap
	 * @param identitykey
	 * @param identitytype
	 * @param changeStatus
	 * @return
	 * @throws SQLException
	 */
	public int updateT07_user_identityStatus2(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity) throws SQLException {
		int row = 0;
		String identitytype = t07_user_identity.getIdentitytype();
		if ("1".equals(identitytype)) {
			t07_user_identity.setTableName("T07_USER_IDENTITY");
		} else if ("2".equals(identitytype)) {
			t07_user_identity.setTableName("T07_USER_REIDENTITY");
		} else if ("3".equals(identitytype)) {
			t07_user_identity.setTableName("T07_DUBIETY_IDENTITY");
		} else if ("4".equals(identitytype)) {
			t07_user_identity.setTableName("T07_REPORT_STATISTIC");
		}
		Date updatedate = DateUtils.getCurrDateTime();
		t07_user_identity.setUpdatetime(updatedate);
		row = sqlMap
				.update("updateT07_user_identityStatus2", t07_user_identity);
		return row;
	}

	/**
	 * new add 2009-02-04 ȡ�õ�����ѯ���(���������ͱ������Ͳ�ѯ)
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_user_identityDisp(SqlMapClient sqlMap,
			String identitykey, String identitytype) throws SQLException {
		ArrayList t07_user_identityList = new ArrayList();

		T07_user_identity t07_user_identity = new T07_user_identity();
		t07_user_identity.setIdentitykey(identitykey);
		t07_user_identity.setIdentitytype(identitytype);

		if (identitytype.equals("1")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp1", t07_user_identity);
		} else if (identitytype.equals("2")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp2", t07_user_identity);
		} else if (identitytype.equals("3")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp3", t07_user_identity);
		} else if (identitytype.equals("4")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp4", t07_user_identity);
		}
		return t07_user_identityList;
	}

	/*
	 * end========================================================================
	 */

	/**
	 * ȡ���б��ѯ���
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @param iStartRec
	 * @param iPageSize
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_user_identityList(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity, int iStartRec, int iPageSize)
			throws SQLException {
		// ����ʱ��
		ArrayList t07_user_identityList = new ArrayList();
		LinkedHashMap seasonMap = cm.getMapFromCache("seasonlist");
		LinkedHashMap identitytypeMap = cm.getMapFromCache("identitytype");
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		T07_user_identity t07_user_identity1 = new T07_user_identity();
		t07_user_identityList = (ArrayList) sqlMap.queryForList(
				"getT07_user_identityList", t07_user_identity, iStartRec,
				iPageSize);
		for (int i = 0; i < t07_user_identityList.size(); i++) {
			t07_user_identity1 = (T07_user_identity) t07_user_identityList
					.get(i);
			int dateint = t07_user_identity1.getStatisticdate();
			if (dateint > 0) {
				String datestr = String.valueOf(dateint);
				String dateyear = datestr.substring(0, datestr.length() - 2);
				String dateseason = (String) seasonMap.get(datestr
						.substring(datestr.length() - 2));
				t07_user_identity1.setStatisticdate_disp(dateyear + "���"
						+ dateseason + "����");
			}
			if (t07_user_identity1.getUpdatetime() != null) {
				t07_user_identity1.setUpdatetime_disp(DateUtils
						.dateToStringShort(t07_user_identity1.getUpdatetime()));
			}
			if (t07_user_identity1.getOrgankey() != null) {
				t07_user_identity1.setOrganName((String) organMap
						.get(t07_user_identity1.getOrgankey()));
			}
			if (t07_user_identity1.getIdentitytype() != null) {
				t07_user_identity1
						.setIdentitytype_disp((String) identitytypeMap
								.get(t07_user_identity1.getIdentitytype()));
			}
		}
		return t07_user_identityList;
	}

	/**
	 * ȡ�ò�ѯ�б�����
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @return
	 * @throws SQLException
	 */
	public int getT07_user_identityCount(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity) throws SQLException {
		// TODO Auto-generated method stub
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_user_identityListCount", t07_user_identity);
		return iCount.intValue();
	}

	/**
	 * ȡ�õ�����ѯ���(���ݶ����ѯ)
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_user_identityDisp(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList t07_user_identityList = new ArrayList();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		String identitytype = t07_user_identity.getIdentitytype();
		if (identitytype.equals("1")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp1", t07_user_identity);
		} else if (identitytype.equals("2")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp2", t07_user_identity);
		} else if (identitytype.equals("3")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp3", t07_user_identity);
		} else if (identitytype.equals("4")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityDisp4", t07_user_identity);
		}
		for (int i = 0; i < t07_user_identityList.size(); i++) {
			t07_user_identity = (T07_user_identity) t07_user_identityList
					.get(i);
			t07_user_identity.setOrganName((String) organMap
					.get(t07_user_identity.getOrgankey()));
		}
		return t07_user_identityList;
	}

	/**
	 * ȡ�û��ܲ�ѯ���
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_user_identityCollect(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList t07_user_identityList = new ArrayList();
		String identitytype = t07_user_identity.getIdentitytype();
		if (identitytype.equals("1")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityCollect1", t07_user_identity);
		} else if (identitytype.equals("2")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityCollect2", t07_user_identity);
		} else if (identitytype.equals("3")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityCollect3", t07_user_identity);
		} else if (identitytype.equals("4")) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_user_identityCollect4", t07_user_identity);
		}
		return t07_user_identityList;
	}

	/**
	 * ���ɽ��ױ����ϱ�ͳ��
	 * 
	 * @param sqlMap
	 * @param t07_user_identity
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_REPORT_STATISTIC_MIDList(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity,ApplicationContext context) throws SQLException {

		ArrayList t07_user_identityList = new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String datetype = sysConfig.getProperty("database.dbtype");
		if ("DB2".equalsIgnoreCase(datetype)) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_REPORT_STATISTIC_MIDdb2", t07_user_identity);
		} else {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_REPORT_STATISTIC_MIDdb2", t07_user_identity);

		}
		return t07_user_identityList;
	}
	public ArrayList getT07_REPORT_STATISTIC_MIDList1(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity,ApplicationContext context) throws SQLException {

		ArrayList t07_user_identityList = new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String datetype = sysConfig.getProperty("database.dbtype");
		if ("DB2".equalsIgnoreCase(datetype)) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_REPORT_STATISTIC_MID1db2", t07_user_identity);
		} else {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_REPORT_STATISTIC_MID1db2", t07_user_identity);

		}
		return t07_user_identityList;
	}
	
	public ArrayList getT07_USER_IDENTITY_MList(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity,ApplicationContext context) throws SQLException {

		ArrayList t07_user_identityList = new ArrayList();
		
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String datetype = sysConfig.getProperty("database.dbtype");
		if ("DB2".equalsIgnoreCase(datetype)) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_USER_IDENTITY_MListDb2", t07_user_identity);
		} else {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_USER_IDENTITY_MList", t07_user_identity);

		}
		
		
		return t07_user_identityList;
	}
	public ArrayList getT07_USER_REIDENTITY_MList(SqlMapClient sqlMap,
			T07_user_identity t07_user_identity,ApplicationContext context) throws SQLException {

		ArrayList t07_user_identityList = new ArrayList();
		
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		String datetype = sysConfig.getProperty("database.dbtype");
		if ("DB2".equalsIgnoreCase(datetype)) {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_USER_REIDENTITY_MListDb2", t07_user_identity);
		
		} else {
			t07_user_identityList = (ArrayList) sqlMap.queryForList(
					"getT07_USER_REIDENTITY_MList", t07_user_identity);
		

		}
		
		return t07_user_identityList;
	}

	
	public T09_new_party_statistics getT09_new_party_statistics(SqlMapClient sqlMap, 
			T09_new_party_statistics tnps)throws SQLException{
		
		T09_new_party_statistics t09 = new T09_new_party_statistics();
		t09 = (T09_new_party_statistics) sqlMap.queryForObject("getT09_new_party_statistics", tnps);
		return t09;
	}
	

}
