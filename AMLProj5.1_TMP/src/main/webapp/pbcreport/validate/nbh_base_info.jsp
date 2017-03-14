<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.CreditTask"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>

		<script language="JavaScript"> 
	function getCheckBoxCheckedValue(form)
	{
	    for ( var i=0; i < form.elements.length; i++ )
	    {
	        if (( true==form.elements[i].checked) && (form.elements[i].type == 'checkbox' )) 
				return form.elements[i].value;
	    }
	    //alert(num);
	    return -1;
	};
	
function dosubmit(theUrl,type){

    var errMsg = "";
    var isSub = false;
    var form1 = document.forms[0];
    	
    if(type=='validate'){
        if(checkRadio(form1.cati_seqnos)<0){
           	errMsg = "��ѡ��";
        } else {
	        errMsg = CheckBoxCheckedSingleOne(form1);
	        if(errMsg == '') {
	        	theUrl += "&cati_seqno=";
	        	theUrl += getCheckBoxCheckedValue(form1);
	        }
        }
		isSub = true;
    }
	if(type=="add"){
	isSub = true;
	}
    if(isSub&&errMsg==''){
         document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function _Confim(url){
        document.forms[0].action=url;
        document.forms[0].submit();
   
}
function _Open(url){
   window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');  
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/validate/nbh_base_info.do" method="post">
		<div class="cond_t">
					 <input type="hidden" name="reportkey"
							value="<bean:write name="reportkey" />" />
							<input type="hidden" name="report_type" value="1" />
						<input type="hidden" name="trans_type" value="NBH" />
						<input type="hidden" name="fromcase" value="1" />	
						<%
								CreditTask credittask = (CreditTask) session
												.getAttribute("credittask");
			
										String button1Value = "";
									if(credittask!=null){
										if (credittask.getPost_id().equals("P0102")) { // �༭��
											button1Value = "1";
											}else{
											button1Value = "0";
											}
									}
											
						 %>		
						 
									
						
							<input type="hidden" name="validbackurl"
								value="<%=request.getContextPath()%>/pbcreport/validate/nbh_base_info.do" />

					</div>
			<div class="cond_t2">
				<span class="buttons"> <strong><img
							src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />�ͻ��б�</strong> </span>
			</div>
			<!-- list -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							�ͻ����
						</th>
						<th>
							�ͻ�����
						</th>
						<th>
							�ͻ�֤������
						</th>
						<th>
							�ͻ�֤������
						</th>
						<th>
							�ͻ���
						</th>
						<th>
							�ͻ�����
						</th>
						<th>
							���׷�������
						</th>
						<th>
							��֤״̬
						</th>
					</tr>
					<logic:iterate id="t07_nbh_ctif" name="t07_nbh_ctifList"
						indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbh_ctif">
						<tr>
							<td>
							<% if(button1Value.equals("1")){ %>
								<a href="#" onclick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/getValidateCustDisp.do?cati_seqno=<bean:write name="t07_nbh_ctif" property="cati_seqno" />')"><bean:write name="t07_nbh_ctif" property="cati_seqno" /></a>
							<%}else{ %>
							<bean:write name="t07_nbh_ctif" property="cati_seqno" />
							<% }%>
							</td>
							<td>

								<bean:write name="t07_nbh_ctif" property="ctnm" />
							</td>
							<td>
								<bean:write name="t07_nbh_ctif" property="citp_disp" />
							</td>
							<td>
								<bean:write name="t07_nbh_ctif" property="ctid" />
							</td>
							<td>
								<bean:write name="t07_nbh_ctif" property="csnm" />
							</td>
							<td>
								<bean:write name="t07_nbh_ctif" property="ctnt_disp" />
							</td>
							<td>
								<bean:write name="t07_nbh_ctif" property="htdt_disp" />
							</td>
							<td>
								<logic:equal name="t07_nbh_ctif" property="validate_ind"
									value="1">
									<bean:write name="t07_nbh_ctif" property="validate_ind_disp" />
								</logic:equal>
								<logic:equal name="t07_nbh_ctif" property="validate_ind"
									value="0">
									<font color="#FF0000"> <bean:write name="t07_nbh_ctif"
											property="validate_ind_disp" scope="page" /> </font>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="cond_t2">
				<span class="buttons"> <strong><img
							src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />�����б�</strong> </span>
			</div>
			<!-- list -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							�����������
						</th>
						<th>
							��������
						</th>
						<th>
							��֤״̬
						</th>
					</tr>
					<logic:iterate id="t07_nbh_htcr" name="t07_nbh_htcrList"
						indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbh_htcr">
						<tr>

							<td>
								<bean:write name="t07_nbh_htcr" property="crcd" />
							</td>
							<td>
								<bean:write name="t07_nbh_htcr" property="ttnm" />
							</td>
							<td>
								<logic:equal name="t07_nbh_htcr" property="validate_ind"
									value="1">
									<bean:write name="t07_nbh_htcr" property="validate_ind_disp" />
								</logic:equal>
								<logic:equal name="t07_nbh_htcr" property="validate_ind"
									value="0">
									<font color="#FF0000"> <bean:write name="t07_nbh_htcr"
											property="validate_ind_disp" scope="page" /> </font>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<div class="cond_t2">
				<span class="buttons"> <strong><img
							src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />�����б�</strong> </span>
			</div>
			<!-- list -->
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							�������
						</th>
						<th>
							��������
						</th>
						<th>
							���״���������
						</th>
						<th>
							��������
						</th>
						<th>
							�Է���������
						</th>
						<th>
							�ʻ�
						</th>
						<th>
							����
						</th>
						<th>
							���׽��
						</th>
						<th>
							���׶�������
						</th>
						<th>
							���׷�ʽ
						</th>
						<th>
							��֤״̬
						</th>
					</tr>
					<logic:iterate id="t07_nbh_tsdt" name="t07_nbh_tsdtList"
						indexId="i" type="com.ist.aml.pbcreport.dto.T07_nbh_tsdt">
						<tr>
							<td>
							<% if(button1Value.equals("1")){ %>
								<a href="#" onclick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/getValidateTransDisp.do?rpdi_seqno=<bean:write name="t07_nbh_tsdt" property="tsdt_seqno"/>&ticd=<bean:write name="t07_nbh_tsdt" property="ticd"/>&ctif_seqno=<bean:write name="t07_nbh_tsdt" property="cati_seqno" />')"><bean:write name="t07_nbh_tsdt" property="tsdt_seqno" /></a>
							<%}else{ %>
							<a href="#"
									onclick="_Open('<%=request.getContextPath()%>/pbcreport/report/nbh_tsdt_detail.do?reportkey=<bean:write name="t07_nbh_tsdt" property="reportkey" />&reported=<bean:write name="t07_nbh_tsdt" property="reported" />&cati_seqno=<bean:write name="t07_nbh_tsdt" property="cati_seqno" />&crcd=<bean:write name="t07_nbh_tsdt" property="crcd" />&tsdt_seqno=<bean:write name="t07_nbh_tsdt" property="tsdt_seqno" />')">
									<bean:write name="t07_nbh_tsdt" property="tsdt_seqno" /> </a>
							<% }%>
								
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="finn" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="tbnm" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="tstm_disp" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="cfin" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="ctac" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="crtp_disp" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="crat_disp" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="tcnm" />
							</td>
							<td>
								<bean:write name="t07_nbh_tsdt" property="tstp_disp" />
							</td>
							<td>
								<logic:equal name="t07_nbh_tsdt" property="validate_ind"
									value="1">
									<bean:write name="t07_nbh_tsdt" property="validate_ind_disp" />
								</logic:equal>
								<logic:equal name="t07_nbh_tsdt" property="validate_ind"
									value="0">
									<font color="#FF0000"> <bean:write name="t07_nbh_tsdt"
											property="validate_ind_disp" scope="page" /> </font>
								</logic:equal>
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<!-- list_page -->
			<div class="list_page">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</div>
		</html:form>
	</body>
</html>
