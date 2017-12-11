<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
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
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<!-- <style type="text/css">
.nTab{
float: left;
width: 100%;
margin: 0 auto;
border-bottom:1px #FFFFFF solid;
background:#d5d5d5;
background-position:left;
background-repeat:repeat-y;
margin-bottom:2px;
}
.nTab .TabTitle{
clear: both;
height: 22px;
overflow: hidden;
background:#F6F9FF;
}
.nTab .TabTitle ul{
border:0;
margin:0;
padding:0;
}
.nTab .TabTitle li{
float: left;
width: 80px;
cursor: pointer;
padding-top: 4px;
padding-right: 0px;
padding-left: 0px;
padding-bottom: 2px;
list-style-type: none;
font-size: 12px;
text-align: center;
margin: 0;
}
.nTab .TabTitle .active{background:#fff;border-left:1px #AACCEE solid;border-top:1px #AACCEE solid;border-right:1px #AACCEE solid;border-bottom:1px #fff solid;}
.nTab .TabTitle .normal{background:#EBF3FB;border:1px #AACCEE solid;}
.nTab .TabContent{
width:auto;background:#FFFFFF;
margin: 0px auto;
padding:3px 0 0 0;
}
.none {display:none;}
</style> -->
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
</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/case/caseDetailinfo.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span><%=com.ist.util.Constans.CASE_NAME%>���: <bean:write
								property="application_num" name="t07_case_application" /> </span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>&nbsp;&nbsp; <!-- <input type="button" value="��  ��" class="input" onclick="dosubmit('<%=request.getContextPath()%><bean:write name="backUrl"/>')"/> -->
						</span>
					</div>
					<!-- ѡ�1��ʼ -->
					<%-- <div class="nTab" style="width: 100%">
						<!-- ���⿪ʼ -->
						<div class="bigTab">
							<dl class="tabm">
								<dd class="tabcur" onclick="nTabs(this,0);">
									<span><%=com.ist.util.Constans.CASE_NAME%>��Ϣ</span>
								</dd>
								<logic:equal value="1" name="t07_app_movefate_flag">
									<dd class="tabcur" onclick="nTabs(this,1);">
										<span>�����¼</span>
									</dd>
								</logic:equal>
							</dl>
						</div> --%>
						<!-- ���ݿ�ʼ -->
						<!-- table content -->
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
									<!-- <td height="22" align="right" bgcolor="ECF3FF" noWrap>�������ڣ�</td>
              <td bgcolor="F6F9FF"> <bean:write property="app_dt_disp"  name="t07_case_application" /></td> -->
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
									<!-- <td height="22" align="right" bgcolor="ECF3FF"></td>
              <td bgcolor="F6F9FF"></td> -->
								</tr>
								<logic:equal property="cast_type" name="t07_case_application" value="2">
									<tr>
										<td>
											���ɳ̶ȣ�
										</td>
										<td>
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
												<bean:write property="alert_level_disp" name="t07_case_application" />
											</logic:notEqual>
										</td>
										<td>
											��ȡ��ʩ��
										</td>
										<td>
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
											    <bean:write property="take_action" name="t07_case_application" />
											</logic:notEqual>
										</td>
									</tr>
									<tr>
										<td>
											������Ϊ������
										</td>
										<td colspan="3">
											<logic:notEqual value="4" property="app_state_cd" name="t07_case_application">
											    <bean:write property="action_descrip" name="t07_case_application" />
											</logic:notEqual>
										</td>
									</tr>
									<tr>
										<td><%=com.ist.util.Constans.CASE_NAME%>���������
										</td>
										<!-- <td bgcolor="F6F9FF" colspan="3"><bean:write property="reason" name="t07_case_application" /></td> -->
										<td>
											<img src="../../images/<%=session.getAttribute("style") %>/b_addreport.png" />
											<a href="<%=request.getContextPath()%>/report/case/case_advice_more.do?application_num=<bean:write property="application_num"  name="t07_case_application" />"
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
						<!-- <%=com.ist.util.Constans.CASE_NAME%>��Ϣ���� -->
						<!-- �����¼��ʼ -->
						<!-- <div id="myTab1_Content1" class="none">
							<logic:equal value="1" name="t07_app_movefate_flag">
								<iframe id="down1"
									src="<%=request.getContextPath()%>/report/case/t07_app_movefate.do?newsearchflag=1&application_num=<bean:write property="application_num" name="t07_case_application" />"
									scrolling="no" width="100%" height="165" name="test1"
									frameborder="0"></iframe>
							</logic:equal>
						</div> -->
						<!-- �����¼���� -->
					<!-- </div> -->
					<!-- ���ݽ��� -->
					<!-- ѡ�1���� -->
				</div>
				
				<div class="cond_t2">
					<span class="buttons"> 
					   <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" /><%=com.ist.util.Constans.ALERT_NAME%>��Ϣ</strong> 
					</span>
				</div>
				
				<!-- list -->
				<div class="list">
					<table border="0" cellpadding="0" cellspacing="0" id='alert_table'>
						<tr>
							<th>
								ѡ��
							</th>
							<th>
								�ͻ���
							</th>
							<th>
								��������
							</th>
							<th>
								��������
							</th>
							<th>
								����״̬
							</th>
							<th>
								����
							</th>
						</tr>
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
								url = url + "/inves/case/stcr_trans_list_search.do?stcr="
									  + stcr.getStcr() + "&application_num=" + stcr.getApplication_num() + "&party_id=" + stcr.getParty_id() + "&newsearchflag=1&casesearchtime=" + request.getAttribute("casesearchtime");
							%>
							<tr onclick="onclicktr(this,'<%=url%>')">
	
								<td>
									<input type="radio" name="rad1" />
								</td>
								<td>
									<bean:write name="stcr" property="party_id" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr" scope="page" />
								</td>
								<td>
									<bean:write name="stcr" property="stcr_disp" scope="page" />
								</td>
								
								<td>
									<%--<bean:write name="stcr" property="status_disp" scope="page" /> 
									���ڴ˴���ѯ��������״̬�İ������������е�״̬��û��������״̬����
									�ڴ˴����ݰ�����״̬�ж�������״̬���������״̬��1,3 �������Լ���״̬
									�������״̬ʱ2,4,5���ð���״̬��ʾ modify by qiuyun 2011-7-17
									
									--%>
									
									<logic:equal value="1" name="t07_case_application" property="app_state_cd">
										<bean:write name="stcr" property="status_disp" scope="page" />
									</logic:equal>
									
									<logic:equal value="2" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									<logic:equal value="3" name="t07_case_application" property="app_state_cd">
										<bean:write name="stcr" property="status_disp" scope="page" />
									</logic:equal>
									
									<logic:equal value="4" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									<logic:equal value="5" name="t07_case_application" property="app_state_cd">
										<bean:write name="t07_case_application" property="app_state_cd_s" />
									</logic:equal>
									
									
								</td>
								<td>
									<a href="#" onclick="ymPrompt.win({message:'<%= request.getContextPath()%>/report/case/t07_case_stcr_advi.do?stcr=<bean:write name="stcr" property="stcr"/>&application_num=<bean:write name="stcr" property="application_num"/>&party_id=<bean:write name="stcr" property="party_id"/>',width:580,height:360,title:'�鿴',handler:handler,iframe:true,fixPosition:true,dragOut:false});">�鿴</a>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
				<iframe id="down" src="#" scrolling="no" width="100%" height="500" name="test" frameborder="0"></iframe>
			</html:form>
		</div>
	</body>
</html>