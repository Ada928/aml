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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/load_window.js"></script>


<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
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
   var hideElemens =  parDoc.getElementById(par_element[0]);
   var dispElemens =  parDoc.getElementById(par_element[1]);
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

	for( var i=0; i < oCheck.length; i++ ){
        if (oCheck[i].checked){
			selVal = oCheck[i].value.split('&');
			isCheck = false;
 
   				if(elements.indexOf(selVal[0]) == -1 ){
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





</script>
	</head>
	<body class="mainbg">
		<html:form action="/common/location_window.do" method="post">
			<html:hidden property="key" />
			<html:hidden property="key_name" />
			<html:errors/>
		<div id="main">
			<!-- conditions --> 
 			 <div class="conditions">
    			<!-- title -->
					<div class="cond_t">
	  						<span><%=(String) request.getAttribute("modulename")%></span>
                <span class="buttons">
                     <a href="#" id="hdd_display" class="bt_hidden"></a>
                     <a href="#" onclick="checkForm('local_colpara_window_result.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />ѡ ��</a>
                     <a href="#" onclick="dosubmit('location_window.do?flag=1')" ><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />ȫ ��</a>
                     <a href="#" onclick="window.close()" ><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
               </span>
                </div>
          	<!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td>
						<bean:write name="key_name" />
						:
						<input type="text" name="query1" class="text_white" size="20"
							id="100" value="<%=request.getAttribute("query1")%>"/>
						<bean:write name="key_disp_name" />
						:
						<input type="text" name="query2" class="in_button1" size="20"
							id="200" value="<%=request.getAttribute("query2")%>"/>
						<html:button property="s1" value="��  ѯ" styleClass="in_button1"
							onclick="dosubmit('location_window.do?newsearchflag=1')" />
						<html:button property="s2" value="��  ��" styleClass="in_button1"
							onclick="emptyall();" />
					</td>
				</tr>
			</table></div>
			  <!-- list --> 
  <div class="list">
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
			<%=htmlstr%></div>
			<logic:equal name="flag" value="">
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
			</logic:equal>
			</div>
			</div>
		</html:form>
	</BODY>
	<script type="text/javascript">
	setTableStyle("list_table","list");
	</script>
	
</HTML>


