package com.ist.aml.report.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T07_nbs_ctifActionForm extends ActionForm {

	private String reportkey="";//�������
	private String totalRow="";//��������
	private String ctif_seqno="";//�ͻ����
	private String ctnm	="";//�ͻ�����
	private String citp	="";//�ͻ�֤������
	private String card_type_inf="";
	private String ctid	="";//�ͻ�֤������
	private String csnm	="";//�ͻ���
	private String cttp	="";//�ͻ�����
	private String cctl	="";//��ϵ�绰
	private String tel_no="";
	private String ctar	="";//�ͻ���ϸ��ַ
	private String addr1	="";
	private String ccei	="";//�ͻ�������ϵ��ʽ
	private String otherContact="";
	private String ctnt	="";//�ͻ�����
	private String ctvc	="";//��˽�ͻ���ְҵ��Թ��ͻ�����ҵ���
	private String ctvc_i="";
	private String rgcp	="";//�Թ��ͻ�ע���ʽ�
	private String enrol_fund_amt="";
	private String crnm	="";//�Թ��ͻ���������������
	private String legal_obj="";
	private String crit	="";//�Թ��ͻ��������������֤������
	private String legal_card_type="";
	private String legal_card_type_inf="";
	private String crid	="";//�Թ��ͻ��������������֤������
	private String legal_card_no="";
	private String atnm	="";//�˻�����
	private String validate_ind	="";//�Ƿ�ͨ����֤
	private String organkey="";
	
	
	private String finm="";//���ڻ�������
	private String firc="";//���ڻ������ڵ���������������
	private String firc_disp="";
	private String trcd=""; //���������壬ֻ��Ϊ�˴�firc���ֵ
	private String ficd="";//���ڻ�������
	
	private String stcr="";//���ɽ�������
	private String[] stcrs={};//���ɽ�������
	private String ssdg="";//���ɳ̶�
	private String tkms="";//��ȡ��ʩ
	private String ssds="";//������Ϊ����
	private String cttn="";//�ͻ�����
	private String ttnm="";//���ɽ����ܱ���
	private String rpnm="";//���
	private String rpdt_disp="";//������������
	private Date rpdt=null;
	private String is_party="1";//�Ƿ��пͻ�
	
	
	private String party_chn_name = ""; // �ͻ�����
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

	public String getCard_type_val() {
		return card_type_val;
	}

	public void setCard_type_val(String cardTypeVal) {
		card_type_val = cardTypeVal;
	}

	public String getCard_no() {
		return card_no;
	}

	public void setCard_no(String cardNo) {
		card_no = cardNo;
	}

	public String getHost_cust_id() {
		return host_cust_id;
	}

	public void setHost_cust_id(String hostCustId) {
		host_cust_id = hostCustId;
	}

	public String getCountry_cd() {
		return country_cd;
	}

	public void setCountry_cd(String countryCd) {
		country_cd = countryCd;
	}

	public String getCrcd() {
		return crcd;
	}

	public void setCrcd(String crcd) {
		this.crcd = crcd;
	}

	public String getTotalCny() {
		return totalCny;
	}

	public void setTotalCny(String totalCny) {
		this.totalCny = totalCny;
	}

	public String getTotalUsd() {
		return totalUsd;
	}

	public void setTotalUsd(String totalUsd) {
		this.totalUsd = totalUsd;
	}

	private String card_type = ""; // �ͻ�֤������

	private String card_type_val="";//�ͻ�֤��������֤�õ�
	private String card_no = ""; // �ͻ�֤������
	private String host_cust_id = ""; // �ͻ���
	private String country_cd = ""; // �ͻ�����

	private String crcd = ""; // �������

	private String totalCny="";
	private String totalUsd="";
	
	
	/**��������	 */
	private String case_kind="";
	/**����	 */
	private String curr_cd="";
	public T07_nbs_ctifActionForm() {
		// TODO Auto-generated constructor stub
	}
	
	public String getEnrol_fund_amt() {
		return enrol_fund_amt;
	}

	public void setEnrol_fund_amt(String enrol_fund_amt) {
		this.enrol_fund_amt = enrol_fund_amt;
	}

	public String getLegal_obj() {
		return legal_obj;
	}

	public void setLegal_obj(String legal_obj) {
		this.legal_obj = legal_obj;
	}

	public String getLegal_card_type() {
		return legal_card_type;
	}

	public void setLegal_card_type(String legal_card_type) {
		this.legal_card_type = legal_card_type;
	}

	public String getLegal_card_no() {
		return legal_card_no;
	}

	public void setLegal_card_no(String legal_card_no) {
		this.legal_card_no = legal_card_no;
	}

	public String getCtvc_i() {
		return ctvc_i;
	}

	public void setCtvc_i(String ctvc_i) {
		this.ctvc_i = ctvc_i;
	}

	public String getTel_no() {
		return tel_no;
	}

	public void setTel_no(String tel_no) {
		this.tel_no = tel_no;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getOtherContact() {
		return otherContact;
	}

	public void setOtherContact(String otherContact) {
		this.otherContact = otherContact;
	}

	public String getFirc_disp() {
		return firc_disp;
	}

	public void setFirc_disp(String firc_disp) {
		this.firc_disp = firc_disp;
	}

	public String getTrcd() {
		return trcd;
	}

	public void setTrcd(String trcd) {
		this.trcd = trcd;
	}

	public String getLegal_card_type_inf() {
		return legal_card_type_inf;
	}

	public void setLegal_card_type_inf(String legal_card_type_inf) {
		this.legal_card_type_inf = legal_card_type_inf;
	}

	public String[] getStcrs() {
		return stcrs;
	}

	public void setStcrs(String[] stcrs) {
		this.stcrs = stcrs;
	}

	public String getReportkey() {
		return reportkey;
	}

	public void setReportkey(String reportkey) {
		this.reportkey = reportkey;
	}

	public String getTotalRow() {
		return totalRow;
	}

	public void setTotalRow(String totalRow) {
		this.totalRow = totalRow;
	}

	public String getCtif_seqno() {
		return ctif_seqno;
	}

	public void setCtif_seqno(String ctif_seqno) {
		this.ctif_seqno = ctif_seqno;
	}

	public String getCtnm() {
		return ctnm;
	}

	public void setCtnm(String ctnm) {
		this.ctnm = ctnm;
	}

	public String getCitp() {
		return citp;
	}

	public void setCitp(String citp) {
		this.citp = citp;
	}

	public String getCard_type_inf() {
		return card_type_inf;
	}

	public void setCard_type_inf(String card_type_inf) {
		this.card_type_inf = card_type_inf;
	}

	public String getCtid() {
		return ctid;
	}

	public void setCtid(String ctid) {
		this.ctid = ctid;
	}

	public String getCsnm() {
		return csnm;
	}

	public void setCsnm(String csnm) {
		this.csnm = csnm;
	}

	public String getCttp() {
		return cttp;
	}

	public void setCttp(String cttp) {
		this.cttp = cttp;
	}

	public String getCctl() {
		return cctl;
	}

	public void setCctl(String cctl) {
		this.cctl = cctl;
	}

	public String getCtar() {
		return ctar;
	}

	public void setCtar(String ctar) {
		this.ctar = ctar;
	}

	public String getCcei() {
		return ccei;
	}

	public void setCcei(String ccei) {
		this.ccei = ccei;
	}

	public String getCtnt() {
		return ctnt;
	}

	public void setCtnt(String ctnt) {
		this.ctnt = ctnt;
	}

	public String getCtvc() {
		return ctvc;
	}

	public void setCtvc(String ctvc) {
		this.ctvc = ctvc;
	}

	public String getRgcp() {
		return rgcp;
	}

	public void setRgcp(String rgcp) {
		this.rgcp = rgcp;
	}

	public String getCrnm() {
		return crnm;
	}

	public void setCrnm(String crnm) {
		this.crnm = crnm;
	}

	public String getCrit() {
		return crit;
	}

	public void setCrit(String crit) {
		this.crit = crit;
	}

	public String getCrid() {
		return crid;
	}

	public void setCrid(String crid) {
		this.crid = crid;
	}

	public String getAtnm() {
		return atnm;
	}

	public void setAtnm(String atnm) {
		this.atnm = atnm;
	}

	public String getValidate_ind() {
		return validate_ind;
	}

	public void setValidate_ind(String validate_ind) {
		this.validate_ind = validate_ind;
	}

	public String getFinm() {
		return finm;
	}

	public void setFinm(String finm) {
		this.finm = finm;
	}

	public String getFirc() {
		return firc;
	}

	public void setFirc(String firc) {
		this.firc = firc;
	}

	public String getFicd() {
		return ficd;
	}

	public void setFicd(String ficd) {
		this.ficd = ficd;
	}

	public String getStcr() {
		return stcr;
	}

	public void setStcr(String stcr) {
		this.stcr = stcr;
	}

	public String getSsdg() {
		return ssdg;
	}

	public void setSsdg(String ssdg) {
		this.ssdg = ssdg;
	}

	public String getTkms() {
		return tkms;
	}

	public void setTkms(String tkms) {
		this.tkms = tkms;
	}

	public String getSsds() {
		return ssds;
	}

	public void setSsds(String ssds) {
		this.ssds = ssds;
	}

	public String getCttn() {
		return cttn;
	}

	public void setCttn(String cttn) {
		this.cttn = cttn;
	}

	public String getTtnm() {
		return ttnm;
	}

	public void setTtnm(String ttnm) {
		this.ttnm = ttnm;
	}

	public String getRpnm() {
		return rpnm;
	}

	public void setRpnm(String rpnm) {
		this.rpnm = rpnm;
	}

	public String getRpdt_disp() {
		return rpdt_disp;
	}

	public void setRpdt_disp(String rpdt_disp) {
		this.rpdt_disp = rpdt_disp;
	}

	public Date getRpdt() {
		return rpdt;
	}

	public void setRpdt(Date rpdt) {
		this.rpdt = rpdt;
	}

	public String getCase_kind() {
		return case_kind;
	}

	public void setCase_kind(String case_kind) {
		this.case_kind = case_kind;
	}

	public String getCurr_cd() {
		return curr_cd;
	}

	public void setCurr_cd(String curr_cd) {
		this.curr_cd = curr_cd;
	}

	public String getIs_party() {
		return is_party;
	}

	public void setIs_party(String is_party) {
		this.is_party = is_party;
	}

	public String getOrgankey() {
		return organkey;
	}

	public void setOrgankey(String organkey) {
		this.organkey = organkey;
	}


	
}
