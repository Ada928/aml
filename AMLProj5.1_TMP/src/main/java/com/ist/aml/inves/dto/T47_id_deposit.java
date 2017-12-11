/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2007-12-05   ����		����        
 */                                             
                                                  
package com.ist.aml.inves.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 

import java.util.Date;       
     
                                              
public class T47_id_deposit implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -7322334891712825451L;
/** ԭ�˻� */
private String acct_type_cd = "";
/** �˻����1:֧Ʊ 2:����
 */
private String acct_category_cd = "";
/** ��� */
private String amt_val = "";
/** ��Ŀ�� */
private String subjectno = "";
/** ���� */
private String currency_cd = "";
private String currency_cd_disp="";
/** ���� */
private String card_no = "";
/** �������������� */
private String party_chn_name = "";
/** �����־:1:����2:�㻧9:���� */
private String cash_transfer_cd = "";
/** ����ʱ�� */
private Date open_dt = new Date();
/** �˺� */
private String acct_num = "";
/** �ͻ��� */
private String party_id = "";
/** ����ֵ��01:�������û�02:ƽ���ʽ�����С
 */
private String attr_val = "";
/** ����˻����ʴ��� */
private String ib_property_cd = "";
/** ��Ϣ���� */
private Date acct_processing_dt = new Date();
/** AML�˻����ͣ����ڣ�����
 */
private String aml_acct_type_cd = "";
/** �������� */
private Date mature_dt = new Date();
/** ������ */
private String cust_manager = "";
/** ƾ֤�� */
private String token_id = "";
/** ���� */
private String organkey = "";
/** ����˻����� */
private String ib_type_cd = "";
/** �˺����η� */
private String acct_modifier_num = "";
/** ԭ�ͻ��� */
private String host_cust_id = "";
/** �ϱʷ������� */
private Date last_occur_dt = new Date();
/** �˻�״̬:��һλ:����״̬0:δ���� 1:���� �ڶ�λ:��ʧ״̬0:δ��ʧ 1:��ʧ�ڶ�λ���ո���־0:���տɸ�1:ֻ�ղ��� 2:ֻ������3:���ղ��� */
private String acct_status_cd = "";
/** ����ʱ�� */
private Date close_dt = new Date();
/** ��Ϣ��־:0:����Ϣ 1:��Ϣ
 */
private String int_cal_method_cd = "";
/** �ϴθ���ʱ�� */
private Date last_upd_dt = new Date();
/** ������� */
private String open_amt = "";
/** ������� */
private String last_amt_val = "";
//=======================================================
/** ����ʱ�� */
private String open_dt_disp = "";
/** ��Ϣ���� */
private String acct_processing_dt_disp = "";
/** �������� */
private String mature_dt_disp = "";
/** �ϱʷ������� */
private String last_occur_dt_disp = "";
/** ����ʱ�� */
private String close_dt_disp = "";
/** �ϴθ���ʱ�� */
private String last_upd_dt_disp = "";

	// -- add by liulb 2007.1.6 -- //
	// ������ֹ����
	private Date openBeginDate = null;
	private String openBeginDate_disp;
	private Date openEndDate = null;
	private String openEndDate_disp;
	// ������ֹ����
	private Date closeBeginDate = null;
	private String closeBeginDate_disp;
	private Date closeEndDate = null;
	private String closeEndDate_disp;

	// ����������
	private String searchOrganName = "";

	// �˻�״̬��־λ
	private String acct_status_cd_flag;
	private String acct_status_cd_flag_disp;

	// �����ֶ�
	private String acctSortSelect;

	// ����ʽ
	private String orderByRadio = "asc";

	// �������ƴ�
	private String organKeys = "";
	// �˻���������
	private String acct_type_cd_disp = "";
	
	public String getOrganKeys() {
		return organKeys;
	}
	public void setOrganKeys(String organKeys) {
		this.organKeys = organKeys;
	}
	// -- end add by liulb 2007.1.6 -- //
    /**                   
     * ���캯��           
     */                   
    public T47_id_deposit() {    
    } 
    
  
public String getCurrency_cd_disp() {
		return currency_cd_disp;
	}
	public void setCurrency_cd_disp(String currency_cd_disp) {
		this.currency_cd_disp = currency_cd_disp;
	}
public void setAcct_type_cd(String acct_type_cdStr){
this.acct_type_cd = acct_type_cdStr;
}
public String getAcct_type_cd(){
return this.acct_type_cd;
}

