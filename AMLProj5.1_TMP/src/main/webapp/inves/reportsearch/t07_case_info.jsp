<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.LinkedHashMap"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.lang.String"%>
<%@ page import="java.lang.Double"%>
<%@page import="com.ist.aml.report.dto.T07_case_stcr"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
		String cssurl=url+"/css/aml_"+session.getAttribute("style")+".css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
			String ucjsurl = url + "/js/uc.js";
		%>
		<!-- <link rel="stylesheet" href=<%=cssurl%> type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=ucjsurl%>></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _Open(url){
 
   window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}

function Open(url){
   var iframe1 = document.getElementById('down');
   iframe1.src = url;
  // window.open(url,'','height=500, width=900,left=100,top=100,scrollbars=yes,resizable=yes');
  //window.open(url);
      
}
var flag = -1;
</script>
	</head>
	<body id="iframecontent">
			<html:form method="post" action="/case/caseInfo.do">
			<input type="hidden" name="case_type" value="<bean:write  property="cast_type" name="t07_case_application" />"/>
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>�������: <bean:write
								property="application_num" name="t07_case_application" /> </span>
						<span class="buttons"> 
						<logic:equal value="2" name="t07_case_application" property="cast_type">
						<a href='#' onClick="window.open('<%=request.getContextPath() %>/mfa/mfa_issue/MFA.html?isSave=<%=(String)request.getAttribute("isSave") %>&net_id=<bean:write
								property="application_num" name="t07_case_application" />&isHistory=<bean:write
								property="casesearchtime" name="t07_case_application" />','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><img src="../../images/blue/case02.gif" />�ʽ�����</a>
						</logic:equal>
						</span>
					</div>
						<div class="cond_c2">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										�������ࣺ
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="case_kind_disp" />
									</td>
									<td>�������ͣ�
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="cast_type_disp" />
									</td>
								</tr>
								<tr>
									<td>����״̬��
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="app_state_cd_s" />
									</td>
									<td>
										����������
									</td>
									<td>
										<bean:write name="t07_case_application" property="app_org_id" />(<bean:write property="app_org_name" name="t07_case_application" />)
									</td>
								</tr>
								<tr>
									<td>
										ɸѡ���ڣ�
									</td>
									<td>
										<bean:write property="app_dt_disp" name="t07_case_application" />
									</td>
									<td>
										�������ڣ�
									</td>
									<td>
										<bean:write property="case_date_disp"
											name="t07_case_application" />
									</td>
									
								</tr>
									<tr>
									<td>
										��������
									</td>
									<td>
										<bean:write property="tran_count" name="t07_case_application" />
									</td>
									<td>
										���׽�
									</td>
									<td>
										<bean:write property="trans_amt"
											name="t07_case_application" />
									</td>
									
								</tr>
								<logic:equal property="cast_type" name="t07_case_application" value="2">
									<tr>
										<td>
											���ɳ̶ȣ�
										</td>
										<td>
											<bean:write property="alert_level_disp" name="t07_case_application" />
										</td>
										<td>
											��ȡ��ʩ��
										</td>
										<td>
											
											    <bean:write property="take_action" name="t07_case_application" />
											
										</td>
									</tr>
									<tr>
										<td>
											������Ϊ������
										</td>
										<td colspan="3" style="white-space:normal;">
										
											    <bean:write property="action_descrip" name="t07_case_application" />
											
										</td>
									</tr>
									<tr>
										<td>�������������
										</td>
										<!-- <td bgcolor="F6F9FF" colspan="3"><bean:write property="reason" name="t07_case_application" /></td> -->
										<td>
											<img src="../../images/<%=session.getAttribute("style") %>/b_addreport.png" />
											<a href="<%=request.getContextPath()%>/report/case/case_advice_more.do?application_num=<bean:write property="application_num"  name="t07_case_application" />&cast_type=<bean:write  property="cast_type" name="t07_case_application" />&casesearchtime=<%=(String)request.getAttribute("casesearchtime") %>" 
												target="_blank">�鿴</a>
										</td>
										<td>
											�������ʣ�
										</td>
										<td>
											<bean:write property="date_status_cd" name="t07_case_application" />
										</td>
									</tr>
								</logic:equal>
							<logic:notEmpty name="caseModuleList">
							<tr>
								<td>
								   ��������������
								</td>
								<td colspan="3"> 
								  <logic:iterate id="module" name="caseModuleList">
								  	<logic:equal name="module" value="1" property="alerttype">
										Υ��ģ��:<bean:write name="module" property="module_name"/>�ķ�ֵ:<bean:write name="module" property="sumscore"/>
								  	</logic:equal>
								  	<logic:equal name="module" value="2" property="alerttype">
										Υ��ģ��<bean:write name="module" property="module_name"/>�ؼ�����
								  	</logic:equal>
								  	<logic:equal name="module" value="3" property="alerttype">
										Υ������������,�����ܽ��Ϊ<bean:write name="module" property="trans_amt"/>,���״���<bean:write name="module" property="trans_count"/>
								  	</logic:equal>
								  	</br>
								  </logic:iterate>
								</td>
							</tr>
							</logic:notEmpty>
							</table>
						</div>
				</div>
					<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
						 
							<th>
								�ļ�����
							</th>
							<th>
								�ϴ�����
							</th>
							<th>
								�ϴ���
							</th>
						</tr>
						<logic:iterate id="attach" name="t07_alert_attachList"
							type="com.ist.aml.report.dto.T07_alert_attach">
							<tr>
								 
								<td>
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/download_attach.jsp?url=<%=java.net.URLEncoder.encode(attach.getAttach_name())%>','','height=160, width=300,left=100,top=100');">
										<bean:write name="attach" property="attach_realname" scope="page" />
								    </a>
								</td>
								<td>
									<bean:write name="attach" property="load_date_disp" scope="page" />
								</td>
								<td>
									<bean:write name="attach" property="load_user" scope="page" />
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
			 
			</html:form>
	</body>
</html>