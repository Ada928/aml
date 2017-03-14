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
		<%@ include file="../../bmp/platform/common/style_include.jsp"%>
		<link
			href="<%=request.getContextPath()%>/skin/<%=style%>/css/awp_base.css"
			rel="stylesheet" type="text/css">
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script language="JavaScript" 
			src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, type){
	    var errMsg = "";
	    var isSub = false;
	    if(type==='add'){
	        isSub = true;
	        
	    }else if(type==='search'){
	        isSub = true;
	        //��鴴��ʱ��
	        var createtime_begin = document.getElementsByName('createtime_begin')[0];
	        var createtime_end = document.getElementsByName('createtime_end')[0];
	        if(createtime_begin.value!='' && createtime_end.value!=''){
	        	if(createtime_begin.value > createtime_end.value){
	        		errMsg= '������ʼʱ�䲻�ܴ��ڽ���ʱ�䣡';
	        		isSub = false;
	        	}
	        }
	    }else if(type==='del'){
	    	errMsg = CheckBoxMustChecked(document.forms[0]);
	    	if(errMsg ===''){
	    		if(window.confirm("ȷ��Ҫ����ѡ�е��Ծ�")){
	    			isSub = true;
	    		}else{
	    			isSub = false;
	    		}
	    	}
	    }else if(type==='copy'){
	    	errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	    	if(errMsg ===''){
	    		if(window.confirm("ȷ��Ҫ����ѡ�е��Ծ�")){
	    			isSub = true;
	    		}else{
	    			isSub = false;
	    		}
	    	}
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
		<script type="text/javascript">
	function open_window(url){
		var	property = 'height=500, width=800,left=100,top=100,scrollbars=yes,resizable=yes';
		window.open(url,'',property);     
	}	
	</script>
	</head>

	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form action="/t12_questionnaire_list" method="post">

				<div class='awp_title'>

					<table>
						<tr>
							
							<td width="23%" nowrap>
								<span class="awp_title_td2">�ʾ���ƹ��� - �� ��</span>
							</td>
							<td align="right" nowrap>
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
								<html:button property="button2" value="�� ��" styleClass="input"
									onclick="dosubmit('cms/t12_questionnaire_add.do','add')" />
								<html:button property="button2" value="�� ��" styleClass="input"
									onclick="dosubmit('cms/t12_questionnaire_copy.do','copy')" />
								<html:button property="button2" value="ɾ ��" styleClass="input"
									onclick="dosubmit('cms/t12_questionnaire_logic_delete_do.do?flag=2','del')" />
							</td>
						</tr>
					</table></div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="false" />
					</html:messages>
					<div class='awp_cond' id="searchtable" style="display:none">
						<table>
							<tr>
								<td noWrap>
									�ʾ����ƣ�
								</td>
								<td noWrap>
									<html:text property="title" />
								</td>
								<td noWrap>
									����ʱ�䣺
								</td>
								<td noWrap>
									<html:text property="createtime_begin" readonly="true"
										size="10" styleClass="input" />
									<img src="<%=path%>/images/calendar.gif" style="cursor:hand;"
										width="16" height="16" alt="�������������˵�"
										onClick="new Calendar().show(document.forms[0].createtime_begin)" />
									-
									<html:text property="createtime_end" readonly="true" size="10"
										styleClass="input" />
									<img src="<%=path%>/images/calendar.gif" style="cursor:hand;"
										width="16" height="16" alt="�������������˵�"
										onClick="new Calendar().show(document.forms[0].createtime_end)" />
								</td>
							</tr>
							<%--<tr>
  					<td noWrap>�ʾ�״̬��</td>
  					<td noWrap>
  						<html:select property="state">
  							<html:options collection="flagMap" property="label" 
  								labelProperty="value"/>
  						</html:select>
  					</td>
  					<td noWrap>�ʾ����ͣ�</td>
  					<td noWrap><html:select property="type">
  						<html:options collection="quetionTypeMap" 
  							property="label" labelProperty="value" />
  					</html:select>
  						</td>
  				</tr>
  				<tr>
  					<td noWrap>����</td>
  					<td noWrap><html:select property="sort">
  							<html:options collection="sortMap" property="label" 
  								labelProperty="value"/>
  						</html:select>&nbsp;
  						<html:radio property="sort_type" value="ASC">����</html:radio>
  						<html:radio property="sort_type" value="DESC">����</html:radio>
  						<html:radio property="sort_type" value="">������</html:radio></td>
  					<td noWrap></td>
  					<td noWrap><html:button property="Button55" value="��  ѯ" onclick="dosubmit('cms/t12_questionnaire_list.do?newsearchflag=1','search')" styleClass="input" />
					</td>
  				</tr>
  			--%>
							<tr>
								<td noWrap>
									�ʾ����ͣ�
								</td>
								<td noWrap>
									<html:select property="questiontype">
										<html:options collection="quetionTypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td noWrap>
									����
								</td>
								<td noWrap>
									<html:select property="sort">
										<html:options collection="sortMap" property="label"
											labelProperty="value" />
									</html:select>
									&nbsp;
									<html:radio property="sort_type" value="ASC">����</html:radio>
									<html:radio property="sort_type" value="DESC">����</html:radio>
									<html:radio property="sort_type" value="">������</html:radio>
								</td>
							</tr>
							<tr>
								<td noWrap></td>
								<td noWrap></td>
								<td noWrap></td>
								<td noWrap>
									<html:button property="Button55" value="�� ѯ"
										onclick="dosubmit('cms/t12_questionnaire_list.do?newsearchflag=1','search')"
										styleClass="input" />
								</td>
							</tr>
						</table>
					</div>
					<div class="awp_list">
						<TABLE>
							<TR>
								<TD noWrap width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</TD>
								<TD noWrap width="38%">
									�ʾ�����
								</TD>
								<TD noWrap width="20%">
									�ʾ�����
								</TD>
								<TD noWrap width="20%">
									�ʾ�״̬
								</TD>
								<TD noWrap width="20%">
									�� ��
								</TD>
							</TR>
							<c:forEach items="${t12_questionnaire_list}" var="dto">
								<TR align="center">
									<TD noWrap><input type="checkbox" name="selectedQuestionkey"
											value="<c:out value="${dto.questionkey}" />"
											<c:if test="${t00_user.username ne dto.creator }">disabled</c:if> />
									</TD>
									<TD noWrap align="left">
										<a
											href="javascript:open_window('t12_questionnaire_disp.do?questionkey=<c:out value="${dto.questionkey}" />')"><c:out
												value="${dto.title}" />
										</a>
									</TD>
									<TD noWrap>
										<c:out value="${dto.questiontype_disp}" />
									</TD>
									<TD noWrap>
										<c:out value="${dto.flag_disp}" />
									</TD>
									<TD noWrap>
										<c:if
											test="${dto.flag eq '1' and (t00_user.username eq dto.creator) and (dto.publish_state ne '2')}">
											<a
												href="<%=path%>/cms/t12_questionnaire_modify.do?questionkey=<c:out value="${dto.questionkey}" />">��
												��</a>
										</c:if>
									</TD>
								</TR>
							</c:forEach>
						</TABLE>
					</div>
					<div class="awp_page_bottom">
						<table>
							<tr>
								<td align="center">
										<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</div>
			</html:form>
		</div>
	</BODY>
</html>
