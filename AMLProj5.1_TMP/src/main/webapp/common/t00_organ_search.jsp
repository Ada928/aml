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
<link id="skincss" href="../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../js/basefunc.js"></script>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].organkey)<0){
        errMsg+="��ѡ����Ҫ����Ļ�����";
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
<html:form action="/common/t00_organ_search.do" method="post">
<html:hidden property="input_name"/>
<html:hidden property="input_name_disp"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>������Ϣ��ѯ</span>
	  <span class="buttons">
	   <a href="#" onclick="checkForm('t00_organ_search_result.do')"><img src="../images/<%=session.getAttribute("style") %>/b_add.png" />ѡ ��</a>
	  <a href="#" onclick="window.close()"><img src="../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
	  </span>
	</div>
  <!-- table content -->
	<div class="cond_c">
	  <table border="0" cellpadding="0" cellspacing="0">
	    <tr>
      <td>
        �����ţ�
        </td>
        <td>
        <html:text property="okey"  size="10"/>
        </td>
        <td>
        �������ƣ�
        </td>
        <td>
        <html:text property="oname" size="15"/>
        <input  type="button" name="" value="��  ѯ" class="in_button1" onclick="dosubmit('t00_organ_search.do?newsearchflag=1')"/>
        <html:button property="s2" value="��  ��" styleClass="in_button1" onclick="document.forms[0].okey.value='';document.forms[0].oname.value=''"/>
       </td>
    </tr>
    </table>
	</div>
  </div>	
  <html:errors/>
  <!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>ѡ��</th>
		<th>������</th>
		<th>��������</th>
		<th>״ ̬</th>
		<th>����ʱ��</th>

	  </tr>
  
<logic:iterate id="organ" name="t00_organList" type="com.ist.platform.dto.T00_organ">
    <tr>
      <td >
          <html:radio property="organkey" idName="organ" value="organkey"></html:radio>
      </td>
      <td><bean:write name="organ" property="organkey" scope="page"/></td>
      <td><bean:write name="organ" property="organname" scope="page"/></td>
      <td><bean:write name="organ" property="flag_disp" scope="page"/></td>
      <td><bean:write name="organ" property="createdate_disp" scope="page"/></td>
    </tr>
</logic:iterate>
   </table>
  </div>		
	<html:errors />
	<!-- list_page --> 
  <div class="list_page">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
    </div>
<!-- all end -->   
</div>
		</html:form>
</body>
</html>