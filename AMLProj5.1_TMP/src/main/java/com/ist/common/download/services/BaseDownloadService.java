package com.ist.common.download.services;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.common.download.common.DownloadConstant;
import com.ist.common.download.dto.T18_download;
import com.ist.common.download.dto.T18_onlinetask_fact;
import com.ist.common.util.DateUtils;
import com.ist.common.util.StringUtils;

/**
 * ��˵��
 * 
 * @author muyl
 * @version V1.0 ����ʱ�䣺2013-6-27 ����10:00:04
 */
public abstract class BaseDownloadService extends BaseService implements I_DownloadService {

	/**
	 * ��������ִ����ʵ��
	 * 
	 * @param taskkey
	 * @throws SQLException 
	 */
	public void saveT18_onlinetask_fact(SqlMapClient sqlMap, HashMap<String, String> factMap, String taskkey) throws SQLException {
			
			T18_onlinetask_fact t18_onlinetask_fact = new T18_onlinetask_fact();
			t18_onlinetask_fact.setBusinesskey((String) factMap.get("businesskey"));
			t18_onlinetask_fact.setStatisticdate((String) factMap.get("statisticdate"));
			t18_onlinetask_fact.setCreatuser(StringUtils.null2String((String) factMap.get("creatuser")));
			t18_onlinetask_fact.setObjkey(StringUtils.null2String((String) factMap.get("objkey")));
			t18_onlinetask_fact.setObjdes(StringUtils.null2String((String) factMap.get("objdes")));
			t18_onlinetask_fact.setCalstatus("2");
			t18_onlinetask_fact.setTaskkey(taskkey);
			t18_onlinetask_fact.setTasktype(factMap.get("tasktype"));
			t18_onlinetask_fact.setCreatdate(DateUtils.getCurrDate());
			t18_onlinetask_fact.setServerkey("S1001");
			t18_onlinetask_factDAO.insertT18_onlinetask_fact(sqlMap, t18_onlinetask_fact);
	}

	/**
	 * �������ع����
	 * @throws SQLException 
	 */
	public void saveT18_download(SqlMapClient sqlMap, T18_download t18_download) throws SQLException   {
			t18_download.setFlag(DownloadConstant.DOWNLOAD_STAT_UN);
			t18_downloadDAO.insertT18_download(sqlMap, t18_download);

	}

	/**
	 * �������������
	 * 
	 * @param taskkey
	 * @throws SQLException 
	 */
	public void saveT18_onlinetask_parm(SqlMapClient sqlMap, ArrayList<HashMap<String, String>> paraList, String taskkey) throws SQLException {
			// ��ʼ������
			sqlMap.startBatch();

			for (HashMap<String, String> tObject : paraList) {
				T18_onlinetask_fact parafact = new T18_onlinetask_fact();
				parafact.setTaskkey(taskkey);
				parafact.setPara_code(tObject.get("para_code"));
				parafact.setSubnum(tObject.get("subnum"));
				parafact.setPara_val(tObject.get("para_val"));
				sqlMap.insert("insertT18_onlinetask_factpara", parafact); // statement��*MapSql.xmlһ������id
			}
			// ִ��������
			sqlMap.executeBatch();

	}

	/**
	 * ���� ���������ر�
	 * @param sqlMap
	 * @param factMap
	 * @param paraList
	 * @param t18_download
	 */
	public void save(SqlMapClient sqlMap, HashMap<String, String> factMap, ArrayList<HashMap<String, String>> paraList, T18_download t18_download) {
		try {
			//
			String taskkey = t18_download.getDloadkey();
			sqlMap.startTransaction();

			this.saveT18_onlinetask_fact(sqlMap, factMap, taskkey);
			this.saveT18_onlinetask_parm(sqlMap, paraList, taskkey);
			this.saveT18_download(sqlMap, t18_download);

			sqlMap.commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		// ��������
			try {
				sqlMap.endTransaction();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	
	/**
	 * ��֤ģ�ͺ�ִ̨��
	 * @param sqlMap
	 * @param factMap
	 * @param paraList
	 * @param t18_download
	 */
	public void save(SqlMapClient sqlMap, HashMap<String, String> factMap, ArrayList<HashMap<String, String>> paraList,String taskkey) {
		try {
			//
			String type = DownloadConstant.BACK_EXEC;
			sqlMap.startTransaction();

			this.saveT18_onlinetask_fact(sqlMap, factMap, taskkey,type);
			this.saveT18_onlinetask_parm(sqlMap, paraList, taskkey);

			sqlMap.commitTransaction();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
		// ��������
			try {
				sqlMap.endTransaction();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		}
	}
	/**
     * ȡ��Sequence��ֵ
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getSequenceNextVal(SqlMapClient sqlMap,String seqname) throws Exception {
        String key = "";
        String sql = "";
        if(cm.isDbType("oracle")){
            sql = "select " + seqname.toUpperCase() + ".Nextval  from dual";
        }
        else if(cm.isDbType("db2")){
            sql = " select NEXTVAL FOR " + seqname + " from sysibm.sysdummy1 ";
        }else{
            throw new Exception("��֧�ִ����ݿ⣡");
        }
        Long seqNextV = (Long) sqlMap.queryForObject("getValueLong", sql);
        key = String.valueOf(seqNextV);
        if (key.equals("")) {
            throw new Exception("��ȡ����ʧ�ܣ�");
        }
        return key;
    }
    
    /**
	 * ��������ִ����ʵ��
	 * 
	 * @param taskkey
	 * @throws SQLException 
	 */
	public void saveT18_onlinetask_fact(SqlMapClient sqlMap, HashMap<String, String> factMap, String taskkey,String type) throws SQLException {
			String calstatus = null;
			if (null != type && type.equals(DownloadConstant.BACK_EXEC)) {
				calstatus = "2";
			}
			T18_onlinetask_fact t18_onlinetask_fact = new T18_onlinetask_fact();
			t18_onlinetask_fact.setBusinesskey((String) factMap.get("businesskey"));
			t18_onlinetask_fact.setStatisticdate((String) factMap.get("statisticdate"));
			t18_onlinetask_fact.setCreatuser(StringUtils.null2String((String) factMap.get("creatuser")));
			t18_onlinetask_fact.setObjkey(StringUtils.null2String((String) factMap.get("objkey")));
			t18_onlinetask_fact.setObjdes(StringUtils.null2String((String) factMap.get("objdes")));
			t18_onlinetask_fact.setCalstatus(calstatus);
			t18_onlinetask_fact.setTaskkey(taskkey);
			t18_onlinetask_fact.setTasktype(factMap.get("tasktype"));
			t18_onlinetask_fact.setCreatdate(DateUtils.getCurrDate());
			t18_onlinetask_fact.setServerkey("S1001");
			t18_onlinetask_factDAO.insertT18_onlinetask_fact(sqlMap, t18_onlinetask_fact);
	}

}