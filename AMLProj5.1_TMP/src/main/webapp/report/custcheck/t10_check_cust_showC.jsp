<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_check_cust_show.do" method="post">
<div class="conditions">
	<div class="cond_c2">
    <table border="0" cellspacing="0" cellpadding="0">
	 <tr>
	    <th colspan="4">�ͻ��ſ�</th>
	 </tr>
   	 <tr>
		<td>�ͻ��ţ�</td>
		<td><bean:write property="party_id" name="t10_survey_cust" /></td>
		<td>�ͻ����ƣ�</td>
		<td><bean:write property="party_chn_name" name="t10_survey_cust" /></td>
	 </tr>
	 <tr>
		<td>Ӫҵִ�պţ�</td>
		<td><bean:write property="business_licence" name="t10_survey_cust" /></td>
		<td>Ӫҵִ�յ����գ�</td>
		<td><bean:write property="licence_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>
		   �ͻ��������ͣ�
		</td>
		<td>
		   <logic:iterate id="list_type" name="list_typeList">
                <bean:write name="list_type" />&nbsp;&nbsp;&nbsp;&nbsp;
                <br/>
                <br/>
            </logic:iterate>
		</td>
		<td>����ҵ���ϵ���ڣ�</td>
		<td><bean:write property="create_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	    <th colspan="4">��˾��Ϣ</th>
	  </tr>
	  <tr>
		<td>��֯�������룺</td>
		<td><bean:write property="organ_code" name="t10_survey_cust" /></td>
		<td>��֯�������뵽���գ�</td>
		<td><bean:write property="organ_code_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>�������ô��룺</td>
		<td><bean:write property="org_credit_no" name="t10_survey_cust" /></td>
		<td>�������ô�����Ч�ڣ�</td>
		<td>
		<bean:write property="org_credit_vt_disp" name="t10_survey_cust" />
		</td>
	  </tr>
	  <tr>
		<td>��˰�Ǽ�֤�ţ�</td>
		<td><bean:write property="nation_affair_no" name="t10_survey_cust" /></td>
		<td>��˰�Ǽ�֤�����գ�</td>
		<td><bean:write property="nation_affair_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>��˰�Ǽ�֤�ţ�</td>
		<td><bean:write property="local_affair_no" name="t10_survey_cust" /></td>
		<td>��˰�Ǽ�֤�����գ�</td>
		<td><bean:write property="local_affair_end_dt_disp" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	    <td>ע���ʽ�</td>
	    <td><bean:write property="enrol_fund_amt" name="t10_survey_cust" /></td>
		<td>ע���ʽ���֣�</td>
		<td><bean:write property="enrol_fund_currency_cd" name="t10_survey_cust" /></td>
      </tr>
	  <tr>
		<td>�����˺ţ�</td>
		 <td><bean:write property="base_acct_num" name="t10_survey_cust" /></td>
		<td>�����˺Ź����У�</td>
		<td><bean:write property="base_bank_id" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>�����˺Ź������㣺</td>
		<td><bean:write property="base_bank_org" name="t10_survey_cust" /></td>
		<td>��Ӫ��Χ��</td>
		<td><bean:write property="main_manage_scope" name="t10_survey_cust" /></td>
	  </tr>
	   <tr>
		<td>��ҵ��</td>
		<td><bean:write property="industrykey" name="t10_survey_cust" /></td>
		<td>��ҵ���ͣ�</td>
		<td><bean:write property="company_type_cd" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>��Ӫҵ��</td>
		<td><bean:write property="main_manage_scope" name="t10_survey_cust" /></td>
		<td>���˴���</td>
		<td><bean:write property="legal_obj" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>���˴���֤�����ͣ�</td>
		<td><bean:write property="legal_card_type" name="t10_survey_cust" /></td>
		<td>���˴���֤�����룺</td>
		<td><bean:write property="legal_card_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>���˾�ס�أ�</td>
		<td><bean:write property="legal_addr" name="t10_survey_cust" /></td>
		<td>������ϵ��ʽ��</td>
		<td><bean:write property="legal_tel" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>����������֤�������գ�</td>
		<td><bean:write property="legal_card_no_end_dt_disp" name="t10_survey_cust" /></td>
		<td></td>
		<td></td>
	  </tr>
	  <tr>
	    <th colspan="4">ͨѶ��Ϣ</th>
	  </tr>
	  <tr>
		<td>ͨ�ŵ�ַ��</td>
		<td><bean:write property="addr1" name="t10_survey_cust" /></td>
		<td>��ϵ�绰��</td>
		<td><bean:write property="tel_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	     <td>�ƶ��绰��</td>
		<td colspan="3"><bean:write property="cell_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
	  <th colspan="4">������Ϣ</th>
	  </tr>
	  <tr>
		<td>�ͻ�����ţ�</td>
		<td><bean:write property="manager_no" name="t10_survey_cust" /></td>
		<td>�ͻ���������</td>
		<td><bean:write property="manager_name" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>�������룺</td>
		<td><bean:write property="country_residence" name="t10_survey_cust" /></td>
		<td>���ñ�־��</td>
		<td><bean:write property="flag" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td>����������Ϣ��</td>
		<td colspan="3"><html:textarea property="other_info" name="t10_survey_cust" rows="4" cols="100" styleId="other_info"></html:textarea></td>
	  </tr>
	</table>
    </div>
    </div>
</html:form> 
</body>
</html>
