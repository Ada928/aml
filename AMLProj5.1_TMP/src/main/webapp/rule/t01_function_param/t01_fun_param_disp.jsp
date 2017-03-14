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
		<script type="text/javascript" src="../../js/jquery.validator.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript">
			
		</script>
	</head>
	<body class="mainbg">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>������������</span>
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
									<bean:write name="instance" property="paramcd"/>
								</td>
							</tr>
							<tr>	
								<td>
									<span style="color:#FF0000;">*</span>�������ƣ�
								</td>
								<td>
									<bean:write name="instance" property="paramname" />
								</td>
							</tr>
							<tr>
							<td>
								<span style="color:#FF0000;">*</span>�������ͣ�
							</td>
							<td>
							   		<logic:empty name="instance" property="rtntype" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="rtntype" scope="request" value="1">
										�ı�
									</logic:equal>
									<logic:equal name="instance" property="rtntype" scope="request" value="2">
										��ֵ
									</logic:equal>
									<logic:equal name="instance" property="rtntype" scope="request" value="3">
										����
									</logic:equal>
							</td>
							</tr>
							<tr>
							<td>
								<span style="color:#FF0000;">*</span>�������ͣ�
							</td>
							<td>
									<logic:empty name="instance" property="parmtype" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="parmtype" scope="request" value="1">
										����
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="2">
										��Ȼ��
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="3">
										�Թ��ڼ���
									</logic:equal>
									<logic:equal name="instance" property="parmtype" scope="request" value="4">
										��˽�ڼ���
									</logic:equal>
							</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>����ֵ��
								</td>
							
								<td>
									<bean:write name="instance" property="paramval" />
								</td>
								</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>�������ͣ�
								</td>
								<td>
									<logic:empty name="instance" property="basedt" scope="request">
										&nbsp;
									</logic:empty>
									<logic:equal name="instance" property="basedt" scope="request" value="1">
										��������
									</logic:equal>
									<logic:equal name="instance" property="basedt" scope="request" value="2">
										ϵͳ����
									</logic:equal>
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">&nbsp;</span>��ʾ��ţ�
								</td>
								<td>
									<bean:write name="instance" property="dispseq" />
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>�����ˣ�
								</td>
								<td>
									<bean:write name="instance" property="creator" />
								</td>
							</tr>
							<tr>
								<td>
									<span style="color:#FF0000;">*</span>�������ڣ�
								</td>
								<td>
									<bean:write name="instance" property="createdate" />
								</td>
							</tr>
							<logic:notEmpty name="instance" property="modifier" scope="request">
							<tr>
								<td>
									�޸��ˣ�
								</td>
								<td>
									<bean:write name="instance" property="modifier" />
								</td>
							</tr>
							</logic:notEmpty>
							<logic:notEmpty name="instance" property="modifydate" scope="request">
							<tr>
								<td>
									�޸����ڣ�
								</td>
								<td>
									<bean:write name="instance" property="modifydate" />
								</td>
							</tr>
							</logic:notEmpty>
						</table>
					</div>
				</div>
			</div>

	</body>
</html>