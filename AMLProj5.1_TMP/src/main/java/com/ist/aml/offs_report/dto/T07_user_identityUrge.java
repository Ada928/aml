package com.ist.aml.offs_report.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;


public class T07_user_identityUrge implements Serializable{


	/**
	 * 
	 */
	private static final long serialVersionUID = -1699234019492504179L;
	/* ��ѯʱ�� */
	private int startdate;
	private int enddate;
	private String startyear = "";
	private String startseason = "";
	private String endyear = "";
	private String endseason = "";
	
	/* ��ѯ���� */
	private ArrayList organList = new ArrayList();
	/* �������� */
	private ArrayList underOrganList = new ArrayList();
	private String organstr = "";
	
	/* �������� */
	private String identitytype = "";
	/* type�������ּ�ܱ�������ĸ�����*/
	private String type="";
	/* �洢����������� */
	private ArrayList status_arrayList = new ArrayList();
	
	/* ����״̬ */
	private String status_cd = "";
	/* ��� */
	private String identitykey = "";
	/* ͳ��ʱ�� */
	private int statisticdate = 0;
	/* ����ʱ�� */
	private Date updatetime;
	/* ������Ϣ */
	private String organkey = "";
	private String organname = "";
	private String organmanager = "";
	private String telephone = "";

	public String getOrganmanager() {
		return organmanager;
	}
	public void setOrganmanager(String organmanager) {
		this.organmanager = organmanager;
	}
	public String getOrganname() {
		return organname;
	}
	public void setOrganname(String organname) {
		this.organname = organname;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getIdentitytype() {
		return identitytype;
	}
	public void setIdentitytype(String identitytype) {
		this.identitytype = identitytype;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public ArrayList getOrganList() {
		return organList;
	}
	public void setOrganList(ArrayList organList) {
		this.organList = organList;
	}
	public String getEndseason() {
		return endseason;
	}
	public void setEndseason(String endseason) {
		this.endseason = endseason;
	}
	public String getEndyear() {
		return endyear;
	}
	public void setEndyear(String endyear) {
		this.endyear = endyear;
	}
	public String getStartseason() {
		return startseason;
	}
	public void setStartseason(String startseason) {
		this.startseason = startseason;
	}
	public String getStartyear() {
		return startyear;
	}
	public void setStartyear(String startyear) {
		this.startyear = startyear;
	}
	public int getEnddate() {
		return enddate;
	}
	public void setEnddate(int enddate) {
		this.enddate = enddate;
	}
	public int getStartdate() {
		return startdate;
	}
	public void setStartdate(int startdate) {
		this.startdate = startdate;
	}
	public ArrayList getUnderOrganList() {
		return underOrganList;
	}
	public void setUnderOrganList(ArrayList underOrganList) {
		this.underOrganList = underOrganList;
	}
	public ArrayList getStatus_arrayList() {
		return status_arrayList;
	}
	public String getOrganstr() {
		return organstr;
	}
	public void setOrganstr(String organstr) {
		this.organstr = organstr;
	}
	public void setStatus_arrayList(ArrayList status_arrayList) {
		this.status_arrayList = status_arrayList;
	}
	public String getIdentitykey() {
		return identitykey;
	}
	public void setIdentitykey(String identitykey) {
		this.identitykey = identitykey;
	}
	public String getOrgankey() {
		return organkey;
	}
	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}
	public int getStatisticdate() {
		return statisticdate;
	}
	public void setStatisticdate(int statisticdate) {
		this.statisticdate = statisticdate;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String status_cd) {
		this.status_cd = status_cd;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
}
