<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
		
			String basefuncurl = url + "/js/basefunc.js";
			
		%>
		<link rel="stylesheet" href=<%=cssurl%> type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
	
		<script language="JavaScript" src=<%=basefuncurl%>></script>
	
	</head>
	<body id="iframecontent">
		<html:form method="post" action="/case/envi_analysis.do">
			<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									�ۼ������
								</td>
								<td><bean:write name="t07_case_feature" property="totalamt_in_str" /></td>
								<td>
								          �ۼ����������
								</td>
								<td><bean:write name="t07_case_feature" property="totalcount_in_str" /></td>
							</tr>
							<tr>
								<td>
									�ۼ�������
								</td>
								<td><bean:write property="totalamt_out_str" name="t07_case_feature" /></td>
								<td>
									�ۼ�����������
								</td>
								<td><bean:write name="t07_case_feature" property="totalcount_out_str" /></td>
							</tr>
							<tr>
								<td>
									����
								</td>
								<td><bean:write property="direction" name="t07_case_feature" /></td>
								<td>
									��������
								</td>
								<td><bean:write property="netamt_str" name="t07_case_feature" /></td>
							</tr>
							<tr>
								<td>
									ƽ�����뼯�жȣ�
								</td>
								<td><bean:write property="avgamt_in_str" name="t07_case_feature" />Ԫ/��</td>
								<td>
									ƽ���������жȣ�
								</td>
								<td><bean:write property="avgamt_out_str" name="t07_case_feature" />Ԫ/��</td>
							</tr>
							<tr>
								<td>
									ƽ�����жȣ�
								</td>
								<td><bean:write property="avgamt_str" name="t07_case_feature" />Ԫ/��</td>
								<td>
									�����ٶȣ�
								</td>
								<td><bean:write property="speed_in_str" name="t07_case_feature" />Ԫ/��</td>
							</tr>
								<tr>
									<td>
										�����ٶȣ�
									</td>
									<td>
										     <bean:write property="speed_out_str" name="t07_case_feature" />Ԫ/��
									</td>
									<td>
										���٣�
									</td>
									<td>
										    <bean:write property="speed_str" name="t07_case_feature" />Ԫ/��
									</td>
								</tr>
						</table>
					</div>
		</html:form>
	</body>
</html>

