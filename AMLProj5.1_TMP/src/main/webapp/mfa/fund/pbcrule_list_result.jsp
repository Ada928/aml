<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<BODY leftmargin="0" topmargin="0">
<script language="javascript">
   
		parent.location.href='<%=(String)request.getAttribute("url")%>';
   	

</script>
</body>
</HTML>
