<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
<script language="JavaScript" src="../../js/jquery.validator.js"></script>
<script language="JavaScript">
function _Onblur(){
   document.forms[0].organName.value="";
}
function selectAll(obj){
    if(document.forms[0].selectedApp!=null){
    if(obj.value=="ȫ  ѡ"){
        obj.value="ȫ��ѡ"
		if(document.forms[0].selectedApp.value!=""){
                document.forms[0].selectedApp.checked=true;
    	}
        if(document.forms[0].selectedApp.length!=0)
             for ( var i=0; i < document.forms[0].selectedApp.length; i++ ){
             document.forms[0].selectedApp[i].checked=true;
        }
    }
    else{
	    obj.value="ȫ  ѡ"
	    if(document.forms[0].selectedApp.value!="")
                document.forms[0].selectedApp.checked=false;
        if(document.forms[0].selectedApp.length!=0)
             for ( var i=0; i < document.forms[0].selectedApp.length; i++ )
	             document.forms[0].selectedApp[i].checked=false;
    }
  }
    else{
        alert("�Բ���û�п�ѡ����.");
    }
}

function dosubmit(theUrl,type){ 
  var errMsg = "";
    var isSub = false; 
    <logic:equal name="post_id" value="P0104">
     var casekind=document.forms[0].case_kind.value;
    if(casekind==""){
         errMsg="��ѡ��������";  
     }
     if(document.forms[0].cast_type.value=="2"){  
      
      if(document.forms[0].app_state_cd.value==""&&(casekind=='N' || casekind=='A')){  
       errMsg="��ѡ����״̬";
      } 
       
     }
      
    </logic:equal>
     <logic:equal name="post_id" value="P0103">
    if(document.forms[0].cast_type.value=="2"){  
      
      if(document.forms[0].app_state_cd.value==""){  
       errMsg="��ѡ����״̬";
      } 
     }
       </logic:equal>
    
        if(type=='shenpi'){
    
            errMsg = CheckBoxMustChecked(document.forms[0]);
         if(errMsg==''){
         isSub = true; 
         }
    }
    if (type=='all'){
       if(confirm("��ȷ��Ҫȫ�����в�����")){
          isSub = true; 
       }
    }    
    if (type=='chaxun')
    {   
         _Date1 = document.forms[0].case_date_start_disp.value;
         _Date2 = document.forms[0].case_date_end_disp.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	
    isSub=true;   
    }
    if(type=='create'){ isSub=true; }
    if(isSub && errMsg=='')
    {
    	if(type=='create'){
            waitfor('waitfor');
            }
        document.forms[0].action=theUrl;
        if(jQuery('#form0').validateAll()){
	          document.forms[0].submit()
	         }
        if(type=='create'){
            delwaitfor('waitfor');
            }
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
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
function dosubmit2(theUrl){
  document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</script>
<script>
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/blue/b_checknot.png />ȫ��");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/blue/b_checkall.png />ȫѡ");
	  });
});

function change_lineColor(){
	var app_numBack = '<%=request.getAttribute("app_numBack")%>';
	var app_nums = '<%=request.getAttribute("application_nums")%>';
	var app_num = app_nums.split(',');
	if(app_numBack != '' && app_num.length > 0){
		var tb = document.getElementById("table_name");
		for(j=0;j<app_num.length;j++){
			if(app_num[j] == app_numBack){
				tb.rows[j+1].style.background='#FFF2C7';
				}
			}
		} 
}
</script>

