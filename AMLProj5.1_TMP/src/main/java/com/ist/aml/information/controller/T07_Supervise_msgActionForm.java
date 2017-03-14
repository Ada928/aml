/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2009/06/29 08:49:24 xzq Exp $
* Created [2009-06-29] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.information.controller;                
                                                  
/**
* <p>T07_SUPervise_msgActionForm.java</p>
* <p>Description: </p>
* @author $Author: xzq $
* @version $Revision: 1.1.1.1 $ $Date: 2009/06/29 08:49:24 $
*/

import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_Supervise_msgActionForm extends ActionForm {
                                              
/** ������� */
private String msg_name = "";
private String msg_name_s = "";
/** ���췽ʽ: 0 ϵͳ,1 �˹� */
private String msg_mode = "";
/** ��������: 1 ����ά��, 2 ���ײ�¼, 3 �ͻ���¼, 4 ɸѡ���洦�� */
private String msg_type = "";
private String msg_type_s = "";
/** ���ո�λ��P0102 �༭; P0104 ��������; P0105 ��ҶԹ�����; P0106 ��Ҷ�˽����; P9999 ����ά�� */
private String receipt_post = "";
/** ������� */
private String msg_org = "";
/** ����������� */
private String msg_org_name = "";
private String msg_org_name_s = "";
/** �����û� */
private String create_user = "";
/** �������� */
private String create_dt ="";
/** ��ʼ���� */
private String start_dt ="";
/** �������� */
private String end_dt = "";
/** �������� */
private String msg_content = "";
/** ״̬: 1 �Ѷ�,2 δ�� */
private String msg_state = "";
/** ���ջ��� */
private String receipt_org = "";
/** ����ID */
private String msg_id = "";

private String voer_dt="";//����ʱ��
private String status="" ;//0��Ч 1��Ч
private String case_type_s="";
private String case_type="";
private String party_class_cd="";

//=======================================================
/** �������� */
private String create_dt_disp = "";
/** ��ʼ���� */
private String start_dt_disp = "";
/** �������� */
private String end_dt_disp = "";
/** ״̬: 1 �Ѷ�,2 δ�� */
private String msg_state_disp = "";

private String[] msg_ids = {};
private String receipt_org_s = "";
private String party_class_cd_s="";
private String case_type_s1 = "";
private String dealadvise="";
private String deal_user="";
private String deal_dt="";
private String post_id="";

    /**                   
     * ���캯��           
     */                   
    public T07_Supervise_msgActionForm() {    
    }                     
public void setMsg_name(String msg_nameStr){
this.msg_name = msg_nameStr;
}
public String getMsg_name(){
return this.msg_name;
}

public void setMsg_type(String msg_typeStr){
this.msg_type = msg_typeStr;
}
public String getMsg_type(){
return this.msg_type;
}

public void setMsg_org(String msg_orgStr){
this.msg_org = msg_orgStr;
}
public String getMsg_org(){
return this.msg_org;
}

public void setCreate_user(String create_userStr){
this.create_user = create_userStr;
}
public String getCreate_user(){
return this.create_user;
}


public void setMsg_content(String msg_contentStr){
this.msg_content = msg_contentStr;
}
public String getMsg_content(){
return this.msg_content;
}

public void setMsg_state(String msg_stateStr){
this.msg_state = msg_stateStr;
}
public String getMsg_state(){
return this.msg_state;
}

public void setReceipt_org(String receipt_orgStr){
this.receipt_org = receipt_orgStr;
}
public String getReceipt_org(){
return this.receipt_org;
}

public void setMsg_id(String msg_idStr){
this.msg_id = msg_idStr;
}
public String getMsg_id(){
return this.msg_id;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }

	public String getEnd_dt_disp() {
		return end_dt_disp;
	}
	public void setEnd_dt_disp(String end_dt_disp) {
		this.end_dt_disp = end_dt_disp;
	}
	public String[] getMsg_ids() {
		return msg_ids;
	}
	public void setMsg_ids(String[] msg_ids) {
		this.msg_ids = msg_ids;
	}
	public String getMsg_state_disp() {
		return msg_state_disp;
	}
	public void setMsg_state_disp(String msg_state_disp) {
		this.msg_state_disp = msg_state_disp;
	}

	public String getStart_dt_disp() {
		return start_dt_disp;
	}
	public void setStart_dt_disp(String start_dt_disp) {
		this.start_dt_disp = start_dt_disp;
	}
	public String getMsg_org_name() {
		return msg_org_name;
	}
	public void setMsg_org_name(String msg_org_name) {
		this.msg_org_name = msg_org_name;
	}
	public String getMsg_mode() {
		return msg_mode;
	}
	public void setMsg_mode(String msg_mode) {
		this.msg_mode = msg_mode;
	}

	public String getReceipt_post() {
		return receipt_post;
	}
	public void setReceipt_post(String receipt_post) {
		this.receipt_post = receipt_post;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public String getEnd_dt() {
		return end_dt;
	}
	public void setEnd_dt(String end_dt) {
		this.end_dt = end_dt;
	}
	public String getStart_dt() {
		return start_dt;
	}
	public void setStart_dt(String start_dt) {
		this.start_dt = start_dt;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getVoer_dt() {
		return voer_dt;
	}
	public void setVoer_dt(String voer_dt) {
		this.voer_dt = voer_dt;
	}
	public String getCase_type_s() {
		return case_type_s;
	}
	public void setCase_type_s(String case_type_s) {
		this.case_type_s = case_type_s;
	}
	public String getCase_type() {
		return case_type;
	}
	public void setCase_type(String case_type) {
		this.case_type = case_type;
	}
	public String getParty_class_cd() {
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd) {
		this.party_class_cd = party_class_cd;
	}
	public String getParty_class_cd_s() {
		return party_class_cd_s;
	}
	public void setParty_class_cd_s(String party_class_cd_s) {
		this.party_class_cd_s = party_class_cd_s;
	}
	public String getReceipt_org_s() {
		return receipt_org_s;
	}
	public void setReceipt_org_s(String receipt_org_s) {
		this.receipt_org_s = receipt_org_s;
	}
	public String getCase_type_s1() {
		return case_type_s1;
	}
	public void setCase_type_s1(String case_type_s1) {
		this.case_type_s1 = case_type_s1;
	}
	public String getDeal_dt() {
		return deal_dt;
	}
	public void setDeal_dt(String deal_dt) {
		this.deal_dt = deal_dt;
	}
	public String getDeal_user() {
		return deal_user;
	}
	public void setDeal_user(String deal_user) {
		this.deal_user = deal_user;
	}
	public String getDealadvise() {
		return dealadvise;
	}
	public void setDealadvise(String dealadvise) {
		this.dealadvise = dealadvise;
	}
	public String getPost_id() {
		return post_id;
	}
	public void setPost_id(String post_id) {
		this.post_id = post_id;
	}
	public String getMsg_name_s() {
		return msg_name_s;
	}
	public void setMsg_name_s(String msgNameS) {
		msg_name_s = msgNameS;
	}
	public String getMsg_type_s() {
		return msg_type_s;
	}
	public void setMsg_type_s(String msgTypeS) {
		msg_type_s = msgTypeS;
	}
	public String getMsg_org_name_s() {
		return msg_org_name_s;
	}
	public void setMsg_org_name_s(String msgOrgNameS) {
		msg_org_name_s = msgOrgNameS;
	}
                                                                                                   
}

