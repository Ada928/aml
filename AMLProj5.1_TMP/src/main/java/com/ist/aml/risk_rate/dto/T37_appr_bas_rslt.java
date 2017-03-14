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
* <p>T37_appr_bas_rslt.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.util.ArrayList;
import java.util.Date;

import com.ist.common.base.BaseDTO; 
                                              
public class T37_appr_bas_rslt extends BaseDTO {

/** ���۽��KEY */
private String resulekey = "";
/** ģ����� */
private String templatekey = "";
/** �ϲ���� */
private String upelementkey = "";
/** ���� */
private String granularity = "";
/** �������� */
private Date statistic_dt;

/** ԭҪ���ֵ */
private String old_score = "";
/** Ҫ����� */
private String elementkey = "";
/** Ҫ������ */
private String elementname = "";
/** Ҫ������ */
private String des = "";
/** �ͻ��� */
private String party_id = "";
/** �ͻ����� */
private String organkey = "";
/** ָ��ֵ */
private String basic_val = "";
/** ��׼��ֵ */
private String base_score = "";
/** ��Ҫ���ֵ */
private String score = "";
private double score_d=0;
private Double element_score;
/** Ȩ�� */
private String base_occ = "";
private double base_occ_d=0;
/** �Ƿ����һ�� */
private String is_last = "";
private String treelaye = "";
/** ���㷽ʽ 1��Ȩ�� 2�����ֵ 3����Сֵ */
private String js_type = "";
private String js_type_disp = "";
private String table_name = "";
/** �Ƿ���Ե���*/
private String is_audit = "";
private ArrayList list = new ArrayList();
//=======================================================
/** �������� */
private String statistic_dt_disp = "";
                                              
    /**                   
     * ���캯��           
     */                   
    public T37_appr_bas_rslt() {    
    }    
    
public String getResulekey() {
		return resulekey;
	}

	public void setResulekey(String resulekey) {
		this.resulekey = resulekey;
	}

public void setUpelementkey(String upelementkeyStr){
this.upelementkey = upelementkeyStr;
}
public String getUpelementkey(){
return this.upelementkey;
}

public void setGranularity(String granularityStr){
this.granularity = granularityStr;
}
public String getGranularity(){
return this.granularity;
}


public void setOld_score(String old_scoreStr){
this.old_score = old_scoreStr;
}
public String getOld_score(){
return this.old_score;
}

public ArrayList getList() {
	return list;
}

public void setList(ArrayList list) {
	this.list = list;
}

public Double getElement_score() {
	return element_score;
}
public void setElement_score(Double elementScore) {
	element_score = elementScore;
}
public void setElementkey(String elementkeyStr){
this.elementkey = elementkeyStr;
}
public String getElementkey(){
return this.elementkey;
}

public String getElementname() {
	return elementname;
}
public void setElementname(String elementname) {
	this.elementname = elementname;
}

public String getDes() {
	return des;
}

public void setDes(String des) {
	this.des = des;
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

public String getTemplatekey() {
	return templatekey;
}

public void setTemplatekey(String templatekey) {
	this.templatekey = templatekey;
}

public void setBasic_val(String basic_valStr){
this.basic_val = basic_valStr;
}
public String getBasic_val(){
return this.basic_val;
}

public void setBase_score(String base_scoreStr){
this.base_score = base_scoreStr;
}
public String getBase_score(){
return this.base_score;
}



public String getScore() {
	return score;
}

public void setScore(String score) {
	this.score = score;
}

public double getScore_d() {
	return score_d;
}

public void setScore_d(double scoreD) {
	score_d = scoreD;
}

public String getBase_occ() {
	return base_occ;
}

public void setBase_occ(String baseOcc) {
	base_occ = baseOcc;
}

public double getBase_occ_d() {
	return base_occ_d;
}

public void setBase_occ_d(double baseOccD) {
	base_occ_d = baseOccD;
}

public Date getStatistic_dt() {
	return statistic_dt;
}
public void setStatistic_dt(Date statisticDt) {
	statistic_dt = statisticDt;
}

public String getTreelaye() {
	return treelaye;
}
public void setTreelaye(String treelaye) {
	this.treelaye = treelaye;
}

public String getIs_last() {
	return is_last;
}
public void setIs_last(String isLast) {
	is_last = isLast;
}

public String getJs_type() {
	return js_type;
}

public void setJs_type(String jsType) {
	js_type = jsType;
}

public String getJs_type_disp() {
	return js_type_disp;
}

public String getTable_name() {
	return table_name;
}

public void setTable_name(String tableName) {
	table_name = tableName;
}

public void setJs_type_disp(String jsTypeDisp) {
	js_type_disp = jsTypeDisp;
}

public String getIs_audit() {
	return is_audit;
}

public void setIs_audit(String isAudit) {
	is_audit = isAudit;
}

//=======================================================
public void setStatistic_dt_disp(String statistic_dt_dispStr){
this.statistic_dt_disp = statistic_dt_dispStr;
}
public String getStatistic_dt_disp(){
return this.statistic_dt_disp;
}

}

