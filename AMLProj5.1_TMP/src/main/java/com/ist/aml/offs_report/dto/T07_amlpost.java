package com.ist.aml.offs_report.dto;                
                                                  
/**
* <p>T07_amlpost.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import java.io.Serializable;
import java.util.*;
//import com.ist.common.base.BaseDTO; 
                                              
public class T07_amlpost  implements Serializable {


	private static final long serialVersionUID = 6558475081466513912L;
/** ��λ���������� */
private String organ_username="";
/** ��λ������ְ������ */
private String organ_position="";
/** ��λ��������ϵ�绰*/
private String organ_telephone="";
/** ��ϴǮ���Ÿ�����*/
private String depart_username="";
/** ��ϴǮ������ϵ�绰*/
private String depart_telephone="";
/** רְ����*/
private String full_time_num="";
/** ��ְ����*/
private String part_time_num="";
/** ���� */
private String user_id = "";
/** ���� */
private String organkey = "";
/** �������� */
private String department = "";


/** ��ϵ�绰 */
private String telephone = "";
/** 1:��λ�����ˣ�2:��ϴǮ���Ÿ�����;3:��ϴǮ��Ա */
private String postitle = "";
private String organkey_disp = "";
/** 1:רְ;2:��ְ */
private String us_status = "";
/** ְ������ */
private String position = "";
/** ���� */
private String name = "";
/** ������ */
private String last_upd_user = "";
/** �������� */
private Date last_upd_dt = new Date();
//=======================================================
/** �������� */
private String last_upd_dt_disp = "";
/** ��ҳ��Ϣ*/
private String intPage = "0";
/** �û�����Ȩ���ַ��� */
private String organstr="";
/** �ϼ����� */
private String uporgankey="";
public String getOrganstr() {
	return organstr;
}
public void setOrganstr(String organstr) {
	this.organstr = organstr;
}
public String getUporgankey() {
	return uporgankey;
}
public void setUporgankey(String uporgankey) {
	this.uporgankey = uporgankey;
}
/**                   
 * ���캯��           
 */                   
public T07_amlpost() {    
    }                     
public void setTelephone(String telephoneStr){
this.telephone = telephoneStr;
}
public String getTelephone(){
return this.telephone;
}

public void setDepartment(String departmentStr){
this.department = departmentStr;
}
public String getDepartment(){
return this.department;
}

public void setPostitle(String postitleStr){
this.postitle = postitleStr;
}
public String getPostitle(){
return this.postitle;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setUs_status(String us_statusStr){
this.us_status = us_statusStr;
}
public String getUs_status(){
return this.us_status;
}

public void setPosition(String positionStr){
this.position = positionStr;
}
public String getPosition(){
return this.position;
}

public void setName(String nameStr){
this.name = nameStr;
}
public String getName(){
return this.name;
}

public void setUser_id(String user_idStr){
this.user_id = user_idStr;
}
public String getUser_id(){
return this.user_id;
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

//=======================================================
public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getOrgankey_disp() {
	return organkey_disp;
}
public void setOrgankey_disp(String organkey_disp) {
	this.organkey_disp = organkey_disp;
}
public String getIntPage() {
	return intPage;
}
public void setIntPage(String intPage) {
	this.intPage = intPage;
}
public String getDepart_telephone() {
	return depart_telephone;
}
public void setDepart_telephone(String depart_telephone) {
	this.depart_telephone = depart_telephone;
}
public String getDepart_username() {
	return depart_username;
}
public void setDepart_username(String depart_username) {
	this.depart_username = depart_username;
}
public String getFull_time_num() {
	return full_time_num;
}
public void setFull_time_num(String full_time_num) {
	this.full_time_num = full_time_num;
}
public String getOrgan_position() {
	return organ_position;
}
public void setOrgan_position(String organ_position) {
	this.organ_position = organ_position;
}
public String getOrgan_telephone() {
	return organ_telephone;
}
public void setOrgan_telephone(String organ_telephone) {
	this.organ_telephone = organ_telephone;
}
public String getOrgan_username() {
	return organ_username;
}
public void setOrgan_username(String organ_username) {
	this.organ_username = organ_username;
}
public String getPart_time_num() {
	return part_time_num;
}
public void setPart_time_num(String part_time_num) {
	this.part_time_num = part_time_num;
}

}

