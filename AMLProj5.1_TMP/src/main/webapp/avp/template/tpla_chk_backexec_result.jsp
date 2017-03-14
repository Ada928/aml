<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://www.ist.com/avp/report/tag" prefix="r"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<!-- ������� -->
		<meta http-equiv="expires" content="0"/>
		<meta http-equiv="pragma" content="no-cache"/>
		<meta http-equiv="cache-control" content="no-cache"/>

		<meta http-equiv=Content-Type content="text/html; charset=GBK"/>
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<title><c:out value="${t02_tp_bas_inf.tplaname}" escapeXml="false">_����</c:out></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>	
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/ToolsWindow.css" rel="stylesheet" type="text/css"/>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css"/>
		<link rel="stylesheet" href="<%=request.getContextPath() %>/skin/<%=style %>/css/jquery-ui.css" type="text/css"/>
		
		<script src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
		<script src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/toolswindow.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<style type="text/css">
.layout_chart_right{margin-top:6px;float:right;}
.layout_chart_left{margin-top:6px;float:left;}
.awp_list_left{float:left;height:480px;}
.awp_list_right{float:right;height:480px;}
</style>
		<script language="JavaScript">
		function onLoadPage() {
            var tableId = document.getElementById("tbl");
			var i = 0;
			 
			if(tableId == null) {
                return;
            }
		    for (var row in tableId.rows) {
			    if(tableId.rows[row].className == "hiddenRow") {
				    i = i + 1;
				   
			    }
		    }
		    if(i == 0){
		    	var oButton = document.getElementById("viewCondId");
		    	if (oButton) {
		    		oButton.style.display = "none";;
		    	}
		    }
		}
		
			<!-- ģ���Զ���ű� -->
			<c:out value="${t02_tp_bas_inf.scriptcd}" escapeXml="false"></c:out>
			
			<!-- �Զ��嶯���ű����������� -->
			<c:out value="${script}" escapeXml="false"></c:out>
        </script>
	</head>

	<body class="tools-bg">
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div class="tools-cot">
		<html:form method="post" action="/template/tpla_backexec_resultView_do.do">
			<!-- �������� -->
			<div class='awp_title'>
				<table>
					<tr>

						<td>
							<span class="awp_title_td2"><c:out value="${title}"/>_���</span>
						</td>
						<td nowrap align="right">
<%--							<input type="button" name="btsearch2" value="�� ��"--%>
<%--								onclick="btnDisplayHidden(this, 'searchtable')" />--%>
<%--							<input type="button" name="add" value="�� ��" onclick="dosubmit('/awp/fdp/t03_program/t03_program_add.do','add')">--%>
<%--							<input type="button" name="modify" value="�� ��" onclick="dosubmit('/awp/fdp/t03_program/t03_program_modify.do','modify')">--%>
<%--							<input type="button" name="delete" value="ɾ ��" onclick="dosubmit('/awp/fdp/t03_program/t03_program_delete_do.do','del')">--%>
								<input type="button" name="btsearch2" value="��  ��"
								onClick="awpDoSubmit('<%=request.getContextPath() %>/avp/template/tpla_export_cond.do?tpla_sessionId=<c:out value="${id}"/>&export_audit_flag=0')" />
								<input type="button" name="btsearch2" value="�� ��"
								onClick="window.close();" />
						</td>
					</tr>
				</table>
			</div>
			<!-- ������ -->
			<c:out value="${rsltHtmlStr}" escapeXml="false"></c:out>
			
			<!-- ���������� -->
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>���ڼ������ݣ����Ժ�...</font>
			</div>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>	
		</html:form>
	</div>
	</body>
	<script language="JavaScript" >onLoadPage();</script>
</html>
		
			
