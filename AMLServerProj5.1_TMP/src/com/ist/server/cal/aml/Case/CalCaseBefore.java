package com.ist.server.cal.aml.Case;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

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
import com.ist.server.cal.aml.Case.bo.MerageAlertBO;
import com.ist.server.cal.aml.Indic.bo.IndicBo;
import com.ist.server.cal.aml.common.Constants;
import com.ist.server.cal.aml.common.IndicUtil;
import com.ist.server.dao.T18_errorlogDAO;
import com.ist.server.dto.T18_task_fact;




public class CalCaseBefore extends BaseCalTask {

	/** ����������־ */
	private static Logger logger = LogUtils.getLogger(CalCaseBefore.class.getName());


	private DBfunc func = DBfuncFactory.getDBInstance();
	/**�Ƿ�ֱ����*/
	private String case_curr_type = SysConfig.getProperty("rule.case_curr_type");
	private String module_ke_day = SysConfig.getProperty("rule.module_ke_day");
	private String workdateflag = SysConfig.getProperty("rule.workdateflag");
    
	CatchManager cm = CatchManager.getInstance();
	
	public CalCaseBefore(T18_task_fact _t18_task_fact) {
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
			String   delsql= " DELETE FROM T07_CASE_MODULE_SCORE WHERE MODULETYPE='2' AND  CASE_DATE="+func.vch2dt(statisticdate, "yyyy-mm-dd");
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
		MerageAlertBO merageAlertBO = new MerageAlertBO();
		CaseBeforeBO casebeforBo=new CaseBeforeBO();
		try {
			String statisticdate = this.t18_task_fact.getStatisticdate();
			DateUtils du=new DateUtils();
			
            //ɾ����Ҫ���ɰ�����Ԥ�����ױ�
			String delsql=func.deleteTable("T07_MALERTTRAN_KY_TEMP");
			String status_cd="1";
			if(module_ke_day!=null && !module_ke_day.equals("0")){
				//ɾ�������ɰ���������
				//casebeforBo.delT07_MALERTTRAN_KY_Bystatus(conn, "T07_MALERTTRAN_KY_TEMP");
				casebeforBo.delT07_MALERTTRAN_KY_Bystatus(conn, "T07_MALERTTRAN_KY_TEMP2",statisticdate);

				 delsql="delete from T07_MALERTTRAN_KY_TEMP  where STATISTIC_DT="+func.vch2dt(statisticdate, "yyyy-mm-dd");	
				 status_cd="0";
			}
			int count = SQLExecute.exeSql(conn, delsql);	
			
			
			//ɾ�������ڵ�����ģ�͵Ŀͻ�
			//merageAlertBO.delT07_MALERTTRAN_KY_TEMP1(conn);
			//��ѯ������ģ�ͽ���ƥ��
	
			HashMap moduleMap=casebeforBo.selModule(conn, "1");
			Iterator iter=moduleMap.keySet().iterator();
 			ArrayList multiList=new ArrayList();//add by liuchao 3����

			while(iter.hasNext()){
				String module_no=(String)iter.next();
				String stcr=(String)moduleMap.get(module_no);
				String[] stcrstrs=stcr.split(";");
				String stcrstr=(String)stcrstrs[0];
				String stcrcount=(String)stcrstrs[1];
				int tatalday=Integer.parseInt("-"+(String)stcrstrs[2]);
				//��������
                String befordate=du.getDateChangeALL(statisticdate+" 00:00:00", "1",tatalday);
				//���ڶ�������Ԥ���ŵ��м��
                //�Ż�������ģ�Ϳ��������⣬3����
                if (Constants.TRUE.equals(case_curr_type)) {
                	//merageAlertBO.insertT27_MID_TRANS_KY_TEMP(conn, statisticdate,",a.curr_cd","T07_MALERTTRAN_KY_TEMP1",befordate,module_no);	
                 	merageAlertBO.insertT27_MID_TRANS_KY_TEMP_NEW(conn, statisticdate,",a.curr_cd","T07_MALERTTRAN_KY_TEMP1",befordate,module_no);	//add by liuchao 3����
                }else{
    			 //merageAlertBO.insertT27_MID_TRANS_KY_TEMP(conn, statisticdate,",''","T07_MALERTTRAN_KY_TEMP1",befordate,module_no);
    			 merageAlertBO.insertT27_MID_TRANS_KY_TEMP_NEW(conn, statisticdate,",''","T07_MALERTTRAN_KY_TEMP1",befordate,module_no);//add by liuchao 3����

                }
    			//����Ԥ�������м��
    			casebeforBo.insertT07_MALERTSTCR_KY_TEMP(conn);
    			//ɾ�����ɰ��������Ե�Ԥ��
                casebeforBo.delT27_MID_TRANS_KY_TEMP(conn,"T07_MALERTSTCR_KY_TEMP",statisticdate);
    			//����ƥ��  
                //3����,�޸Ķ���ؼ�����
                multiList= casebeforBo.getT23_model_cond(conn,"1",module_no);
  			  casebeforBo.dealModule_new(conn,multiList,statisticdate,module_no);
  			//casebeforBo.dealModule(conn, module_no,stcrstr,stcrcount,statisticdate);
    			//����Ҫ���ɰ�����Ԥ�������м��
    			casebeforBo.insertT07_MALERTTRAN_KY_TEMP(conn,status_cd,statisticdate);
				
			}
			String beforeday=statisticdate;
			if(module_ke_day!=null && !module_ke_day.equals("0")){
				 //�޸Ŀ������ɰ���������״̬
				if(workdateflag!=null && workdateflag.equals("1")){
					IndicUtil indicBo = new IndicUtil();
					beforeday=indicBo.getcpworkday(conn,statisticdate, Integer.parseInt("-"+module_ke_day));
				}else{
					int day=Integer.parseInt("-"+module_ke_day);	
					beforeday=DateUtils.dateToStringShort(du.getDateChangeTime(DateUtils.stringToDateShort(statisticdate), "d", day));	
					
				}
				casebeforBo.updateT07_MALERTTRAN_KY_TEMP(conn, beforeday);
			}
			
			
   
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
