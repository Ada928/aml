<%@ page contentType="text/html; charset=GBk" %>
<%@page import="com.ist.aml.information.dto.T00_NOTICE"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
<body   class="mainbg">
<html:form method="post" action="/t00_notice/t00_notice_disp.do" enctype="multipart/form-data" >
<div id="main">
<div class="conditions">
<div class="cond_t">
<span>��Ϣ����</span>
<span class="buttons">
  <a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />�� ��</a>
</span>
</div>
<div class="cond_c2">
<html:hidden property="noteice_no"/>
<table>
                <tr>
					<td>
						���:
					</td>
					<td>
						<bean:write name="notice_gory"/>
					</td>
				    <td>
						����:
					</td>
					<td><bean:write name="t00_notice" property="title"/>
					</td>
</tr>
<tr>
					<td >
						���ݣ�
					</td>
					<td colspan="3" width="500"> 
					<html:textarea name="t00_notice" property="content" cols="60" rows="3" styleId="content"
									styleClass="text_white" readonly="true"/>
<%--					 <bean:write name="t00_notice" property="content"/>Ϊ������ֹ������������--%>
				
					</td>
</tr>
<tr>
				   <td>����:</td>
			       <td>
			       <logic:notEmpty name="t00_notice" property="filepath">
											<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<bean:write name="t00_notice" property="filepath"/>','','height=160, width=300,left=100,top=100');">
                                             <bean:write name="t00_notice" property="filename"/>(�ɵ������)</a>
					</logic:notEmpty>
			          
				   </td>
					
				   <td> ʧЧ����:</td>
				   <td>
				   <bean:write name="t00_notice" property="infactdate" />
			       </td>
          </tr>
         <tr>
					<td>�����ˣ�</td>
					<td>
						<bean:write name="t00_notice" property="creator" />
					</td>
							  
					<td>��������:</td>
					<td>
						  <bean:write name="t00_notice" property="organame" />
					</td>
</tr>	
<tr>                <td>�������ڣ�</td>
                    <td>
                    <bean:write name="t00_notice" property="createdate" />	
					</td>
					 <td>״̬��</td>
                    <td>
                    <bean:write name="t00_notice" property="flag_disp" />	
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