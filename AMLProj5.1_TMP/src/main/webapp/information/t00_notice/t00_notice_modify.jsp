<%@ page contentType="text/html; charset=GBk"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">


function doSubmit(theUrl){
	
   document.forms[0].action=theUrl;      
   document.forms[0].submit();
     
}
function checkForm(theUrl){
    var errMsg ="";
     if(document.forms[0].title.value==""){
    	errMsg = "���ⲻ��Ϊ��";
    }else if(document.forms[0].content.value == ""){
    	errMsg = "���ݲ���Ϊ��";
    }else if(document.forms[0].infactdate.value!="" && document.forms[0].createdate.value!="")
       if(document.forms[0].createdate.value>=document.forms[0].infactdate.value){
        errMsg = "ʧЧ���ڲ���С�ڷ�������";
    }
      if (getLength(document.forms[0].content.value)>500) {
      // alert(getLength(document.forms[0].content.value));
        errMsg = "���ݲ��ܶ���1000���ַ�,500�����֣�";  
����������document.forms[0].content.focus();
    }
   if(errMsg!=""){
        alert(errMsg);
        return false;
    } 
 
    document.forms[0].action=theUrl;
   
   document.forms[0].submit();
   
}


</script>
	</head>
	<body class="mainbg">
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		<html:form method="post" action="/t00_notice/t00_notice_modify_do.do"
			enctype="multipart/form-data">
			
			<div id="main">
				<div class="conditions">
					<div class="cond_t">
						<span>�޸���Ϣ����</span>
						<span class="buttons">
							<a href="#" onclick="doSubmit('t00_notice_list.do')">
							<img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />����</a>
						</span>
					</div><html:errors />
					<div class="cond_c2">
						<html:hidden property="noteice_no" />
						<table>
							<tr>
								<td>
									����:
								</td>
								<td>
									<html:text property="title" size="24" maxlength="12" />
									<font color="red">*</font>
								</td>
								<td>
									���:
								</td>
								<td>
									<html:select property="notice_gory">
										<html:options collection="typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>

							</tr>
							<tr>
								<td>
									���ݣ�
								</td>
								<td colspan="3">
									<html:textarea property="content" cols="70" rows="6" styleId="content" styleClass="text_white"/>
									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									����:
								</td>

								<td>
									<html:file property="filename1" />

								</td>

								<td>
									ʧЧ����:
								</td>
								<td>
									<html:text property="infactdate" onclick="calendar.show(this);"
										readonly="true" styleClass="calimg" />
								</td>
							</tr>
							<tr>
								<td>
									�����ˣ�
								</td>
								<td>
									<html:text property="creator" size="24" />
								</td>

								<td>
									��������:
								</td>
								<td>
									<html:text property="createorgan" size="9" maxlength="9" />
									<html:text property="organame" />
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=createorgan&input_name_disp=organame','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
										class="cond_buttons"><img
												src="../../images/<%=session.getAttribute("style")%>/b_location.png" />��λ</span>
									</a>

									<font color="red">*</font>
								</td>
							</tr>
							<tr>
								<td>
									�������ڣ�
								</td>
								<td>
									<html:text property="createdate" onclick="calendar.show(this);"
										readonly="true" styleClass="calimg" />

								</td>
							</tr>
							<tr>
								<td colspan="4" align="center" class="in_button">
									<html:button property="button" styleClass="input" value="�� ��"
										onclick="checkForm('t00_notice_modify_do.do?newsearchflag=2')" />
									<html:reset styleClass="input" value="�� ��" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- all end -->
			</div>
		</html:form>
	</body>
</html>