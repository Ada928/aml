/** 
 * Create by makecode program v2.0 
 * ����             ���� 		����  
 * 2007-04-03   ����		����  
 */

package com.ist.aml.risk_rate.dao;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: �����������ڿƼ��������޹�˾
 * </p>
 * 
 * @author �з���
 * @version 1.0
 */

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import org.apache.log4j.Logger;
import org.springframework.context.ApplicationContext;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.risk_rate.dto.T37_risk_attach;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;

public class T37_risk_attachDAO extends BaseDAO {
	private static Logger logger = LogUtils.getLogger(T37_risk_attachDAO.class
			.getName());

	/**
	 * ���캯��
	 */
	public T37_risk_attachDAO() {
	}

	/**
	 * ȡ���б��ɷ�ҳ��
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t37_risk_attach
	 *            T37_risk_attach
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT37_risk_attachList(SqlMapClient sqlMap,
			T37_risk_attach t37_risk_attach, int iStartRec, int iPageSize,ApplicationContext context)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap
				.queryForList("getT37_risk_attach_rateList", t37_risk_attach,
						iStartRec, iPageSize);
		ArrayList t37_risk_attachList = new ArrayList();
		XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
		 String rootPath =sysConfig.getProperty("data.import");
		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T37_risk_attach t37_risk_attach1 = (T37_risk_attach) iter.next();
			if (t37_risk_attach1.getLoad_date() != null) {
				t37_risk_attach1.setLoad_date_disp(DateUtils
						.dateToString(t37_risk_attach1.getLoad_date()));
			}
			t37_risk_attach1.setAttach_name(rootPath+t37_risk_attach1.getAttach_name());
			t37_risk_attachList.add(t37_risk_attach1);
		}
		return t37_risk_attachList;
	}

	/**
	 * ȡ�ü�¼����
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t37_risk_attach
	 *            t37_risk_attach
	 * @throws SQLException
	 * @return int
	 */
	public int getT37_risk_attachListCount(SqlMapClient sqlMap,
			T37_risk_attach t37_risk_attach) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT37_risk_attach_rateListCount", t37_risk_attach);
		return iCount.intValue();
	}

	/**
	 * ȡ������ϸ����
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Application_num
	 *            String
	 * @throws SQLException
	 * @return t37_risk_attach
	 */
	public T37_risk_attach getT37_risk_attachDisp(SqlMapClient sqlMap,
			String resulekey) throws SQLException {
		T37_risk_attach t37_risk_attach = (T37_risk_attach) sqlMap
				.queryForObject("getT37_risk_attach_rateDisp", resulekey);
		if (t37_risk_attach == null)
			t37_risk_attach = new T37_risk_attach();
		return t37_risk_attach;
	}
	public T37_risk_attach getT37_risk_attachDispByAttachkey(SqlMapClient sqlMap,
			String attachkey) throws SQLException {
		T37_risk_attach t37_risk_attach = (T37_risk_attach) sqlMap
				.queryForObject("getT37_risk_attach_rateDispByAttachkey", attachkey);
		if (t37_risk_attach == null)
			t37_risk_attach = new T37_risk_attach();
		return t37_risk_attach;
	}
	/**
	 * �������
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t37_risk_attach
	 *            T37_risk_attach
	 * @throws SQLException
	 * @return int
	 */
	public int insertT37_risk_attach(SqlMapClient sqlMap,
			T37_risk_attach t37_risk_attach) throws SQLException {
		int i = sqlMap.update("insertT37_risk_rate_attach", t37_risk_attach);
		return i;
	}

	

	/**
	 * ɾ������
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Application_num
	 *            String
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT37_risk_attach(SqlMapClient sqlMap, String application_num)
			throws SQLException {
		int i = sqlMap.update("deleteT37_risk_rateAttach", application_num);
		return i;
	}
}
