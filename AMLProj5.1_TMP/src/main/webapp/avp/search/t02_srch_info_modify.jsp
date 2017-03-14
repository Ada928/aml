<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
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
      <html:form method="post" action="/search/t02_srch_info_modify.do">
   	    <html:hidden property="srchcatekey" />
   	    <html:hidden property="oldtplakey"/>
        <html:hidden property="srchengkey" />
        <!-- �������� -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">�޸���תģ��</span></td>
		      	<td align="right">
		            <input type="button" name="Submit1" value="�� ��" onClick="checkForm('t02_srch_info_modify_do.do');">
		            <input type="button" name="Submit1" value="�� ��" onClick="awpDoSubmit('t02_srch_info_list.do');">
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
              <td nowrap><font color="#FF3300">*</font>�������ƣ�</td>
              <td nowrap="nowrap" colspan="3"><html:text property="srchname" minlength="1" maxlength="64" warning="��������"/>�����32�����֣�</td>
	   	    </tr>
	   	    <tr>
	   	      <td nowrap><font color="#FF3300">*</font>ģ�����ƣ�</td>
	   	      <td nowrap="nowrap" colspan="3">
	   	        <html:hidden property="tplakey"/>
                <html:text property="tplaname" readonly="true" minlength="1" warning="ģ������" />
           		<input type="button" name="locate" value="�� λ" 
				 onClick="locate_pop_window('<%=request.getContextPath()%>','t02_TemplateLocation','radio','forms[0]','tplakey,tplaname','tplastat=1 and dptmid=100111');" />
			    ����ѡ��
              </td>
            </tr>
	   	    <tr> 
              <td nowrap>ҳ����ת���ͣ�</td>
              <td nowrap="nowrap" colspan="3">
				<html:select property="jumpcate">
	              <html:options collection="jumpcateMap" property="label" labelProperty="value" />
                </html:select>
             </td>
           </tr>
           <tr>
		       <td nowrap>��ʾ��ţ�</td>
  			   <td colspan="3"><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="��ʾ���"/>�����3λ���֣�</td>
		   </tr>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>