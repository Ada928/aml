package com.ist.aml.blacklist.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.blacklist.dto.T52_def_temp;
import com.ist.common.base.BaseDAO;

public class T52_def_tempDAO extends BaseDAO
{
	/**
	 * ȡ���б��ɷ�ҳ��
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T31_def_temp
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT52_def_tempList(SqlMapClient sqlMap,
			T52_def_temp t52_def_temp, int iStartRec, int iPageSize)
			throws SQLException
	{
		ArrayList list = (ArrayList) sqlMap.queryForList("getT52_def_tempList",
				t52_def_temp, iStartRec, iPageSize);

		LinkedHashMap granularitys = cm.getMapFromCache("risk_granularitys");
		LinkedHashMap clienttype = cm.getMapFromCache("temp_clienttype");
		LinkedHashMap flag = cm.getMapFromCache("flag");
		LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
		LinkedHashMap category = cm.getMapFromCache("template_category");

		for (int i = 0; i < list.size(); i++)
		{
			T52_def_temp temp = (T52_def_temp) list.get(i);

			// ������Ϣ
			 if(temp.getGranularity()!=null){
			 temp.setGranularity_disp((String)
			 granularitys.get(temp.getGranularity()));
			 }
			 if(temp.getParty_class_cd()!=null){
			 temp.setParty_class_cd_disp((String)
			 clienttype.get(temp.getParty_class_cd()));
			 }
			 if(temp.getFlag()!=null){
			 temp.setFlag_disp((String) flag.get(temp.getFlag()));
			 }
			 if(temp.getCoverflag()!=null){
			 temp.setCoverflag_disp((String)
			 coverMap.get(temp.getCoverflag()));
			 }
		}
		return list;
	}

	/**
	 * 1 ȡ�ü�¼����
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T52_def_temp
	 * @throws SQLException
	 * @return int
	 */
	public int getT52_def_tempListCount(SqlMapClient sqlMap,
			T52_def_temp t52DefTemp) throws SQLException
	{
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT52_def_tempListCount", t52DefTemp);
		return iCount.intValue();
	}
	
	/**
	 * �޸�״̬
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t52_def_temp
	 *            T31_def_temp
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT52_def_temp_flag(SqlMapClient sqlMap, T52_def_temp t52_def_temp) throws SQLException {
		int i = sqlMap.update("modifyT52_def_temp_flag", t52_def_temp);
		return i;
	}
	
	
	/** �������˹ģ��� */
	public int insertT52_b_def_temp(SqlMapClient sqlMap,
			T52_def_temp t52DefTemp) throws SQLException
	{
		return sqlMap.update("insertT52_b_def_temp", t52DefTemp);
	}
	
	
	/** ȡ������ϸ���� */
	public T52_def_temp getT52_def_tempDisp(SqlMapClient sqlMap, 
			String templatekey) throws SQLException 
	{
		T52_def_temp t52_def_temp = (T52_def_temp) sqlMap.queryForObject( "getT52_def_tempDisp", templatekey);
		if (t52_def_temp == null)
			t52_def_temp = new T52_def_temp();
		return t52_def_temp;
	}
	
	/** ������Ϣ�޸� */
	public int modifyT52_def_temp(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("modifyT52_def_temp", t52_def_temp);
		return i;
	}
	
	
	/**
	 * ȡ��ָ��ģ��KEY��T52_B_DEF_TEMP_GRAN�б�
	 */
	public ArrayList getT52_def_temp_granList(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		ArrayList list = (ArrayList)sqlMap.queryForList("getT52_def_temp_granList", key);
		LinkedHashMap granularityMap = cm.getMapFromCache("data_granularity");
		for(int i=0;i<list.size();i++)
		{
			T52_def_temp temp=(T52_def_temp) list.get(i);
			if(temp.getGranularity()!=null){
				temp.setSqlgranularity_disp((String) granularityMap.get(temp.getSqlgranularity()));
			}
			if(temp.getDatagranularity()!=null){
				temp.setDatagranularity_disp((String) granularityMap.get(temp.getDatagranularity()));
			}
		}
		return list;
	}
	
	
	/**
	 * ����ģ��ִ�����ȱ�T31_DEF_TEMP_GRAN
	 */
	public int insertT52_b_def_temp_gran(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("insertT52_b_def_temp_gran", t52_def_temp);
		return i;
	}
	
