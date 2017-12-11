<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
<head>
	<title></title>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
	<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
   function dosubmit(theUrl,type){
  
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫɾ����������')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add' ){
    	 if(getLength(document.forms[0].dispseq.value)==0){
	        errMsg="��ʾ��Ų���Ϊ�գ�";
	        document.forms[0].dispseq.focus();
	    }else if(getLength(document.forms[0].dispseq.value)> 10){
	        errMsg="��ʾ��Ų��ܶ���10���ַ���";
	        document.forms[0].dispseq.focus();
	    }
        isSub = true;
    }else if(type=='deploy')isSub = true;
    
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t00_roleLocation','checkbox','forms[0]','rolekeys,rolenames','');
	}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>

		<html:form method="post" action="/t10_report/t10_report_list.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">������ - �� ��</span>
						</td>
						<td align="right">
							<input type="button" name="add" value="�� ��"
								onClick="dosubmit('t10_report_deploy_list.do','deploy')"
								class="input">

						</td>
					</tr>
				</table>
			</div>
			<div class="awp_detail">
				<html:hidden property="reportkeys" />
				<html:hidden property="rolekeys" />
				<table>
					<tr>
						<td>
							<font color="red">*</font>�˵���ʾ��ţ�
						</td>
						<td>
							<html:text property="dispseq" styleClass="text_white" size="6"
								maxlength="6" onkeyup="value=value.replace(/[\W]/g,'')" />
						</td>
					</tr>
					<tr>
						<td>
							������ɫ��
						</td>
						<td>
							<html:textarea property="rolenames" styleClass="text_white"
								cols="40" rows="3" disabled="true"></html:textarea>
							<html:button property="Button52" styleClass="text_white"
								onclick="locationrole()">�� ѡ</html:button>
							<br>
							<font color="red">ע���˴�ֻΪ��ɫ׷�Ӳ��������ڽ�ɫ����ģ����ά����ɫ��</font>
						</td>
					</tr>
					<tr>
						<td>
							&nbsp;
						</td>
						<td>
							<html:button property="Button52" styleClass="text_white"
								onclick="dosubmit('deploy_report_do.do','add')">�� ��</html:button>
							<html:reset styleClass="text_white">�� ��</html:reset>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
</body>

</html:html>
