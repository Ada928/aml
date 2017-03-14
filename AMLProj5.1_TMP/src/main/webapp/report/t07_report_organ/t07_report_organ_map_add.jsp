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
  if(getLength(trim(document.forms[0].organkey.value))==0){
      errMsg+="��ѡ�����������";
      document.forms[0].organkey.focus();
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
<html:form action="/t07_report_organ/t07_report_organ_map_add_do.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>��ӽ���</span>
	   <span class="buttons">
	     <a href="#" onclick="dosubmit('t07_report_organ_disp.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	   </span>		
	   </div>
         <!-- title -->
	<div class="logtips"><html:errors/></div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	  
	   <tr>
	   	 <td><font color="#FF0000">*</font>����������</td>
         <td> 
          <html:hidden property="report_organkey"/>
          <html:text property="organkey"  size="10"/>
		  <html:text property="organname" 	size="23" readonly="true"/>
          <a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>    
         </td>
         
	   </tr>
       <tr>
         <td></td>
         <td colspan="4"  >
    
         <input type="button" class="in_button1" value="�� ��" onclick="checkForm('t07_report_organ_map_add_do.do')"/>
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