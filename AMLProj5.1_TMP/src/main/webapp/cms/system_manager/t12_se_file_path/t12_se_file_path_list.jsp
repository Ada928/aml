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
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
<SCRIPT LANGUAGE="JavaScript"> 
function doSubmit(theUrl){
	var num = CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("������ѡ��һ����¼��");
		return false;
	}else{
  		cmsdosubmit(theUrl);
	}
}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
	<html:form method="POST" action="/system_manager/t12_se_file_path/t12_se_file_path_list.do">
		
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�ļ��������� - �� �� </span>
						</td>
						<td align="right">
							<html:button property="add" styleClass="input" value="�� ��"
						onclick="awpDoSubmit('t12_se_file_path_add.do','add')" />
					<html:button property="modify" styleClass="input" value="�� ��"
						onclick="awpDoSubmit('t12_se_file_path_modify.do','modi')" />
					<html:button property="delete" styleClass="input" value="ɾ ��"
						onclick="awpDoSubmit('t12_se_file_path_delete_do.do','del')" />
					<input type="button" name="btsearch2" value="��������"
								onclick="doSubmit('<%=request.getContextPath()%>/cms/businessmanager/t12_programa/t12_programa_generate_index.do?type=file');" />
						
						</td>
					</tr>
				</table>
			</div>
	
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
			

        <!--  
		<TABLE align=center class="condition_outer" width="98%">
			<TBODY>
				<TR>
					<TD class="condition_outer">						
							<table width="100%" id="query_condition">
							
							<tr>
								<td width="15%" align="right">
									������Ŀ��
								</td>
								<td width="45%">
									
								</td>
								<td width="15%" align="right">
									���±��⣺
								</td>
								<td width="25%">
									<html:text property="articlename" size="30" value="" />
								</td>
							</tr>
							
						</table>
					</TD>
				</TR>
			</TBODY>
		</TABLE>
        -->
    
		<div class="awp_list">
			<table>
			<TR align=center>
				<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
				<TD width="10%">
					����
				</TD>
				<TD width="10%">
					���ñ�־
				</TD>
				<!--  <TD width="10%">
					�Ƿ���
				</TD>-->
				<TD width="10%">
					��������
				</TD>
				
				<TD width="10%">
					�ܼ�
				</TD>
				
				<TD width="10%">
					�ĵ�·��
				</TD>
				<TD width="10%">
					�ĵ���������
				</TD>
				<TD width="20%">
					�����ĵ�URL
				</TD>
				<TD width="10%">
					����ʱ��
				</TD>
			</TR>

			<logic:iterate id="t12_se_file_path" name="t12_se_file_pathList"
				type="com.ist.cms.dto.T12_se_file_path">
			<%
				java.util.HashMap map = new java.util.HashMap();
				
				map.put("id", t12_se_file_path.getId());
				pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);

			%>				
				<TR align="center">
					<TD>
					    <html:multibox property="selectedid">
							<bean:write name="t12_se_file_path" property="id" />
						</html:multibox>
					</TD>
					<TD  align="left">
					    <html:link name="map" page="/system_manager/t12_se_file_path/t12_se_file_path_disp.do">
					      <bean:write name="t12_se_file_path" property="des" scope="page" />
					    </html:link>
					</TD>

					<TD>
						<bean:write name="t12_se_file_path" property="flag_disp" scope="page" />
					</TD>
					<!--  <TD>
						<bean:write name="t12_se_file_path" property="isprocess_disp" scope="page" />
					</TD>-->
					<TD>
						<bean:write name="t12_se_file_path" property="block_disp" scope="page" />
					</TD>
					<TD>
						<bean:write name="t12_se_file_path" property="pathlevel_disp" scope="page" />
					</TD>
					<TD  align="left">
						<bean:write name="t12_se_file_path" property="path" scope="page" />
					</TD>
					<TD  align="left">
						<bean:write name="t12_se_file_path" property="filter" scope="page" />
					</TD>
					<TD align="left">
						<bean:write name="t12_se_file_path" property="url" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="t12_se_file_path" property="processdate" scope="page" />
					</TD>
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

</BODY>

</html:html>

