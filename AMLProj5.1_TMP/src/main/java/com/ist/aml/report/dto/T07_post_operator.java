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
      
                                              
public class T07_post_operator implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 7013612623542874720L;
	private String curr_cd = "";
	private String party_class_cd = "";
	private String[] selectedApp = {};                      
	/** ����ʼʱ�� */
	private String case_date_start_disp = "";
	/** ��������ʱ�� */
	private String case_date_end_disp = "";
	private String input_name="";
	private String selectedarea_key[]=null;
	private int intpage=0;
	
/** ��λ���� */
private String post_id = "";
private String curr_post = "";
public String getCurr_post() {
	return curr_post;
}
public void setCurr_post(String currPost) {
	curr_post = currPost;
}
/** ��λ���� */
private String post_name = "";
/** ����ʱ�� */
private Date valid_dt = new Date();
/** �û�id */
private String username = "";
/** �ϴθ����û� */
private String last_upd_user = "";
/** �ڵ�id */
private String flow_id = "";
/** �ϴθ���ʱ�� */
private Date last_upd_dt = new Date();
/** ���ñ�־
0������1������ */
private String is_use = "";
//=======================================================
/** ����ʱ�� */
private String valid_dt_disp = "";
/** �ϴθ���ʱ�� */
private String last_upd_dt_disp = "";
/** ��ǰ����*/
private String curr_org = "";
/** ��ǰ����*/
private String curr_org_disp = "";
/** �������� */
private String case_name = "";
/** �ͻ�ID */
private String party_id = "";
/** �������� */
private Date app_dt = new Date();
/** �������� */
private String app_org_id = "";
/** null */
private String app_case_reason = "";
/** ������� */
private String application_num = "";
/** �ϱ����� */
private String recheck_num = "";
/** �������� */
private String case_kind = "";
/** ����ʱ�� */
private Date case_date = new Date();
/** ״̬1������2����׼3�����4���ų�5���ر� */
private String app_state_cd = "";
/** �ͻ����� */
private String party_name = "";
/** ��������0:��ͨ1��Ҫ2����
 */
private String case_level = "";
//=======================================================
/** �������� */
private String app_dt_disp = "";
/** ����ʱ�� */
private String case_date_disp = "";
/** ����ʼʱ�� */
private Date case_date_start = new Date();
/** ��������ʱ�� */
private Date case_date_end = new Date();
/** ��������:0���1���� */
private String cast_type = "";
/** �������� */
private String order_type = "";
/** �����ֶ����� */
private String  order_name= "";

private String post_des="";

/** �Ƿ�Ϊ�����޸ı�ʶ*/
private String cmbcFlag="";

/** �����϶����*/
private String case_result="";

/** �Ƿ�Ϊ��˸ڱ�ʶ*/
private String post_flag="";

private String isstaff="";

private String is_grey="";

private String validate_ind="";
                                                                     
/** �Ƿ������ */
private String is_menu = "";
    public String getIs_menu() {
	return is_menu;
}
    
/** ������Դ1���ֹ�����2��ϵͳ���� */
private String date_status_cd = "";

/******************** �Ե�************/
/** ������Դ:1���� 2ģ�� 3������*/
private String case_source = "";

//=============================================================================

public void setIs_menu(String isMenu) {
	is_menu = isMenu;
}
/**
 * @return the post_des
 */
public String getPost_des() {
	return post_des;
}
/**
 * @param post_des the post_des to set
 */
