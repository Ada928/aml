package com.ist.aml.report.dto;

import java.io.Serializable;
import java.util.*;

public class CreditTask implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 7991263878950060511L;
	/** ����λ�� 1�������������б� 2������������б�*/
	private String task_cd = "";
	/**1:����2:���*/ 
	private String curr_cd = "";	
	private String curr_cd_disp = "";	
	private String alert_level="";
	private String action_descrip="";
	/** ������Ϊ����˵�� */
	private String action_explain="";
	private String take_action="";
	private String alert_level_disp="";
	private String validate_ind="";
	private String validate_ind_disp="";
	/** ������ */
	private String application_num="";
	/** ������� */
	private Long seq_num =null;
	/** ����ID */
	private String flow_id = "";
	/** ҵ������ */
	private String flow_type = "";
	/** ��ǰ�ڵ� */
	private String node_id = "";
	/** ��ǰ��λ */
	private String post_id = "";
	/** ��������:1���2���� */
	private String cast_type = "";
	private String cast_type_disp = "";
	/** ������Դ1���ֹ�����2��ϵͳ���� */
	private String date_status_cd = "";
	/** �������� */
	private String case_name = "";
	/** �ͻ�ID */
	private String party_id = "";
	/** �������� */
	private Date app_dt = new Date();
	/** �������� */
	private String app_org_id = "";
	private String app_org_id_disp = "";
	/** null */
	private String app_case_reason = "";
	/** �ϱ����� */
	private Long recheck_num ;
	/** �������� */
	private String case_kind = "";
	private String case_kind_disp = "";
	/** ����ʱ�� */
	private Date case_date = new Date();
	/** ״̬1������2����׼3�����4���ų�5���ر� */
	private String app_state_cd = "";
	private String app_state_cd_disp = "";
	/** �ϴθ����û� */
	private String last_upd_user = "";
	/** �ͻ����� */
	private String party_name = "";
	/** �ϴθ���ʱ�� */
	private Date last_upd_dt = new Date();
	/** ��������0:��ͨ1��Ҫ2����
	 */
	private String case_level = "";
	private String case_level_disp = "";
//	=======================================================
	/** �������� */
	private String app_dt_disp = "";
	/** ����ʱ�� */
	private String case_date_disp = "";
	/** �ϴθ���ʱ�� */
	private String last_upd_dt_disp = "";
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
	/** �ύ״̬ */
	private String orig_status_cd = "";
	/** �ύ��λ */
	private String orig_post = "";
	private String orig_post_disp = "";
	/** �������� */
	private String oper_type = "";
	/** ��ǰ��λ */
	private String curr_post = "";
	private String curr_post_disp = "";
	/** ��ǰ�ڵ� */
	private String curr_node = "";

	/** ����ʱ�� */
	private Date create_dt = new Date();
	/** �ύ�ڵ� */
	private String orig_node = "";

	private String isstaff="";
	/** ���ֶ���������(��ԭ����isstaff���Ƹ�Ϊis_grey):�Ƿ���ƶ������� add by lzb 2014-05-19*/
	private String is_grey = "";
//	=======================================================
	/** ����ʱ�� */
	private String create_dt_disp = "";
	/** ��ǰ������ת��¼ */
//	private T07_app_movefate T07_app_movefate = new T07_app_movefate(); 
	
	/** ��ǰ����Ԫ���ݼ�¼ */
	private T07_swith rm_switch = new T07_swith();
	
	/** ��ǰҵ���ԭʼ������� */
