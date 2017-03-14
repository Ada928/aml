<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath()+"/";
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
	
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript" 
    		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript" 
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script language="javascript" 
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
			
	<SCRIPT LANGUAGE="JavaScript"> 
		var contextpath = '<%=request.getContextPath()%>';
		var param = "QUESTIONTYPE='"+<c:out value="${param.questiontype}" />+"'";
	function dosubmit(url,action){
		var errMsg='';
		var isSub = true;
		if(action === 'back'){
			isSub = true;
		}
		if(action === 'modi'){
			var answer_username = document.getElementsByName('answer_username')[0];
			//var checkdetail_username = document.getElementsByName('checkdetail_username')[0];
			//var checkstatis_username = document.getElementsByName('checkstatis_username')[0];
			var judge_username = document.getElementsByName('judge_username')[0];
			
			var qmode = document.getElementsByName('qmode')[0];
			var starttime = document.getElementsByName('starttime')[0];
			var endtime = document.getElementsByName('endtime')[0];
			var questionkey = document.getElementsByName('questionkey')[0];
			var title = document.getElementsByName('title')[0];
			var pass_score = document.getElementsByName('pass_score')[0];
			var answertime = document.getElementsByName('answertime')[0];
			var ispublic = document.getElementsByName('ispublic')[0];
			var showsolution = document.getElementsByName('showsolution')[0];
			if(answer_username.value===''){
				errMsg+='��ѡ������Ա��';
				isSub = false;
			}
			/*else if(checkdetail_username.value===''){
				errMsg+='��ѡ��鿴�����ϸ��Ա��';
				isSub = false;
			}else if(checkstatis_username.value===''){
				errMsg+='��ѡ��鿴ͳ�ƽ����Ա��';
				isSub = false;
			}*/
			<c:if test="${param.questiontype eq '1'}">
			<c:if test="${questionAnswerNum gt 0 or empty questionAnswerNum}">
			else if(judge_username.value===''){
				errMsg+='��ѡ���о���Ա��';
				isSub = false;
			}
			</c:if>
			</c:if>
			else			
				if(starttime.value.length <= 0 ){
					errMsg += '��ѡ���ʾ�ʼʱ�䣡 ';
					isSub = false;
				}else
				if(endtime.value.length <= 0 ){
					errMsg += '��ѡ���ʾ����ʱ�䣡 ';
					isSub = false;
				}
			else if(pass_score!=null && (typeof(pass_score)!='undefined')){
				if(pass_score.value===''){
					errMsg+="����д�������";
				}else if(pass_score.value==='0'){
					//errMsg+="�������Ӧ����0";
				}else{
					pass_score.value=parseInt(pass_score.value);
					isSub = true;
				}
			}
			<c:if test="${param.questiontype eq '1'}">
			if(answertime!=null && (typeof(answertime)!='undefined')){
				if(answertime.value===''){
					errMsg+="����д����ʱ��";
				}else if(answertime.value==='0'){
					errMsg+="����ʱ��Ӧ����0";
				}else{
					answertime.value=parseInt(answertime.value);
					isSub = true;
				}
			}
			</c:if>
			<c:if test="${param.questiontype eq '1'}">
				errMsg+=checkGrade();
			</c:if>
		}
		
		if(isSub && errMsg===''){
			document.forms[0].action=url;
			document.forms[0].submit();
		}else{
			if(errMsg!=''){
				alert(errMsg);
				return false;
			}
		}
	
	
	}	 
