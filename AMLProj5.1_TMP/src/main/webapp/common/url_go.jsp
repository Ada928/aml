<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils"%>
<jsp:useBean id="authBean" scope="session" class="com.ist.common.AuthBean"/>
<jsp:useBean id="authorization" class="com.ist.common.Authorization" />
<jsp:useBean id="authBo" class="com.ist.platform.bo.AuthorizationBO" />
<%
    //ת�Ƶ���Ӧ�Ĺ��ܵ��� 
    authorization = authBean.getAuthToken();
    String go_url = (String)request.getParameter("go_url");
    String modulekey = (String)request.getParameter("modulekey");
    String modulename = (String)request.getParameter("modulename");
    String systemkey = (String)request.getParameter("systemkey");
    authBo.writeSystemLog(authorization,modulekey,modulename) 	;
//    //authorization.writeClickModuleLog(modulekey,modulename);
    //���û���������ˡ����󣬿��ܻ����ҳ�治ˢ�£����ܵ���systemkeyû����������
    //���ÿ���л�url��ʱ����Ҫ��֤systemkey�Ƿ���ȷ
    //�������ȷ��Ҫ����������
   // if(!authorization.getT00_group().getSystemkey().equals(systemkey)){
        //���������
//        authorization.setCurrentLoginSystem(systemkey);
//        authBean.setAuthToken(authorization);
  //  }
//    //System.out.println("systemkey = "+authorization.getCurrentLoginSystem());
    if(go_url.indexOf("?")>0){
        go_url = go_url+"&ram="+StringUtils.getRandomString(10);
    }else{
        go_url = go_url+"?ram="+StringUtils.getRandomString(10);
    }
	System.out.println(go_url);
        System.out.println(modulekey);
        System.out.println(modulename);
        System.out.println(systemkey);
    response.sendRedirect(go_url);
%>
