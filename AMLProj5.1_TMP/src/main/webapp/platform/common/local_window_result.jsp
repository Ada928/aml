<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
	<body class="mainbg">
<script language="javascript">
   <bean:write name="input_name" scope="request" filter="false"/>
   window.close();
</script>
</body>
</HTML>
