<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script type="text/javascript">
	</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_programa_attachtype/t12_programa_attachtype_list.do">
			<html:hidden property="programakey"/>
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">��Ŀ���� - <bean:write
									name="categoryname" ignore="true" />  ��Ŀ�����������б� </span>
						</td>
							<td align="right">
							<html:button property="button4" value="�� ��" styleClass="input" onclick="awpDoSubmit('t12_programa_attachtype_add.do','add')" />
							<html:button property="button3" value="ɾ  ��" styleClass="input"
							onclick="awpDoSubmit('t12_programa_attachtype_delete_do.do','del')" />	
						</td>
					</tr>
				</table>
			</div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			
			<div class="awp_list">
				<TABLE>
					<TR>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
						<td align="center" nowrap>
							��Ŀ����
						</TD>
						<td align="center" nowrap>
							����������
						</TD>
						<td align="center" nowrap>
							�����������
						</TD>
						<td align="center" nowrap>
							������
						</TD>
						<td align="center" nowrap>
							����ʱ��
						</TD>
					</TR>

					<logic:iterate id="t12_programa_attachtype" name="t12_programa_attachtypeList"
						type="com.ist.cms.dto.T12_programa_attachtype">
						<TR>
							<td align="center" nowrap>
								<html:multibox property="selectT12_programa_attachypekey" disabled="false">
									<bean:write name="t12_programa_attachtype" property="programakey" />,<bean:write name="t12_programa_attachtype" property="attachkey" />,<bean:write name="t12_programa_attachtype" property="attachname" />
								</html:multibox>
							</td>
							<td align="center" nowrap>
									<bean:write name="t12_programa_attachtype" property="programaname"
										scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="t12_programa_attachtype" property="attachkey"
									scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="t12_programa_attachtype" property="attachname"
									scope="page" />
							</td>
							<td align="center" nowrap>
						   		<bean:write name="t12_programa_attachtype" property="creator_disp"
									scope="page" />
							</td>
							<td align="center" nowrap>
						   		<bean:write name="t12_programa_attachtype" property="createdate"
									scope="page" />
							</td>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>

		</html:form>
	</div>

</BODY>

</html:html>

