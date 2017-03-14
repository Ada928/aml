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
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script language="JavaScript">
      function dosubmit(theUrl,type){
          var errMsg ="";
          if(type=="delete"){
     	      errMsg = CheckBoxMustChecked(document.forms[0]);
          }
          if(type=="modify"){
              errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
          }
    
          if(errMsg!=""){
              alert(errMsg);
              return false;
          }else {
              if(type=="delete"){
			      if(confirm('��ȷ��Ҫɾ�������������?')) {
         		      document.forms[0].action=theUrl;
         		      document.forms[0].target='_self';
        		      document.forms[0].submit();
        		      event.srcElement.disabled = true;
        	      }
              }else{
        	      document.forms[0].action=theUrl;
        	      document.forms[0].target='_self';
        	      document.forms[0].submit();
        	      event.srcElement.disabled = true;
              }
         }
     }
     
     function preview() {
     	var path = "<%=request.getContextPath()%>" + 
     		"/pub/menu_left_tree.do?menu_id=search_engine_preview&srchengkey=" +
     		document.forms[0].srchengkey.value;
     	avpOpenWindow(path);
     }
    </script>
  </head>
  <body>
  	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
  	<div id='content'>
   	  <html:form method="post" action="/search/t02_srch_cate_list.do">
   	    <html:hidden property="srchengkey" />
        <!-- �������� -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">ͳһ��ͼ �� ��������б�</span></td>
			  	<td align="right">
	            <input type="button" name="btnAdd" value="�� ��" onclick="dosubmit('t02_srch_cate_add.do', 'add')">
	            <input type="button" name="btnModify" value="�� ��" onClick="dosubmit('t02_srch_cate_modify.do', 'modify')">
	            <input type="button" name="btnDelete" value="ɾ ��" onClick="dosubmit('t02_srch_cate_delete_do.do', 'delete')">
	            <input type="button" name="btnPreview" value="Ԥ ��" onClick="preview()">
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
 	    <div class='awp_list'>
  	      <table>
	   	    <tr>
	   		  <td>ȫ��</td>
	   		  <td>ҵ�����</td>
	   		  <td>����������</td>
	   		  <td>����ʱ��</td>
	   		  <td>�޸�������</td>
	   		  <td>�޸�ʱ��</td>
	   	    </tr>
            <logic:iterate id="listInfo" name="t02_srch_cateList"  type="com.ist.avp.search.dto.T02_srch_cate">
			  <tr>
				<td align="center" nowrap>
				  <html:multibox property="srchcatekeys">
					<bean:write name="listInfo" property="srchcatekey" />
				  </html:multibox>
				</td>
				<td nowrap>
				  <a href="<%=request.getContextPath() %>/avp/search/t02_srch_info_list.do?srchcatekey=<bean:write name="listInfo" property="srchcatekey" />&srchengkey=<bean:write name="listInfo" property="srchengkey" />&newsearchflag=1&moduleflag=1"><bean:write name="listInfo" property="srchcatename" scope="page" /></a>
				</td>
				<td align="center">
				  <bean:write name="listInfo" property="creator_disp" scope="page" />
				</td>
				<td align="center">
				  <bean:write name="listInfo" property="createdate" scope="page" />
				</td>
				<td align="center">
				  <bean:write name="listInfo" property="modifier_disp" scope="page" />
				</td>
				<td align="center">
			      <bean:write name="listInfo" property="modifydate" scope="page" />
				</td>
			  </tr>
		    </logic:iterate>
          </table>
        </div>
      </html:form>
    </div>
  </body>
</html>