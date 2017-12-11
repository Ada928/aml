<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/avpfunc.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language="JavaScript" src="../../js/basefunc_report.js"></script>
	<script type="text/javascript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			function dosubmit(theUrl){
			    document.forms[0].action=theUrl;
			    document.forms[0].submit();
			}
			
			function checkForm(theUrl){
			    var errMsg ="";
			    //����
			     if(getLength(document.forms[0].groupname.value)==0){
			        errMsg+="��������Ϊ�գ�";
			        document.forms[0].groupname.focus();
			    }else if(getLength(document.forms[0].groupname.value)>64){
			        errMsg+="�������ܴ���64���ַ���";
			        document.forms[0].groupname.focus();
			    }else if(getLength(document.forms[0].groupname.value)<4){
			        errMsg+="��������С��4���ַ���";
			        document.forms[0].groupname.focus();
			    }
			    //����
			    else if(getLength(document.forms[0].des.value)>256){
			        errMsg+="����������ܴ���256���ַ���";
			        document.forms[0].des.focus();
			    }
			    if(errMsg!=""){
			        alert(errMsg);
			        return false;
			    }else{
			        document.forms[0].action=theUrl;
			        document.forms[0].submit();
			    }
			}
			
			function LocationGroupkey(){
				var currGroupkey = '<%=(String)request.getAttribute("currGroupkey") %>';
				var groupkey = '<%=(String)request.getAttribute("t00_groupname") %>';
				var str = " groupkey != '" + groupkey + "' and (grouplevel='1' or grouplevel='2' ) and upgroupkey = '" + currGroupkey + "'";
				locate_pop_window('<%= request.getContextPath() %>','t00_groupLocation','radio','forms[0]','upgroupkey,upgroupname',str);
			}
		</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<html:form method="post" action="/group/group_modify_do.do">
	<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
			<div class="cond_t">
				<span>�޸�Ȩ��</span>
				<span class="buttons"> <a href="group_list.do"><img src="../../images/blue/b_back.png" />����</a> </span>
			</div>
		</div>
		<div id='content'>
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
 		<div class="cond_c2">
			 <table border="0" cellpadding="0" cellspacing="0">
	            <tr>
	              <td ><font color="#FF0000">*</font>������</td>
	              <td ><html:text property="groupname" styleClass="text_white" size="40"/></td>
	            </tr>
           		<tr >
	              <td  nowrap >
	                  <font color="#FF0000">*</font>״̬��
	              </td>
	              <td >
	                  <html:select property="flag">
	                      <html:options collection="flagMap" property="label" labelProperty="value"/>
	                  </html:select>
	              </td>
				</tr>
            <tr >
              <td >���������</td>
              <td ><html:textarea property="des" cols="30" rows="3"  styleId="des" styleClass="text_white"></html:textarea></td>
            </tr>
            <tr >
              <td >&nbsp;</td>
              <td >
                <html:hidden property="groupkey"/>
                <html:button property="button" styleClass="in_button1" value="�� ��" onclick="checkForm('group_modify_do.do')"/>
                <html:reset styleClass="in_button1" value="�� ��"/>
                </td>
            </tr>
          </table>
          </div>
          </div>
	  		
			</div>
</html:form>
</BODY>
</HTML>