	/**
	 * ɾ������
	 */
	public int delT52_b_def_temp_sql(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		int i = sqlMap.update("delT52_b_def_temp_sql", key);
		return i;
	}
	
	
	/**
	 * ɾ������ģ��
	 */
	public int deleteT52_def_temp(SqlMapClient sqlMap, String calculateseq) throws SQLException {
		int i = sqlMap.update("deleteT52_def_temp", calculateseq);
		return i;
	}
	
	/**
	 * ɾ��ģ��ִ�����ȱ�T52_B_DEF_TEMP_GRAN
	 */
	public int deleteT52_b_def_temp_gran(SqlMapClient sqlMap, String sqlkey) throws SQLException {
		int i = sqlMap.update("deleteT52_b_def_temp_gran", sqlkey);
		return i;
	}
	
	
	/**
	 * �������sql
	 */
	public int t52_b_def_temp_sql(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("t52_b_def_temp_sql", t52_def_temp);
		return i;
	}
	
	/**
	 * ���²���sql
	 */
	public int updateT52_b_def_temp_sql(SqlMapClient sqlMap, 
			T52_def_temp t52_def_temp) throws SQLException 
	{
		int i = sqlMap.update("updateT52_b_def_temp_sql", t52_def_temp);
		return i;
	}
	
	
	/**
	 * ���ģ��ִ�����ȱ�����
	 */
	public T52_def_temp getT52_def_temp_granDisp(SqlMapClient sqlMap, 
			String sqlkey) throws SQLException 
	{
		T52_def_temp t52_def_temp = (T52_def_temp) sqlMap.queryForObject( "getT52_def_temp_granDisp", sqlkey);
		if (t52_def_temp == null)
			t52_def_temp = new T52_def_temp();
		return t52_def_temp;
	}
	
	
	/**
	 * ȡ���б�
	 */
	public ArrayList getT52_def_temp_sqlList(SqlMapClient sqlMap, 
			String key) throws SQLException 
	{
		ArrayList list = (ArrayList)sqlMap.queryForList("getT52_def_temp_sqlList", key);
		
		return list;
	}
	
	/** У��sql�Ƿ���ȷ */
	public boolean validateSql(SqlMapClient sqlMap, String validateSql)  
	{
		try
		{
			validateSql = validateSql.toLowerCase();
			validateSql = validateSql.substring(validateSql.indexOf("select"), validateSql.indexOf("where"));
			
			T52_def_temp t52_def_temp = new T52_def_temp();
			t52_def_temp.setValidateSql("("+validateSql+")");
			
			sqlMap.queryForObject("validateSql", t52_def_temp);
		} catch (SQLException e)
		{
			return false;
		}
		return true;
	}
	
	/**
	 * �޸�ģ��ִ�����ȱ�T52_DEF_TEMP_GRAN
	 * @param sqlMap
	 * @param t52DefTemp
	 * @return
	 * @throws SQLException
	 */
	public int modifyT52_def_temp_gran(SqlMapClient sqlMap, 
			T52_def_temp t52DefTemp) throws SQLException 
	{
		int i = sqlMap.update("modifyT52_def_temp_gran", t52DefTemp);
		return i;
	}
	
	/**
	 * �����������T52_B_DEF_TEMP_GRAN
	 * @return int
	 */
	public int copyT52_b_def_temp_gran(SqlMapClient sqlMap, T52_def_temp temp) throws SQLException {
		int i = sqlMap.update("copyT52_b_def_temp_gran", temp);
		return i;
	}
	
	/**
	 * ���������
	 * @return int
	 */
	public int copyT52_b_def_temp_sql(SqlMapClient sqlMap, T52_def_temp temp) throws SQLException {
		int i = sqlMap.update("copyT52_b_def_temp_sql", temp);
		return i;
	}
	
	
	
}
