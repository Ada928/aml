<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
    <%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript">
        function checkForm(theUrl){
        	var result = checkform();//У���
			if(result){
                awpDoSubmit(theUrl);
            }
        }
    </script>
  </head>
  <body>
 	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
    <div id='content'>
      <html:form method="post" action="/search/t02_srch_cate_add.do">
   	    <html:hidden property="srchengkey" />
        <!-- �������� -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">ͳһ��ͼ �� ����ҵ�����</span></td>
		      	<td align="right">
		            <input type="button" value="�� ��" onClick="checkForm('t02_srch_cate_add_do.do');">
		            <input type="button" value="�� ��" onClick="awpDoSubmit('t02_srch_cate_list.do');">
			        &nbsp;
	          </td>
	        </tr>
	      </table>
        </div>
	    <!-- ������Ϣ��ʾ�� -->
	    <html:messages id="errors" message="true">
          <bean:write name="errors" filter="fasle" />
        </html:messages>
	    <!-- ��ѯ������ -->
	    <!-- ������ -->
 	    <div class='awp_detail'>
  	      <table>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>������ƣ�</td>
              <td><html:text property="srchcatename" minlength="1" maxlength="64" warning="�������"/>�����32�����֣�</td>
            </tr>
            <tr>
	   	      <td nowrap>��ʾ��ţ�</td>
              <td><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="��ʾ���"/>�����3λ���֣�</td>
            </tr>
	   	    <tr> 
              <td>����˵����<br>�����128�����֣�</td>
              <td colspan=3> 
                <html:textarea property="fundes" rows="4" maxlength="256" warning="����˵��"/>
              </td>
           </tr>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>