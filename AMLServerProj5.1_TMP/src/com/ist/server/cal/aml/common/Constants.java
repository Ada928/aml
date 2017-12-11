package com.ist.server.cal.aml.common;

public final class Constants {

	public static final String SYSINDICFLAG = "JC";
	public static final String SXINDICFLAG = "SX";
	/** ��˾��־ */
	public static final String CORPTATION = "C";
	/** ���˱�־ */
	public static final String INDIVIDIUAL = "I";
	public static final String DATEDIFF = "DIFF";
	public static final int DEALDAY = 10;
	public static final String BH = "BH";
	public static final String BS = "BS";
	/** ������֤�ĳ�ʼֵ **/
	public static final String TRANS_VIND = "2";

	public static final String DATE_STATUS_CD = "2";
	/** Ԥ��δ����״̬ **/
	public static final String ALERT_STATUS_CD = "0";
	/** ϵͳԤ�� **/
	public static final String SYS_ALERT = "1";
	/** Ԥ�����ʹ�� **/
	public static final String ALERT_TYPE_CD_D = "1";
	public static final String ALERT_TYPE_CD_DE = "DE";
	/** Ԥ�����Ϳ��� **/
	public static final String ALERT_TYPE_CD_Y = "2";
	public static final String ALERT_TYPE_CD_KY = "KY";

	public static final String TRUE = "1";
	// ���ɰ����Ĺ������
	public static final String pbckeytype = "'1','3'";
	// Ԥ��״̬
	public static final String alert_status = "2";

	/** ���ұ�־ */
	public static String BEN_CURR = "1";
	/** ��ұ�־ */
	public static String WAI_CURR = "2";

	/** ��������ID **/
	public static final String FLOW_ID = "01";
	public static final String FLOW_IDK = "02";
	public static final String FLOW_ID_WB = "03";
	public static final String FLOW_IDK_WB = "04";
	public static final String FLOW_NET_B = "05";// ������Ҷ�˽����

	/** ��λID **/
	public static final String POST_ID = "P0102"; // ���ұ༭��
	public static final String POST_ID_WB = "P0302";
	public static final String POST_NET_ID = "P0502";

	/** �ڵ�ID **/
	public static final String NODE_ID = "N0102"; // ���Ҵ��
	public static final String NODE_IDK = "N0202"; // ���ҿ���
	public static final String NODE_ID_WB = "N0302"; // ���Ҵ��
	public static final String NODE_IDK_WB = "N0402"; // ���ҿ���
	public static final String NODE_NET_ID = "N0502"; // ���ҿ���
	/** ������������ **/
	public static final String CASE_KIND = "N";

	/** �����ļ�����չ�� **/
	public static final String RULE_EXT = "drl";

	/** ��������ʵ���� **/
	public static final String RULE_ENGINE_CLASS = "RuleEngine";

	/** ����������־ **/
	public static final String CHECK_STATE_CD = "2";
	/** ��־������Ϣ **/
	public static final String FILE_READ_ERROR = "��ȡ�����ļ�ʧ��:����IO�쳣��";

	/** �ļ����ش��� **/
	public static final String FILE_LOAD_ERROR = "װ�ع����ļ�ʱ����,��ȷ���ļ��Ƿ���ڲ���֤�����ļ���Ĺ���������";

	/** �����ļ��﷨���� **/
	public static final String RULE_FILE_SYNTAX_ERROR = "�����ļ��﷨�д���";

	/** RuleBase���� **/
	public static final String RULEBASE_NOT_INIT_ERROR = "û�г�ʼ����RuleBase����";

	/** rulebase��ʼ������ **/
	public static final String RULEBASE_INIT_ERROR = "��ʼ��RuleBaseʧ�ܣ�";

	/** ���������ʼ������ **/
	public static final String ENGINE_INIT_ERROR = "��ʼ���������, ";

	/** �Ҳ�������������� **/
	public static final String ENGINE_NOT_FOUNT_ERROR = "�Ҳ����������������!";

	/** ����������� **/
	public static final String ENGINE_LOAD_ERROR = "�������������:";

