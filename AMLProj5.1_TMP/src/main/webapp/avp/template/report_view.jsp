<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.ist.com/avp/report/tag" prefix="r"%>

<%
String contextPath = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
        <title><c:out value="${titleStr}" escapeXml="false"></c:out>_����ת�����</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<style type="text/css">
			.title {
				margin:0 0 0 8; 
				float:left; 
				width:98%;
				border-top: 0px;
			}
			.title table{
				font: bold;
				font-family: "����";
				font-size: 14.7px;
				text-decoration: none;
				line-height: 16pt;
				color:0072BC;
				BACKGROUND-COLOR: #EEEEEE;
			}
		</style>
	</head>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<form method="post" action="">
			<!-- �������� -->
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${titleStr}" escapeXml="false"></c:out>_����ת�����</span></td>
						<td align="right">
							<c:if test="${report != null && reportData != null}">
								<input type="button" name="btsearch" value="�� ��" onclick="copyTableToExcel('report');" />&nbsp;
							</c:if>
							<input type="button" name="btsearch" value="�� ��" onclick="window.close();" />
							&nbsp;						                  </td>
					</tr>
				</table>
			</div>  
			

			<!-- ������Ϣ��ʾ�� -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<!-- ���������� -->
			<c:if test="${report != null && reportData != null}">
				<r:report report="report" data="reportData"></r:report>
			</c:if>
		</form>
	</body>
</html>

