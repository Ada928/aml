<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.avp.search.Constants"%>
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
    	<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">

		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/title.js"></script>
		
		<style type="text/css">
			.exist {
				color:"#0072BC";
				margintop:3 px;
			}
			.new {
				color:"#FF0066";
				margintop:3 px;
			}
			.exist select {
				width:120;
			}
			.new select {
				width:120;
			}
			.span {
				font-family: "����";
				font-size: 12px;
				text-decoration: none;
				line-height: 15pt;
			}
		</style>
		
		<script language="JavaScript">
			
			var index = <c:out value="${existElementSize}" />;
			var maxElement = <c:out value="${tplaParmElmtSize}" />;
			var divId = "<%=Constants.PREVIOUS_DIV_NAME%>";
			var dotChar = "<%=Constants.DOT_CHAR%>";
			
			var addElementHtml = "<c:out value="${addElementHtml}" escapeXml="false"/>";
			var indexReplaceChar = "<%=Constants.INDEX_REPLACE_CHAR%>";
			var reg = new RegExp(indexReplaceChar,"g");
			
			var compareTypeId = "compareType";
			var tplaParmElmtId = "tplaParmElmt";
			var srchParmElmtId = "srchParmElmt";
			var parmdefvalId = "parmdefval";
			
			function saveAllParmElmts() {
				if (!saveValidate()) {
					return;
				}
				var url = "addT02_parm_elmt_relaDo.do";
				var tempParmvalkey = "";
				var tempParmelmtkey = "";
				var tempIsvalcol = "";
				var tempParmdefval = "";
				
				for (var i = 0; i < index; i++) {
					var oTplaParmElmt = document.getElementById(tplaParmElmtId + i);
					if (oTplaParmElmt == null) {
						continue;
					}
					var oCompareType = document.getElementById(compareTypeId + i);
					var oSrchParmElmt = document.getElementById(srchParmElmtId + i);
					var oParmdefval = document.getElementById(parmdefvalId + i);
					
					tempParmvalkey += oTplaParmElmt.value + dotChar;
					tempIsvalcol += oCompareType.value + dotChar;
					tempParmelmtkey += oSrchParmElmt.value + dotChar;
					tempParmdefval += oParmdefval.value + dotChar;
				}
				document.forms[0].tempParmvalkey.value = tempParmvalkey.length == 0 ? tempParmvalkey : tempParmvalkey.substr(0, tempParmvalkey.length - 1);
				document.forms[0].tempIsvalcol.value = tempIsvalcol.length == 0 ? tempIsvalcol : tempIsvalcol.substr(0, tempIsvalcol.length - 1);
				document.forms[0].tempParmelmtkey.value = tempParmelmtkey.length == 0 ? tempParmelmtkey : tempParmelmtkey.substr(0, tempParmelmtkey.length - 1);
				document.forms[0].tempParmdefval.value = tempParmdefval.length == 0 ? tempParmdefval : tempParmdefval.substr(0, tempParmdefval.length - 1);
				
				awpDoSubmit(url);
			}
			
			function saveValidate() {
				for (var i = 0; i < index; i++) {
					var oTplaParmElmt = document.getElementById(tplaParmElmtId + i);
					if (oTplaParmElmt == null) {
						continue;
					}
					var oCompareTypeId = document.getElementById(compareTypeId + i);
					var oParmdefvalElmt = document.getElementById(parmdefvalId + i);
					if (oCompareTypeId.value == "2" && oParmdefvalElmt.value.length == 0) {
						alert("ֵ��ʽ�Ĵ���ֵ����Ϊ��ֵ��");
						return false;
					}
					
					for (var j = 0; j < index; j++) {
						var oTplaParmElmtCurrent = document.getElementById(tplaParmElmtId + j);
						if (oTplaParmElmt == null) {
							continue;
						}
						if (oTplaParmElmt != oTplaParmElmtCurrent && oTplaParmElmt.value == oTplaParmElmtCurrent.value) {
							alert("�Բ���ͬһ��ģ�Ͳ���ֻ������һ����Ӧ��ϵ��");
							return false;
						}
					}
				}
				return true;
			}
			
			function addParmElmtRela(){
				if (index == maxElement) {
					alert("ģ�����в����Ѿ����ã�ɾ������֮������ӣ�");
					return;
				}
				var divElementsContainer = document.getElementById("divElementsContainer");
				
				var oDiv = document.createElement("div");
				oDiv.className = "new";
				oDiv.id = divId + index;
				
				var innerHtml = addElementHtml.replace(reg, index);
				oDiv.innerHTML = innerHtml + "&nbsp;&nbsp;";
				
				// ���ɾ����ť
				appendDeleteButton(oDiv);
				divElementsContainer.appendChild(oDiv);
				index ++;
			}
			
			function appendDeleteButton(oDiv) {
				var divElementsContainer = document.getElementById("divElementsContainer");
				var deleteButton = document.createElement("input");
				deleteButton.type = "button";
				deleteButton.className = "awp_button";
				deleteButton.value = "ɾ ��";
				deleteButton.onclick = function () {
					divElementsContainer.removeChild(oDiv);
					index --;
				};
				oDiv.appendChild(deleteButton);
			}
			
			function deleteCurrentElement(id) {
				var divElementsContainer = document.getElementById("divElementsContainer");
				var oDiv = document.getElementById(id);
				divElementsContainer.removeChild(oDiv);
				index --;
			}
			
			function compareTypeChagne(id) {
				var compareValueType = "<%= Constants.COMPARE_IS_COLUMN %>";
				var oCompareType = document.getElementById(compareTypeId + id);
				var oSelect = document.getElementById(srchParmElmtId + id);
				var oText = document.getElementById(parmdefvalId + id);
				
				if (oCompareType.value == compareValueType) {
					oSelect.style.display = "inline";
					oText.style.display = "none";
				} else {
					oSelect.style.display = "none";
					oText.style.display = "inline";
				}
			}
			
			function displaySrchInfoListView() {
				var url = "t02_srch_info_list.do";
				awpDoSubmit(url);
			}
		</script>
	</head>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<div id='content'>
			<html:form method="post" action="/search/addT02_parm_elmt_rela">
				<html:hidden property="tplakey"/>
				<html:hidden property="srchengkey"/>
				<html:hidden property="srchcatekey"/>
				
				<!-- �������� -->
				<div class='awp_title'>
			     	<table>
			      		<tr>
			      			<td width="23%"><span class="awp_title_td2">ͳһ��ͼ ��ģ�Ͳ�����Ӧ��ϵ����</span></td>
				   			<td align="right">
						        <input type="button" value="�� ��" onclick="saveAllParmElmts()">
						        <input type="button" value="�� ��" onClick="displaySrchInfoListView()">
								&nbsp;
			      			</td>
			      		</tr>
			     	</table>
				</div>

				<!-- ������Ϣ��ʾ�� -->
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				
				<!-- ������ -->
				<div class='awp_list' style="marginBottom:0;overflow-y:visible">
					<table>
						<tr>
							<td>����ģ�Ͳ�����ϵ</td>
							<td align="right"><input type="button" class="botton" value="�� ��" onclick="addParmElmtRela()" /></td>
						</tr>
					</table>
					<div id="divElementsContainer" align="left" style='margintop:0;table-layer:fixed; overflow:visible'>
						<c:out value="${existElementHtml}" escapeXml="false"/>
					</div>
				</div>
				
				<html:hidden property="tempParmvalkey"/>
				<html:hidden property="tempParmelmtkey"/>
				<html:hidden property="tempIsvalcol"/>
				<html:hidden property="tempParmdefval"/>
			</html:form>
		</div>
	</body>
</html>
