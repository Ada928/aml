<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<HEAD>
 
 <meta http-equiv=Content-Type content="text/html; charset=GBK" /> 
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />


  <%String url = request.getContextPath();
     //String cssurl=url+"/css/css_all.css";
     
     String  titlejsurl=url+"/js/title.js";
     String basefuncurl=url+"/js/basefunc.js";
   %>

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script type="text/javascript" src="../../js/jquery.js"></script> 
<script type="text/javascript" src="../../js/aml.js"></script>

<script language="JavaScript" src=<%=titlejsurl%>></script>
<script language="JavaScript" src=<%=basefuncurl%>></script>

<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){  
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
function opersubmit(theUrl,obj){
   //form1.oper_id.value=obj.name;
    if(confirm("ȷ�����Ĳ�����!")){
          dosubmit(theUrl);
    }
}
function opersubmit1(theUrl,obj){
   //form1.oper_id.value=obj.name;
    if(confirm("                ��ȷ���Ѱ�Ҫ��У���ϱ���Ϣ������ ���򽫻ᱻϵͳ�˻أ�����                               ")){
   
          dosubmit(theUrl);
    }
}
function tasksubmit(theUrl,task_id){  
  // form1.task_id.value=task_id; 
   dosubmit(theUrl);
}
</SCRIPT>

</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<html:form action="/case/t07_flow_list.do" method="post">

  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span> <strong><font color="0072BC"><bean:write name="title"/> - <%=com.ist.util.Constans.CASE_NAME %>��Ϣ - ������Ϣ</font> </strong> </span>
	  <span class="buttons">
	   <a href="#" onClick="dosubmit('<%=request.getContextPath() %><bean:write name="backUrl"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" /> �� ��</a>
 </span>
	</div>
	
<html:errors/>

 <div class="cond_c2">
   
          <table width="100%" border="0" cellpadding="1" cellspacing="1">
             <tr >
              <td ><%=com.ist.util.Constans.CASE_NAME %>���ƣ�</td>
              <td ><bean:write property="case_name" name="t07_case_application" /></td>
              <td ><%=com.ist.util.Constans.CASE_NAME %>���ͣ�</td>
              <td >
              <bean:write name="t07_case_application" property="cast_type_disp"/>
              <html:hidden name="t07_case_application" property="cast_type"/>
              </td>
            </tr>
            <tr >
             <td >�������ࣺ</td>
              <td> <bean:write name="t07_case_application" property="case_kind_disp"/>
              						<html:hidden name="t07_case_application" property="case_kind" />
              </td>            
                 <td ><%=com.ist.util.Constans.CASE_NAME %>״̬��</td>
              <td><bean:write name="t07_case_application" property="app_state_cd_s"/>
              					   <html:hidden name="t07_case_application" property="app_state_cd"/>
              </td>
            </tr>
             <tr>
              <td>�������ƣ�</td>
              <td> <bean:write property="app_org_id"  name="t07_case_application" />
              						<html:hidden property="organkey"  name="t07_case_application" />
              </td>
              <td>�������ڣ�</td>
              <td> <bean:write property="app_dt_disp"  name="t07_case_application" /></td>
            </tr>  
          </table>
  </div>
    </div>
    
    <div class="cond_t">
	  <span> <strong><font color="0072BC"><font color="0072BC"><%=com.ist.util.Constans.CASE_NAME %>���</font> </strong> </span>
	</div>
<div class="list">
<table>
     <tr >
      <th>��������</th>
      <th>��λ����</th>
      <th>����Ա</th>
      <th><%=com.ist.util.Constans.CASE_NAME %>���</th>
    </tr>
     <logic:iterate id="advi" name="getT07_case_adviList" type="com.ist.aml.report.dto.T07_case_application">
     <tr >  
      <td><bean:write name="advi" property="organname" scope="page"/></td>
      <td><bean:write name="advi" property="post_name" scope="page"/></td>
      <td><bean:write name="advi" property="last_upd_user" scope="page"/></td>  
      <td><bean:write name="advi" property="reason" scope="page"/></td>  
     </tr>  
    </logic:iterate>
</table>
 </div>
 

   </html:form>


<%String root=request.getContextPath();
  String root1=root+"/report/case/case_disp.do?newsearchflag=1"; 
  String root2=root+"/report/case/case_disp1.do?newsearchflag=1";%>
<%-- ���� --%>
<logic:equal name="t07_case_application" property="case_kind" value="N"> 
<iframe src=<%=root2 %> scrolling="NO"  width="100%" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- �ر� --%>
<logic:equal name="t07_case_application" property="case_kind" value="A">
 <iframe src=<%=root2%> width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- ���� --%>
<logic:equal name="t07_case_application" property="case_kind" value="C">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath() %>/pbcreport08/validate/cbh_tsdt_validate_list08.do?fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath() %>/pbcreport08/report/nbs_base_info08.do?newsearchflag=1&fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal> 
<%-- �ر� --%>
<logic:equal name="t07_case_application" property="case_kind" value="R">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath() %>/pbcreport08/validate/nbh_ctif_validate_list08.do?reported=0&fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath() %>/pbcreport08/report/nbs_base_info08.do?reported=0&newsearchflag=1&fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal> 
<%-- ɾ�� --%>
<logic:equal name="t07_case_application" property="case_kind" value="D">
 <iframe src="<%=request.getContextPath() %>/report/case/dbh_dtdt_list.do?casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<%-- ���� --%>
<logic:equal name="t07_case_application" property="case_kind" value="I">
<logic:equal name="t07_case_application" property="cast_type" value="1">
 <iframe src="<%=request.getContextPath() %>/pbcreport08/validate/ibh_ctif_validate_list08.do?reported=0&fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
<logic:equal name="t07_case_application" property="cast_type" value="2">
  <iframe src="<%=request.getContextPath() %>/pbcreport08/report/nbs_base_info08.do?reported=0&newsearchflag=1&fromcase=1&tag=1&casekey=<bean:write name='t07_case_application' property='application_num'/>" width="100%" scrolling="NO" height="1200" name="test"  frameborder="0"></iframe>
</logic:equal>
</logic:equal>
</div>
</BODY> 

</html>



