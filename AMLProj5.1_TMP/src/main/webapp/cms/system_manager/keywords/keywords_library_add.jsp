<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://"
                    + request.getServerName() + ":" + request.getServerPort()
                    + path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>ϵͳ����-�ؼ��ֿ�</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	--><script src="<%=request.getContextPath()%>/js/title.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 	
		function dosubmit(theUrl,type){
	      var errMsg = "";
	      var isSub = false;
	      if(type=='adddo'){
	        if(getLength(document.forms[0].keywordtype.value)<=0){
	           errMsg="�ؼ������Ͳ���Ϊ�գ�";
	           document.forms[0].keywordtype.focus();
	        }
	        if(getLength(document.forms[0].keywordname.value)<=0){
	           errMsg="�ؼ������Ʋ���Ϊ�գ�";
	           document.forms[0].keywordname.focus();
	        }	        
	        if(getLength(document.forms[0].keywordname.value)>64){
              errMsg="�ؼ��������ܴ���64���ַ���";
              document.forms[0].keywordname.focus();
              }		        
		    isSub = true;
	      }else if(type=='search'){	        
		    isSub = true;
	      }
	      if(isSub && errMsg==''){
	  	    document.forms[0].action=theUrl;
		    document.forms[0].submit();
	      }else{
		    if(errMsg!='')
		    alert(errMsg);
		    return false;
	      }
	    }

	</SCRIPT>
	</head>

	<body>
	<div id='content'>
		<html:form method="post"
			action="/system_manager/t12_keywords_library/t12_keywords_library_add.do">
			<table width="98%" border="0" align="center" cellpadding="2"
				cellspacing="0">
				<tr>
					<td class="td1">
						<span class="css014"> <strong><font color="0072BC"></font>
						</strong> </span>
					</td>
					<td width="22%" align="right" nowrap class="td2">
											</td>
				</tr>
			</table>
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�ؼ��ֹ��� - �����ؼ���</span>
						</td>
						<td align="right">
							<input type="button" name="Input" value="��  ��"
							onClick="awpDoSubmit('cms/system_manager/t12_keywords_library/t12_keywords_library_list.do?newsearchflag=1','search')" class="input">

						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<TABLE align=center border=1 borderColor=333333 cellPadding=0
				cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
				<TBODY>
					<TR>
						<TD align="center" valign="top"
							style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
							<table width="100%" border="0" cellpadding="1" cellspacing="1">
								<tr bgcolor="ECF3FF">
									<td height="22" align="right" nowrap bgcolor="ECF3FF">
										<font color="#FF0000">*</font>�ؼ����������ͣ�
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="keywordtype" styleClass="select">
						                 <html:options collection="keywordtypeMap" property="label" labelProperty="value"/>
					                  </html:select>
									</td>
								</tr>
								<tr bgcolor="ECF3FF">
									<td width="25%" height="22" align="right" nowrap
										bgcolor="ECF3FF">
										<font color="#FF0000">*</font>�ؼ������ƣ�
									</td>
									<td bgcolor="F6F9FF">
										<html:textarea property="keywordname" cols="60" rows="10"></html:textarea>
										ע����ͬ�Ĺؼ�������֮���Զ��ŷָ���
									</td>

								</tr>
								<tr bgcolor="F6F9FF">
									<td height="22" align="center" bgcolor="ECF3FF">
										&nbsp;
									</td>
									<td bgcolor="F6F9FF">										
										<input type="button" name="button" value="�� ��"
											onClick="dosubmit('cms/system_manager/t12_keywords_library/t12_keywords_library_add_do.do','adddo')" class="input">
										<input type="reset" value="�� ��" class="input">
									</td>
								</tr>
							</table>
						</td>
					</TR>
				</TBODY>
			</TABLE>
		</html:form>
	</body>
</html>
