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
		
function checkForm(theUrl)
{
	var errMsg = '';
	if(getLength(document.forms[0].partyrisk_no.value)==0){
        errMsg+="�¼���Ų���Ϊ�գ�";
        document.forms[0].partyrisk_no.focus();
    }
    if(getLength(document.forms[0].risk_des.value)==0){
        errMsg+="�¼���������Ϊ�գ�";
        document.forms[0].risk_des.focus();
    }
    if(getLength(document.forms[0].risk_type.value)==0){
        errMsg+="�������Ͳ���Ϊ�գ�";
        document.forms[0].risk_type.focus();
    }
    if(getLength(document.forms[0].risk_validite_dt_disp.value)==0){
        errMsg+="ʧЧ���ڲ���Ϊ�գ�";
        document.forms[0].risk_validite_dt_disp.focus();
    }
    
    if(getLength(document.forms[0].partyrisk_no.value)>10){
        errMsg+="�������볤�Ȳ��ܴ���10λ��";
        document.forms[0].partyrisk_no.focus();
    }
    if(getLength(document.forms[0].risk_des.value)>200){
        errMsg+="�����������Ȳ��ܴ���200���ַ���";
        document.forms[0].risk_des.focus();
    }
    if(getLength(document.forms[0].risk_detail.value)>800){
        errMsg+="�����������Ȳ��ܴ���800���ַ���";
        document.forms[0].risk_ddtail.focus();
    }
    if( errMsg=='')
    {
    	document.forms[0].action=theUrl;
    	document.forms[0].submit();
    }
    else
    {
    	if(errMsg!='')
		   alert(errMsg);
		return false;
    }
}
			

</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/cust_identify/t10_party_riskdisp.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>�����¼���ϸ��Ϣ</span>
	   <span class="buttons">
			<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />�ر�</a>
	   </span>
	   <html:hidden property="party_id" />
					
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
	  
       <tr>
         <td>�¼���ţ�</td>
         <td> <bean:write name="t10_party_risk" property="partyrisk_no" /></td>
       </tr>
        <tr>
	   		<td>�ͻ��ţ�</td>
         <td> <bean:write  name="t10_party_risk" property="party_id"/></td>
	   </tr>
	   <tr>
	   <td>�ͻ����ƣ�</td>
         <td> <bean:write  name="t10_party_risk" property="party_chn_name"/></td>
	   </tr>
        <tr> 
         <td>�������ͣ�</td>
         <td > 
         <bean:write name="t10_party_risk" property="risk_type_disp" />
         </td>
       </tr>
       <logic:equal name="isnewrisk" value="1">
        <tr> 
         <td>����ģ������¼�Ҫ�㣺</td>
         <td > 
         <bean:write name="t10_party_risk" property="elementkey" />
         </td>
       </tr>
       <tr> 
         <td>����ģ������¼�Ҫ�����ƣ�</td>
         <td > 
         <bean:write name="t10_party_risk" property="elementname" />
         </td>
       </tr>
        <tr> 
         <td>����ģ������¼�Ҫ��÷֣�</td>
         <td > 
         <bean:write name="t10_party_risk" property="element_score" />
         </td>
       </tr>
       </logic:equal>
       <tr>
         <td>�¼�������</td>
         <td style='word-break:break-all;width:400px'><bean:write name="t10_party_risk" property="risk_des" /></td>
       </tr>
      
       <tr>
        <td>�¼�������</td>
         <td style='word-break:break-all;width:400px'>
          <bean:write name="t10_party_risk" property="risk_detail" />
         
         </td>
       </tr>
       
       <tr>
         <td>ʧЧ���ڣ�</td>
         <td > 
          <bean:write name="t10_party_risk" property="risk_validite_dt_disp" />
         
         </td>
        
       </tr>
       
	  </table>
	</div>
  </div>
</html:form>
</div>
</BODY>
</HTML>