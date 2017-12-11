<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
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
		<td><bean:write property="party_chn_name" name="t10_survey_cust"/></td>
	  </tr>
   	  <tr>
		<td>�ͻ�����������</td>
		<td><bean:write property="organname" name="t10_survey_cust" /></td>
		<td>�ͻ�֤�����룺	</td>
		<td><bean:write property="card_no" name="t10_survey_cust" /></td>
	  </tr>
	  <tr>
		<td> �ͻ�֤�����ͣ�</td>
		<td><bean:write property="card_type" name="t10_survey_cust" /></td>
		<td>֤�������գ�</td>
		<td><bean:write property="card_end_dt_disp" name="t10_survey_cust" /></td>
	 </tr>
	 <tr>
		<td >�ͻ�������</td>
		<td><bean:write property="country_cd" name="t10_survey_cust" /></td>
		<td >�ͻ�ְҵ��</td>
		<td><bean:write property="occupation" name="t10_survey_cust" /></td>
	 </tr>
	<tr>
		<td >�ͻ�״̬��</td>
		<td><bean:write property="party_status_cd" name="t10_survey_cust" /></td>
		<td>����ҵ���ϵ���ڣ�</td>
		<td><bean:write property="create_dt_disp" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>
		   �ͻ��������ͣ�
		</td>
		<td colspan="3" style="white-space:normal;word-break:break-all;">
		   <logic:iterate id="list_type" name="list_typeList">
                <bean:write name="list_type" />&nbsp;&nbsp;&nbsp;&nbsp;
            </logic:iterate>
		</td>
	</tr>
	<tr>
		<th colspan="4" >ͨѶ��Ϣ��</th>
	</tr>
	<tr>
		<td>ͨ�ŵ�ַ��</td>
		<td><bean:write property="addr1" name="t10_survey_cust" /></td>
		<td>��ϵ�绰��</td>
		<td><bean:write property="tel_no" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>������λ��</td>
		<td><bean:write property="company" name="t10_survey_cust" /></td>
		<td>�ƶ��绰��</td>
		<td><bean:write property="cell_no" name="t10_survey_cust" /></td>
	</tr>  
								
	<tr>
		<th colspan="4" >������Ϣ��</th>
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
		<td>�Ա�</td>
		<td><bean:write property="gender" name="t10_survey_cust" /></td>
	</tr>
	<tr>
		<td>����������Ϣ��	</td>
		<td colspan="3" style="white-space:normal;word-break:break-all;">
			<bean:write property="other_info" name="t10_survey_cust" />
		</td>
	</tr>
	</table>
    </div>
</html:form> 
</body>
</html>
