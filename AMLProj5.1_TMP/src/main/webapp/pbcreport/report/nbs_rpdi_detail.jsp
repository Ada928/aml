<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">

function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}

</script>
		<style type="text/css">
<!--
.style1 {
	color: #FF0000
}

.STYLE2 {
	color: #000000
}
-->
</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/report/nbs_rpdi_detail.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>���ɽ�����Ϣ����</span>
						<span class="buttons"> <a href="#"
							onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a> <!-- <html:button property="b2" value="�� ��" styleClass="input" onclick="window.close()"/> -->
						</span>
					</div>
					<!-- table content -->
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>�ͻ���Ϣ</b></strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
						
							<tr>

								<td width="10%">
									�ͻ����ƣ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="ctnm" />
								</td>
								<td width="10%">
									�ͻ����֤�����ͣ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="citp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="citp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									�ͻ�֤�����룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ctid" />
								</td>
								<td>
									�˺ţ�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ctac" />
								</td>
							</tr>
						</table>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>��������Ϣ</b>
									 </strong> </span>
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									���״�����������
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="bknm" />
								</td>
								<td width="10%">
									���������֤�����ͣ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="bitp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="bitp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									���������֤�����룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="bkid" />
								</td>
								<td>
									�����˹�����
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="bknt" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="bknt_disp" />
									)
								</td>
							</tr>
						</table>
					</div>

					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>������Ϣ</b>
									</strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									����ʱ�䣺
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="tstm_disp" />
								</td>
								<td width="10%">
									���׷����أ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="trcd" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="trcd_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									ҵ���ʶ�룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="ticd" />
								</td>
								<td>
									���׷�ʽ��
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tstp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tstp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									������֧���׷�������룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tsct" />
								</td>
								<td>
									�ո���ʶ��
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tsdr" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tsdr_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									�ʽ���Դ����;��
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crsp" />
								</td>
								<td>
									���֣�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crtp" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="crtp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									���׽�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="crat" />
								</td>
								<td>

								</td>
								<td>

								</td>
							</tr>
						</table>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>�Է����ڻ��������׶�����Ϣ</b>
									</strong> </span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td width="10%">
									�������ƣ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="cfin" />
								</td>
								<td width="10%">
									���ڻ����������ͣ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_rpdiActionForm" property="cfct" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="cfct_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									�������룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="cfnc" />
								</td>
								<td>
									���ڻ������������������룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="cfrc" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="cfrc_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									���׶���������
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcnm" />
								</td>
								<td>
									���׶���֤�����ͣ�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcit" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tcit_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									���׶���֤�����룺
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcid" />
								</td>
								<td>
									���׶����˺����ͣ�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcac" />
									(
									<bean:write name="t07_nbs_rpdiActionForm" property="tcat_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									���׶����˺ţ�
								</td>
								<td>
									<bean:write name="t07_nbs_rpdiActionForm" property="tcac" />
								</td>
								<td>

								</td>
								<td>

								</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>
