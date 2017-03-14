package com.ist.aml.risk_rate.dto;

import java.io.Serializable;
import java.util.Date;

import org.apache.struts.upload.FormFile;

public class T37_helpcheck_attach implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -538144820995660524L;
	
	private FormFile filename;
	
	/** ����KEY */
	private String attachKey; 
	/** Э���� */
	private String check_no;
	/** ��������(��ַ�� */
	private String attach_name;
	/** ����ʵ�� */
	private String attach_realName;
	/** �ϴ����� */
	private Date load_date;
	/** load_date for page */
	private String load_date_disp;
	/** �ϴ��� */
	private String load_user;
	
	public T37_helpcheck_attach() {
		// TODO Auto-generated constructor stub
	}

	public String getAttachKey() {
		return attachKey;
	}

	public void setAttachKey(String attachKey) {
		this.attachKey = attachKey;
	}

	public String getCheck_no() {
		return check_no;
	}

	public void setCheck_no(String checkNo) {
		check_no = checkNo;
	}

	public String getAttach_name() {
		return attach_name;
	}

	public void setAttach_name(String attachName) {
		attach_name = attachName;
	}

	public String getAttach_realName() {
		return attach_realName;
	}

	public void setAttach_realName(String attachRealName) {
		attach_realName = attachRealName;
	}

	public Date getLoad_date() {
		return load_date;
	}

	public void setLoad_date(Date loadDate) {
		load_date = loadDate;
	}

	public String getLoad_user() {
		return load_user;
	}

	public void setLoad_user(String loadUser) {
		load_user = loadUser;
	}

	public void setLoad_date_disp(String load_date_disp) {
		this.load_date_disp = load_date_disp;
	}

	public String getLoad_date_disp() {
		return load_date_disp;
	}

	public void setFilename(FormFile filename) {
		this.filename = filename;
	}

	public FormFile getFilename() {
		return filename;
	}

}
