
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">


function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}

function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}

function dosubmit(theUrl){
var errMsg = "";
    _Date1 = document.forms[0].tx_dt_disp.value;
    _Date2 = document.forms[0].tx_enddt_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	  
  			 if(errMsg!=''){
     alert(errMsg);
      return false; 
  }
   errMsg = DateDiff(_Date1,_Date2,183);
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
	if(!checkFloat(document.forms[0].amt_start_search.value)){
		errMsg+="������Ϊ���֣�";
        document.forms[0].amt_start_search.focus();
	}
		if(!checkFloat(document.forms[0].amt_end_search.value)){
		errMsg+="������Ϊ���֣�";
        document.forms[0].amt_end_search.focus();
	}
	if(document.forms[0].amt_end_search.value !="" ){
	if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
		document.forms[0].amt_end_search.focus();
		errMsg = "��ֹ���׽��ܴ�������׽��";
}
	}
    if(getLength(document.forms[0].party_id.value)==0){
        errMsg+="��ѡ��ͻ��ţ�";
        document.forms[0].party_id.focus();
        }
	 if(errMsg!=''){
        alert(errMsg);
        return false; 
         }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

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

function $getSelectedIds(){
	return $getSelectedValues("selectedid");
}	
function $getSelectedValues(fieldName){
   	var checks=document.getElementsByName(fieldName);
   	var ret=new Array();
   	var i;
   	for (i=0 ; i<checks.length; i++){   	
   		if (checks[i].checked)
   			ret =ret.concat(checks[i].value);
   	}
   	
   	return ret;
}

function dosubmitt(theUrl,type){
		
        var errMsg = "";
      
       if(type=='add'){
       		errMsg=CheckBoxMustChecked(document.forms[0]);
            
        }
        if( errMsg==''){
            document.forms[0].action=theUrl;
            document.forms[0].submit();
        }else{
            
            alert(errMsg);
            return false;
        }
  } 
  
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

function quit()
{
		window.close();
		opener.location.href='<%=request.getContextPath()%>/report/case/t07_case_app_add_trans.do';
		
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
	}
</script>

<script>
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />ȫ��");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />ȫѡ");
	  });
});
</script>
</head>

<body class="mainbg">
	<html:form action="/case/t07_case_app_add_trans_page.do" method="post">
		<input type="hidden" name="bus_type_cd"
			value="<bean:write name="bus_type_cd"/>" />
	<html:hidden property="application_num"/>
	<html:hidden property="stcr"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
<div class="cond_t">
	  <span>��ӽ��� </span>
	   <span class="buttons">
	   <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫѡ</a>
	   <a href="#" onclick="dosubmitt('t07_case_app_add_trans_tpla_addDo.do','add')"><img src="../../images/blue/b_add2.png" />���</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<td>
					������ֹ���ڣ�
				</td>
				<td>
			
			<html:text property="tx_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --   
			<html:text property="tx_enddt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />	
				</td>
				<td>
					�����˻���
				</td>
				<td>
					<html:text property="acct_num" styleClass="text_white"
						size="24" />
				</td>
			</tr>
			<tr>
				<td>
					���׽�
				</td>
				<td>
					<html:text property="amt_start_search" styleClass="text_white"
						size="12" maxlength="10" />
					��
					<html:text property="amt_end_search" styleClass="text_white"
						size="12" maxlength="10" />
					(�������)
				</td>
				<td>
					���׻����ţ�
				</td>
				<td>
					<html:text property="organkey" styleClass="text_white"
						size="10" maxlength="12" onchange="_Onblur('organName')"/>

					<html:text property="organName" styleClass="text_white"
						size="23" readonly="true"/>
					 	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
				
				</td>
			</tr>
			<tr>
				<td>
					�����־��
				</td>
				<td>
					<bean:define id="debit_credit_disp_str" name="debit_credit_disp_str"></bean:define><%=debit_credit_disp_str %>
				</td>
				<td>
					�ͻ��ţ�
				</td>
				<td>
					<html:text property="party_id" styleClass="text_white"
						 size="10" maxlength="32" onchange="_Onblur('party_chn_name')"/>
					<html:text property="party_chn_name" styleClass="text_white"
						size="23" readonly="true" />
					 	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
					
				</td>
			</tr>

			<tr>
				
                
			</tr>
			<tr>
			    <td>
					����������
				</td>
				<td>
					<html:select property="channel" style="width:100px">
						<html:options collection="channelMap" property="label"
							labelProperty="value" />
					</html:select>
				</td>
				<td>
					����
				</td>
				<td>
					<html:select property="orderby" style="width:110">
						<html:options collection="tradesortMap" property="label"
							labelProperty="value" />
					</html:select>
					&nbsp;
					<html:radio property="order" value="1" />
					����
					<html:radio property="order" value="2" />
					����&nbsp;&nbsp;&nbsp;&nbsp;
					<html:hidden property="searchtype" />
					<input type="button" name="ok" value="�� ѯ" class="in_button1"
						onClick="dosubmit('t07_case_app_add_trans_tpla.do?newsearchflag=1')" />
				</td>
				
			</tr>
		</table>
	</div>
  </div>
