<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/uc.js"></script>
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

function dosubmit(theUrl,type){
    
    if(type=='del'){
        //errMsg = CheckBoxMustChecked(document.forms[0]);
     
           if(document.forms[0].deldate_disp.value==""){
             alert("��ѡ��ʱ�䣡");
             return false;
           }else{
            if(confirm('�����Ҫɾ����־��')){
                   document.forms[0].action=theUrl;
                   document.forms[0].submit(); 
            }
            }
      
    }else{
   
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
    }
}
function dosubmit1(theUrl,type){
    
        document.forms[0].action=theUrl;
        document.forms[0].submit();

}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/log/system_log_list.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<div class="cond_t">
						<span> ��־���� </span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0">
						<tr>
								<td>
									�û���:
								</td>
								<td>
								 <html:text property="realname"></html:text>
								</td>
								<td>
									����:
								</td>
								<td><html:text property="createdate_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    	
									<input type="button" name="search" class="in_button1" value="�� ѯ"
										onclick="dosubmit('system_log_list.do?newsearchflag=1','search')" />
								</td>
							</tr>
							<tr>
								<td>ɾ��</td>
								<td colspan="3">
								<html:text property="deldate_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>    	
									֮ǰ����־
									
								
								 <input type="button" name="ok" class="in_button1" value="ɾ  ��"
										onclick="dosubmit('system_log_delete_do.do','del')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<!---   <TD width=30 height=22 noWrap>ѡ��</TD>  -->
							<th>
								ʱ��
							</th>
							<th>
								�û���
							</th>
							<th>
								����
							</th>
							<th>
								IP
							</th>
							<th>
								��ɫ
							</th>
						
						</tr>
						<logic:iterate id="systemlog" name="t00_system_logList"
							type="com.ist.platform.dto.T00_system_log">
							<tr>
								<td>
									<bean:write name="systemlog" property="createdate_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="systemlog" property="username" scope="page" />
								</td>
								<td>
									<bean:write name="systemlog" property="actionflag_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="systemlog" property="ipaddress" scope="page" />
								</td>
								<td>
									<bean:write name="systemlog" property="rolename" scope="page" />
								</td>
								
							</tr>
						</logic:iterate>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>
