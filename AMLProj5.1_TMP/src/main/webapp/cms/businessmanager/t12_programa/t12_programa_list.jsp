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
	<script src="<%=request.getContextPath()%>/js/basefunc_report.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
		/** �ж������������Ϊϵͳ ���������ݱ����***/
function checkReleasetype(theUrl){
	var num = CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("����ѡ��һ����¼");
		return false;
	}else{
  		var checkbox = document.forms[0].selectprogramakey;
  		if (!checkbox.length) {
		  	checkbox = new Array(checkbox);
		}
       	for (var i=0; i < checkbox.length; i++) {
       		var oCheck = checkbox[i];
           	//�����ѡ������
           	if (oCheck.checked) {
              var state = document.getElementsByName("releasetypes")[i].value;//�·�״̬
              if(state == '3'){//���ϵͳ����
                alert("ϵͳ�ڷ���������Ȩ�޹������!");
                return false;
              }
           }
         }
	  }
	  //�ύ
	   document.forms[0].action=theUrl;
       document.forms[0].submit();
}
	
	</SCRIPT>
</HEAD>

<BODY>
	<div id='content'>
		<html:form method="POST"
			action="/businessmanager/t12_programa/t12_programa_busi_list.do">
			<html:hidden property="categorykey" />
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">��Ŀ���� - <bean:write
									name="categoryname" ignore="true" /> - ��Ŀ�б� </span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<!-- 
						<html:button property="button3" value="��  ��" styleClass="input"
							onclick="permitSingleSelect('t12_programa_busi_modify.do','modi')" />
						<html:button property="button4" value="�����ɫ" styleClass="input"
									onclick="permitSingleSelect('t12_programa_busi_role.do','modi')" />
		 				-->
							<html:button property="button4" value="Ȩ�޹���" styleClass="input"
								onclick="checkReleasetype('t12_programa_busi_power.do')" />
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
							��Ŀ���ƣ�
						</td>
						<td>
							<html:text property="programaname" styleClass="text_white"
								size="30" />

						</td>
						<td>
							�������ͣ�
						</td>
						<td >
							<html:select property="releasetype">
								<html:options collection="releasetypeMap" property="label"
									labelProperty="value" />
							</html:select>
							
						</td>
					</tr>
					<tr>
						<td></td>
						<td></td><td></td>
						<td>
							<input type="button" name="button" value="�� ѯ"
								onClick="awpDoSubmit('t12_programa_busi_list.do?newsearchflag=1','search')"
								class="input">
						</td>
						
						
					</tr>

				</TABLE>
			</div>
			<div class="awp_list">
				<TABLE>
					<TR>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
						<td align="center" nowrap>
							��Ŀ����
						</TD>
						<td align="center" nowrap>
							��������
						</TD>
						<td align="center" nowrap>
							����ʱ��
						</TD>
						<td align="center" nowrap>
							���״̬
						</TD>
						<td align="center" nowrap>
							����
						</TD>
					</TR>

					<logic:iterate id="t12_programa" name="t12_programaList"
						type="com.ist.cms.dto.T12_programa">
						<%
								java.util.HashMap dispMap = new java.util.HashMap();
								dispMap.put("programakey", t12_programa.getProgramakey());
								dispMap.put("auditstat", t12_programa.getAuditstat());
								dispMap.put("categorykey", t12_programa.getCategorykey());
								dispMap.put("isstructure",t12_programa.getIsstructure());
								pageContext.setAttribute("dispMap", dispMap,
								PageContext.PAGE_SCOPE);
						%>
						<TR>
							<td align="center" nowrap>
								<logic:notEqual value="1" name="t12_programa"
									property="auditstat">
									<html:multibox property="selectprogramakey" disabled="false"
										onclick="changcol(this)">
										<bean:write name="t12_programa" property="programakey" />
									</html:multibox>
								</logic:notEqual>
								
								<logic:equal value="1" name="t12_programa" property="auditstat">
									<html:multibox property="selectprogramakey" disabled="true"
										onclick="changcol(this)">
										<bean:write name="t12_programa" property="programakey" />
									</html:multibox>
								</logic:equal>
								
							</TD>
							<input type="hidden" name="releasetypes" value="<bean:write name="t12_programa" property="releasetype" />"/>
							<td align="center" nowrap>
								<html:link name="dispMap"
									page="/businessmanager/t12_programa/t12_programa_busi_disp.do">
									<bean:write name="t12_programa" property="programaname"
										scope="page" />
								</html:link>
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="releasetype_disp"
									scope="page" />
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="createdate"
									scope="page" />
							</TD>
							<td align="center" nowrap>
								<bean:write name="t12_programa" property="auditstat_disp"
									scope="page" />
							</TD>

							<td align="center" nowrap>
								<logic:equal value="1" name="t12_programa" property="auditstat">
									<html:link name="dispMap"
										page="/businessmanager/t12_programa/t12_programa_busi_auditstat.do">
							 ����
						   </html:link>
								</logic:equal>

								<logic:notEqual value="1" name="t12_programa"
									property="auditstat">
									<html:link name="dispMap"
										page="/businessmanager/t12_programa/t12_programa_busi_role.do">
							 ͨ��
						   </html:link>
								</logic:notEqual>
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

