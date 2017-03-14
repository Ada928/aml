<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	
	<script type="text/javascript">
	    function onloadDo() {//ҳ�����ʱ����
	       var flag = document.forms[0].flag.value;
	       
	       if(flag == '0') {//δ����
	           document.forms[0].norelease.disabled = "true";
	           return ;
	       }
	       else if(flag == '1') {//�ѷ���
	           document.forms[0].release.disabled = "true";
	           return ;
	       }
	       
	       var auditstat = document.forms[0].auditstat.value;
	       //alert("auditstat:"+auditstat);
	       
	       if(auditstat == '0') {//�������
	           document.forms[0].notneed.disabled = "true";
	       }
	       else if(auditstat == '1') {//�����
	           document.forms[0].wait.disabled = "true";
	       }
	       else if(auditstat == '2') {//��˲�ͨ��
	           document.forms[0].fail.disabled = "true";
	       }
	       else if(auditstat == '3') {//�����
	           document.forms[0].already.disabled = "true";
	       }
	   }
	   
	   function dosubmit(url, type, value) {
	      if(type == 'flag') {
	         document.forms[0].flag.value = value;
	         document.forms[0].auditstat.value = "";
	      }
	      else if(type == 'status') {
	         //alert("status"+value);
	         document.forms[0].flag.value = "";
	         document.forms[0].auditstat.value = value;
	      }
	      
	      document.forms[0].action=url;
		  document.forms[0].submit();
	   }
	</script>
</HEAD>
<BODY>	<div id='content'>
	<html:form method="POST" action="/myknowledge/t12_myarticle/t12_myarticle_list.do">
        <html:hidden property="programakey"/>
	    <html:hidden property="categorykey" />       
	    <html:hidden property="flag" />  
	    <html:hidden property="auditstat" />
	 
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�ҵ����� - �� ��</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							
						<!-- 
						<html:button property="delete" styleClass="input" value="���뷢��"
						onclick="dosubmit('t12_article_depoly_do.do','add')" />
						 -->			
						</td>
					</tr>
				</table>
			</div>
		<div class="awp_titlebtn">
		 <html:button property="norelease" styleClass="input" value="δ����"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','flag','0')" />
					
				    <html:button property="release" styleClass="input" value="�ѷ���"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','flag','1')" />
						
					<html:button property="wait" styleClass="input" value="�����"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','status','1')" />
						
					<html:button property="fail" styleClass="input" value="���δͨ��"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','status','2')" />
											
					<html:button property="already" styleClass="input" value="���ͨ��"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','status','3')" />
						
					<html:button property="notneed" styleClass="input" value="�������"
						onclick="dosubmit('t12_myarticle_list.do?newsearchflag=1','status','0')" />
		</div>
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
		
		<div class='awp_cond' id="searchtable" style="display:none">
		<TABLE >
				
							<tr>
								<td>
									���±��⣺
								</td>
								<td>
									<html:text property="articlename" size="30" />
								</td>
								<td>
									��Ŀ���ƣ�
								</td>
								<td>
									<html:text property="programaname" size="30"  />
								</td>
							</tr>
							<tr>
								<td>
									 ���·���ʱ�䣺
								</td>
								<td>
									<html:text property="createdate_min" size="10"  />
									<img src="<%=request.getContextPath()%>/images/calendar.gif"
										style="cursor:hand;" width="16" height="16" border="0"
										alt="�������������˵�" onclick="new Calendar().show(document.forms[0].createdate_min);" />
									-
									<html:text property="createdate_max" size="10"  />
									<img src="<%=request.getContextPath()%>/images/calendar.gif"
										style="cursor:hand;" width="16" height="16" border="0"
										alt="�������������˵�" onclick="new Calendar().show(document.forms[0].createdate_max);" />
								</td>
								
								<td>
									&nbsp;

								</td>
								<td>
									<html:button property="button" styleClass="input" value="�� ѯ"
										onclick="awpDoSubmit('t12_myarticle_list.do?newsearchflag=1','search')" />
								</td>
							</tr>							
			</TABLE></div>
	<div class="awp_list">
		<TABLE>
			<TR>
				<TD nowrap>
					���±���
				</TD>
				<TD nowrap>
					��Ŀ����
				</TD>
				<!-- 
				<TD nowrap>
					ȫ�ļ����ܼ�
				</TD>
				 -->
				
				<TD nowrap>
					����״̬
				</TD>
				<TD nowrap>
					���״̬
				</TD>
				<TD nowrap>
					���·���ʱ��
				</TD>
				<TD nowrap>
					����Ա�Ƿ��޸�
				</TD>
				<!-- 
				<TD nowrap>
					����Ա
				</TD>
				<TD nowrap>
					����Ա�޸�ʱ��
				</TD>
				 -->
				
				<TD nowrap>
					����
				</TD>
			</TR>

			<logic:iterate id="t12_article" name="t12_articleList"
				type="com.ist.cms.dto.T12_article">
			<%
				java.util.HashMap map = new java.util.HashMap();
				map.put("articlekey", t12_article.getArticlekey());
				map.put("programakey", t12_article.getProgramakey());
				
				//map.put("rad",""+(new java.util.Date()).getTime() );
				pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
			%>				
				<TR>
					<TD align="left" nowrap>
				    	<a
							href="javascript:pop_loader_cms('<%=request.getContextPath()%>/cms/myknowledge/t12_myarticle/t12_myarticle_disp.do?articlekey=<bean:write name="t12_article" property="articlekey"/>&programakey=<bean:write name="t12_article" property="programakey"/>')">
							<bean:write name="t12_article" property="articlename" filter="false" scope="page" /> 
					   </a>
					</TD>
					<TD nowrap align="center">
						<bean:write name="t12_article" property="programaname"  scope="page" />
					</TD>
					
					<!-- 
					<TD nowrap align="center">
						<bean:write name="t12_article" property="seclevel_disp" scope="page" />
					</TD>	
					 -->
					
				
					<TD nowrap align="center">
						<bean:write name="t12_article" property="flag_disp" scope="page" />
					</TD>
					<TD nowrap align="center">
						<bean:write name="t12_article" property="auditstat_disp" scope="page" ignore="true"/>
					</TD>
					<TD nowrap align="center">
						<bean:write name="t12_article" property="createdate" scope="page" />
					</TD>		
					<TD nowrap align="center">
					    <logic:equal value="1" name="t12_article" property="isadminmodify">
					        <FONT color="#ff0000"><bean:write name="t12_article" property="isadminmodify_disp" scope="page" /></FONT>
					    </logic:equal>
						<logic:notEqual value="1" name="t12_article" property="isadminmodify">
						    <bean:write name="t12_article" property="isadminmodify_disp" scope="page" />
						</logic:notEqual>
					</TD>
					
					<!-- 
					<TD nowrap align="center">
						<bean:write name="t12_article" property="creator" scope="page" />
					</TD>
					<TD nowrap align="center">
						<bean:write name="t12_article" property="createdate" scope="page" />
					</TD>	
					 -->
					
					<TD nowrap align="center">
						<logic:equal value="0" name="t12_article" property="flag">
						    <html:link name="map" page="/myknowledge/t12_myarticle/t12_myarticle_norelease_add.do">����   </html:link>
						    <html:link name="map" page="/businessmanager/t12_article/t12_article_audit_auditstat.do">ɾ��   </html:link>
						</logic:equal>
					</TD>		
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

</BODY>
<script language="javaScript">
onloadDo();
</script>
</html:html>

