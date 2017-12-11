<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript">
function dosubmit(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/cust_identify/t10_checkparty_newlist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�¿��ͻ�ʶ��</span>
	  <span class="buttons"><a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;</span>  
 	</div>
   <div class="cond_c" id="searchtable">
   <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
            <td>
				�ͻ���
			</td>
			<td>
				<html:text property="party_id" styleClass="text_white"
					size="10" onblur="_Onblur('party_chn_name')" maxlength="32"/>
				<html:text property="party_chn_name" styleClass="text_white"
					size="23" readonly="true" />
				 	<a href="#" onclick="window.open('../../common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','', 'height=400, width=700,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
			
			</td>
            <td>����������</td>
         	   <td>
         	   <html:text property="organkey" styleClass="text_white" maxlength="16" size="10" onblur="_Onblur('organname')" />
				<html:text property="organname" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
				
         	   
         	 </td>
            </tr>
            
            <tr>
            <td>�ͻ����ͣ�</td>
         	<td>
				<bean:define id="party_class_cd_str" name="party_class_cd_str"></bean:define><%=party_class_cd_str %>
				
			</td>
         	<td></td>
         	<td>
         	    <input name="" type="button" value="�顡ѯ"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_newlist.do?newsearchflag=1','search')"/>
			</td>
           </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
	  <th>�ͻ���</th>
	  <th>�ͻ�����</th>
	  <th>�ͻ�����</th>
	  <th>��������</th>
	  <th>֤������</th>
	  <th>֤����</th>
      <th>״̬</th>
	 </tr>
    <logic:iterate id="checkparty" name="t10_checkparty_newlist" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty">
     <%
		String party_id = checkparty.getParty_id();
        if(party_id.contains("#")){
        	party_id = party_id.replace("#","%23");
        }
	 %>
    <tr>
     
       <td>
         <bean:write name="checkparty" property="party_id" scope="page" />
       </td>
	     <td>
         <bean:write name="checkparty" property="party_chn_name" scope="page" />
       </td>
	     <td>
         <bean:write name="checkparty" property="party_class_cd_disp" scope="page" />
       </td>
        <td>
         <bean:write name="checkparty" property="organname" scope="page" />
       </td> 
       <td>
         <bean:write name="checkparty" property="card_type_disp" scope="page" />
       </td>
        <td>
         <bean:write name="checkparty" property="card_no" scope="page" />
       </td>
       <td>
       <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_riskRateMain.do?changeflag=1&check_type=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="checkparty" property="party_class_cd" scope="page" />&url=t10_checkparty_newlist.do?');">
       	δʶ��</a>
       </td>

    </tr>
	</logic:iterate>
	</table>
  </div>
</html:form>
<div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
		</div> 
</div>
</body>
</html>