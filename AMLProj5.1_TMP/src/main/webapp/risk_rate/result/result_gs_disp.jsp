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
<script language="JavaScript">
function _chengeUrl(url){
   var ifram=document.all.sysrule;
   ifram.src=url;
}
</script>
</HEAD>

<BODY class="mainbg">
	<html:form method="post" action="/result/t37_party_gs_result_uhDisp.do">
    <!-- title -->
<div class="cond_c2">
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									�ͻ����ƣ�
								</td>
								<td>
									<bean:write name="t37_party_result"
										property="party_chn_name" />
								</td>
								<td>
									�ͻ��ȼ���
								</td>
								<td>
									<bean:write name="t37_party_result" 	property="levelkey_disp" />
								</td>
							
							</tr>
								<tr>
							<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t37_party_result" 	property="party_class_cd" />
								</td>
								<td>
									������ʽ���ƣ�
								</td>
								<td>
									<bean:write name="t37_party_result"
										property="gsname" />
								</td>
						
								
							</tr>
						
							<tr>
									<td>
									ϵͳ����ʱ�䣺
								</td>
								<td>
									<bean:write name="t37_party_result"
										property="statistic_dt_disp" />
								</td>
								<td>
									ϵͳ���������
								</td>
								<td>
									<bean:write name="t37_party_result" property="fristappralevel_disp" />
									
								</td>
							</tr>
						
							
							<tr>
							  <td>
									�Ƿ񱻵�����
								</td>
								<td>
									<bean:write name="t37_party_result" property="modify_cd_disp" />
								</td>
								<td>
									�����ȼ���
								</td>
								<td>
											<logic:equal name="t37_party_result" property="modify_cd" value="1">
									<bean:write name="t37_party_result" property="emendationlevel_disp" />
							      </logic:equal>
								</td>
								
						
							</tr>
							
							
							
						</table>
					</div>
		
					<div class="list2">
					   <table border="0" cellpadding="0" cellspacing="1">
						<tr>
						 <th colspan="3">��ʽ��Ϣ</th>
					    </tr>
					    <tr align="center">
						 <td class="st03">��ʽ����</td>
						 <td class="st03">ָ����</td>
						 <td class="st03">ָ��ֵ</td>
					    </tr>
						<logic:iterate id="t37_gs_indicVal" name="t37_gs_indicValList"
					          type="com.ist.aml.risk_rate.dto.T37_party_result">		
					    <tr align="center">
						 <td><bean:write name="t37_gs_indicVal" property="gsname" /></td>
						 <td><bean:write name="t37_gs_indicVal" property="indicname" /></td>
						 <td><bean:write name="t37_gs_indicVal" property="indicval" /></td>
					    </tr>
					   </logic:iterate>
					   </table>
					</div>	
					<div class="conditions">
					<div id="bigTab">		
						<dl class="tabm">
						     <dd class="tabcur">
							    <span onclick="_chengeUrl('<%=request.getContextPath()%>/risk_rate/result/getT37_level_auditList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source" />')">������¼</span>	                       
							</dd>
							
							<dd>
							    <span onclick="_chengeUrl('<%=request.getContextPath()%>/risk_rate/result/getT37_helpcheckList.do?newsearchflag=1&resultkey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>')">Э����Ϣ</span>               
							</dd>
							<dd>
							    <span onclick="_chengeUrl('<%=request.getContextPath()%>/risk_rate/t37_risk_attach/t37_risk_attach_dispList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>')">����</span>               
							</dd>	
						</dl>		
					</div>
					<iframe src="<%=request.getContextPath()%>/risk_rate/result/getT37_level_auditList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source" />" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
					</div>
</html:form>
</BODY>
</html>

