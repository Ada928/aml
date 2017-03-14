<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">

</SCRIPT>
</head>

<body>
<div id='content'>
	<html:form method="POST" action="/system_manager/t12_se_file_db/t12_se_file_db_disp.do">
	<!-- 
	<input type="hidden" name="id" value="<bean:write property="id" name="t12_se_file_db"/>"/>
	 -->
	   
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">���ݿ���������
								- ����</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="��  ��" styleClass="input"
						onclick="awpDoSubmit('t12_se_file_db_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>
	
<div class='awp_detail'>
		<TABLE>
					    <tr>
								<td>
									<FONT color="#ff0000">*</FONT>��������룺
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="id" ignore="true"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<FONT color="#ff0000">*</FONT>���������ƣ�
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="des" ignore="true"/>
								</td>
							</tr>
							<tr>
								<td>
									<FONT color="#ff0000">*</FONT>�������ͣ�
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="setype_disp" ignore="true"/>
								</td>
							</tr>
						<!--  	<tr>
								<td>
									�Ƿ���HTML��ǩ��
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="ishtml_disp" ignore="true"/>
								</td>
							</tr>
							<tr>
								<td>
									�ϼ������飺
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="block_disp" ignore="true"/>
								</td>
							</tr>-->

							<tr>
								<td>
									SQL���壺
								</td>
								<td>
									<html:textarea name="t12_se_file_db" property="sql" cols="60" rows="10" readonly="true"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									�ֶμ��ϣ�
								</td>
								<td>
								    <bean:write name="t12_se_file_db" property="fields" ignore="true"/>
								</td>
							</tr>
							<tr>
								<td>
									����URL��
								</td>
								<td>
								    <html:textarea name="t12_se_file_db" property="url" cols="60" rows="5" readonly="true"></html:textarea>
									<!-- 
									<html:text property="url" size="64"></html:text>
									 -->
								    
								</td>
							</tr>
						
		</TABLE></div>
	</html:form></div>
</body>

</html:html>
