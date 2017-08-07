package com.ist.server.cal.aml.Case;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.database.SQLExecute;
import com.ist.common.database.common.DbException;
import com.ist.common.database.dbfunc.DBfunc;
import com.ist.common.database.dbfunc.DBfuncFactory;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.SysConfig;
import com.ist.common.util.DateUtils;

import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.Case.bo.CaseBeforeBO;

import com.ist.server.cal.aml.common.IndicUtil;

import com.ist.server.dto.T18_task_fact;




public class DCalCaseBefore extends BaseCalTask {

	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(DCalCaseBefore.class.getName());


	private DBfunc func = DBfuncFactory.getDBInstance();
	private String module_ke_day = SysConfig.getProperty("rule.module_ke_day");
	private String workdateflag = SysConfig.getProperty("rule.workdateflag");

	CatchManager cm = CatchManager.getInstance();

	public DCalCaseBefore(T18_task_fact _t18_task_fact) {
		super(_t18_task_fact);
	}
	
	@Override
	public void init() {
		
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



	public boolean delTask(Connection conn)
			throws java.lang.Exception {
		boolean isSucc = true;
		try {
		 String statisticdate=this.t18_task_fact.getStatisticdate();
		 String   delsql= " DELETE FROM T07_CASE_MODULE_SCORE WHERE MODULETYPE='3' AND  CASE_DATE="+func.vch2dt(statisticdate, "yyyy-mm-dd");
			int  count = SQLExecute.exeSql(conn, delsql); 
			
			
		} catch (Exception e) {
			isSucc=false;
			e.printStackTrace();
			throw e;
		}

		return isSucc;
	}

	public boolean calTask(Connection conn) throws java.lang.Exception {
		boolean rs = true;
	
		try {
			String statisticdate = this.t18_task_fact.getStatisticdate();
			CaseBeforeBO casebeforBo=new CaseBeforeBO();
			
			HashMap map=casebeforBo.getNetPara(conn);
			String alertday="0";
			if(map.get("1003")!=null){
				alertday=(String)map.get("1003");
			}
			String sumcount="0";
			if(map.get("1001")!=null){
				sumcount=(String)map.get("1001");
			}
			CatchManager cm=CatchManager.getInstance();
			LinkedHashMap hash =(LinkedHashMap)cm.getMapFromCache("t87_syspara");
			String modelflag =(String)hash.get("510");//������ģ���Ƿ�ֻƥ��ģ�͹���Ԥ��
			if("1".equals(modelflag)){
				if(alertday.equals("0")){
					   //��������
					casebeforBo.insertT07_MALERTSTCR_KY_TEMP11_MODEL(conn,statisticdate);
				}else{
					   //��������
					casebeforBo.insertT07_MALERTSTCR_KY_TEMP1_MODEL(conn,statisticdate);
				}
			}else{
				if(alertday.equals("0")){
					   //��������
					casebeforBo.insertT07_MALERTSTCR_KY_TEMP11(conn,statisticdate);
				}else{
					   //��������
					casebeforBo.insertT07_MALERTSTCR_KY_TEMP1(conn,statisticdate);
				}
			}
			
			DateUtils du=new DateUtils();	
			
			
		
			//ɾ�����ɰ��������Ե�Ԥ��
            casebeforBo.delT27_MID_TRANS_KY_TEMP(conn,"T07_MALERTSTCR_KY_TEMP1",statisticdate);
            conn.commit();
            
            //ɾ�����ױ������������
            casebeforBo.dealNetTrans(conn, sumcount);
			
			//��ѯ������ģ�ͽ���ƥ��
            /** modify by liuchao 20170419 3���� **/
			//HashMap moduleMap=casebeforBo.selModule(conn, "2"); 
			ArrayList multiList= casebeforBo.getT23_model_cond(conn,"2","");
			//����ģ��ƥ��
			//casebeforBo.dealModule1(conn, moduleMap,statisticdate);
			casebeforBo.dealModule1_new(conn,statisticdate,multiList);
			conn.commit();
			//��������ƥ��
//			 alertday=casebeforBo.dealNet(conn,statisticdate);
			//edit by helong 2015/9/7 ����t07_case_net_indic application_num='Y'
			 String sql1="update T07_CASE_NET_INDIC a set application_num='Y' where a.application_num='N' "
				 +" and exists (select 'X' from T07_MALERTSTCR_KY_TEMP1 b,t21_rule e "
				 +" where e.pbckey=b.STCRKEY and a.rulekey=e.rulekey and a.net_id=b.net_id and b.status_cd='1')";
			 SQLExecute.exeSql(conn, sql1);	
			conn.commit();
			if(!alertday.equals("0")){
			//��������
            String befordate=du.getDateChangeALL(statisticdate+" 00:00:00", "1",Integer.parseInt("-"+alertday));
			
			//��_D�е���Ҫ����������������ݷ����м��,������ʱʹ��
			casebeforBo.insertMidNetTrans(conn,befordate,statisticdate,sumcount);
			}
			String delsql=func.deleteTable("T07_MALERTTRAN_KY_TEMP2");
			String status_cd="1";
			if(module_ke_day!=null && !module_ke_day.equals("0")){
				//ɾ�������ɰ���������
				//casebeforBo.delT07_MALERTTRAN_KY_Bystatus(conn, "T07_MALERTTRAN_KY_TEMP2");
				casebeforBo.delT07_MALERTTRAN_KY_Bystatus(conn, "T07_MALERTTRAN_KY_TEMP2",statisticdate);
				
				 delsql="delete from T07_MALERTTRAN_KY_TEMP2  where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");	
				 status_cd="0";
			}
			int count = SQLExecute.exeSql(conn, delsql);	
			
			//��ƥ��ɹ���net��Ӧ��Ԥ���������ɰ����м��
			casebeforBo.insertT07_MALERTTRAN_KY_TEMP2(conn,statisticdate,status_cd,alertday);
			
			
			conn.commit();
			//�޸ĺϲ�����Ҫ�޸ĵ�״̬
			String beforeday="";
			if(module_ke_day!=null && !module_ke_day.equals("0")){
				if(workdateflag!=null && workdateflag.equals("1")){
					IndicUtil indicBo = new IndicUtil();
					beforeday=indicBo.getcpworkday(conn,statisticdate, Integer.parseInt("-"+module_ke_day));
				}else{
					int day=Integer.parseInt("-"+module_ke_day);	
					beforeday=DateUtils.dateToStringShort(du.getDateChangeTime(DateUtils.stringToDateShort(statisticdate), "d", day));	
					
				}
				casebeforBo.updateT07_MALERTTRAN_KY_TEMP2(conn, beforeday);
			}
			
			func.deleteTable(conn,"M13_net_party_day");
			
			String sql=" INSERT INTO M13_net_party_day (net_id,party_id)"
		    +" select distinct net_id,objkey  "
			+"     FROM T07_MALERTTRAN_KY_TEMP2 t where status_cd='1' ";
			SQLExecute.exeSql(conn, sql.toString());
			conn.commit();
		    
		    //�޸�����ָ����е�new_net_id
		    sql=" update T07_CASE_NET_INDIC d set objkey=(select e.party_id "
	    	 +"  from M13_net_party_day e where e.net_id=d.net_id) "
	    	 +"  where exists(select 'x' from M13_net_party_day f where f.net_id=d.net_id) ";
	     
	       SQLExecute.exeSql(conn, sql);

		    //�޸İ������������е�new_net_id
		    sql=" update T07_CASE_MODULE_SCORE d set objkey=(select e.party_id "
	    	 +"  from M13_net_party_day e where e.net_id=d.net_id) "
	    	 +"  where exists(select 'x' from M13_net_party_day f where f.net_id=d.net_id) ";
	     
	       SQLExecute.exeSql(conn, sql);
				
			conn.commit();
   
		} catch (Exception e) {
			rs=false;
			e.printStackTrace();
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
		return true;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception {
		// TODO Auto-generated method stub
		return true;
	}


	public static void main(String[] args) {

	}


}
