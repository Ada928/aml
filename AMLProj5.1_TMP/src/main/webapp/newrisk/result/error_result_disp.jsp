<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>

</HEAD>

<BODY leftmargin=0 topmargin=0 id="iframecontent">
	<html:form method="post" action="/result/currentT37_party_result.do">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	     <div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td>
								<b><html:errors /></b>
							</td>
						</tr>
					</table>
				</div>
        </div>
	</html:form>
</BODY>
</html>

