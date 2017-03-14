<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<%
	String contextPath = request.getContextPath();
%>

<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
		 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		
		<script language="JavaScript" src="<%=contextPath%>/js/ist_base.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
			<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		
		
		
		<script type="text/javascript">
			function modify() {
				var message = CheckBoxCheckedSingleOne(document.forms[0]);
				if (message) {
					alert(message);
					return;
				}
				doSubmit('t02_tp_cus_action_modify.do');
			}
			
			function deleteDo() {
				var message = CheckBoxMustChecked(document.forms[0]);
				if (message) {
					alert(message);
					return;
				}
				doSubmit('t02_tp_cus_action_delete_do.do');
			}
			
			function orderDo() {
				var whole_path = "<%=contextPath %>" + "/common/location_orderwindow.do";
    			var	property = "height=450, width=600,left=370,top=100,scrollbars=yes,resizable=yes"; 
     			window.open("<%=contextPath %>/pub/blank.jsp", "orderwindow", property);
     			document.forms[0].action = whole_path;
     			document.forms[0].target = "orderwindow";
    			document.forms[0].submit();
			}
			function doSubmit(theUrl){
				document.forms[0].action = theUrl;
     			document.forms[0].target = "mainFrame1";
    			document.forms[0].submit();
			}
		</script>
	</head>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<div id='content'>
			<html:form method="post" action="/template/t02_tp_cus_action_list.do">
				<html:hidden property="tplakey" />
				
				<!-- ������� -->
				<input type='hidden' name='id' value='<c:out value="${id}"/>'>
                <input type='hidden' name='name' value='<c:out value="${name}"/>'>
                <input type='hidden' name='tablename' value = 't02_tp_cus_action'>
                <input type='hidden' name='keyname' value = 'actionkey'>
                <input type='hidden' name='seqname' value = 'dispseq'>
				<!-- �������� -->
				<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">ģ�͹���-�Զ��嶯��</span></td>
						<td align="right">
						
							<input type="button" value="�� ��" onClick="orderDo()">
								<input type="button" value="�� ��" onClick="doSubmit('t02_tp_cus_action_add.do')">
								<input type="button" value="�� ��" onClick="modify()">
								<input type="button" value="ɾ ��" onClick="deleteDo()">
								
								</td>
					</tr>
				</table>
			    </div>  
				 
				
				

				<!-- ������Ϣ��ʾ�� -->
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				<!-- ������ -->
				<div class='awp_list'>
					<table>
						<tr>
							<td>ȫ��</td>
							<td>��������</td>
							<td>������ַ</td>
							<td>��ʾ����</td>
							<td>λ������</td>
							<td>�ύ����</td>
							<td>���ڿ��</td>
							<td>���ڸ߶�</td>
							<td>��ʾ˳��</td>
						</tr>
						<logic:iterate id="javaBean" name="t02_tp_cus_actionList" type="com.ist.avp.template.dto.T02_tp_cus_action">
							<tr>
								<td align="center">
									<input type="checkbox" name="actionkeys" value="<bean:write name="javaBean"  property="actionkey"/>" />
								</td>
								<td>
									<bean:write name="javaBean" property="actionname"/>
								</td>
								<td>
									<bean:write name="javaBean" property="actionurl"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="disptype_disp"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="locatetype_disp"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="submittype_disp"/>
								</td>
								<td align="right">
									<bean:write name="javaBean" property="width"/>
								</td>
								<td align="right">
									<bean:write name="javaBean" property="height"/>
								</td>
								<td align="right">
									<bean:write name="javaBean" property="dispseq"/>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
