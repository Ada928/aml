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
<script type="text/javascript" src="../../js/ymPrompt.js"></script>

<script type="text/javascript">
function dosubmit(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	
}
function checkForm(theUrl,theType){
    var errMsg = "";
    var isSub = false;
     if(theType=='del'){
    	  errMsg = CheckBoxMustChecked(document.forms[0]);
	     	if(errMsg==''){
	             if(confirm('��ȷ��Ҫɾ����')){
	                 isSub = true;
	             }
	         }
         }
     if(isSub && errMsg==''){
         document.forms[0].action=theUrl;
         document.forms[0].submit();
     }else{
         if(errMsg!='')
             alert(errMsg);
         return false;
     }
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>
</HEAD>
<BODY id="iframecontent">
<html:form action="/cust_identify/t10_checkparty_relist.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>���¿ͻ�ʶ��</span>  
	  <span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>&nbsp;
	  <a href="#" title="�������" onclick="ymPrompt.win({message:'t10_survey_partyAdd.do?newsearchflag=1',width:650,height:420,title:'���',handler:handler,iframe:true,fixPosition:true,dragOut:false});">
      <img src="../../images/<%=session.getAttribute("style")%>/b_add2.png" />�������</a> 
      <a href="#" onclick="checkForm('t10_checkparty_deleteByList_do.do','del')"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />ɾ��</a>
      </span>
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
         	   <html:text property="organkey" styleClass="text_white" size="10" maxlength="16" onblur="_Onblur('organname')" />
				<html:text property="organname" styleClass="text_white"	size="23" readonly="true" maxlength="10" />
				<a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
				
         	   
         	 </td>
            </tr>
            
            <tr>
            <td>�ͻ����ͣ�</td>
         	<td>
				<bean:define id="party_class_cd_str" name="party_class_cd_str"></bean:define><%=party_class_cd_str %>
				
			</td>
			<td>ʶ�����ͣ�</td>
         	<td>
				<html:select property="recheck_type">
				<html:options collection="recheck_typeMap" property="label" labelProperty="value" />
				</html:select>
				<input name="" type="button" value="�顡ѯ"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_relist.do?newsearchflag=1','search')"/>
			</td>
         	
           </tr>
           
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <th>ѡ��</th>
	  <th>�ͻ���</th>
	  <th>�ͻ�����</th>
	  <th>�ͻ�����</th>
	  <th>��������</th>
	  <th>ʶ������</th>
	  <th>֤������</th>
	  <th>֤����</th>
      <th>״̬</th>
	 </tr>
    <logic:iterate id="checkparty" name="t10_checkparty_relist" indexId="i" type="com.ist.aml.cust_identify.dto.T10_checkparty">
    <%
		String party_id = checkparty.getParty_id();
        if(party_id.contains("#")){
        	party_id = party_id.replace("#","%23");
        }
	%>
    <tr>
       <td>
		<html:multibox name="checkparty" property="partyIds">
			<bean:write name="checkparty" property="party_id" scope="page" />
		</html:multibox>
	  </td>
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
         <bean:write name="checkparty" property="recheck_type_disp" scope="page" />
       </td> 
       <td>
         <bean:write name="checkparty" property="card_type_disp" scope="page" />
       </td>
        <td>
         <bean:write name="checkparty" property="card_no" scope="page" />
       </td>
       <td>
       <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_riskRateMain.do?changeflag=3&check_type=2&party_id=<%=party_id %>&newsearchflag=1&party_class_cd=<bean:write name="checkparty" property="party_class_cd" scope="page" />&showCheckReason=yes&url=t10_checkparty_relist.do?');">δʶ��</a>
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
</body>
</html>