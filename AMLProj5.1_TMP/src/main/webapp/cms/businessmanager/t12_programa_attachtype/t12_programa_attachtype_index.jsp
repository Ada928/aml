<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>业务管理/发布文章</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head> 
 
 
  <frameset rows="*" cols="166,*"   framespacing="0" frameborder="no" border="0" >
    <frame src="<%=path %>/platform/pub/menu_left_tree.do?menu_id=t12_business_programa_attachype_tree" 
    name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame">
    <frame src="cms/businessmanager/t12_programa/t12_programa_main.jsp" name="mainFrame1">
  </frameset>

<noframes><body>

</body></noframes>
</html>
