<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>�ҵĶ���</title>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<SCRIPT src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>	
		<SCRIPT src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript">
		function dosubmit(theUrl,type){
		var errMsg = "";
		var isSub = false;
		if(type=='del'){
			if(errMsg==''){
				if(confirm('�����Ҫɾ����')){
				isSub = true;
			}
			}
		}
		if(isSub && errMsg==''){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}else{
			if(errMsg!='')
			alert(errMsg);
			return false;
		}
	} 
		</script>
	</head>
	<body>
		<div id='content'>
			<html:form method="post"
				action="/myknowledge/t12_subscibe/t12_subscibe_list.do">


				<div class='awp_title'>

					<table>
						<tr>
							<td width="23%" nowrap>
								<span class="awp_title_td2">�ҵĶ��� - �� �� </span>
							</td>
							<td align="right">
								<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />
								<input type="button" name="button1" value="���Ĺ���"
									onclick="awpDoSubmit('t12_subscibe_tactics_list.do?newsearchflag=1','search')"
									class="input">
							</td>
						</tr>
					</table>
				</div>

				<div class='awp_cond' id="searchtable" style="display:none">
					<TABLE>

						
						<tr>
							<td align="right">
								���±��⣺
							</td>
							<td align="left">
								<html:text property="articlename" size="34" />
							</td>
							<td align="right">
								��Ŀ���ƣ�
							</td>
							<td align="left">
								<html:text property="programaname" size="34" />
							</td>
						</tr>

						<tr>
							<td align="right">
								�������ߣ�
							</td>
							<td align="left">
								<html:text property="realname" size="34" />
							</td>
							<td align="right">
								���·���ʱ�䣺
							</td>
							<td align="left">
								<html:text property="createdate_min" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].createdate_min);">
								-
								<html:text property="createdate_max" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].createdate_max);">
							</td>
						</tr>

						<tr>
							<td align="right">
								�������ͣ�
							</td>
							<td align="left">
								<html:select property="subscibetype">
									<html:options collection="subscibetypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td align="right">
								����ʱ�䣺
							</td>
							<td align="left">
								<html:text property="begindate" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].begindate);">
								-
								<html:text property="enddate" maxlength="10" size="10" />
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].enddate);">
							</td>
						</tr>

						<tr>
							<td align="right">
								����
							</td>

							<td align="left">
								<html:select property="sort">
									<html:options collection="sortMap" property="label"
										labelProperty="value" />
								</html:select>
								<html:radio property="sort_type" value="asc">����</html:radio>
								<html:radio property="sort_type" value="desc">����</html:radio>
								<html:radio property="sort_type" value="">������</html:radio>
							</td>
							<td align="right">

							</td>
							<td align="left">
								<input type="button" name="button1" value="�� ѯ"
									onclick="awpDoSubmit('t12_subscibe_list.do?newsearchflag=1','search')"
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
								��������
							</TD>
							<TD nowrap>
								����ʱ��
							</TD>
							<TD nowrap>
								����
							</TD>
						</TR>
						<%
						int i = 0;
						%>
						<logic:iterate id="order" name="resultList"
							type="com.ist.cms.dto.T12_subscibe">
							<TR align="center" bgcolor="#FFFFFF">
								<td nowrap align="left" height=24>
									<a
										href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=<bean:write name="order" property="articlekey" scope="page"/>&programakey=<bean:write name="order" property="programakey" scope="page"/>&verifyAuditStats=yes&1=1')">
										<bean:write name="order" property="articlename" scope="page" filter="false"/>
									</a>
								</td>

								<td nowrap align="center">
									<bean:write name="order" property="programaname" scope="page" />
								</td>

								<td nowrap align="center">
									<bean:write name="order" property="realname" scope="page" />
								</td>

								<td nowrap align="center">
									<bean:write name="order" property="createdate" scope="page" />
								</td>

								<td nowrap align="center">
									<bean:write name="order" property="subscibetype_disp"
										scope="page" />
								</td>

								<td nowrap align="center">
									<bean:write name="order" property="subscibedt" scope="page" />
								</td>
								<td nowrap align="center">
									<a href="javascript:void(0);"
										onclick="dosubmit('t12_subscibe_delete_do.do?articlekey=<bean:write name="order" property="articlekey" scope="page"/>&subscibetype=<bean:write name="order" property="subscibetype" scope="page"/>','del')">ɾ
										��</a>
								</td>
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
	</body>

</html>
