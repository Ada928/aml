package com.ist.aml.inves.controller;

import org.apache.struts.action.ActionForm;

@SuppressWarnings("serial")
public class T07_party_ganzActionForm extends ActionForm {
	/**
	 * ����
	 */
	private String genz_no;
	/**
	 * �ͻ���
	 */
	private String party_id;
	/**
	 * �ͻ�����
	 */
	private String party_chn_name;
	/**
	 * ֤������
	 */
	private String card_type;
	/**
	 * ֤��������ϸ��Ϣ
	 */
	private String card_type_disp;
	/**
	 * ֤������
	 */
	private String card_no;
	/**
	 * ����ʱ��������������
	 */
	private String create_date_disp;
	/**
	 * ʧЧʱ��������������
	 */
	private String infact_date_disp;
	/**
	 * ״̬ 1����Ч 2����Ч
	 */
	private String status_cd;
	/**
	 * ���ٿͻ�״̬��ϸ��Ϣ
	 */
	private String status_cd_disp;
	
	public String getGenz_no() {
		return genz_no;
	}
	public void setGenz_no(String genzNo) {
		genz_no = genzNo;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String partyId) {
		party_id = partyId;
	}
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String partyChnName) {
		party_chn_name = partyChnName;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String cardType) {
		card_type = cardType;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String cardNo) {
		card_no = cardNo;
	}
	public String getCreate_date_disp() {
		return create_date_disp;
	}
	public void setCreate_date_disp(String createDateDisp) {
		create_date_disp = createDateDisp;
	}
	public String getInfact_date_disp() {
		return infact_date_disp;
	}
	public void setInfact_date_disp(String infactDateDisp) {
		infact_date_disp = infactDateDisp;
	}
	public String getStatus_cd() {
		return status_cd;
	}
	public void setStatus_cd(String statusCd) {
		status_cd = statusCd;
	}
	public String getCard_type_disp() {
		return card_type_disp;
	}
	public void setCard_type_disp(String cardTypeDisp) {
		card_type_disp = cardTypeDisp;
	}
	public String getStatus_cd_disp() {
		return status_cd_disp;
	}
	public void setStatus_cd_disp(String statusCdDisp) {
		status_cd_disp = statusCdDisp;
	}
	
}
