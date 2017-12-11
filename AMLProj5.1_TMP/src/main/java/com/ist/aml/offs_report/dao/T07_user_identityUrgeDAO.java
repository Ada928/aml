/**
 * 
 */
package com.ist.aml.offs_report.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.offs_report.dto.T07_user_identityUrge;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;

/**
 * @author Administrator
 * 
 */
public class T07_user_identityUrgeDAO extends BaseDAO {

	private static final long serialVersionUID = 1L;
	private static Logger logger = LogUtils
			.getLogger(T07_user_identityUrgeDAO.class.getName());
	/**
	 * ���캯��
	 */
	public T07_user_identityUrgeDAO() {

	}

	/**
	 * ��ѯ��������µ�������������
	 * @param sqlMap
	 * @param organkey
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getUnderlingOrgan(SqlMapClient sqlMap, String organkey)throws SQLException  {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_user_identityUrgeList", organkey);
		return list;
	}
	
	/**
	 * ��ѯ������Ҫ�������������
	 * @param sqlMap
	 * @param t07_user_identityUrge
	 * @return
	 * @throws SQLException
	 */
	public ArrayList getT07_user_identityUrgeCount(SqlMapClient sqlMap, T07_user_identityUrge t07_user_identityUrge)throws SQLException  {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_user_identityUrgeCount", t07_user_identityUrge);
		return list;
	}
	
	
	// ���ݻ������б�õ������б�
	public List getUnderOganList(SqlMapClient sqlMap, List organKeyList) throws SQLException {
		return sqlMap.queryForList("getUnderOganList", organKeyList);
	}
	
	/**
	 * ��ѯ������Ҫ��Ļ�����
	 * @param sqlMap
	 * @param t07_user_identityUrge
	 * @return
	 * @throws SQLException
	 */
	public int getT07_user_identityUrgeCount1(SqlMapClient sqlMap, T07_user_identityUrge t07_user_identityUrge)throws SQLException  {
		Integer count = (Integer) sqlMap.queryForObject("getT07_user_identityUrgeCount1", t07_user_identityUrge);
		return count.intValue();
	}

	
	
	public ArrayList getT00_organList(SqlMapClient sqlMap,T07_user_identityUrge t07UserIdentityUrge, int startRec,
			int intPageSize) throws SQLException  {
		ArrayList list = (ArrayList) sqlMap.queryForList("getT07_user_identityUrge_organList", t07UserIdentityUrge, startRec, intPageSize);
		return list;
	}

	public int getT00_organListCount(SqlMapClient sqlMap,T07_user_identityUrge t07UserIdentityUrge) throws SQLException  {
		Integer count = (Integer) sqlMap.queryForObject("getT07_user_identityUrge_organListCount", t07UserIdentityUrge);
		return count.intValue();
	}
}
