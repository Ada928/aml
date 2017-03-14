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
		<title><c:out value="${labelStr}" escapeXml="false"></c:out></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>		
	    <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/report.css" rel="stylesheet" type="text/css">
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/jquery-ui.css" rel="stylesheet" type="text/css">
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>		
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
		
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
		
		<!-- �Զ���ű� -->
		<c:out value="${t10_report.scriptcd}" escapeXml="false"></c:out>
        </script>
	</head>

	<body class="tools-bg">
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div class="tools-cot">
		<html:form method="post" action="/t10_report/t10_report_test.do">
		    <html:hidden property="reportkey"/>
		    <html:hidden property="p_reportkey"/>
			<logic:notEqual value="" name="labelStr">
			<div class='awp_title'>
	  			<table >
			  		<tr>
			    		<td align='left' nowrap><c:out value="${labelStr}"></c:out> </td>
			    		<td width="*" align="right">
			    			<c:out value="${cmdHtmlStr}" escapeXml="false"></c:out>
			    			
			    			&nbsp;
			    		</td>
					</tr>				
			  	</table>
			</div>
			</logic:notEqual>
			<!-- ������Ϣ��ʾ�� -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- ��ѯ������ -->
			<div class="awp_cond">
			<c:out value="${condHtmlStr}" escapeXml="false"></c:out>	
			</div>
			<!-- ������ -->
			<c:out value="${htmlStr}" escapeXml="false"></c:out>
			
			
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>���ڼ������ݣ����Ժ�...</font>
			</div>
			
			<!--������ʾ��-->
	    <div class='awp_msgtab'>
		  	<table>
		   		<tr>
		    		<td>ϵͳ��ʾ��</td>
		    		<td><c:out value="${t10_report.reportdes}" escapeXml="false"></c:out>&nbsp;</td>
		   		</tr>
		  	</table>		
	    </div>
			
		</html:form>
	</div>
	</body>
	<script language="JavaScript">onLoadPage();</script>
</html>
		
			
