<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<SCRIPT LANGUAGE="JavaScript">
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}
function dosubmit(theUrl,type){
var errMsg = "";
var searchtype=document.forms[0].searchtype.value;
	if(document.forms[0].amt_end_search.value !="" ){
	if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
		document.forms[0].amt_end_search.focus();
		errMsg = "��ʼ���׽��ܴ��ڽ������׽�";
}
	}
	if(searchtype!="today"){
   if(!_compareTwoDateForString(document.forms[0].tx_dt_search_disp.value, document.forms[0].tx_enddt_search_disp.value)) {
   document.forms[0].tx_dt_search_disp.focus();
	 errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ��";		    
		   }
		   } 
	 if(type=='search'){
	     _Date1 = document.forms[0].tx_dt_search_disp.value;
         _Date2 = document.forms[0].tx_enddt_search_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	
	 }
	 if(errMsg=='')
     {
         document.forms[0].action=theUrl;
         if(jQuery('#form0').validateAll()){
		          document.forms[0].submit()
		         }
     }else{
         if(errMsg!='')
             alert(errMsg);
         return false;
     }
   event.srcElement.disabled = true;
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

function modify(theUrl, id){

	var form=document.forms[0];
	var ids=$getSelectedIds();
	if (ids.length == 0){
		alert("��ѡ���޸ĵ���Ϣ��");
		return false;
	} else if(ids.length > 1){
        alert("ֻ��ѡ��һ�������޸ģ�");
        return false;
	}
	if (!id)
		id=ids[0];
	  document.form1.action=url;
	
	  // form.modifydp_info.value=modifydp_info;
	  // document.forms[0].action=renderParsToUrl("investigate_modify_do.do" , modifydp_info);
	   document.forms[0].submit();	
}
function dosubmitt(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('�����Ҫɾ��ѡ�������Ϣ��')){
                    isSub = true;
                }
            }
        }
          else if(type=='delcheck'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            if(errMsg==''){
                if(confirm('�����Ҫɾ��ѡ�����������')){
                    isSub = true;
                }
            }
        }
        else if(type=='search' || type=='add'){
            isSub = true;
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
function _Open(url){
   
   
    url=url+".do?newsearchflag=1";
    alert(url);
    window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
    //window.open(url);
      
}

function _openTrade(url){
 
   window.open(url,'','height=500, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
 // window.open(url);
      
}


</script>

	</head>
	<body  class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/transaction/t47_alert_transaction_list.do" method="post" styleId="form0">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> 
						   <strong>
						       <font color="0072BC">
						           <logic:equal
										property="searchtype" name="t47_transactionActionForm"
										value="all">
										���в�¼����
									</logic:equal> 
									<logic:equal property="searchtype"
													name="t47_transactionActionForm" value="today">
										һ�ν��ײ�¼
									</logic:equal> 
									<logic:equal property="searchtype"
													name="t47_transactionActionForm" value="complete">
										�Ѳ�¼�Ľ���
									</logic:equal>
						        </font> 
						    </strong>
						</span>
						<span class="buttons">
	  <a href="#" id="hdd_display" class="bt_hidden"></a>
	   </span>
					    <logic:equal name="t47_transaction" property="searchtype"
								value="all">
						<span class="buttons">
								<html:button property="button1" styleClass="input"
									value="����Excel"
									onclick="dosubmit('t47_alert_transaction_excel.do')" />
						</span>
					    </logic:equal> 
						<logic:equal name="t47_transaction" property="searchtype"
								value="today_">
						  <span class="buttons">
								<html:button property="button1" styleClass="input"
									value="����Excel"
									onclick="dosubmit('t47_alert_transaction_excel.do')" />
						  </span>
					   </logic:equal> &nbsp; 
					   
					</div>
					<!-- table content -->
					<div class="cond_c"   id="searchtable"> 
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<logic:equal property="searchtype" value="today" name="t47_transactionActionForm">
									<td>
										������ֹ���ڣ�
									</td>
									<td>	
									<html:text property="tx_dt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg"  /> --
                               		<html:text property="tx_enddt_search_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg"  />
									</td>
								</logic:equal>
								<td>
									ԭ�ͻ��ţ�
								</td>
								<td>
									<html:text property="host_cust_id" styleClass="text_white" size="24" require="false" datatype="safeString|limit_max" max="24" msg="������Ϸ��Ŀͻ�id|���ܳ���24���ַ�" />
								</td>
							</tr>
							<html:hidden property="tx_today_disp" />
							<tr>
								<logic:equal property="searchtype" value="today"
									name="t47_transactionActionForm">
									<td>
										�Ƿ��Ѳ�¼��
									</td>
									<td>
										<bean:define id="yesNo_str" name="yesNo_str"></bean:define>
				            			<%=yesNo_str%>
									</td>
								</logic:equal>
								<td>
									�����˻���
								</td>
								<td>
									<html:text property="acct_num_search" styleClass="text_white" size="24" 
									require="false" datatype="safeString|limit_max" max="64" msg="������Ϸ��Ľ����˻�|���ܳ���64���ַ�" />
								</td>
							</tr>
							<tr>
								<td>
									���׽�
								</td>
								<td>
									<html:text property="amt_start_search" styleClass="text_white"
										size="12" require="flase" datatype="double|limit_max" msg="��ʽ����ȷ��|���Ȳ��ܳ���20λ��" max="20" />
									��
									<html:text property="amt_end_search" styleClass="text_white"
										size="12" require="flase" datatype="double|limit_max" msg="��ʽ����ȷ��|���Ȳ��ܳ���20λ��" max="20" />
									(�������)
								</td>
								<td>
									���׻�����
								</td>
								<td>

									<html:text property="organkey_search" styleClass="text_white"
										size="10" onblur="_Onblur('organName')" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������"/>
									<html:text property="organName" styleClass="text_white"
										size="23" readonly="true" maxlength="10" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey_search&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								</td>
							</tr>
							<tr>
								<td>
									��ת��ǣ�
								</td>
								<td>
									<bean:define id="goflag_str" name="goflag_str"></bean:define>
				            		<%=goflag_str%>
								</td>
								<td>
									�ͻ��ţ�
								</td>
								<td>
									<html:text property="party_id_search" styleClass="text_white"
										size="10" onblur="_Onblur('party_chn_name_disp')" require="false" datatype="safeString|limit_max" max="32" msg="������Ϸ��Ŀͻ�id|���ܳ���32���ַ�" />
									<html:text property="party_chn_name_disp"
										styleClass="text_white" size="23" maxlength="10"
										readonly="true" />
 				<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id_search&input_name_disp=party_chn_name_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								</td>
							</tr>
							<tr>
								<td>
									����ң�
								</td>
								<td>
									<bean:define id="curr_cd_str" name="curr_cd_str"></bean:define>
				            		<%=curr_cd_str%>
								</td>
								
								<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:define id="clienttype_str" name="clienttype_str"></bean:define>
				            			<%=clienttype_str%>
								</td>
								
							</tr>
							<tr>
								<logic:notEqual property="searchtype" value="all"
									name="t47_transactionActionForm">
									<td>
										�����־��
									</td>
									<td>
										<bean:define id="trackflag_str" name="trackflag_str"></bean:define>
				            			<%=trackflag_str%>
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
											onclick="dosubmit('<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?newsearchflag=1','search')" />
									</td>
								</logic:notEqual>

							</tr>
							<html:hidden property="re_ind_search" />

							
							<logic:equal property="searchtype" value="all"
								name="t47_transactionActionForm">
								<tr>
									<td>
										������ˮ��
									</td>
									<td>
										<html:text property="tx_no" styleClass="text_white" size="24"
											maxlength="24" />
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
									</td>
								</tr>
								<!-- add by lkl -->
								<tr>
									<td>
										��Ա��
									</td>
									<td>
										<html:text property="teller" styleClass="text_white" size="24"
											maxlength="24" />
									</td>

									<td></td>
									<td>
										<input type="button" name="ok" value="�� ѯ" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?newsearchflag=1','search')" />
									</td>
								</tr>

								<!-- end -->
							</logic:equal>

						</table>
					</div>
				</div>
				<html:errors />
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								��ˮ��
							</th>
							<th>
								ԭ�ͻ���
							</th>
							<th>
								�ͻ�����
							</th>
							<th>
								��������
							</th>
							<th>
								���׻���
							</th>
							<th>
								�˻�
							</th>
							<th>
								����
							</th>
							<th>
								���׽��
							</th>
							<th>
								���(�������)
							</th>
							<th>
								��Ʊ��
							</th>
							<th>
								��/��
							</th>
							<th>
								��ת���
							</th>
							<!--  <th>
								����
							</th>
							-->
						</tr>
						<logic:present name="t47_transactionList" scope="request">
							<logic:iterate id="transaction" indexId="i"
								name="t47_transactionList"
								type="com.ist.aml.report.dto.T47_transaction">

								<tr>
									<td>
									
										<a	href="<%=request.getContextPath()%>/report/case/t47_transaction_modify.do?tableName=t47_transaction_ub&type=1&url=<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?searchtype=<bean:write name="t47_transactionActionForm" property="searchtype" />&transactionkey=<bean:write name="transaction" property="transactionkey" />&currency_cd=<bean:write name="transaction" property="currency_cd" />">
										<bean:write name="transaction" property="tx_no" />
										</a>
									</td>
									<td>
										<bean:write name="transaction" property="host_cust_id" />
									</td>
									<td>
										<bean:write name="transaction" property="party_chn_name" />
									</td>
									<td>
										<bean:write name="transaction" property="tx_dt_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="organName" />
									</td>
									<td>
										<bean:write name="transaction" property="acct_num" />
									</td>
									<td>
										<bean:write name="transaction" property="currency_cd_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="amt_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="cny_amtDisp" />
									</td>
									<td>
										<bean:write name="transaction" property="voucher_no" />
									</td>
									<td>
										<bean:write name="transaction" property="debit_credit_disp" />
									</td>
									<td>
										<bean:write name="transaction" property="cash_trans_flag_disp" />
									</td>


								<!-- 	<td>



										<a	href="<%=request.getContextPath()%>/report/case/t47_transaction_modify.do?tableName=t47_transaction_ub&type=1&url=<%=request.getContextPath()%>/report/transaction/t47_alert_transaction_list.do?searchtype=<bean:write name="t47_transactionActionForm" property="searchtype" />&transactionkey=<bean:write name="transaction" property="transactionkey" />&currency_cd=<bean:write name="transaction" property="currency_cd" />">
											<%
												String addtional = transaction.getAddtional();

																	if (addtional != null && addtional.equals("1")) {
											%> �� �� <%
												} else {
											%> <font color="#FF0000"> ��¼ </font> <%	}
 											%> </a>


									</td>
 								-->


								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />

				</div>
			</div>
		</html:form>
		<script>
		jQuery('#form0').checkFormSearch();
        </script>
	</body>
</html>
