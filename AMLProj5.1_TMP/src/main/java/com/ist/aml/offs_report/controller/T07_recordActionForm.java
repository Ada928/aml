/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2009-02-02] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.offs_report.controller;                
                                                  
/**
* <p>T07_recordActionForm.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_recordActionForm extends ActionForm {
                                              
/** Э����λ����������/�������أ������������У���������ĺš��μ����������Ų��Ϸ��� */
private String remark2 = "";
/** ��ѵ��ʽ��������ʽ������������� */
private String remark3 = "";
/** ��¼���� 1:��ѵ��¼��2:������¼��3:�ڿ��ƶȣ�4:�ڲ���ƣ�5:���ϴǮ���� */
private String record_type_cd = "";
/** ��¼�� */
private String record_user = "";
/** ���� */
private String organkey = "";
/** ��¼��� */
private String record_id = "";
/** Э�����ݡ���Ҫ���ݡ���ѵ���ݡ��������ݡ������Ŀ���Ƽ���Ҫ���� */
private String content = "";
/** Ч�����ƶ����ơ���ѵ���󡢲μ���������Ʒ��ֵ���Ҫ����
 */
private String remark1 = "";
/** ������ */
private String last_upd_user = "";
/** Э��ʱ�䡢�ƶ�ʱ�䡢��ѵʱ�䡢�ʱ�䣬������ޣ���ʼʱ�䣩 */
private Date create_dt = new Date();
/** ������Ա����Э�����š��ƶ����š���Ʋ������� */
private String record_obj = "";
/** ����ʱ�� */
private Date last_upd_dt = new Date();
/** ������޽���ʱ�� */
private Date create_end_dt = new Date();

//=======================================================
/** Э��ʱ�䡢�ƶ�ʱ�䡢��ѵʱ�䡢�ʱ�䣬������ޣ���ʼʱ�䣩 */
private String create_dt_disp = "";
/** ����ʱ�� */
private String last_upd_dt_disp = "";
/** ������޽���ʱ�� */
private String create_end_dt_disp = "";
/** ���ն�Ӧ��ѯ����ֵ */
private Date create_dt_end=new Date();
/** ���ն�Ӧ��ѯ����ֵ */
private String create_dt_end_disp="";
/** ��������ֵ */
private String[] record_id_selected=null;
/** ���� */
private String quarter="";
/** ���� */
private String orderby;
private String order = "2";

/** add lixx 2010.10.21 ������������*/
private String remark4 = ""; //��ϵ���������ڿ��ƶȲ�����
private String remark5 = ""; //��������Ҵ����������ɽ���©��
private String remark6 = ""; //��������ҽ���Ԫ�����ͻ����ʶ�𲻵�λ
private String remark7 = ""; //������Ҵ�����δ��������
private String remark8 = ""; //������ҽ�����Ԫ����������ѵ����λ
private String remark9 = ""; //��������ҷ������ͻ����ϱ��治ȫ
private String remark10 = ""; //��������ҽ���Ԫ������������ 
private String remark11 = ""; //������ҷ���
private String remark12 = ""; //������ҽ�����Ԫ��
/**edd add 2010.10.21*/

    public String[] getRecord_id_selected() {
	return record_id_selected;
}
public void setRecord_id_selected(String[] record_id_selected) {
	this.record_id_selected = record_id_selected;
}
	/**                   
     * ���캯��           
     */                   
    public T07_recordActionForm() {    
    }                     
public void setRemark2(String remark2Str){
this.remark2 = remark2Str;
}
public String getRemark2(){
return this.remark2;
}

public void setRemark3(String remark3Str){
this.remark3 = remark3Str;
}
public String getRemark3(){
return this.remark3;
}

public void setRecord_type_cd(String record_type_cdStr){
this.record_type_cd = record_type_cdStr;
}
public String getRecord_type_cd(){
return this.record_type_cd;
}

public void setRecord_user(String record_userStr){
this.record_user = record_userStr;
}
public String getRecord_user(){
return this.record_user;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setRecord_id(String record_idStr){
this.record_id = record_idStr;
}
public String getRecord_id(){
return this.record_id;
}

public void setContent(String contentStr){
this.content = contentStr;
}
public String getContent(){
return this.content;
}

public void setRemark1(String remark1Str){
this.remark1 = remark1Str;
}
public String getRemark1(){
return this.remark1;
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

public void setRecord_obj(String record_objStr){
this.record_obj = record_objStr;
}
public String getRecord_obj(){
return this.record_obj;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setCreate_end_dt(Date create_end_dtStr){
this.create_end_dt = create_end_dtStr;
}
public Date getCreate_end_dt(){
return this.create_end_dt;
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

public void setCreate_end_dt_disp(String create_end_dt_dispStr){
this.create_end_dt_disp = create_end_dt_dispStr;
}
public String getCreate_end_dt_disp(){
return this.create_end_dt_disp;
}

//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }
	public Date getCreate_dt_end() {
		return create_dt_end;
	}
	public void setCreate_dt_end(Date create_dt_end) {
		this.create_dt_end = create_dt_end;
	}
	public String getCreate_dt_end_disp() {
		return create_dt_end_disp;
	}
	public void setCreate_dt_end_disp(String create_dt_end_disp) {
		this.create_dt_end_disp = create_dt_end_disp;
	}  
	
	public void reset(){
		this.content="";
		this.create_dt_disp="";
		this.create_dt_end_disp="";
		this.create_end_dt_disp="";
		this.record_obj="";
		this.remark1="";
		this.remark2="";
		this.remark3="";
		this.record_id="";
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
	public String getOrder() {
		return order;
	}
	public void setOrder(String order) {
		this.order = order;
	}
	public String getOrderby() {
		return orderby;
	}
	public void setOrderby(String orderby) {
		this.orderby = orderby;
	}
	
	/** add lixx 2010.10.21 ������������*/
	public String getRemark4() {
		return remark4;
	}
	public void setRemark4(String remark4) {
		this.remark4 = remark4;
	}
	public String getRemark5() {
		return remark5;
	}
	public void setRemark5(String remark5) {
		this.remark5 = remark5;
	}
	public String getRemark6() {
		return remark6;
	}
	public void setRemark6(String remark6) {
		this.remark6 = remark6;
	}
	public String getRemark7() {
		return remark7;
	}
	public void setRemark7(String remark7) {
		this.remark7 = remark7;
	}
	public String getRemark8() {
		return remark8;
	}
	public void setRemark8(String remark8) {
		this.remark8 = remark8;
	}
	public String getRemark9() {
		return remark9;
	}
	public void setRemark9(String remark9) {
		this.remark9 = remark9;
	}
	public String getRemark10() {
		return remark10;
	}
	public void setRemark10(String remark10) {
		this.remark10 = remark10;
	}
	public String getRemark11() {
		return remark11;
	}
	public void setRemark11(String remark11) {
		this.remark11 = remark11;
	}
	public String getRemark12() {
		return remark12;
	}
	public void setRemark12(String remark12) {
		this.remark12 = remark12;
	}
	/**end add*/
	
}


