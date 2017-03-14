<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    

	</head>

	<body>
	<div id='content'>
		<html:form method="post"
			action="/myknowledge/t12_subscibe/t12_subscibe_tactics_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">���Ĺ��� - �� ��</span>
						</td>
						<td align="right">
						<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
						<input type="button" name="button1" value="��  ��"
							onclick="awpDoSubmit('t12_subscibe_tactics_add.do','add')"
							class="input">
						<input type="button" name="button1" value="��  ��"
							onclick="awpDoSubmit('t12_subscibe_tactics_modify.do','modi')"
							class="input">
						<input type="button" name="button1" value="ɾ  ��"
							onclick="awpDoSubmit('t12_subscibe_tactics_delete_do.do','del')"
							class="input">
						<input type=button value="�� ��" name=Button22 class="input"
							onClick="awpDoSubmit('t12_subscibe_list.do?newsearchflag=1','search')" >
						</td>
					</tr>
				</table>
			</div>
	<div class='awp_cond' id="searchtable" style="display:none">
			<TABLE>
		
				
		
					<tr>
						<td align="right">
							�������ƣ�
						</td>
						<td align="left">
							<html:text property="subscibename" size="34" />
						</td>
						<td align="right">
							����ʱ�䣺
						</td>
						<td align="left">
							<html:text property="begindate" maxlength="10" size="10"/>
							<img src="<%=request.getContextPath() %>/images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].begindate);">
							-
							<html:text property="enddate" maxlength="10" size="10"/>
							<img src="<%=request.getContextPath() %>/images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].enddate);">
						</td>
					</tr>


					<tr>
						<td align="right">
							����
						</td>

						<td align="left">
							<html:select property="sort">
							    <html:options collection="sortMap" property="label" labelProperty="value"/>
							</html:select>
							
							<html:radio property="sort_type" value="asc">����</html:radio>
							<html:radio property="sort_type" value="desc">����</html:radio>
							<html:radio property="sort_type" value="">������</html:radio>							
						</td>
						<td align="right">

						</td>
						<td align="left">
							<input type="button" name="button1" value="�� ѯ"
								onclick="awpDoSubmit('t12_subscibe_tactics_list.do?newsearchflag=1','search')" class="input">
						</td>
					</tr>

			
		</TABLE></div>
	<div class="awp_list">

			<TABLE>
				<TR align=center>
					<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])'
							style='cursor:hand;'>
						ȫ��
					</TD>

					<TD nowrap>
						���
					</TD>
					<TD nowrap>
						��������
					</TD>
					<TD nowrap>
						��������
					</TD>
					<TD nowrap>
						����ʱ��
					</TD>
					<TD nowrap>
						��ע
					</TD>

				</TR>
				<logic:iterate id="dto" name="resultList" type="com.ist.cms.dto.T12_subscibe_tactics" indexId="i">
				    <TR align="center">
				    <TD nowrap>
						<html:multibox property="subscibekey">
						   <bean:write name="dto" property="subscibekey"/>
						</html:multibox>
					</TD>
					<TD nowrap>
					    <%=i.intValue()+1 %>
					</TD>
					<TD nowrap align="left"><bean:write name="dto" property="subscibename" scope="page"/></TD>
					<TD nowrap><bean:write name="dto" property="subscibetype_disp" scope="page"/></TD>
					<TD nowrap><bean:write name="dto" property="subscibedt" scope="page"/></TD>
					<TD nowrap align="left"><bean:write name="dto" property="des" scope="page"/></TD>
					</TR>
				</logic:iterate>				
			</TABLE></div>
			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
        </html:form></div>
	</body>

</html>
