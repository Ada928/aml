<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			var path = '<%=request.getContextPath()%>';
		</script>
		
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form action="/template/t02_tp_log_list.do" method="post">
			<div class='awp_title'>
				<table>
					<tr>						
						<td width="23%" nowrap><span class="awp_title_td2">��֤������־ - ���� </span></td>
						<td align="right"><input type="button" onclick="window.close();" value="�� ��"/></td>
					</tr>
				</table>
			</div> 			
			
			
			


				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class='awp_detail'>
					<TABLE>
						<tr>
							<td>
								ģ�����ƣ�
							</td>
							<td>
								<c:out value="${t02_tp_log.tplaname}" />
							</td>
						</tr>	
						<tr>
							<td>
								�����ˣ�
							</td>
							<td>
								<c:out value="${t02_tp_log.realname}" />
							</td>
						</tr>
						<tr>
							<td>
								����ʱ�䣺
							</td>
							<td>
								<c:out value="${t02_tp_log.qrydtt}" />
							</td>
						</tr>
						<tr>
							<td>
								��ѯ������
							</td>
							<td>
								<c:out value="${t02_tp_log.qrycond}" />
							</td>
						</tr>
						<tr>
							<td>
								ִ��SQL��
							</td>
							<td colspan="3">
								<c:out value="${t02_tp_log.qrysql}" />
							</td>
						</tr>
								
					</TABLE>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
