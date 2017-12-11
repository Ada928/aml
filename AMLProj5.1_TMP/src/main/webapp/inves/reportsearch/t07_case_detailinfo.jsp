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
		<script type="text/javascript">
function nTabs(thisObj,Num){
if(thisObj.className == "active")return;
var tabObj = thisObj.parentNode.id;
var tabList = document.getElementById(tabObj).getElementsByTagName("li");
for(i=0; i <tabList.length; i++)
{
if (i == Num)
{
   thisObj.className = "active"; 
      document.getElementById(tabObj+"_Content"+i).style.display = "block";
}else{
   tabList[i].className = "normal"; 
   document.getElementById(tabObj+"_Content"+i).style.display = "none";
}
} 
}
</script>
		<script language="JavaScript">
function dosubmit(theUrl){
	//ǰ���Ѿ��������ų�������Ϊ<%=com.ist.util.Constans.CASE_NAME%>��ѯ���
	//var oSpans = top.leftFrame.document.getElementsByTagName('span');
	//for(var i = 0; i < oSpans.length; i ++) {
		//if(oSpans[i].className == 'selected' && oSpans[i].innerHTML.indexOf('���ų�<%=com.ist.util.Constans.CASE_NAME%>') != -1) {
			//theUrl = '<%=request.getContextPath()%>/report/case/t07_case_application_search_removed.do?&intPage=1';
		//}
	//}
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
function checkonMouseOver(obj){
	var rownum = obj.rowIndex;
	if(flag!=rownum){
		obj.style.cursor='hand';
	}
	obj.style.backgroundColor='#ECF3FF'
}
function checkonmouseout(obj){
	var rownum = obj.rowIndex;
	obj.style.cursor='';
	if(flag!=rownum){
		obj.style.backgroundColor='#FFFFFF';
	}
}
function onclicktr(obj,url){
if(url != "")
{
var case_type=document.forms[0].case_type.value;
url=url+"&case_type="+case_type;
	obj.style.cursor='';
	var tabnum = document.getElementById("alert_table").rows.length;
	//var stylems = obj.cells[1].childNodes[0].style.cursor;
	var rownum = obj.rowIndex;
	//if(stylems==''){
		for(var i=2;i<tabnum-1;i++){
		   if(i!=rownum){
			  document.getElementById("alert_table").rows(i).style.backgroundColor='#FFFFFF';
		   }
		}
	//}
	if(flag!=rownum){
		obj.cells[0].childNodes[0].checked = true;
		flag = rownum;
		Open(url);
	}	
}
}
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/case/caseDetailinfo.do">
			<input type="hidden" name="case_type" value="<bean:write  property="cast_type" name="t07_case_application" />"/>
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%=com.ist.util.Constans.CASE_NAME%>���: <bean:write
								property="application_num" name="t07_case_application" /> </span>
						<span class="buttons"> 
						<logic:equal value="2" name="t07_case_application" property="cast_type">
						<a href='#' onClick="window.open('<%=request.getContextPath() %>/mfa/mfa_issue/MFA.html?isSave=<%=(String)request.getAttribute("isSave") %>&net_id=<bean:write
								property="application_num" name="t07_case_application" />&isHistory=<bean:write
								property="casesearchtime" name="t07_case_application" />','_blank' , 'fullscreen=yes,location=no,menubar=no,resizable=no,scrollbars=no,status=no,toolbar=no');" ><img src="../../images/blue/case02.gif" />�ʽ�����</a>
						</logic:equal>
						<a href="#"
							onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>&nbsp;&nbsp; <!-- <input type="button" value="��  ��" class="input" onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>')"/> -->
						</span>
					</div>
						<div class="cond_c">
							<!-- <%=com.ist.util.Constans.CASE_NAME%>��Ϣ��ʼ -->
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										�������ࣺ
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="case_kind_disp" />
									</td>
									<td><%=com.ist.util.Constans.CASE_NAME%>���ͣ�
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="cast_type_disp" />
									</td>
								</tr>
								<tr>
									<td><%=com.ist.util.Constans.CASE_NAME%>״̬��
									</td>
									<td>
										<bean:write name="t07_case_application"
											property="app_state_cd_s" />
									</td>
									<td>
										����������
									</td>
									<td>
										<bean:write name="t07_case_application" property="app_org_id" />
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
								<tr>
									<td>
									   <%=com.ist.util.Constans.CASE_NAME%>������Ϣ��
									</td>
									<td colspan="3">
									  <logic:iterate id="stcr" name="stcrList">
	                                         <bean:write name="stcr" />&nbsp;&nbsp;&nbsp;&nbsp;
	                                         <br/>
	                                  </logic:iterate>
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
										<td colspan="3">
										
											    <bean:write property="action_descrip" name="t07_case_application" />
											
										</td>
									</tr>
									<tr>
										<td><%=com.ist.util.Constans.CASE_NAME%>���������
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
							</table>
						</div>
				</div>
				
				<div class="cond_t2">
					<span class="buttons"> 
					   <strong><img src="../../images/blue/titleicon02.png" /><%=com.ist.util.Constans.ALERT_NAME%>��Ϣ</strong> 
					</span>
				</div>
				<%
				LinkedHashMap t07_case_model_strMap = (LinkedHashMap)request.getAttribute("t07_case_model_strMap");
				ArrayList modelList = (ArrayList)request.getAttribute("modelList");
				int size = modelList.size();
				int length = 1;
				if(size>0)
					length = 2;
			    %>
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0" id='alert_table'>
						<tr>
							<th rowspan="<%= length%>">
							ѡ��
						</th>
						<th rowspan="<%= length%>">
							��������
						</th>
						<th rowspan="<%= length%>">
							��������
						</th>
						<logic:equal name="model_flag" value="1">
						<th colspan="<%= size%>">
							ģ�ͣ�ƥ��ȣ�
						</th>
						</logic:equal>
						<th rowspan="<%= length%>">
							����״̬
						</th>
						<th rowspan="<%= length%>">
								����
							</th>
						</tr>
				<logic:equal name="model_flag" value="1">
					<tr>
					<%
						Iterator iter1 = modelList.iterator();
						while (iter1.hasNext())
						{
							T07_case_stcr temp1 = (T07_case_stcr) iter1.next();
							String model_no = temp1.getModel_no();
							String matching_disp = temp1.getMatching().toString();
					 %>
						<th><%=model_no %>(<%=matching_disp %>%)</th>
					<%
						}
					%>
				  </tr>
				</logic:equal>
						<logic:iterate id="stcr" name="t07_stcrList"
							type="com.ist.aml.report.dto.T07_case_stcr" indexId="number">
							<%
								java.util.HashMap map = new java.util.HashMap();
												map.put("stcr", stcr.getStcr());
											
												pageContext.setAttribute("map", map,
														PageContext.PAGE_SCOPE);
							%>
							<%
								url = request.getContextPath();
								String bb = stcr.getStatus();
								if(!"".equals(bb))
						   	 		url = url + "/inves/case/t07_stcr_main.do?stcr="
									  + stcr.getStcr() + "&application_num=" + stcr.getApplication_num() + "&party_id=" + stcr.getParty_id() +"&case_type=" + request.getAttribute("case_type") + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
								else
									url = "";
								String aa = stcr.getStcr();
							%>
							<tr onclick="onclicktr(this,'<%=url%>')">
	
								<td>
									<input type="radio" name="rad1" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr_disp" scope="page" />
								</td>
								<logic:equal name="model_flag" value="1">
							<%
								LinkedHashMap temp = new LinkedHashMap();
								temp = (LinkedHashMap) t07_case_model_strMap.get(aa);
								Iterator iter2 = modelList.iterator();
								while (iter2.hasNext())
								{
									T07_case_stcr temp2 = (T07_case_stcr) iter2.next();
									String model_no2 = temp2.getModel_no();
							%>
									<td>
							<%
									if(temp.containsKey(model_no2))
									{
					 		%>
									<img src="../../images/blue/b_submit.png" />
							<%
									}
							%>
									</td>
							<%
							}
							%>
							</logic:equal>
								<td>
									<bean:write name="stcr" property="status_disp" scope="page" />
								</td>
								<td>
								<logic:notEmpty name="stcr" property="status">
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&party_id=<bean:write name="stcr" property="party_id"/>',width:580,height:360,title:'�鿴',handler:handler,iframe:true,fixPosition:true,dragOut:false});">�鿴</a>
								</logic:notEmpty>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				
				<iframe id="down" src="#" scrolling="no" height="500" width="100%" name="test" frameborder="0"></iframe>
			</html:form>
		</div>
	</body>
</html>