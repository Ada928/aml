package com.ist.aml.report.dto;

import com.ist.common.base.BaseDTO;

public class T47_cust_recordLog extends BaseDTO {
	/**
	 * 
	 */
	private static final long serialVersionUID = -335614497106193697L;
	/**�ͻ�����**/
	private String party_chn_name = "";
	/**�ͻ���**/
	private String party_id = "";
	/**�ͻ�֤����**/
	private String card_no = "";
	/**�ͻ�����**/
	private String card_type = "";
	/**��������**/
	private String oper_des = "";
	/**��������**/
	private String create_dt = "";
	/**������**/
	private String create_usr = "";
	/**������������**/
	private String oper_obj_type = "";
	
	
	public String getParty_chn_name() {
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name) {
		this.party_chn_name = party_chn_name;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String party_id) {
		this.party_id = party_id;
	}
	public String getCard_no() {
		return card_no;
	}
	public void setCard_no(String card_no) {
		this.card_no = card_no;
	}
	public String getCard_type() {
		return card_type;
	}
	public void setCard_type(String card_type) {
		this.card_type = card_type;
	}
	public String getOper_des() {
		return oper_des;
	}
	public void setOper_des(String oper_des) {
		this.oper_des = oper_des;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String create_dt) {
		this.create_dt = create_dt;
	}
	public String getCreate_usr() {
		return create_usr;
	}
	public void setCreate_usr(String create_usr) {
		this.create_usr = create_usr;
	}
	public String getOper_obj_type() {
		return oper_obj_type;
	}
	public void setOper_obj_type(String oper_obj_type) {
		this.oper_obj_type = oper_obj_type;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
}
