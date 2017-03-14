<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<SCRIPT LANGUAGE="JavaScript">


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("������������"); 
	form.focus(); 
	
	}
} 

function checkForm(theUrl){ 
    var errMsg = "";
    var pbckey=document.forms[0].pbckey.value;
    if(getLength(document.forms[0].pbckey.value)==0){
        errMsg+="������벻��Ϊ�գ�";
        document.forms[0].pbckey.focus();
    }
    else if(pbckey.indexOf("-") == -1){
        errMsg+="�������ĺ�׺�����'-'����!";
        document.forms[0].pbckey.focus();
    }
    else if(!pbckey.substring(pbckey.indexOf("-")+1,pbckey.length).match(new RegExp("^[0-9a-zA-z]+$"))){
        errMsg+="��������׺���Ϊ���ֻ���ĸ��";
        document.forms[0].pbckey.focus();
    }
    else if(getLength(pbckey.substring(pbckey.indexOf("-")+1,pbckey.length))>4){
        errMsg+="��������׺��ų��Ȳ��ܳ���4λ!";
        document.forms[0].pbckey.focus();
    }
    else if(getLength(document.forms[0].interfacekey.value)==0){
        errMsg+="��ѡ��ӿ����ͣ�";
        document.forms[0].interfacekey.focus();
    }else if(getLength(document.forms[0].stcrkey.value)==0){
        errMsg+="��ѡ�����п����������룡";
        document.forms[0].stcrkey.focus();
    }else if(getLength(document.forms[0].flag.value)==0){
        errMsg+="��ѡ���Ƿ����ã�";
        document.forms[0].flag.focus();
    }
    else if(getLength(document.forms[0].pbc_des.value)==0){
        errMsg+="�����������Ϊ�գ�";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_des.value)>=200){
        errMsg+="����������ݹ���,�������200�ַ����ڣ�";
        document.forms[0].pbc_des.focus();
    }else if(getLength(document.forms[0].pbc_con.value)==0){
        errMsg+="������������Ϊ�գ�";
        document.forms[0].pbc_con.focus();
    }else if(getLength(document.forms[0].pbc_con.value)>=800){
        errMsg+="�����������ݹ���,�������800�ַ����ڣ�";
        document.forms[0].pbc_con.focus();
    }
    if(errMsg==""){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

</SCRIPT>
	</HEAD>
	<BODY class="mainbg">
		<div id="main">
			<html:form method="post" action="/t21_pbcrule/t21_pbcrule_add.do">
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> ��ӹ��� </span>
						<span class="buttons">
						<a href="#" onclick="dosubmit('t21_pbcrule_list.do')">
 	                       <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a> 
						</span>
							<html:errors/>
					</div>
					
					<div class="cond_c2">

						<table border="0" cellpadding="0" cellspacing="0">
						
						
						<tr>
								<td>
									<div align="right">
										<font color="red">*</font>������룺
									</div>
								</td>
								<td>
								 <html:text property="pbckey" styleClass="text_white"/>
								</td>

								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>�ӿ����ͣ�
									</div>
								</td>
								<td>
									<html:select property="interfacekey">
										<html:options collection="interfaceMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							
							<tr>
								<td>
									<div align="right">
										<font color="red">*</font>���п����������룺
									</div>
								</td>
								<td>
									<html:select property="stcrkey" style="width:200px" onmouseover="FixWidth(this);">
									<html:options collection="stcrMap" property="label"
										labelProperty="value" />
									</html:select>
								</td>
								
								<td bgcolor="F6F9FF" align="left">
									<div align="right">
										<font color="red">*</font>�Ƿ����ã�
									</div>
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
									<html:select  property="gstype">
										<html:options collection="calculateMap" property="label" labelProperty="value"/>
									</html:select>

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
								    <html:textarea rows="3" cols="70"  property="pbc_des" styleId="pbc_des" maxlength="200"></html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									<div align="right">
									<font color="red">*</font>�������� ��
									</div>
								</td>
								<td bgcolor="F6F9FF" align="left" colspan="3">
									<html:textarea rows="4" cols="70"  property="pbc_con" styleId="pbc_con" maxlength="800"></html:textarea>
									<br>
								</td>
							</tr>
	
							<tr>
							<td></td>
							<td colspan="4" align="center" class="in_button">
								<html:button property="button" styleClass="input" value="�� ��"
									onclick="checkForm('t21_pbcrule_add_do.do')" />
								<html:reset styleClass="input" value="�� ��" />
							</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="sys_warning">
			    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />��ʾ��</strong>
				<p>
				  1���������淶�����б�� + ������� + "-" + ��ţ��磺CPKY-1001�� <br/>
				
				</p>
			  </div>
			</html:form>
		</div>
	</BODY>
</HTML>
