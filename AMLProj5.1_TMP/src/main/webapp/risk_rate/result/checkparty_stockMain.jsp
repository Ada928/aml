<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />

<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function _chengeUrl(url){
	   var ifram=document.all.sysrule;
	   ifram.src=url;
	}
</script>
</head>
<body class="mainbg">
<html:form action="/result/t10_checkparty_main.do" method="post">

<%
String party_id=(String)request.getAttribute("party_id");
String viewRegulUrl=(String)request.getAttribute("viewRegulUrl");
if(party_id.contains("#")){
	party_id = party_id.replace("#","%23");
}
String resulekey=(String)request.getAttribute("resulekey");
if(resulekey.contains("#")){
	resulekey = resulekey.replace("#","%23");
}
%>
<div id="main">
<div id="bigTab">
		<!-- ��ѡ��˵� -->
		<dl class="tabm">
			<dd class="tabcur"><span>�ͻ�����</span></dd>
			<dd><span>������Ϣ</span></dd>
			<dd style='background:none;float:right;'>
		    <a href="#" onclick="dosubmit('<%=(String)request.getAttribute("backurl")%>')" >
		        	<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��&nbsp;&nbsp;</a>
		   </dd>
		</dl>
		<dl class="tabc">
			<dd class="tabshow">
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
		 <span class="buttons" id="iframemenu" style="float:left" >
		    <a href="<%=request.getContextPath()%>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down1"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />�ͻ���Ϣά��</a>
	        <a href="<%=request.getContextPath()%>/report/custcheck/modifyT10_colu.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down1" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />�ͻ�����</a>
	        <a href="<%=request.getContextPath()%>/report/cust_identify/t10_party_risklist_mod.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down1"><img src="../../images/<%=session.getAttribute("style") %>/b_tradplace.png" />�����¼�</a>
	        <a href="<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_rate_mod.do?newsearchflag=1&changeflag=<bean:write name="t37_party_resultActionForm" property="changeflag"/>&check_type=<bean:write name="t37_party_resultActionForm" property="check_type"/>&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />&auditlevel_flag=0" target="sub_down1"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />�������</a>
		 </span>

		   </div>
		   <iframe frameborder="0" width="100%"  height="450" id="sub_down1" scrolling="yes" name="sub_down1" 
				src="<%=request.getContextPath()%>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />"></iframe>
		
				</dd>
			
			<dd>
			<div style="background:#F2F9FE; border:1px solid #82B1BC; padding:5px 0;  margin:5px 0; font-size:14px ;float:left;width:100%">
				<span style="float:left" >
				
				<!--<a href="<%=request.getContextPath() %>/risk_rate/result/<%=viewRegulUrl %>.do?resulekey=<%=resulekey %>&templatekey=<bean:write name="t37_party_resultActionForm" property="templatekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=curr" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />������Ϣ</a>
		        <a href="<%=request.getContextPath() %>/risk_rate/result/t37_party_result_uhlist.do?party_id=<%=party_id %>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&newsearchflag=1" target="sub_down2" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />��ʷ������Ϣ</a>
		       --> <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />�˻���Ϣ</a>
		  		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />������Ϣ</a>
		  		<a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>" target="sub_down2"><img src="../../images/<%=session.getAttribute("style") %>/b_tradch.png" />������Ϣ</a>
		  		<a href="<%=request.getContextPath() %>/report/cust_identify/t10_checkparty_resultlist.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" target="sub_down2" ><img src="../../images/<%=session.getAttribute("style") %>/b_tradline.png" />��ʷ������Ϣ</a>
		        </span>
			</div>
			<iframe frameborder="0" width="100%" height="450"  id="sub_down2" scrolling="auto" name="sub_down2"
					src="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />"></iframe>
			</dd>
		</dl>
	</div>
</div>
</html:form>
</body>
</html>
