<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></script>

	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(getLength(document.forms[0].passwd.value)==0){
        errMsg+="���벻��Ϊ�գ�";
        document.forms[0].passwd.focus();
    }else if(getLength(document.forms[0].passwd.value)>16){
        errMsg+="���벻�ܴ���16���ַ���";
        document.forms[0].passwd.focus();
    }else if(getLength(document.forms[0].passwd.value)<5){
        errMsg+="���벻��С��5���ַ���";
        document.forms[0].passwd.focus();
    }else if(checkString(document.forms[0].passwd.value)==0){
        errMsg+="���뺬�зǷ��ַ���";
        document.forms[0].passwd.focus();
    }else if(getLength(document.forms[0].urlmail.value)==0){
        errMsg+="�ʼ���������ַ����Ϊ�գ�";
        document.forms[0].urlmail.focus();
    }else if(getLength(document.forms[0].mailaddr.value)==0){
        errMsg+="������벻��Ϊ�գ�";
        document.forms[0].mailaddr.focus();
    }
    else if(checkEmail(document.forms[0].mailaddr.value)==false){
        errMsg+="�û������ʼ����зǷ��ַ����ʽ����";
        document.forms[0].mailaddr.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
</SCRIPT>

</head>

<body leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/platform/sysconfig/mail_config_modify.do"
			method="post">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%">
							<span class="awp_title_td2">ϵͳ���� - �������� </span>
						</td>
						<td align="right">
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class="awp_detail">
				<table>
					<tr>
						<td>
							<font color="#FF0000">*</font>�ʼ���������ַ��
						</td>
						<td>
							<html:text property="urlmail" styleClass="text_white" size="21" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>������룺
						</td>
						<td>
							<html:text property="mailaddr" styleClass="text_white" size="21" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>�������룺
						</td>
						<td>
							<html:password property="passwd" styleClass="text_white"
								size="17" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>

							<input type="button" value="�� ��" name="sub" 
								onclick="checkForm('mail_config_modify_do.do')" />
							<html:reset value="�� ��" property="reset" styleClass="input" />
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
