<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<%@ page import="com.ist.util.StringUtils"%>



<html:html>
<HEAD>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
	<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg = "";
    if(getLength(document.forms[0].reason.value)==0){
        errMsg+="����д���������";
        document.forms[0].reason.focus();
    }
    if(errMsg!=""){
     alert(errMsg);
     return false;
   }else{
     document.forms[0].action=theUrl;
     document.forms[0].submit();
   }
}
function _Open(url){
 url=url+"&resulekey="+document.forms[0].resulekey.value
  window.open(url,'enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');
}
function _chengeUrl(url){
   var backurl=document.forms[0].backurl.value;
   var ifram=document.all.sysrule;
   ifram.src=url+'&backurl='+backurl;
}
</script>
</HEAD>

<BODY leftmargin=0 topmargin=0>
<div id="main">
	<html:form method="post" action="/result/t37_party_gs_result.do">
	    <html:hidden property="curr_post"/>	
		<input type="hidden" name="backurl" value="<bean:write name="backurl"/>"/>
		<html:hidden property="resulekey" />
		<html:hidden property="templatekey" />
	    <html:hidden property="party_id" />
	    <html:hidden property="granularity" />
	    <html:hidden property="temptype"/>
	    <html:hidden property="statistic_dt_disp" />
	    <html:hidden property="organkey" />
	    <html:hidden property="flow_id" />
	    <html:hidden property="rate_source" />
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>���������������������</span>
				<span class="buttons">
					&nbsp;
						<a href="#" onclick="_Open('<%=request.getContextPath()%>/risk_rate/t37_risk_attach/t37_risk_attach_list.do?newsearchflag=1')" >  <img src="../../images/blue/b_addreport.png" />�ϴ�����</a>

					</span>
			</div>
		<html:errors />
		<div class="cond_c2">
	 <table width="100%" border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									�ͻ����ƣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="party_chn_name" />
								</td>
							</tr>
							<tr>
								<td>
									ϵͳ����ʱ�䣺
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="statistic_dt_disp" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="party_class_cd" />
								</td>
							</tr>
							<tr>
								<td>
									������ʽ���ƣ�
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsname" />
								</td>
							</tr>
							<tr>
								<td>
									������ʽ��
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="gsrm" />
								</td>
							</tr>
							<tr>
								<td>
									ϵͳ���������
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="fristappralevel_disp" />
									<html:hidden name="t37_party_resultActionForm"
										property="fristappralevel" />	
									<html:hidden name="t37_party_resultActionForm"
											property="level_before_adjust" />
								</td>
							</tr>
							<!--<logic:notEmpty name="t37_party_resultActionForm" property="return_reason">
							    <tr>
								<td>
									�˻�ԭ��
								</td>
								<td>
									<bean:write name="t37_party_resultActionForm"
										property="return_reason" />
								</td>
							</tr>
							</logic:notEmpty>-->
							<tr>
								<td>
									�����ȼ���
								</td>
								<td>
									<html:select property="emendationlevel">
										<html:options collection="levelMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
						
							</tr>
							<tr>
								<td>
									���������
								</td>
								<td>
									<html:textarea property="reason" styleClass="text_white" styleId="reason"
										cols="55" rows="5"></html:textarea>
								
								</td>
							</tr>
							<tr>

								<td>
									&nbsp;
								</td>
								<td>
								<%String curr_post=(String)request.getAttribute("curr_post");
							
			                      String node_id="";
		                          String oper_id="";
		                          String oper_id1="";
			                        if(curr_post.equals("P2001")){
			   		                node_id="N2001"	;
			   		                  oper_id="B20011";
			                        }
			                        else if(curr_post.equals("P2002")){
				   		                node_id="N2002"	;
				   		                oper_id="B20021";
				   		                oper_id1="B20023";
				                       }	 
			                        else if(curr_post.equals("P2003")){
			   		                  node_id="N2003"	;
			   		                  oper_id="B20031";
			   		                  oper_id1="B20033";
			                        }
								 %>

									<input type="button" class="in_button1" value="�ύ"
										onclick="checkForm('t37_result_modify_do.do?node_id=<%=node_id%>&oper_id=<%=oper_id%>')" />
									<% if(!curr_post.equals("P2001")){  %>
									<input type="button" class="in_button1" value="�˻�"
									onclick="checkForm('t37_result_modify_do.do?node_id=<%=node_id%>&oper_id=<%=oper_id1%>')" />
									<%} %>
								</td>
							</tr>
						</table>
					</div>
  </div>	
	

<div class="conditions">
<div id="bigTab">		
	<dl class="tabm">
	     <dd class="tabcur">
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/risk_rate/result/getT37_level_auditList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source" />')">������¼</span>	                       
		</dd>
		
		<dd>
		    <span onclick="_chengeUrl('<%=request.getContextPath()%>/risk_rate/result/getT37_helpcheckList.do?newsearchflag=1&resultkey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&status_cd=2')">Э����Ϣ</span>               
		</dd>	
	</dl>		
</div>
<iframe src="<%=request.getContextPath()%>/risk_rate/result/getT37_level_auditList.do?newsearchflag=1&resulekey=<bean:write name="t37_party_resultActionForm" property="resulekey" />&organkey=<bean:write name="t37_party_resultActionForm" property="organkey"/>&rate_source=<bean:write name="t37_party_resultActionForm" property="rate_source" />" width="100%" height="450" scrolling="auto" frameborder="0" name="sysrule" id="sysrule"></iframe>
</div>
	</html:form>
	</div>
</BODY>
</html:html>

