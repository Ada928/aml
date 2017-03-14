/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2012-08-30] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.risk_rate.controller;                
                                                  
/**
* <p>T37_party_resultActionForm.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
                                              
public class T37_party_resultActionForm extends ActionForm {
                                              
/** �������״̬��0:ϵͳ����;1:�ϱ�δ���;2:��˲�ͨ��;3:���ͨ��,4:�����ϱ��Ѵ���,5:������ͨ��,6:����ͨ��  */
private String status_cd = "";
private String status_cd_disp = "";
/** ģ����� */
private String templatekey = "";
private String templatename = "";
/** ����״̬ 0:δ���� 1:�ѵ��� */
private String export_status = "";
/** �ͻ��� */
private String party_id = "";
/** �˹��������� */
private Date modifydate;
private Date modifydate_end;
/** ģ������ */
private String temptype = "";
/** �����Ƿ��˹����� */
private String lastcheckflag = "";
/** �Ƿ��˹�������0����  1���� */
private String modify_cd = "";
/** ���շ��յȼ� */
private String levelkey = "";
/** ���� */
private String granularity = "";
/** �������� */
private Date statistic_dt;
/** ����ʱ�� */
private Date reportdt = new Date();
/** �ͻ����� */
private String organkey = "";
private String organkey_s = "";
private String organ_name = "";
/** �����ȼ� */
private String fristappralevel = "";
private String fristappralevel_disp = "";
/** ԭ�ͻ��� */
private String host_cust_id = "";
/** �ϴ�������� */
private String lastlevelkey = "";
/** �ͻ����� */
private String party_class_cd = "";
/** �����ȼ� */
private String emendationlevel = "";
private String emendationlevel_disp = "";
private String level_before_adjust="";
/** ��ǰ��λ */
private String curr_post = "";
/** �ͻ����� */
private String party_chn_name = "";
/** ������ */
private String modifier = "";
/** �������� */
private Date create_dt;
private Date create_dt_end;
/** ���۽��KEY */
private String resulekey = "";
/** У��ԭ�� */
private String reason = "";
//=======================================================
/** �˹��������� */
private String modifydate_disp = "";
private String modifydate_disp_end = "";
/** �������� */
private String statistic_dt_disp = "";
private String statistic_dt_disp_end = "";
/** ����ʱ�� */
private String reportdt_disp = "";
/** �������� */
private String create_dt_disp = "";
/** �÷� */
private String score = "";
private String lastscore="";
/** �ύ�� */
private String audit_user ="";
/**�˻ر༭��ԭ�� */
private String return_reason = "";
/** �ύ���� */
private Date audit_dt;
/** ����� */
private String check_user = "";
/** ������� */
private Date check_dt;
/** ������ */
private String rcheck_user = "";
/** �������� */
private Date rcheck_dt;
private String rcheck_dt_disp = "";
private String rcheck_dt_disp_end = "";
/** ����ʱ�� */
private Date  dealmax_dt;
/** �´��������� */
private Date  nextstatistic_dt;
/** �´���������ʱ�� */
private Date  nextdealmax_dt;

/** ��������  1���¿��� 2�����ں˲� 3���˹��˲�*/
private String tempcategory = ""; 
private String tempcategory_s = "";
private String tempcategory_c ="";
private String create_dt_disp_end = "";
private String order = "";
private String orderby = "";
private String post_id = "";
private String node_id = "";
private String oper_id = "";
private String flow_id = "";
private String[] rkeys;

