<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%
	pageContext.setAttribute("ctx",request.getContextPath());
%>
<html>
	<head>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<title>�ļ�����</title>
</head>
<body class="mainbg">
	<div class="conditions">
		<div class="awp_wrap">
		  <!-- �������� -->
		    <div class="cond_t">
			  <span>�ļ�����˵��</span>
			  <span class="buttons">
			    	<a href="#" onclick="window.close()"><img src="../images/<bean:write name="style" scope="session"/>/b_edit.png" />�رմ���</a>
			  </span>
			</div>
		</div>
		<div class="sys_warning">
			<strong><img src="<bean:write name="ctx"/>/images/blue/warning.png" />ϵͳ��ʾ��</strong>
			<br>
			 1����������桱���ļ����ص����ش��̡�<br>
             2�������ȡ������ȡ���������ز�����<br>
             3��������򿪡�ϵͳ��ֱ�Ӵ�Ҫ���ص��ļ���<br>
		</div>
	</div>
	<script language="javascript">
	   setTimeout("window.close()",1*10000);
	</script>
</body>
</html>
		
