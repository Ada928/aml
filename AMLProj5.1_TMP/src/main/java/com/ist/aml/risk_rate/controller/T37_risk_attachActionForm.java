/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2007-04-03   ����		����        
 */

package com.ist.aml.risk_rate.controller;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: �����������ڿƼ��������޹�˾
 * </p>
 * 
 * @author �з���
 * @version 1.0
 */

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class T37_risk_attachActionForm extends ActionForm {
	private FormFile filename;

	/** �������� */
	private String attach_name = "";

	
	/** ���۽��KEY */
	private String resulekey = "";

	/** �ϴ��� */
	private String load_user = "";

	/** Ԥ��ID */
	private String alertkey = "";

	/** �ϴ�ʱ�� */
	private Date load_date = new Date();

	/** ����KEY */
	private String attachkey = "";

	/** ������ʵ���� */
	private String attach_realname = "";

	// =======================================================
	/** �ϴ�ʱ�� */
	private String load_date_disp = "";

	/**
	 * ���캯��
	 */
	public T37_risk_attachActionForm() {
	}

	public void setAttach_name(String attach_nameStr) {
		this.attach_name = attach_nameStr;
	}

	public String getAttach_name() {
		return this.attach_name;
	}

	public String getResulekey() {
		return resulekey;
	}

	public void setResulekey(String resulekey) {
		this.resulekey = resulekey;
	}

	public void setLoad_user(String load_userStr) {
		this.load_user = load_userStr;
	}

	public String getLoad_user() {
		return this.load_user;
	}

	public void setAlertkey(String alertkeyStr) {
		this.alertkey = alertkeyStr;
	}

	public String getAlertkey() {
		return this.alertkey;
	}

	public void setLoad_date(Date load_dateStr) {
		this.load_date = load_dateStr;
	}

	public Date getLoad_date() {
		return this.load_date;
	}

	public void setAttachkey(String attachkeyStr) {
		this.attachkey = attachkeyStr;
	}

	public String getAttachkey() {
		return this.attachkey;
	}

	public void setAttach_realname(String attach_realnameStr) {
		this.attach_realname = attach_realnameStr;
	}

	public String getAttach_realname() {
		return this.attach_realname;
	}

	// =======================================================
	public void setLoad_date_disp(String load_date_dispStr) {
		this.load_date_disp = load_date_dispStr;
	}

	public String getLoad_date_disp() {
		return this.load_date_disp;
	}

	// =======================================================
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		/** @todo: finish this method, this is just the skeleton. */
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
	}

	public FormFile getFilename() {
		return filename;
	}

	public void setFilename(FormFile filename) {
		this.filename = filename;
	}
}
