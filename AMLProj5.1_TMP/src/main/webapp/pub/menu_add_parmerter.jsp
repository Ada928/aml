<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%--
���˵�Ϊ���õĲ˵���ʾ����
��Ҫ�Ӻ�̨�õ����²���
menuList ArrayList���󣬷�װ com.ist.common.menu.Menu���ݣ�Ϊ��ʾ�Ĳ˵�����
--%>
<html:html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>������˵�</title>
<%@ include file="../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
			<link 
			href="<%=request.getContextPath()%>/skin/<%=style %>/css/dtreeStyle.css"
			rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
<script language="javascript" src="../js/basefunc.js"></script>
<script type="text/javascript"src="../js/MzTreeView.js"></script>

			
<SCRIPT LANGUAGE="JavaScript"> 	
		
		function reload()
		{
		  document.getElementById('Submit3').click();
		}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<div align="left">
	<form id="xform" name="xform" method="post" action="" target="<bean:write name="target" scope="request" filter="false" />">
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle"/>
		</html:messages>
	    
		<table width="100%" border="0">
		  <tr align="center">
		    <td width="47%" align="center">
		      <input type="button" name="Submit3" id="Submit3" value=".....ˢ   ��....." class="text_white" onClick="javascript:window.location.reload();">
		    </td>
		    <td width="53%">&nbsp; </td>
		  </tr>
		</table>
	
	<script language="javascript">
	var tree = new MzTreeView("tree");
	tree.setIconPath("../images/mztree/");
	tree.setTarget("<c:out value="${target}"/>");
	<c:forEach var="menu" items="${menuList}">
	tree.nodes["<c:out value="${menu.parent_id}"/>_<c:out value="${menu.id}"/>"]="text:<c:out value="${menu.name}"/>;url:<c:out value="../${menu.url}" escapeXml="false"></c:out>&treekey=<c:out value="${menu.id}"/>&parentid=<c:out value="${menu.parent_id}"/>;";
	</c:forEach>

	document.write(tree.toString()); 
	</script>
</form>
</div>
</body>

</html:html>
