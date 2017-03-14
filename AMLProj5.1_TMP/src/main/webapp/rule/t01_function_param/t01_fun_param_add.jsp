<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<jsp:useBean id="authBean" class="com.ist.common.AuthBean"
	scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<link id="skincss"
			href="../../css/aml_<bean:write name="style" scope="session"/>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/jquery.validator.js"></script>
		<script type="text/javascript">
			function doSubmint(){
				if(jQuery(document.forms[0]).validateAll()){
					document.forms[0].action="t01_fun_param_add_do.do";
					document.forms[0].submit();
				}else{
					return;
				}	
			}
		</script>
	</head>
	<body class="mainbg">
		<html:form action="/t01_fun_param/t01_fun_param_add_do.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>�����������</span>
						<span class="buttons"> <a href="t01_fun_param_list.do?newsearchflag=1"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��
								��</a> </span>
					</div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>�������룺
								</td>
								<td>
									s_<html:text property="paramcd" styleClass="text_white" size="40" 
									require="true" datatype="require"  msg="�������벻��Ϊ��"/>
								</td>
								<td>
									<span style="color:#FF0000;">*</span>�������ƣ�
								</td>
								<td>
									<html:text property="paramname" styleClass="text_white" size="40" 
									require="true" datatype="require"  msg="�������Ʋ���Ϊ��"/>
								</td>
							</tr>
							<tr>
							<td>
								<span style="color:#FF0000;">*</span>�������ͣ�
							</td>
							<td>
								<html:select property="rtntype" require="true" datatype="require"  msg="�������Ͳ���Ϊ��">
									<html:options collection="rtntypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td>
								<span style="color:#FF0000;">*</span>�������ͣ�
							</td>
							<td>
								<html:select property="parmtype" require="true" datatype="require"  msg="�������Ͳ���Ϊ��">
									<html:options collection="paramtypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>����ֵ��
								</td>
							
								<td>
									<html:text property="paramval" styleClass="text_white" size="40" 
									require="true" datatype="require"  msg="����ֵ����Ϊ��"/>
								</td>
								<td>
									<span style="color:#FF0000;">*</span>�������ͣ�
								</td>
								<td>
									<html:select property="basedt"  require="true" datatype="require"  msg="�������Ͳ���Ϊ��">
										<html:options collection="basedtMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">&nbsp;</span>��ʾ��ţ�
								</td>
								<td>
									<html:text property="dispseq" styleClass="text_white" size="40" 
									require="false" datatype="integer|range"  min='-99999' max='99999' msg="��ʾ��ű���Ϊ-99999��99999֮�����������"/>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									&nbsp;
								</td>	
							</tr>
							<tr>
								<td colspan="4"  align="center" class="in_button">
									<html:reset  value="�� ��" />
									<html:button property="button" value="�� ��" onclick="doSubmint();" />
								</td>		
							</tr>
						</table>
					</div>
				</div>
			</div>
		</html:form>
	</body>
</html>