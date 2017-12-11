/**                                             
 * ����             ���� 		����        
 * 2006-12-29   ����		����        
 */

package com.ist.aml.report.dto;

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

import com.ist.common.base.BaseDTO;


public class T47_trans_recordLog extends BaseDTO{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -335614497106193697L;
	/** ҵ���ʶ */
	private String transactionkey = "";
	/** ��ˮ�� */
	private String tx_no = "";
	/** �������� */
	private Date tx_dt = null;
	/** �����˻� */
	private String acct_num = "";
	/** ���пͻ��� */
	private String party_id = "";
	/** �������� */
	private String oper_des = "";
	private String oper_obj_type = "";
	private String create_dt = "";
	private String create_usr = "";
	
	public String getTransactionkey() {
		return transactionkey;
	}
	public void setTransactionkey(String transactionkey) {
		this.transactionkey = transactionkey;
	}
	public String getTx_no() {
		return tx_no;
	}
	public void setTx_no(String txNo) {
		tx_no = txNo;
	}
	public Date getTx_dt() {
		return tx_dt;
	}
	public void setTx_dt(Date txDt) {
		tx_dt = txDt;
	}
	public String getAcct_num() {
		return acct_num;
	}
	public void setAcct_num(String acctNum) {
		acct_num = acctNum;
	}
	public String getParty_id() {
		return party_id;
	}
	public void setParty_id(String partyId) {
		party_id = partyId;
	}
	public String getOper_des() {
		return oper_des;
	}
	public void setOper_des(String operDes) {
		oper_des = operDes;
	}
	public String getCreate_dt() {
		return create_dt;
	}
	public void setCreate_dt(String createDt) {
		create_dt = createDt;
	}
	public String getCreate_usr() {
		return create_usr;
	}
	public void setCreate_usr(String createUsr) {
		create_usr = createUsr;
	}
	public String getOper_obj_type() {
		return oper_obj_type;
	}
	public void setOper_obj_type(String operObjType) {
		oper_obj_type = operObjType;
	}
	
	
	
}