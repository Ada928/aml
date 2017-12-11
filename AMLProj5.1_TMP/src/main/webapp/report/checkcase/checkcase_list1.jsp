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
<script language="JavaScript" src="../../js/jquery.validator.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg = "";
   
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
</script>
</head>
<body  class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
<html:form action="/checkcase/checkcase_list1.do" method="post" styleId="form0">
  <html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�������� - ���ɰ���Э���б�</span>
	  <span class="buttons"><a id="hdd_display" class="bt_hidden"></a>&nbsp;</span>
	</div>
	<!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>����Э�����ڣ�</td>
         <td>
         <html:text property="req_time_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
         </td>
         <td>������ţ�</td>
         <td>
            <html:text property="application_num_s" require="false" datatype="safeString|limit_max" max="64" msg="������Ϸ��İ������|���ܳ���64���ַ�" />
         </td>
       </tr>
       <tr>
         <td>����Э�������</td>
         <td>
         <html:text property="req_organkey" size="7" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������"/>
         <html:text property="req_orgname" size="23" maxlength="30"  readonly="true" />
           
            <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=req_organkey&input_name_disp=req_orgname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
         </td>
         <td>״̬��</td>
         <td>
         	  <html:select property="status" >
                      <html:options collection="statusMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>
						&nbsp;&nbsp; 
						<input type="button" name="Button3"  value="�� ѯ" class="in_button1"   onclick="dosubmit('checkcase_list1.do?newsearchflag=1')" /></td>
					
       </tr>
	  </table>
	</div>
  </div>
<!-- list --> 
  <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
			<th>�������</th>
			<th>�������</th>
			<th>����ʱ��</th>
			<th>Э��ԭ��</th>
			<th>Э�����</th>
			<th>Э���û�</th>
			<th>Э�鱨��</th>
			<!-- <th>Э�����ʱ��</th> -->
			<th>Э��״̬</th>
	  </tr>
<logic:iterate id="assit" name="t07_case_AssistList" type="com.ist.aml.report.dto.T07_case_Assist">
 	<%
								java.util.HashMap map1 = new java.util.HashMap();
								map1.put("application_num", assit.getApplication_num());
							    map1.put("assitno", assit.getAssitno());
								pageContext.setAttribute("map", map1,
										PageContext.PAGE_SCOPE);
						%>
    <tr >
    
      <td>
      <html:link name="map" page="/checkcase/updateT07_case_Assis.do">
      <bean:write name="assit" property="application_num" scope="page"/>
     </html:link>
     </td>
      <td><bean:write name="assit" property="req_orgname" scope="page"/></td>
      <td><bean:write name="assit" property="req_time_disp" scope="page"/></td>
      	<td style="white-space:normal;"> <bean:write name="assit" property="reasons" scope="page"/></td>
      <td><bean:write name="assit" property="deal_orgname" scope="page"/></td>
      <td><bean:write name="assit" property="deal_username" scope="page"/></td>
       	<td style="white-space:normal;"> <bean:write name="assit" property="handlereport" scope="page"/></td>
     <!--   <td><bean:write name="assit" property="deal_time_disp" scope="page"/></td> -->
        <td><bean:write name="assit" property="status_disp" scope="page"/></td>
    </tr>
</logic:iterate>
   </table>
  </div>
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
	<script>
		jQuery('#form0').checkFormSearch();
    </script>
</body>
</html>
