<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/javascript" src="../js/aml.js"></script>
		<script type="text/javascript" src="../js/basefunc.js"></script>
		<script type="text/javascript" src="../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl, type) {
		var errMsg = "";
		var isSub = false;
		 if (type == 'back') {
			isSub = true;
		}
		if (isSub && errMsg == '') {
			document.forms[0].action = theUrl;
			document.forms[0].submit();

		} else {
			if (errMsg != '')
				alert(errMsg);
			return false;
		}
	}
	function checkForm(theUrl){
	 var errMsg ="";
	 	if(getLength(trim(document.forms[0].tablecname.value)) == 0){
	        errMsg+=" ������������Ϊ�գ�";
	        document.forms[0].tablecname.focus();
	    }else if(getLength(document.forms[0].tablecname.value)>256){
	        errMsg+="�����������ܶ���256���ַ���";
	        document.forms[0].tablecname.focus();
	    } else if(getLength(document.forms[0].des.value)>256){
	        errMsg+="��ע���ܶ���256���ַ���";
	        document.forms[0].des.focus();
	    }
		if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	    	document.forms[0].tablecname.value=trim(document.forms[0].tablecname.value);
	    	document.forms[0].des.value=trim(document.forms[0].des.value);
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	
	}
	
</SCRIPT>
	</HEAD>
	<body class="mainbg">
			<html:form action="/t18_ods_table_modify.do" method="POST">
			<html:errors/>
			<html:hidden property="tableename"/>
			<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
			<div class="cond_t">
				<span>ҵ��� - �޸�</span>
				<span class="buttons">
					<a href="#" onclick="checkForm('t18_ods_table_modify_do.do')"><img src="../images/blue/b_save.png" />�� ��</a> 
					<a href="#" onclick="dosubmit('t18_ods_tableList.do','back')"><img src="../images/blue/b_back.png" />�� ��</a> 
				</span>
			</div>
		</div>
		<div id='content'>
				<div class="cond_c2">
			 		<table border="0" cellpadding="0" cellspacing="0">
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>Ӣ������
							</td>
							<td>								
								<bean:write name="t18_ods_tableActionForm" property="tableename"/>							
							</td>
						</tr>
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>��������
							</td>
							<td>
								<html:text property="tablecname" styleClass="text_white" size="30" />
							</td>
						</tr>
						<tr>
							<td noWrap>
								<font color="#FF0000">*</font>���ȣ�
							</td>
							<td>
								<html:select property="granularity">
									<html:options collection="granularitymap" property="label" labelProperty="value"/>	
								</html:select>
							</td>
						</tr>
						<tr>
							<td noWrap>
								��ע��
							</td>
							<td>								
								<html:textarea property="des" cols="6" rows="10" style="width=670"></html:textarea>
							</td>
						</tr>
					</TABLE>		
				</div>
				</div></div>			
			</html:form>
	</BODY>
</HTML>
