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
  var errMsg ="";
  if(getLength(document.forms[0].singleDealValue.value)==0){
      errMsg+="���յ��ʽ��׽���Ϊ�գ�";
      document.forms[0].singleDealValue.focus(); 
   }
 else if(checkPrice1(document.forms[0].singleDealValue.value)==false){
      errMsg+="���յ��ʽ��׽���ʽ����ȷ��";
      document.forms[0].singleDealValue.focus();
    }
  else if(getLength(document.forms[0].singleDealValue.value)>12){
      errMsg+="���յ��ʽ��׽��Ȳ��ܴ���12λ!";
      document.forms[0].singleDealValue.focus();
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
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/net/modify_paraDetection.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">

      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
        
       
           <tr>
			<td><font color="#ff0000">*</font>���յ��ʽ��׽��>=  </td>
			<td><html:hidden  property="singleDealKey" name="t23_net_para_dto"/>	
			   <html:text  property="singleDealValue" name="t23_net_para_dto"/>			   
			</td>
		  </tr>
            <tr>
			<td><font color="#ff0000">*</font>Ԥ���ͻ�ȫ������ </td>
			
			<td><html:hidden  property="warnDealKey" name="t23_net_para_dto"/>
			    <html:radio name="t23_net_para_dto" property="warnDealValue" value="1">��</html:radio>
			    <html:radio name="t23_net_para_dto" property="warnDealValue" value="0">��</html:radio>
				</td>
		
		  </tr>
		  <tr>
			<td><font color="#ff0000">*</font>������ȫ������</td>
			<td><html:hidden  property="blackDealKey" name="t23_net_para_dto"/>
			    <html:radio name="t23_net_para_dto" property="blackDealValue" value="1">��</html:radio>
			    <html:radio name="t23_net_para_dto" property="blackDealValue" value="0">��</html:radio>
				</td>
		  </tr>
		  <tr>
			<td><font color="#ff0000">*</font>�ų�����������</td>
			<td><html:hidden  property="whiteDealKey" name="t23_net_para_dto"/>
			    <html:radio name="t23_net_para_dto" property="whiteDealValue" value="1">��</html:radio>
			    <html:radio name="t23_net_para_dto" property="whiteDealValue" value="0">��</html:radio>
				</td>
		  </tr>
		  <tr>
            <td><input name="" type="button" class="in_button1" value="�� ��" onclick="dosubmit('modify_paraDetection.do')" /></td>
			<td> <input name="" type="reset" class="in_button1" value="�� ��" /></td>
          </tr>
        </table>
      </div>
    </div>
    <!-- all end -->
  </div>
</html:form>
</body>
</html>