<html:errors />
<!-- list --> 
  <div class="list">
		<TABLE border="0" cellspacing="0" cellpadding="0">
			<TR>
				<TH>
					ѡ��
				</TH>
				<TH>
					��ˮ��
				</TH>
				<TH>
					�ͻ���
				</TH>
				<TH>
					�ͻ�����
				</TH>
				<TH>
					��������
				</TH>

				<TH>
					���׻���
				</TH>
				<TH>
					�˻�
				</TH>
				<TH>
					����
				</TH>
				<TH>
					���׽��
				</TH>
				<TH>
					��/��
				</TH>
				<TH>
					��/ת��־
				</TH>
				<TH>
					ɸѡ��־
				</TH>
			</TR>
			<logic:present name="t47_transactionList" scope="request">
				<logic:iterate id="transaction" indexId="i"
					name="t47_transactionList"
					type="com.ist.aml.report.dto.T47_transaction">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("deposit_id", transaction.getAcct_num());
								String url = "/inves/trade/t47_transaction_list.do?searchtype="
								+ request.getParameter("searchtype");
								map.put("url", url);
								map.put("party_id", transaction.getParty_id());
								map.put("intPage", request.getParameter("intPage"));
								//map.put("deposit_id", transaction.getAcct_num());
								pageContext
								.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<TR align="center" class="interval"
						onMouseOver="this.className='interval2'"
						onMouseOut="this.className='interval'">
						<TD>
							<html:multibox property="transactionkeyCheckBox">
								<bean:write name="transaction" property="transactionkey" />
							</html:multibox>
							
						</TD>
						<TD>
							<a href="#"
								onclick="_Open('<%=request.getContextPath() %>/inves/trade/t47_transaction_disp.do?transactionkey=<bean:write name="transaction" property="transactionkey" />&tableName=ls')">
								<bean:write name="transaction" property="tx_no" /> </a>
						</TD>
						<TD>
							<bean:write name="transaction" property="host_cust_id" />
						</TD>
						<TD>
							<bean:write name="transaction" property="party_chn_name" />
						</TD>
						<TD>
							<bean:write name="transaction" property="tx_dt_disp" />
						</TD>

						<TD>
							<bean:write name="transaction" property="organkey" />
						</TD>
						<TD>
								<bean:write name="transaction" property="acct_num" />
						</TD>

						<TD>
							<bean:write name="transaction" property="currency_cd_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="amt_disp" />
						</TD>

						<TD>
							<bean:write name="transaction" property="debit_credit_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="cash_trans_flag_disp" />
						</TD>
						<TD>
							<bean:write name="transaction" property="validate_flag_disp" />
						</TD>
					</TR>
				</logic:iterate>
			</logic:present>
		</TABLE>
	</div>
<!-- list_page --> 
  <div class="list_page">
		<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
<!-- all end -->   
</div>
	</html:form>
</body>
</html>