public void setAcct_category_cd(String acct_category_cdStr){
this.acct_category_cd = acct_category_cdStr;
}
public String getAcct_category_cd(){
return this.acct_category_cd;
}

public void setAmt_val(String amt_valStr){
this.amt_val = amt_valStr;
}
public String getAmt_val(){
return this.amt_val;
}

public void setSubjectno(String subjectnoStr){
this.subjectno = subjectnoStr;
}
public String getSubjectno(){
return this.subjectno;
}

public void setCurrency_cd(String currency_cdStr){
this.currency_cd = currency_cdStr;
}
public String getCurrency_cd(){
return this.currency_cd;
}

public void setCard_no(String card_noStr){
this.card_no = card_noStr;
}
public String getCard_no(){
return this.card_no;
}

public void setParty_chn_name(String party_chn_nameStr){
this.party_chn_name = party_chn_nameStr;
}
public String getParty_chn_name(){
return this.party_chn_name;
}

public void setCash_transfer_cd(String cash_transfer_cdStr){
this.cash_transfer_cd = cash_transfer_cdStr;
}
public String getCash_transfer_cd(){
return this.cash_transfer_cd;
}

public void setOpen_dt(Date open_dtStr){
this.open_dt = open_dtStr;
}
public Date getOpen_dt(){
return this.open_dt;
}

public void setAcct_num(String acct_numStr){
this.acct_num = acct_numStr;
}
public String getAcct_num(){
return this.acct_num;
}

public void setParty_id(String party_idStr){
this.party_id = party_idStr;
}
public String getParty_id(){
return this.party_id;
}

public void setAttr_val(String attr_valStr){
this.attr_val = attr_valStr;
}
public String getAttr_val(){
return this.attr_val;
}

public void setIb_property_cd(String ib_property_cdStr){
this.ib_property_cd = ib_property_cdStr;
}
public String getIb_property_cd(){
return this.ib_property_cd;
}

public void setAcct_processing_dt(Date acct_processing_dtStr){
this.acct_processing_dt = acct_processing_dtStr;
}
public Date getAcct_processing_dt(){
return this.acct_processing_dt;
}

public void setAml_acct_type_cd(String aml_acct_type_cdStr){
this.aml_acct_type_cd = aml_acct_type_cdStr;
}
public String getAml_acct_type_cd(){
return this.aml_acct_type_cd;
}

public void setMature_dt(Date mature_dtStr){
this.mature_dt = mature_dtStr;
}
public Date getMature_dt(){
return this.mature_dt;
}

public void setCust_manager(String cust_managerStr){
this.cust_manager = cust_managerStr;
}
public String getCust_manager(){
return this.cust_manager;
}

public void setToken_id(String token_idStr){
this.token_id = token_idStr;
}
public String getToken_id(){
return this.token_id;
}

public void setOrgankey(String organkeyStr){
this.organkey = organkeyStr;
}
public String getOrgankey(){
return this.organkey;
}

public void setIb_type_cd(String ib_type_cdStr){
this.ib_type_cd = ib_type_cdStr;
}
public String getIb_type_cd(){
return this.ib_type_cd;
}

public void setAcct_modifier_num(String acct_modifier_numStr){
this.acct_modifier_num = acct_modifier_numStr;
}
public String getAcct_modifier_num(){
return this.acct_modifier_num;
}

public void setHost_cust_id(String host_cust_idStr){
this.host_cust_id = host_cust_idStr;
}
public String getHost_cust_id(){
return this.host_cust_id;
}

public void setLast_occur_dt(Date last_occur_dtStr){
this.last_occur_dt = last_occur_dtStr;
}
public Date getLast_occur_dt(){
return this.last_occur_dt;
}

public void setAcct_status_cd(String acct_status_cdStr){
this.acct_status_cd = acct_status_cdStr;
if(acct_status_cdStr!=null){
this.setAcct_status_cd_flag(acct_status_cd.substring(0, 1));
}
}
public String getAcct_status_cd(){
return this.acct_status_cd;
}

public void setClose_dt(Date close_dtStr){
this.close_dt = close_dtStr;
}
public Date getClose_dt(){
return this.close_dt;
}

public void setInt_cal_method_cd(String int_cal_method_cdStr){
this.int_cal_method_cd = int_cal_method_cdStr;
}
public String getInt_cal_method_cd(){
return this.int_cal_method_cd;
}

public void setLast_upd_dt(Date last_upd_dtStr){
this.last_upd_dt = last_upd_dtStr;
}
public Date getLast_upd_dt(){
return this.last_upd_dt;
}