	/** ��ȡ�������͹����ļ������� **/
	public static final String RULE_NAME_MSGFROMDB_ERROR = "�����ݿ��л�ȡ�������͹����ļ���ʧ�ܣ�";

	/** ����ش��� **/
	public static final String CLASS_LOAD_DEFAULt_ERROR = "������ʧ�ܣ��Ҳ�����Ӧ���࣡";

	public static final String OBJIND = "01";
	public static final String DOBJIND = "02";
	public static String DPTABLE = "T67_P_M_ATTR";
	public static String DATABLE = "T67_A_M_ATTR";
	public static String TRANS_IND = "1";
	/** �ͻ���־ */
	public static String PARTY = "1";
	/** �Է��ͻ���־ */
	public static String OPP_PARTY = "1";
	/** ��Σ�ͻ���Ԥ������ */
	public static final String ALERTYPARTYNUMGF = "10";
	/** ��Σ�ͻ���Ԥ������ */
	public static final String ALERTYPARTYNUMGZ = "5";
	/** ��Σ�ͻ���Ԥ��������1�ǰ����ͳ�ƣ�2������ͳ�ƣ�3���ִ��Ϳ��� */
	public static String PARTYALERTCD = "0";// �жϸ�Σ�ͻ���ͨ�����ǿ���Ԥ�������Ǵ����ǿ��ɣ����ǲ��ִ��Ϳ���
	public static final String ATTR_VAL_GF = "02";// ��Σ�ͻ�
	public static final String ATTR_VAL_GZ = "03";// ��ע�ͻ�
	public static final String GRANULARITYS_M = "4";// ��ע�ͻ�
	/** ���˳��ڲ���key */
	public static final String ID_LPARAKEY = "";
	/** ��˾���ڲ���key */
	public static final String CP_LPARAKEY = "";
	/** ���˶��ڲ���key */
	public static final String ID_SPARAKEY = "10104";
	/** ��˾���ڲ���key */
	public static final String CP_SPARAKEY = "10103";
	/** ��������Ƶ������key */
	public static final String ID_OPARAKEY = "10125";
	/** ��˾����Ƶ������key */
	public static final String CP_OPARAKEY = "10124";
	/**�ӣ٣£��ӣ����ݿ� **/
	public static final String DATEBASE = "SYBASE";
	/** �����ļ������ռ� * */
	public static final Class DRL_NAME_SPACE = com.ist.server.cal.aml.jrules.rules.RuleNS.class;
	/** �˻���־ */
	public static String ACCT = "2";
    public static final String KY18 = "KY18";  
    
	/**  �˹�Ԥ�� **/
	public static final String MANUAL_ALERT = "2";
	/**  ������Чʱ�� **/
	public static final String num = "6";
	public static final String obj_type1 = "1";
	public static final String obj_type3 = "3";
	public static final String obj_type4 = "4"; //���׽�������ʻ��Ŀ�������.
	public static final String take_action = "������ע";
	public static final String RISK_CHECK_STATUS = "'2','3','4','5','6'"; //�����
	public static final String RISK_NOCHECK_STATUS = "'0','1'"; //�����
	public static final String MOVERISKLEVEL = "'1001','1022','1023'"; //�����
	 /** ��̬�������ͣ�{1����Ȼ��}{2��������}{3����Ȼ����} */
	   public static final String DYNA_IND_ND = "1"; //��Ȼ��
	   public static final String DYNA_IND_WD = "2"; //������
	   public static final String DYNA_IND_NC = "3"; //��Ȼ����
	public static final String ACTIONDESC = "3.�����з����������жϸñ��������������Ϊ�����������Ϊ����Ϊ��"; //��Ϊ����ǰ��
	public static final String RULEDESC = "2.�ÿ��ɱ��������������������"; //��������ǰ��

	//����Ԥ��������ɸѡ����t01_function_param����paramcd�ֶε�ֵ  start -------------------------
	public static final String MFA_DT = "s_0100"; 
	//����Ԥ��������ɸѡ����t01_function_param����paramcd�ֶε�ֵ  end   -------------------------
	
	//Ԥ�����ӻ���ǰ׺�ĳ��ȣ�������㣬��0
	public static final int ORGANKEY_TOTAL_LENGTH=16; 
}
