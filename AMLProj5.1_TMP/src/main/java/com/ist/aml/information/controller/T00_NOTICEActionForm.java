package com.ist.aml.information.controller;

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
import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;

public class T00_NOTICEActionForm extends ActionForm {

	/** ʧЧ���� */
	private String infactdate = "";

	/** ���� */
	private String title = "";
	private String title_s="";

	/** 0����Ч 1����Ч */
	private String flag = "";

	/** ����·�� */
	private String filepath = "";

	/** ����ʱ��   */
	private String createdate = "";

	/** 1:�ڲ��ļ� 2���ⲿ�ļ� 3��Ҫ֪ͨ */
	private String notice_gory = "";
	private String notice_gory_s="";

	/** 1:ϵͳ���� 2 �ⲿ���� */
	private String notice_type = "";

	/** ������ */
	private String filename = "";

	/** ���� */
	private String content = "";

	/** ������ */
	private String creator = "";

	/** ����� */
	private String noteice_no = "";

	/** �������� */
	private String createorgan = "";
	private String createorgan_s="";
	private String organame="";
	private FormFile filename1;    
	private String intPage = "0";   
	/**                   
	 * ���캯��           
	 */
	public T00_NOTICEActionForm() {
	}

	public void setInfactdate(String infactdateStr) {
		this.infactdate = infactdateStr;
	}

	public String getInfactdate() {
		return this.infactdate;
	}

	public void setTitle(String titleStr) {
		this.title = titleStr;
	}

	public String getTitle() {
		return this.title;
	}

	public void setFlag(String flagStr) {
		this.flag = flagStr;
	}

	public String getFlag() {
		return this.flag;
	}

	public void setFilepath(String filepathStr) {
		this.filepath = filepathStr;
	}

	public String getFilepath() {
		return this.filepath;
	}

	public void setCreatedate(String createdateStr) {
		this.createdate = createdateStr;
	}

	public String getCreatedate() {
		return this.createdate;
	}

	public void setNotice_gory(String notice_goryStr) {
		this.notice_gory = notice_goryStr;
	}

	public String getNotice_gory() {
		return this.notice_gory;
	}

	public void setNotice_type(String notice_typeStr) {
		this.notice_type = notice_typeStr;
	}

	public String getNotice_type() {
		return this.notice_type;
	}

	public void setFilename(String filenameStr) {
		this.filename = filenameStr;
	}

	public String getFilename() {
		return this.filename;
	}

	public void setContent(String contentStr) {
		this.content = contentStr;
	}

	public String getContent() {
		return this.content;
	}

	public void setCreator(String creatorStr) {
		this.creator = creatorStr;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setNoteice_no(String noteice_noStr) {
		this.noteice_no = noteice_noStr;
	}

	public String getNoteice_no() {
		return this.noteice_no;
	}

	public void setCreateorgan(String createorganStr) {
		this.createorgan = createorganStr;
	}

	public String getCreateorgan() {
		return this.createorgan;
	}
 
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		/**@todo: finish this method, this is just the skeleton.*/
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
	}

	public FormFile getFilename1() {
		return filename1;
	}

	public void setFilename1(FormFile filename1) {
		this.filename1 = filename1;
	}

	public String getOrganame() {
		return organame;
	}

	public void setOrganame(String organame) {
		this.organame = organame;
	}

	public String getTitle_s() {
		return title_s;
	}

	public void setTitle_s(String title_s) {
		this.title_s = title_s;
	}

	public String getNotice_gory_s() {
		return notice_gory_s;
	}

	public void setNotice_gory_s(String notice_gory_s) {
		this.notice_gory_s = notice_gory_s;
	}

	public String getCreateorgan_s() {
		return createorgan_s;
	}

	public void setCreateorgan_s(String createorgan_s) {
		this.createorgan_s = createorgan_s;
	}

	public String getIntPage() {
		return intPage;
	}

	public void setIntPage(String intPage) {
		this.intPage = intPage;
	}

}
