<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- ������� -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><c:out value="${t02_tp_bas_inf.tplaname}" escapeXml="false">_����</c:out></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/ToolsWindow.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/toolswindow.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	</head>

	<body class="tools-bg">
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div class="tools-cot">
			<div class="cond">
			 <div class="cond-t">
			  <strong><c:out value="${t02_tp_bas_inf.tplaname}" escapeXml="false"></c:out>_����</strong>
				<br/>
				<br/>
				<br/>
			  <span style="top:0px;">
			  	<input type='button' value='�� ��' onClick="window.close();" />
			  </span>
	  			
			</div>	
			</div>
			<!--������ʾ��-->
			 <c:if test="${t02_tp_bas_inf.fundes != ''}">
			    <div class='awp_msgtab'>
				  	<table>
				   		<tr>
				    		<td><p><strong>ϵͳ��ʾ��</strong><br>
				    		<c:out value="${t02_tp_bas_inf.fundes}" escapeXml="false"></c:out>
				   		</tr>
				  	</table>		
			    </div>
			</c:if>
			
	</div>
	</body>
</html>
		
			
