<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.util.*"%>
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
		<meta content="mshtml 6.00.2600.0" name=generator/>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="javascript" src="../../js/uc.js"></script>
		<script language=javascript src="../../js/selectbox.js"></script>
		<script language="javascript">
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
    	<bean:size id="len" name="t07_nbs_rbifList" />;
    	<logic:equal name="len" value="0">
    		alert('û�пɴ�������ݣ�');
    		return false;
		</logic:equal>
        if(errMsg==''){
            if(confirm('�����Ҫ��ȫ�����ϲ�ѯ������<%=com.ist.util.Constans.REPORT_NAME %>�������ݰ���')){
                isSub = true;
            }
            }
        
    } if(type=='report'){
         errMsg = CheckBoxMustChecked(document.forms[0]);
         isSub = true;    
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
function pbcTypechange(){
    var index1=document.forms[0].pbc_msg_type_cd.value;
    var url="";
    if(index1=="R"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/resend_spc_list.do?pbc_msg_type_cd=R&newsearchflag=2";
    }
    if(index1=="I"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/revise_spc_list.do?pbc_msg_type_cd=I&newsearchflag=1";
    }
    if(index1=="C"){
        url='<%=request.getContextPath()%>'+"/pbcreport/report/cbh_spc_list.do?pbc_msg_type_cd=C&newsearchflag=1&flag=1";
    }
    document.forms[0].action=url;
    document.forms[0].submit();
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
	<body leftmargin="0" topmargin="0">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<html:form action="/report/resend_spc_list.do" method="post">
					<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t"><span>�����ر�<%=com.ist.util.Constans.REPORT_NAME %>
	</span>
	 <span class="buttons">
				 
					 <a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫѡ</a>
					  <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createSPacket.do?url=<%=request.getContextPath()%>/pbcreport/report/resend_spc_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&packet_type_cd=S&create_type=0&interfacekey=BS','create')" >
						 <img src="../../images/<%=session.getAttribute("style") %>/b_generatec.png" />ѡ���������ݰ�</a>
					<logic:equal value="1" name="is_allPacket">
					  <a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/make_resend_spcPacketDo.do','all')" >
						<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />ȫ���������ݰ�</a>	
					</logic:equal>
					<logic:notEqual value="1" name="is_allPacket">	 
					<a href="#" onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/createSPacket4.do?url=<%=request.getContextPath()%>/pbcreport/report/resend_spc_list.do?pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&packet_type_cd=S&create_type=1&interfacekey=BS','all')" > 
					<img src="../../images/<%=session.getAttribute("style") %>/b_generate.png" />ȫ���������ݰ�</a>	
					</logic:notEqual>	 
	 </span>
	</div>
	<!-- table content -->
	<div class="cond_c3">
	  <table border="0" cellpadding="0" cellspacing="0" width="100%">
	  	<tr >
	   		<td width="10%" colspan="1" class="in_button" >
 									 
									<input type="button" name="button1" value="���" class="input"
											onClick="dosubmit('resend_huge_list.do?newsearchflag=2&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />','change')"/>
									
									<input type="button" name="button2" value="����" class="input"
											disabled="disabled" />
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
								<tr bgcolor="ECF3FF">
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										<%=com.ist.util.Constans.REPORT_NAME %>�������ڣ�
									</td>
									<td width="36%" bgcolor="F6F9FF">
							  <html:text property="start_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
			                           <html:text property="end_time" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									
									</td>
									<td width="14%" height="22" align="right" bgcolor="ECF3FF">
										<%=com.ist.util.Constans.REPORT_NAME %>���ͣ�
									</td>
									<td width="36%" bgcolor="F6F9FF">
										<html:select property="pbc_msg_type_cd"  onchange="pbcTypechange();">
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
								<html:text property="create_org" size="10" onblur="_Onblur('create_org_name')" maxlength="20"/>
									<html:text property="create_org_name" size="15" readonly="true" />&nbsp;
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
											onclick="dosubmit('<%=request.getContextPath()%>/pbcreport/report/resend_spc_list.do?newsearchflag=1&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />','search')" />
									</td>
								</tr>

							</table>
						</div>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
         <tr>
              <td height="8"><html:errors/></td>
            </tr>
  </table>

			
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
						���ڻ�������
					</th>
					<th>
						��������
					</th>
					<th>
						�ͻ�����
					</th>
					<th>
						���ɽ����ܱ���
					</th>
					<th>
						���Ա
					</th>
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>��������
					</th>
					<logic:equal name="t07_nbs_rbifActionForm" property="pbc_msg_type_cd" value="N">
					<th>
						<%=com.ist.util.Constans.REPORT_NAME %>ʧЧ����
					</th>
					</logic:equal>
					<th>
						��������
					</th>
					<th>
						<%=com.ist.util.Constans.CASE_NAME %>���
					</th>
				
					<th>
						����Ԥ��
					</th>
				 <!--  
					<th>
						�鿴����
					</th>-->
					
				</tr>
				<logic:iterate id="t07_nbs_rbif" name="t07_nbs_rbifList" indexId="i"
					type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
					<TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
					<logic:notEqual name="reported" value="1">
						<TD height=22>
							<html:multibox property="reportkeys">
								<bean:write name="t07_nbs_rbif" property="reportkey" />
							</html:multibox>
						</TD>
						</logic:notEqual>
						<TD>
									<bean:write name="t07_nbs_rbif" property="reportkey" />
							
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="finm" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="stcr" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="cttn" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="ttnm" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="rpnm" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="rpdt_disp" />
						</TD>
						<logic:equal name="t07_nbs_rbifActionForm" property="pbc_msg_type_cd" value="N">
						<TD>
						<font color="#FF0000"><bean:write name="t07_nbs_rbif" property="invalid_dt_disp" /></font>
						</TD>
						</logic:equal>
						<TD>
							<bean:write name="t07_nbs_rbif" property="create_org_name" />
						</TD>
						<TD>
							<bean:write name="t07_nbs_rbif" property="application_num" />
						</TD>
							
						<TD>
							<a
								href="#"  onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/preview.do?reportkey=<bean:write name="t07_nbs_rbif" property="reportkey" />&pbc_msg_type_cd=<bean:write name="pbc_msg_type_cd" />&interfacekey=BS','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=yes');">
								Ԥ������ </a>
						</TD>
					
						<!-- <TD>
						<logic:equal name="t07_nbs_rbif" property="has_attach" value="1">
							<a
								href="#" onclick="window.open('<%=request.getContextPath()%>/pbcreport/report/attach.do?reportkey=<bean:write name="t07_nbs_rbif" property="reportkey" />','enter2','height=700, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
					          �鿴����</a>
						</logic:equal>	
						<logic:equal name="t07_nbs_rbif" property="has_attach" value="0">
							�޸���
							</logic:equal>
						</TD>-->
				
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
