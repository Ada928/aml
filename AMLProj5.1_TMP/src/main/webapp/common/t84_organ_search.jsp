<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
  /**
   * �ͻ�ѡ�񹫹�ҳ�棺
   * Ȩ�ޣ�����ҳ��û��Ȩ�޿���
   * �ӿڲ�����
   * form_name form�������
   * input_name �ͻ��ŵ��ı��������
   * input_name1 �ͻ����Ƶ��ı��������
   * ���磺<input type=button value="�� ѯ" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
*         <html:button property="b2" value="�� ѯ" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
   */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
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
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].organkey)<0){
        errMsg+="��ѡ����Ҫ��������ţ�";
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
<html:form action="/common/t84_organ_search.do" method="post">

  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td class="td1"> <span class="css014"> <strong><font color="0072BC">������Ϣ��ѯ</font></strong></span></td>
      <td width="22%" align="right" nowrap class="td2">
         <html:button property="b1" value="ѡ ��" styleClass="input" onclick="checkForm('t84_organ_search_result.do')"/>
         <html:button property="b2" value="�� ��" styleClass="input" onclick="window.close()"/>
      </td>
    </tr>
  </table>

   <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"></td>
    </tr>
  </table>
  <html:errors/>
  <TABLE width="98%" border=0 align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
    <TR align="center" class="tdhead">
      <TD width="30" height=22 noWrap>ѡ��</TD>
      <TD width="80">��������</TD>
      <TD width="80">���˴���</TD>
      <TD width="120">��������</TD>
      <TD width="80">��ҵ���</TD>
      <TD width="70" noWrap>���������</TD>
      <TD width="70" noWrap>��������˾</TD>
      <TD width="70" noWrap>�ֵ���</TD>
    </TR>
  <logic:iterate id="t84_organ" name="t84_organList" type="com.ist.platform.dto.T84_organ">
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
                <html:radio property="organkey" idName="t84_organ" value="organkey"></html:radio>
      </TD>
                <TD height=22><bean:write name="t84_organ" property="organkey"/></TD>
                <TD><bean:write name="t84_organ" property="porgankey"/></TD>
                <TD><bean:write name="t84_organ" property="organname_disp"/></TD>
                <TD><bean:write name="t84_organ" property="tradekey_disp"/></TD>
                <TD><bean:write name="t84_organ" property="isouterbank_disp"/></TD>
                <TD><bean:write name="t84_organ" property="issubcorp_disp"/></TD>
                <TD><bean:write name="t84_organ" property="isarea_disp"/></TD>
     </TR>
   </logic:iterate>
  </TABLE>
 <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">

  </table>
</html:form>
</BODY>
</HTML>


