<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String cordaurl="";
	if(request.getAttribute("cordaurl")!=null){
 		cordaurl=(String)request.getAttribute("cordaurl");
 		cordaurl=cordaurl.substring(1);
 		cordaurl="\""+request.getContextPath() + cordaurl;
	}
%>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>
     

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">
function  _Opendailog1(url,type){
 
     if(type=='option'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            
                isSub = true;
           
        }
    }
	 if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "��ѡ��";
            }
			isSub = true;
    }
    if(isSub && errMsg==''){
       
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
	 var errMsg = "";
    var isSub = false;
	var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "ff","dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");

  
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form1.action='AlertAnalyse_List.htm';
        document.form1.submit();
   }
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        if(checkRadio(form1.radioname)<0){
            	errMsg = "��ѡ��";
            }
			isSub = true;
    }
	else if(type=='adit'){
        if(checkRadio(form1.username)<0){
            	errMsg = "��ѡ��";
            }
			isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫɾ��ѡ����û���')){
                isSub = true;
            }
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫ��ͣѡ����û���')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫ����ѡ����û���')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        location.href=theUrl+"&"+Math.random();
    }
    if(isSub && errMsg==''){
        document.form1.action=theUrl;
        document.form1.submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
   
        document.form1.action=url;
        document.form1.submit();
   
}
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}
function checkForm(theUrl){
   
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function add_row(divid,butttonid,resultid)
{
	
	var tag=document.getElementById(resultid).value;
	if(tag=='1'){
		document.getElementById(butttonid).value="ȡ��";
		document.getElementById(divid).style.display = "inline";
		document.getElementById(resultid).value="2";
	}
	if(tag=='2'){
		document.getElementById(butttonid).value="���";
		document.getElementById(divid).style.display = "none";
		document.getElementById(resultid).value="1";
	}
	
}

function add_row1(divid,butttonid,buttonid1,resultid)
{
	
	var tag=document.getElementById(resultid).value;
	
	if(tag=='1'){
		document.getElementById(butttonid).style.display = 'none';
		document.getElementById(buttonid1).style.display = '';
		document.getElementById(divid).style.display = '';
		document.getElementById(resultid).value="2";
	}
	if(tag=='2'){
		document.getElementById(butttonid).style.display = 'none';
		document.getElementById(buttonid1).style.display = '';
		document.getElementById(divid).style.display = "none";
		document.getElementById(resultid).value="1";
	}
	
}


	function add_do(tagid, tableid, theUrl) {
		var tagresut = document.getElementById(tagid).value;
		var errMsg = "";
		if (tagresut == 1) {
			errMsg = "����ӣ��󱣴棡";
		} else if (tableid == "T10_BUSINESS_INFO") {
			if (getLength(document.forms[0].background.value) == 0
					|| trim(document.forms[0].background.value) == '') {
				errMsg = "����дҵ�񱳾���";
				document.forms[0].background.focus();
			}
		} else if (tableid == "T10_ECONOMY_INFO") {
			if (getLength(document.forms[0].tradeanalyse.value) == 0
					|| trim(document.forms[0].tradeanalyse.value) == '') {
				errMsg = "����д��ҵ״��������";
				document.forms[0].tradeanalyse.focus();
			}
		} else if (tableid == "T10_CONTROLLERINFO") {
			var amt = document.forms[0].amt.value;
			if (getLength(document.forms[0].party_name.value) == 0
					|| trim(document.forms[0].party_name.value) == '') {
				errMsg = "����д�����˻�ɶ����ƣ�";
				document.forms[0].party_name.focus();
			} else if (isNaN(amt)) {
				errMsg = "��������ȷ�����֣�";
				document.forms[0].amt.focus();
			} else if (getLength(amt) > 16) {
				errMsg = "���ʽ��ȹ�����";
				document.forms[0].amt.focus();
			}
		} else if (tableid == "T10_AGENT_INFO") {
			if (getLength(document.forms[0].party_name_agent.value) == 0
					|| trim(document.forms[0].party_name_agent.value) == '') {
				errMsg = "����д���������ƣ�";
				document.forms[0].party_name_agent.focus();
			}
		} else if (tableid == "T10_OPP_CUST_INFO") {
			if (getLength(document.forms[0].party_name_opp.value) == 0
					|| trim(document.forms[0].party_name_opp.value) == '') {
				errMsg = "����д�������ƣ�";
				document.forms[0].party_name_opp.focus();
			}
		}

		if (errMsg != "") {
			alert(errMsg);
			return false;
		} else {
			document.forms[0].action = theUrl + '?tablename=' + tableid;
			document.forms[0].submit();
		}

	}
	function fPopUpCalendarDlg(ctrlobj) {
		showx = event.screenX - event.offsetX - 4 - 210; // + deltaX;
		showy = event.screenY - event.offsetY + 18; // + deltaY;
		newWINwidth = 210 + 4 + 18;

		retval = window
				.showModalDialog(
						"../../js/date.htm",
						"",
						"dialogWidth:197px; dialogHeight:210px; dialogLeft:"
								+ showx
								+ "px; dialogTop:"
								+ showy
								+ "px; status:no; directories:yes;scrollbars:no;Resizable=no; ");
		if (retval != null) {

			ctrlobj = eval('document.forms[0].' + ctrlobj);
			ctrlobj.value = retval;
		} else {
			//alert("canceled");
		}
	}
	function checkDel(num,index){
		if(confirm("ȷ��Ҫɾ���ü�¼��?")){
			var url='delT10_colu.do?newsearchflag=1&party_id='+document.forms[0].party_id.value+'&party_class_cd='+document.forms[0].party_class_cd[0].value+'&num='+num+'&index='+index;
			window.location.href=url;;
		}
	}
</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/modifyT10_colu.do" method="post">
<input type="hidden" name="party_id" value="<bean:write name="party_id"/>"/>
<input type="hidden" name="party_class_cd" value="<bean:write name="party_class_cd"/>"/>
<div class="conditions">
	  <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%" >
        <td width="80%">
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />ҵ����Ϣ</strong></span>
		</td>
		<td width="20%">
		<span class="buttons">
		<!-- 
		<input type="button" class="in_button1" name="add" id="T10_BUSINESS_INFObutton" value="�� ��" onClick="add_row('T10_BUSINESS_INFO','T10_BUSINESS_INFObutton','T10_BUSINESS_INFOresult')">&nbsp;
		<input type="button" class="in_button1" name="save" value="����" onClick="add_do('T10_BUSINESS_INFOresult','T10_BUSINESS_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')">
		
		 -->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="T10_BUSINESS_INFObutton" onClick="add_row1('T10_BUSINESS_INFO','T10_BUSINESS_INFObutton','T10_BUSINESS_INFObutton1','T10_BUSINESS_INFOresult')"><img src="../../images/blue/b_add.png" />����</a>
		<a href="#" style="display:none" id="T10_BUSINESS_INFObutton1" onClick="add_row1('T10_BUSINESS_INFO','T10_BUSINESS_INFObutton1','T10_BUSINESS_INFObutton','T10_BUSINESS_INFOresult')"><img src="../../images/pop_close.gif" />ɾ��</a>
		<a href="#" onClick="add_do('T10_BUSINESS_INFOresult','T10_BUSINESS_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')"><img src="../../images/blue/b_save.png" />����</a>    
		
		</span>
		</td>
	  </table>
	 </div>  
	
	<div class="list">
        <table border="0" cellspacing="0" cellpadding="0" >
				<tr>
					<th>ҵ�񱳾�</th>
				    <th>�ʽ���Դ��ȥ��</th>	
					<th>�ʽ���;</th>	
					<th>ʵ�ʾ�Ӫҵ��</th>
					<th>ɾ��</th>
				</tr>
				 <logic:iterate id="result1" name="tList1" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
                 <tr>
		
				  <td><bean:write name="result1" property="background" scope="page"/></td>
				    <td><bean:write name="result1" property="fundorigin" scope="page"/></td>			
				    <td><bean:write name="result1" property="founduse" scope="page"/></td>
				    <td><bean:write name="result1" property="runbusi" scope="page"/></td>
				  	<td>
				  	<img src="../../images/pop_close.gif" title="ɾ��" onclick="checkDel('<bean:write name="result1" property="num" scope="page"/>',1)" />
				  	</td>
				</tr>
			   
			</logic:iterate>	
				
				<input  type="hidden" value="1" id="T10_BUSINESS_INFOresult"/>
				<tr id="T10_BUSINESS_INFO" style="display:none;">
				<td><html:text name="t10_check_cust_cardForm"  property="background"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="fundorigin"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="founduse"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="runbusi"/>
				</td>
				<td>&nbsp;
				</td>
				</tr>
									
	    </table>	
    </div>
    
    
    <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <td width="80%">
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />����״��</strong></span>
		</td>
		<td width="20%">
		<span class="buttons">
		<!-- 
		<input type="button" class="in_button1" name="add" id="T10_ECONOMY_INFObutton" value="�� ��" onClick="add_row('T10_ECONOMY_INFO','T10_ECONOMY_INFObutton','T10_ECONOMY_INFOresult')">&nbsp;
		<input type="button" class="in_button1" name="save" value="����" onClick="add_do('T10_ECONOMY_INFOresult','T10_ECONOMY_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')">
		-->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="T10_ECONOMY_INFObutton" onClick="add_row1('T10_ECONOMY_INFO','T10_ECONOMY_INFObutton','T10_ECONOMY_INFObutton1','T10_ECONOMY_INFOresult')"><img src="../../images/blue/b_add.png" />����</a>
		<a href="#" style="display:none" id="T10_ECONOMY_INFObutton1" onClick="add_row1('T10_ECONOMY_INFO','T10_ECONOMY_INFObutton1','T10_ECONOMY_INFObutton','T10_ECONOMY_INFOresult')"><img src="../../images/pop_close.gif" />ɾ��</a>
		<a href="#" onClick="add_do('T10_ECONOMY_INFOresult','T10_ECONOMY_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')"><img src="../../images/blue/b_save.png" />����</a>    
			
		</span>
		</td>
		</table>
	 </div>
	 
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>��ҵ״������</th>
								<th>��Ӫ״������</th>	
									<th>����״������</th>	
									<th>ɾ��</th>
								</tr>	
								<logic:iterate id="result2" name="tList2" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
				                 <tr>
						
								  <td><bean:write name="result2" property="tradeanalyse" scope="page"/></td>
								    <td><bean:write name="result2" property="runstatanalyse" scope="page"/></td>			
								    <td><bean:write name="result2" property="financeeanalyse" scope="page"/></td>
								   <td>
								  	<img src="../../images/pop_close.gif" title="ɾ��" onclick="checkDel('<bean:write name="result2" property="num" scope="page"/>',2)" />
								  	</td>
								</tr>
			   
			                 </logic:iterate>
			    <input  type="hidden" value="1" id="T10_ECONOMY_INFOresult"/>
				<tr id="T10_ECONOMY_INFO" style="display:none;">
				<td><html:text name="t10_check_cust_cardForm"  property="tradeanalyse"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="runstatanalyse"/>
				</td>
				<td><html:text name="t10_check_cust_cardForm"  property="financeeanalyse"/>
				</td>
				<td>&nbsp;
				</td>
				</tr>
														
</table>	
</div>
    
 <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
 <td width="80%">
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />�����˻�ɶ���Ϣ</strong></span>
		</td>
		<td width="20%">
		<span class="buttons">
		<!-- 
		<input type="button" class="in_button1" name="add" id="T10_CONTROLLERINFObutton" value="�� ��" onClick="add_row('T10_CONTROLLERINFO','T10_CONTROLLERINFObutton','T10_CONTROLLERINFOresult')">&nbsp;
		<input type="button" class="in_button1" name="save" value="����" onClick="add_do('T10_CONTROLLERINFOresult','T10_CONTROLLERINFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')">
		-->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="T10_CONTROLLERINFObutton" onClick="add_row1('T10_CONTROLLERINFO','T10_CONTROLLERINFObutton','T10_CONTROLLERINFObutton1','T10_CONTROLLERINFOresult')"><img src="../../images/blue/b_add.png" />����</a>
		<a href="#" style="display:none" id="T10_CONTROLLERINFObutton1" onClick="add_row1('T10_CONTROLLERINFO','T10_CONTROLLERINFObutton1','T10_CONTROLLERINFObutton','T10_CONTROLLERINFOresult')"><img src="../../images/pop_close.gif" />ɾ��</a>
		<a href="#" onClick="add_do('T10_CONTROLLERINFOresult','T10_CONTROLLERINFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')"><img src="../../images/blue/b_save.png" />����</a>    
		
				</span>
				</td>
				</table>
	 </div>
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>����</th>
								<th>֤������</th>	
									<th>֤������</th>
									<th>֤��������</th>	
									<th>���ʽ��</th>	
									<th>��ϵ��ʽ</th>		
					<th>ɾ��</th>
								</tr>	
								<logic:iterate id="result3" name="tList3" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
				                 <tr>
						
								  <td><bean:write name="result3" property="party_name" scope="page"/></td>
								    <td><bean:write name="result3" property="card_no" scope="page"/></td>			
								    <td><input type="text"  style="width:130px"  value="<bean:write name="result3" property="card_type" scope="page"/>"/></td>
								   <td><bean:write name="result3" property="card_due_dt_disp" scope="page"/></td>
								    <td><bean:write name="result3" property="amt" scope="page"/></td>			
								    <td><bean:write name="result3" property="linkmode" scope="page"/></td>
								   <td>
								  	<img src="../../images/pop_close.gif" title="ɾ��" onclick="checkDel('<bean:write name="result3" property="num" scope="page"/>',3)" />
								  	</td>
								</tr>
			   
			                 </logic:iterate>
								 <input  type="hidden" value="1" id="T10_CONTROLLERINFOresult"/>
									<tr id="T10_CONTROLLERINFO" style="display:none;">
									<td><html:text name="t10_check_cust_cardForm"  property="party_name"/>
									</td>
									<td><html:text name="t10_check_cust_cardForm"  property="card_no"/>
									</td>
									<td><html:select name="t10_check_cust_cardForm" property="card_type" style="width:130px"
		onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" >
											<html:options collection="card_typeMap2" property="label" labelProperty="value" />
										</html:select>
									</td>
									<td>
									 <html:text name="t10_check_cust_cardForm"  property="card_due_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									</td>
									<td><html:text name="t10_check_cust_cardForm"  styleId="amt" property="amt"/>
									</td>
									<td><html:text name="t10_check_cust_cardForm"  property="linkmode"/>
									</td><td>&nbsp;
				</td>
									</tr>						
					</table>	
</div>   
    
    <div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
 <td width="80%">
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />��������Ϣ</strong></span>
		</td>
		<td width="20%">
		<span class="buttons">
		<!--
		<input type="button" class="in_button1" name="add" id="T10_AGENT_INFObutton" value="�� ��" onClick="add_row('T10_AGENT_INFO','T10_AGENT_INFObutton','T10_AGENT_INFOresult')">&nbsp;
		<input type="button" class="in_button1" name="save" value="����" onClick="add_do('T10_AGENT_INFOresult','T10_AGENT_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')">
		-->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="T10_AGENT_INFObutton" onClick="add_row1('T10_AGENT_INFO','T10_AGENT_INFObutton','T10_AGENT_INFObutton1','T10_AGENT_INFOresult')"><img src="../../images/blue/b_add.png" />����</a>
		<a href="#" style="display:none" id="T10_AGENT_INFObutton1" onClick="add_row1('T10_AGENT_INFO','T10_AGENT_INFObutton1','T10_AGENT_INFObutton','T10_AGENT_INFOresult')"><img src="../../images/pop_close.gif" />ɾ��</a>
		<a href="#" onClick="add_do('T10_AGENT_INFOresult','T10_AGENT_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')"><img src="../../images/blue/b_save.png" />����</a>    
		
				</span>
				</td>
				</table>
	 </div>
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>����</th>
								<th>֤������</th>	
									<th>֤������</th>
									<th>֤��������</th>	
									<th>��ϵ��ʽ</th>		
								<th>ɾ��</th>
								</tr>	
								<logic:iterate id="result4" name="tList4" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
				                 <tr>
						
								  <td><bean:write name="result4" property="party_name" scope="page"/></td>
								    <td><bean:write name="result4" property="card_no" scope="page"/></td>			
								    <td><input type="text"  style="width:130px"  value="<bean:write name="result4" property="card_type" scope="page"/>"/></td>
								   <td><bean:write name="result4" property="card_due_dt_disp" scope="page"/></td>
								    <td><bean:write name="result4" property="linkmode" scope="page"/></td>
								    <td>
								  	<img src="../../images/pop_close.gif" title="ɾ��" onclick="checkDel('<bean:write name="result4" property="num" scope="page"/>',4)" />
								  	</td>			
								</tr>
			   
			                 </logic:iterate>
								<input  type="hidden" value="1" id="T10_AGENT_INFOresult"/>
									<tr id="T10_AGENT_INFO" style="display:none;">
									<td><html:text name="t10_check_cust_cardForm"  property="party_name_agent"/>
									</td>
									<td><html:text name="t10_check_cust_cardForm"  property="card_no_agent"/>
									</td>
									<td><html:select name="t10_check_cust_cardForm" property="card_type_agent"  style="width:130px">
											<html:options collection="card_typeMap2" property="label" labelProperty="value" />
										</html:select>
									</td>
									<td>
									<html:text name="t10_check_cust_cardForm"  property="income_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
									
									</td>
									<td><html:text name="t10_check_cust_cardForm"  property="linkmode_agent"/>
									</td><td>&nbsp;
				</td>
									</tr>							
					</table>	
</div>


<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
 <td width="80%">
		<span class="buttons"><strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.png" />������Ϣ</strong></span>
		</td>
		<td width="20%">
		<span class="buttons">
		<!--
		<input type="button" class="in_button1" name="add" id="T10_OPP_CUST_INFObutton" value="�� ��" onClick="add_row('T10_OPP_CUST_INFO','T10_OPP_CUST_INFObutton','T10_OPP_CUST_INFOresult')">&nbsp;
		<input type="button" class="in_button1" name="save" value="����" onClick="add_do('T10_OPP_CUST_INFOresult','T10_OPP_CUST_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')">
		-->
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<a href="#" id="T10_OPP_CUST_INFObutton" onClick="add_row1('T10_OPP_CUST_INFO','T10_OPP_CUST_INFObutton','T10_OPP_CUST_INFObutton1','T10_OPP_CUST_INFOresult')"><img src="../../images/blue/b_add.png" />����</a>
		<a href="#" style="display:none" id="T10_OPP_CUST_INFObutton1" onClick="add_row1('T10_OPP_CUST_INFO','T10_OPP_CUST_INFObutton1','T10_OPP_CUST_INFObutton','T10_OPP_CUST_INFOresult')"><img src="../../images/pop_close.gif" />ɾ��</a>
		<a href="#" onClick="add_do('T10_OPP_CUST_INFOresult','T10_OPP_CUST_INFO','<%=request.getContextPath() %>/report/custcheck/t10_add_cust_do.do')"><img src="../../images/blue/b_save.png" />����</a>    
		
		
		</span>
				</td>
				</table>
				
	 </div>
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<th>����</th>
								<th>֤������</th>	
									<th>֤������</th>
									<th>�ͻ�����</th>		
									<th>ɾ��</th>		
								</tr>	
								<logic:iterate id="result5" name="tList5" indexId="i" type="com.ist.aml.report.dto.T10_check_cust_clue">
				                 <tr>
						
								  <td><bean:write name="result5" property="party_name" scope="page"/></td>
								    <td><bean:write name="result5" property="card_no" scope="page"/></td>			
								    <td><input type="text"  style="width:130px"  value="<bean:write name="result5" property="card_type" scope="page"/>"/></td>
								   <td><bean:write name="result5" property="party_class_cd_disp" scope="page"/></td>
								    <td>
								  	<img src="../../images/pop_close.gif" title="ɾ��" onclick="checkDel('<bean:write name="result5" property="num" scope="page"/>',5)" />
								  	</td>
								</tr>
			   
			                 </logic:iterate>
							<input  type="hidden" value="1" id="T10_OPP_CUST_INFOresult"/>
									<tr id="T10_OPP_CUST_INFO" style="display:none;">
									<td><html:text name="t10_check_cust_cardForm"  property="party_name_opp"/>
									</td>
									<td><html:text name="t10_check_cust_cardForm"  property="card_no_opp"/>
									</td>
									<td><html:select name="t10_check_cust_cardForm" property="card_type_opp" style="width:130px"
		onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
											<html:options collection="card_typeMap2" property="label" labelProperty="value" />
										</html:select>
										
									</td>
									<td>
									<html:select name="t10_check_cust_cardForm" property="party_class_cd" >
											<html:options collection="party_class_cdMap" property="label" labelProperty="value" />
										</html:select>
									
									</td><td>&nbsp;
				</td>
									
									</tr>								
					</table>	
</div>
 </div>
    <div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
</html:form> 

</body>
</html>
