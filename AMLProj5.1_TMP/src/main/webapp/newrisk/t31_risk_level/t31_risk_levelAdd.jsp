<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!--  
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		-->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		 <script type="text/javascript" src="../../js/calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript">

function checkForm(theUrl){
	 var jsonStr = '<%=request.getAttribute("jsonStr")%>';
	 var riskLevelList = eval(jsonStr); 
     var errMsg ="";
  	 var levelmaxValue = trim(document.forms[0].levelmax.value);
  	 var levelminValue = trim(document.forms[0].levelmin.value);
  	 var levelnameValue = trim(document.forms[0].levelname.value);
  	 
      if(len(levelnameValue) >32){ 
        errMsg="�����������������"; 
        document.forms[0].levelname.focus();
      }
      else if(len(levelnameValue) == 0){ 
        errMsg="�������Ʋ���Ϊ�գ�"; 
        document.forms[0].levelname.focus();
      }
      else if(getLength(levelmaxValue) == 0){
        errMsg="�������޲���Ϊ�գ�";
        document.forms[0].levelmax.focus();
      }
       else if(levelmaxValue >100){ 
        errMsg="�������޲��ܴ���100��"; 
        document.forms[0].levelmax.focus();
      }
      else if(levelmaxValue <0){ 
        errMsg="�������޲���С��0��"; 
        document.forms[0].levelmax.focus();
      } 
      else if(checkDouble(levelmaxValue) == 0){ 
        errMsg="��������������������С����������λ��"; 
        document.forms[0].levelmax.focus();
      }
     else if(getLength(levelminValue) == 0){
        errMsg="�������޲���Ϊ�գ�";
        document.forms[0].levelmin.focus();
      }
      else if(checkDouble(levelminValue) == 0){ 
        errMsg="��������������������С����������λ��"; 
        document.forms[0].levelmin.focus();
      }
      else if(levelminValue <0){ 
        errMsg="�������޲���С��0��"; 
        document.forms[0].levelmin.focus();
      } 
       else if(levelminValue >levelmaxValue){
        errMsg="�������޲��ܴ��ڼ������ޣ�";
        document.forms[0].levelmin.focus();
      }
       else if(levelminValue ==levelmaxValue){
       	if((document.forms[0].maxisclosed.value)!="1"){
       		errMsg="�������޵��ڼ�������ʱ����ѡ����ȷ��";
       		document.forms[0].maxisclosed.focus();
       	}else if((document.forms[0].minisclosed.value)!="1"){
       		errMsg="�������޵��ڼ�������ʱ����ѡ����ȷ��";
       		document.forms[0].minisclosed.focus();
       	}
        
      }
     else if(getLength(document.forms[0].maxisclosed.value) == 0){
        errMsg="��ѡ���������䣡";
       document.forms[0].maxisclosed.focus();
      }
     else if(getLength(document.forms[0].minisclosed.value) == 0){
        errMsg="��ѡ���������䣡";
        document.forms[0].minisclosed.focus();
      }
      if(errMsg==""){
	      for(var i=0;i<riskLevelList.length;i++){
	        if(errMsg!=""){
	        	break;
	        }
		 	if(getFloat(levelmaxValue)>(riskLevelList[i].levelmax)){
		 		if(getFloat(levelminValue)<(riskLevelList[i].levelmax)){
		 			errMsg="�������䲻�ܽ��棡�������޹�С�ڽ��淶Χ�ڣ�"; 
		 			 document.forms[0].levelmin.focus();
		 		}else if(getFloat(levelminValue)==(riskLevelList[i].levelmax)){
		 			if(riskLevelList[i].maxisclosed=="��"){
		 				if((document.forms[0].minisclosed.value)=="1"){
		 					errMsg="�������䲻�ܽ��棡����������Ϊ�����䣡";
		 					document.forms[0].minisclosed.focus();
		 				}
		 			}
		 		}
		 	}else if(getFloat(levelmaxValue)==(riskLevelList[i].levelmax)){
		 		if(riskLevelList[i].maxisclosed=="��"){
		 				errMsg="�������䲻�ܽ��棡�������޹�С�ڽ��淶Χ��"; 
		 				document.forms[0].levelmax.focus();
		 		}else{
		 			if(getFloat(levelminValue)!=(riskLevelList[i].levelmax)){
		 				errMsg="�������䲻�ܽ��棡������������ڼ�������";
		 				 document.forms[0].levelmin.focus(); 
		 			}
		 		}
		 	}else if(getFloat(levelmaxValue)<(riskLevelList[i].levelmax)){
		 		if(getFloat(levelmaxValue)>(riskLevelList[i].levelmin)){
		 				errMsg="�������䲻�ܽ��棡�������޹����ڽ��淶Χ��"; 
		 				document.forms[0].levelmax.focus();
		 		}else if(getFloat(levelmaxValue)==(riskLevelList[i].levelmin)){
		 			if(riskLevelList[i].minisclosed=="��"){
		 				if((document.forms[0].maxisclosed.value)=="1"){
		 					errMsg="�������䲻�ܽ��棡����������Ϊ�����䣡";
		 					document.forms[0].maxisclosed.focus();
		 				}
		 			}
		 		}
		 	}
      
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

 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0" class="mainbg">
		<html:form method="post" action="/t31_risk_level/t13_level_add.do">
		<html:hidden property="levelkey"/>
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>���յȼ����</span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t31_risk_levelList.do');" ><img src="../../images/<%=session.getAttribute("style") %>/b_back.png"/>����</a> </span>
					</div>
					<table width="100" border="0" align="center" cellpadding="0"
						cellspacing="0">
						<tr>
							<td></td>
							<td height="8"></td>
						</tr>
					</table>
					<html:errors />
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>�������ƣ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="levelname" styleClass="text_white"
											size="20"/>
									</div>
								</TD>
								<td></td><td></td>
							</TR>
							
							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
										<font color="#FF0000">*</font>�������ޣ�
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:text property="levelmax" styleClass="text_white" size="20" />
									</div>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>�������ޣ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
										<html:text property="levelmin" styleClass="text_white" size="20"  />
								</TD>
							</TR>

							<TR align="center">
								<TD height="22" bgcolor="ECF3FF">
										<font color="#FF0000">*</font>�������䣺
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">
										<html:select property="maxisclosed">
											<html:options collection="maxisclosedMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
									
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>�������䣺
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
										<div align="left">
										<html:select property="minisclosed">
											<html:options collection="minisclosedMap" property="label"
												labelProperty="value" />
										</html:select>
										<br>
									</div>
								</TD>
							</TR>

							<tr>
								<td align="center" colspan="4">
									<input type="button" class="in_button1" value="�� ��"
										onclick="checkForm('t13_level_add_do.do')" />
									<input type="reset" class="in_button1" value="�� ��" />
								</td>
							</tr>
						</table>
					</div>
		</html:form>
	</BODY>
</HTML>
