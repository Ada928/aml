<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>�ҵ��ղ�</title>	
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    
			
		<SCRIPT LANGUAGE="JavaScript"> 	
		function dosubmit(theUrl,type){
	      var errMsg = "";
	      var isSub = false;
	      if(type=='modi'){
	        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
	        isSub = true;
	      }else if(type=='del'){
		    errMsg = CheckBoxMustChecked(document.forms[0]);
		    if(errMsg==''){
			  if(confirm('ȷ�Ͻ���ȡ���ղز�����')){
				isSub = true;
			  }
		    }
	      }else if(type=='search'){
	          //if(document.forms[0].begindate.value>document.forms[0].enddate.value){
	             //errMsg="��ʼ���ڲ��ܴ��ڽ������ڣ�";
	           //}
	             isSub=true;
	             
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
	<body><div id='content'>
		<html:form method="post"
			action="/myknowledge/t12_article_collect/t12_article_collect_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�ҵ��ղ� - �� ��</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" name="button1" value="ȡ���ղ�"
							onclick="dosubmit('t12_article_collect_delete_do.do','del')"
							class="input">
							<!--	    										    	
					    	<input type="button" name="button1" value="��  ��" onclick="dosubmit('../../myknowledge/order/order_add.htm','add')" class="input">						    						  
					    	<input type="button" name="button1" value="��  ��" onclick="dosubmit('../../myknowledge/order/order_modify.htm','modify')" class="input">						    						  
					    	
	-->
						</td>
					</tr>
				</table>
			</div>
		<div class='awp_cond' id="searchtable" style="display:none">
			<TABLE>
			
					<tr>
						<td>
							���±��⣺
						</td>
						<td>
							<html:text property="articlename" size="34" />
						</td>
						<td>
							 ��Ŀ���ƣ�
						</td>
						<td>
							<html:text property="programaname" size="34" />
						</td>
					</tr>
					
					<tr>
						<td>
							�������ߣ�
						</td>
						<td>
							<html:text property="realname" size="34" />
						</td>
						<td>
							�ղ�ʱ�䣺
						</td>
						<td>
							<html:text property="begindate"   size="10"
								maxlength="10" styleClass="ist_date"/>							
										<img src="<%=request.getContextPath()%>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].begindate);" />
							-
							<html:text property="enddate"   size="10"
								maxlength="10" styleClass="ist_date"/>
							<img src="<%=request.getContextPath()%>/images/calendar.gif" style="cursor:hand;"
								width="16" height="16" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].enddate);" />
						</td>
					</tr>


					<tr>
						<td>
							����
						</td>
						<td>
							<html:select property="sort" style="width:100">
								<html:options collection="sortMap" property="label"
									labelProperty="value" />
							</html:select>
							&nbsp;
							<html:radio property="sort_type" value="asc">����</html:radio>
							<html:radio property="sort_type" value="desc">����</html:radio>
							<html:radio property="sort_type" value="">������</html:radio>
						</td>
						<td>

						</td>
						<td>
							<input type="button" name="button1" value="�� ѯ"
								onclick="dosubmit('t12_article_collect_list.do?newsearchflag=1','search')" class="input">
						</td>
					</tr>
				
		</TABLE></div>
		<div class="awp_list">
			<TABLE>
				<TR>
					<td nowrap width="2%" onclick='selectAllCheckBox(this,document.forms[0])'
							style='cursor:hand;'>
							ȫ��
					</td>
					
					<TD >
						���±���
					</TD>
					
					<TD nowrap align=center>
						��Ŀ����
					</TD>
									
					
					<TD nowrap align=center>
						��������
					</TD>
					
					<TD nowrap align=center>
						���·���ʱ��
					</TD>
					
					<TD nowrap align=center>
						�ղ�ʱ��
					</TD>

				</TR>
				<logic:iterate id="fav" name="resultList" type="com.ist.cms.dto.T12_article_collect">
				    <TR>
					<TD nowrap>
						<html:multibox property="articlekey_selected" >
							<bean:write name="fav" property="articlekey" />
						</html:multibox>
					</TD>
					
					<TD nowrap align="left">
					   <a
							href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=<bean:write name="fav" property="articlekey" scope="page"/>&programakey=<bean:write name="fav" property="programakey" scope="page"/>')">
							<bean:write name="fav" property="articlename" scope="page"/>
					   </a>
					   
					</TD>
					
					<TD align="center" nowrap ><bean:write name="fav" property="programaname" scope="page"/></TD>					
					
					<TD align="center" nowrap ><bean:write name="fav" property="realname" scope="page"/></TD>
					
					<TD align="center" nowrap ><bean:write name="fav" property="createdate" scope="page"/></TD>
					
					<TD align="center" nowrap ><bean:write name="fav" property="collectdt" scope="page"/></TD>
					</TR>
				</logic:iterate>              
				
			</TABLE></div>
			
			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
		</html:form></div>
	</body>

</html>
