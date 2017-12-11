<%@ page contentType="text/html; charset=GBK"%>
<%@page import="com.ist.platform.dto.T11_BlackList_Cust"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.T47_party"%>
<html:html>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />	
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script language="JavaScript" src="../../js/title.js"></script>
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
</HEAD>
<BODY leftmargin=0 topmargin=0 class="mainbg">
<div id="main">
	<html:form method="post" action="/list/getDetailBlackCustInfo.do">
	<div class="conditions">
				<div class="cond_t">
					<span>�ͻ�������-��ϸ��Ϣ</span>
				
				<span class="buttons">				
					<a href="#" onclick="window.close()"><img src="../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
				</span>
				</div>
		
		<html:hidden property="party_id" />
		
		<html:errors />
					<%
						T11_BlackList_Cust cust = (T11_BlackList_Cust)request.getAttribute("cust");
					 %>
		 <div class="cond_c">
		  				<span><b>�ͻ���Ϣ-<font color="#FF0000">�ÿͻ�Ϊ���пͻ�</font></b></span>
		 </div>
					
		 <div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
							<tr >
								<td width="23%" height="22" align="right" >
									�ͻ�ID��
								</td>
								<td width="24%" >
									<%=cust.getParty_id() %>
								</td>
								<td width="13%" height="22" align="right" >
									�ͻ����ƣ�
								</td>
								<td width="40%" >
									<%=cust.getParty_name() %>
								</td>
							</tr>
							<tr >
								<td height="22" align="right" >
									֤�����룺
								</td>
								<td height="22" >
									<%=cust.getCard_no() %>
								</td>
								<td height="22" align="right" >
									����ʱ�䣺
								</td>
								<td height="22" >
									<%=cust.getCreate_dt_display() %>
								</td>
							</tr>
						</table>
		</div>
		
	    <div class="cond_c">
		  				<span><b>ƥ��ĺ������ͻ�</font></b></span>
		</div>
	
		<div class="list">
			<table>
			<tr>
				<th>
					�������ͻ�ID
				</th>
				<th>
					ԭ��
				</th>
				<th>
					��������
				</th>
				<th>
					Ӣ������
				</th>
				<th>
					���
				</th>
				<th>
					��������
				</th>
				<th>
					֤������
				</th>
				<th>
					������Դ
				</th>
				<th>
					����ʱ��
				</th>
			</tr>
			
			<logic:present name="blackList">
				<logic:iterate id="result" name="blackList"
					type="com.ist.platform.dto.T11_Cust_BlackList">
					<tr>
						<td>
							<a href='#' onclick="window.open('http://<%=request.getAttribute("lip_uri") %>/lip/disp.do?party_id=<bean:write name="result" property="cust_id" />&tablecode=10000')"><bean:write name="result" property="cust_id" /></a>
						</td>
						<td>
							<bean:write name="result" property="cust_name_s" />
						</td>
						<td>
							<bean:write name="result" property="cust_name_c" />
						</td>
						<td>
							<bean:write name="result" property="cust_name_e" />
						</td>
						<td>
							<bean:write name="result" property="cust_name_so" />
						</td>
						<td>
							<bean:write name="result" property="cust_name_o" />
						</td>
						<td>
							<bean:write name="result" property="card_no" />
						</td>
						<td>
							<bean:write name="result" property="list_source" />
						</td>
						<td>
							<bean:write name="result" property="create_dt_display" />
						</td>
					</tr>
				</logic:iterate>
			</logic:present>
		</table>
		</div>
		</div>
</html:form>
</div>
</BODY>
</html:html>

