
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script language="JavaScript" src="../../js/title.js"></script>
	<script language="javascript" src="../../js/basefunc.js"></script>
	<script language="javascript" src="../../js/uc.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
	<script language="JavaScript">
function checkForm(theUrl){

    var errMsg ="";
    var tt_u = eval(document.forms[0].upper_limit_disp.value);
   
    var tt_l = eval(document.forms[0].low_limit_disp.value);
   
    
  	if(!checkFloat(document.forms[0].upper_limit_disp.value) && idx_u<0){
		errMsg+="ֵ�����ޱ���Ϊ���֣�";
        document.forms[0].upper_limit_disp.focus();
	}
	  if(!checkFloat(document.forms[0].low_limit_disp.value) && idx_l<0){
		errMsg+="ֵ�����ޱ���Ϊ���֣�";
        document.forms[0].low_limit_disp.focus();
	}
	if(getLength(document.forms[0].upper_limit_disp.value)>16){
	     	errMsg+="���Ȳ��ܴ���16λ��";
        document.forms[0].upper_limit_disp.focus();
	}
	if(getLength(document.forms[0].low_limit_disp.value)>16){
	     	errMsg+="���Ȳ��ܴ���16λ��";
        document.forms[0].low_limit_disp.focus();
	}
	
	if(document.forms[0].upper_limit_disp.value!="" && document.forms[0].low_limit_disp.value!=""){
		
			if(tt_u<tt_l)
	    		errMsg+="ֵ�����޲���С������5��";
	}
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].upper_limit.value=tt_u;
        document.forms[0].low_limit.value=tt_l;
       
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
    opener.location.reload();
    window.close();
}



</script>
</head>

<body class="mainbg">
	<div id="main">
		<html:form method="post" action="/valpara/t07_valpara_modify.do">
			<div class="conditions">
				<div class="cond_t">
					<span> �޸�ָ����ֵ </span>
					<span class="buttons"> <a href="#"
						onclick="javascript:window.close();"><img
								src="../../images/<%=session.getAttribute("style") %>/b_shut.png" width="20" height="20" />�ر�</a> </span>
				</div>
				<html:errors />
				<div class="cond_c2">
					<table border=0 cellpadding=0 cellspacing=0>

						<tr>
							<td>
								ֵ�����ޣ�
							</td>
							<td>
								<html:text property="upper_limit_disp" styleClass="text_white" />
								<html:hidden property="upper_limit"/>
							</td>
						</tr>
						<tr>
							<td>
								ֵ�����ޣ�
							</td>
							<td >
								<html:text property="low_limit_disp" styleClass="text_white" />
								<html:hidden property="low_limit"/>
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;

							</td>
							<td colspan="4" align="center" class="in_button">
								<html:hidden property="valparakey"  />
								<input type="button" value="�� ��"
									onclick="checkForm('t07_valpara_modify_do.do?newsearchflag=1')" />
								<input type="reset" value="�� ��" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</div>
</body>
</html:html>
