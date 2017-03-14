<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>

<%String contextPath = request.getContextPath(); %>

<html>
 <head>
  	<meta http-equiv=Content-Type content="text/html; charset=gb2312">
  	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">

  	<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
  	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
  	<script language="JavaScript" src="<%=contextPath%>/js/title.js"></script>    
 </head>
 
 <script language="JavaScript">

	function importDo() {
		var url = "srchEngImportDo.do";
		
		var fileName = document.forms[0].filename.value;
		if (len(trim(fileName)) == 0) {
			alert("��ѡ���ϴ��ļ���");
			return;
		}

		if (fileName.substr(fileName.length - 3) != "dat" || 
				fileName.substr(fileName.length - 3) != "dat") {
			alert("��ѡ���Ѿ������������ļ���");
			return;
		}
		document.forms[0].action=url;
		document.forms[0].submit();
	}

	function gotoSrchEngList() {
		var url = "t02_srch_eng_inf_list.do?newsearchflag=1";
		document.forms[0].action=url;
		document.forms[0].submit();
	}
 </script>

 <body>
  <!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
  <div id='content'>
   <html:form method="post" action="/search/srchEngImportDo.do" enctype="multipart/form-data">
   <!-- �������� -->
    <div class='awp_title'>
     <table>		
      <tr>
      	<td width="23%"><span class="awp_title_td2">ͳһ��ͼ �� ����</span></td>
       	<td align="right">
        	<input type="button" name="btnsearch" value="����" class="botton" onclick="importDo();">
        	<input type="button" name="btn" value="�� ��" class="botton"  onClick="gotoSrchEngList();">
        	&nbsp;
       </td>
      </tr>
     </table>
    </div>
    
	<html:messages id="message" message="true">
	 	<bean:write name="message" filter="false" />
    </html:messages>
    <div class='awp_detail' >
     <table>
      <tr>
       <td>ѡ�������ļ���</td>
       <td colspan="3" ><html:file property="filename" size="60" styleClass="botton" /></td>
      </tr>									
     </table>
    </div>
   </html:form>
  </div>
 </body>
</html>
