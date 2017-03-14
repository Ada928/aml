<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

	<script language="JavaScript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    var reg = /^[^@\/\'\\\"#$%&\^\*]+$/;
    var reg1 = new RegExp("[`~!@#$^&*()=|{}':;',\\[\\].<>/?~��@#������&*����&mdash;��|{}��������������'��������]");
    
    if(getLength(document.forms[0].rolename.value)>64){
        errMsg="��ɫ�����ܴ���64���ַ���";
        document.forms[0].rolename.focus();
    }else if(getLength(document.forms[0].rolename.value)==0){
        errMsg="��ɫ������Ϊ�գ�";
        document.forms[0].rolename.focus();
    } 
    else if(!reg.test(document.forms[0].rolename)){
        errMsg+="��ɫ�����зǷ��ַ���";
        document.forms[0].rolename.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    
    

    
    if(getLength(document.forms[0].role_des.value)>100){
        errMsg="��ɫ�������ܴ���100���ַ���";
        document.forms[0].role_des.focus();
    }else if(getLength(document.forms[0].role_des.value)==0){
        errMsg="��ɫ��������Ϊ�գ�";
        document.forms[0].role_des.focus();
    }
    
    //��ɫ����
    else if( !reg.test(document.forms[0].role_des)){
        errMsg+="��ɫ�������зǷ��ַ���";
        document.forms[0].role_des.focus();
    }
      selectAllOptions(document.forms[0].list2);
     if(getLength(document.forms[0].list2.value)==0){
        errMsg="��ɫ��λ����Ϊ�գ�";
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
<body class="mainbg">
<html:form method="post" action="/role/role_add_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�½���ɫ</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('role_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
  <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="#FF0000">*</font>��ɫ����</td>
         <td>
       
         <html:text property="rolename" /></td>
		 <td><font color="#FF0000">*</font>��ɫ������</td>
         <td><html:text property="role_des" /></td>
        </tr>
	     <tr>
	    <td ><font color="#FF0000">*</font>��ɫ����</td>
          <td > <html:select property="rolelevel">
                      <html:options collection="rolelevelMap" property="label" labelProperty="value"/>
                  </html:select></td>
         <td><font color="#FF0000">*</font>״̬��</td>
      <td colspan="3"> <html:select property="flag">
                      <html:options collection="flagMap" property="label" labelProperty="value"/>
                  </html:select>
         </td>
          </tr>
            <tr>
			 
       <td ><font color="#FF0000">*</font>��ɫ��λ��</td>
          <td colspan="3">
            <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
                  </td>
        </tr>

	
       <tr>
	  
		<td align="center" class="in_button" colspan="4">
		 <input name="" type="button" value="�� ��" onclick="checkForm('role_add_do.do')" />	
		  <input name="" type="reset" value="�� ��" />		</td>
	   </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>

</html:form>
</body>
</html>
