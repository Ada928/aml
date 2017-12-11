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
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_writeback/t12_writeback_article_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2"> �ظ�����- �� ��</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />

						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='awp_cond' id="searchtable" style="display:none">
				<TABLE>

					<tr>
						<td>
							���±��⣺
						</td>
						<td>
							<html:text property="articlename" styleClass="text_white"
								size="30" />
						</td>
						<td>
							��Ŀ���ƣ�
						</td>

						<td>
							<html:text property="programaname" styleClass="text_white"
								size="30" />
						</td>
					</tr>

					<tr>
						<td>
							�������ߣ�
						</td>
						<td>
							<html:text property="realname" size="30" />
						</td>
						<td>
							���·���ʱ�䣺
						</td>
						<td>
							<html:text property="createdate_min" maxlength="10" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].createdate_min);">
							-
							<html:text property="createdate_max" maxlength="10" size="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor:hand;" width="16" height="16" border="0"
								align="middle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].createdate_max);">
						</td>
					</tr>


					<tr>

						<td>
							����
						</td>

						<td>
							<html:select property="sort_column">
								<html:option value="sum_notneed">�������������</html:option>
								<html:option value="sum_wait">�����������</html:option>
								<html:option value="sum_fail">δͨ�����������</html:option>
								<html:option value="sum_already">ͨ�����������</html:option>
								<html:option value="createdate">���·���ʱ��</html:option>
							</html:select>

							<html:radio property="sort_type" value="asc">����</html:radio>
							<html:radio property="sort_type" value="desc">����</html:radio>
							<html:radio property="sort_type" value="">������</html:radio>

						</td>

						<td>
						</td>
						<td>
							<input type="button" name="button" value="�� ѯ"
								onClick="awpDoSubmit('t12_writeback_article_list.do?newsearchflag=1','search')"
								class="input">
						</td>
					</tr>
					</TABLE>
			</div>
			<div class="awp_list">
				<TABLE>
					<TR align=center>

						<TD nowrap>
							���±���
						</TD>

						<TD nowrap>
							��Ŀ����
						</TD>

						<TD nowrap>
							��������
						</TD>

						<TD nowrap>
							���·���ʱ��
						</TD>

						<TD nowrap>
							���������
						</TD>

						<TD nowrap>
							�������
						</TD>

						<TD nowrap>
							δͨ�������
						</TD>

						<TD nowrap>
							ͨ�������
						</TD>

						<TD nowrap>
							����
						</TD>

					</TR>

					<logic:iterate id="article" name="t12_article_sum2writebackList"
						type="com.ist.cms.dto.T12_article">
						<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("articlekey", article.getArticlekey());
								map.put("programakey", article.getProgramakey());

								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR align="center">

							<TD  align="left">
								<a
									href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/businessmanager/t12_article/t12_article_audit_disp.do?articlekey=<bean:write name="article" property="articlekey"/>&programakey=<bean:write name="article" property="programakey"/>')">
									<bean:write name="article" property="articlename" scope="page" filter="false" /> 
					           </a>		

							</TD>

							<TD nowrap>
								<bean:write name="article" property="programaname" scope="page" />
							</TD>

							<TD nowrap>
								<bean:write name="article" property="realname" scope="page" />
							</TD>

							<TD nowrap>
								<bean:write name="article" property="createdate" scope="page" />
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_writeback/t12_writeback_list.do?newsearchflag=1&auditstat=0&programakey=<bean:write name="article" property="programakey"/>&articlekey=<bean:write name="article" property="articlekey"/>">
									<strong><FONT color="#000000"><bean:write
												name="article" property="sum_notneed" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_writeback/t12_writeback_list.do?newsearchflag=1&auditstat=1&programakey=<bean:write name="article" property="programakey"/>&articlekey=<bean:write name="article" property="articlekey"/>">
									<strong><FONT color="#0000FF"><bean:write
												name="article" property="sum_wait" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_writeback/t12_writeback_list.do?newsearchflag=1&auditstat=2&programakey=<bean:write name="article" property="programakey"/>&articlekey=<bean:write name="article" property="articlekey"/>">
									<strong><FONT color="#ff0000"><bean:write
												name="article" property="sum_fail" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<a
									href="../../businessmanager/t12_writeback/t12_writeback_list.do?newsearchflag=1&auditstat=3&programakey=<bean:write name="article" property="programakey"/>&articlekey=<bean:write name="article" property="articlekey"/>">
									<strong><FONT color="#7FFF00"><bean:write
												name="article" property="sum_already" scope="page" /></FONT></strong></a>
							</TD>

							<TD nowrap>
								<strong><FONT color="#000000">&nbsp;&nbsp;<bean:write
											name="article" property="sum_all" scope="page" /></FONT></strong>
							</TD>

						</TR>
					</logic:iterate>
				</TABLE>
			</div>

			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
</BODY>

</html:html>

