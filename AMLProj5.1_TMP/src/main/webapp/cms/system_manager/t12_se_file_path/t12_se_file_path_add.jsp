<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	function checkForm(theUrl){
		    var errMsg ="";
		    if(getLength(document.forms[0].des.value)==0){
		        errMsg+="��������Ϊ�գ�";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].des.value)> 256){
		        errMsg+="�������ܶ���256���ַ���";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].path.value)== 0){
		        errMsg+="�ĵ�·������Ϊ�գ�";
		        document.forms[0].path.focus();
		    }else if(getLength(document.forms[0].path.value)> 100){
		        errMsg+="�ĵ�·�����ܶ���100���ַ���";
		        document.forms[0].path.focus();
		    }else if(getLength(document.forms[0].filter.value)== 0){
		        errMsg+="�ĵ�������������Ϊ�գ�";
		        document.forms[0].filter.focus();
		    }else if(getLength(document.forms[0].filter.value)> 50){
		        errMsg+="�ĵ������������ܶ���50���ַ���";
		        document.forms[0].filter.focus();
		    }else if(getLength(document.forms[0].url.value)> 200){
		        errMsg+="����URL���ܶ���200���ַ���";
		        document.forms[0].url.focus();
		    }  
		    		       
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
	</SCRIPT>
</head>

<body>
	<div id='content'>
		<html:form method="POST"
			action="/system_manager/t12_se_file_path/t12_se_file_path_add.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�ļ��������� - �� ��</span>
						</td>
						<td align="right">
							<html:button property="backbutton" styleClass="input"
								value="��  ��" onclick="awpDoSubmit('t12_se_file_path_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_detail'>

				<TABLE>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>������
						</td>
						<td>
							<input type="text" name="des" size="32">
						</td>
					</tr>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>���ñ�־��
						</td>
						<td>
							<html:select property="flag">
								<html:options collection="flagMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<!--  <tr>
						<td>
							�Ƿ���
						</td>
						<td>
							<html:select property="isprocess">
								<html:options collection="yesNoMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>-->
					<tr>
						<td>
							�������飺
						</td>
						<td>
							<html:select property="block">
								<html:options collection="indexBlockMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>

					<tr>
						<td>
							�ܼ���
						</td>
						<td>
							<html:select property="pathlevel">
								<html:options collection="secLevMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>

					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>�ĵ�·����
						</td>
						<td>
							<input type="text" name="path" size="64">
						</td>
					</tr>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>�ĵ�����������
						</td>
						<td>
							<input type="text" name="filter" size="64">
						</td>
					</tr>
					<tr>
						<td>
							�����ĵ�URL��
						</td>
						<td>
							<html:textarea property="url" cols="60" rows="5">

							</html:textarea>
							<!-- 
									<input type="text" name="url" size="64">
									 -->

						</td>
					</tr>


					<tr>
						<td>
						</td>
						<td>
							<html:button property="button" styleClass="input" value="��  ��"
								onclick="checkForm('t12_se_file_path_add_do.do')" />
							<html:reset styleClass="input" value="��  ��" />
						</td>
					</tr>

				</TABLE>
			</div>
		</html:form>
	</div>
</body>

</html:html>
