<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />		
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>	
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

function dosubmit(theUrl,type){
    var errMsg = "";
    if(type=='new'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
    } 
   // else if(type=='all') {
   // 	var len =;
   // 	if(len<=0) {
    //		errMsg = "����ʧ�ܣ�û����Ӧ�Ľ��׺Ϳͻ���";
    //	}
    	//  selectAll(document.forms[0].button); 
    //}
    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
	var organkey=parent.document.getElementsByName('ficd')[0];

	var errMsg="";
	var val=0;
	
	if(getLength(document.forms[0].start_dt.value)>0||getLength(document.forms[0].end_dt.value)>0){
			val+=1 ;
	}else  if (getLength(document.forms[0].crcd.value)>0) {
        	val+=1 ; 
    }else  if (getLength(document.forms[0].ticd.value)>0) {
       		val+=1 ;  
    }else   if (getLength(document.forms[0].party_id.value)>0) {
       		val+=1 ;  
    }else   if (getLength(document.forms[0].reportkey.value)>0) {
       		val+=1 ;  
    }
	
	if(organkey.value=='')
	{	errMsg+="���ȶ�λ����!";
	}else if(val==0)
 	{
 		errMsg="����������һ����ѯ������";
 	}else if(getLength(document.forms[0].start_dt.value)>0&&getLength(document.forms[0].end_dt.value)>0){
	   	if(!_compareTwoDateForString(document.forms[0].start_dt.value, document.forms[0].end_dt.value)) {
	           document.forms[0].start_dt.focus();
		        errMsg += "������ֹ���ڿ�ʼʱ�䲻�ܴ��ڽ���ʱ��";		    
			}
   } 
		   
   
    if(errMsg!=''){
        alert(errMsg);
        return false; 
      }else
       {
       	  url+='&organkey='+organkey.value;
       	  //alert(url);
	      document.forms[0].action=url;
	      document.forms[0].submit();
      }
}
function selectAll(obj){
    if(document.forms[0].reportkeyCheckBox!=null){
		if(document.forms[0].reportkeyCheckBox.value!=""){
                document.forms[0].reportkeyCheckBox.checked=true;
    	}
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ ){
             document.forms[0].reportkeyCheckBox[i].checked=true;
        }
    }
    else{
	    if(document.forms[0].reportkeyCheckBox.value!="")
                document.forms[0].reportkeyCheckBox.checked=false;
        if(document.forms[0].reportkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].reportkeyCheckBox.length; i++ )
	             document.forms[0].reportkeyCheckBox[i].checked=false;
    }
  }

function _Open(url){
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

</script>
<style type="text/css">
<!--
.STYLE2 {color: #000000}
-->
</style> 
</head>

<body leftmargin="0" topmargin="0">
<div id="iframecontent">
<script type="text/javascript" src="../../js/calendar.js"></script>
<html:form action="/case/t07_case_app_add_de_c_page.do" method="post" >
<html:hidden property="report_type"/>
<html:hidden property="pbc_msg_type_cd"/>
<input type="hidden" name="casetype" value="1"/>
		<div class="conditions">
				<div class="cond_t">
				  <span>ѡ�����ϱ��Ľ��� </span>
				
				</div>

		<div class="cond_c">

	<table  border="0" cellpadding="0" cellspacing="0">
			<tr>
               <td>������ֹ���ڣ�</td>
               <td>
               
                   	<html:text property="start_dt" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>--
				<html:text property="end_dt" size="12" onclick="calendar.show(this);" readonly="readonly" styleClass="calimg"/>
            </td>
               <td>������룺</td>
              
               <td><html:text property="reportkey" size="23"/></td>
             </tr>
             <tr>
               <td>ҵ���ʶ�ţ�</td>
               <td><html:text property="ticd" size="20" maxlength="60"/> </td>
               <td>�ͻ��ţ�</td>
               <td>
             
               <html:text property="party_id"  size="18" maxlength="10"/>
               <html:hidden property="party_chn_name" />
               	<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
			
              </td>
             </tr>
             <tr>
               <td>���֣�</td>
               <td><html:select property="curr_cd" >
              <html:options collection="curr_cdMap"  property="label" labelProperty="value" />
              </html:select>   </td>
               <td>�ͻ����ͣ�</td>
               <td><html:select property="party_class_cd" >
              <html:options collection="party_class_cdMap"  property="label" labelProperty="value" />
              </html:select>  
            </tr>
              <tr>
               <td>�������ͣ�</td>
               <td><html:select property="crcd"  onmouseover="selMouseOver(this,$('div_hint'))" onmouseout="selMouseOut(this,$('div_hint'))">
              <html:options collection="pbcruleMap"  property="label" labelProperty="value" />
              </html:select>  </td>
                <td>����</td>
               <td><html:select property="ordername" >
              <html:options collection="orderMap"  property="label" labelProperty="value" />
              </html:select>  

                 <html:radio property="ordertype" value="" />
              ����
              <html:radio property="ordertype" value="1"/>
              ����
              <input type="button" name="ok" value="��ѯ" class="in_button1"  onclick="_Confim('<%=request.getContextPath()%>/report/case/t07_case_app_add_de_c_page.do?newsearchflag=1')" /></td>
             </tr>
         </table>
       </div>
       </div>  
       <div class="list">
       <table  border="0" cellpadding="0" cellspacing="0">
   
    <tr>
      <th>ѡ��</th>
      <th>ҵ���ʶ��</th>
      <th>�������</th>
      <th>�ͻ���</th>
      <th>��������</th>
      <th>��������</th>
      <th>��������</th>
    </tr>
    <logic:present name="t07_nbh_tsdtList">
    <logic:iterate id="search" name="t07_nbh_tsdtList" type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
			<tr  class="interval" onmouseover="this.className='interval2'" onmouseout="this.className='interval'">
				<td ><html:multibox property="reportkeyCheckBox" value="<%=search.getReportkey()+search.getCati_seqno()+search.getCrcd()+search.getTsdt_seqno() %>">
					<bean:write name="search" property="reportkey" />
				</html:multibox></td>
	  <td><a href="#" onclick="_Open('<%=request.getContextPath() %>/pbcreport/report/ibh_tsdt_detaillist.do?closeflag=1&&pbc_msg_type_cd=N&fromcase=2&reportkey=<bean:write name='search' property='reportkey' />&cati_seqno=<bean:write name='search' property='cati_seqno' />&Crcd=<bean:write name='search' property='crcd' />&tsdt_seqno=<bean:write name='search' property='tsdt_seqno' />')" >
	  <bean:write name="search" property="ticd" scope="page"/></a></td>
	  <td><bean:write name="search" property="reportkey" scope="page"/></td>	  
	  <td><bean:write name="search" property="party_id" scope="page"/></td>
	  <td><bean:write name="search" property="finc_disp" scope="page"/></td>
	  <td><bean:write name="search" property="crcd_disp" scope="page"/></td>
	  <td><bean:write name="search" property="tstm_disp" scope="page"/></td>
     </tr>  
</logic:iterate>
	  </logic:present>   
	
  </table>
  </div>
  <div class="list_page">
	   <logic:present name="pageInfo">
	  		 <bean:write name="pageInfo" scope="request" filter="false"/>
	   </logic:present>
   </div>
   <!--  <table  border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td align="right" >&nbsp; 
        <html:button property="button4" value="ȫ������" styleClass="input" onclick="dosubmit('addT07_caseErrorDeDo.do?type=all', 'all')"/>
      </td>
    </tr>
	
  </table> --> 
 </html:form>
 <!--��ʾ��--> 
	<div id="div_hint" style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 </div>
</body>
</html>