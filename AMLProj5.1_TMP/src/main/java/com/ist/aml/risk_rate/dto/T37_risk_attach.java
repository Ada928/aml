package com.ist.aml.risk_rate.dto;

/**
 * <p>
 * Title: INFO AML SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2012 - 2012
 * </p>
 * <p>
 * Company: �����������ڿƼ��������޹�˾
 * </p>
 * 
 * @author �з���-lijie
 * @version 4.0.1
 */
import java.io.Serializable;
import java.util.Date;
import org.apache.struts.upload.FormFile;

public class T37_risk_attach implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4683441815326863507L;
	//add by chenhao date:2010-05-25֧�ֲ�ֱ�
	private String tableName;
	//end
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

	/** ҳ�� */
	private int int_page = 1;

	/**
	 * ���캯��
	 */
	public T37_risk_attach() {
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

	public int getInt_page() {
		return int_page;
	}

	public void setInt_page(int int_page) {
		this.int_page = int_page;
	}

	public FormFile getFilename() {
		return filename;
	}

	public void setFilename(FormFile filename) {
		this.filename = filename;
	}

	public String getTableName() {
		return tableName;
	}

	public void setTableName(String tableName) {
		this.tableName = tableName;
	}

}

