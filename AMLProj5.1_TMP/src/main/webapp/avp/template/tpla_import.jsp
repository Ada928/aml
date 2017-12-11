<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312">
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">

		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	</head>

	<script language="JavaScript">

	function importDo() {
		var url = "importDo.do";
		
		var fileName = document.forms[0].filename.value;
		if (len(trim(fileName)) == 0) {
			alert("��ѡ���ϴ��ļ���");
			return;
		}
		
		if (fileName.substr(fileName.length - 3) != "dat" || 
				fileName.substr(fileName.length - 3) != "dat") {
			alert("��ѡ���Ѿ�������ģ���ļ���");
			return;
		}
		document.forms[0].action=url;
		document.forms[0].submit();
	}

	function gotoTplaList() {
		var busstypecd = document.forms[0].busstypecd.value;
		var url = "tpla_maint_list.do?newsearchflag=1&busstypecd=" + busstypecd;
		document.forms[0].action=url;
		document.forms[0].submit();
	}
 </script>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<div id='content'>
			<html:form method="post" action="/template/importDo.do"
				enctype="multipart/form-data">
				<!-- �������� -->
				<div class='awp_title'>
					<table>
						<tr>
							<TD width="23%" noWrap>
								<span class="awp_title_td2">ģ�͵���</span>
							</td>
							<td align="right" noWrap>
								<input type="button" name="btnsearch" value="��  ��" 
									onclick="importDo();">
								<input type="button" name="btn" value="��  ��"
									onClick="gotoTplaList();">
							</td>
						</tr>
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="false" />
				</html:messages>

				<input type="hidden" name="busstypecd"
					value="<c:out value="${busstypecd}" />" />
				<div class='awp_detail'>
					<table>
						<tr>
							<td>
								ѡ��ģ���ļ���
							</td>
							<td colspan="3">
								<html:file property="filename" size="60" styleClass="botton" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
