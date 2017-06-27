<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("������������"); 
	form.focus(); 
	
	}
} 


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
	document.forms[0].action=theUrl;
    document.forms[0].submit();
    var errMsg = "";
    if(getLength(trim(document.forms[0].templatename.value))==0){
        errMsg+="ģ�����Ʋ���Ϊ�գ�";
        document.forms[0].templatename.focus();
    }else if(getLength(document.forms[0].templatename.value)>=50){
        errMsg+="ģ�����Ʋ��ܳ���50λ��";
        document.forms[0].templatename.focus();
    }else if(getLength(document.forms[0].des.value)>=512){
        errMsg+="ģ���������ܳ���512λ��";
        document.forms[0].des.focus();
    }else if(getLength(document.forms[0].granularity.value)==0){
        errMsg+="���Ȳ�������ѡ��";
        document.forms[0].granularity.focus();
    }else if(getLength(document.forms[0].party_class_cd.value)==0){
        errMsg+="�ͻ����ͱ���ѡ��";
        document.forms[0].party_class_cd.focus();
    }else if(getLength(document.forms[0].tempcategory.value)==0){
        errMsg+="ģ��������ѡ��";
        document.forms[0].tempcategory.focus();
    }else if(getLength(document.forms[0].coverflag.value)==0){
        errMsg+="�Ƿ񸲸Ǳ���ѡ��";
        document.forms[0].coverflag.focus();
    }
    else if(!checkNum(document.forms[0].calculateseq.value)){
        errMsg+="ģ�����˳�����Ϊ���֣�";
        document.forms[0].calculateseq.focus();
    }
    else if(getLength(document.forms[0].calculateseq.value)>3){
        errMsg+="ģ�����˳���ܳ���3λ��";
        document.forms[0].calculateseq.focus();
    }
    if(errMsg==""){
    	alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}
</SCRIPT>
</HEAD>
<body class="mainbg">
<html:form method="post" action="/blacklist/t52_def_temp_modify.do">
<input type="hidden" name="totalSize" value="0" />
<input type="hidden" name="currsqlnum" value="0" />
<input type="hidden" name="pos" value="0" />
<div id="main">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�޸Ļ���ģ��</span>
	 
	</div>
  <html:errors/>
	<div class="cond_c2">
  		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<div align="right">
						<font color="red">*</font>ģ����룺
					</div>
				</td>
				<td>
					<html:text property="templatekey" styleClass="text_white" size="20" readonly="true" />
					<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������� ��"></html:img>
				</td>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						<font color="red">*</font>ģ�����ƣ�
					</div>
				</td>
				<td><html:text property="templatename" /></td>
			</tr>
			<tr>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						ģ��������
					</div>
				</td>
				<td><html:textarea cols="29" rows="3" property="des"></html:textarea>
					<br>
				</td>
				<td bgcolor="F6F9FF" align="left">
					<div align="right">
						ģ�����˳��
					</div>
				</td>
				<td>
					<html:text property="calculateseq" />
				</td>
				
			</tr>
			
			
			<tr>
				
				<td>֤���ţ�</td>
				<td>
					<html:radio property="card_no" value='false' /> ģ��ƥ��
					<html:radio property="card_no" value='true' /> ��ȫƥ��
				</td>
				<td></td>
				<td></td>
			</tr>
			<tr>
				<td>���ƣ�</td>
				<td>
					<html:radio property="name" value='false' /> ģ��ƥ��
					<html:radio property="name" value='true' /> ��ȫƥ��
				</td>
				<td>������</td>
				<td>
					<html:radio property="country_cd" value='false' /> ģ��ƥ��
					<html:radio property="country_cd" value='true' /> ��ȫƥ��
				</td>
			</tr>
			
			<tr>
				<td></td>
				<td align="right" colspan="3">
					<input type="button" name="button1" class="in_button1" value="�� ��" onclick="checkForm('t52_def_temp_modify_do.do')" />
					<input type="reset" name="button1" class="in_button1" value="�� ��" />
				</td>
			</tr>
		</table>
    </div>
    
  </div>
</div>   
</html:form>
<script language="JavaScript">
	/*  var temptype=document.forms[0].temptype.value;
	 if(temptype!=""){
	  var obj=parent.document.all.jf;
	      var obj1=parent.document.all.gs;
	  if(temptype=="1"){
	    obj.style.display=""
	    obj1.style.display="none"
	   }else{
	     obj.style.display="none"
	    obj1.style.display=""
	   }
	 } */
	</script>
</BODY>
</HTML>