public void setPost_des(String post_des) {
	this.post_des = post_des;
}
	public String getOrder_type() {
	return order_type;
}
public void setOrder_type(String order_type) {
	this.order_type = order_type;
}
	public String getCast_type() {
	return cast_type;
}
public void setCast_type(String cast_type) {
	this.cast_type = cast_type;
}

	public Date getCase_date_end() {
	return case_date_end;
}
public void setCase_date_end(Date case_date_end) {
	this.case_date_end = case_date_end;
}
public Date getCase_date_start() {
	return case_date_start;
}
public void setCase_date_start(Date case_date_start) {
	this.case_date_start = case_date_start;
}
	public String getApp_case_reason() {
	return app_case_reason;
}
public void setApp_case_reason(String app_case_reason) {
	this.app_case_reason = app_case_reason;
}
public Date getApp_dt() {
	return app_dt;
}
public void setApp_dt(Date app_dt) {
	this.app_dt = app_dt;
}
public String getApp_dt_disp() {
	return app_dt_disp;
}
public void setApp_dt_disp(String app_dt_disp) {
	this.app_dt_disp = app_dt_disp;
}
public String getApp_org_id() {
	return app_org_id;
}
public void setApp_org_id(String app_org_id) {
	this.app_org_id = app_org_id;
}
public String getApp_state_cd() {
	return app_state_cd;
}
public void setApp_state_cd(String app_state_cd) {
	this.app_state_cd = app_state_cd;
}
public String getApplication_num() {
	return application_num;
}
public void setApplication_num(String application_num) {
	this.application_num = application_num;
}
public Date getCase_date() {
	return case_date;
}
public void setCase_date(Date case_date) {
	this.case_date = case_date;
}
public String getCase_date_disp() {
	return case_date_disp;
}
public void setCase_date_disp(String case_date_disp) {
	this.case_date_disp = case_date_disp;
}
public String getCase_kind() {
	return case_kind;
}
public void setCase_kind(String case_kind) {
	this.case_kind = case_kind;
}
public String getCase_level() {
	return case_level;
}
public void setCase_level(String case_level) {
	this.case_level = case_level;
}
public String getCase_name() {
	return case_name;
}
public void setCase_name(String case_name) {
	this.case_name = case_name;
}
public String getParty_id() {
	return party_id;
}
public void setParty_id(String party_id) {
	this.party_id = party_id;
}
public String getParty_name() {
	return party_name;
}
public void setParty_name(String party_name) {
	this.party_name = party_name;
}
public String getRecheck_num() {
	return recheck_num;
}
public void setRecheck_num(String recheck_num) {
	this.recheck_num = recheck_num;
}
	/**                   
     * ���캯��           
     */                   
    public T07_post_operator() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setValid_dt(Date valid_dtStr){
this.valid_dt = valid_dtStr;
}
public Date getValid_dt(){
return this.valid_dt;
}

public void setUsername(String usernameStr){
this.username = usernameStr;
}
public String getUsername(){
return this.username;
}

public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
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

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

//=======================================================
public void setValid_dt_disp(String valid_dt_dispStr){
this.valid_dt_disp = valid_dt_dispStr;
}
public String getValid_dt_disp(){
return this.valid_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getCurr_org() {
	return curr_org;
}
public void setCurr_org(String curr_org) {
	this.curr_org = curr_org;
}
public String getOrder_name() {
	return order_name;
}
public void setOrder_name(String order_name) {
	this.order_name = order_name;
}
public String getPost_name() {
	return post_name;
}
public void setPost_name(String post_name) {
	this.post_name = post_name;
}
public String getCase_date_end_disp() {
	return case_date_end_disp;
}
public void setCase_date_end_disp(String case_date_end_disp) {
	this.case_date_end_disp = case_date_end_disp;
}
public String getCase_date_start_disp() {
	return case_date_start_disp;
}
public void setCase_date_start_disp(String case_date_start_disp) {
	this.case_date_start_disp = case_date_start_disp;
}
public String getInput_name() {
	return input_name;
}
public void setInput_name(String input_name) {
	this.input_name = input_name;
}
public String[] getSelectedApp() {
	return selectedApp;
}
public void setSelectedApp(String[] selectedApp) {
	this.selectedApp = selectedApp;
}
public String[] getSelectedarea_key() {
	return selectedarea_key;
}
public void setSelectedarea_key(String[] selectedarea_key) {
	this.selectedarea_key = selectedarea_key;
}
public int getIntpage() {
	return intpage;
}
public void setIntpage(int intpage) {
	this.intpage = intpage;
}
public String getCurr_cd() {
	return curr_cd;
}
public void setCurr_cd(String curr_cd) {
	this.curr_cd = curr_cd;
}
public String getParty_class_cd() {
	return party_class_cd;
}
public void setParty_class_cd(String party_class_cd) {
	this.party_class_cd = party_class_cd;
}
public String getCmbcFlag() {
	return cmbcFlag;
}
public void setCmbcFlag(String cmbcFlag) {
	this.cmbcFlag = cmbcFlag;
}
public String getCase_result() {
	return case_result;
}
public void setCase_result(String case_result) {
	this.case_result = case_result;
}
public String getPost_flag() {
	return post_flag;
}
public void setPost_flag(String post_flag) {
	this.post_flag = post_flag;
}
public String getDate_status_cd() {
	return date_status_cd;
}
public void setDate_status_cd(String date_status_cd) {
	this.date_status_cd = date_status_cd;
}
public String getCurr_org_disp() {
	return curr_org_disp;
}
public void setCurr_org_disp(String curr_org_disp) {
	this.curr_org_disp = curr_org_disp;
}
public String getIsstaff() {
	return isstaff;
}
public void setIsstaff(String isstaff) {
	this.isstaff = isstaff;
}
public String getValidate_ind() {
	return validate_ind;
}
public void setValidate_ind(String validate_ind) {
	this.validate_ind = validate_ind;
}
public String getIs_grey() {
	return is_grey;
}
public void setIs_grey(String is_grey) {
	this.is_grey = is_grey;
}

public String getCase_source() {
	return case_source;
}
public void setCase_source(String caseSource) {
	case_source = caseSource;
}

}

