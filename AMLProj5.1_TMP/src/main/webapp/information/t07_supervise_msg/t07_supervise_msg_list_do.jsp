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
<% String type=(String)request.getAttribute("type");
  if(type==null){
    type="";
  } %>
<script language="JavaScript">

    function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
       if(document.forms[0].msg_type.value==""){
          alert("��ѡ�񶽰����ͣ�");
          return false;
       }
        _Date1 = document.forms[0].start_dt.value;
    	_Date2 = document.forms[0].end_dt.value;  
        if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;
	     else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	 
      }
       if(type=='modi'){
           if(checkRadio(document.forms[0])=="-1"){
           errMsg+="��ѡ��";
           }else{
           isSub=true;
           }
        
    }
      
    if(type=='del'){
       errMsg = CheckBoxMustChecked(document.forms[0]);
           if(errMsg==''){
            if(confirm('�����Ҫɾ����')){
                isSub = true;
               }
           }
        
    }else if(type=='search' || type=='add'|| type=='export'){
       isSub=true;
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
function _Click(para){
   document.forms[0].content.value=para;
}
function _Change(){
var type=document.forms[0].msg_type.value;

 if(type=="7"){
  document.all.caseid.style.display="";
   document.all.post_id_n.style.display="";
  document.all.post_id_v.style.display="";
  document.all.record.style.display="none";
  document.all.record1.style.display="none";
}else{
     document.all.post_id_n.style.display="none";
    document.all.post_id_v.style.display="none";
   if(type=="13" || type=="1"){
       document.all.caseid.style.display="none";
       document.all.record.style.display="none";
       document.all.record1.style.display="none";
   }else{
   document.all.caseid.style.display="none";
   document.all.record.style.display="";
   document.all.record1.style.display="";
   }

}


}    
</script>
	</head>
<body class="mainbg">
<html:form   action="/t07_supervise_msg/t07_supervise_msg_list_do.do" method="post">
<input type="hidden" name="content"/>
<input type="hidden" name="backurl" value="t07_supervise_msg_list_do.do"/>
<html:errors/>
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>������Ϣ�б�</span>
	  <span class="buttons">
	   <a href="#" id="hdd_display" class="bt_hidden"></a>
	  <a onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
	  <a href="#" onclick="dosubmit('t07_supervise_msg_add.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />���𶽰�</a>
	  <!-- add by shichao -->
	  <a href="#" onclick="dosubmit('t07_supervise_msg_list_export_do.do','export')"><img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />����Excel</a>
	  
	  </span>
	</div>
 <!-- table content -->
	<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
         <td><font color="red">*</font>��������: </td>
         <td><html:select property="msg_type" onchange="_Change()">
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
   
		 <tr id="caseid" style="display:none">
         <td>����: </td>
         <td><html:select property="case_type_s">
				<html:options collection="casetypeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
        <td>ʧЧ���ڣ�</td>
          <td >
        
            <html:text property="start_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
               ---
           <html:text property="end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
           
          </td>
        </tr>
	
	    <tr>
			<td>������</td>
			<td> <html:text property="receipt_org_s" size="9" readonly="true"/>
			<html:text property="msg_org_name" readonly="true"></html:text>
		     <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=receipt_org_s&input_name_disp=msg_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
		    </td>
            <td>�ͻ����ͣ�</td>
          <td >
           <html:select property="party_class_cd_s" >
				<html:options collection="clienttypeMap" property="label"
			      labelProperty="value" />
				</html:select>
          </td>
		 </tr>
			
	     <tr>
         <td><div id="record">��������: </div> <div id="post_id_n"> ��λ: </div></td>
          <td><div id="record1"><html:select property="case_type_s1" >
				<html:options collection="casetypeMap" property="label"
			      labelProperty="value" />
				</html:select></div>
				 <div id="post_id_v"><html:select property="post_id" >
				<html:options collection="postMap" property="label"
			      labelProperty="value" />
				</html:select></div>
				
				</td>
	        
             <td >
             
             </td>        
		    <td>
		  <input type="button" name="ok" class="in_button1" value="�� ѯ" onclick="dosubmit('t07_supervise_msg_list_do.do?newsearchflag=1','search')" />
		    
	         </td>       
        </tr>
								
	  </table>
	</div>
  </div>	
 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<th>ѡ��</th>
		<th>����</th>
		<th>��������</th>
		<logic:equal name="type"  value="2">
		<th>��������</th>	
	    </logic:equal>
	  <logic:notEqual name="type"  value="1">
        <logic:notEqual name="type"  value="13">
          <th>��������</th>
        </logic:notEqual>
     </logic:notEqual>
      <th>�ͻ�����</th>	
		<logic:equal name="type"  value="7">
		<th>��λ</th>
		<th>ʧЧʱ��</th>
		</logic:equal>
		<th>�貹¼</th>
		<th>�Ѳ�¼</th>
		<th>δ��¼</th>
	  </tr>   
  <logic:iterate id="t07_supervise_msg" indexId="i" name="t07_supervise_msgList" type="com.ist.aml.information.dto.T07_Supervise_msg">

    <tr>
      <td> 
      <input type="radio" name="msgid"  onclick="_Click('<bean:write name='t07_supervise_msg' property="msg_content" />')"/>
      </td>
      <td> 
      <bean:write name="t07_supervise_msg" property="msg_org_name"/>
     </td>
     <td><bean:write name="t07_supervise_msg" property="create_dt_disp"/></td>
     <logic:equal name="type"  value="2">
		<td><bean:write name="t07_supervise_msg" property="tx_dt_disp"/></td>
	    </logic:equal>
     <logic:notEqual name="type"  value="1">
       <logic:notEqual name="type"  value="13">
         <td><bean:write name="t07_supervise_msg" property="case_type_s"/></td> 
       </logic:notEqual>
     </logic:notEqual>
      <td><bean:write name="t07_supervise_msg" property="party_class_cd_s"/></td> 	
     <logic:equal name="type"  value="7">
       <td><bean:write name="t07_supervise_msg" property="post_id"/></td>
        <td><bean:write name="t07_supervise_msg" property="validate_dt_disp"/></td>
        </logic:equal>
       <td><bean:write name="t07_supervise_msg" property="total_num"/></td>  
        <td><bean:write name="t07_supervise_msg" property="oper_num"/></td>
       <td><bean:write name="t07_supervise_msg" property="nooper_num"/></td>
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
<script language="JavaScript">
var type=document.forms[0].msg_type.value;
 if(type=="7"){
  document.all.caseid.style.display="";
  document.all.post_id_n.style.display="";
  document.all.post_id_v.style.display="";
  document.all.record.style.display="none";
  document.all.record1.style.display="none";
}else{
    document.all.post_id_n.style.display="none";
    document.all.post_id_v.style.display="none";
   if(type=="13"|| type=="1"){
       document.all.caseid.style.display="none";
       document.all.record.style.display="none";
       document.all.record1.style.display="none";
   }else{
   document.all.caseid.style.display="none";
   document.all.record.style.display="";
   document.all.record1.style.display="";
   }
}
</script>
</html:form>
</body>
</html>