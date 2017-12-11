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
	    var isSub = true; 
	    if(action === 'add'){
	    	//�����Ŀ
	    	var content = document.getElementsByName('content')[1];
	    	if(trim(content.value)===''){
	    		errMsg+="����д��Ŀ��";
	    	}else if(getLength(content.value)>1000){
	    		errMsg+="��Ŀ���Ʋ��ܳ���1000���ַ�";
	    	}
	    	//������
	    	if(document.getElementsByName('questiontype')[0].value==='1'){
	    		//����Ƿ���д
	    		var score = document.getElementsByName('score')[0];
	    		if(score.value===''){
	    			errMsg+="����д������";
	    			score.focus();
	    		}else if(!checkNum(score.value)||parseInt(score.value)==0){
	    			errMsg+="����ӦΪ������";
	    			score.focus();
	    		}else{
	    			score.value = parseInt(score.value);
	    		}
	    	}
	    	//����Ƿ�ѡ�����Ƿ����
	    	var mustanswer = document.getElementsByName('mustanswer')[0];
	    	if(mustanswer.value===''){
	    		errMsg+='��ѡ���Ƿ���';
	    		mustanswer.focus();
	    	}
	    	
	    	 var eles = document.getElementsByTagName('input');
	    	 var radioEles = new Array(); 
	    	 if(eles == null || typeof(eles)==='undefined' || eles.length==0){ 
	    	 	errMsg+="�������ɣ�";
	    	 }else{
	    	 	for(var i=0;i<eles.length;i++){
	    	 		if(eles[i].type==='radio'){
	    	 			radioEles.push(eles[i]);
	    	 		}
	    	 	}
	    	 }

	    	 if(radioEles.length==0){ 
	    	 	errMsg+="�������ɣ�";
	    	 }else{
	    	 <c:if test="${param.questiontype eq '1'}">
	    	 	var ele ;
	    	 	var msg ="��ѡ����ȷ�𰸣�";
	    	 	for(var i=0;i<radioEles.length;i++){
	    	 		ele = radioEles[i];
	    	 		if(ele.checked){
	    	 			msg='';
	    	 			break;
	    	 		}
	    	 	}
	    	 	errMsg+=msg;
	    	 </c:if>
	    	 }
	    	 	
	    	 var msg = check_tigan();
	    	 if(msg!=''){
	    	 	errMsg+=msg;
	    	 }else{
	    	 //�������Ƿ���ͬ
	    	 	msg = checkSameTigan(document.getElementsByName('choice_content'));
	    	 	if(msg!=''){
	    	 		errMsg+=msg;
	    	 	}else{
	    	 		isSub = true;
	    	 	}
	    	 }
		    //���
		    var sorder = document.getElementsByName('sorder')[0];
		    if(getLength(sorder.value)>0){
		    	sorder.value=parseInt(sorder.value);
		    }
	    
	    }else if(action ==='back'){
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
	
	function check_tigan(){
		var errMsg = '';
		
		var tigan = document.getElementsByName('choice_content');
		if(tigan == null || typeof(tigan)==='undefined' || tigan.length==0){
			errMsg='�������ɣ�';
		}else {
			for(var i=0;i<tigan.length;i++){
				if(trim(tigan[i].value)===''){
					errMsg="��ɲ���Ϊ�գ�";
					tigan[i].focus();
					return errMsg;
				}else if(getLength(tigan[i].value)>1000){
					errMsg="��ɳ��Ȳ��ܳ���1000���ַ���";
					tigan[i].focus();
					return errMsg;
				}
			}
		}
	return errMsg;
	}
	//����Ƿ�����ͬ����ɣ������Ѿ�����д�����
	function checkSameTigan(elements){
 	  var errMsg = '';
	  for(var i=0;i<elements.length;i++){	
		for( var j=i+1;j<elements.length;j++){
			if(trim(elements[i].value) === trim(elements[j].value)){
				errMsg = "��ɲ�����ͬ��";
				break;
			}
		}
	  }
	  return errMsg;
	}
	

	function newTimu(url,subjecttype)
	{
	    sForm = document.frm
	    sForm.subjecttype.value = subjecttype
	    sForm.action = url;   
	    sForm.submit();
	}
	function updTimu(subjectkey,subjecttype){	
	    sForm = document.frm   
	    sForm.subjectkey.value = subjectkey;
	    sForm.subjecttype.value = subjecttype;
	  	sForm.action = "<%=path%>/oa/assist/questionnaire/controller/QuestionEditServlet";   
	    sForm.submit();
	}
	</script>
		<script type="text/javascript">
		var backurl = '<c:out value="${param.backurl}" />'; 
	</script>
	</head>

	<body>
		<div id='content'>
			<html:form action="/t12_test_question_add_do.do" method="post">
				<input type="hidden" name="questionkey"
					value="<c:out value="${param.questionkey}" />" />
				<input type="hidden" name="questiontype"
					value="<c:out value="${param.questiontype}" />" />
				<!-- �������� -->
				<input type="hidden" name="subjecttype"
					value="<c:out value="${param.subjecttype}" />" />
				<!-- ������Դ E-������Դ���޸�ҳ�� N������Դ�����ҳ��-->
				<input type="hidden" name="fromOpt"
					value="<c:out value="${param.fromOpt}" />" />
				<div class='awp_title'>

					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">�ʾ����-�ʾ���ƹ���-���� <c:forEach
										items="${subjectTypeMap}" var="entry">
										<c:if test="${param.subjecttype eq entry.key}">
											<c:out value="${entry.value}"></c:out>
										</c:if>
									</c:forEach> </span>
							</td>
							<td align="right">
								<html:button property="Button55" value="�� ��"
									onclick="dosubmit(backurl,'back')" styleClass="input" />
							</td>
						</tr>
					</table>
				</div>

				<logic:messagesPresent message="true">
					<html:messages id="msg" message="true">
						<bean:write name="msg" filter="false" />
					</html:messages>
				</logic:messagesPresent>


				<div class='awp_detail'>
					<table id="subjectTable">
						<tr>
							<td noWrap>
								<font color="red">*</font>�� Ŀ��
							</td>
							<td noWrap>
								<html:textarea property="content" cols="40" rows="5"></html:textarea>
							</td>

						</tr>
						<c:choose>
							<c:when test="${param.questiontype eq '1'}">
								<tr>
									<td noWrap>
										<font color="red">*</font>�� ����
									</td>
									<td noWrap>
										<html:text property="score" size="5"
											onkeyup="this.value=this.value.replace(/\D/g,'')"
											maxlength="3" />
									</td>
								</tr>
							</c:when>
							<c:otherwise>
								<input type="hidden" name="score" value="0"/ >
							</c:otherwise>
						</c:choose>
						<tr>
							<td noWrap>
								�Ƿ�ش�
							</td>
							<td noWrap>
								<html:select property="mustanswer">
									<html:options collection="mustanswerMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td noWrap>
								��ʾ���
							</td>
							<td noWrap>
								<html:text property="sorder"
									onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5" />
							</td>
						</tr>
						<tr>
							<td noWrap>
								
							</td>
							<td noWrap>
								<html:button property="Button52" value="���ѡ��" onclick="addrow()" />&nbsp;
								<html:button property="Button52" value="�� ��"
									onclick="dosubmit('cms/t12_test_question_add_do.do','add')" />
							</td>
						</tr>
					</table>
				</div>

			</html:form>
		</div>
	</BODY>
	<script type="text/javascript">
  var sequence = 0;
  function addrow(){
  		var add_value = "_"+sequence;
		var tab = document.getElementById('subjectTable');
		var totalRow = tab.rows.length;
		var newRow = tab.insertRow(totalRow-1); 
		var cell1 = newRow.insertCell();
			cell1.innerHTML="<input type=\"radio\" name=\"add_choice_id\" value=\""+add_value+"\">";
			cell1.className="deep";
		var cell2 = newRow.insertCell();
			cell2.innerHTML="<input type=\"text\" name=\"choice_content\"><input type=\"hidden\" name=\"add_choice_id_hidden\" value=\""+add_value+"\">&nbsp;<a href='javascript:void(0)' onclick=\"delRow(event)\"'>ɾ�����</a>";
			cell2.className="light";
			cell2.setAttribute('align','left');
		sequence++;
	}
	function delRow(event){
		if (confirm("ȷ��ɾ��")) {
		   var tab = document.getElementById('subjectTable');
		   element = window.event ? window.event.srcElement : event.target;
		   var rowNo = element.parentNode.parentNode.rowIndex; 
	       tab.deleteRow(rowNo);
		}
	}
	
	
  </script>
</html>
