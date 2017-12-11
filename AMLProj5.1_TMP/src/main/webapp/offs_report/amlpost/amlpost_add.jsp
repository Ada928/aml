<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT language="JavaScript" src="../../js/App_Select.js"></script>

<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj=eval('document.forms[0].'+ctrlobj);
		 ctrlobj.value= retval;
	}else{
		//alert("canceled");
	}
}

function checkForm(theUrl){
    var errMsg ="";
    if (getLength(document.forms[0].department.value)==0) {
        errMsg = "�������Ʋ���Ϊ�գ�";
    }
    else if (getLength(document.forms[0].organ_username.value)==0) {
        errMsg = "��λ��������������Ϊ�գ�";
    }
    else if (getLength(document.forms[0].organ_position.value)==0) {
        errMsg = "��λ������ְ�����Ʋ���Ϊ�գ�";
    }
    else if (getLength(document.forms[0].organ_telephone.value)==0) {
        errMsg = "��λ��������ϵ�绰����Ϊ�գ�";
    }
    else if (checkTelephone(document.forms[0].organ_telephone.value)==0) {
        errMsg = "��λ��������ϵ�绰��ʽ����ȷ��";
    }
    else if (getLength(document.forms[0].depart_username.value)==0) {
        errMsg = "��ϴǮ���Ÿ����˲���Ϊ�գ�";
    }
    else if (getLength(document.forms[0].depart_telephone.value)==0) {
        errMsg = "��ϴǮ������ϵ�绰����Ϊ�գ�";
    }
    else if (checkTelephone(document.forms[0].depart_telephone.value)==0) {
        errMsg = "��ϴǮ������ϵ�绰��ʽ����ȷ����ȷ��ʽӦ���ǣ�xxxx-xxxxxxxx";
    }
    else if(!checkNum(document.forms[0].full_time_num.value)){
        errMsg = "רְ����ֻ������������";
    }
    else if(!checkNum(document.forms[0].part_time_num.value)){
        errMsg = "��ְ����ֻ������������";
    }
    var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function changePostitle(value){
   if(value=="3"){
      document.getElementById("status").style.display="block";
   }else{
      document.getElementById("status").style.display="none";
      document.getElementById("us_status").value="";
   }
}


</script>
</HEAD>

<BODY leftmargin="0" topmargin="0" class="mainbg">
<div class="conditions">
<html:form method="post" action="/amlpost/t07_amlpost_add.do">
 
	  
  <div class="cond_t">
	  <span>�����͸�λ������� - �½� 
          </span>
      <span class="buttons">
	   <a href="#" onClick="dosubmit('getT07_amlpost_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />����</a>
 
	  </span>
	</div> 
    
 
  <html:errors/>
  <div class="cond_c">
 <TABLE  border=0  cellPadding=0  cellSpacing=0  >
                <tr  >
			     <td><font color="#FF0000">*</font>�������ƣ�</td>
			     <td>
			   <html:text name="t07_amlpostActionForm" property="department"  size="50" maxlength="128"/> 
			   
			     </td>
		     </tr>
   
			<tr>
			     <td > <font color="#FF0000">*</font>��λ������������</td>
			     <td > 
			    <html:text name="t07_amlpostActionForm" property="organ_username"  size="50"  maxlength="256"/> 
			     </td>
		     </tr>
		     
		       <tr >
			     <td > <font color="#FF0000">*</font>��λ������ְ�����ƣ�</td>
			     <td > 
			    <html:text name="t07_amlpostActionForm" property="organ_position" styleClass="text_white" size="50"  maxlength="32"/> 
			     </td>
		     </tr>
		       <tr>
			     <td   > <font color="#FF0000">*</font>��λ��������ϵ�绰��</td>
			     <td > 
			    <html:text name="t07_amlpostActionForm" property="organ_telephone" styleClass="text_white" size="50"  maxlength="13"/> 
			      <font color="red">��ʽ��xxxx-xxxxxxxx/xxxxxxxxxxx</font>
			     </td>
		     </tr>
		     
		     <tr>
			     <td> <font color="#FF0000">*</font>��ϴǮ���Ÿ����ˣ�</td>
			     <td> 
			    <html:text name="t07_amlpostActionForm" property="depart_username" styleClass="text_white" size="50"  maxlength="128"/> 
			     </td>
		     </tr>
		        
		     
		     <tr>
			     <td> <font color="#FF0000">*</font>��ϴǮ������ϵ�绰��</td>
			     <td> 
			    <html:text name="t07_amlpostActionForm" property="depart_telephone" styleClass="text_white" size="50"  maxlength="13"/> 
			     <font color="red">��ʽ��xxxx-xxxxxxxx/xxxxxxxxxxx</font>
			     </td>
		     </tr>
		     
		     <tr>
			     <td> <font color="#FF0000">*</font>רְ������</td>
			     <td> 
			    <html:text name="t07_amlpostActionForm" property="full_time_num" styleClass="text_white" size="50"  maxlength="10"/> 
			     </td>
		     </tr>
		        
		     
		     <tr>
			     <td> <font color="#FF0000">*</font>��ְ������</td>
			     <td> 
			    <html:text name="t07_amlpostActionForm" property="part_time_num" styleClass="text_white" size="50"  maxlength="10"/> 
			     </td>
		     </tr>
              <tr >
              <td >&nbsp;</td>
              <td colspan="4" align="center"><html:button property="button" styleClass="in_button1" value="�� ��" onclick="checkForm('t07_amlpost_add_do.do')"/>
                <html:reset styleClass="in_button1" value="�� ��"/>
              </td>
            </tr>  
           
        
  </TABLE>
  </div>
 
</html:form>
</div> 
</BODY>
</html>
