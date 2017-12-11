<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" /> 
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		

<script language="JavaScript">

function dosubmit(theUrl) {
		document.forms[0].action = theUrl;
		document.forms[0].submit();
}
</script>
<style type="text/css">
#valmaxid div 
{
   float:left;
    white-space:nowrap;
}

</style>

</head>
<body class="mainbg">

	<html:form method="post" action="/t21_rule/modify_rule_indic.do">
	<div id="main">
		<div class="conditions">
			<div class="cond_t">
						<span> ������Ϣ </span>
						<span class="buttons">
						   <a href="#" onclick="dosubmit('<c:out value="${backUrl}" escapeXml="false"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
						</span>
			</div>
		</div>	
			<html:errors />
			<div class="cond_c2">
					<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td width="15%">
								��������
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="pbc_des" scope="request" />
							</td>
							<td width="15%">
								���㷽ʽ��
							</td>
							<td width="35%">
								<bean:write name="t21_rule" property="gs_type_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								���ͣ�
							</td>
							<td>
								<bean:write name="t21_rule" property="interfacekey_disp" scope="request" />
							</td>
							<td>
								���֣�
							</td>
							<td>
								<bean:write name="t21_rule" property="curr_cd_disp" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								�����ţ�
							</td>
							<td>
								<bean:write name="t21_rule" property="rulekey" scope="request" />
							</td>
							<td>
								�������ƣ�
							</td>
							<td>
								<bean:write name="t21_rule" property="rule_des" scope="request" />
							</td>
						</tr>

						<tr>
							<td>
								Ԥ�����壺
							</td>
							<td>
								<bean:write name="t21_rule" property="party_acct_cd_disp" scope="request" />
							</td>
							<td>
								����������
							</td>
							<td>
								<bean:write name="t21_rule" property="type_des" scope="request" />
							</td>
						</tr>
						<tr>
							<td>
								���ȣ�
							</td>
							<td>
								<bean:write name="t21_rule" property="granulairty_disp" scope="request" />
							</td>
							<td>
								״̬��
							</td>
							<td>
								<bean:write name="t21_rule" property="flag_disp" scope="request" />
							</td>
						</tr>
						

						<tr>
							<td>
								��ʽ��
							</td>
							<td colspan="3" style="white-space:normal;">
									<bean:write name="t21_rule_gs" property="gs_des" scope="request" />
							</td>
						</tr>
					</table>
				</div>
			<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1" id="tableid">
						<TR>
 							 <th>ָ����</th>     
  							 <th>ָ������</th>    
  							 <th>ָ������</th>
 							 <th>�ȽϷ�</th>    
  							 <th>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����ֵ&nbsp;&nbsp;&nbsp;&nbsp;</th> 
  							  <th>ֵ����</th>   
 							    

						</TR>
						
						<logic:iterate id="indic" name="t21_rule_indic_List" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<TR>
								
								
								<TD>
									<bean:write name="indic" property="indickey" />
									<input type="hidden"  name="indickey" id="indickey" value="<bean:write name="indic" property="indickey" />"/>
								</TD>
								<TD>
									<bean:write name="indic" property="indicname" />
								</TD>
								<TD>
									<bean:write name="indic" property="indic_attr"  />
									<input type="hidden"  name="indic_attr" id="indic_attr" value="<bean:write name="indic" property="indic_attr" />"/>
								</TD>
								<TD >
								<%  LinkedHashMap map=(LinkedHashMap)request.getAttribute("valtypeMap");
	                              Iterator iter=map.keySet().iterator();
	                              String typevalue=indic.getValtype();
							%>
									<select name="valtype"  onchange="isShow(this)" disabled="true">
									<% while(iter.hasNext()){
		                                   String key=(String)iter.next();
		                                      String value=(String)map.get(key);
	                                     %>
	                                    <option value="<%=key%>" <% if(key.equals(typevalue)){ %> selected <%} %>><%=value%></option>
						                <%  } %>
									</select>
								</TD>
								
								<TD  >
									<bean:write name="indic" property="valparamin" />
									<% if(typevalue.equals("BETWEEN")){ %>
									<span id="valmaxid"> 
									<%}else{ %>
									<span id="valmaxid" style="display:none"> 
									<%}%>
									-
									<bean:write name="indic" property="valparamax" />
									</sapn>
									
								</TD>
									<TD>
									<bean:write name="indic" property="valnum"  />
								</TD>
								
								     
							</TR>
						</logic:iterate>
					</TABLE>
			</div>
			
			</div>
		
	</html:form>
	
</BODY>
</HTML>
