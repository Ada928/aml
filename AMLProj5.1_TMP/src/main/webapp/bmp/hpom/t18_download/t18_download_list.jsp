<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">		
		<script language="JavaScript"  src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
	    <script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
		
		function dosubmit(theUrl,type){
		    var errMsg = "";//��ʾ��Ϣ
		    var isSub = false;//ȷ�ϲ���
		    if (type=='pass') {
		    	 errMsg = CheckBoxMustChecked(document.forms[0]);
		    	 if(errMsg==''){
		             if(confirm('ȷ��Ҫͨ����ѡ�������������')){
		                 isSub = true;
		             }
		         }
			}else if (type=='search' ) {
				isSub = true;
			}
			else if (type=='nopass') {
				errMsg = CheckBoxMustChecked(document.forms[0]);
		    	 if(errMsg==''){
		             if(confirm('ȷ��Ҫ�˻���ѡ�������������')){
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
		</SCRIPT>
	</HEAD>
	<BODY>
	<div id='content'>
		<html:form action="/hpom/t18_download/t18_mydownload_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">�������
								- �б�</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2"
								value="��  ��" onclick="btnDisplayHidden(this, 'searchtable')" /> 
							<input
								type="button" name="btsearch2" value="��  ��"
								onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/t18_download/t18_download_audit_cond.do','nopass');" />
							<input
								type="button" name="btsearch2" value="���ͨ��"
								onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/t18_download/t18_download_audit.do','pass');" />
							
						</td>
					</tr>
				</table>
			</div>



			<div class='awp_cond' id="searchtable" style="display:none">
				<TABLE>

					<tr>
<%--						<td>���ر��룺</td>--%>
<%--						<td>--%>
<%--							<html:text property="dloadkey" styleClass="text_white"--%>
<%--								size="30" />--%>
<%--						</td>--%>
						<td>�������ƣ�</td>
						<td>
							<html:text property="dloadname" styleClass="text_white"
								size="30" />
						</td>
						<td>�������ͣ�</td>
						<td>
							<html:select property="dloadtype">
								<html:options collection="dloadtypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					

					<tr>

						<td></td>
						<td></td>
						<td></td>
						<td><input type="button" name="button" value="�� ѯ"
							onClick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/t18_download/t18_download_list.do?newsearchflag=1','search')" class="input">
						</td>
					</tr>
				</TABLE>
			</div>
			<div class="awp_list">
				<TABLE>
					<TR align=center>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
						<TD noWrap>���ر���</TD>
						<TD noWrap>��������</TD>
						<TD noWrap>��������</TD>
						<TD noWrap>���״̬</TD>
						<TD noWrap>������</TD>
						<TD noWrap>����ʱ��</TD>
						<TD noWrap>����˵��</TD>

					</TR>

					<logic:notEmpty name="t18_downloadList">
						<logic:iterate id="dto" name="t18_downloadList"
							type="com.ist.common.download.dto.T18_download">
							<TR align="center">
								<TD noWrap>
									<html:multibox property="selectdloadkey">
										<bean:write name="dto" property="dloadkey" />
									</html:multibox>
								</TD>
								<TD noWrap><bean:write name="dto" property="dloadkey" /></TD>
								<TD noWrap><bean:write name="dto" property="dloadname" /></TD>
								<TD noWrap><bean:write name="dto" property="dloadtype_disp" /></TD>
								<TD noWrap><bean:write name="dto" property="auditstat_disp" /></TD>
								<TD noWrap><bean:write name="dto" property="appname_disp" /></TD>
								<TD noWrap><bean:write name="dto" property="apptime" /></TD>
								<TD align="left"><bean:write name="dto" property="appdesc" /></TD>

							</TR>
						</logic:iterate>
					</logic:notEmpty>
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
</HTML>
