<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../../js/basefunc.js"></script>
	<script language="JavaScript">
		
		function checkForm(theUrl){
		    var errMsg ="";
		   
		    if(getLength(document.forms[0].categoryname.value)==0){
		        errMsg+="������Ʋ���Ϊ�գ�";
		        document.forms[0].categoryname.focus();
		    }else if(getLength(document.forms[0].categoryname.value)>64){
		        errMsg+="������Ʋ��ܴ���64���ַ���";
		        document.forms[0].categoryname.focus();
		   }else if(getLength(document.forms[0].dispseq.value)==0){
		        errMsg+="��ʾ˳����Ϊ�գ�";
		        document.forms[0].dispseq.focus();
		    }else if(getLength(document.forms[0].dispseq.value)>10){
		        errMsg+="��ʾ˳���ܶ���10���ַ���";
		        document.forms[0].dispseq.focus();
		    }
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
	</script>
</HEAD>
<BODY>
	<div id='content'>
		<html:form method="post"
			action="/system_manager/t12_ca_programa/t12_ca_programa_modify_do.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">��Ŀ���� - �� ��</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="��  ��"
								styleClass="input" onclick="awpDoSubmit('t12_ca_programa_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='awp_detail'>
				<TABLE>
					<html:hidden property="categorykey" />
					<tr>
						<td>
							<font color="#FF0000">*</font>������ƣ�
						</td>
						<td>
							<html:text property="categoryname" styleClass="text_white"
								size="40" maxlength="64" />
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>״̬��
						</td>
						<td>
							<html:select property="flag">
								<html:options collection="flagMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>��ʾ˳��
						</td>
						<td>
							<html:text property="dispseq" styleClass="awp_intnumber" size="10" />
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>

							<html:button property="button" styleClass="input" value="�� ��"
								onclick="checkForm('t12_ca_programa_modify_do.do')" />
							<html:reset styleClass="input" value="�� ��" />
						</td>
					</tr>

				</TABLE>
			</div>
		</html:form>
	</div>
</BODY>
</html:html>
