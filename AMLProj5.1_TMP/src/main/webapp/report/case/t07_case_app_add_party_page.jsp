<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl){
	var party_var = document.forms[0].party_id_s.value;
	var chn_name_var = document.forms[0].party_chn_name_search.value;
	var card_no_var = document.forms[0].card_no.value;
	if(party_var == '' && chn_name_var == '' && card_no_var == '')
	{
		alert("�ͻ��ţ��ͻ����ƣ�֤��������һ���Ϊ�գ�");
		return false;
	}
    �� document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function _Commit(theUrl){
	var errMsg = "";
    
    		errMsg=CheckBoxMustChecked(document.forms[0]);
         
     if( errMsg==''){
         document.forms[0].action=theUrl;
         document.forms[0].submit();
     }else{
         
         alert(errMsg);
         return false;
     }
}
function quit()
{
		window.close();
		opener.location.href='<%=request.getContextPath()%>/report/case/t07_case_app_add_party.do';
		
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/case/t07_case_app_add_party_page.do" method="post">

<div id="main">
<div class="conditions">
	<div class="cond_t">
	  <span>�ͻ���λ</span>
	  
	   <span class="buttons" >
	   <a href="#" onclick="_Commit('<%=request.getContextPath() %>/report/case/t07_case_app_add_party_page_add.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_choose.png" />ѡ��</a>
	   <a href="#" onclick="quit()"><img src="../../images/blue/b_save.png" />�����˳�</a>	   	
	  </span>
	
	</div>
	<div class="cond_c">
  		 <table border="0" cellpadding="0" cellspacing="0">
	    <tr>
	      <td>
	         	�ͻ��ţ�
	         <html:text property="party_id_s"   size="12"/>
	       	    �ͻ����ƣ�
	   	      <html:text property="party_chn_name_search"   size="12"/>
	      	     ֤���ţ�
	         <html:text property="card_no"   size="12"/>
	      </td>
	      <td>�ͻ����ͣ�<html:select property="party_class_cd" >
	                      <html:options collection="clienttypeMap"
	                                    property="label"
	                                   labelProperty="value" />
	                    </html:select>
	      <input type="button" name="ok" value="��ѯ" class="in_button1" onclick="dosubmit('t07_case_app_add_party_page.do?newsearchflag=1&type=search')"/> 
	      </td>
	    </tr>
	  </table>
	</div>
</div>

  <html:errors/>
 <div class="list">
  <table border="0" cellpadding="0" cellspacing="0">
    <TR >
      <th >ѡ��</th>
      <th >�ͻ����</th>
      <th >�ͻ�����</th>
      <th >�ͻ�����</th>
      <th >����</th>
      <th >֤������</th>
      <th >֤������</th>
      <th >��ϸ��ַ</th>
      <th >��ϵ�绰</th>
      
    </TR>
<logic:iterate id="party" name="t47_partyList" indexId="i" type="com.ist.aml.report.dto.T47_party">

    <TR>
      <TD>
     		<html:multibox property="partyCheckBox">
				<bean:write name="party" property="party_id" />
			</html:multibox>
      </TD>
      
       <TD><bean:write name="party" property="party_id" scope="page"/></TD>
      <TD><bean:write name="party" property="party_chn_name" scope="page"/></TD>
     
       <TD>
       <logic:equal name="party" property="party_class_cd" value="I">��˽</logic:equal>
       <logic:equal name="party" property="party_class_cd" value="C">�Թ�</logic:equal>
       </TD>
       <TD><bean:write name="party" property="country_cd" scope="page"/></TD>
       <TD><bean:write name="party" property="card_type" scope="page"/></TD>
       <TD><bean:write name="party" property="card_no" scope="page"/></TD>
       <TD><bean:write name="party" property="addr1" scope="page"/></TD>
       <TD><bean:write name="party" property="tel_no" scope="page"/></TD>
    
    </TR>
	</logic:iterate>
  </TABLE>
  </div>
  <div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
</div>

  </div>
</html:form>
</BODY>
</HTML>
