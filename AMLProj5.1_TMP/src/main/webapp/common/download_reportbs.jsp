<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.ist.util.StringUtils" %>
<%
  /****  */
    response.setHeader("Pragma", "No-cache");
    response.setHeader("Cache-Control", "no-cache");
    response.setDateHeader("Expires", 0);
    //���������Ѿ��ϴ��ĸ���������
    String url = (String)request.getParameter("url");
    url = java.net.URLEncoder.encode(url);  
%>
<script language="javascript">
    window.open('<%=request.getContextPath()%>/import?tempname=<%=url%>&downloadtype=attach&rad=<%=StringUtils.getRandomString(10)%>','','height=0, width=0,left=0,top=0,scrollbars=no,resizable=no');
    location.href="<%=request.getContextPath()%>/pbcreport/report/normal_spc_exportlist.do";
</script>