public void setOpen_amt(String open_amtStr){
this.open_amt = open_amtStr;
}
public String getOpen_amt(){
return this.open_amt;
}

public void setLast_amt_val(String last_amt_valStr){
this.last_amt_val = last_amt_valStr;
}
public String getLast_amt_val(){
return this.last_amt_val;
}

//=======================================================
public void setOpen_dt_disp(String open_dt_dispStr){
this.open_dt_disp = open_dt_dispStr;
}
public String getOpen_dt_disp(){
return this.open_dt_disp;
}

public void setAcct_processing_dt_disp(String acct_processing_dt_dispStr){
this.acct_processing_dt_disp = acct_processing_dt_dispStr;
}
public String getAcct_processing_dt_disp(){
return this.acct_processing_dt_disp;
}

public void setMature_dt_disp(String mature_dt_dispStr){
this.mature_dt_disp = mature_dt_dispStr;
}
public String getMature_dt_disp(){
return this.mature_dt_disp;
}

public void setLast_occur_dt_disp(String last_occur_dt_dispStr){
this.last_occur_dt_disp = last_occur_dt_dispStr;
}
public String getLast_occur_dt_disp(){
return this.last_occur_dt_disp;
}

public void setClose_dt_disp(String close_dt_dispStr){
this.close_dt_disp = close_dt_dispStr;
}
public String getClose_dt_disp(){
return this.close_dt_disp;
}

public void setLast_upd_dt_disp(String last_upd_dt_dispStr){
this.last_upd_dt_disp = last_upd_dt_dispStr;
}
public String getLast_upd_dt_disp(){
return this.last_upd_dt_disp;
}
public String getAcct_status_cd_flag() {
	return acct_status_cd_flag;
}
public void setAcct_status_cd_flag(String acct_status_cd_flag) {
	this.acct_status_cd_flag = acct_status_cd_flag;
}
public String getAcctSortSelect() {
	return acctSortSelect;
}
public void setAcctSortSelect(String acctSortSelect) {
	this.acctSortSelect = acctSortSelect;
}

public Date getCloseBeginDate() {
	return closeBeginDate;
}
public Date getCloseEndDate() {
	return closeEndDate;
}
public Date getOpenBeginDate() {
	return openBeginDate;
}
public Date getOpenEndDate() {
	return openEndDate;
}
public String getOrderByRadio() {
	return orderByRadio;
}
public void setOrderByRadio(String orderByRadio) {
	this.orderByRadio = orderByRadio;
}
public String getSearchOrganName() {
	return searchOrganName;
}
public void setSearchOrganName(String searchOrganName) {
	this.searchOrganName = searchOrganName;
}
public String getAcct_status_cd_flag_disp() {
	return acct_status_cd_flag_disp;
}
public void setAcct_status_cd_flag_disp(String acct_status_cd_flag_disp) {
	this.acct_status_cd_flag_disp = acct_status_cd_flag_disp;
}
public String getAcct_type_cd_disp() {
	return acct_type_cd_disp;
}
public void setAcct_type_cd_disp(String acct_type_cd_disp) {
	this.acct_type_cd_disp = acct_type_cd_disp;
}
public String getCloseBeginDate_disp() {
	return closeBeginDate_disp;
}
public void setCloseBeginDate_disp(String closeBeginDate_disp) {
	this.closeBeginDate_disp = closeBeginDate_disp;
}
public String getCloseEndDate_disp() {
	return closeEndDate_disp;
}
public void setCloseEndDate_disp(String closeEndDate_disp) {
	this.closeEndDate_disp = closeEndDate_disp;
}
public String getOpenBeginDate_disp() {
	return openBeginDate_disp;
}
public void setOpenBeginDate_disp(String openBeginDate_disp) {
	this.openBeginDate_disp = openBeginDate_disp;
}
public String getOpenEndDate_disp() {
	return openEndDate_disp;
}
public void setOpenEndDate_disp(String openEndDate_disp) {
	this.openEndDate_disp = openEndDate_disp;
}
public void setCloseBeginDate(Date closeBeginDate) {
	this.closeBeginDate = closeBeginDate;
}
public void setCloseEndDate(Date closeEndDate) {
	this.closeEndDate = closeEndDate;
}
public void setOpenBeginDate(Date openBeginDate) {
	this.openBeginDate = openBeginDate;
}
public void setOpenEndDate(Date openEndDate) {
	this.openEndDate = openEndDate;
}

}

