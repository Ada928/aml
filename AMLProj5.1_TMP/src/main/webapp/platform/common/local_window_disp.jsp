<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%
	/**
	 * �ͻ�ѡ�񹫹�ҳ�棺
	 * Ȩ�ޣ�����ҳ��û��Ȩ�޿���
	 * �ӿڲ�����
	 * form_name form�������
	 * input_name �ͻ��ŵ��ı��������
	 * input_name1 �ͻ����Ƶ��ı��������
	 * ���磺<input type=button value="�� ѯ" name=Button52 class="text_white" onClick="window.open('/pub/cp_host_cust_id_search.jsp?form_name=form1&input_name=s_host_cust_id','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');">
	 *         <html:button property="b2" value="�� ѯ" styleClass="input" onclick="window.open('/common/t00_user_search.do?input_name=username&input_name_disp=realname','enter1','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"/>
	 */
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>��λ</title>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<script language="JavaScript">
  function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
function checkForm(theUrl,type){
    var errMsg ="";
    if(checkRadio(document.forms[0].selectedkey)<0){
        errMsg+="��ѡ����Ҫ��������ţ�";
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
//ȫѡ�л�
function selectORClearBox(_setval){
   var _form=document.forms[0];
   for( var i=0; i < _form.elements.length; i++ ){
        if (_form.elements[i].type == 'checkbox' ){
            _form.elements[i].checked = _setval;
        }
   }
}	
</SCRIPT>
	</HEAD>
	<body class="mainbg">
		<html:form action="/t00_category/category.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">	
					<!-- title -->
						<div class="cond_t">
	  					
	 						 <span class="buttons">
							<a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />�ر�</a> 
							</span>
				</div>
				</div>
				<!-- list -->
				<div class="list">
					<TABLE width="98%" border=0 align="center" cellpadding="2"
						cellspacing="1">
						<TR align=center>
							<Th width="20%">
								����
							</Th>
							<Th width="20%">
								����
							</Th>


						</TR>
						<logic:iterate id="list" name="categoryList"
							type="com.ist.platform.dto.T00_category">

							<TR align="center" bgcolor="#FFFFFF">

								<TD height=22 noWrap>
									<bean:write name="list" property="categorykey" scope="page" />
								</TD>
								<TD height=22 noWrap>
									<bean:write name="list" property="categoryname" scope="page" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
			</div>
		</html:form>
	</BODY>

</HTML>