//	private T07_case_application T07_application = new T07_case_application();
	
	/** ��ǰ�ڵ�ĸ����б� */
	private ArrayList attach_list = new ArrayList();
	
	/** ����̨��Ϣ���ڽ��빤��̨ʱ��� *************************/
	
	/*****************************************************/
	
	/** ��ǰ�Ĺ����������,�ڵ��ĳ��������ʱ��� */
	private T07_n_task T07_n_task = new T07_n_task();
    
	/** ��ǰ�Ĺ���ID */
	private String task_id = "";
	
	/** ��ǰ�Ĺ���״̬(��ɺ�) */ 
	private String task_status = "";
	/*****************************************************/
	
	/** ����ID���ڵ��ĳ�������ʱ��� */
	private String oper_id = "";
	private Date case_tran_mindate=new Date();
	private Date case_tran_maxdate=new Date();
	private Date case_end_date=new Date();
	private String case_tran_mindate_disp="";
	private String case_tran_maxdate_disp="";
	private String case_end_date_disp="";
	private String casesearchtime="";//��ǰ����ʷ����
	
	/** �Ƿ������ */
	private String is_menu = "";
	/** �Ƿ������ */
	private String is_menu_disp = "";
	
	private Long trans_count=new Long(0); //���׼�¼��
	



	private String trans_amt = "";  //���׽��
	private String stcr = ""; //������������
	private String party_class_cd="";
	
	private String application_advice = ""; //�����������
	private String colorflag="";
	
	/******************** �Ե�************/
	/** ������Դ1���� 2ģ�� 3������*/
	private String case_source = "";
