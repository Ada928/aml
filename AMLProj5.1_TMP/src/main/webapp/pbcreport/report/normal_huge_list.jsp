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
		<meta http-equiv=Content-Type content="text/html; charset=GBK"/>
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css"/>
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script LANGUAGE="JavaScript">
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
    
		<bean:size id="len" name="t07_nbh_rbifList" />;
    	<logic:equal name="len" value="0">
    		alert('û�пɴ�������ݣ�');
    		return false;
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
    //alert(theUrl);
       if(type=='all'||type=='create'){
        waitfor('waitfor');
        }
        document.forms[0].action=theUrl;
        document.forms[0].submit();
       if(type=='all'||type=='create'){
        delwaitfor('waitfor');
        }
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function returnOpertor(theUrl,type){
    var errMsg = "";
    var isSub = false;
     if(type=='return'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg==''){
            if(confirm('��ȷ��Ҫ�˻ذ�����')){
                isSub = true;
            }
        }
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
</SCRIPT>
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
<html:form action="/report/normal_huge_list.do" method="post">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t"><span>
	�����������</span>
	 <span class="buttons">
				    <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫѡ</a>
						 <a  href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createPacket.do?create_type=0&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&interfacekey=BH&url=<%=request.getContextPath()%>/pbcreport/report/normal_huge_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />','create')" >
						 <img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />ѡ���������ݰ�</a>
                      <logic:equal value="1" name="is_allPacket">
					    <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/make_normal_hugePacketDo.do','all')" >
						<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />ȫ���������ݰ�</a>	
					  </logic:equal>
					  <logic:notEqual value="1" name="is_allPacket">
					    <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createPacket1.do?create_type=1&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&interfacekey=BH&url=<%=request.getContextPath()%>/pbcreport/report/normal_huge_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />','all')" >
						<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />ȫ���������ݰ�</a>	
					  </logic:notEqual>	
					  <logic:equal value="1" name="is_flowBH">
					  <a href="#"  onclick="returnOpertor('<%=request.getContextPath()%>/pbcreport/report/return_normal_huge_t07_report.do','return')" >
						   <img src="../../images/<%=session.getAttribute("style") %>/b_agencyinfo.png" />�˻ذ���</a> 
					  </logic:equal>	   
			</span>
	</div>
	<!-- table content -->
	<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	  	<tr >
	   		<td width="10%" colspan="1" class="in_button" >
		 			<input type="button" name="button1" value="���"  disabled="disabled"  />
		 			<input type="button" name="button2" value="����" 
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/normal_spc_list.do?newsearchflag=2','change')"/>
									
			</td>

      <td width="8%" align="center">
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
								<tr >
									<td >
										<%=com.ist.util.Constans.REPORT_NAME %>�������ڣ�
									</td>
									<td >
									   <html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
			                           <html:text property="end_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									</td>
									<td >
										<%=com.ist.util.Constans.REPORT_NAME %>���ͣ�
									</td>
									<td >
										<html:select property="pbc_msg_type_cd">
											<html:options collection="pbc_msg_type_cdMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr >
									<td align="right">
										����������
									</td>
									<td bgcolor="F6F9FF">
									<html:text property="create_org" size="10"onblur="_Onblur('create_org_name')" maxlength="20"/>
									<html:text property="create_org_name" size="15" readonly="true"/>&nbsp;
								  <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=create_org&input_name_disp=create_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
									
									</td>
									<td >
										����
									</td>
									<td >
										<html:select property="orderby">
											<html:options collection="report_sortMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:radio property="order" value="1" />
										����
										<html:radio property="order" value="2" />
										����
										<input type="button" name="button3" value="�� ѯ" class="in_button1"
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/normal_huge_list.do?newsearchflag=1','search')" />
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
             <html:errors/>
			 <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
   <tr>
				<th>
						ѡ��
					</th>
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
						������������
					</th>
				
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>ʧЧ����
					</th>
	
					<th>
						<%=com.ist.util.Constans.CASE_NAME %>���
					</th>
					<th>
						��������
					</th>
					
					<th>
						����Ԥ��
					</th>
					
				</tr>
				<logic:iterate id="t07_nbh_rbif" name="t07_nbh_rbifList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_nbh_rbif">	
					<tr>
						<TD height=22>
							<html:multibox property="reportkeys">
								<bean:write name="t07_nbh_rbif" property="reportkey" />
							</html:multibox>
						</TD>
						<TD>
								<bean:write name="t07_nbh_rbif" property="reportkey" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="rinm" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="ricd" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="rpdt_disp" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="cttn" />
						</TD>
					
						<TD>
						<font color="#FF0000"><bean:write name="t07_nbh_rbif" property="invalid_dt_disp" /></font>
						</TD>
				
						<TD>
							<bean:write name="t07_nbh_rbif" property="application_num" />
						</TD>
						<TD>
							<bean:write name="t07_nbh_rbif" property="create_org_name" />
						</TD>
					
						<TD>
							<a
								href="#" onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/preview.do?reportkey=<bean:write name="t07_nbh_rbif" property="reportkey" />&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&interfacekey=BH','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
								Ԥ������</a>
						</TD>
						
						
					</TR>
				</logic:iterate>
	 </table>
  </div>
   <div class="list_page">
   <bean:write name="pageInfo" scope="request" filter="false"/>
</div>
	</html:form>			
	</body>
</html>