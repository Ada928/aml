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

package com.ist.aml.lip.controller;

/**
 * <p>
 * T00_list_colsActionForm.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
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

public class T00_list_colsActionForm extends ActionForm {

	/** ������ */
	private String sort_column = "";
	/** �����ֶ� */
	private String sort_type = "";
	/** where���� */
	private String where = "";
	/** ���׺ */
	private String tableend = "";
	/** ��ť��־ */
	private String button_flag = "";
	/** ���� */
	private String party_id = "";
	/** ���� */
	private String title="";
	
	/** ȫ�ļ��������� */
	private String search_all="";
	/** ɾ��ԭ�� */
	private String re_reason = "";
	/**
	 * ѡ�е���������
	 */
	private String[] selectkey = {};

	/** �Ƿ��ڷ������� 1���ǣ�2���� */
	private String isserverdb = "";
	/** �Ƿ��ѯ���� 1���ǣ�2���� */
	private String iscond = "";
	/** �ֶ����� */
	private String fieldtype = "";
	/** �Ƿ��������� 1���ǣ�2���� */
	private String issort = "";
	/** �޸�ʱ�䣨YYYY-MM-DD HH24:MI:SS�� */
	private String modifydate = "";
	/** �����Ϣ���KEYֵ */
	private String addtabkey = "";
	/** �д��� */
	private String colkey = "";
	/** �Ƿ�Ӧ�� 1���ǣ�2���� */
	private String isapply = "";
	/** �Ƿ��б���ʾ 1���ǣ�2���� */
	private String isshow = "";
	/** ���ݱ���� */
	private String tablecode = "";
	/** �Ƿ�����ʱ�� 1���ǣ�2���� */
	private String istempdb = "";
	/** �Ƿ��ѯ������ʾ��ʽ 1���ı���2�������˵���3����λ��4������ */
	private String conddisp = "";
	/** �б��ʽ */
	private String expression = "";
	/** �Ƿ����Զ���� 1���ǣ�2���� */
	private String iscustomdb = "";
	/** �ֶγ��� */
	private String collength = "";
	/** ����ʾ���� */
	private String colname = "";
	/** ������ */
	private String creator = "";
	/** �Ƿ������ֶ� 1���ǣ�2���� */
	private String ishidefield = "";
	/** �Ƿ�Ĭ���ֶ� 1���ǣ�2���� */
	private String isdefaultfield = "";
	/** ��ʾ��� */
	private Integer dispseq = new Integer(0);
	/** ��ѯ�������KEYֵ */
	private String condtabkey = "";
	/** �Ƿ��ھ���� 1���ǣ�2���� */
	private String isrectifydb = "";
	/** ��־λ 1�����ã�2������ */
	private String flag = "";
	/** ����ʱ�䣨YYYY-MM-DD HH24:MI:SS�� */
	private String createdate = "";
	/** ��ӷ�ʽ 1���ı���2�������˵���3����λ��4�����ڣ�5�������ı��� */
	private String adddisp = "";
	/** �޸��� */
	private String modifier = "";
	/** �Ƿ�������ֶ���Ϣʱ��Ӹ��ֶ���Ϣ 1���ǣ�2���� */
	private String isaddinfo = "";
	/** �Ƿ����޸��ֶ���Ϣʱ��Ӹ��ֶ���Ϣ 1���ǣ�2���� */
	private String isupdinfo = "";

	// =======================================================
	/**
	 * ���캯��
	 */
	public T00_list_colsActionForm() {
	}

	public void setIsserverdb(String isserverdbStr) {
		this.isserverdb = isserverdbStr;
	}

	public String getIsserverdb() {
		return this.isserverdb;
	}

	public void setIscond(String iscondStr) {
		this.iscond = iscondStr;
	}

	public String getIscond() {
		return this.iscond;
	}

	public void setFieldtype(String fieldtypeStr) {
		this.fieldtype = fieldtypeStr;
	}

	public String getFieldtype() {
		return this.fieldtype;
	}

	public void setIssort(String issortStr) {
		this.issort = issortStr;
	}

	public String getIssort() {
		return this.issort;
	}

	public void setModifydate(String modifydateStr) {
		this.modifydate = modifydateStr;
	}

	public String getModifydate() {
		return this.modifydate;
	}

	public void setAddtabkey(String addtabkeyStr) {
		this.addtabkey = addtabkeyStr;
	}

	public String getAddtabkey() {
		return this.addtabkey;
	}

	public void setColkey(String colkeyStr) {
		this.colkey = colkeyStr;
	}

	public String getColkey() {
		return this.colkey;
	}

	public void setIsapply(String isapplyStr) {
		this.isapply = isapplyStr;
	}

	public String getIsapply() {
		return this.isapply;
	}

	public void setIsshow(String isshowStr) {
		this.isshow = isshowStr;
	}

	public String getIsshow() {
		return this.isshow;
	}

	public void setTablecode(String tablecodeStr) {
		this.tablecode = tablecodeStr;
	}

	public String getTablecode() {
		return this.tablecode;
	}

	public void setIstempdb(String istempdbStr) {
		this.istempdb = istempdbStr;
	}

	public String getIstempdb() {
		return this.istempdb;
	}

	public void setConddisp(String conddispStr) {
		this.conddisp = conddispStr;
	}

	public String getConddisp() {
		return this.conddisp;
	}

	public void setExpression(String expressionStr) {
		this.expression = expressionStr;
	}

	public String getExpression() {
		return this.expression;
	}

	public void setIscustomdb(String iscustomdbStr) {
		this.iscustomdb = iscustomdbStr;
	}

	public String getIscustomdb() {
		return this.iscustomdb;
	}

	public void setCollength(String collengthStr) {
		this.collength = collengthStr;
	}

	public String getCollength() {
		return this.collength;
	}

	public void setColname(String colnameStr) {
		this.colname = colnameStr;
	}

	public String getColname() {
		return this.colname;
	}

	public void setCreator(String creatorStr) {
		this.creator = creatorStr;
	}

	public String getCreator() {
		return this.creator;
	}

	public void setIshidefield(String ishidefieldStr) {
		this.ishidefield = ishidefieldStr;
	}

	public String getIshidefield() {
		return this.ishidefield;
	}

	public void setIsdefaultfield(String isdefaultfieldStr) {
		this.isdefaultfield = isdefaultfieldStr;
	}

	public String getIsdefaultfield() {
		return this.isdefaultfield;
	}

	public void setDispseq(Integer idispseq) {
		this.dispseq = idispseq;
	}

	public Integer getDispseq() {
		return this.dispseq;
	}

	public void setCondtabkey(String condtabkeyStr) {
		this.condtabkey = condtabkeyStr;
	}

	public String getCondtabkey() {
		return this.condtabkey;
	}

	public void setIsrectifydb(String isrectifydbStr) {
		this.isrectifydb = isrectifydbStr;
	}

	public String getIsrectifydb() {
		return this.isrectifydb;
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

	public void setAdddisp(String adddispStr) {
		this.adddisp = adddispStr;
	}

	public String getAdddisp() {
		return this.adddisp;
	}

	public void setModifier(String modifierStr) {
		this.modifier = modifierStr;
	}

	public String getModifier() {
		return this.modifier;
	}

	public void setIsaddinfo(String isaddinfo) {
		this.isaddinfo = isaddinfo;
	}

	public String getIsaddinfo() {
		return isaddinfo;
	}

	public void setIsupdinfo(String isupdinfo) {
		this.isupdinfo = isupdinfo;
	}

	public String getIsupdinfo() {
		return isupdinfo;
	}

	public String getSort_column() {
		return sort_column;
	}

	public void setSort_column(String sort_column) {
		this.sort_column = sort_column;
	}

	public String getSort_type() {
		return sort_type;
	}

	public void setSort_type(String sort_type) {
		this.sort_type = sort_type;
	}

	public String getWhere() {
		return where;
	}

	public void setWhere(String where) {
		this.where = where;
	}

	public String getTableend() {
		return tableend;
	}

	public void setTableend(String tableend) {
		this.tableend = tableend;
	}

	public String getButton_flag() {
		return button_flag;
	}

	public void setButton_flag(String button_flag) {
		this.button_flag = button_flag;
	}

	public String[] getSelectkey() {
		return selectkey;
	}

	public void setSelectkey(String[] selectkey) {
		this.selectkey = selectkey;
	}

	public String getParty_id() {
		return party_id;
	}

	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}

	public String getRe_reason() {
		return re_reason;
	}

	public void setRe_reason(String re_reason) {
		this.re_reason = re_reason;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	// =======================================================
	// =======================================================
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
		/** @todo: finish this method, this is just the skeleton. */
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest) {
	}

	public String getSearch_all() {
		return search_all;
	}

	public void setSearch_all(String search_all) {
		this.search_all = search_all;
	}

}
