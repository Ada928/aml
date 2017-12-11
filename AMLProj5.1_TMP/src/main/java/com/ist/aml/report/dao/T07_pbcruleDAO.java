/** 
 * Create by makecode program v2.0 
 * ����             ���� 		����  
 * 2007-12-05   ����		����  
 */

package com.ist.aml.report.dao;

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
import java.util.Date;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_pbcrule;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;

public class T07_pbcruleDAO extends BaseDAO {
	/**
	 * 
	 */
	private static final long serialVersionUID = -1245672409819728889L;
	private static Logger logger = LogUtils.getLogger(T07_pbcruleDAO.class
			.getName());

	/**
	 * ���캯��
	 */
	public T07_pbcruleDAO() {
	}

	

	/**
	 * ��������ѯID ������ 2009��6��27
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Pbckey
	 *            String
	 * @throws SQLException
	 * @return T07_pbcrule
	 */
	public ArrayList getT07_pbcruleID(SqlMapClient sqlMap,
			T07_pbcrule t07_pbcrule) throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_pbcruleID",
				t07_pbcrule);
		return list;
	}

	


}
