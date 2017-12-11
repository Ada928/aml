package com.ist.aml.blacklist.controller;

import java.util.Date;

import org.apache.struts.action.ActionForm;

public class T52_def_remountActionForm extends ActionForm
{
	private String id							= "";		// ������id
	private String party_id						= ""; 		// �ͻ���
	private String organkey						= "";		// ������
	private String party_class_cd				= "";		// �ͻ�����  ���������� C:�Թ������� I:���˵�����
	private String party_chn_name				= "";		// ������
	private String name							= "";		// �ͻ���
	private String country_cd					= ""; 		// ��������
	private String card_type					= "";		// ֤������
	private String card_no						= "";		// ֤������
	private String transactionkey				= ""; 		// ҵ���ʶ
	
	/* �������� */
	private String organkeys 					= "";		// ��������
	private String organName					= ""; 		// ��������
	private String intPage 						= "";		// ��ҳ��Ϣ
	private String party_chn_name_s				= "";
	private String card_no_s					= "";
	private String party_id_s					= "";
	private String card_type_s 					= "";
	
	
	/** ���ݽ�����Ϣ */
	private String tx_type_cd 					= "";		// �������� 
	private String tx_type_cd_disp 				= "";		// ��������
	private String debit_credit 				= "";		// �����־
	private String debit_credit_disp 			= ""; 		// 0:�� 1����
	private String currency_cd			 		= "";		// ����
	private String currency_cd_disp				= "";
	private Double amt			 				= null;		// ԭ�ҽ��׽��
	private String amt_disp						= "";
	private Double cny_amt 						= null;		// �������
	private String cny_amt_disp					= "";
	private String cash_trans_flag 				= "";		// ��/ת��־ 
	private String cash_trans_flag_disp			= "";
	private Date tx_dt 							= null;		// ��������
	private String tx_dt_disp					= "";
	private String cal_ind						= "";
	/** ���׽������� */
	private String tx_enddt_disp		 		= "";
	/** ���׽������� */
	private Date tx_enddt 						=  null;
	/** ԭ�ҽ��׽�� */
	private Double amt_max_value 				= null;
	private Date dt_time 						= null;		// ����ʱ��
	private String dt_time_disp					= "";
	/** �������ڽ���ʱ�� */
	private Date tx_dtEnd 						= null;
	private String organkeystr 					= "";
	
	/** ���׽�� */
	private String amt_start_search 			= "";
	private String amt_end_search 				= "";
	
	//����
	private String orderby 						= "";
	private String order 						= "";
	
	/** ���׽�� */
	private Double amt_start 					= null;
	private Double amt_end 						= null;
	
