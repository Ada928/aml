/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2007-12-05   ����		����        
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

import java.util.Date;       
      
                                              
public class T07_case_transaction implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 518192275875098801L;
/** ������� */
private String application_num = "";
/** ���״���״̬��
1:������2:������4:���ų� */
private String status_cd = "";
/** Ԥ��ID */
private String alertkey = "";
/** ����ID */
private String transactionkey = "";
/** �����ַ��� */
private String trans = "";
/**��������  */
private String stcr = "";
/**��������  */
private String case_type = "";
/**�ͻ���  */
private String party_id = "";
private Date case_date=new Date();
private String dealadvise="";
private String acct_num="";
private Double amt = null;
//=======================================================
                                              
    public Double getAmt() {
	return amt;
}
public void setAmt(Double amt) {
	this.amt = amt;
}
	public String getAcct_num() {
	return acct_num;
}
public void setAcct_num(String acctNum) {
	acct_num = acctNum;
}
	/**                   
     * ���캯��           
     */                   
    public T07_case_transaction() {    
    }                     
public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setStatus_cd(String status_cdStr){
this.status_cd = status_cdStr;
}
public String getStatus_cd(){
return this.status_cd;
}

public void setAlertkey(String alertkeyStr){
this.alertkey = alertkeyStr;
}
public String getAlertkey(){
return this.alertkey;
}

public void setTransactionkey(String transactionkeyStr){
this.transactionkey = transactionkeyStr;
}
public String getTransactionkey(){
return this.transactionkey;
}
public String getStcr() {
	return stcr;
}
public void setStcr(String stcr) {
	this.stcr = stcr;
}
public String getCase_type() {
	return case_type;
}
public void setCase_type(String case_type) {
	this.case_type = case_type;
}
public String getParty_id() {
	return party_id;
}
public void setParty_id(String party_id) {
	this.party_id = party_id;
}
public String getTrans() {
	return trans;
}
public void setTrans(String trans) {
	this.trans = trans;
}
public Date getCase_date() {
	return case_date;
}
public void setCase_date(Date case_date) {
	this.case_date = case_date;
}
public String getDealadvise() {
	return dealadvise;
}
public void setDealadvise(String dealadvise) {
	this.dealadvise = dealadvise;
}

//=======================================================
}

