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
<BODY id="iframecontent">
	<html:form method="post" action="/result/currentT37_party_result.do">
	<%
	String resulekey=(String)request.getAttribute("resulekey");
	if(resulekey.contains("#")){
		resulekey = resulekey.replace("#","%23");
	}
	%>
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	
		<html:errors />
		<div class="cond_c2">
	 <table cellpadding="0" cellspacing="0">
							<tr  >
								<td>
									�ͻ����ƣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="party_chn_name" />
								</td>
								<td>
									ϵͳ����ʱ�䣺
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="statistic_dt_disp" />
								</td>
							</tr>
							
							<tr>
								<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="party_class_cd" />
								</td>
								<td>
									ϵͳ���������
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="fristappralevel_disp" />
								<html:hidden name="t37_party_resultActionForm"
										property="level_before_adjust" />
								</td>
							</tr>
							<tr>
								<td>
									������ʽ���ƣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsname" />
								</td>
								<td>
									������ʽ��
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsrm" />
								</td>
							</tr>
						</table>
					</div>
					<iframe src="<%=request.getContextPath()%>/newrisk/result/t37_party_gs_resultDisp.do?resulekey=<%=resulekey %>&temptype=<bean:write name="t37_party_resultActionForm" property="temptype" />&statistic_dt_disp=<bean:write name="t37_party_resultActionForm" property="statistic_dt_disp"/>&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
        </div>
	</html:form>
</BODY>
</html>

