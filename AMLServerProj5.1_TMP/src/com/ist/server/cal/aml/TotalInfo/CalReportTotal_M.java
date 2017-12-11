package com.ist.server.cal.aml.TotalInfo;

import java.sql.Connection;


import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.TotalInfo.bo.TotalReportBO;
import com.ist.server.dto.T18_task_fact;




public class CalReportTotal_M extends BaseCalTask {

	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(CalReportTotal_M.class.getName());
	TotalReportBO reportBo=new TotalReportBO();
	

	public CalReportTotal_M(T18_task_fact _t18_task_fact) {
		super(_t18_task_fact);
	}

	@Override
	public void init() {
		
	}
	public boolean delTask(Connection conn) throws Exception {
		  boolean isSucc=true;
			try {
				String statisticdate=this.t18_task_fact.getStatisticdate();
				int count=reportBo.del_t07_inrep_by_acct(conn, statisticdate);
				   count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_REPORT_STATISTIC_MID");
				 count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_IDENTITY_M");
				count=reportBo.del_T07_Table_MID(conn, statisticdate,"T07_USER_REIDENTITY_M");
				count=reportBo.del_T07_Table_MID1(conn, statisticdate,"T10_PARTY_CRETAL");
			} catch (Exception e) {
				logger.error(e.getMessage());
				e.printStackTrace();
				isSucc= false;
				throw e;
			}

			return isSucc;
	}
	@Override
	public boolean isCanExec(Connection _conn) throws Exception {
		boolean isSucc = true;

		
		return isSucc;
	}
	@Override
	public boolean preTask(Connection _conn)
			throws Exception {
		boolean isSucc = true;
		 

		return isSucc;
	}


	

	public boolean calTask(Connection conn) throws Exception {
		boolean rs = true;
		try {
			String statisticdate=this.t18_task_fact.getStatisticdate();
			String granularity=this.t18_task_fact.getGranularity();
			 //���˻�ͳ��
			int count=reportBo.del_t07_inrep_by_acct_mid(conn);
			count=reportBo.insert_t07_inrep_by_acct_mid(conn, statisticdate, "1",granularity);//����Ҵ��
			count=reportBo.insert_t07_inrep_by_acct_mid(conn, statisticdate, "2",granularity);//����ҿ���
			count=reportBo.insert_t07_inrep_by_acct(conn);//���м������ݲ�������	
			
		   //���ڻ������ɽ��ױ���ͳ��
			count=reportBo.insert_T07_REPORT_STATISTIC_MID(conn, statisticdate,granularity);
			 //�¿��ͻ�ʶ��ͳ�Ʊ�
				count=reportBo.insert_T07_USER_IDENTITY_M(conn, statisticdate,granularity);
				
			 //���¿ͻ�ʶ��ͳ�Ʊ�
			   count=reportBo.insert_T07_USER_REIDENTITY_M(conn, statisticdate,granularity);
			 
		     //�������ô���Ӧ��ͳ�Ʊ�
			   count=reportBo.insert_T10_PARTY_CRETAL(conn, statisticdate,granularity);
			
		} catch (Exception e) {
			logger.error(e.getMessage());
			e.printStackTrace();
			rs=false;
			throw e;
		}
		return rs;

	}

	@Override
	public boolean finalTask(Connection _conn)
			throws Exception {
		boolean isSucc = true;

		return isSucc;
	}
	
	

	@Override
	public boolean finalSubTask(Connection arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}
     
      
    

	public static void main(String[] args) {

	}
	

}
