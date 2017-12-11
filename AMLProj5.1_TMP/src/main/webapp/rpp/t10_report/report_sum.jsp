<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=GBK">
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script type="text/javascript">
	function finish(url) {
	    window.parent.location.href = url;
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form method="POST" action="/t10_report/t10_report_sum.do">
		<html:hidden property="reportkey" />
		
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">���������</span>
						</td>
						<td align="right">
						    <input type="button" name="button_next" value="�� ��" onclick="awpOpenwindow('t10_report_test.do?reportkey=<bean:write name="t10_reportActionForm" property="reportkey"/>&p_reportkey=<bean:write name="t10_reportActionForm" property="reportkey"/>','800','600');" class="input">
							<input type="button" name="button_next" value="�� ��" onclick="finish('t10_report_list.do?newsearchflag=1');" class="input">
						</td>
					</tr>
				</table>
			</div>

			<div class='awp_detail'>
				<table>
					<tr>
						<td align="right">
							�����ţ�
						</td>
						<td>
							<bean:write name="report" property="reportkey" scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							�������ƣ�
						</td>
						<td>
							<bean:write name="report" property="reportname" scope="request" />
						</td>
					</tr>
					<tr>
						<td width="160" align="right">
							�������
						</td>
						<td>
							<bean:write name="report" property="reportype_disp"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td width="160" align="right">
							������ϵͳ��
						</td>
						<td>
							<bean:write name="report" property="reportsys_disp"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td width="160" align="right">
							����״̬��
						</td>
						<td>
							<bean:write name="report" property="deployflag_disp"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td width="160" align="right">
							�Ƿ�˵���ʾ��
						</td>
						<td>
							<bean:write name="report" property="ismenudisp_disp"
								scope="request" />
						</td>
					</tr>
					<tr>
						<td width="160" align="right">
							�Ƿ���������
						</td>
						<td>
							<bean:write name="report" property="isexport_disp"
								scope="request" />
						</td>
					</tr>

                    <!--  
					<tr>
						<td align="right">
							����ҳ�棺
						</td>
						<td>
							<bean:write name="report" property="parampage_disp"
								scope="request" />
						</td>
					</tr>
					-->
					<tr>
						<td align="right">
							����ģ�壺
						</td>
						<td>
							<bean:write name="report" property="datatpl_file" scope="request" />
						</td>
					</tr>
					<tr>
						<td align="right">
							չ��ģ�壺
						</td>
						<td>
							<bean:write name="report" property="exceltpl_file"
								scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							ҳ����ʾ���ͣ�
						</td>
						<td>
							<bean:write name="report" property="pagetype_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							����������ʾ���ͣ�
						</td>
						<td>
							<bean:write name="report" property="condtype_disp" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							��ɫ��
						</td>
						<td>
							<bean:write name="report" property="rolenames" scope="request" />
						</td>
					</tr>
					
					<tr>
						<td align="right">
							����������
						</td>
						<td>
							<bean:write name="report" property="reportdes" scope="request" />
						</td>
					</tr>

				</table>
			</div>
			
			
			<div class="awp_list">
		<TABLE>
			<TR align=center bgcolor="A3C0EE">
				<TD width="18%" align="center" nowrap>
					��������
				</TD>
				<TD width="26%" noWrap>
					��ʾ����
				</TD>
				<TD width="17%" noWrap>
					�����������
				</TD>
				<TD width="11%" noWrap>
					�Ƿ����
				</TD>
				<TD width="9%" noWrap>
					��ʾ���
				</TD>
			</TR>

            <logic:iterate id="parinfo" name="t10_reportParmList"  type="com.ist.rpp.report.dto.T10_reportParm" >
			<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="parinfo" property="parmkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="parinfo" property="parmkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="parinfo" property="parmkey" />')>
				<TD nowrap>
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
		</div>

		</html:form>
	</div>
</body>

</html:html>