//==================================================================//
	public String getColorflag() {
		return colorflag;
	}




	public void setColorflag(String colorflag) {
		this.colorflag = colorflag;
	}




	public String getParty_class_cd() {
		return party_class_cd;
	}




	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}




	public Date getCase_end_date() {
		return case_end_date;
	}




	public void setCase_end_date(Date case_end_date) {
		this.case_end_date = case_end_date;
	}




	public String getCase_end_date_disp() {
		return case_end_date_disp;
	}




	public void setCase_end_date_disp(String case_end_date_disp) {
		this.case_end_date_disp = case_end_date_disp;
	}




	public Date getCase_tran_maxdate() {
		return case_tran_maxdate;
	}




	public void setCase_tran_maxdate(Date case_tran_maxdate) {
		this.case_tran_maxdate = case_tran_maxdate;
	}




	public String getCase_tran_maxdate_disp() {
		return case_tran_maxdate_disp;
	}




	public void setCase_tran_maxdate_disp(String case_tran_maxdate_disp) {
		this.case_tran_maxdate_disp = case_tran_maxdate_disp;
	}




	public Date getCase_tran_mindate() {
		return case_tran_mindate;
	}




	public void setCase_tran_mindate(Date case_tran_mindate) {
		this.case_tran_mindate = case_tran_mindate;
	}




	public String getCase_tran_mindate_disp() {
		return case_tran_mindate_disp;
	}




	public void setCase_tran_mindate_disp(String case_tran_mindate_disp) {
		this.case_tran_mindate_disp = case_tran_mindate_disp;
	}




	public CreditTask() {
		
	}




	public String getFlow_id() {
		return flow_id;
	}

	public void setFlow_id(String flow_id) {
		this.flow_id = flow_id;
	}

	public String getFlow_type() {
		return flow_type;
	}

	public void setFlow_type(String flow_type) {
		this.flow_type = flow_type;
	}

	public String getNode_id() {
		return node_id;
	}

	public void setNode_id(String node_id) {
		this.node_id = node_id;
	}

	public String getPost_id() {
		return post_id;
	}

	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}


	public String getOper_id() {
		return oper_id;
	}

	public void setOper_id(String oper_id) {
		this.oper_id = oper_id;
	}

	
	public String getTask_status() {
		return task_status;
	}

	public void setTask_status(String task_status) {
		this.task_status = task_status;
	}

	public String getTask_id() {
		return task_id;
	}

	public void setTask_id(String task_id) {
		this.task_id = task_id;
	}

	public T07_n_task getT07_n_task() {
		return T07_n_task;
	}




	public void setT07_n_task(T07_n_task t07_n_task) {
		T07_n_task = t07_n_task;
	}




	public T07_swith getRm_switch() {
		return rm_switch;
	}

	public void setRm_switch(T07_swith rm_switch) {
		this.rm_switch = rm_switch;
	}

	public ArrayList getAttach_list() {
		return attach_list;
	}

	public void setAttach_list(ArrayList attach_list) {
		this.attach_list = attach_list;
	}

	public String getTask_cd() {
		return task_cd;
	}

	public void setTask_cd(String task_cd) {
		this.task_cd = task_cd;
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

	public String getBehind_ind() {
		return behind_ind;
	}

	public void setBehind_ind(String behind_ind) {
		this.behind_ind = behind_ind;
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

	public String getCast_type() {
		return cast_type;
	}

	public void setCast_type(String cast_type) {
		this.cast_type = cast_type;
	}

	public Date getCreate_dt() {
		return create_dt;
	}

	public void setCreate_dt(Date create_dt) {
		this.create_dt = create_dt;
	}

	public String getCreate_dt_disp() {
		return create_dt_disp;
	}

	public void setCreate_dt_disp(String create_dt_disp) {
		this.create_dt_disp = create_dt_disp;
	}

	public String getCurr_node() {
		return curr_node;
	}

	public void setCurr_node(String curr_node) {
		this.curr_node = curr_node;
	}

	public String getCurr_oper_id() {
		return curr_oper_id;
	}

	public void setCurr_oper_id(String curr_oper_id) {
		this.curr_oper_id = curr_oper_id;
	}

	public String getCurr_operator() {
		return curr_operator;
	}

	public void setCurr_operator(String curr_operator) {
		this.curr_operator = curr_operator;
	}

	public String getCurr_org() {
		return curr_org;
	}

	public void setCurr_org(String curr_org) {
		this.curr_org = curr_org;
	}

	public String getCurr_post() {
		return curr_post;
	}

	public void setCurr_post(String curr_post) {
		this.curr_post = curr_post;
	}

	public String getCurrent_ind() {
		return current_ind;
	}

	public void setCurrent_ind(String current_ind) {
		this.current_ind = current_ind;
	}

	public String getDate_status_cd() {
		return date_status_cd;
	}

	public void setDate_status_cd(String date_status_cd) {
		this.date_status_cd = date_status_cd;
	}

	public String getInit_ind() {
		return init_ind;
	}

	public void setInit_ind(String init_ind) {
		this.init_ind = init_ind;
	}

	public Date getLast_upd_dt() {
		return last_upd_dt;
	}

	public void setLast_upd_dt(Date last_upd_dt) {
		this.last_upd_dt = last_upd_dt;
	}

	public String getLast_upd_dt_disp() {
		return last_upd_dt_disp;
	}

	public void setLast_upd_dt_disp(String last_upd_dt_disp) {
		this.last_upd_dt_disp = last_upd_dt_disp;
	}

	public String getLast_upd_user() {
		return last_upd_user;
	}

	public void setLast_upd_user(String last_upd_user) {
		this.last_upd_user = last_upd_user;
	}

	public String getOper_type() {
		return oper_type;
	}

	public void setOper_type(String oper_type) {
		this.oper_type = oper_type;
	}

	public String getOrig_node() {
		return orig_node;
	}

	public void setOrig_node(String orig_node) {
		this.orig_node = orig_node;
	}

	public String getOrig_operator() {
		return orig_operator;
	}

	public void setOrig_operator(String orig_operator) {
		this.orig_operator = orig_operator;
	}

	public String getOrig_post() {
		return orig_post;
	}

	public void setOrig_post(String orig_post) {
		this.orig_post = orig_post;
	}

	public String getOrig_status_cd() {
		return orig_status_cd;
	}

	public void setOrig_status_cd(String orig_status_cd) {
		this.orig_status_cd = orig_status_cd;
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

	public String getStatus_cd() {
		return status_cd;
	}

	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}

	public Long getSeq_num() {
		return seq_num;
	}

	public void setSeq_num(Long seq_num) {
		this.seq_num = seq_num;
	}

	public String getApplication_num() {
		return application_num;
	}

	public void setApplication_num(String application_num) {
		this.application_num = application_num;
	}




	public void setRecheck_num(Long recheck_num) {
		this.recheck_num = recheck_num;
	}




	public Long getRecheck_num() {
		return recheck_num;
	}




	public String getCurr_cd() {
		return curr_cd;
	}




	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}




	public String getAlert_level() {
		return alert_level;
	}




	public void setAlert_level(String alert_level) {
		this.alert_level = alert_level;
	}




	public String getAlert_level_disp() {
		return alert_level_disp;
	}




	public void setAlert_level_disp(String alert_level_disp) {
		this.alert_level_disp = alert_level_disp;
	}




	public String getCase_kind_disp() {
		return case_kind_disp;
	}




	public void setCase_kind_disp(String case_kind_disp) {
		this.case_kind_disp = case_kind_disp;
	}




	public String getCast_type_disp() {
		return cast_type_disp;
	}




	public void setCast_type_disp(String cast_type_disp) {
		this.cast_type_disp = cast_type_disp;
	}




	public String getAction_descrip() {
		return action_descrip;
	}




	public void setAction_descrip(String action_descrip) {
		this.action_descrip = action_descrip;
	}




	public String getAction_explain() {
		return action_explain;
	}




	public void setAction_explain(String actionExplain) {
		action_explain = actionExplain;
	}




	public String getTake_action() {
		return take_action;
	}




	public void setTake_action(String take_action) {
		this.take_action = take_action;
	}




	public String getValidate_ind() {
		return validate_ind;
	}




	public void setValidate_ind(String validate_ind) {
		this.validate_ind = validate_ind;
	}




	public String getValidate_ind_disp() {
		return validate_ind_disp;
	}




	public void setValidate_ind_disp(String validate_ind_disp) {
		this.validate_ind_disp = validate_ind_disp;
	}




	public String getCurr_post_disp() {
		return curr_post_disp;
	}




	public void setCurr_post_disp(String curr_post_disp) {
		this.curr_post_disp = curr_post_disp;
	}




	public String getApp_org_id_disp() {
		return app_org_id_disp;
	}




	public void setApp_org_id_disp(String app_org_id_disp) {
		this.app_org_id_disp = app_org_id_disp;
	}




	public String getOrig_post_disp() {
		return orig_post_disp;
	}




	public void setOrig_post_disp(String orig_post_disp) {
		this.orig_post_disp = orig_post_disp;
	}




	public String getCase_level_disp() {
		return case_level_disp;
	}




	public void setCase_level_disp(String case_level_disp) {
		this.case_level_disp = case_level_disp;
	}




	public String getApp_state_cd_disp() {
		return app_state_cd_disp;
	}




	public void setApp_state_cd_disp(String app_state_cd_disp) {
		this.app_state_cd_disp = app_state_cd_disp;
	}




	public String getCurr_cd_disp() {
		return curr_cd_disp;
	}




	public void setCurr_cd_disp(String curr_cd_disp) {
		this.curr_cd_disp = curr_cd_disp;
	}




	public String getCasesearchtime() {
		return casesearchtime;
	}




	public void setCasesearchtime(String casesearchtime) {
		this.casesearchtime = casesearchtime;
	}




	public String getIs_menu() {
		return is_menu;
	}




	public void setIs_menu(String is_menu) {
		this.is_menu = is_menu;
	}




	public String getIs_menu_disp() {
		return is_menu_disp;
	}




	public void setIs_menu_disp(String is_menu_disp) {
		this.is_menu_disp = is_menu_disp;
	}












	public String getStcr() {
		return stcr;
	}




	public void setStcr(String stcr) {
		this.stcr = stcr;
	}




	public String getApplication_advice() {
		return application_advice;
	}




	public void setApplication_advice(String application_advice) {
		this.application_advice = application_advice;
	}




	public String getIsstaff() {
		return isstaff;
	}




	public void setIsstaff(String isstaff) {
		this.isstaff = isstaff;
	}




	public String getIs_grey() {
		return is_grey;
	}




	public void setIs_grey(String isGrey) {
		is_grey = isGrey;
	}




	public String getCase_source() {
		return case_source;
	}




	public void setCase_source(String caseSource) {
		case_source = caseSource;
	}
	
	public Long getTrans_count() {
		return trans_count;
	}




	public void setTrans_count(Long transCount) {
		trans_count = transCount;
	}




	public String getTrans_amt() {
		return trans_amt;
	}




	public void setTrans_amt(String transAmt) {
		trans_amt = transAmt;
	}





}
