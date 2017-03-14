<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.avp.search.Constants;"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
	<script src="<%=contextPath%>/js/load_window.js"></script>
</head>
<script language="JavaScript">
 //��ѯ �ύ��̨
function dosubmit(theUrl) {
	 document.forms[0].action=theUrl;
     document.forms[0].submit();
}

//���
function add(theUrl){
     document.forms[0].action=theUrl;
     document.forms[0].target='_self';
     document.forms[0].submit();
     event.srcElement.disabled = true;
}
//�޸�
function update(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num != 1){
		alert("ֻ��ѡ��һ����¼");
		return false;
	}else{
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	
}
//ɾ��
function del(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("����ѡ��һ����¼");
		return false;
	}else{
		if(confirm("��ȷ��Ҫɾ����ѡ�����Ϣ��")){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
	}
}

 </script>
<body>
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div id='content'>
		<html:form method="post" action="/search/t02_srch_eng_parm_list.do">
			<html:hidden property="srchengkey"/>
			<!-- �������� -->
			<div class='awp_title'>
		    <table>
	        <tr>
			  <td width="23%"><span class="awp_title_td2">��ͼ���� - ��ͼ�����б�</span></td>
			  <td align="right">
	            <input type="button" name="btnAdd" value="�� ��" onclick="add('t02_srch_eng_parm_add.do');">
	            <input type="button" name="btnModify" value="�� ��" onClick="update('t02_srch_eng_parm_modify.do');">
	            <input type="button" name="btnDelete" value="ɾ ��" onClick="del('t02_srch_eng_parm_delete_do.do');">
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
			<div class='awp_list'>
				<table>
					<tr>
						<td>
							 <input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)">
						</td>
						
						<td>
							��ʾ����
						</td>
						<td>
							��������
						</td>
						<td>
							�Ƿ����
						</td>
						<td>
							�Ƿ�ϵͳ����
						</td>
						
					</tr>
					<logic:iterate id="binfo" name="t02_srch_eng_parmList"
						type="com.ist.avp.search.dto.T02_srch_eng_parm">
						<tr>
							<td align="center">
								<html:multibox property="parmkeys">
									<bean:write name="binfo" property="parmkey" />
								</html:multibox>
							</td>
							
							<td align="left">
								<bean:write name="binfo" property="parmname" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="parmcate_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="isness_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="issysparm_disp" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
