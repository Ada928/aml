<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
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
    //�Ƿ������⽻����
    if (getLength(document.forms[0].spec_flag.value)==0) {
        errMsg = "�Ƿ������⽻���벻��Ϊ�գ�";
        document.forms[0].spec_flag.focus();
    }
       
    //���Ĵ���
    else  if (getLength(document.forms[0].tx_cd.value)==0) {
        errMsg = "���Ľ��״��벻��Ϊ�գ�";
        document.forms[0].tx_cd.focus();
    }
    else if(document.forms[0].tx_cd.value.length>4){
    	errMsg = "���Ľ��״��볤�Ȳ��ܳ���4λ��";
    }
    //���״�������
    else if (getLength(document.forms[0].tx_name.value)==0) {
        errMsg = "���״������Ʋ���Ϊ�գ�";
        document.forms[0].tx_name.focus();
    }
   
     
    //�ֳ���־
    else if (getLength(document.forms[0].tx_falg.value)==0) {
        errMsg = "�ֳ���־����Ϊ�գ�";
        document.forms[0].tx_falg.focus();
    } 
     //���׷�ʽ
    else if (getLength(document.forms[0].tx_team.value)==0) {
        errMsg = "���׷�ʽ����Ϊ�գ�";
        document.forms[0].tx_team.focus();
    } 
    //�Ƿ���Ч 
    else if (getLength(document.forms[0].flag.value)==0) {
        errMsg = "�Ƿ���Ч����Ϊ�գ�";
        document.forms[0].flag.focus();
    } 
else if(getLength(document.forms[0].spec_flag.value)>0){
    var spec_flag_val=document.forms[0].spec_flag.value;
    if(spec_flag_val=="1"){
     //�̻�����
<%--       if(getLength(document.forms[0].mer_cat_cd.value)==0){--%>
<%--         errMsg = "�̻����Ͳ���Ϊ�գ�";--%>
<%--        document.forms[0].mer_cat_cd.focus();--%>
<%--        }else{--%>
           var tx_team_val= document.forms[0].tx_team.value;
          if(tx_team_val!="20"){
           //�Ƿ����
           if(getLength(document.forms[0].is_out_bank.value)==0){
              errMsg = "�Ƿ���в���Ϊ�գ�";
             document.forms[0].is_out_bank.focus();
                }
           }
<%--       }--%>
    }
}
    var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
    	document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</script>
</HEAD>

<BODY leftmargin=0 topmargin=0>
<div id="main">
<html:form method="post" action="/t87_tx_cd/t87_tx_cd_add.do">
     <div class="conditions">
     <div class="cond_t">
	  <span>�½����״�����Ϣ 
          </span>
      <span class="buttons">
       <a href="#" onclick="dosubmit('t87_tx_cd_list.do')"> 	   <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a>
 
      </span>
      </div>
  <html:errors/>
    <div class="cond_c">
 <TABLE   cellPadding=0   cellSpacing=0  border="0">
   
            <tr  >
              <td  >�Ƿ������⽻���룺</td>
              <td  >          
               <html:select property="spec_flag"   >
                      <html:options collection="spec_flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
               
              <td  > ���Ľ��״��룺</td>
              <td  > 
             <html:text property="tx_cd" size="4"  /> <font color="#FF0000">*</font>
              </td></tr>
              <tr  >
<%--              <td  > �̻����ͣ�</td>--%>
<%--              <td  > --%>
<%--             <html:text property="mer_cat_cd"   /> <font color="#FF0000">*</font>--%>
<%--              </td> --%>
              <td  >�Ƿ���У�</td>
              <td  colspan="3">          
               <html:select property="is_out_bank"   >
                      <html:options collection="is_out_bankMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select></td>
              </tr> 
              <tr  >
              <td  > ���״������ƣ�</td>
              <td  > 
              <html:text property="tx_name"  /> <font color="#FF0000">*</font> 
              </td> 
              <td  >�ֳ���־��</td>
              <td  >          
               <html:select property="tx_falg"   >
                      <html:options collection="tx_flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
              </tr>  
              <tr  >
              <td >���׷�ʽ��</td>
              <td >          
               <html:select property="tx_team"   >
                      <html:options collection="tx_teamMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
               
              <td  >�Ƿ���Ч��</td>
              <td  >          
               <html:select property="flag"   >
                      <html:options collection="flagMap"
                                    property="label"
                                   labelProperty="value" />
                    </html:select>&nbsp;<font color="#FF0000">*</font></td>
              </tr>              
                         
              <tr  >
               
           <td colspan="4" align="center" class="in_button">
                  <html:hidden property="organkey" value="0"/>
                <html:button property="button" styleClass="input" value="�� ��" onclick="checkForm('t87_tx_cd_add_do.do')"/>
 
                <html:reset styleClass="input" value="�� ��"/>
              </td>
            </tr>  
           
          </table>
   
  
 </div>
 </div>
					 <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
	 <p>
	  &nbsp;&nbsp;���״��빹�ɣ�<br>
	  &nbsp;&nbsp;��ͨ���״��룺���Ľ��״��뱾�� <br>
	  &nbsp;&nbsp;���⽻�״��룺���Ľ��״���  + �̻����� + ���б�־ <br>
      &nbsp;&nbsp;���⽻�״�������������������<br>
      &nbsp;&nbsp;1�����׷�ʽ������֧��ʱ����Ҫ�����̻������жϽ��׷�ʽ�Ľ��״��룻<br>
      &nbsp;&nbsp;2�����׷�ʽ�Ƿ�����֧��ʱ����Ҫ�����̻����ͺ��Ƿ�����жϽ��׷�ʽ�Ľ��״��롣<br>
   </p>	
</html:form>
</div>
</BODY>
</html:html>
