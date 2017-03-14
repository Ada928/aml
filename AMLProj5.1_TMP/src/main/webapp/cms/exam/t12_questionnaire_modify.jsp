<%@ page contentType="text/html; charset=GBK"%>
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

		<title></title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="<%=path%>/js/basefunc.js"></script>

		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, action){
	    var errMsg = "";
	    var isSub = false; 
	    
	    if(action === 'modify'){
	    	//����ļ�����
	    	var title = document.getElementsByName('title')[0];
	    	if(trim(title.value)===''){
	    		errMsg+="����д�ʾ����ƣ�";
	    	}else if(getLength(title.value)>2000){
	    		errMsg+='�ʾ����Ʋ��ܳ���2000���ַ���';
	    	}else{
	    		isSub = true;
	    	}
	    	//����ʾ�����
	    	/*
	    	if(document.getElementsByName('type')[0].value===''){
	    		errMsg+='��ѡ���ʾ����ͣ�';
	    	}else{
	    		isSub = true;
	    	}
	  		  */
	    }
	    if(action === 'back'){
	    	document.getElementsByName('title')[0].value='';
	    	document.getElementsByName('questiontype')[0].value='';
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
	
	function newTimu(url,subjecttype){
	 	sForm = document.forms[0];
	    sForm.subjecttype.value = subjecttype;
	  	sForm.action = url;   
	    sForm.submit();
	}
	
	function delTimu(url,subjectkey)
	{ 
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectkey;
	    if(window.confirm('ȷ��Ҫɾ����Ŀ��')){
	    	sForm.action = url;   
	    	sForm.submit();
	    }
	    return;
	}
	function updTimu(url,subjectkey,typeId){	
	    sForm = document.forms[0];
	    sForm.subjectkey.value = subjectkey;
	    sForm.subjecttype.value = typeId;
	  	sForm.action = url;   
	    sForm.submit();
	}
	</script>
	</head>

	<body>
		<div id='content'>
			<html:form action="/t12_questionnaire_add_do.do" method="post">
				<html:hidden property="flag" />
				<html:hidden property="createtime" />
				<html:hidden property="creator" />
				<input type="hidden" name="questionkey"
					value="<c:out value="${t12_questionnaire.questionkey}" />" />
				<input type="hidden" name="questiontype"
					value="<c:out value="${t12_questionnaire.questiontype}" />" />
				<!-- �������� -->
				<input type="hidden" name="subjecttype" value="" />
				<input type="hidden" name="subjectkey" value="" />
				<!-- ������Դ E-������Դ���޸�ҳ�� N������Դ�����ҳ��-->
				<input type="hidden" name="fromOpt" value="E" />
				<input type="hidden" name="backurl"
					value="cms/t12_questionnaire_modify.do" />

				<div class='awp_title'>

					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">�ʾ����-�ʾ���ƹ���-�޸�</span>
							</td>
							<td align="right">
								<html:button property="Button55" value="������ѡ��"
									onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','1')"
									styleClass="input" />
								<html:button property="Button55" value="������ѡ��"
									onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','2')"
									styleClass="input" />
								<html:button property="Button55" value="���������"
									onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','3')"
									styleClass="input" />
								<html:button property="Button55" value="�����ʴ���"
									onclick="newTimu('cms/t12_test_question_add.do?newsearchflag=1','4')"
									styleClass="input" />
								<html:button property="Button55" value="�� ��"
									onclick="dosubmit('cms/t12_questionnaire_list.do?newsearchflag=1','back')"
									styleClass="input" />

							</td>
						</tr>
					</table>
				</div>

				<logic:messagesPresent message="true">
					<html:messages id="msg" message="true">
						<bean:write name="msg" filter="false" />
					</html:messages>
				</logic:messagesPresent>

				<div class='awp_cond'>
					<table>
						<tr>
							<td noWrap>
								<font color="red">*</font>�ʾ����ƣ�
							</td>
							<td noWrap>
								<html:text property="title" />
							</td>
							<td noWrap>
								<font color="red">*</font>�ʾ����ͣ�
							</td>
							<td noWrap>
								<c:out value="${t12_questionnaireActionForm.questiontype_disp}"></c:out>
							</td>
						</tr>
						<tr>
							<c:if test="${t12_questionnaireActionForm.questiontype eq '1'}">
								<td noWrap>
									�ʾ��ܷ֣�
								</td>
								<td noWrap>
									<html:text property="totalscore" readonly="true" />
								</td>
							</c:if>
							<c:if test="${t12_questionnaireActionForm.questiontype eq '2'}">
							<input type="hidden" name="totalscore" value="0"/>
								<td noWrap>
									&nbsp;
								</td>
								<td noWrap>
									&nbsp;
								</td>
							</c:if>
							<td noWrap></td>
							<td noWrap>
								<html:button property="Button52" styleClass="input"
									onclick="dosubmit('cms/t12_questionnaire_modify_do.do','modify')">�� ��</html:button>
							</td>
						</tr>
					</table>
				</div>

				<div class='awp_list'>
					<table>
						<tr>
							<td align="left" colspan="3">
								�ʾ������б�
							</td>
						</tr>
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '1'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td nowrap colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td nowrap align="center">
										<c:out value="${status}��" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td nowrap>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="��${dto.score}�֣�" />
										</c:if>
									</td>
									<td nowrap>
										<a
											href="javaScript:updTimu('cms/t12_test_question_modify.do','<c:out value="${dto.subjectkey}" />','<c:out value="${dto.subjecttype}" />')">�޸�</a>&nbsp;
										<a
											href="javaScript:delTimu('cms/t12_questions_subject_delete_do.do','<c:out value="${dto.subjectkey}" />')">ɾ��</a>
									</td>
								</tr>
								<c:if test="${not empty dto.choiceList}">
									<tr>
										<td nowrap colspan="3">
											<c:forEach items="${dto.choiceList}" var="choice"
												varStatus="statusIndex">
												<c:out value="${statusIndex.index+1}" />
												<input type="radio" disabled
													<c:if test="${dto.solution eq choice.choicekey}"><c:out value="checked"/></c:if> />
												<c:out value="${choice.content}" />
												<c:out value="</br>" escapeXml="false" />
											</c:forEach>
										</td>
									</tr>
								</c:if>
							</c:if>
						</c:forEach>
						<c:set value="0" var="hasSet" scope="page" />

						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '2'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td nowrap colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td nowrap align="center">
										<c:out value="${status}��" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td nowrap>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="��${dto.score}�֣�" />
										</c:if>
									</td>
									<td nowrap>
										<a
											href="javaScript:updTimu('cms/t12_test_question_modify.do','<c:out value="${dto.subjectkey}" />','<c:out value="${dto.subjecttype}" />')">�޸�</a>&nbsp;
										<a
											href="javaScript:delTimu('cms/t12_questions_subject_delete_do.do','<c:out value="${dto.subjectkey}" />')">ɾ��</a>
									</td>
								</tr>
								<c:if test="${not empty dto.choiceList}">
									<tr>
										<td nowrap colspan="3">
											<c:forEach items="${dto.choiceList}" var="choice"
												varStatus="statusIndex">
												<c:set value="${dto.solution}" var="var_solution"
													scope="page"></c:set>
												<%
															String var_solution = (String) pageContext
															.getAttribute("var_solution");
													pageContext.setAttribute("solutions", var_solution
															.replace("|", ","));
												%>
												<c:out value="${statusIndex.index+1}" />
												<input type="checkbox" disabled
													<c:forEach items="${solutions}" var="choicekey">
	  								<c:if test="${choicekey eq choice.choicekey }">
	  									<c:out value="checked" />
	  								</c:if>
	  							</c:forEach> />
												<c:out value="${choice.content}" />
												<c:out value="</br>" escapeXml="false" />
											</c:forEach>
								</c:if>
							</c:if>

						</c:forEach>

						<c:set value="0" var="hasSet" scope="page" />
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '3'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td nowrap colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td nowrap align="center">
										<c:out value="${status}��" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td nowrap>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="��${dto.score}�֣�" />
										</c:if>
										<c:if test="${not empty dto.solution}">��<c:out
												value="${dto.solution}" />��</c:if>
									</td>
									<td nowrap>
										<a
											href="javaScript:updTimu('cms/t12_test_question_modify.do','<c:out value="${dto.subjectkey}" />','<c:out value="${dto.subjecttype}" />')">�޸�</a>&nbsp;
										<a
											href="javaScript:delTimu('cms/t12_questions_subject_delete_do.do','<c:out value="${dto.subjectkey}" />')">ɾ��</a>
									</td>
								</tr>
							</c:if>
						</c:forEach>

						<c:set value="0" var="hasSet" scope="page" />
						<c:forEach items="${subjectList}" var="dto">
							<c:if test="${dto.subjecttype eq '4'}">
								<c:if test="${hasSet ne '1'}">
									<tr align="left">
										<td nowrap colspan="3">
											<c:out value="${subjectTypeMap[dto.subjecttype]}" />
										</td>
									</tr>
									<c:set value="1" var="status" scope="page" />
								</c:if>
								<c:set value="1" var="hasSet" scope="page" />
								<tr>
									<td nowrap align="center">
										<c:out value="${status}��" />
										<c:set value="${status+1}" var="status" scope="page" />
									</td>
									<td nowrap>
										&nbsp;
										<c:out value="${dto.content}" />
										<c:if test="${t12_questionnaire.questiontype eq '1'}">
											<c:out value="��${dto.score}�֣�" />
										</c:if>
										<c:if test="${not empty dto.solution}">��<c:out
												value="${dto.solution}" />��</c:if>
									</td>
									<td nowrap>
										<a
											href="javaScript:updTimu('cms/t12_test_question_modify.do','<c:out value="${dto.subjectkey}" />','<c:out value="${dto.subjecttype}" />')">�޸�</a>&nbsp;
										<a
											href="javaScript:delTimu('cms/t12_questions_subject_delete_do.do','<c:out value="${dto.subjectkey}" />')">ɾ��</a>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</html:form>
		</div>
	</BODY>
</html>
