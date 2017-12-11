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
		<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">

		<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/title.js"></script>
		<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"	src="<%=contextPath%>/js/Calendar.js"></script>
	 <script type="text/javascript">
	 	var path = "<%=contextPath %>";
	 </script>
	</head>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<div id='content'>
			<html:form method="post" action="/search/t02_srch_eng_inf_app_list.do">
				<!-- �������� -->
				<div class='awp_title'>
					<table>
						<tr>
							<td width="23%"><span class="awp_title_td2">ͳһ��ͼ - Ӧ���б�</span></td>
							<td align="right">
								<input type="button" name="btsearch" value="�� ��" class="botton" onclick="btnDisplayHidden(this, 'searchtable')" />
								&nbsp;
							</td>
						</tr>
					</table>
				</div>

				<!-- ������Ϣ��ʾ�� -->
				<html:messages id="errors" message="true">
					
				</html:messages>

				<!-- ��ѯ������ -->
				<div class='awp_cond' id="searchtable" style="display: none">
					<table width="100%">
						<tr>
							<td>��������</td>
							<td>
								<html:text property="srchengname" size="33" />
							</td>
							<td>�����ˣ�</td>
							<td>
								<html:hidden property="creator" />
								<html:text property="creator_disp" size="30" readonly="true" />
								<html:button property="button1" onclick="locate_pop_window(path,'t00_userLocation' ,'radio' ,'forms[0]', 'creator,creator_disp','flag=\\'1\\'')" value="�� λ"/>
							</td>
						</tr>
						<tr>
							<td>�������ڣ�</td>
							<td>
							<html:text property="createdate_min" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="�������������˵�"
								onclick="new Calendar().show(document.forms[0].createdate_min);">
							��
							<html:text property="createdate_max" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="�������������˵�"
								onclick="new Calendar().show(document.forms[0].createdate_max);">
							</td>
							<td>����</td>
							<td>
								<html:select property="sort">
                					<html:options collection="sortMap" property="label" labelProperty="value"/>
             					</html:select>
								<html:radio property="sort_type" value="asc">����</html:radio>
								<html:radio property="sort_type" value="desc">����</html:radio>
								<html:radio property="sort_type" value="">������</html:radio>
							</td>
						</tr>
						<tr>
							<td></td>
							<td>
							</td>
							<td>
								&nbsp;
							</td>
							<td>
								<input type="button" value="�� ѯ" onclick="awpDoSubmit('t02_srch_eng_inf_app_list.do?newsearchflag=1')"/>
							</td>
						</tr>
					</table>
				</div>

				<!-- ������ -->
				<div class='awp_list'>
					<table>
						<tr>
							<td>���</td>
							<td>��������</td>
							<td>����״̬</td>
							<td>������</td>
							<td>����ʱ��</td>
							<td>������</td>
							<td>����ʱ��</td>
						</tr>
						<%
					   		int currRecordNum=((Integer)request.getAttribute("currRecordNum")).intValue();
					    %>
						<logic:iterate id="javaBean" name="t02_srch_eng_infList" indexId="index" type="com.ist.avp.search.dto.T02_srch_eng_inf">
							<tr>
							    <td align="center"><%=index.intValue()+1+currRecordNum%> </td>
								<td align="left">
									<a href="javascript:awpDoSubmit('eng_init.do?srchengkey=<bean:write name="javaBean" property="srchengkey"/>')" >
										<bean:write name="javaBean" property="srchengname"/>
									</a>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="reqstat_disp"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="publisher_disp"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="publishdate"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="creator_disp"/>
								</td>
								<td align="center">
									<bean:write name="javaBean" property="createdate"/>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>

				<!--��ҳ��ʾ�� -->
				<div class='awp_page_bottom'>
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
			</html:form>
		</div>
	</body>
</html>
