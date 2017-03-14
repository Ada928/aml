/** 
 * Create by makecode program v2.0 
 * ����             ���� 		����  
 * 2009-06-27   ����		����  
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
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.TreeMap;

import org.apache.log4j.Logger;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dto.T07_Blacklist;
import com.ist.aml.report.dto.T07_blacklist_addr;
import com.ist.common.LogUtils;
import com.ist.common.base.BaseDAO;

import com.ist.util.DateUtils;

public class T07_BlacklistDAO extends BaseDAO {
	private static Logger logger = LogUtils.getLogger(T07_BlacklistDAO.class
			.getName());

	/**
	 * ���캯��
	 */
	public T07_BlacklistDAO() {
	}

	/**
	 * ȡ���б��ɷ�ҳ��
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_blacklist
	 *            T07_Blacklist
	 * @param iStartRec
	 *            int
	 * @param iPageSize
	 *            int
	 * @throws SQLException
	 * @return ArrayList
	 */
	public ArrayList getT07_BlacklistList(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist, int iStartRec, int iPageSize)
			throws SQLException {
		ArrayList list = (ArrayList) sqlMap.queryForList(
				"getT07_BlacklistList", t07_blacklist, iStartRec, iPageSize);
		ArrayList t07_blacklistList = new ArrayList();
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		// ����
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		// start modify lixx 2011.09.26 �������� ��������Ƿ�����˲���

		LinkedHashMap ischeckforpartyMap = new LinkedHashMap();

		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		if ("1".equals(t87_sysparaMap.get("404"))) {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty0");
		} else {
			ischeckforpartyMap = cm.getMapFromCache("ischeckforparty");
		}

		// end modify lixx 2011.09.26 �������� ��������Ƿ�����˲���

		Iterator iter = list.iterator();
		while (iter.hasNext()) {
			T07_Blacklist t07_blacklist1 = (T07_Blacklist) iter.next();
			if (t07_blacklist1.getParty_class_cd() != null) {
				t07_blacklist1.setParty_class_cd((String) list_typeMap
						.get(t07_blacklist1.getParty_class_cd()));
			}
			if (t07_blacklist1.getIsuse() != null) {
				t07_blacklist1.setIsuse((String) isuseMap.get(t07_blacklist1
						.getIsuse()));
			}
			if (t07_blacklist1.getOrgankey() != null) {
				t07_blacklist1.setOrgankey((String) organMap.get(t07_blacklist1
						.getOrgankey()));
			}
			t07_blacklist1.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist1.getCreate_dt()));

			// start modify lixx 2011.09.26 �������� ��������Ƿ�����˲���
			if (t07_blacklist1.getIscheck() != null
					&& !t07_blacklist1.getIscheck().equals("")) {
				t07_blacklist1.setIscheck_disp((String) ischeckforpartyMap
						.get(t07_blacklist1.getIscheck()));
			}
			// end modify lixx 2011.09.26 �������� ��������Ƿ�����˲���

			t07_blacklistList.add(t07_blacklist1);
		}
		return t07_blacklistList;
	}

	/**
	 * ȡ�ü�¼����
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_blacklist
	 *            T07_Blacklist
	 * @throws SQLException
	 * @return int
	 */
	public int getT07_BlacklistListCount(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist) throws SQLException {
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_BlacklistListCount", t07_blacklist);
		return iCount.intValue();
	}

	/**
	 * ȡ������ϸ����
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_Blacklist
	 *            T07_Blacklist
	 * @throws SQLException
	 * @return T07_Blacklist
	 */
	public T07_Blacklist getT07_BlacklistDisp(SqlMapClient sqlMap,
			T07_Blacklist t07_Blacklist) throws SQLException {
		T07_Blacklist t07_blacklist = (T07_Blacklist) sqlMap.queryForObject(
				"getT07_BlacklistDisp", t07_Blacklist);
		// �ͻ�����
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		// �Ƿ�����
		LinkedHashMap isuseMap = cm.getMapFromCache("isuse_type");
		LinkedHashMap m_list_typeMap = cm.getMapFromCache("m_list_type_b");
		if (org.apache.commons.lang.StringUtils.isNotBlank(t07_blacklist
				.getParty_class_cd())) {
			t07_blacklist.setParty_class_cd((String) list_typeMap
					.get(t07_blacklist.getParty_class_cd()));
		}
		if (org.apache.commons.lang.StringUtils.isNotBlank(t07_blacklist
				.getIsuse())) {
			t07_blacklist.setIsuse((String) isuseMap.get(t07_blacklist
					.getIsuse()));
		}
		if(t07_blacklist.getM_list_type()!=null){
			t07_blacklist.setM_list_type((String)m_list_typeMap.get(t07_blacklist.getM_list_type()));
		}
		if (null != t07_blacklist.getValidate_dt()) {
			t07_blacklist.setValidate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getValidate_dt()));
		}
		if (null != t07_blacklist.getInvalidate_dt()) {
			t07_blacklist.setInvalidate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getInvalidate_dt()));
		}
		if (null != t07_blacklist.getCreate_dt()) {
			t07_blacklist.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getCreate_dt()));
		}
		if (null != t07_blacklist.getModify_dt()) {
			t07_blacklist.setModify_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getModify_dt()));
		}
		if (t07_blacklist.getIsuse_new() != null
				&& !t07_blacklist.getIsuse_new().equals("")) {
			t07_blacklist.setIsuse_new((String) isuseMap.get(t07_blacklist
					.getIsuse_new()));
		}
		if (t07_blacklist.getValidate_dt_new() != null) {
			t07_blacklist.setValidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_blacklist.getValidate_dt_new()));
		}
		if (t07_blacklist.getInvalidate_dt_new() != null) {
			t07_blacklist.setInvalidate_dt_new_disp(DateUtils
					.dateToStringShort(t07_blacklist.getInvalidate_dt_new()));
		}
		if (t07_blacklist == null)
			t07_blacklist = new T07_Blacklist();
		return t07_blacklist;
	}

	/**
	 * ȡ�ͻ���ַ��Ϣ
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_Blacklist
	 *            T07_Blacklist
	 * @throws SQLException
	 * @return T07_Blacklist
	 */
	public ArrayList getT07_Blacklist_addrDisp(SqlMapClient sqlMap,
			T07_blacklist_addr t07_blacklist_Addr) throws SQLException {
		ArrayList t07_blacklist_addrList = (ArrayList) sqlMap.queryForList(
				"getT07_Blacklist_addrDisp", t07_blacklist_Addr);
		if (t07_blacklist_addrList == null)
			t07_blacklist_addrList = new ArrayList();
		return t07_blacklist_addrList;
	}

	/**
	 * ������� ������ 2009��6-29
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_blacklist
	 *            T07_Blacklist
	 * @throws SQLException
	 * @return int
	 */
	public int insertT07_Blacklist(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist) throws SQLException {
		int i = 0;
       	
        i = sqlMap.update("insertT07_Blacklist", t07_blacklist);
		return i;
	}

	public boolean getT07_Listrealy(SqlMapClient sqlMap, String partyId) throws SQLException {
		boolean flag = false;
		Integer iCount = (Integer) sqlMap.queryForObject(
				"getT07_Blacklistrealy", partyId);
		if (iCount.intValue() > 0) {
			flag = true;
		}
		return flag;
	}

	/**
	 * �޸�ʱȡ������ϸ ������ 2009��6-29
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param Party_id
	 *            String
	 * @throws SQLException
	 * @return T07_OBJ_RULE
	 */
	public T07_Blacklist getT07_BlacklistDisps(SqlMapClient sqlMap,
			T07_Blacklist t07_Blacklist) throws SQLException {
		T07_Blacklist t07_blacklist = (T07_Blacklist) sqlMap.queryForObject(
				"getT07_BlacklistDisp", t07_Blacklist);
		LinkedHashMap list_typeMap = cm.getMapFromCache("clienttype");
		if (org.apache.commons.lang.StringUtils.isNotBlank(t07_blacklist
				.getParty_class_cd())) {
			t07_blacklist.setParty_class_cd((String) list_typeMap
					.get(t07_blacklist.getParty_class_cd()));
		}
		if (null != t07_blacklist.getValidate_dt()) {
			t07_blacklist.setValidate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getValidate_dt()));
		}
		if (null != t07_blacklist.getInvalidate_dt()) {
			t07_blacklist.setInvalidate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getInvalidate_dt()));
		}
		if (null != t07_blacklist.getCreate_dt()) {
			t07_blacklist.setCreate_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getCreate_dt()));
		}
		if (null != t07_blacklist.getModify_dt()) {
			t07_blacklist.setModify_dt_disp(DateUtils
					.dateToStringShort(t07_blacklist.getModify_dt()));
		}
		if (t07_blacklist == null)
			t07_blacklist = new T07_Blacklist();
		return t07_blacklist;
	}

	/**
	 * ɾ������ ������ 2009��6-29
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_blacklist
	 *            T07_blacklist
	 * @throws SQLException
	 * @return int
	 */
	public int deleteT07_Blacklist(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist) throws SQLException {
		int i = sqlMap.update("deleteT07_Blacklist", t07_blacklist);
		return i;
	}

	/**
	 * �ж϶����Ƿ���ں������� ������ 2009��6-29
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_tracklist
	 *            T07_TRACKlist
	 * @throws SQLException
	 * @return boolean
	 */
	public boolean getT07_BlacklistB(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist) throws SQLException {
		boolean flag = true;
		Integer iCount = (Integer) sqlMap.queryForObject("getT07_BlacklistB",
				t07_blacklist);
		if (iCount.intValue() > 0) {
			flag = false;
		}
		return flag;
	}

	/**
	 * �޸Ĳ��� ������ 2009��6-29
	 * 
	 * @param sqlMap
	 *            SqlMapClient
	 * @param t07_blacklist
	 *            T07_Blacklist
	 * @throws SQLException
	 * @return int
	 */
	public int modifyT07_Blacklist(SqlMapClient sqlMap,
			T07_Blacklist t07_blacklist) throws SQLException {
		int i = sqlMap.update("modifyT07_Blacklist", t07_blacklist);
		return i;
	}

}
