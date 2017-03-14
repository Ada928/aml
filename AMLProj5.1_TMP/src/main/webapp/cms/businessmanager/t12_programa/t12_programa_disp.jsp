<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
  <HEAD>

<META http-equiv=Content-Type content="text/html; charset=gb2312">
<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    </HEAD>
  <body>
	<div id='content'>
      <html:form action="/businessmanager/t12_programa/t12_programa_busi_list.do" method="post">
       
        <html:hidden  property = "categorykey"/>
   
       <div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">��Ŀ���� - ��Ŀ��ϸ��Ϣ</span>
						</td>
						<td align="right">
						 &nbsp;
						 <logic:equal value="yes" name = "actionByRight">
							  <html:button property="backbutton" value="��  ��" styleClass="input" onclick="awpDoSubmit('t12_programa_busi_list.do','add')"/>
						 </logic:equal> 
						</td>
					</tr>
				</table>
			</div>
		<div class='awp_detail'>	
        <TABLE>
         
                  <tr>
                    <td>��Ŀ���ƣ�</td>
                    <td><bean:write name="t12_programaActionForm"  property="programaname" scope="request"/></td>
                    <td>��Ŀ���</td>
                    <td><bean:write name="t12_programaActionForm"  property="categorykey_disp" scope="request"/></td>
                  </tr>
                  <tr>
                    <td>�������ͣ�</td>
                    <td><bean:write name="t12_programaActionForm"  property="releasetype_disp" scope="request"/></td>
                    <td>��Ŀ״̬��</td>
                    <td><bean:write name="t12_programaActionForm"  property="flag_disp" scope="request"/></td>
                  </tr>
                  <!-- 
                  
                  <tr>
                    <td>��Ŀ��ַ��</td>
                    <td><bean:write name="t12_programaActionForm"  property="programaadd" scope="request"/></td>
                    <td height="20" align="right" bgcolor="ECF3FF">Ĭ��ҳ�����ƣ�</td>
                    <td><bean:write name="t12_programaActionForm"  property="defaultname" scope="request"/></td>
                  </tr>
                   -->
                  <tr>
                    <td>���״̬��</td>
                    <td><bean:write name="t12_programaActionForm"  property="auditstat_disp" scope="request"/></td>
                    <td>�����ˣ�</td>
                    <td><bean:write name="t12_programaActionForm"  property="creator" scope="request"/></td>
                  </tr>
                  <tr>
                    <td>����ʱ�䣺</td>
                    <td><bean:write name="t12_programaActionForm"  property="createdate" scope="request"/></td>
                    <td>�޸��ˣ�</td>
                    <td><bean:write name="t12_programaActionForm"  property="modifier" scope="request"/></td>
                  </tr>
                  <tr>
                    <td>�޸�ʱ�䣺</td>
                    <td><bean:write name="t12_programaActionForm"  property="modifydate" scope="request"/></td>
                    <td>��ע��</td>
                    <td><bean:write name="t12_programaActionForm"  property="des" scope="request"/></td>
                  </tr>
               
        </TABLE></div>
         <div class='awp_dynamic_list'>	   
          <TABLE>
			<TR align=center>
				<TD  noWrap>
				    ����ʾ����
				</TD>
				<TD  noWrap> 
					�д���
				</TD>
				<TD  noWrap> 
					������
				</TD>
				<TD  noWrap>
					�ֶγ���
				</TD>
				<TD  noWrap> 
					�Ƿ��ѯ����
				</TD>
				<TD  noWrap>
					�Ƿ��б���ʾ
				</TD>
				<TD  noWrap>
					�Ƿ���������
				</TD>
				
			</TR>
			<logic:iterate id="t12_programa_cols" name="t12_programa_colsList"
				type="com.ist.cms.dto.T12_programa_cols">
				<TR align="center">
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="colname" scope="page" />
					</TD>
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="colkey" scope="page" />
					</TD>						
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="fieldtype" scope="page" />
					</TD>
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="collength" scope="page" />
					</TD>						
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="iscond_disp" scope="page" />
					</TD>
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="isshow_disp" scope="page" />
					</TD>
					<TD noWrap>
						<bean:write name="t12_programa_cols" property="issort_disp" scope="page" />
					</TD>
				</TR>
			</logic:iterate>
		</TABLE></div>
        
        
      </html:form></div>
      
    </BODY>
</html:html>
