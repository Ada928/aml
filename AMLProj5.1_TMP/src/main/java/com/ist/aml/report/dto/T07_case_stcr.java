/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2006-12-27   ����		����        
 */                                             
                                                  
package com.ist.aml.report.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 

import java.util.ArrayList;  
import java.util.Date;       
    
                                              
public class T07_case_stcr implements Serializable {
	
 	 /**
	 * 
	 */
	private static final long serialVersionUID = -5571011123019582793L;

	private int tfrans_count    =0;//��������
 	  
 	 /** ������� */
 	 private String application_num = "";
 	 /** �ͻ��� */
 	 private String party_id = "";
 	 /** �������� */
 	 private String stcr = "";
 	 /** �������� */
 	 private String stcr_disp = "";
 	 /** ����״̬ 1�������У�2����������4�����ų� */
 	 private String status = "";
 	 /** ����״̬ 1�������У�2����������4�����ų� */
 	 private String status_disp = "";
 	 /**�������� */
 	 private String create_date = "";
 	 /**�������� */
 	 private String case_type = "";
 	 /** �޸ĺ���������� */
 	 private String stcrkey = "";
 	 /** ������ѯʱ�䣺��ǰ��������ʷ���� */
 	 private String casesearchtime = "";
 	 /** ���������б� */
     private ArrayList t07_stcr_transList;
     
     private Date case_date=new Date();
     
 	 /** �˻��� */
 	 private String acct_num = "";
 	 
 	 private int intPage=0;
 	 
 	 private String party_class_cd="";
 	/** ģ�� */
 	private String model_no = "";
 	private String model_name = "";
 	/** ƥ��� */
 	private Double matching = null;
 	private String matching_disp = "";
 	private Double rulevalue;
 	private String rulevalue_disp ="";

 	/** 1.��Դ�ڹ���2.��Դ��ģ��*/
 	private String flag = "";
	public String getParty_class_cd() {
		return party_class_cd;
	}


	public void setParty_class_cd(String partyClassCd) {
		party_class_cd = partyClassCd;
	}


	public int getIntPage() {
		return intPage;
	}


	public void setIntPage(int intPage) {
		this.intPage = intPage;
	}


	public String getAcct_num() {
		return acct_num;
	}


	public void setAcct_num(String acctNum) {
		acct_num = acctNum;
	}


	public T07_case_stcr() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Double getRulevalue() {
		return rulevalue;
	}


	public void setRulevalue(Double rulevalue) {
		this.rulevalue = rulevalue;
	}


	public String getRulevalue_disp() {
		return rulevalue_disp;
	}


	public void setRulevalue_disp(String rulevalueDisp) {
		rulevalue_disp = rulevalueDisp;
	}


	public String getApplication_num() {
		return application_num;
	}


	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}


	public String getParty_id() {
		return party_id;
	}


	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}


	public String getStcr() {
		return stcr;
	}


	public void setStcr(String stcr) {
		this.stcr = stcr;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	public String getCreate_date() {
		return create_date;
	}


	public void setCreate_date(String create_date) {
		this.create_date = create_date;
	}


	public int getTfrans_count() {
		return tfrans_count;
	}


	public void setTfrans_count(int tfrans_count) {
		this.tfrans_count = tfrans_count;
	}


	public String getStcr_disp() {
		return stcr_disp;
	}


	public void setStcr_disp(String stcr_disp) {
		this.stcr_disp = stcr_disp;
	}


	public String getStatus_disp() {
		return status_disp;
	}


	public void setStatus_disp(String status_disp) {
		this.status_disp = status_disp;
	}


	public String getCase_type() {
		return case_type;
	}


	public void setCase_type(String case_type) {
		this.case_type = case_type;
	}


	public String getStcrkey() {
		return stcrkey;
	}


	public void setStcrkey(String stcrkey) {
		this.stcrkey = stcrkey;
	}


	public String getCasesearchtime() {
		return casesearchtime;
	}


	public void setCasesearchtime(String casesearchtime) {
		this.casesearchtime = casesearchtime;
	}


	public ArrayList getT07_stcr_transList() {
		return t07_stcr_transList;
	}


	public void setT07_stcr_transList(ArrayList list) {
		t07_stcr_transList = list;
	}


	public Date getCase_date() {
		return case_date;
	}


	public void setCase_date(Date case_date) {
		this.case_date = case_date;
	}


	public String getModel_no() {
		return model_no;
	}


	public void setModel_no(String modelNo) {
		model_no = modelNo;
	}


	public String getModel_name() {
		return model_name;
	}


	public void setModel_name(String modelName) {
		model_name = modelName;
	}


	public Double getMatching() {
		return matching;
	}


	public void setMatching(Double matching) {
		this.matching = matching;
	}


	public String getMatching_disp() {
		return matching_disp;
	}

	public void setMatching_disp(String matchingDisp) {
		matching_disp = matchingDisp;
	}


	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

}

