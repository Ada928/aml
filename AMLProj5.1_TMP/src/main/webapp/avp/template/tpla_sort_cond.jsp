<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<!-- ������� -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>

	
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_��������</title>
		<script language="javascript"
			src="../../js/basefunc.js"></script>
		<script language="JavaScript"
			src="../../js/uc.js"></script>
		<script language="JavaScript"
			src="../../js/selectbox.js"></script>
		<script language="JavaScript"
			src="../../js/avpfunc.js"></script>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="JavaScript">
		function doSubmit(theUrl){
			var sortSelObj = document.getElementById("sort_cond");
			selectAllOptions(sortSelObj);
			avpJumpSubmit(theUrl);
		}
		</script>
			
	</HEAD>

	<BODY >
		<html:form method="post" action="/template/tpla_sort_cond.do">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - ��������</span></td>
						<td align="right">
							<c:out value="${returnButtonHtml}" escapeXml="false"></c:out>  </td>
					</tr>
				</table>
			</div> 
			

		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
		
		<div class='awp_detail'>
			<table>
				<tr >
					<td width="*" align='right' nowrap="nowrap">�������ݣ�</td>
					<td width="250" align='center'>
						<select name="disp_cond" style="{width:210px}" size="15"  multiple="multiple"
							ondblclick="moveSelectedOptions(this.form['disp_cond'],this.form['sort_cond'])">
							<c:forEach var="disp_col" items="${selColMap}">
								<option value='<c:out value="${disp_col.key}"/>'>
									<c:out value="${disp_col.value.DISPNAME}"/>
								</option>
							</c:forEach>
						</select>
					</td>
			
					<td align='center'>
						<input type='button' onClick="moveSelectedOptions(this.form['disp_cond'],this.form['sort_cond'])" value="&nbsp;&nbsp;&gt;&gt;&nbsp;&nbsp;">
                		<BR><BR>  
						<INPUT type='button' onClick="moveAllOptions(this.form['disp_cond'],this.form['sort_cond'])" value="ȫ��&gt;&gt;">
                		<BR><BR>  
						<INPUT type='button' onClick="moveSelectedOptions(this.form['sort_cond'] , this.form['disp_cond'])" value="&nbsp;&nbsp;&lt;&lt;&nbsp;&nbsp;">
                		<BR><BR>  
						<INPUT type='button' onClick="moveAllOptions(this.form['sort_cond'],this.form['disp_cond'])" value="ȫ��&lt;&lt;">   
					</td>
    
					<td width="250" align='center'>
						<select id="sort_cond" name="sort_cond"  size="15"  multiple="multiple" ondblclick="moveSelectedOptions(this.form['sort_cond'] , this.form['disp_cond'])" style="{width:210px}">
						</select>
					</td>
    
					<td align='center'>
						<INPUT type=button onClick="setOptionAsc(this.form['sort_cond'])" value="�����">
                		<BR><BR>  
						<INPUT type=button onClick="setOptionDesc(this.form['sort_cond'])" value="�����">
                		<BR><BR>  
						<INPUT type=button onClick="moveOptionUp(this.form['sort_cond'])" value="���ơ�">
                		<BR><BR>  
						<INPUT type=button onClick="moveOptionDown(this.form['sort_cond'])" value="���ơ�">   
					</td>
				</tr>
 		       <tr>
					<td >&nbsp;</td>
            		<td align="left" colspan=4> 
                		<input type="button" value="�� ��" onClick="doSubmit('tpla_sort_rslt.do?new_qry_flag=1&intPage=1&wherefrom=trunpage')">	
                			 
                		<input type="reset"  value="�� ѡ"  >  
			  		</td>
         		</tr>
   			</table>
	</div>
	
			<div id='loading' class='css012'>
				<font color='#FF0000'>���ڼ������ݣ����Ժ�...</font>
			</div>
	
			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
			
		</html:form>
	</BODY>
</HTML>
