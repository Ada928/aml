<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%String contextPath = request.getContextPath(); %>
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gbk">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>����������</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
		<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
  		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
 	    <script language="JavaScript" src="<%=contextPath%>/js/avpfunc.js"></script> 
		<script LANGUAGE="JavaScript">
		function dosubmit(theUrl){
			    var result = checkform();//У���
			    if(result){
			    	document.forms[0].srchengkey.value=parent.srchengkey;
		        	document.forms[0].action=theUrl;
		        	document.forms[0].submit();
		        }
		        return false;
		}
 
</script>
	</head>
	<body>
		<div id="content">
			<html:form method="post" action="/search/t02_srch_eng_inf_add_do.do">
			<html:hidden property="srchengkey"/>
				<div class='awp_title'>
					<table>
						<tr>
							<td width="23%"><span class="awp_title_td2">��ͼ���� - ���</span></td>
							<td align="right">
								<input type=button value="�� ��" name=Button52 class="input" onClick="dosubmit('t02_srch_eng_inf_modify_do.do')">
								&nbsp;
							</td>
						</tr>
					</table>
				</div>

				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8"></td>
					</tr>
				</table>
				<div class="awp_detail">
				<html:hidden property="srchengkey"/>
					<table>
						<tr>
							<td nowrap>
								<font color="#FF0000">*</font>��ͼ���ƣ�
							</td>
							<td>
								<html:text property="srchengname" minlength="1" maxlength="64" warning="��ͼ����"/>
								�����32�����֣�
							<br></td>
						</tr>
						<tr>
							<td nowrap>
								<font color="#FF0000">*</font>����������������
							<br></td>
							<td>
								<html:text property="crltsrchcolcnt" styleClass="awp_number" warning="��������������" minlength="1" maxlength="6"/>
							<br></td>
						</tr>
						<tr>
							<td nowrap>
								<font color="#FF0000">*</font>������������¼������
							<br></td>
							<td><html:text property="crltsrchrowcnt" styleClass="awp_number" warning="������������¼����" minlength="1" maxlength="6" />
							<br></td>
						</tr>
						<tr>
							<td nowrap>
								����˵����<br>�����2000�����֣�
								<br>
							</td>
							<td>
								<html:textarea property="fundes" 
									rows="30" cols="80" maxlength="4000" warning="����˵��"/>
								<br>
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>

	</BODY>
</HTML>
