<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
	
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
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
        document.form[0].action='AlertAnalyse_List.htm';
        document.form[0].submit();
   }
  }
  function  _Opendailog(url){

  var showx = event.screenX - event.offsetX/2; // + deltaX;
    var showy = event.screenY - event.offsetY + 18; // + deltaY;
    showx = 20;
	showy = 20;
	
 var flag= window.showModalDialog(url,  "dialogWidth:500px; dialogHeight:500px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;resizable:yes;");
   if(flag=="1"){
        document.form[0].action='AlertAnalyse_List.htm';
        document.form[0].submit();
   }
  }
 function dosubmit(theUrl,type){

    var errMsg = "";
    var isSub = false;
 if(type=='create'){
    
         errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫ����ѡ��<%=com.ist.util.Constans.REPORT_NAME %>�������ݰ���')){
                isSub = true;
            }
            }
        
    }else if(type=='all'){
    	<bean:size id="len" name="t07_dbh_rbifList" />;
    	<logic:equal name="len" value="0">
    		errMsg="û�пɴ�������ݣ�";
	
		</logic:equal>
        if(errMsg==''){
            if(confirm('�����Ҫ��ȫ�����ϲ�ѯ������<%=com.ist.util.Constans.REPORT_NAME %>�������ݰ���')){
                isSub = true;
            }
            }
        
    }
     else if(type=='search'){
        _Date1 = document.forms[0].start_time.value;
    	_Date2 = document.forms[0].end_time.value;  
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
    else if(type=='change'){  
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

function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
function create_packet(theUrl){
     errMsg = CheckBoxMustChecked(document.forms[0]);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
  
}
function pbcTypechange(){
    var index1=document.forms[0].pbc_msg_type_cd.value;
    var url="";
    if(index1=="R"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/resend_huge_list.do?pbc_msg_type_cd=R&newsearchflag=1";
    }
    if(index1=="I"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/revise_huge_list.do?pbc_msg_type_cd=I&newsearchflag=1";
    }
    if(index1=="C"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/correct_huge_list.do?pbc_msg_type_cd=C&newsearchflag=1";
    }
    if(index1=="D"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/delete_huge_list.do?pbc_msg_type_cd=D&newsearchflag=1";
    }
    document.forms[0].action=url;
    document.forms[0].submit();
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
		<style type="text/css">
<!--
.style1 {color: #FF0000}
.STYLE2 {color: #000000}
-->
</style>
	</head>
	<body   class="mainbg">
	<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/report/delete_huge_list.do" method="post">
				 <input type="hidden" name="url" value="<bean:write name="url"/>"/>
				
			<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
						<span>ɾ�����<%=com.ist.util.Constans.REPORT_NAME %></span>				 
			
					<span class="buttons">	
						<a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫѡ</a>
						 <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createPacket.do?url=<%=request.getContextPath()%>/pbcreport/report/delete_huge_list.do&packet_type_cd=S&pbc_msg_type_cd=D&create_type=0&interfacekey=BH','create')"  >
						 <img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />ѡ���������ݰ�</a>		
						<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createPacket3.do?url=<%=request.getContextPath()%>/pbcreport/report/delete_huge_list.do&packet_type_cd=S&pbc_msg_type_cd=D&create_type=1&interfacekey=BH','all')"  >
						<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />ȫ���������ݰ�</a>
						</span>
					</div>
			<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
								<tr >
	   		                 <td >
										<input type="button" class="in_button1"  name="button1" value="���"  disabled="disabled"/>
									</td>
									    <td align="center">
										һ������<%=com.ist.util.Constans.REPORT_NAME %>����
									<html:select property="count">
											<html:options collection="countMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								 </tr>
		  </table>
	</div>
			<div class="cond_c">
	  <table border="0" cellpadding="0" cellspacing="0">
								<tr bgcolor="ECF3FF">
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										<%=com.ist.util.Constans.REPORT_NAME %>�������ڣ�
									</td>
									<td width="36%" bgcolor="F6F9FF">
						 <input type="text" value="" name="start_time" size="12" onclick="calendar.show(this);" readonly="true" class="calimg" /> --
                         <input type="text" value="" name="end_time" size="12" onclick="calendar.show(this);" readonly="true" class="calimg" />	
											
									</td>
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										<%=com.ist.util.Constans.REPORT_NAME %>���ͣ�
									</td>
									<td width="36%" bgcolor="F6F9FF">
										<html:select property="pbc_msg_type_cd" onchange="pbcTypechange();">
											<html:options collection="pbc_msg_type_cdMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td align="right">
										����������
									</td>
									<td bgcolor="F6F9FF">
									<html:text property="create_org" size="10"onblur="_Onblur('create_org_name')"/>
									<html:text property="create_org_name" size="15" readonly="true"/>&nbsp;
								    <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=create_org&input_name_disp=create_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
									
									</td>
									<td align="right">
										����
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="orderby">
											<html:options collection="report_sortMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:radio property="order" value="1" />
										����
										<html:radio property="order" value="2" />
										����
										<input type="button" name="button3" value="�� ѯ" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/delete_huge_list.do?newsearchflag=1','search')"/>
									</td>
								</tr>

						</table>
						</div>
				 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
				<tr align=center class="tdhead">
				<logic:notEqual name="reported" value="1">
					<th>
						ѡ��
					</th>
					</logic:notEqual>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>����
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>��������
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>�������
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>��������
					</th>
					<th>
						��ɾ���Ľ�������
					</th>
					<th>
						��������
					</th>
					
					<th>
						����Ԥ��
					</th>
				
				</tr>
				<logic:iterate id="t07_dbh_rbif" name="t07_dbh_rbifList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_dbh_rbif">
					<tr >
					<logic:notEqual name="reported" value="1">
						<td height=22>
							<html:multibox property="reportkeys">
								<bean:write name="t07_dbh_rbif" property="reportkey" />
							</html:multibox>
						</td>
						</logic:notEqual>
						<td>
									<bean:write name="t07_dbh_rbif" property="reportkey" />
							
						</td>
						<td>
							<bean:write name="t07_dbh_rbif" property="rinm" />
						</td>
						<td>
							<bean:write name="t07_dbh_rbif" property="ricd" />
						</td>
						<td>
							<bean:write name="t07_dbh_rbif" property="drdt_disp" />
						</td>
						<td>
							<bean:write name="t07_dbh_rbif" property="dttn" />
						</td>
						<td>
							<bean:write name="t07_dbh_rbif" property="create_org_name" />
						</td>
					
						<td>
							<a
								href="#" onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/preview.do?reportkey=<bean:write name="t07_dbh_rbif" property="reportkey" />&pbc_msg_type_cd=D&interfacekey=BH','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
								Ԥ������<bean:write name="t07_dbh_rbif" property="reportkey" /> </a>
						</td>
						
					</tr>
				</logic:iterate>
			 </table>
  </div>
   <div class="list_page">
   <bean:write name="pageInfo" scope="request" filter="false"/>
</div>
	</html:form>			
	</body>
</html>