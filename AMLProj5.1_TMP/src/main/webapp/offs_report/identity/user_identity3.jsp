<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		
		<script language="JavaScript">
			<!--
			function dosubmit(theUrl){
			var errMsg = "";
				 if(errMsg!=''){
			        alert(errMsg);
			        return false; 
			         }
			   document.forms[0].action=theUrl;
			   document.forms[0].submit();
			}
			function checkNum(obj){
				var str=myTrim(obj.value);
				if(str==null || str.length==0){
					obj.value=str;
				}else{
					if(str.match(/\D/)==null){
						obj.value=Math.floor(str)
					}else{
						alert("��������ȷ������!");
						obj.focus();
						obj.value=obj.value;
					}
				}
			}
			function   myTrim(str)   
		    {     
		          if(str.replace(/\s/g,"").length==0){
		          	str="";
		          } else{
		          	str=str.replace(/(^\s*)|(\s*$)/g, "");
		          }
		          return  str;
		    }
			// -->
	</script>
	</HEAD>
		<body class="mainbg">
		<div id="main">
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/identity/t07_user_identityAdd_do.do" method="post">
		<div class="conditions">
			    <!-- title -->
				<div class="cond_t">
		
				
						<span> �ͻ����ͳ��-�漰���ɽ���ʶ�����
						</span>
					 <span class="buttons">
					
					<%if(request.getAttribute("editflag").equals("edit") || request.getAttribute("editflag").equals("add")){ %>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=0");'><img src="../../images/<%=session.getAttribute("style") %>/b_draft.png" />�� ��</a>
					<a href="#" onclick='dosubmit("t07_user_identityAdd_do.do?status_cd=1");' ><img src="../../images/<%=session.getAttribute("style") %>/b_complete.png" />�� ��</a>
					<%}else{ %>
					<!-- <a href="#" onclick='dosubmit("gett07_user_identity_xls.do");'> -->
					<a href="#" onclick="dosubmit('exportT07_user_identitylist.do');">
					<img src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />����Excel</a>
					<%} %>
					<a href="#" onclick="history.back();"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
					</span>
			  </div>
			<html:errors />
			
			<input type="hidden" name="editflag" value="<%=request.getAttribute("editflag")%>">
			<input type="hidden" name="identitykey" value="<%=request.getAttribute("identitykey")%>">
			<input type="hidden" name="identitytype" value="3">
			<html:hidden property="organkey"/>
			 <div class="cond_c3">
			<table border="0" cellspacing="3" cellpadding="0">
			<tr><td COLSPAN=2  align=center><h4>���ڻ����ͻ����ʶ��ͳ�������</h4></td></tr>
			<tr><td COLSPAN=2  align=center><h4>���漰���ɽ���ʶ�������</h4></td></tr>
			<tr><td  align=left>&nbsp;&nbsp;���λ��<html:text property="organName" styleClass="tt"/></td>
				<td align=right><html:text property="startyear" size="5" styleClass="tt"/>��<html:text property="startseason" size="5" styleClass="tt"/>����&nbsp;&nbsp;</td></tr>
			<tr><td COLSPAN=2 align=right>��λ  ��&nbsp;&nbsp;</td></tr>
			<tr><td COLSPAN=2 valign=top>
			<div class="list2 biglist">
				<table border="0" cellspacing="1" cellpadding="0">
				<tr align=center ><TH colspan=2>�½���ҵ���ϵ���ṩһ���Է�����ʶ���</TH>
						<TH colspan=2>�ͻ��������ʶ���з��ֵ�</TH>
					</tr>
					<tr>
						<TH>�½�ҵ�������</TH>
						<TH>�޶�����һ���Է��������</TH>
						<TH>�ͻ���ݿ�����</TH>
						<TH>�ͻ�������Ϊ������</TH>
					</tr>
					<tr align=center>
						<td><html:text onblur="checkNum(this)" property="business_alert" maxlength="15"/></td>
						<td><html:text onblur="checkNum(this)" property="service_alert" maxlength="15"/></td>
						<td><html:text onblur="checkNum(this)" property="degree_alert" maxlength="15"/></td>
						<td><html:text onblur="checkNum(this)" property="trade_alert" maxlength="15"/></td>
					</tr>
				</table>
				</div>
			</td></tr>
			<tr></tr>
			</table>
			</div>
			</div>
		</html:form>
		</div>
	</body>
</html>