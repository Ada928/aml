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
		<script src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/jquery-1.2.3.pack.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
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

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id="main">
			<html:form method="post" action="/t21_indic/t21_indic_disp.do">
			<html:hidden name="t21_indicActionForm" property="mark"/>
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> ָ������ </span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t21_indic_list_release.do');">
							<img src="../../images/blue/b_back.png" />�� ��</a> 
						</span>
					</div>
					<html:errors />
					<div class="cond_c2">

						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<font color="red">*</font>ָ����룺
								</td>
								<td>
									<bean:write name="t21_indic" property="indickey" />
								</td>
								<td>
									<font color="red">*</font>ָ�����ƣ�
								</td>
								<td>
									<bean:write name="t21_indic" property="indicname" />
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>ָ��������
								</td>
								<td colspan="10">
									<bean:write name="t21_indic" property="indecdes"/>
								</td>
								
								
							</tr>
							<tr>
								<td>
									<font color="red">*</font>����Ƶ�ȣ�
								</td>
								<td><bean:write name="t21_indic" property="granularitys_disp"/></td>
								<td><font color="red">*</font>������Σ�</td>
								<td><bean:write name="t21_indic" property="callayer_disp"/></td>
							</tr>
							<tr>
								<td>ָ�����壺</td>
								<td><bean:write name="t21_indic" property="party_acct_cd_disp"/></td>
								<td>
									<font color="red">*</font>ָ����;��
								</td>
								<td>
									<bean:write name="t21_indic" property="use_type_cd_disp"/>
								</td>
							</tr>
							<tr>
								<td>
									ָ�����
								</td>
								<td>
									<bean:write name="t21_indic" property="indictype_disp"/>
								</td>
								<td>
									<font color="red">*</font>ָ�����ͣ�
								</td>
								<td>
									<bean:write name="t21_indic" property="indic_attr_disp"/>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>ָ����ʵ��
								</td>
								<td>
									<bean:write name="t21_indic" property="indic_table"/>
								</td>
								<td>
									<font color="red">*</font>�Ƿ����ã�
								</td>
								<td>
									<bean:write name="t21_indic" property="flag_disp"/>
								</td>
							</tr>
							
							<tr>
								<td>
									<font color="red">*</font>ָ��sql��
								</td>
								<td colspan="3">
									<html:textarea name="t21_indic" property="indic_sel_sql" cols="70" rows="6" ></html:textarea>
								</td>
							</tr>
							
							<tr id="transql">
								<td>
									<font color="red">*</font>ָ�꽻��sql��
								</td>
								<td colspan="3">
									<html:textarea name="t21_indic" property="trans_sel_sql" cols="70" rows="6"></html:textarea>
								</td>
							</tr>
						</table>
					</div>
				</div>

			</html:form>
		</div>
	</BODY>
</HTML>
