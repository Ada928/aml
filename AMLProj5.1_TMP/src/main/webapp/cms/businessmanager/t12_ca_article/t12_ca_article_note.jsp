<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
  
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_ca_article/t12_ca_article_add_do.do">

			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">������ - �½���ʾ</span>
                        </td>
                        <td align="right" nowrap>
                        </td>
                    </tr>
                </table>
            </div>
			
 		   <div class="awp_msgtab">
			  <table>
				<tr> 
			        <td ><p><strong>ϵͳ��ʾ��</strong><br>
			            <ol>
							<li> ����������½��������Ҫ�½��������ά�����������㼶
						</ol>
			        </td>
		        </tr>
		      </table>
           </div>
		</html:form>
	</div>
</body>
</html:html>
