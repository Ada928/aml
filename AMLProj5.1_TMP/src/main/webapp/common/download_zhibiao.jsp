<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<jsp:include page="download_info.jsp"/>


<%
  /****  */
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //���������Ѿ��ϴ��ĸ���������
    String url = (String)request.getParameter("url");
    String flag = (String)request.getParameter("flag");
    System.out.println("url:"+url);    
    url = java.net.URLEncoder.encode(url);
    System.out.println("url:"+url);    
%>
<script language="javascript">
       location.href="<%=request.getContextPath()%>/import?tempname=<%=url%>&rad=<%=StringUtils.getRandomString(10)%>";
</script>
