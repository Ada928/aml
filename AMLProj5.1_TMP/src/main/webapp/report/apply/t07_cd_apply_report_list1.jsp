<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<HTML>
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script type="text/javascript" src="../../js/jquery.js"></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
             <script type="text/javascript" src="../../js/calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" >
function dosubmit(theUrl,type){
	var errMsg="";
	if(type=="search"){
		_Date1 = document.forms[0].start_dt_disp.value;
        _Date2 = document.forms[0].end_dt_disp.value;  
        if(_Date1!="" && !formatDateAlert(_Date1))
           return false;       
        else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
        else if(!_isDateSpaceComplete(_Date1, _Date2))
   		errMsg += "����д��������ʼʱ�䷶Χ��";  
        else if(!_compareTwoDateForString(_Date1, _Date2) )
 			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
	}else if(type=="choose"){
		errMsg = CheckBoxMustChecked(document.forms[0]);
	}
	if(errMsg==""){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
	}else{
		alert(errMsg);
		return false;
	}
}
function _Onblur(pname){
	   var obj=eval("document.forms[0]."+pname);
	   obj.value="";
}
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form method="post" action="/apply/t07_cd_apply_modify.do">
<input type="hidden" property="msg_type" value="2"/>
       <div class="conditions" >
             <div class="cond_t" >
             	<span>���������޸�</span >
                   <span class="buttons" >
						<a href="t07_cd_apply_list.do"><img src="../../images/blue/b_back.png" />�� ��</a>
                 </span>
             </div>
             <div class="cond_c" id="searchtable">
                   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                               <td> �������ƣ�</td >
                               <td>
                               	<html:text property="ricd" size="7" onblur="_Onblur('rinm')" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������" />
									<html:text property="rinm" size="23" maxlength="30"  readonly="true" />
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=ricd&input_name_disp=rinm','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								
								</td>
                          	<td>�����������ڣ�</td >
                               <td>
							<html:text property="start_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									-
							<html:text size="12" property="end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
								</tr>
								<tr>
								<td>�������ƣ�</td>
                               <td><html:text property="reportkey" size="20" /></td >
                               <td></td>
                               <td><input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('t07_cd_apply_report_list.do?newsearchflag=1&modflag=1','search')" /></td>
                         </tr>
                   </table>
             </div>
             </div>
             <html:errors/>
             <div class="list" >
                  <table border="0" cellspacing="0" cellpadding="0" id="table_name">
						<tr>
						  <th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
				          <th>��������</th>
				          <th>���ڻ�������</th>
				          <th>���ɽ����ܱ���</th>
				          <th>������������</th>
				          </tr>
				          <logic:present name="reportList">
								<logic:iterate id="t07_report"
									name="reportList"
									type="com.ist.aml.pbcreport.dto.T07_nbs_rbif">
				          <tr>
				          	<td><html:multibox property="reportkeys"> 
				          		<bean:write name="t07_report" property="reportkey"/>
				          		</html:multibox>
				          	</td>
				          <td>
				          	<a href="#" onclick="window.open('t07_report_detail.do?flag=no&casesearchtime=1&reportkey=<bean:write name="t07_report" property="reportkey"/>','enter2','height=500,width=800,left=100,top=100,scrollbars=yes,resizable=yes');">
				          	<bean:write name="t07_report" property="reportkey" /></a>
				          </td>
				          <td><bean:write name="t07_report" property="finm"  /></td>
				          <td><bean:write name="t07_report" property="ttnm" /></td>
				          <td><bean:write name="t07_report" property="rpdt_disp" /></td>
				          
				          </tr>
				          </logic:iterate>
				          </logic:present>
				          </table>
             </div>
             <logic:present name="pageInfo">
             <div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				</logic:present>
				<table align="right">
	     	  <tr>
				<td class="in_button"  align="right">
					<input  type="button" value="ѡ��" onclick="dosubmit('t07_cd_apply_report_add.do?modflag=1','choose')"/>
					<input  type="button" value="���" onclick="dosubmit('t07_cd_apply_report_result_list.do?modflag=1','submit')"/>		
				</td>
	   			</tr>
	   			   		
	 		</table>
</html:form>
</div>
</BODY>
</HTML>
