<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/load_window.js"></script>

		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/selectbox.js"></script>
		
		
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<%String  flag=(String)request.getAttribute("is_flag");
 %>
	<script language="JavaScript">
 var is_flag='<%=flag%>';
function  _Disp(){
 	var type=eval('document.forms[0].curr_cd');
   	var tv=type.value;
   	if(tv=="2"){
    	document.all.kind1.style.display="";
   		document.all.kind2.style.display="";
    	document.all.null1.style.display="none";
    	document.all.null2.style.display="none";
    } else {
		document.all.kind1.style.display="none";
		document.all.kind2.style.display="none";
		document.all.null1.style.display="";
		document.all.null2.style.display="";
   	}
}
function fPopUpCalendarDlg(ctrlobj){
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

function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    //��������
    selectAllOptions(document.forms[0].list2);
    //�û���
    if(getLength(document.forms[0].username.value)==0){
        errMsg="�û�������Ϊ�գ�";
        document.forms[0].username.focus();
    }
    else if(getLength(document.forms[0].username.value)>16){
        errMsg="�û������ܴ���16���ַ���";
       document.forms[0].username.focus();
    }
    else if(getLength(document.forms[0].username.value)<4){
        errMsg="�û�������С��4���ַ���";
        document.forms[0].username.focus();
    }else if(checkString(document.forms[0].username.value)==0){
        errMsg="�û������зǷ��ַ�,ֻ������ĸ�����֣�";
        document.forms[0].username.focus();
    }
    //�û�����
    else if(getLength(document.forms[0].password.value)==0){
        errMsg="�û����벻��Ϊ�գ�";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)>16){
        errMsg="�û����벻�ܴ���16���ַ���";
        document.forms[0].password.focus();
    }else if(getLength(document.forms[0].password.value)<6){
        errMsg="�û����벻��С��6���ַ���";
        document.forms[0].password.focus();
    }
    //�û�ȷ������
    else if(getLength(document.forms[0].password1.value)==0){
        errMsg="�û�ȷ�����벻��Ϊ�գ�";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)>16){
        errMsg="�û�ȷ�����벻�ܴ���16���ַ���";
        document.forms[0].password1.focus();
    }else if(getLength(document.forms[0].password1.value)<6){
        errMsg="�û�ȷ�����벻��С��6���ַ���";
        document.forms[0].password1.focus();
    }else if(document.forms[0].password.value!=document.forms[0].password1.value){
        errMsg="�û�������������벻һ�£�";
        document.forms[0].password.focus();
    }
    //��ʵ����
    else if(getLength(document.forms[0].realname.value)==0){
        errMsg="�û���ʵ��������Ϊ�գ�";
        document.forms[0].realname.focus();
    }else if(getLength(document.forms[0].realname.value)>16){
        errMsg="�û���ʵ�������ܴ���16���ַ���";
        document.forms[0].realname.focus();
    }
    //��������
    else if(getLength(document.forms[0].organkey.value)==0){
        errMsg="������������Ϊ�գ�";
    }
      else if(getLength(document.forms[0].postalcode.value)!=0 && checkNumber(document.forms[0].postalcode.value)==0){
        errMsg="�������뺬�з������ַ���";
        document.forms[0].postalcode.focus();
    }  else if(getLength(document.forms[0].emailaddress.value)>64){
        errMsg="�û������ʼ����ܴ���64���ַ���";
        document.forms[0].emailaddress.focus();
    }else if(checkEmail(document.forms[0].emailaddress.value)==false){
        errMsg="�û������ʼ����зǷ��ַ����ʽ����";
        document.forms[0].emailaddress.focus();
    }
   
    //�û��绰
  //  else if(getLength(document.forms[0].telephone.value)==0){
    //    errMsg+="�û��绰���벻��Ϊ�գ�";
     //  document.forms[0].telephone.focus();
     //   }
    else if(getLength(document.forms[0].telephone.value)>0 && checkTelephone(document.forms[0].telephone.value)==0){
        errMsg="�û��绰��������";
        document.forms[0].telephone.focus();
    }
    //�ƶ��绰
    else if(getLength(document.forms[0].mobilephone.value)>0 && checkNumber(document.forms[0].mobilephone.value)==0){
        errMsg="�û��ƶ��绰��������";
        document.forms[0].mobilephone.focus();
    }else if(getLength(document.forms[0].list2.value)==0){
        errMsg="��ɫ����Ϊ�գ�";
    }else if(getLength(document.forms[0].address.value)>128){
    	errMsg="�û��ĵ�ַ���Ȳ��ܴ���128���ַ���";
    }else if(getLength(document.forms[0].remark.value)>256){
    	errMsg="����������Ĳ��ܴ���256���ַ���"
    }
    if(is_flag=="1"){
      if(getLength(document.forms[0].groupkey.value)==0){
        errMsg="�����鲻��Ϊ�գ�";
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

</script>
</head>
<body class="mainbg">
	<html:form method="post" action="/user/user_add_do.do">
	<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�½��û�</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('user_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
						<font color="#FF0000">*</font>�û�����
					</td>
					<td>
						<html:text property="username"  size="15" maxlength="20"/>
					</td>
					<td>
						<font color="#FF0000">*</font>��ʵ������
					</td>
					<td>
						<html:text property="realname"  size="50" maxlength="20"/>
					</td>
				</tr>
				<tr>
					<td>
						<font color="#FF0000">*</font>���룺
					</td>
					<td bgcolor="F6F9FF">
						<html:password property="password" 
							size="15" maxlength="20"/>
					</td>
					<td>
						<font color="#FF0000">*</font>״̬��
					</td>
					<td bgcolor="F6F9FF">
						<html:select property="flag">
							<html:options collection="flagMap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
				</tr>
				<tr>
					<td>
						<font color="#FF0000">*</font>����ȷ�ϣ�
					</td>
					<td>
						<html:password property="password1" 
							size="15" maxlength="20"/>
					</td>
					<td   >
						<font color="#FF0000">*</font>����������
					</td>
					<td>
						 <input type="text" name="searchOrganName" readonly/>
						<input type="hidden" name="organkey" size="13" value="" class="text_white"/>
					  <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
				
					</td>
				</tr>
				
	 <tr>
      <td>
      <font color="#FF0000">*</font>��ɫ��</td>
      <td  colspan="3">
          <bean:define id="multiSeHTMLStr" name="multiSeHTMLStr"></bean:define>
          <%=multiSeHTMLStr%>
      </td>
    </tr>
				 <tr>
         <td>��ַ��</td>
         <td colspan="3"><html:text property="address"  size="60" /></td>
        </tr>
		<tr>
         <td>�绰���룺</td>
         <td><html:text property="telephone" maxlength="20"/></td>
         <td>�ƶ��绰��</td>
         <td><html:text property="mobilephone" maxlength="20"/></td>
       </tr>
       <% 
        if(flag.equals("1")){
       %>
       <tr>
         <td><font color="#FF0000">*</font>�����飺</td>
         <td colspan="3" class="in_button" >
         <html:textarea property="groupname" rows="3" cols="60" styleId="groupname" readonly="true"></html:textarea>
         <html:hidden property="groupkey"/>
         	<input type="button" name="locate" value="�� ѡ" onclick="locate_pop_window('<%= request.getContextPath() %>','t00_groupLocation','checkbox','forms[0]','groupkey,groupname','flag=\'1\'');return false;"/>
         </td>
       	</tr>
       <% 
        }
       %>
		<tr>
         <td>�������룺</td>
         <td><html:text property="postalcode" maxlength="6"/></td>
         <td>Email��</td>
         <td><html:text property="emailaddress"/></td>
       </tr>
	  
	    <tr>
         <td>������</td>
         <td colspan="3"> 
        <html:textarea property="remark" rows="4" cols="70" ></html:textarea>
         </td>
       </tr>
       <tr>
	   <td></td>
		<td colspan="3" align="left" class="in_button" >
		 <input name="tijiao" type="button" value="�� ��" onclick="checkForm('user_add_do.do')" />	
		  <input name="reset" type="reset" value="�� ��" />		</td>
	   </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
