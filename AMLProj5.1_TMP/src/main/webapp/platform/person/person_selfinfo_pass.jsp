<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

<script LANGUAGE="JavaScript">


function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //�û�����
    if(getLength(document.forms[0].passwordold.value)==0){
        errMsg+="ԭ���벻��Ϊ�գ�";
        document.forms[0].passwordold.focus();
    }else if(getLength(document.forms[0].passwordold.value)>16){
        errMsg+="ԭ���벻�ܴ���16���ַ���";
        document.forms[0].passwordold.focus();
    }else if(getLength(document.forms[0].passwordold.value)<6){
        errMsg+="ԭ���벻��С��6���ַ���";
        document.forms[0].passwordold.focus();
    }
    else if(getLength(document.forms[0].password.value)==0){
        errMsg+="�û����벻��Ϊ�գ�";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)!="" && getLength(document.forms[0].password.value.replace(/[\s\u1228\u3000]*/g,''))==0){
        errMsg+="�û����벻��ȫΪ�ո�"
    }else if(getLength(document.forms[0].password.value)>16){
        errMsg+="�û����벻�ܴ���16���ַ���";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)<6){
        errMsg+="�û����벻��С��6���ַ���";
        document.forms[0].password.focus();
    }
    //�û�ȷ������
    else if(getLength(document.forms[0].password1.value)==0){
        errMsg+="�û�ȷ�����벻��Ϊ�գ�";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)>16){
        errMsg+="�û�ȷ�����벻�ܴ���16���ַ���";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)<6){
        errMsg+="�û�ȷ�����벻��С��6���ַ���";
        document.forms[0].password1.focus();
    }else if(document.forms[0].password.value!=document.forms[0].password1.value){
        errMsg+="�û�������������벻һ�£�";
        document.forms[0].password.focus();
    }
    else if(document.forms[0].password.value == document.forms[0].passwordold.value){
        errMsg+="��������ԭ���벻����ͬ��";
        document.forms[0].password.focus();
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

<body leftmargin="0" topmargin="0">

    <html:form action="/person/person_modify_passwd_do.do" method="post">
   <html:errors />
  <!-- table content -->
	<div class="cond_c2">
	  <table cellpadding="0" cellspacing="0">
     <tr>
      <td >�û�����</td>
      <td><p><bean:write name="t00_userActionForm" property="username"/></p></td>
    </tr>
    <tr>
      <td >��ʵ������</td>
      <td><bean:write name="t00_userActionForm" property="realname"/></td>
    </tr>
    <tr>
      <td ><font color="#FF0000">*</font>ԭ���룺</td>
      <td><html:password property="passwordold" styleClass="text_white" size="15"></html:password>
      </td>
    </tr>
    <tr>
      <td ><font color="#FF0000">*</font>�����룺</td>
      <td><html:password property="password" styleClass="text_white" size="15"></html:password>
      </td>
    </tr>
    <tr>
      <td><font color="#FF0000">*</font>������ȷ�ϣ�</td>
      <td><html:password property="password1" styleClass="text_white" size="15"></html:password>
      </td>
    </tr>
    <tr>
      <td >&nbsp;</td>
      <td class="in_button">
          <html:hidden property="username"/>
          <input name="ss"  type="button"  value="�� ��" onclick="checkForm('person_modify_passwd_do.do')"/>
          <html:reset value="�� ��" />
        </td>
    </tr>
        </table>
	</div>
</html:form>
</body>
</html>
