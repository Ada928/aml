<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].templet_type_add.value)==0){
        errMsg+="ģ�����Ͳ���Ϊ�գ�";
        document.forms[0].templet_type_add.focus();
    }else if(getLength(document.forms[0].templet_title.value)>=128){
        errMsg+="ģ�����Ƴ��Ȳ��ܳ���128���ַ���";
        document.forms[0].templet_title.focus();
    }else if(getLength(document.forms[0].templet_title.value)==0){
        errMsg+="ģ�����Ʋ���Ϊ�գ�";
        document.forms[0].templet_title.focus();
    }else if(getLength(document.forms[0].templet_constant.value)>=500){
        errMsg+="ģ�����ݳ��Ȳ��ܳ���500���ַ���";
        document.forms[0].templet_constant.focus();
    }else if(getLength(document.forms[0].templet_constant.value)==0){
        errMsg+="ģ�����ݲ���Ϊ�գ�";
        document.forms[0].templet_constant.focus();
    }
    if(errMsg==""){
        selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" >
	<div id="main">
<html:form method="post" action="/templet/t07_nbs_templet_add_do.do">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span> ����ģ�����  </span>
       <html:hidden  property="templet_type_s"/>
        <span class="buttons">
        
          
 	   <a href="#" onclick="dosubmit('t07_nbs_templet_list.do?newsearchflag=1&newenterflag=1')">
 	   <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a>
</span>
</div>
  <html:errors/>
 <div class="cond_c">
  <table   border="0" cellpadding="0" cellspacing="0">
     <tr>
      <td ><font color="red">*</font>ģ�����ͣ�</td>                                                                                                                               
      <td>
       <html:select property="templet_type_add" >
                  <html:options collection="templettypeMap"
                                property="label"
                                labelProperty="value" />
                  </html:select>
      </td>                                                                                                                                                           
    </tr>
    <tr>
      <td><font color="red">*</font>ģ�����ƣ�</td>                                                                                                                               
      <td>
      <label><textarea name="templet_title" cols="60" rows="3"></textarea></label>
      </td>                                                                                                                                                           
    </tr>
    <tr  >
        <td  ><font color="red">*</font>ģ�����ݣ�</td>                                                                                                                               
        <td  >
        <label><textarea name="templet_constant" cols="60" rows="20"></textarea></label>
        </td>                                                                                                                                                           
      </tr>  
    <tr  >
 
    <td colspan="4" align="center" class="in_button">  
                 <html:button property="button" styleClass="input" value="�� ��" onclick="checkForm('t07_nbs_templet_add_do.do?newsearchflag=1&newenterflag=1')"/>
                <html:reset styleClass="input" value="�� ��"/>
              </td>
    </tr>
  </table>
  </div>
  
  </div>
    
</html:form>
</div>
</BODY>
</HTML>
