<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
			<script language="JavaScript" src="../../js/basefunc.js"></script>	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>

<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
  var errMsg ="";
  if(getLength(trim(document.forms[0].report_organkey.value))==0){
      errMsg+="���л�����Ų���Ϊ�գ�";
      document.forms[0].report_organkey.focus();
   }
  else if(getLength(trim(document.forms[0].report_organkey.value))>15){
     errMsg+="���л�����ų��ȹ�����";
     document.forms[0].report_organkey.focus();
  }
  else if(getLength(trim(document.forms[0].organname.value))==0){
      errMsg+="���л������Ʋ���Ϊ�գ�";
      document.forms[0].organname.focus();
  }
  else if(getLength(trim(document.forms[0].organname.value))>30){
      errMsg+="���л������Ƴ��ȹ�����";
      document.forms[0].organname.focus();
  }else if(getLength(trim(document.forms[0].seq_tablename.value))>32){
      errMsg+="�������б��ȹ�����";
      document.forms[0].seq_tablename.focus();
  }
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

<body id="iframecontent" >
<div id="main">
<html:form action="/t07_report_organ/t07_report_organ_add.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>���л������</span>
	   <span class="buttons">
	     <a href="#" onclick="dosubmit('t07_report_organ_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	   </span>		
	   </div>
         <!-- title -->
	<div class="logtips"><html:errors/></div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	   <tr>
	   	 <td><font color="#FF0000">*</font>���л�����ţ�</td>
         <td> <html:text property="report_organkey"/></td>
	   </tr>
	    <tr>
         <td><font color="red">*</font>���л������ƣ�</td>
         <td > 
         <html:text property="organname"/>
         </td>
       </tr>
       <tr>
         <td>�������б�</td>
         <td><html:text property="seq_tablename"/></td>
       </tr>
  
       <tr>
         <td></td>
         <td colspan="4"  >
    
         <input type="button" class="in_button1" value="�� ��" onclick="checkForm('t07_report_organ_add_do.do')"/>
         <input name="" type="reset" class="in_button1" value="�� ��" />
		 </td>
	   </tr>
	  </table>
	</div>
  </div>
</html:form>
</div>
</BODY>
</HTML>