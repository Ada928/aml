<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
<script language="JavaScript">
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}  
    function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
       _Date1 = document.forms[0].start_dt.value;
    	_Date2 = document.forms[0].end_dt.value;  
    if(type=='search'){
        if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;
	     else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	
  		  isSub = true;	
	 }    
      if(type=='del'){
          errMsg = CheckBoxMustChecked(document.forms[0]);
	        if(errMsg==''){
	            if(confirm('�����Ҫɾ����')){
	                isSub = true;
	            }
	        }
    }else if(type=='add'){
       isSub=true;
    }else if(type=='report'){
       isSub=true;
    }
    if(errMsg==''&&isSub){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
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
 function  _Onclick(theUrl){

        document.forms[0].action=theUrl;
        document.forms[0].submit();
 }
 
</script>
	</head>
<body class="mainbg">
<html:form action="/t07_supervise_msg/t07_supervise_msg_list.do" method="post">
<input type="hidden" name="backurl" value="<bean:write name="backurl"/>"/>
<input type="hidden" name="msg_mode" value="<bean:write name="msg_mode"/>"/>
<html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>������Ϣ�б�</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	   <logic:present name="msg_mode">
	    <logic:equal value="1" name="msg_mode">
	  <a href="#" onclick="dosubmit('t07_supervise_msg_add.do?msg_mode=1','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />���𶽰�</a>
	   <a href="#" onclick="dosubmit('t07_supervise_msg_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
	    <a href="#" onclick="dosubmit('t07_supervise_msg_list_export.do','report')"><img src="../../images/<%=session.getAttribute("style") %>/b_export.png" />���쵼��</a>
	 </logic:equal>
	 </logic:present>
	  </span>
	</div>
 <!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td>��������:</td>
         <td><html:select property="msg_type_s">
				<html:options collection="msg_typeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
        <td>�������ڣ�</td>
          <td >
           <html:text property="start_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
               ---
           <html:text property="end_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
        
        
          </td>
        </tr>
	    <tr>
			<td>���ջ�����</td>
			<td> 
			<html:text property="receipt_org_s" size="9" maxlength="50"/>
			<html:text property="msg_org_name_s"  readonly="true"/>
		     <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=receipt_org_s&input_name_disp=msg_org_name_s','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
		    </td>

		    <td>������⣺</td>
		    <td>
		     <html:text property="msg_name_s" size="40" maxlength="80"/>

	         </td>
			</tr>
			 <tr>
	       <td>��������:</td>
         <td>
         <html:select property="case_type_s1" >
				<html:options collection="casetypeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
		   <td>�ͻ����ͣ�</td>
          <td >
           <html:select property="party_class_cd_s" >
				<html:options collection="clienttypeMap" property="label"
			      labelProperty="value" />
				</html:select>
				
				
		    <input type="button" name="ok" class="in_button1" value="�� ѯ" onclick="dosubmit('t07_supervise_msg_list.do?newsearchflag=1','search')" />
				
          </td>
        </tr>
								
	  </table>
	</div>
  </div>	
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	  <logic:equal name="msg_mode" value="1">
	  	<th>ѡ��</th>
	  	</logic:equal>
		<th>�������</th>
		<th>�������</th>
		<th>���ջ���</th>
		<th>��������</th>
		<th>��������</th>
		<th>�ͻ�����</th>
		<th>״̬</th>
		<th>����ʱ��</th>
	  </tr> 
  <logic:iterate id="t07_supervise_msg" indexId="i" name="t07_supervise_msgList" type="com.ist.aml.information.dto.T07_Supervise_msg">

    <tr>
        
        <logic:equal name="msg_mode" value="1">
        <td >
			<html:multibox property="msg_ids">
			  <bean:write name="t07_supervise_msg" property="msg_id" />
			</html:multibox>
			</td>
			</logic:equal>
		
      <td> 
        <logic:equal name="msg_mode" value="1">
      <a href="#" onclick="_Onclick('t07_supervise_msg_detail.do?msg_mode=<bean:write name="msg_mode"/>&msg_id=<bean:write name="t07_supervise_msg" property="msg_id" />')">
      <bean:write name="t07_supervise_msg" property="msg_name"/>
      </a>
      </logic:equal>
        <logic:equal name="msg_mode" value="2">
      <a href="#" onclick="_Onclick('t07_supervise_msg_disp.do?msg_mode=<bean:write name="msg_mode"/>&msg_id=<bean:write name="t07_supervise_msg" property="msg_id" />')">
      <bean:write name="t07_supervise_msg" property="msg_name"/>
      </a>
      </logic:equal>
     </td>
     <td><bean:write name="t07_supervise_msg" property="msg_org_name"/></td>  
      <td><bean:write name="t07_supervise_msg" property="receipt_org"/></td>  
      <td><bean:write name="t07_supervise_msg" property="msg_type"/></td>
      <td><bean:write name="t07_supervise_msg" property="case_type_s"/></td>
     <td><bean:write name="t07_supervise_msg" property="party_class_cd_s"/></td> 
       <td><bean:write name="t07_supervise_msg" property="msg_state_disp"/></td>
       <td><bean:write name="t07_supervise_msg" property="create_dt"/></td>  
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
</body>
</html>
