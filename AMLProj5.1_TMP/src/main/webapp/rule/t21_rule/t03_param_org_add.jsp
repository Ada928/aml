<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>����������</title>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
        <script language="JavaScript" src="../../js/basefunc.js"></script>
        <script type="text/javascript" src="../../js/jquery.js"></script>
        <script type="text/javascript" src="../../js/aml.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="../../js/avpfunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	function checkForm(theUrl){
	   var errMsg ="";	 
    if(getLength(document.forms[0].parmname.value)==0){
        errMsg+="��ʾ���Ʋ���Ϊ�գ�";
        document.forms[0].parmname.focus();    
    }else if(getLength(document.forms[0].parmname.value)>64){
        errMsg+="��ʾ���Ʋ��ܴ���32�����֣�";
        document.forms[0].parmname.focus(); 
    }    
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    if(getLength(document.forms[0].des.value)>256){
        errMsg+="�������ܴ���128�����֣�";
        document.forms[0].des.focus();  
         alert(errMsg);
        return false;  
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
 <BODY leftmargin="0" topmargin="0" >
 <div id="content">
 <html:form method="post" action="/t21_rule/t03_param_org_add.do">
 	  	<html:hidden property="tplakey"/>
	<div class="conditions">			
			<div class='cond_t'>
			   <span>������� - �½���������</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onClick="checkForm('t03_param_org_add_do.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
							 	
				<a href="javascript:void(0);" onClick="dosubmit('t03_param_org_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
			   </span>
				</div> 		

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='cond_c2'>
							<table border="0" cellpadding="0" cellspacing="0">
								<tr >
									<td >
										<font color="#FF0000">*</font>�������룺
									</td>
									<td >										
									p_<html:text property="parmvalkey" size="25" />
									</td>
								</tr>
								<tr>
									<td>
										<font color="#FF0000">*</font>��ʾ���ƣ�
									</td>
									<td>
										<html:text property="parmname"  size="25" />�����32�����֣�
									</td>
								</tr>
								<tr>
									<td>
										<font color="#FF0000">*</font>�������ͣ�
									</td>
									<td>
										<html:select property="parmtype">
											<html:options collection="parmtypeMap" property="label" labelProperty="value"/>
										</html:select>
									</td>
								</tr>	
					
								<tr >
									<td>
										������<br>�����128�����֣�
									</td>
									<td >
									   <html:textarea property="des" style="width:95%" rows="6"></html:textarea>
									</td>
								</tr>
							</table>
						</div>
				</div>		
						
						
		</html:form>
		</div>	
	</BODY>
</HTML>
