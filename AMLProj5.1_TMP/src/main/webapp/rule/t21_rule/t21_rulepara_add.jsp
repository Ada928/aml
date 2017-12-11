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
	if(getLength(document.forms[0].parakey.value)==0){
        errMsg+="�������벻��Ϊ�գ�";
        document.forms[0].parakey.focus();
    }
    if(getLength(document.forms[0].para_des.value)==0){
        errMsg+="�������Ʋ���Ϊ�գ�";
        document.forms[0].para_des.focus();
    }
    if(getLength(document.forms[0].paratype.value)==0){
        errMsg+="�������Ͳ���Ϊ�գ�";
        document.forms[0].paratype.focus();
    }
    if(getLength(document.forms[0].para_min_val.value)==0){
        errMsg+="����ֵ����Ϊ�գ�";
        document.forms[0].para_min_val.focus();
    }
    
    if(getLength(document.forms[0].parakey.value)>=16){
        errMsg+="�������볤�Ȳ��ܴ���16λ��";
        document.forms[0].parakey.focus();
    }
    if(getLength(document.forms[0].para_des.value)>100){
        errMsg+="�����������Ȳ��ܴ���100���ַ���";
        document.forms[0].para_des.focus();
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
			
function _onchange()
{
	if(document.forms[0].paratype.value == "2")
	{
		 document.all.max.style.display='';
	}
	else
	{
		document.all.max.style.display='none';
	}
}
</script>
</head>

<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/t21_rule/t21_rulepara_add.do" method="post">
<!-- conditions --> 
  <div class="conditions">
       <div class="cond_t">
	   <span>�������</span>
	   <span class="buttons">
			<a href="#" onclick="window.close();" ><img src="../../images/blue/b_shut.png" />�ر�</a>
	   </span>
	   <html:hidden property="rulekey" />
					
	   </div>
         <!-- title -->
	
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="#FF0000">*</font>�������룺</td>
         <td> <html:text property="parakey" /></td>
         <td><font color="#FF0000">*</font>�������ƣ�</td>
         <td> <html:text property="para_des" /></td>
       </tr>
       
       <tr>
         <td>��������</td>
         <td > 
         <html:select property="paratype"  onchange="_onchange();">
			<html:options collection="para_typeMap" property="label" labelProperty="value" />
		</html:select>
         </td>
        <td><font color="#FF0000">*</font>ֵ��</td>
         <td>
           <html:text property="para_min_val"/> <span id="max" style="display:none">---<html:text property="para_max_val"/></span>
         </td>
       </tr>
       
       <tr>
         <td>����ֵ����</td>
         <td > 
         <html:select property="paravaltype">
			<html:options collection="para_typevalMap" property="label" labelProperty="value" />
		 </html:select>
         </td>
         <td>�Ƿ�����</td>
         <td>
         <html:select property="para_flag">
			<html:options collection="para_flagMap" property="label" labelProperty="value" />
		 </html:select>
         </td>
       </tr>
       
       <tr>
         <td></td>
         <td colspan="4"  >
    
         <input type="button" class="in_button1" value="�� ��" onclick="checkForm('t21_rulepara_add_do.do')"/>
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