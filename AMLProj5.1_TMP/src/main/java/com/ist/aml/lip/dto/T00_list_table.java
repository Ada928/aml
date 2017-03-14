/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2010-12-14] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.lip.dto;

/**
 * <p>
 * T00_list_table.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */





public class T00_list_table implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1422650776066130069L;
	/** ״̬ 1�����ã�2�����ã�3��ɾ�� */
	private String status = "";
	private String status_disp = "";
	/** ��־ 1���˹���ӣ�2��ϵͳĬ�� */
	private String flag = "";
	private String flag_disp = "";
	/** ����ʱ�䣨YYYY-MM-DD HH24:MI:SS�� */
	private String createdate = "";
	/** �޸��� */
	private String modifier = "";
	/** �޸�ʱ�䣨YYYY-MM-DD HH24:MI:SS�� */
	private String modifydate = "";
	/** ������ */
	private String creator = "";
	/** ���ݱ����� */
	private String tablename = "";
	/** ���ݱ���� */
	private String tablecode = "";
	/** �Ƿ񴴽������� */
	private String createflag = "";
	private String createflag_disp = "";
	/** ����������*/
	private String list_des="";


	// =======================================================

	/**
	 * ���캯��
	 */
	public T00_list_table() {
	}

	public void setStatus(String statusStr) {
		this.status = statusStr;
	}

	public String getStatus() {
		return this.status;
	}

	public void setFlag(String flagStr) {
		this.flag = flagStr;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setCreatedate(String createdateStr) {
		this.createdate = createdateStr;
	}

	public String getCreatedate() {
		return this.createdate;
	}

	public void setModifier(String modifierStr) {
		this.modifier = modifierStr;
	}

	public String getModifier() {
		return this.modifier;
	}

	public void setModifydate(String modifydateStr) {
		this.modifydate = modifydateStr;
	}

	public String getModifydate() {
		return this.modifydate;
	}

	public void setCreator(String creatorStr) {
		this.creator = creatorStr;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setTablename(String tablenameStr) {
		this.tablename = tablenameStr;
	}

	public String getTablename() {
		return this.tablename;
	}

	public void setTablecode(String tablecodeStr) {
		this.tablecode = tablecodeStr;
	}

	public String getTablecode() {
		return this.tablecode;
	}

	public String getFlag_disp() {
		return flag_disp;
	}

	public void setFlag_disp(String flag_disp) {
		this.flag_disp = flag_disp;
	}

	public String getCreateflag() {
		return createflag;
	}

	public void setCreateflag(String createflag) {
		this.createflag = createflag;
	}

	public String getCreateflag_disp() {
		return createflag_disp;
	}

	public void setCreateflag_disp(String createflag_disp) {
		this.createflag_disp = createflag_disp;
	}

	public String getStatus_disp() {
		return status_disp;
	}

	public void setStatus_disp(String status_disp) {
		this.status_disp = status_disp;
	}

	public String getList_des() {
		return list_des;
	}

	public void setList_des(String list_des) {
		this.list_des = list_des;
	}



	// =======================================================
}
