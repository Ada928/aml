<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
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
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/calinfo/dm_task_log_edit.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> DM������� - ά���ռ� </span>
						<span class="buttons">  <a href="#" onclick="dosubmit('dm_task_log_info.do')"><img
									src="../../images/blue/b_back.png" />�� ��</a> 
								</span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									����ʱ�䣺
								</td>
								<td>
									<bean:write name="t18_task_log" property="statisticdate_disp" />
								</td>
							</tr>
							<tr>
								<td>
									�������棺
								</td>
								<td>
									<bean:write name="t18_task_log" property="serverkey" />
								</td>
							</tr>
							<tr>
								<td>
									�������ƣ�
								</td>
								<td>
									<bean:write name="t18_task_log" property="taskkey" />
								</td>
							</tr>
							<tr>
								<td>
									������
								</td>
								<td>
									<bean:write name="t18_task_log" property="organkey_disp" />
								</td>
							</tr>
							<tr>
								<td>
									���ȣ�
								</td>
								<td>
									<bean:write name="t18_task_log" property="granularity_disp" />
								</td>
							</tr>
							<tr>
								<td>
									������־��
								</td>
								<td>
									<bean:write name="t18_task_log" property="errinfo" />
								</td>
							</tr>
							<tr>
								<td>
									����ʱ�䣺
								</td>
								<td>
									<bean:write name="t18_task_log" property="errdate_disp" />
								</td>
							</tr>
							<tr>
								<td>
									������̣�
								</td>
								<td>
									<html:textarea name="t18_task_log" property="note" cols="80" rows="16" ></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									&nbsp;
								</td>
								<td>
									<html:hidden property="logkey" name="t18_task_log" />
									<html:button property="backbutton" value="�� ��"
										styleClass="in_button1"
										onclick="checkForm('dm_task_log_edit_do.do')" />
									<html:reset value="�� ��" styleClass="in_button1" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>
