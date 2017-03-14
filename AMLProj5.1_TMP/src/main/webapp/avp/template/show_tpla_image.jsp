<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri='http://cewolf.sourceforge.net/taglib/cewolf' prefix='cewolf' %>
<%
String contextPath = request.getContextPath();
Chart chart = (Chart)request.getAttribute("chart");
%>

<%@page import="com.ist.avp.chart.Chart;"%>

<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
</head>
<script language="JavaScript">
</script>
<body>
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div id='content'>
		<form action="">
		<!-- �������� -->
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - ͼ��չ��</span></td>
						<td align="right">
							<input type="button" name="btsearch" value="�� ��" onclick="window.close();" />&nbsp;
						</td>
					</tr>
				</table>
			</div>  
		<!-- ������Ϣ��ʾ�� -->
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		<div class="awp_report">
			<c:if test="${datasetProducer != null}">
				<cewolf:chart id="<%=chart.getId() %>" title="<%=chart.getTitle() %>" type="<%=chart.getCharType() %>"  
					xaxislabel="<%=chart.getxAxisLabel()%>"  yaxislabel="<%=chart.getyAxisLabel()%>" 
					titleSize="<%=chart.getTitleSize() %>"  titleFamily="<%=chart.getTitleFamily() %>" 
					titleColor="<%=chart.getTitleColor() %>" legendanchor="<%=chart.getPicLocation() %>" showlegend="<%=chart.isShowlegend()%>">
				    <cewolf:colorpaint color="<%=chart.getBackground()%>"/>
				    <cewolf:data>
				        <cewolf:producer id="datasetProducer" usecache="false"/>
				    </cewolf:data>
				</cewolf:chart>
				<cewolf:img chartid="<%=chart.getId()%>" renderer="/cewolf" width="<%=chart.getWidth()%>" height="<%=chart.getHeight()%>" />
			</c:if>
		</div>
		</form>
	</div>
</body>
</html:html>