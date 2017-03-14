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
 * T00_list_cols.java
 * </p>
 * <p>
 * Description:
 * </p>
 * 
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.LinkedHashMap;
import java.util.Map;



public class T00_list_cols extends BaseDTO {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 7790444250059324614L;
	/** ��ѯSQL */
	private String sql="";
	/** ��ѯSQL_COUNT */
	private String sql_count="";
	/** ��ѯ������MAP */
	private Map condValueMap=new LinkedHashMap();
	/**ȫ�ļ����Ĳ�ѯ���� */
	private String search_all="";
	
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
	/** �����Ϣ���nameֵ */
	private String addtabname = "";
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
	//private Long dispseq = new Long(0);
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
	public T00_list_cols() {
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

	public String getAddtabname() {
		return addtabname;
	}

	public void setAddtabname(String addtabname) {
		this.addtabname = addtabname;
	}

	public String getSql() {
		return sql;
	}

	public void setSql(String sql) {
		this.sql = sql;
	}

	public String getSql_count() {
		return sql_count;
	}

	public void setSql_count(String sql_count) {
		this.sql_count = sql_count;
	}

	public Map getCondValueMap() {
		return condValueMap;
	}

	public void setCondValueMap(Map condValueMap) {
		this.condValueMap = condValueMap;
	}

	public String getSearch_all() {
		return search_all;
	}

	public void setSearch_all(String search_all) {
		this.search_all = search_all;
	}

	//public void setDispseq(Long dispseq) {
	//	this.dispseq = dispseq;
	//}

	//public Long getDispseq() {
	//	return dispseq;
	//}


	

	

	// =======================================================
}
