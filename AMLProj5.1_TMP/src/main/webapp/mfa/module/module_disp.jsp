<%@ page contentType="text/html; charset=GBK" %>
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
<script language="javascript">
function dosubmit(theUrl){
   
        document.forms[0].action=theUrl;
        document.forms[0].submit();
   
}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/module/module_disp.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>ģ����ϸ��Ϣ</span>
	   <span class="buttons">
	    <a href="#" onclick="dosubmit('module_list.do')"><img src="../../images/blue/b_back.png" />����</a>
	   </span>
	 </div>
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            
            <td>ģ�ͱ��룺</td>
            <td>
             <bean:write name="t23_rule_module" property="module_no" scope="request"/>
            </td>
            <td>ģ�����ƣ�</td>
            <td>
             <html:hidden property="module_no"/>
             <bean:write name="t23_rule_module" property="module_name" scope="request"/>
            </td>
          </tr>
          <tr>
          <td>ģ�����ͣ�</td>
            <td>
              <bean:write name="t23_rule_module" property="module_type_disp" scope="request"/>
            </td>
            <td>ģ�����</td>
            <td>
              <bean:write name="t23_rule_module" property="module_grey_disp" scope="request"/>
            </td>
          </tr>
          <tr>
          	<td>ģ��ʱ�����䣺</td>
            <td>
              <bean:write name="t23_rule_module" property="totalday_str" scope="request"/>��
            </td>
            <td>���ɰ���ģ�ͷ�ֵ��</td>
            <td>
              <bean:write name="t23_rule_module" property="case_minscore_str" scope="request"/>
            </td>
          </tr>
          <tr> 
          	<td>ģ��������ָ����</td>
            <td colspan="3"  >
              <bean:write name="t23_rule_module" property="module_des" scope="request"/>
            </td>
          </tr>
         </table>
      </div>
     
 	<logic:notEmpty name="t23_module_stcrList">
     <div class="cond_t">
     <span><font color="#FF0000">*</font>������Ϣ</span>
     </div>
     
     <div class="list">
        <table border="0" cellpadding="0" cellspacing="0" id="tableid">
        	<tr>
          		<th nowrap align="center">�������</th>
          		<th nowrap align="center" >��������</th>
          		<th noWrap align="center">��������</th>
          		<th noWrap align="center">�÷�</th>
       		</tr>
        
          </tr>
          <logic:iterate id="t23_module_stcr" name="t23_module_stcrList" type="com.ist.mfa.dto.T23_module_stcr">
          <tr>
          	<td><bean:write name="t23_module_stcr" property="keystcr" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr" property="pbc_des" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr" property="stcr_type_disp" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr" property="stcrscore" scope="page" /></td>
          </tr>
          </logic:iterate>
          </table>
     </div>
     </logic:notEmpty>
<!-- 
     <logic:notEmpty name="t23_module_stcrList1">
     <div class="cond_t">
     <span><font color="#FF0000">*</font>ģ��������Ϣ</span>
     </div>
     
     <div class="list">
        <table border="0" cellpadding="0" cellspacing="0" id="tableid">
        	<tr>
          		<th nowrap align="center">�������</th>
          		<th nowrap align="center" >��������</th>
          		<th noWrap align="center">��������</th>
          		<th noWrap align="center">�÷�</th>
       		</tr>
        
          </tr>
          <logic:iterate id="t23_module_stcr1" name="t23_module_stcrList1" type="com.ist.mfa.dto.T23_module_stcr">
          <tr>
          	<td><bean:write name="t23_module_stcr1" property="keystcr" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr1" property="pbc_des" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr1" property="stcr_type_disp" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr1" property="stcrscore" scope="page" /></td>
          </tr>
          </logic:iterate>
          </table>
     </div>
     </logic:notEmpty>
     
      <logic:notEmpty name="t23_module_stcrList2">
     <div class="cond_t">
     <span><font color="#FF0000">*</font>�ؼ�������Ϣ</span>
     </div>
     
     <div class="list">
        <table border="0" cellpadding="0" cellspacing="0" id="tableid">
        	<tr>
          		<th nowrap align="center">�������</th>
          		<th nowrap align="center" >��������</th>
          		<th noWrap align="center">��������</th>
          		<th noWrap align="center">�÷�</th>
       		</tr>
        
          </tr>
          <logic:iterate id="t23_module_stcr2" name="t23_module_stcrList2" type="com.ist.mfa.dto.T23_module_stcr">
          <tr>
          	<td><bean:write name="t23_module_stcr2" property="keystcr" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr2" property="pbc_des" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr2" property="stcr_type_disp" scope="page" /></td>
          	<td><bean:write name="t23_module_stcr2" property="stcrscore" scope="page" /></td>
          </tr>
          </logic:iterate>
          </table>
     </div>
     </logic:notEmpty>
 -->    
    </div>
    <!-- all end -->
  </div>
</html:form>
</body>
</html>
