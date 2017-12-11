<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<SCRIPT LANGUAGE="JavaScript">
		
		
function checkForm(theUrl){
     var errMsg ="";
 
     if(getLength(document.forms[0].party_id.value)==0){
        errMsg="�ͻ��Ų���Ϊ�գ�";
        }  
     if(getLength(errMsg) == 0 && getLength(document.forms[0].obj_name.value) == 0){
	    errMsg="�ͻ����Ʋ���Ϊ�գ�";
	    }
	 if(getLength(errMsg) == 0 && getLength(document.forms[0].party_class_cd.value) == 0){
	    errMsg="��ѡ��ͻ����ͣ�";
	    } 
      if(getLength(errMsg) == 0 && getLength(document.forms[0].isuse.value) == 0){
	    errMsg="��ѡ���Ƿ����ã�";
	    }
	        
     if(errMsg!=""){
        alert(errMsg);
        return false;
     }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}

function _Open(url){
    url=url+".do?input_name=party_id&input_name_disp=obj_name&input_name_type=party_class_cd";
  window.open(url,'','height=500, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
  // window.open(url);
      
}
 function dosubmit(theUrl){     
            document.forms[0].action=theUrl;
            document.forms[0].submit();
    }

</SCRIPT>
	</HEAD>
	<BODY  class="mainbg">
		<div id="main">
		<html:form method="post" action="/listmanager/t07_grey_add.do">
		
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>�½�������</span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('t07_grey_list.do?newsearchflag=1')"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a> </span>
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
								<TD>
								<div align="right">
										<font color="#FF0000">*</font>�ͻ��ţ�
										</div>
								</TD>
								<TD bgcolor="F6F9FF" align="left">
									<html:text property="party_id" value=""></html:text>
								</TD>
								<TD height="22" bgcolor="ECF3FF">
									<div align="right">
										<font color="#FF0000">*</font>�ͻ����ƣ�
									</div>
								</TD>
								<TD bgcolor="F6F9FF">
									<div align="left">

										<html:text property="obj_name" styleClass="text_white" maxlength="50"
											size="20" value="" />
											<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=obj_name&type=party_class_cd','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" >
											<span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span>
											</a>

										
									</div>
								</TD>
							</TR>

							<TR align="center">
								<TD >
									<div align="right">
										<font color="#FF0000">*</font>�ͻ����ͣ�
									</div>
								</TD>
								<TD >
									<div align="left">
										<html:select property="party_class_cd">
											<html:options collection="list_typeMap" property="label"
												labelProperty="value" />&nbsp;</html:select>
										<br>
									</div>
								</TD>
								<TD >
									<div align="right">
										<font color="#FF0000">*</font>�Ƿ����ã�
									</div>

								</TD>
									<TD >
								
											<html:select property="isuse">
												<html:options collection="isuseMap" property="label"
													labelProperty="value" />
											</html:select>
							
								</TD>
							</TR>

							<TR >
								
								<td>
									��ע��
								</td>
								<td colspan="3">
									<html:textarea cols="50" rows="3" property="reason_create"></html:textarea>
									<br>
								</td>
							</tr>

							
							<tr>
								<td>
								</td>
								<td align="right">
									<input type="button" name="button1" class="in_button1" value="�� ��"
										onclick="checkForm('t07_grey_add_do.do')" />
									<input type="reset" name="button1" class="in_button1" value="�� ��" />
								</td>
							</tr>
						</table>
					</div>
			 </div>
		</html:form>
			</div>
	</BODY>
</html>