<!-- �������ȼ�-->
function checkGrade(){
	var errMsg = '';
	var questionkey = document.getElementsByName('questionkey')[0];
	if(questionkey.value===''){
		return '��ѡ���Ծ�';
	}
	var totalScore = document.getElementsByName('totalscore')[0];
	var grade_a = document.getElementsByName('grade_a')[0];
	var grade_b = document.getElementsByName('grade_b')[0];
	var grade_c = document.getElementsByName('grade_c')[0];
	//var grade_d = document.getElementsByName('grade_d')[0];
	var array = new Array(grade_a,grade_b,grade_c);
	//����Ƿ��п�ֵ
	for(var i=0;i<array.length;i++){
		if(array[i].value===''){
			array[i].focus();
			return '����������Ϊ�գ�';
		}
	}
	//����Ƿ���0ֵ
	for(var i=0;i<array.length;i++){
		if(array[i].value==='0'){
			array[i].focus();
			return '����������Ϊ�㣡';
		}
	}
	//�����д�ķ����Ƿ�Ϸ�
	//������Ƿ�����ܷ�
	if(parseInt(grade_a.value)>parseInt(totalScore.value)){
		errMsg='�ż���ķ������ܴ����Ծ��ܷ֣�';
	}//������Ƿ������
	else if(parseInt(grade_b.value)>=parseInt(grade_a.value)){
		errMsg="������ķ������ܴ��ڻ�����ż���ķ���";
	}//������Ƿ������
	else if(parseInt(grade_c.value)>=parseInt(grade_b.value)){
		errMsg="�м���ķ������ܴ��ڻ����������ķ���";
	}else{
		errMsg='';
	}
	return errMsg;
}
	</SCRIPT>
  </head>
  
  <body> 
  	<div id="content">
  	<html:form action="/t12_publish_questionnaire_modify.do" method="post">
  		<input type="hidden" name="flag" value="1"/>
  		<html:hidden property="qmode"/>
  		<html:hidden property="state"/>
  		<input type="hidden" name="questiontype" value="<c:out value="${param.questiontype}" />"/>
  		<c:if test="${param.questiontype eq '2'}">
  		<input type="hidden" name="passscore" value="0"/ >
  		<input type="hidden" name="answertime" value="0"/ >
  		</c:if>
  		<input type="hidden" name="totalscore" value="<c:out value="${totalScore}" />"/>
  		<html:hidden property="publishkey"/>
  		<html:hidden property="questioninskey"/>	
  		<div class="awp_title">	
  		<table>
				<tr>
						<td width="23%" nowrap>
						<span class="awp_title_td2">�ʾ���� -
						<c:if test="${param.questiontype eq '1'}">���߿��Է���</c:if>
						<c:if test="${param.questiontype eq '2'}">�ʾ���</c:if></span>
					</td>
					<td align="right" nowrap >
					<html:button property="ButtonSave" onclick="dosubmit('cms/t12_publish_questionnaire_modify_do.do','modi')" styleClass="input">�� ��</html:button> 
					<html:button property="ButtonBack" onclick="window.location.href='t12_publish_questionnaire_list.do'" styleClass="input">��  ��</html:button>
					</td>
				</tr>
			</table>
			</div> 
			 	<html:messages id="errors" message="true">
			 		<bean:write name="errors" filter="false"/>
			 	</html:messages> 
  		<div class="awp_detail">
  			<table>
  				<tr>
  					<td><font color="red">*</font>�ʾ����ƣ�</td>
  					<td><html:text property="questionnaireTitle" readonly="true"></html:text> <html:hidden property="questionkey"/>
  						<%--<html:button property="Button52" onclick="locate_pop_window(contextpath,'t12_questionnairLocation','radio','forms[0]','questionkey,questionnair	eTitle',' '+param);">�� ѡ</html:button> 
  					--%></td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>�������ƣ�</td>
  					<td><html:text property="title" /> </td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>�����Ա��</td>
  					<td><html:textarea property="answer_username_disp" readonly="true" rows="3" cols="30"></html:textarea><html:hidden property="answer_username"/>&nbsp;<html:button property="Button52" onclick="locate_checkboxtree_usergroup(contextpath,'getT00_groupTreeList','answer_username,answer_username_disp','');">�� ѡ</html:button> </td>
  				</tr>
  				<%--<tr>
  					<td><font color="red">*</font>�鿴�����ϸ��Ա��</td>
  					<td><html:textarea property="checkdetail_username_disp" readonly="true" rows="3" cols="30"></html:textarea><html:hidden property="checkdetail_username"/><html:button property="Button52" onclick="locate_checkboxtree_usergroup(contextpath,'getT00_groupTreeList','checkdetail_username,checkdetail_username_disp','');">�� ѡ</html:button> </td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>�鿴ͳ�ƽ����Ա��</td>
  					<td><html:textarea property="checkstatis_username_disp" readonly="true" rows="3" cols="30"></html:textarea><html:hidden property="checkstatis_username"/><html:button property="Button52" onclick="locate_checkboxtree_usergroup(contextpath,'getT00_groupTreeList','checkstatis_username,checkstatis_username_disp','');">�� ѡ</html:button> </td>
  				</tr>
  				--%>
  				<c:if test="${param.questiontype eq '1'}">
  				<c:if test="${questionAnswerNum gt 0 or empty questionAnswerNum}">
	  				<tr>
	  					<td><font color="red">*</font>�о���Ա��</td>
	  					<td><html:textarea property="judge_username_disp" readonly="true" rows="3" cols="30"></html:textarea><html:hidden property="judge_username"/>&nbsp;<html:button property="Button52" onclick="locate_checkboxtree_usergroup(contextpath,'getT00_groupTreeList','judge_username,judge_username_disp','');">�� ѡ</html:button> </td>
	  				</tr>
  				</c:if>
  				</c:if>
  				<%--<tr>
  					<td><font color="red">*</font>���Է�ʽ��</td>
  					<td> <html:select property="qmode">
  						<html:options collection="qmodeMap" 
  							property="label" labelProperty="value"/>
  						</html:select> </td>
  				</tr>
  				--%><tr>
  					<td><font color="red">*</font>�ʾ�ʼʱ�䣺</td>
  					<td><html:text property="starttime" size="10" readonly="true" />
  						<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									align="absmiddle" alt="�������������˵�" border="0"
									onClick="new Calendar().show(document.forms[0].starttime);" /> 
					</td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>�ʾ����ʱ�䣺</td>
  					<td><html:text property="endtime" size="10" readonly="true" />
  						<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img2" style="cursor:hand;" width="16" height="16"
									align="absmiddle" alt="�������������˵�" border="0"
									onClick="new Calendar().show(document.forms[0].endtime);" />
					 </td>
  				</tr>
  				<c:if test="${param.questiontype eq '1'}">
  				<tr>
  					<td><font color="red">*</font>�ɼ�����</td>
  					<td>
  					����<html:text property="grade_a" onkeyup="this.value=this.value.replace(/\D/g,'')"  size="3" maxlength="3" />��Ϊ��
  					����<html:text property="grade_b" onkeyup="this.value=this.value.replace(/\D/g,'')"  size="3" maxlength="3" />��Ϊ��
  					����<html:text property="grade_c" onkeyup="this.value=this.value.replace(/\D/g,'')"  size="3" maxlength="3" />��Ϊ��
  					����Ϊ����
  					<c:if test="${ not empty totalScore}">
  						<font color="red">�Ծ��ܷ֣�</font><c:out value="${totalScore}" /> ��
  					</c:if>
  					 </td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>���ʱ�䳤��(��λ������)��</td>
  					<td><html:text property="answertime" onkeyup="this.value=this.value.replace(/\D/g,'')" maxlength="5"/> </td>
  				</tr>
  				</c:if>
  				<tr>
  					<td><font color="red">*</font>�������ͣ�</td>
  					<td><html:select property="publishmode"><html:options collection="publishmodeMap" property="label" labelProperty="value"/>
  					</html:select> <br></td>
  				</tr>
  				<%--<tr>
  					<td><font color="red">*</font>�Ƿ񹫿���</td>
  					<td> <html:select property="ispublic">
  						<html:options collection="ispublicMap" 
  							property="label" labelProperty="value"/>
  					</html:select> </td>
  				</tr>
  				<tr>
  					<td><font color="red">*</font>��ʾ�𰸣�</td>
  					<td> <html:select property="showsolution">
  						<html:options collection="showsolutionMap" 
  							property="label" labelProperty="value"/>
  					</html:select> </td>
  				</tr>
  				--%> 
  			</table>
  		</div>
  
  	</html:form>
  	</div>
  </body>
  <c:if test="${param.questiontype eq '1'}">
  <script type="text/javascript">
	/*
	function refresh(url){
		var questionnaireTitle = document.getElementsByName('questionnaireTitle')[0];
		if(questionnaireTitle.value!=''){
			document.forms[0].action=url;
			document.forms[0].submit();
		}
	
	}

function inits(){
	var questionnaireTitle = document.getElementsByName('questionnaireTitle')[0];
	questionnaireTitle.attachEvent("onpropertychange",function() {refresh('cms/t12_publish_questionnaire_questionAnswerModi.do')});
}
*/
</script>
</c:if>
</html>
