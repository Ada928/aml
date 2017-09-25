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

package com.ist.aml.risk_rate.dto;                
                                                  
/**
* <p>T37_level_audit.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T37_level_audit extends BaseDTO {
                                              
/** �ύ��λ */
private String post_id = "";
private String post_id_disp = "";
/** �������� */
private Date statistic_dt = new Date();

/** �������KEY */
private String rsltkey = "";
/** ���ո�λ */
private String res_post_id = "";
/** ��������յȼ� */
private String level_after_adjust = "";
private String level_after_adjust_disp = "";
/** �ͻ��� */
private String party_id = "";
/** �ͻ����� */
private String organkey = "";
/** ������ */
private String last_upd_user = "";
/** ������� */
private String adjust_reason = "";

/** ����ǰ���յȼ� */
private String level_before_adjust = "";
private String level_before_adjust_disp = "";
/** �������� */
private Date last_upd_dt = new Date();

/** ������� */
private String audit_no = "";
/** ���� */
private String granularity = "";
//=======================================================
/** �������� */
private String statistic_dt_disp = "";
private String statistic_dt_disp_end = "";

/** �������� */
private String last_upd_dt_disp = "";
private String last_upd_dt_disp_end = "";


/*
 * �����ĸ�ʱ���ǵ��������յȼ��ͻ���ѯ����Ҫ�õ���
 * ��Ϊ��Ҫ��ʼ��Ϊnew Date()���ұ���ΪDate���ͣ����ڴ����¶���
 */
private Date statistic_dt_start;
private Date statistic_dt_end;  
private Date last_upd_dt_start;
private Date last_upd_dt_end;  

//���������յȼ��ͻ��������ֶ�
private String orderby = "";
private String order = "";

public String getOrderby() {
	return orderby;
}
public void setOrderby(String orderby) {
	this.orderby = orderby;
}
private String tablename="";

                                              
    public String getTablename() {
	return tablename;
}
public void setTablename(String tablename) {
	this.tablename = tablename;
}
	/**                   
     * ���캯��           
     */                   
    public T37_level_audit() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setStatistic_dt(Date statistic_dtStr){
this.statistic_dt = statistic_dtStr;
}
public Date getStatistic_dt(){
return this.statistic_dt;
}

public void setRsltkey(String rsltkeyStr){
this.rsltkey = rsltkeyStr;
}
public String getRsltkey(){
return this.rsltkey;
}

public void setRes_post_id(String res_post_idStr){
this.res_post_id = res_post_idStr;
}
public String getRes_post_id(){
return this.res_post_id;
}

public void setLevel_after_adjust(String level_after_adjustStr){
this.level_after_adjust = level_after_adjustStr;
}
public String getLevel_after_adjust(){
return this.level_after_adjust;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public String getOrgankey() {
	return organkey;
}
public void setOrgankey(String organkey) {
	this.organkey = organkey;
}
public void setLast_upd_user(String last_upd_userStr){
this.last_upd_user = last_upd_userStr;
}
public String getLast_upd_user(){
return this.last_upd_user;
}

public void setAdjust_reason(String adjust_reasonStr){
this.adjust_reason = adjust_reasonStr;
}
public String getAdjust_reason(){
return this.adjust_reason;
}

public void setLevel_before_adjust(String level_before_adjustStr){
this.level_before_adjust = level_before_adjustStr;
}
public String getLevel_before_adjust(){
return this.level_before_adjust;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public Date getStatistic_dt_start() {
	return statistic_dt_start;
}
public void setStatistic_dt_start(Date statistic_dt_start) {
	this.statistic_dt_start = statistic_dt_start;
}
public Date getLast_upd_dt_start() {
	return last_upd_dt_start;
}
public void setLast_upd_dt_start(Date last_upd_dt_start) {
	this.last_upd_dt_start = last_upd_dt_start;
}
public void setAudit_no(String audit_noStr){
this.audit_no = audit_noStr;
}



public Date getStatistic_dt_end() {
	return statistic_dt_end;
}
public void setStatistic_dt_end(Date statistic_dt_end) {
	this.statistic_dt_end = statistic_dt_end;
}
public Date getLast_upd_dt_end() {
	return last_upd_dt_end;
}
public void setLast_upd_dt_end(Date last_upd_dt_end) {
	this.last_upd_dt_end = last_upd_dt_end;
}
public String getAudit_no(){
return this.audit_no;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getGranularity() {
	return granularity;
}
public void setGranularity(String granularity) {
	this.granularity = granularity;
}
public String getPost_id_disp() {
	return post_id_disp;
}
public void setPost_id_disp(String postIdDisp) {
	post_id_disp = postIdDisp;
}
public String getLevel_after_adjust_disp() {
	return level_after_adjust_disp;
}
public void setLevel_after_adjust_disp(String level_after_adjust_disp) {
	this.level_after_adjust_disp = level_after_adjust_disp;
}
public String getLevel_before_adjust_disp() {
	return level_before_adjust_disp;
}
public void setLevel_before_adjust_disp(String level_before_adjust_disp) {
	this.level_before_adjust_disp = level_before_adjust_disp;
}
public String getOrder() {
	return order;
}
public void setOrder(String order) {
	this.order = order;
}
public String getStatistic_dt_disp_end() {
	return statistic_dt_disp_end;
}
public void setStatistic_dt_disp_end(String statistic_dt_disp_end) {
	this.statistic_dt_disp_end = statistic_dt_disp_end;
}
public String getLast_upd_dt_disp_end() {
	return last_upd_dt_disp_end;
}
public void setLast_upd_dt_disp_end(String last_upd_dt_disp_end) {
	this.last_upd_dt_disp_end = last_upd_dt_disp_end;
}
}