private String gskey ="";
private String gsname ="";
private String gsrm ="";
/** ָ����� */
private String indickey="";
/** ָ������ */
private String indicname="";
/** ָ��ֵ */
private String indicval="";
/** �����ٵ����ͱ���ҳ��*/
private String marked="";
/** �����¿��Ͷ��ڵĵ�����۲���*/
private String changeflag = "";
private String check_type ="";
/** Э��״̬��0 δ���� 1��Э�� 2������ 3 ��Э�� 4 �˻�**/
private String hcheck_status ="";
private String hcheck_status_disp ="";
/** �˻���**/
private String return_user = "";
/** �˻�����**/
private Date return_dt;
/** ��Դ 1:ϵͳ,2:�ٵ���**/
private String rate_source = "";
/** ��ˡ�����״̬ 1:����,2:����**/
private String opera_status = "";
/** ��ֵ�Ƿ���� */
private String scoremodi_flag = "";
/** ҳ�渴ѡ��*/
private String[] selectedResulekey = {};
/** �������� */
private String exportType;
/** ���۽��KEY */
private String currresulekey = "";
private String currtemplatekey = "";
public String getCurrtemplatekey() {
	return currtemplatekey;
}
public void setCurrtemplatekey(String currtemplatekey) {
	this.currtemplatekey = currtemplatekey;
}
public String getCurrresulekey() {
	return currresulekey;
}
public void setCurrresulekey(String currresulekey) {
	this.currresulekey = currresulekey;
}
	//===============================================================================
    /**                   
     * ���캯��           
     */                   
    public T37_party_resultActionForm() {    
    }              
  //===============================================================================
public void setStatus_cd(String status_cdStr){
this.status_cd = status_cdStr;
}
public String getStatus_cd(){
return this.status_cd;
}

public String getStatus_cd_disp() {
	return status_cd_disp;
}
public void setStatus_cd_disp(String statusCdDisp) {
	status_cd_disp = statusCdDisp;
}
public void setTemplatekey(String templatekeyStr){
this.templatekey = templatekeyStr;
}
public String getTemplatekey(){
return this.templatekey;
}

public String getTemplatename() {
	return templatename;
}
public void setTemplatename(String templatename) {
	this.templatename = templatename;
}
public String getScore() {
	return score;
}
public void setScore(String score) {
	this.score = score;
}

