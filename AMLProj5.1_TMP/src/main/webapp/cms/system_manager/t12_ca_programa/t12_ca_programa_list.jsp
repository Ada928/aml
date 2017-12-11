<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>

		<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>
	</HEAD>
	<BODY>
	<div id='content'>
		<html:form method="post" action="/system_manager/t12_ca_programa/t12_ca_programa_list.do">
					
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">��Ŀ���� - ������</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button property="button2" value="��  ��" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_add.do','add')" />
						<html:button property="button3" value="��  ��" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_modify.do','modi')" />
						<html:button property="button4" value="ɾ  ��" styleClass="input"
							onclick="awpDoSubmit('t12_ca_programa_delete_do.do','del')" />		
						</td>
					</tr>
				</table>
			</div>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle"/>
			</html:messages>
			
			<div class='awp_cond' id="searchtable" style="display:none">
			<TABLE>
				
								<tr>
									<td>������ƣ� 
									</td>
									<td>
										<html:text property="categoryname" styleClass="text_white" size="20" />
									</td>
									<td>
										״̬
									</td>
									<td>
										<html:select property="flag">
					                      <html:options collection="flagMap" property="label" labelProperty="value"/>
					                  	</html:select>	
					                  
									</td>
								</tr>
								<tr>
									<td></td>
									<td></td>
									<td>
									
									</td>
									<td>
										<input type="button" name="button" value="�� ѯ"
											onClick="awpDoSubmit('t12_ca_programa_list.do?newsearchflag=1','search')"
											class="input">
									</td>
								</tr>
							</TABLE>
					</div>
			<div class="awp_list">
			<TABLE>
				<TR align=center>
					<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
					<TD  noWrap>
						�������
					</TD>
					<TD noWrap>
						״̬
					</TD>
					<TD noWrap>
						��ʾ˳��
					</TD>
					<TD  noWrap>
						������
					</TD>
					<TD  noWrap>
						����ʱ��
					</TD>
					<TD noWrap>
						�޸���					
					</TD>
					<TD noWrap>
						�޸�ʱ��
					</TD>					
				</TR>
				<logic:iterate id="t12_ca_programa" name="t12_ca_programaList"
					type="com.ist.cms.dto.T12_ca_programa">
					
					<TR align="center">
						<TD noWrap>						 
							<html:multibox property="selectcategorykey" disabled="false" onclick="changcol(this)">
								<bean:write name="t12_ca_programa" property="categorykey" />
							</html:multibox>						
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="categoryname" scope="page" />
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="flag_disp" scope="page" />
						</TD>
						<TD noWrap>	
								<bean:write name="t12_ca_programa" property="dispseq" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="creator" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="createdate" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="modifier" scope="page" />
						</TD>
						<TD noWrap>	
							<bean:write name="t12_ca_programa" property="modifydate" scope="page" />
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
		</html:form>
		</div>
	</BODY>
</HTML>
