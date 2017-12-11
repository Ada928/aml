<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function CheckNumber(form) { 
	if (form.value.match(new RegExp("^[0-9]+$"))){ 
	form.focus();
	} else{
	alert("������������"); 
	}
} 

function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].interfacekey.value)==0){
        errMsg+="�ӿ����Ͳ���Ϊ�գ�";
        document.forms[0].interfacekey.focus();
    }else if(getLength(document.forms[0].interfacekey.value>=4)){
		 errMsg+="�ӿ�������������";
        document.forms[0].interfacekey.focus();
	}else if(getLength(document.forms[0].pbc_des.value)==0){
        errMsg+="�����������Ϊ�գ�";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_des.value)>=200){
        errMsg+="�������������";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_con.value)==0){
        errMsg+="������������Ϊ�գ�";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].pbc_con.value)>=800){
        errMsg+="��������������";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].flag.value)==0){
        errMsg+="�Ƿ����ò���Ϊ�գ�";
        document.forms[0].flag.focus();
    }
    if(errMsg==""){
 //       selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}
</script>
	</HEAD>

	<BODY leftmargin=0 topmargin=0>
		<div id="main">
			<html:form method="post"
				action="/t21_pbcrule/t21_pbcrule_modify.do">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>�������޸� </span>
						<span class="buttons"> 
						<a href="#" onclick="dosubmit('t21_pbcrule_list.do')">
<img src="../../images/<%=session.getAttribute("style")%>/b_back.png" />��  ��</a>
						 </span>
					</div>
					<html:errors />
					<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
									<font color="red">*</font>������룺
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="pbckey" styleClass="text_white"
											size="20" readonly="true" />
										<html:img border="0" page="../../images/lock.jpg"
											align="absmiddle" alt="���ݲ������� ��"></html:img>
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
									<font color="red">*</font>�ӿ����ͣ�
									</div>
								</td>
								<TD bgcolor="F6F9FF">
									<div align="left">
									<html:select property="interfacekey">
										<html:options collection="interfaceMap" property="label"
											labelProperty="value" />
									</html:select>
									</div>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>���п����������룺
								</td>
								<td>
									<html:select property="stcrkey" style="width:200px" onmouseover="FixWidth(this);">
									<html:options collection="stcrMap" property="label"
										labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>�Ƿ����ã�
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
									<font color="red">*</font>���㷽ʽ��
								</td>
								<td>
									<html:select  property="gstype" disabled="true">
										<html:options collection="calculateMap" property="label" labelProperty="value"/>
									</html:select>
                                    <html:img  border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������޸�"></html:img>
								</td>
							   <td>
									<font color="red">*</font>�Ƿ��н��ף�
								</td>
								<td>
									<html:select property="istrans">
										<html:options collection="trans_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							</tr>
							<tr>
							    
								<td>
									<font color="red">*</font>������ࣺ
								</td>
								<td>
									<html:select property="pbctype">
										<html:options collection="pbctypeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<td>
										���ɽ�����Ϊ���룺
								</td>
								<td>
								      <html:text property="actioncode" styleClass="text_white" maxlength="8"/>
									<a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t21_actioncodeLocation','radio','forms[0]','actioncode','');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								</td>
							</tr>
							<tr>
							    <td>
										���ڸ߼�ģ�ͣ�
								</td>
								<td>
									<html:radio  property="moduleflag" value="1">��</html:radio>
			                        <html:radio  property="moduleflag" value="0">��</html:radio>
								</td>
								
								<td>
									�Ƿ����Թ���
								</td>
								<td>
									<html:radio  property="suxflag" value="1">��</html:radio>
			                        <html:radio  property="suxflag" value="0">��</html:radio>
								</td>
							</tr>
							<tr>
							    <td>
										�����ʽ����磺
								</td>
								<td>
									<html:radio  property="is_model" value="1">��</html:radio>
			                        <html:radio  property="is_model" value="0">��</html:radio>
								</td>
								
								<td>
									�����γɰ�����
								</td>
								<td>
									<html:radio  property="is_case" value="1">��</html:radio>
			                        <html:radio  property="is_case" value="0">��</html:radio>
								</td>
							</tr>
							
							
							<tr>
							   <td>
									<div align="right">
										<font color="red">*</font>���������
									</div>
								</td>
								<td colspan="3">
								    <html:textarea rows="3" cols="70"  property="pbc_des" styleId="pbc_des"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>�������� ��
								</td>
								<td bgcolor="F6F9FF" align="left" colspan="3">
									<html:textarea rows="5" cols="70"  property="pbc_con" styleId="pbc_con"></html:textarea>
									<br>
								</td>
							</tr>
							<tr>    <td></td>
									<td colspan="4" align="center" class="in_button">
										<html:button property="button" styleClass="input" value="�� ��"
											onclick="checkForm('t21_pbcrule_modify_do.do')" />
										<html:reset styleClass="input" value="�� ��" />
									</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
