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
  
import java.util.Date;       
                     
public class T07_case_advi implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 913158169614755429L;
/** ��λ���� */
private String post_id = "";
/** ������� */
private String application_num = "";
/** ԭ�� */
private String reason = "";
/** �Ƿ�ǰ��¼ */
private String current_ind = "";
/** ����Ա */
private String operator_num = "";
/** �ϴθ����û� */
private String last_upd_user = "";
/** �ϴθ���ʱ�� */
private Date last_upd_dt = new Date();
/** ������� */
private Long seq_num =null;
//=======================================================
/** �ϴθ���ʱ�� */
private String last_upd_dt_disp = "";

private String userName="";

/** �ڵ� */
private String node_id = "";
                                              
    /**
 * @return the userName
 */
public String getUserName() {
	return userName;
}
/**
 * @param userName the userName to set
 */
public void setUserName(String userName) {
	this.userName = userName;
}
	/**                   
     * ���캯��           
     */                   
    public T07_case_advi() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setReason(String reasonStr){
this.reason = reasonStr;
}
public String getReason(){
return this.reason;
}

public void setCurrent_ind(String current_indStr){
this.current_ind = current_indStr;
}
public String getCurrent_ind(){
return this.current_ind;
}

public void setOperator_num(String operator_numStr){
this.operator_num = operator_numStr;
}
public String getOperator_num(){
return this.operator_num;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setSeq_num(Long seq_numStr){
this.seq_num = seq_numStr;
}
public Long getSeq_num(){
return this.seq_num;
}

//=======================================================
public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getNode_id() {
	return node_id;
}
public void setNode_id(String node_id) {
	this.node_id = node_id;
}

}

