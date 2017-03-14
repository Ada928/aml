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
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>

		<!--[if lte IE 6]>
		<script type="text/javascript">var clear="../../js/blank.gif"; </script>
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
			<html:form action="/report/nbs_ctif_list.do" method="post">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>�˻���Ϣ����</span>
						<span class="buttons"> <a href="#"
							onclick="window.close();"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a> </span>
						<!-- <html:button property="b2" value="�� ��" styleClass="input" onclick="window.close()"/> -->
					</div>
					<!-- table content -->
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>�ͻ�������Ϣ</b>
						     </strong>
						</span>
						     
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
									<%=com.ist.util.Constans.REPORT_NAME%>���룺
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_ctifActionForm" property="reportkey" />
								</td>
								<td width="10%">
									�ͻ���ţ�
								</td>
								<td width="40%">
									<bean:write name="t07_nbs_ctifActionForm" property="ctif_seqno" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ����ƣ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ctnm" />
								</td>
								<td>
									�ͻ�֤�����ͣ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="citp" />
									(
									<bean:write name="t07_nbs_ctifActionForm" property="citp_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									�ͻ�֤�����룺
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ctid" />
								</td>
								<td>
									�ͻ��ţ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="csnm" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="cttp" />
									(
									<bean:write name="t07_nbs_ctifActionForm" property="cttp_disp" />
									)
								</td>
								<td>
									��ϵ�绰��
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="cctl" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ���ϸ��ַ��
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ctar" />
								</td>
								<td>
									�ͻ�������ϵ��ʽ��
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ccei" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ�������
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ctnt" />
									(
									<bean:write name="t07_nbs_ctifActionForm" property="ctnt_disp" />
									)
								</td>
								<td>
									��˽�ͻ���ְҵ��Թ��ͻ�����ҵ���
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="ctvc" />
									(
									<bean:write name="t07_nbs_ctifActionForm" property="ctvc_disp" />
									)
								</td>
							</tr>
							<tr>
								<td>
									�Թ��ͻ�ע���ʽ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="rgcp" />
								</td>
								<td>
									�Թ��ͻ�����������������
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="crnm" />
								</td>
							</tr>
							<tr>
								<td>
									�Թ��ͻ��������������֤�����ͣ�
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="crit" />
									(
									<bean:write name="t07_nbs_ctifActionForm" property="crit_disp" />
									)
								</td>
								<td>
									�Թ��ͻ��������������֤�����룺
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="crid" />
								</td>
							</tr>
							<tr>
								<td>
									�˻�������
								</td>
								<td>
									<bean:write name="t07_nbs_ctifActionForm" property="atnm" />
								</td>
								<td></td>
								<td>
								</td>
							</tr>
						</table>
					</div>
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<span class="buttons"> 
						     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><b>�ͻ������˻��б�</b>
						     </strong>
						</span>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
					</table>
				</div>
				<!-- list -->
				<div class="list">
					<table cellspacing="0" cellpadding="0" border=0>
						<tr>
							<th>
								�˺����
							</th>
							<th>
								�˻�����
							</th>
							<th>
								�˺�
							</th>
							<th>
								����ʱ��
							</th>
							<th>
								����ʱ��
							</th>
						</tr>
						<logic:iterate id="t07_nbs_atif" name="t07_nbs_atifList"
							indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbs_ctif">
							<tr align="center" class="interval"
								onmouseover="this.className='interval2'"
								onmouseout="this.className='interval'">
								<td>
									<bean:write name="t07_nbs_atif" property="atif_seqno" />
								</td>
								<td>

									<bean:write name="t07_nbs_atif" property="catp_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_atif" property="ctac" />
								</td>
								<td>
									<bean:write name="t07_nbs_atif" property="oatm_disp" />
								</td>
								<td>
									<bean:write name="t07_nbs_atif" property="catm_disp" />
								</td>

							</tr>
						</logic:iterate>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