public String getLastscore() {
	return lastscore;
}
public void setLastscore(String lastscore) {
	this.lastscore = lastscore;
}
public void setExport_status(String export_statusStr){
this.export_status = export_statusStr;
}
public String getExport_status(){
return this.export_status;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setModifydate(Date modifydateStr){
this.modifydate = modifydateStr;
}
public Date getModifydate(){
return this.modifydate;
}

public void setTemptype(String temptypeStr){
this.temptype = temptypeStr;
}
public String getTemptype(){
return this.temptype;
}

public void setLastcheckflag(String lastcheckflagStr){
this.lastcheckflag = lastcheckflagStr;
}
public String getLastcheckflag(){
return this.lastcheckflag;
}

public void setModify_cd(String modify_cdStr){
this.modify_cd = modify_cdStr;
}
public String getModify_cd(){
return this.modify_cd;
}

public void setLevelkey(String levelkeyStr){
this.levelkey = levelkeyStr;
}
public String getLevelkey(){
return this.levelkey;
}

public void setGranularity(String granularityStr){
this.granularity = granularityStr;
}
public String getGranularity(){
return this.granularity;
}

public String getLevel_before_adjust() {
	return level_before_adjust;
}
public void setLevel_before_adjust(String levelBeforeAdjust) {
	level_before_adjust = levelBeforeAdjust;
}
public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setReportdt(Date reportdtStr){
this.reportdt = reportdtStr;
}
public Date getReportdt(){
return this.reportdt;
}

public String getReturn_reason() {
	return return_reason;
}
public void setReturn_reason(String returnReason) {
	return_reason = returnReason;
}
public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public String getOrgankey_s() {
	return organkey_s;
}
public void setOrgankey_s(String organkeyS) {
	organkey_s = organkeyS;
}
public void setFristappralevel(String fristappralevelStr){
this.fristappralevel = fristappralevelStr;
}
public String getFristappralevel(){
return this.fristappralevel;
}

public String getFristappralevel_disp() {
	return fristappralevel_disp;
}
public void setFristappralevel_disp(String fristappralevelDisp) {
	fristappralevel_disp = fristappralevelDisp;
}
public void setHost_cust_id(String host_cust_idStr){
this.host_cust_id = host_cust_idStr;
}
public String getHost_cust_id(){
return this.host_cust_id;
}

public String getReason() {
	return reason;
}
public void setReason(String reason) {
	this.reason = reason;
}
public void setLastlevelkey(String lastlevelkeyStr){
this.lastlevelkey = lastlevelkeyStr;
}
public String getLastlevelkey(){
return this.lastlevelkey;
}

public void setParty_class_cd(String party_class_cdStr){
this.party_class_cd = party_class_cdStr;
}
public String getParty_class_cd(){
return this.party_class_cd;
}

public void setEmendationlevel(String emendationlevelStr){
this.emendationlevel = emendationlevelStr;
}
public String getEmendationlevel(){
return this.emendationlevel;
}

public String getEmendationlevel_disp() {
	return emendationlevel_disp;
}
public void setEmendationlevel_disp(String emendationlevelDisp) {
	emendationlevel_disp = emendationlevelDisp;
}
public void setCurr_post(String curr_postStr){
this.curr_post = curr_postStr;
}
public String getCurr_post(){
return this.curr_post;
}

public void setParty_chn_name(String party_chn_nameStr){
this.party_chn_name = party_chn_nameStr;
}
public String getParty_chn_name(){
return this.party_chn_name;
}

public void setModifier(String modifierStr){
this.modifier = modifierStr;
}
public String getModifier(){
return this.modifier;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setResulekey(String resulekeyStr){
this.resulekey = resulekeyStr;
}
public String getResulekey(){
return this.resulekey;
}

//=======================================================
public void setModifydate_disp(String modifydate_dispStr){
this.modifydate_disp = modifydate_dispStr;
}
public String getModifydate_disp(){
return this.modifydate_disp;
}

public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

public void setReportdt_disp(String reportdt_dispStr){
this.reportdt_disp = reportdt_dispStr;
}
public String getReportdt_disp(){
return this.reportdt_disp;
}

public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

public String getModifydate_disp_end() {
	return modifydate_disp_end;
}
public void setModifydate_disp_end(String modifydateDispEnd) {
	modifydate_disp_end = modifydateDispEnd;
}
public String getStatistic_dt_disp_end() {
	return statistic_dt_disp_end;
}
public void setStatistic_dt_disp_end(String statisticDtDispEnd) {
	statistic_dt_disp_end = statisticDtDispEnd;
}
public String getCreate_dt_disp_end() {
	return create_dt_disp_end;
}
public void setCreate_dt_disp_end(String createDtDispEnd) {
	create_dt_disp_end = createDtDispEnd;
}

	public String getOrgan_name() {
	return organ_name;
}
public void setOrgan_name(String organName) {
	organ_name = organName;
}

	public String getOrderby() {
	return orderby;
}
public void setOrderby(String orderby) {
	this.orderby = orderby;
}

	public String[] getRkeys() {
	return rkeys;
}
public void setRkeys(String[] rkeys) {
	this.rkeys = rkeys;
}

	public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}

	public String getPost_id() {
	return post_id;
}
public void setPost_id(String postId) {
	post_id = postId;
}

	public String getNode_id() {
	return node_id;
}
public void setNode_id(String nodeId) {
	node_id = nodeId;
}
public String getOper_id() {
	return oper_id;
}
public void setOper_id(String operId) {
	oper_id = operId;
}

	public String getFlow_id() {
	return flow_id;
}
public void setFlow_id(String flowId) {
	flow_id = flowId;
}
	public String getGskey() {
	return gskey;
}
public void setGskey(String gskey) {
	this.gskey = gskey;
}
public String getGsname() {
	return gsname;
}
public void setGsname(String gsname) {
	this.gsname = gsname;
}
public String getGsrm() {
	return gsrm;
}
public void setGsrm(String gsrm) {
	this.gsrm = gsrm;
}
	public String getTempcategory() {
	return tempcategory;
}
	
public String getTempcategory_s() {
		return tempcategory_s;
	}
	public void setTempcategory_s(String tempcategoryS) {
		tempcategory_s = tempcategoryS;
	}
	
public String getTempcategory_c() {
		return tempcategory_c;
	}
	public void setTempcategory_c(String tempcategoryC) {
		tempcategory_c = tempcategoryC;
	}
public String getIndickey() {
		return indickey;
	}
	public void setIndickey(String indickey) {
		this.indickey = indickey;
	}
	public String getIndicname() {
		return indicname;
	}
	public void setIndicname(String indicname) {
		this.indicname = indicname;
	}
	public String getIndicval() {
		return indicval;
	}
	public void setIndicval(String indicval) {
		this.indicval = indicval;
	}
public String getMarked() {
		return marked;
	}
	public void setMarked(String marked) {
		this.marked = marked;
	}
public void setTempcategory(String tempcategory) {
	this.tempcategory = tempcategory;
}

	public String getChangeflag() {
	return changeflag;
}
public void setChangeflag(String changeflag) {
	this.changeflag = changeflag;
}
public String getCheck_type() {
	return check_type;
}
public void setCheck_type(String checkType) {
	check_type = checkType;
}

	public String getHcheck_status() {
	return hcheck_status;
}
public void setHcheck_status(String hcheckStatus) {
	hcheck_status = hcheckStatus;
}
public String getHcheck_status_disp() {
	return hcheck_status_disp;
}
public void setHcheck_status_disp(String hcheckStatusDisp) {
	hcheck_status_disp = hcheckStatusDisp;
}
public String getReturn_user() {
	return return_user;
}
public void setReturn_user(String returnUser) {
	return_user = returnUser;
}
public Date getReturn_dt() {
	return return_dt;
}
public void setReturn_dt(Date returnDt) {
	return_dt = returnDt;
}
	public String getAudit_user() {
	return audit_user;
}
public void setAudit_user(String auditUser) {
	audit_user = auditUser;
}
public Date getAudit_dt() {
	return audit_dt;
}
public void setAudit_dt(Date auditDt) {
	audit_dt = auditDt;
}
public String getCheck_user() {
	return check_user;
}
public void setCheck_user(String checkUser) {
	check_user = checkUser;
}
public Date getCheck_dt() {
	return check_dt;
}
public void setCheck_dt(Date checkDt) {
	check_dt = checkDt;
}
public String getRcheck_user() {
	return rcheck_user;
}
public void setRcheck_user(String rcheckUser) {
	rcheck_user = rcheckUser;
}
public Date getRcheck_dt() {
	return rcheck_dt;
}
public void setRcheck_dt(Date rcheckDt) {
	rcheck_dt = rcheckDt;
}

public String getRcheck_dt_disp() {
	return rcheck_dt_disp;
}
public void setRcheck_dt_disp(String rcheckDtDisp) {
	rcheck_dt_disp = rcheckDtDisp;
}
public String getRcheck_dt_disp_end() {
	return rcheck_dt_disp_end;
}
public void setRcheck_dt_disp_end(String rcheckDtDispEnd) {
	rcheck_dt_disp_end = rcheckDtDispEnd;
}
public Date getDealmax_dt() {
	return dealmax_dt;
}
public void setDealmax_dt(Date dealmaxDt) {
	dealmax_dt = dealmaxDt;
}
public Date getNextstatistic_dt() {
	return nextstatistic_dt;
}
public void setNextstatistic_dt(Date nextstatisticDt) {
	nextstatistic_dt = nextstatisticDt;
}
public Date getNextdealmax_dt() {
	return nextdealmax_dt;
}
public void setNextdealmax_dt(Date nextdealmaxDt) {
	nextdealmax_dt = nextdealmaxDt;
}

	public String getRate_source() {
	return rate_source;
}
public void setRate_source(String rateSource) {
	rate_source = rateSource;
}
public String getOpera_status() {
	return opera_status;
}
public void setOpera_status(String operaStatus) {
	opera_status = operaStatus;
}

	public String getScoremodi_flag() {
	return scoremodi_flag;
}
public void setScoremodi_flag(String scoremodiFlag) {
	scoremodi_flag = scoremodiFlag;
}
	//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public void setModifydate_end(Date modifydate_end) {
		this.modifydate_end = modifydate_end;
	}
	public Date getModifydate_end() {
		return modifydate_end;
	}
	public void setCreate_dt_end(Date create_dt_end) {
		this.create_dt_end = create_dt_end;
	}
	public Date getCreate_dt_end() {
		return create_dt_end;
	}
	public void setSelectedResulekey(String[] selectedResulekey) {
		this.selectedResulekey = selectedResulekey;
	}
	public String[] getSelectedResulekey() {
		return selectedResulekey;
	}
	public void setExportType(String exportType) {
		this.exportType = exportType;
	}
	public String getExportType() {
		return exportType;
	}
}

