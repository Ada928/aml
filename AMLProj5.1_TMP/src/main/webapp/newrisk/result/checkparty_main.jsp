<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
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
       var backurl=document.forms[0].backurl.value;
	   var ifram=document.all.sysrule;
	   ifram.src=url+'&backurl='+backurl;
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form action="/result/t10_checkparty_main.do" method="post">
<div id="main">
<input type="hidden" name="backurl" value="t37_party_result_list.do?post_id=<bean:write name="t37_party_resultActionForm" property="post_id" />&amp;tempcategory=<bean:write name="t37_party_resultActionForm" property="tempcategory"/>"/>
<%
String party_id=(String)request.getAttribute("party_id");
if(party_id.contains("#")){
	party_id = party_id.replace("#","%23");
}
%>
<div id="bigTab">
	<dl class="tabm">
		<dd class="tabcur">
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />')">�ͻ���Ϣ</span>	                       
		</dd>
		<dd>
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/report/custcheck/modifyT10_colu.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />')">�ͻ�����</span>	                       
		</dd>
		<dd>
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/report/cust_identify/t10_party_risklist_mod.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />')">�����¼�</span>	                       
		</dd>
		<dd>
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/report/cust_identify/t10_checkparty_reltdisp_mod.do?newsearchflag=1&changeflag=<bean:write name="t37_party_resultActionForm" property="changeflag"/>&check_type=<bean:write name="t37_party_resultActionForm" property="check_type"/>&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />&auditlevel_flag=0')">�������</span>	                       
		</dd>			
	</dl>
	<dl class="tabc">
	    <dd class="tabshow">
		  		<span style="float:right" >
		        <a href="#"  onclick="dosubmit('<bean:write name="backurl"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
				</span>
			<iframe src="<%=request.getContextPath()%>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<%=party_id %>&party_class_cd=<bean:write name="t37_party_resultActionForm" property="party_class_cd" />" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
			    	
		</dd>        	
	</dl>
</div>
</div>
</html:form>
</body>
</html>
