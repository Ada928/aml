<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/uc.js"></script>
				<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
			<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			var path = '<%=request.getContextPath()%>';
		</script>
		<SCRIPT LANGUAGE="JavaScript">
		
		function dosubmit(theUrl,type){
		
		    var errMsg = "";
		    var isSub = false;
		    
		    if(type=='del'){
		    	if(getLength(document.forms[0].qrydtt_min.value)==0){
			        errMsg +="���ڲ���Ϊ�գ�";
			        document.forms[0].qrydtt_min.focus();
			    }else
		    	if(getLength(document.forms[0].qrydtt_max.value)==0){
			        errMsg +="���ڲ���Ϊ�գ�";
			        document.forms[0].qrydtt_max.focus();
			    }
		        //errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('�����Ҫɾ����־��')){
		                isSub = true;
		            }
		        }
		    }
		    if(type=='search'){
		        if(errMsg==''){
					isSub = true;
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
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form action="/template/t02_tp_log_list.do" method="post">
			<div class='awp_title'>
				<table>
					<tr>						
						<td width="23%" nowrap><span class="awp_title_td2">��֤������־ - �б� </span></td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button value="ɾ ��" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_log_delete_do.do','del')" />
						</td>
					</tr>
				</table>
			</div> 			
			
			
			

				<div class='awp_cond' id="searchtable" style="display:none">
					<table>
						<tr>

							<td>
								ģ�����ƣ�
							</td>
							<td>
								<html:text property="tplaname" styleClass="text_white" size="30" />
							</td>
							<td>
								�����ˣ�
							</td>
							<td>
							<html:hidden property="username" />
							<html:text property="realname" size="30" readonly="true" />	
								<html:button property="button1" onclick="locate_pop_window(path,'t00_userLocation' ,'radio' ,'forms[0]', 'username,realname','flag=\\'1\\'')" value="�� λ" />
							</td>
						</tr>
						<tr>						
							<td>
								����ʱ�䣺
							</td>
							<td>
								<html:text property="qrydtt_min" styleClass="text_white"
									size="10" readonly="true" />
								<img src="../../images/calendar.gif" id="img1"
									style="cursor:hand;" width="16" height="16" border="0"
									align="absmiddle" alt="�������������˵�"
									onclick="new Calendar().show(document.forms[0].qrydtt_min);">
								-
								<html:text property="qrydtt_max" styleClass="text_white"
									size="10" readonly="true" />
								<img src="../../images/calendar.gif" id="img1"
									style="cursor:hand;" width="16" height="16" border="0"
									align="absmiddle" alt="�������������˵�"
									onclick="new Calendar().show(document.forms[0].qrydtt_max);">
							</td>				
								<td>
								&nbsp;
							</td>
							<td>
									<html:button value="�� ѯ" property="Buttondel" styleClass="input"
								onclick="dosubmit('t02_tp_log_list.do?newsearchflag=1','search')" />
							</td>
						</tr>				
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class='awp_list'>
					<TABLE>
						<TR align=center>
							<TD noWrap>
								���
							</TD>
							<TD noWrap>
								ģ������
							</TD>
							<TD noWrap>
								������
							</TD>
							<TD noWrap>
								IP
							</TD>
							<TD noWrap>
								����ʱ��
							</TD>
							<TD noWrap>
								��ѯ����
							</TD>						
							<TD noWrap>
								������ʼ��
							</TD>
							<TD noWrap>
								������ֹ��
							</TD>
							<TD noWrap>
								ִ��ʱ��
							</TD>
							<TD noWrap>
								ִ��SQL
							</TD>

						</TR>
						<logic:iterate id="tplog" name="t02_tp_logList"
							type="com.ist.avp.template.dto.T02_tp_log" indexId="index">
							<TR >
								<TD height="22">
									<%=index.intValue() + 1%>
								</TD>
								<td noWrap>
									<bean:write name="tplog" property="tplaname" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="tplog" property="realname" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="tplog" property="accaddr" scope="page" />
								</TD>

								<TD noWrap>
									<bean:write name="tplog" property="qrydtt" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="tplog" property="qrycond" scope="page" />
								</TD>							
								<TD noWrap>
									<bean:write name="tplog" property="beginrecno" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="tplog" property="endrecno" scope="page" />
								</TD>
								<TD noWrap>
									<bean:write name="tplog" property="exectime" scope="page" />
								</TD>
								<TD noWrap align="center">
									<a href="javascript:openWin(path+'/avp/template/getT02_tp_logDisp.do?tplakey=<bean:write name="tplog" property="tplakey" scope="page" />&qrydtt=<bean:write name="tplog" property="qrydtt" scope="page" />','logdisp')">�鿴</a>
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
				<div class='awp_page_bottom'>
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
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
</HTML>
