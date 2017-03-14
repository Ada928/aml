<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
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
	
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].opp_sys_ids)<0){
           errMsg = "��ѡ��";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].opp_sys_ids)<0){
                errMsg = "��ѡ��";
            }
            if(errMsg==''){
                if(confirm('�����Ҫɾ����ѡ��Ϣ��')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub = true;
    }else if(!checkFloat(document.forms[0].para_val.value)){
		errMsg+= "����ֵ����Ϊ���֣�";
        document.forms[0].upper_limit.focus();
	}else if(document.forms[0].dyna_ind.value==''){
		errMsg+="�Ƿ�̬��������ѡ��";
	}else if(document.forms[0].defparakey.value==''){
		errMsg+="�������벻��Ϊ��";
	}
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function textTrim() {
var a = document.getElementsByTagName("input");
var b = 0;
for(var i=0;i<a.length;i++)
{
   var avalue = a[i].value;
   var atype = a[i].type;
   if(atype == "text"){//ȥ������text�����������˵Ŀո�
    b++;
    a[i].value = trim(a[i].value);
   }
}
    
}
function trim(str){ //ɾ���������˵Ŀո�
���� return str.replace(/(^\s*)|(\s*$)/g, "");
}



function checkForm(theUrl){
    var errMsg ="";
     textTrim();
  if(!checkNum(document.forms[0].para_val.value)){
  		 
		errMsg+= "����ֵ����Ϊ���֣�";
      
	}else if(document.forms[0].dyna_ind.value==''){
		errMsg+="�Ƿ�̬��������ѡ��";
	}else if(document.forms[0].defparakey.value==''){
		errMsg+="�������벻��Ϊ��";
	}else if(document.forms[0].defparakey.value.length >5){
		errMsg+="�������볤�ȱ���С��5";
	}else if(document.forms[0].para_val.value.length >10){
		errMsg+="����ֵ����С��10";
	//}else if(document.forms[0].para_val.value.length >5){
	  //  errMsg+="����ֵ����С��5"
	}else if(getLength(document.forms[0].para_des.value)>64){
	    errMsg+="�������Ƴ���С��62"
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
</HEAD>

<body leftmargin=0 topmargin=0 class="mainbg">
<script type="text/javascript" src="../../js/calendar.js"></script>
	<div id="main">
		<html:form method="post" action="/defpara/t07_defpara_add_do.do">

			<div class="conditions">
				<div class="cond_t">
					<span> �����趨- ���ָ�궨����� </span>

					<%
						String backurl = request.getContextPath();
						backurl = "\"dosubmit('" + backurl
								+ "/platform/defpara/t07_defpara_list.do','add')\"";
					%>
					<span class="buttons"> <a href="#" onClick=<%=backurl%>><img
								src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a> </span>
				</div>

				<html:errors />
				<div class="cond_c2">
					<table border=0 cellPadding=0 cellSpacing=0>

						<tr>
							<td>
							<font color="red">*</font>�������룺
							</td>
							<td>
								<html:text   property="defparakey"  />
							</td>

							<td>
								�������ͣ�
							</td>
							<td>
								<html:select property="paratype">
									<html:options collection="paratypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								���֣�
							</td>
							<td>
								<html:select name="t07_defpara" property="curr_cd">
									<html:options collection="curr_cdMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>

							<td>
								��˽��
							</td>
							<td>
								<html:select name="t07_defpara" property="party_cd">
									<html:options collection="clienttypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								�ͻ�/�ʻ���
							</td>
							<td>
								<html:select property="party_acct_cd">
									<html:options property="label" collection="party_acct_cdMap"
										labelProperty="value" />
								</html:select>
							</td>

							<td>
								�������ƣ�
							</td>
							<td>
								<html:text property="para_des" />
							</td>
						</tr>
						<tr>
							<td>
								����ֵ��
							</td>
							<td>
								<html:text property="para_val" />
								<font color="red"> *����������</font>
							</td>

							<td>
								<font color="red">*</font>�Ƿ�̬������
							</td>
							<td>
								<html:select property="dyna_ind">
									<html:options collection="dyna_indMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								�Ƿ����ã�
							</td>
							<td>
								<html:select name="t07_defpara" property="flag">
									<html:options collection="statusMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>

							<td>
								
							</td>
							<td>
								<input type="hidden" name="validate_dt_disp" onclick="calendar.show(this);" readonly="true" class="calimg"  size="12"/>
							</td>
						</tr>
					 	<!--<tr>
							<td>
								ʧЧʱ�䣺
							</td>
							<td>
								--><input type="hidden" name="invalidate_dt_disp" onclick="calendar.show(this);" readonly="true" class="calimg" size="12" />
								 
							<!--</td>
						</tr>

						--><tr>

							<td colspan="4" align="center" class="in_button">
								<html:button property="button" styleClass="input" value="�� ��"
									onclick="checkForm('t07_defpara_add_do.do')" />
								<html:reset styleClass="input" value="�� ��" />
							</td>
						</tr>

					</table>
				</div>
			</div>

		</html:form>
	</div>
</body>
</html:html>
