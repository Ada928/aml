/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2006-12-27   ����		����        
 */                                             
                                                  
package com.ist.aml.risk_rate.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 
      
                                              
public class T31_swith implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 2372074841907738321L;
/** ����id */
private String oper_id = "";
private String oper_type = "";
private String post_id="";
private String oper_url = "";
/** �Ƿ������������� */
private String newseq_ind = "";
/** ��ת����
1������ǰ��2����������3���ಽǰ��4���ಽ����5����ֹ����6����;���7����;��׼(����)8���յ���9���յ���׼10������ */
private String switch_id = "";
/** ��ʼ��Url */
private String init_url = "";
/** Դ�ڵ� */
private String orig_node = "";
/** �ڵ�id */
private String flow_id = "";
/** �������,1��������2���ٵ��� */
private String flow_type = "";
/** �Ƿ���Ч */
private String is_use = "";
/** Ŀ��ڵ� */
private String target_node = "";

private String levelkey="";
/** ģ����� */
private String templatekey = "";
//=======================================================
public String getLevelkey() {
	return levelkey;
}
public void setLevelkey(String levelkey) {
	this.levelkey = levelkey;
}

public String getTemplatekey() {
	return templatekey;
}
public void setTemplatekey(String templatekey) {
	this.templatekey = templatekey;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public String getIs_report() {
	return is_report;
}
public void setIs_report(String isReport) {
	is_report = isReport;
}
private String status="";
private String is_report="";

                                              
    /**                   
     * ���캯��           
     */                   
    public T31_swith() {    
    }                     
public void setOper_id(String oper_idStr){
this.oper_id = oper_idStr;
}
public String getOper_id(){
return this.oper_id;
}

public void setNewseq_ind(String newseq_indStr){
this.newseq_ind = newseq_indStr;
}
public String getNewseq_ind(){
return this.newseq_ind;
}

public void setSwitch_id(String switch_idStr){
this.switch_id = switch_idStr;
}
public String getSwitch_id(){
return this.switch_id;
}

public void setInit_url(String init_urlStr){
this.init_url = init_urlStr;
}
public String getInit_url(){
return this.init_url;
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

public String getFlow_type() {
	return flow_type;
}
public void setFlow_type(String flowType) {
	flow_type = flowType;
}
public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

public void setTarget_node(String target_nodeStr){
this.target_node = target_nodeStr;
}
public String getTarget_node(){
return this.target_node;
}
public String getOper_type() {
	return oper_type;
}
public void setOper_type(String oper_type) {
	this.oper_type = oper_type;
}
public String getOper_url() {
	return oper_url;
}
public void setOper_url(String oper_url) {
	this.oper_url = oper_url;
}
public String getPost_id() {
	return post_id;
}
public void setPost_id(String post_id) {
	this.post_id = post_id;
}

//=======================================================
}

