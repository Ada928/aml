<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<META http-equiv=Content-Type content="text/html; charset=GBK"/>
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}
</SCRIPT>
		<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
-->
</style>
</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
		<html:form action="/report/nbh_tsdt_detail.do" method="post">
			<html:hidden property="pbc_msg_type_cd"></html:hidden>
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>���� - ������ϸ</span>
	  <span class="buttons" onclick="window.close()">
	   <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�ر�
	  </span>
	</div>
	
			 <div class="cond_c2">
<table border="0" cellpadding="0" cellspacing="0">
   <tr>
    <th colspan="4"><strong>���ڻ�����Ϣ</strong></th>
  </tr>
  <tr>
							<td>
										�������ƣ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="finn"/>
									</td>
									<td>
										���ڵ��������������룺
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="firc"/>(<bean:write name="t07_nbh_tsdtActionForm" property="firc_disp"/>)
									</td>
								</tr>
								<tr>
									<td>
										����׵Ĺ�ϵ��
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="rltp"/>(<bean:write name="t07_nbh_tsdtActionForm" property="rltp_disp"/>)
									</td>
									<td>
										����������ͣ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="fict"/>
									</td>
								</tr>
								<tr>
									<td>
										������룺
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="finc"/>
									</td>
									<td>
										�˻����ͣ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="catp"/>(<bean:write name="t07_nbh_tsdtActionForm" property="catp_disp"/>)
									</td>
								</tr>
								<tr>
									<td>
										�˺ţ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="ctac"/>
									</td>
									<td>
										
									</td>
									<td>
									
									</td>
								</tr>	
		      	
	 <tr>
    <th colspan="4"><strong>��������Ϣ</strong></th>
  </tr>
 
								<tr>
									<td>
										���״�����������
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tbnm"/>
									</td>
									<td>
										���������֤�����ͣ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tbit"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tbit_disp"/>)
									</td>
								</tr>
								<tr>
									<td>
										���������֤�����룺
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tbid"/>
									</td>
									<td>
										�����˹�����
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tbnt"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tbnt_disp"/>)
									</td>
								</tr>
<tr>
    <th colspan="4"><strong>������Ϣ</strong></th>
  </tr> 
								<tr>
									<td>
										����ʱ�䣺
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tstm_disp"/>
									</td>
									<td>ҵ���ʾ�ţ�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="ticd"/>
									</td>
								</tr>
								<tr>
									<td>���׷�ʽ��</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tstp"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tstp_disp"/>)
									</td>
									<td>������֧���׷�������룺</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tsct"/>
									</td>
								</tr>
								<tr>
									<td>�ʽ��ո���ʶ��</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tsdr"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tsdr_disp"/>)
									</td>
									<td>����ȥ��</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tdrc"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tdrc_disp"/>)
									</td>
								</tr>
								<tr>
									<td>���׷����أ�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="trcd"/>(<bean:write name="t07_nbh_tsdtActionForm" property="trcd_disp"/>)
									</td>
									<td>
										�ʽ���;��
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="crpp"/>
									</td>
								</tr>
								<tr>
									<td>���֣�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="crtp"/>(<bean:write name="t07_nbh_tsdtActionForm" property="crtp_disp"/>)
									</td>
									<td>���׽�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="crat"/>
									</td>
								</tr>	
		      	   <tr>
    <th colspan="4"><strong>�Է����ڻ��������׶�����Ϣ</strong></th>
  </tr>
								<tr>
									<td>
										�������ƣ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="cfin"/>
									</td>
									<td>���������������ͣ�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="cfct"/>(<bean:write name="t07_nbh_tsdtActionForm" property="cfct_disp"/>)
									</td>
								</tr>
								<tr>
									<td>������룺</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="cfic"/>
									</td>
									<td>���׶���������</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tcnm"/>
									</td>
								</tr>
								<tr>
									<td>���׶���֤�����ͣ�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tcit"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tcit_disp"/>)
									</td>
									<td>���׶���֤�����룺</td>
									<td width="40%" height="22" align="left" bgcolor="F6F9FF">
									<bean:write name="t07_nbh_tsdtActionForm" property="tcid"/>
									</td>
								</tr>
								<tr>
									<td>���׶����˻����ͣ�</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tcat"/>(<bean:write name="t07_nbh_tsdtActionForm" property="tcat_disp"/>)
									</td>
									<td>
										���׶����˺ţ�
									</td>
									<td>
									<bean:write name="t07_nbh_tsdtActionForm" property="tcac"/>
									</td>
								</tr>	
		      	   </table>
 
	</div>
  </div>
<!-- all end --> 
</html:form>  
</div>
</body>
</html>
