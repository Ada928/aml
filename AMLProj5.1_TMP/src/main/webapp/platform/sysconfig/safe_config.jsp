<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<link  href="<%=request.getContextPath()%>/skin/blue/css/awp_base.css" rel="stylesheet" type="text/css">
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
		<html:form action="/platform/sysconfig/safe_config_modify.do"
			method="post">
			<div class="awp_wrap">
				<div class='awp_title'>
				   <table>
						  <tr>
							<td align="left">
								ϵͳ���� - ��ȫ����
							</td>
						  </tr>
				   </table>
				</div> 
				</div> 
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="awp_detail">
				<table>
					<tr>
						<td>
							��¼��ʱʱ�䣺
						</td>
						<td>
							<html:text property="con_outtime" styleClass="text_white"
								size="15" readonly="true" />
							�����ӣ�
						</td>
					</tr>
					<tr>
						<td>
							������Чʱ�䣺
						</td>
						<td>
							<html:text property="passwd_time" styleClass="text_white"
								size="15" />
							���죩
						</td>
					</tr>
					<tr>
						<td>
							�������ٳ��ȣ�
						</td>
						<td>
							<html:text property="pass_min_len" styleClass="text_white"
								size="15" />
						</td>
					</tr>
					<tr>
						<td>
							���������ַ�����
						</td>
						<td>
							<html:text property="pass_min_str" styleClass="text_white"
								size="15" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>

							<input type="button" value="�� ��" name="sub"
								onclick="checkForm('safe_config_modify_do.do')" />
							<html:reset value="�� ��" styleClass="input" />
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