</style>
</head>
<body class="mainbg" onload="change_lineColor();">
<script type="text/javascript" src="../../js/calendar.js"></script>
<html:form action="/case/getbath_case_list.do" method="post" styleId="form0">
<html:hidden property="post_id"/>
<input type="hidden" name="batchtype" value="batch"/>
<input type="hidden" name="taskkey" value="<%=(String)request.getAttribute("taskkey") %>"/>
<input type="hidden" name="backurl" value="<%=request.getContextPath()%>/report/case/getbath_case_list.do?batchtype=batch&post_id=<bean:write name="post_id"/>"/>
<input type="hidden" name="title" value="����"/>
<input type="hidden" name="checkbackurl" value="report/case/getbath_case_list.do"/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	<logic:equal name="post_id" value="P0104">
	  <span><%=com.ist.util.Constans.CASE_NAME %>���� - ��������</span>
	  <span class="buttons">
	    <a id="hdd_display" class="bt_hidden"></a>
	    <!-- <a href="t07_flow_list2.htm"><img src="../../images/blue/b_approve.png" />��׼</a> -->
	    <a href="#" id="checkall"><img src="../../images/blue/b_checkall.png" />ȫ  ѡ</a>
	
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?status=2&oper_id=B01041','shenpi')"><img src="../../images/blue/b_approve.png" />����</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?type=all','all')"><img src="../../images/blue/b_approve.png" />ȫ������</a>
	    <logic:equal name="post_id" value="P0104">
	    <logic:equal value="1" name="is_report">
	        <logic:empty name="backstr">
	   
	        <a href="#" onclick="dosubmit('bathMakeReportDo.do','create')"><img src="../../images/blue/b_approve.png" />���ɱ���</a>

	        </logic:empty>
	   </logic:equal>
	    </logic:equal>
	  </span>
	 </logic:equal>
	 <logic:equal name="post_id" value="P0304">
	  <span><%=com.ist.util.Constans.CASE_NAME %>���� - ��������</span>
	  <span class="buttons">
	    <a id="hdd_display" class="bt_hidden"></a>
	    <!-- <a href="t07_flow_list2.htm"><img src="../../images/blue/b_approve.png" />��׼</a> -->
	    <a href="#" id="checkall"><img src="../../images/blue/b_checkall.png" />ȫ  ѡ</a>
	
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?status=2&oper_id=B01041','shenpi')"><img src="../../images/blue/b_approve.png" />����</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?type=all','all')"><img src="../../images/blue/b_approve.png" />ȫ������</a>
	    <logic:equal name="post_id" value="P0104">
	     <a href="#" onclick="dosubmit('bathMakeReportDo.do','create')"><img src="../../images/blue/b_approve.png" />���ɱ���</a>
	    </logic:equal>
	  </span>
	 </logic:equal>
	 <logic:equal name="post_id" value="P0103">
	  <span><%=com.ist.util.Constans.CASE_NAME %>���� - �������</span>
	  <span class="buttons">
	   <a id="hdd_display" class="bt_hidden"></a>

	    <a href="#" id="checkall"><img src="../../images/blue/b_checkall.png" />ȫ  ѡ</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?','shenpi')"><img src="../../images/blue/b_approve.png" />���</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?type=all','all')"><img src="../../images/blue/b_approve.png" />ȫ�����</a>
	  </span>
	 </logic:equal>
	  <logic:equal name="post_id" value="P0303">
	  <span><%=com.ist.util.Constans.CASE_NAME %>���� - �������</span>
	  <span class="buttons">
	   <a id="hdd_display" class="bt_hidden"></a>

	    <a href="#" id="checkall"><img src="../../images/blue/b_checkall.png" />ȫ  ѡ</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?','shenpi')"><img src="../../images/blue/b_approve.png" />���</a>
        <a href="#" onclick="dosubmit('bathmodifyT07_appsatusDo.do?type=all','all')"><img src="../../images/blue/b_approve.png" />ȫ�����</a>
	  </span>
	 </logic:equal>
	 
	</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									�������ڣ�
								</td>
								<td>
									<html:text property="case_date_start_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" /> --
	                                <html:text property="case_date_end_disp" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg" />	
								</td>
								<td><%=com.ist.util.Constans.CASE_NAME%>���ͣ�</td>
								<td>
									<html:select property="cast_type">
										<html:options collection="casetypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									���ͻ����ţ�
								</td>
								<td>
									<html:text property="curr_org" size="7" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������" />
									<html:text property="curr_org_disp" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=curr_org&input_name_disp=curr_org_disp','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
								
								</td>
								<td>
									�ͻ��ţ�
								</td>
								<td>
									<html:text property="party_id" size="10" maxlength="30" require="false" datatype="safeString|limit_max" max="32" msg="������Ϸ����û�id|���ܳ���32���ַ�" />
									<html:text property="party_name" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
								</td>
							</tr>
							<tr>
						    	<td>
									���֣�
								</td>
								<td>
									<html:select property="curr_cd">
										<html:options collection="curr_cdMap" property="label"
											labelProperty="value" />
									</html:select> (��ѯ���ʱ�˴�ѡ�����)
								</td>
								<td>
								    �������ʣ�
								</td>
								<td>
								    <html:select property="date_status_cd">
										<html:options collection="date_status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
						    	<td>
									����״̬��
								</td>
								<td>
									<html:select property="app_state_cd">
										<html:options collection="stateMap" property="label"
											labelProperty="value" />
									</html:select>  <logic:equal name="post_id" value="P0103">(��ѯ�˻ذ���ʱѡ�����˻�)</logic:equal>
								</td>
								
								<td>
								<logic:equal value="1" name="is_white">
								    �Ƿ��������
								    </logic:equal>
								</td>
								<td> 
								<logic:equal value="1" name="is_white">
								    <html:select property="is_menu">
										<html:options collection="is_menuMap" property="label" labelProperty="value" />
									</html:select>
								 </logic:equal>
								</td>
								
							</tr>
							 <tr>
						   	    <td>
								���ɳ̶ȣ�
								</td>
								<td>
									<html:select property="case_level">
										<html:options collection="ssdgMap" property="label" labelProperty="value" />
									</html:select>
								</td>
								<logic:equal name="post_id" value="P0104">
								<td>
						   	      
								�������ࣺ
								
								</td>
								<td> 
									<html:select property="case_kind">
										<html:options collection="casecagetoryMap" property="label" labelProperty="value" />
									</html:select>
									 
								</td> 
								</logic:equal>
								<logic:notEqual name="post_id" value="P0104">
								
								<logic:equal value="1" name="experi">
								<td>
									������Դ��
								</td>
								<td>
								 <html:select property="case_source">
										<html:options collection="sourceMap" property="label" labelProperty="value" />
									</html:select>
								
									<input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/getbath_case_list.do?batchtype=batch&newsearchflag=1&post_id=<bean:write name="post_id"/>','chaxun')" />
								</td>
								</logic:equal>
								<logic:equal value="0" name="experi">
									<td></td>
									<td>
										<input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/getbath_case_list.do?batchtype=batch&newsearchflag=1&post_id=<bean:write name="post_id"/>','chaxun')" />
									</td>
								</logic:equal>
								</logic:notEqual>
							</tr>
						
						  <logic:equal name="post_id" value="P0104">
						    <tr>
						    	<td></td><td></td>
						   	   <logic:equal value="1" name="experi">
								<td>
									������Դ��
								</td>
								<td>
								 <html:select property="case_source">
										<html:options collection="sourceMap" property="label" labelProperty="value" />
									</html:select>
								
									<input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/getbath_case_list.do?batchtype=batch&newsearchflag=1&post_id=<bean:write name="post_id"/>','chaxun')" />
								</td>
								</logic:equal>
						   	    
						   	    <logic:equal value="0" name="experi">
						   	    
								
								<td>
								
								</td>
								<td> 
								
									<input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/case/getbath_case_list.do?batchtype=batch&newsearchflag=1&post_id=<bean:write name="post_id"/>','chaxun')" />
								    
								</td>
								</logic:equal>
								
							</tr>
							</logic:equal>
						</table>
					</div>
				</div>
				<html:errors/>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0" id="table_name">
						<tr>	
							<th>
								ѡ��
							</th>
							<th><%=com.ist.util.Constans.CASE_NAME%>���
							</th><%--
							<th>
								����
							</th>
							--%><th>
								��������
							</th>
							<!--<th>
								�ͻ���
							</th>
							--><th>
								��������
							</th>
							<th>
								״̬
							</th>
							<th>
								����
							</th>
							<th>
								���ͻ���
							</th>
							<th>
								��������
							</th>
							<th>
								��������
							</th>
							<logic:equal name="t07_post_operatorActionForm"  property="cast_type" value="2">
							<th>���ɳ̶�</th>
							</logic:equal>
						</tr>
					    <logic:present name="t07_flowList">
							<logic:iterate id="flow" name="t07_flowList" type="com.ist.aml.report.dto.CreditTask">
								<tr>
									<%
										java.util.HashMap map = new java.util.HashMap();
													map.put("application_num", flow.getApplication_num());
													map.put("case_kind", flow.getCase_kind());
													pageContext.setAttribute("map", map,
															PageContext.PAGE_SCOPE);
									%>
									<td>
										<html:multibox property="selectedApp">
								            <bean:write name="flow" property="application_num"/>
								        </html:multibox>
									</td>
									<td>
									<a href="#" onclick="dosubmit2('<%=request.getContextPath() %>/report/case/t07_flow_workbench.do?application_num=<bean:write name="flow" property="application_num" />')">
											<bean:write name="flow" property="application_num" scope="page" />
										</a>
									 
									</td><%--
									<td>
										<bean:write name="flow" property="cast_type_disp" scope="page" />
									</td>
									--%><td>
										<bean:write name="flow" property="case_kind_disp" scope="page" />
									</td>
									<!--<td>
										<bean:write name="flow" property="party_id" scope="page" />
									</td>
									--><td>
								
										<bean:write name="flow" property="case_name" scope="page" />
										
									</td>
									<td>
										<bean:write name="flow" property="app_state_cd_disp"
											scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="curr_cd_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="app_org_id" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="case_date_disp" scope="page" />
									</td>
									<td>
										<bean:write name="flow" property="date_status_cd" scope="page" />
									</td>
									<logic:equal name="t07_post_operatorActionForm"  property="cast_type" value="2">
									<td>
										<bean:write name="flow" property="alert_level_disp" scope="page" />
									</td>
									</logic:equal>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
				    <logic:present name="pageInfo">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
			</div>
		</html:form>
		<script>
			jQuery('#form0').checkFormSearch();
        </script>
	</body>
</html>
