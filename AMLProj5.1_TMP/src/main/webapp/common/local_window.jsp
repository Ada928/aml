<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

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
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><%=(String) request.getAttribute("modulename")%></title>
		<%@ include file="../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/load_window.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript">
  function dosubmit(theUrl){	
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
   // alert(theUrl);
    var errMsg ="";
    var parDoc = opener.document;
	
    var isCheck = true;
	var par_element = document.getElementById('localset').value.split(',');
	var selVal ;
   //������
   var hideElemens =  parDoc.getElementsByName(par_element[0])[0];
   var dispElemens =  parDoc.getElementsByName(par_element[1])[0];
    if(checkRadio(document.forms[0].selectedkey)<0){

        hideElemens.value="";
        dispElemens.value="";
        window.close();
    }
    else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
//ȫѡ�л�
function selectORClearBox(_setval){
   var _form=document.forms[0];
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	
function openChildWin(theUrl){

window.open(theUrl, '', 'height=200, width=160,left=50,top=30,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');	
}

//
function locate_sel(){
	var parDoc = opener.document;
	
    var isCheck = true;
	var par_element = document.getElementById('localset').value.split(',');
	
	var selVal ;
   //������
   var hideElemens =  parDoc.getElementsByName(par_element[0]);
   var dispElemens =  parDoc.getElementsByName(par_element[1]);
 
   var elements = hideElemens[0].value;

	//var oCheck = document.forms[0].selectedkey;
	var oCheck = document.getElementsByName('selectedkey');
    var eleStr = elements.split(',');
	for( var i=0; i < oCheck.length; i++ ){
        if (oCheck[i].checked){
			selVal = oCheck[i].value.split('&');
			
			isCheck = false;
 				
   				if(!in_array(selVal[0],eleStr)){
   				    if(hideElemens[0].value=='')
   				    {
   				    	hideElemens[0].value = selVal[0];
   				    	dispElemens[0].value = selVal[1];
   				    }
   				    else
   				    {
   				    	hideElemens[0].value = hideElemens[0].value+","+selVal[0];
   						dispElemens[0].value = dispElemens[0].value+","+selVal[1];
   				    }
   				}
 			
        }
   }

   if(isCheck){
	   alert("��ѡ��");
       return false;
   }


   window.close();
}


function in_array(needle, haystack) {

 var type = typeof needle;
 if(type == 'string' || type =='number') {
  for(var i in haystack) {
   if(haystack[i] == needle) {
     return true;
   }
  }
 }
 return false;
} 

function checkQuery(obj){
	if(obj.value.indexOf("'") >= 0){
		alert("�������뵥�����ַ���");
		var a = obj.value.replace("'","");
		obj.value = a;
		obj.focus();
		return false;
	}	
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/common/location_window.do" method="post">
			<html:hidden property="key" />
			<html:hidden property="key_name" />
			<div class='awp_title'>
				<table>
					<tr>
					
						<td width="23%">
							<span class="awp_title_td2"><%=(String) request.getAttribute("modulename")%>
							</span>
						</td>
						<td align="right">
							<html:button property="b1" value="ѡ ��" styleClass="input"
							onclick="checkForm('location_window_result.do')" />
						<logic:equal name="issingle" value="checkbox">
						<html:button property="b1" value="׷ ��" styleClass="input"
							onclick="locate_sel()" />
						</logic:equal>
					    <html:button property="b3" value="ȫ ��" styleClass="input"
							onclick="dosubmit('location_window.do?flag=1')" />
						<html:button property="b2" value="�� ��" styleClass="input"
							onclick="window.close()" />
						</td>
					</tr>
				</table>
			</div>            
			
			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<table >
				<tr>
					<td >
						<bean:write name="key_name" />
						��
						<input type="text" name="query1" class="text_white" size="10"
							id="100" value="<%=request.getAttribute("query1")%>" onkeyup="checkQuery(this)"/>
						<bean:write name="key_disp_name" />
						��
						<input type="text" name="query2" class="text_white" size="10"
							id="200" value="<%=request.getAttribute("query2")%>" onkeyup="checkQuery(this)"/>
						<html:button property="s1" value="��  ѯ" styleClass="input"
							onclick="dosubmit('location_window.do?newsearchflag=1')"/>
						<html:button property="s2" value="��  ��" styleClass="input"
							onclick="emptyall();" />
					</td>
				</tr>
			</table>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle"/>
			</html:messages>
			
			<input type="hidden" name="localset" id="localset"
				value="<%=request.getAttribute("localset")%>" />
			<input type="hidden" name="forms"
				value="<%=request.getAttribute("forms")%>" />
			<input type="hidden" name="issingle"
				value="<%=request.getAttribute("issingle")%>" />
			<input type="hidden" name="localname"
				value="<%=request.getAttribute("localname")%>" />
			<input type="hidden" name="condition"
				value="<%=request.getAttribute("condition")%>" />
			<input type="hidden" name="query1"
				value="<%=request.getAttribute("query1")%>" />
			<input type="hidden" name="query2"
				value="<%=request.getAttribute("query2")%>" />
			<bean:define id="htmlstr" name="htmlstr"></bean:define>
			<div class='awp_list'>
			<%=htmlstr%>
			</div>
			<logic:equal name="flag" value="">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
			</logic:equal>
		</html:form>
		</div>
	</BODY>
	<script type="text/javascript">
	setTableStyle("list_table","list");
	</script>
</HTML>


