/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2006-12-27   ����		����        
 */                                             
                                                  
package com.ist.aml.report.controller;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_app_movefateActionForm extends ActionForm {
                                              
/** �Ƿ���ɺ��� */
private String behind_ind = "";
/** ��ɵĲ���id */
private String curr_oper_id = "";
/** ��ǰ״̬
0��δ����Y����������1������ǰ��2����������3���ಽǰ��4���ಽ����5����ֹ����6����;���7����;��׼(����)8���յ���9���յ���׼D������ */
private String status_cd = "";
/** �Ƿ���ɳ�ʼ�� */
private String init_ind = "";
/** �Ƿ�ǰ��¼ */
private String current_ind = "";
/** ��ǰ���ڻ��� */
private String curr_org = "";
/** ��ɲ���Ա */
private String curr_operator = "";
/** �ύ����Ա */
private String orig_operator = "";
/** ������� */
private Long seq_num = null;
/** �ύ״̬ */
private String orig_status_cd = "";
/** �ύ��λ */
private String orig_post = "";
/** �������� */
private String oper_type = "";
/** ������� */
private String application_num = "";
/** �ϱ����� */
private Long recheck_num = null;
/** �ύ����id */
private String oper_id = "";
/** ��ǰ��λ */
private String curr_post = "";
/** ��ǰ�ڵ� */
private String curr_node = "";
/** �ϴθ����û� */
private String last_upd_user = "";
/** ����ʱ�� */
private Date create_dt = new Date();
/** �ύ�ڵ� */
private String orig_node = "";
/** �ڵ�id */
private String flow_id = "";
/** �ϴθ���ʱ�� */
private Date last_upd_dt = new Date();

//=======================================================
/** ����ʱ�� */
private String create_dt_disp = "";
/** �ϴθ���ʱ�� */
private String last_upd_dt_disp = "";

private String case_name_s="";

/** �����������*/
private String application_advice = "";
    /**                   
     * ���캯��           
     */                   
    public T07_app_movefateActionForm() {    
    }                     
public void setBehind_ind(String behind_indStr){
this.behind_ind = behind_indStr;
}
public String getBehind_ind(){
return this.behind_ind;
}

public void setCurr_oper_id(String curr_oper_idStr){
this.curr_oper_id = curr_oper_idStr;
}
public String getCurr_oper_id(){
return this.curr_oper_id;
}

public void setStatus_cd(String status_cdStr){
this.status_cd = status_cdStr;
}
public String getStatus_cd(){
return this.status_cd;
}

public void setInit_ind(String init_indStr){
this.init_ind = init_indStr;
}
public String getInit_ind(){
return this.init_ind;
}

public void setCurrent_ind(String current_indStr){
this.current_ind = current_indStr;
}
public String getCurrent_ind(){
return this.current_ind;
}

public void setCurr_org(String curr_orgStr){
this.curr_org = curr_orgStr;
}
public String getCurr_org(){
return this.curr_org;
}

public void setCurr_operator(String curr_operatorStr){
this.curr_operator = curr_operatorStr;
}
public String getCurr_operator(){
return this.curr_operator;
}

public void setOrig_operator(String orig_operatorStr){
this.orig_operator = orig_operatorStr;
}
public String getOrig_operator(){
return this.orig_operator;
}

public void setSeq_num(Long seq_numStr){
this.seq_num = seq_numStr;
}
public Long getSeq_num(){
return this.seq_num;
}

public void setOrig_status_cd(String orig_status_cdStr){
this.orig_status_cd = orig_status_cdStr;
}
public String getOrig_status_cd(){
return this.orig_status_cd;
}

public void setOrig_post(String orig_postStr){
this.orig_post = orig_postStr;
}
public String getOrig_post(){
return this.orig_post;
}

public void setOper_type(String oper_typeStr){
this.oper_type = oper_typeStr;
}
public String getOper_type(){
return this.oper_type;
}

public void setApplication_num(String application_numStr){
this.application_num = application_numStr;
}
public String getApplication_num(){
return this.application_num;
}

public void setRecheck_num(Long recheck_numStr){
this.recheck_num = recheck_numStr;
}
public Long getRecheck_num(){
return this.recheck_num;
}

public void setOper_id(String oper_idStr){
this.oper_id = oper_idStr;
}
public String getOper_id(){
return this.oper_id;
}

public void setCurr_post(String curr_postStr){
this.curr_post = curr_postStr;
}
public String getCurr_post(){
return this.curr_post;
}

public void setCurr_node(String curr_nodeStr){
this.curr_node = curr_nodeStr;
}
public String getCurr_node(){
return this.curr_node;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setOrig_node(String orig_nodeStr){
this.orig_node = orig_nodeStr;
}
public String getOrig_node(){
return this.orig_node;
}

public void setFlow_id(String flow_idStr){
this.flow_id = flow_idStr;
}
public String getFlow_id(){
return this.flow_id;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public String getCase_name_s() {
		return case_name_s;
	}
	public void setCase_name_s(String case_name_s) {
		this.case_name_s = case_name_s;
	}
	public String getApplication_advice() {
		return application_advice;
	}
	public void setApplication_advice(String application_advice) {
		this.application_advice = application_advice;
	}
                                                                                                       
}