	//��������
	private String channel						= "";
	
	
	/** ҵ������ */
	private String bus_type_cd 					= "";
	/**�ǹ�̨���׷�ʽ	"�ǹ�̨���׷�ʽ NON_DEPT_TYPE VARCHAR2(32) 11�����Ͻ��ף�
	 * 12��ͨ��POS�����ף�
	 *	13��ͨ���绰���ף�
	 *	14��ͨ���ȼ�������
	 *	15��ͨ��atm
	 *	16����������ѡ�����������Ӧ������������һ��˵������
	 *	�ǹ�̨���׷�ʽ���豸���� EQPT_CD VARCHAR2(500) �������Ͻ��ף���дIP��ַ��mac��ַ��֮��ʹ��@���ŷָ�������POS�����ף�
	 *	��дPOS����ţ����ڵ绰���ף���д�绰���룻�����ȼ������ף���дmac��ַ������atm���ף���дatm��š�
	*/
	private String non_dept_type				="";
	private String non_dept_typeDisp			="";
	/*�ո��ƥ�������01��ͨ����С��֧��ϵͳ�ͳ�����������Ľ���02��ͨ����������Ľ���03��ͨ����㽻��ϵͳ�Ľ���04�����ڽ���11��Ʊ������*/
	private String rcv_pay_type					= "";
	private String rcv_pay_typeDisp				= "";
	/*���п�����                       	01:��ǿ�02�����ǿ�*/ 
	private String card_style					= "";
	private String card_styleDisp				= "";
	/** ɸѡ��־��0��NULL  1�����ɸѡ  2������ɸѡ  3�����ɸѡ-����ɸѡ*/
	private String validate_flag 				= "";
	private String validate_flag_disp 			= "";
	
	
	public String getParty_id()
	{
		return party_id;
	}
	public void setParty_id(String party_id)
	{
		this.party_id = party_id;
	}
	public String getOrgankey()
	{
		return organkey;
	}
	public void setOrgankey(String organkey)
	{
		this.organkey = organkey;
	}
	public String getParty_class_cd()
	{
		return party_class_cd;
	}
	public void setParty_class_cd(String party_class_cd)
	{
		this.party_class_cd = party_class_cd;
	}
	public String getParty_chn_name()
	{
		return party_chn_name;
	}
	public void setParty_chn_name(String party_chn_name)
	{
		this.party_chn_name = party_chn_name;
	}
	public String getCountry_cd()
	{
		return country_cd;
	}
	public void setCountry_cd(String country_cd)
	{
		this.country_cd = country_cd;
	}
	public String getCard_type()
	{
		return card_type;
	}
	public void setCard_type(String card_type)
	{
		this.card_type = card_type;
	}
	public String getCard_no()
	{
		return card_no;
	}
	public void setCard_no(String card_no)
	{
		this.card_no = card_no;
	}
	public String getOrgankeys()
	{
		return organkeys;
	}
	public void setOrgankeys(String organkeys)
	{
		this.organkeys = organkeys;
	}
	public String getParty_chn_name_s()
	{
		return party_chn_name_s;
	}
	public void setParty_chn_name_s(String party_chn_name_s)
	{
		this.party_chn_name_s = party_chn_name_s;
	}
	public String getIntPage()
	{
		return intPage;
	}
	public void setIntPage(String intPage)
	{
		this.intPage = intPage;
	}
	public String getOrganName()
	{
		return organName;
	}
	public void setOrganName(String organName)
	{
		this.organName = organName;
	}
	public String getCard_no_s()
	{
		return card_no_s;
	}
	public void setCard_no_s(String card_no_s)
	{
		this.card_no_s = card_no_s;
	}
	public String getParty_id_s()
	{
		return party_id_s;
	}
	public void setParty_id_s(String party_id_s)
	{
		this.party_id_s = party_id_s;
	}
	public String getCard_type_s()
	{
		return card_type_s;
	}
	public void setCard_type_s(String card_type_s)
	{
		this.card_type_s = card_type_s;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getTransactionkey()
	{
		return transactionkey;
	}
	public void setTransactionkey(String transactionkey)
	{
		this.transactionkey = transactionkey;
	}
	public String getTx_type_cd()
	{
		return tx_type_cd;
	}
	public void setTx_type_cd(String tx_type_cd)
	{
		this.tx_type_cd = tx_type_cd;
	}
	public String getTx_type_cd_disp()
	{
		return tx_type_cd_disp;
	}
	public void setTx_type_cd_disp(String tx_type_cd_disp)
	{
		this.tx_type_cd_disp = tx_type_cd_disp;
	}
	public String getDebit_credit()
	{
		return debit_credit;
	}
	public void setDebit_credit(String debit_credit)
	{
		this.debit_credit = debit_credit;
	}
	public String getDebit_credit_disp()
	{
		return debit_credit_disp;
	}
	public void setDebit_credit_disp(String debit_credit_disp)
	{
		this.debit_credit_disp = debit_credit_disp;
	}
	public String getCurrency_cd()
	{
		return currency_cd;
	}
	public void setCurrency_cd(String currency_cd)
	{
		this.currency_cd = currency_cd;
	}
	public String getCurrency_cd_disp()
	{
		return currency_cd_disp;
	}
	public void setCurrency_cd_disp(String currency_cd_disp)
	{
		this.currency_cd_disp = currency_cd_disp;
	}
	public Double getAmt()
	{
		return amt;
	}
	public void setAmt(Double amt)
	{
		this.amt = amt;
	}
	public String getAmt_disp()
	{
		return amt_disp;
	}
	public void setAmt_disp(String amt_disp)
	{
		this.amt_disp = amt_disp;
	}
	public Double getCny_amt()
	{
		return cny_amt;
	}
	public void setCny_amt(Double cny_amt)
	{
		this.cny_amt = cny_amt;
	}
	public String getCny_amt_disp()
	{
		return cny_amt_disp;
	}
	public void setCny_amt_disp(String cny_amt_disp)
	{
		this.cny_amt_disp = cny_amt_disp;
	}
	public String getCash_trans_flag()
	{
		return cash_trans_flag;
	}
	public void setCash_trans_flag(String cash_trans_flag)
	{
		this.cash_trans_flag = cash_trans_flag;
	}
	public String getCash_trans_flag_disp()
	{
		return cash_trans_flag_disp;
	}
	public void setCash_trans_flag_disp(String cash_trans_flag_disp)
	{
		this.cash_trans_flag_disp = cash_trans_flag_disp;
	}
	public Date getTx_dt()
	{
		return tx_dt;
	}
	public void setTx_dt(Date tx_dt)
	{
		this.tx_dt = tx_dt;
	}
	public String getTx_dt_disp()
	{
		return tx_dt_disp;
	}
	public void setTx_dt_disp(String tx_dt_disp)
	{
		this.tx_dt_disp = tx_dt_disp;
	}
	public String getTx_enddt_disp()
	{
		return tx_enddt_disp;
	}
	public void setTx_enddt_disp(String tx_enddt_disp)
	{
		this.tx_enddt_disp = tx_enddt_disp;
	}
	public Date getTx_enddt()
	{
		return tx_enddt;
	}
	public void setTx_enddt(Date tx_enddt)
	{
		this.tx_enddt = tx_enddt;
	}
	public Double getAmt_max_value()
	{
		return amt_max_value;
	}
	public void setAmt_max_value(Double amt_max_value)
	{
		this.amt_max_value = amt_max_value;
	}
	public Date getDt_time()
	{
		return dt_time;
	}
	public void setDt_time(Date dt_time)
	{
		this.dt_time = dt_time;
	}
	public String getDt_time_disp()
	{
		return dt_time_disp;
	}
	public void setDt_time_disp(String dt_time_disp)
	{
		this.dt_time_disp = dt_time_disp;
	}
	public Date getTx_dtEnd()
	{
		return tx_dtEnd;
	}
	public void setTx_dtEnd(Date tx_dtEnd)
	{
		this.tx_dtEnd = tx_dtEnd;
	}
	public String getOrgankeystr()
	{
		return organkeystr;
	}
	public void setOrgankeystr(String organkeystr)
	{
		this.organkeystr = organkeystr;
	}
	public String getAmt_start_search()
	{
		return amt_start_search;
	}
	public void setAmt_start_search(String amt_start_search)
	{
		this.amt_start_search = amt_start_search;
	}
	public String getAmt_end_search()
	{
		return amt_end_search;
	}
	public void setAmt_end_search(String amt_end_search)
	{
		this.amt_end_search = amt_end_search;
	}
	public String getOrderby()
	{
		return orderby;
	}
	public void setOrderby(String orderby)
	{
		this.orderby = orderby;
	}
	public String getOrder()
	{
		return order;
	}
	public void setOrder(String order)
	{
		this.order = order;
	}
	public Double getAmt_start()
	{
		return amt_start;
	}
	public void setAmt_start(Double amt_start)
	{
		this.amt_start = amt_start;
	}
	public Double getAmt_end()
	{
		return amt_end;
	}
	public void setAmt_end(Double amt_end)
	{
		this.amt_end = amt_end;
	}
	public String getChannel()
	{
		return channel;
	}
	public void setChannel(String channel)
	{
		this.channel = channel;
	}
	public String getBus_type_cd()
	{
		return bus_type_cd;
	}
	public void setBus_type_cd(String bus_type_cd)
	{
		this.bus_type_cd = bus_type_cd;
	}
	public String getNon_dept_type()
	{
		return non_dept_type;
	}
	public void setNon_dept_type(String non_dept_type)
	{
		this.non_dept_type = non_dept_type;
	}
	public String getNon_dept_typeDisp()
	{
		return non_dept_typeDisp;
	}
	public void setNon_dept_typeDisp(String non_dept_typeDisp)
	{
		this.non_dept_typeDisp = non_dept_typeDisp;
	}
	public String getRcv_pay_type()
	{
		return rcv_pay_type;
	}
	public void setRcv_pay_type(String rcv_pay_type)
	{
		this.rcv_pay_type = rcv_pay_type;
	}
	public String getRcv_pay_typeDisp()
	{
		return rcv_pay_typeDisp;
	}
	public void setRcv_pay_typeDisp(String rcv_pay_typeDisp)
	{
		this.rcv_pay_typeDisp = rcv_pay_typeDisp;
	}
	public String getCard_style()
	{
		return card_style;
	}
	public void setCard_style(String card_style)
	{
		this.card_style = card_style;
	}
	public String getCard_styleDisp()
	{
		return card_styleDisp;
	}
	public void setCard_styleDisp(String card_styleDisp)
	{
		this.card_styleDisp = card_styleDisp;
	}
	public String getValidate_flag()
	{
		return validate_flag;
	}
	public void setValidate_flag(String validate_flag)
	{
		this.validate_flag = validate_flag;
	}
	public String getValidate_flag_disp()
	{
		return validate_flag_disp;
	}
	public void setValidate_flag_disp(String validate_flag_disp)
	{
		this.validate_flag_disp = validate_flag_disp;
	}
	public String getCal_ind()
	{
		return cal_ind;
	}
	public void setCal_ind(String cal_ind)
	{
		this.cal_ind = cal_ind;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}

}
