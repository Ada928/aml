<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() +  "://"
				+ request.getServerName() + ":" + request.getServerPort() 
				+ path + "/";
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gb2312">
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script language=JavaScript src="../../js/selectbox.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript">
 		var contextPath = "<%=path%>";
    </script> 
	<title>��������ϼ�¼</title>
	<SCRIPT LANGUAGE="JavaScript"> 
	function doSubmit(theUrl){
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	</SCRIPT>
	
</head>
 <!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
<body class="mainbg">
	<html:form action="/hpom/t18_errorlog_list.do" method="post">
	<div id="main">
	<!-- conditions --> 
  		<div class="conditions">
  		<div class="cond_t">
  			<span>��������ϼ�¼</span>
  		</div>

	<!-- ��ѯ���� -->
    
  	<div class="cond_c" id="searchtable"> 
  		<table border="0" cellpadding="0" cellspacing="0">
	  		  <tr>
	            <td>��־���룺</td>
	  		    <td><html:text property="logkey" maxlength="12"/></td>
	  		    <td>������룺</td>
	  		    <td><html:text property="taskkey" maxlength="18"/></td>
		      </tr>
			  <tr>
				<td align="right" nowrap>
					����
				</td>
				<td nowrap>
					<html:select property="sort">
						<html:options collection="sortMap" property="label" labelProperty="value"/>
					</html:select>
					<html:radio property="sort_type" value="asc">����</html:radio>
					<html:radio property="sort_type" value="desc">����</html:radio>
					<html:radio property="sort_type" value="">������</html:radio>
				</td>
				<td></td>
				<td><input type="button" class="in_button1" value="�� ѯ"
						onClick="doSubmit('t18_errorlog_list.do?newsearchflag=1','search');">
				</td>
			 </tr>
	    </table>
    </div>
    </div>
  
	 
	<!-- �����б����� -->
	<div class='list'>
	 	<table>
			<tr align="center">
				<th width="10%" nowrap>��־����</th>
				<th width="10%" align="center">����ʱ��</th>
			    <th width="5%" align="center">�������</th>
				<th width="7%" align="center">�������</th>
				<th width="15%" align="center">ҵ�����</th>
				<th width="50%">��������</th>
				<th width="10%" nowrap> ����ʱ��</th>
				<th width="5%" nowrap> �����</th>
				<th width="20%" nowrap> �������</th>
				<th width="10%" nowrap>���ʱ��</th>
			</tr>
			<logic:iterate id="errorlog" name="t18_errorlogList" type="com.ist.bmp.hpom.dto.T18_errorlog">
			<tr align="center">
			  <td nowrap><bean:write name="errorlog" property="logkey"/></td>
			  <td nowrap><bean:write name="errorlog" property="statisticdate"/></td>
			  <td nowrap><bean:write name="errorlog" property="taskkey"/></td>
			  <td nowrap><bean:write name="errorlog" property="tasktype_disp"/></td>
			  <td nowrap><bean:write name="errorlog" property="businesskey"/></td>
			  <td style="white-space:normal;word-break:break-all;" align="left"><bean:write name="errorlog" property="errdes"/></td>
			  <td nowrap><bean:write name="errorlog" property="errtime"/></td>
			  <td nowrap><bean:write name="errorlog" property="manager_disp"/>��<bean:write name="errorlog" property="manager"/></td>
			  <td nowrap align="left"><bean:write name="errorlog" property="donemethod"/></td>
			  <td nowrap><bean:write name="errorlog" property="donetime"/></td>
		  	</tr>
		  	</logic:iterate>
		</table>
	</div>
	<div class='list_page'>
		<table>
			<tr>
				<td align="center">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</td>
			</tr>
		</table>
	</div>
	</div>
	</html:form>
</body>
</html>