<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<title>�����������</title>
		<%@ include file="../../../bmp/platform/common/style_include.jsp"%>
		<link href="<%=request.getContextPath() %>/skin/<%=style%>/css/awp_base.css" rel="stylesheet" type="text/css">
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>

		<SCRIPT LANGUAGE="JavaScript">
			function dosubmit(theUrl,type){
				var errMsg = '';
				if(type == 'exclude'){
					var checkdes = document.forms[0].checkdes.value;
					if(getLength(trim(checkdes)) == 0){
						alert("��������������");
						return false;
					}else if(getLength(document.forms[0].checkdes.value)==0){
				        errMsg+="�����������Ϊ�գ�";
				        document.forms[0].checkdes.focus();    
				    }
					else if(getLength(document.forms[0].checkdes.value)>4000){
				        errMsg+="����������ܴ���2000�����֣�";
				        document.forms[0].checkdes.focus();    
				    }
				}
				if(errMsg!=""){
			        alert(errMsg);
			        return false;
			    }else{
			        document.forms[0].action=theUrl;
			        document.forms[0].submit();
			    } 
			}
  		</SCRIPT>
	</HEAD>

	<body>
		<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
		<div id='content'>
			<html:form  method="post"
				action="/hpom/t18_download/t18_download_audit_back.do" >
				<html:hidden property="dloadback"/>
					<div class='awp_title'>
     					<table>
		                    <tr>
		                    	<td width="23%" nowrap><span class="awp_title_td2">��  ��
								- �� ��</span>
								</td>
		                        <td  align="right">
			                        <input
									type="button" name="btsearch2" value="��  ��"
									onclick="dosubmit('<%=request.getContextPath()%>/bmp/hpom/t18_download/t18_download_list.do','back');" />
		                        </td>
		                    </tr>
		                </table>
					</div>
				
				<div class="awp_detail">
				      <table >
				        
				        <tr>
				          <td nowrap><font color="red">*</font>�˻������<br>(���2000������)</td>
				          <td colspan='3'>
				          	<html:textarea property="auditdesc" cols="69" rows="4"></html:textarea>
				          </td>
				        </tr>
				        <tr>
				          <td></td>
				          <td colspan='3'>
				          	<input type="button" name="btnsearch" value="��  ��" onClick="dosubmit('<%=request.getContextPath() %>/bmp/hpom/t18_download/t18_download_audit_back.do','save');">
				          	<input type="reset" value="��  ��"> 
				          </td>
				        </tr>
				      </table>
			     </div>
			</html:form>
		</div>
	</body>
</html>