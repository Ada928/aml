<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%
	String cordaurl="";
	if(request.getAttribute("cordaurl")!=null){
 		cordaurl=(String)request.getAttribute("cordaurl");
 		cordaurl=cordaurl.substring(1);
 		cordaurl="\""+request.getContextPath() + cordaurl;
	}
%>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
 <script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="javascript">

function _Confim(url){
   
        document.form1.action=url;
        document.form1.submit();
   
}
function validateCardNo(cardnovalue){
 var cardtype=document.forms[0].legal_card_type.value;
 if(cardtype=="11"){
    IdCardValidate(cardnovalue);
 }
}
function checkForm(theUrl){
    var errMsg = "";
    if(!checkDouble(document.forms[0].enrol_fund_amt.value)){
        errMsg+="ע���ʽ�ֻ��Ϊ���֣�";
        document.forms[0].enrol_fund_amt.focus();
    }else if(getLength(document.forms[0].legal_tel.value)>0 && checkNumber(document.forms[0].legal_tel.value)==0){
        errMsg+="������ϵ��ʽ��������";
        document.forms[0].legal_tel.focus();
    }else if(getLength(document.forms[0].tel_no.value)>0 && checkNumber(document.forms[0].tel_no.value)==0){
        errMsg+="��ϵ�绰��������";
        document.forms[0].tel_no.focus();
    }else if(getLength(document.forms[0].base_acct_num.value)>30){
        errMsg+="�����˺Ų��ܳ���30λ��";
        document.forms[0].base_acct_num.focus();
    }
    
   var card_type=document.forms[0].card_type.value;
    if(card_type==""){
     errMsg+="֤�����Ͳ���Ϊ�գ�";
    }
    if(document.forms[0].card_no.value==""){
     errMsg+="֤�����벻��Ϊ�գ�"
    }
   if(card_type=='19'||card_type=='29'){
       var card_type_inf=document.forms[0].card_type_inf.value;
       if(card_type_inf==""){
          alert("֤����������Ϊ��");
          return false;
       }
  
   }else{
    document.forms[0].organ_code.value=document.forms[0].card_no.value; 
   }
   
   var card_type1=document.forms[0].legal_card_type.value;
   if(card_type1=='19'||card_type1=='29'){
       var card_type_inf1=document.forms[0].legal_card_type_inf.value;
       if(card_type_inf1==""){
          alert("����֤����������Ϊ��");
          return false;
       }
      
   }
    
    if(errMsg==""){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function card_inf_exp(type,value){
if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'");
				
			}
		}else{
		 	var agent_card_type_value=document.forms[0].card_type.value;
		 	//alert(agent_card_type_value);
			var class_cdValue='C';			
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_type_inf.style.visibility='hidden';
			}else {
			   document.forms[0].card_type_inf.style.visibility='visible';
				document.forms[0].card_type_inf.focus();
			}
			if(class_cdValue=='C'){
				var legal_card_type_value=document.forms[0].legal_card_type.value;
					if(legal_card_type_value!='19' && legal_card_type_value!='29'){
						document.forms[0].legal_card_type_inf.style.visibility='hidden';
					}else {
					  document.forms[0].legal_card_type_inf.style.visibility='visible';
						document.forms[0].legal_card_type_inf.focus();
					}				
			}
		}
		}

</script>
</head>
<body id="iframecontent" onload="card_inf_exp('1','');">
<html:form action="/custcheck/t10_survey_cust_risk.do" method="post">
<html:hidden name="t10_check_cust_cardForm" property="party_class_cd"/>
<div class="conditions">  
	<div class="cond_c2">
	<html:errors />
    <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
	    <th colspan="4">�ͻ��ſ�</th>
	  </tr>
   		 <tr>
		<td>�ͻ��ţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="party_id" size="25" readonly="true" /><img src="../../images/<%=session.getAttribute("style") %>/b_lock.png" /></td>
		<td>�ͻ����ƣ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="party_chn_name" size="25"  readonly="true" /><img src="../../images/<%=session.getAttribute("style") %>/b_lock.png"  /></td>
	  </tr>
	   <tr>
		<td>Ӫҵִ�պţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="business_licence" size="25"  maxlength="40"/></td>
		<td>Ӫҵִ�յ����գ�</td>
		<td>
		<html:text name="t10_check_cust_cardForm"  property="licence_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
		</td>
	  </tr>
	  
	  <tr>
		<td>�������ô��룺</td>
		<td><html:text name="t10_check_cust_cardForm"  property="org_credit_no" size="25" maxlength="32" /></td>
		<td>�������ô�����Ч�ڣ�</td>
		<td>
		<html:text name="t10_check_cust_cardForm"  property="org_credit_vt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
		</td>
	  </tr>
	  
	  
	  <tr>
		<td>
		   �ͻ��������ͣ�
		</td>
		<td colspan="3">
		   <logic:iterate id="list_type" name="list_typeList">
                <bean:write name="list_type" />&nbsp;&nbsp;
            </logic:iterate>
		</td>
	  </tr>
	  <tr>
	    <th colspan="4">��˾��Ϣ</th>
	  </tr>
	   <tr>
	  	<td> �ͻ�֤�����ͣ�</td>
		<td>
			<html:select name="t10_check_cust_cardForm"  property="card_type" style="width:130px"  onchange="card_inf_exp('card_type','card_type_inf');" >
				<html:options collection="card_typeMap" property="label" labelProperty="value" />
			</html:select>	
			<html:text name="t10_check_cust_cardForm"  property="card_type_inf" ></html:text>
		
			
									   
		</td>
		<td>�ͻ�֤�����룺 </td>
		<td >
			<html:text name="t10_check_cust_cardForm"   property="card_no" onchange="validateCardNo(this.value);" ></html:text>
			<html:hidden name="t10_check_cust_cardForm"  property="organ_code" />
		</td>
	  </tr>
	 
	  <tr>
		<td>��˰�Ǽ�֤�ţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="nation_affair_no" size="25" maxlength="32" /></td>
		<td>��˰�Ǽ�֤�ţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="local_affair_no" size="25" maxlength="32"/></td>
	  </tr>
	   <tr>
	  <td>ע���ʽ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="enrol_fund_amt" size="25" maxlength="17" /></td>
		<td>ע���ʽ���֣�</td>
		<td>
		<html:select name="t10_check_cust_cardForm" property="enrol_fund_currency_cd" >
											<html:options collection="pbc_currencyMap" property="label" labelProperty="value" />
										</html:select>
		
		</td>
		</tr>
	  <tr>
		<td>�����˺ţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="base_acct_num" size="25" maxlength="30" /></td>
		<td>�����˺Ź����У�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="base_bank_id" size="25" maxlength="6"/></td>
	  </tr>
	  <tr>
		<td>�����˺Ź������㣺</td>
		<td><html:text name="t10_check_cust_cardForm"  property="base_bank_org" size="25" maxlength="60"/></td>
		<td>��Ӫ��Χ��</td>
		<td><html:text name="t10_check_cust_cardForm"  property="main_manage_scope" size="25" maxlength="500" /></td>
	  </tr>
	   <tr>
		<td>��ҵ��</td>
		<td>
		<html:select name="t10_check_cust_cardForm" property="industrykey" >
											<html:options collection="pbc_ctvc_cMap" property="label" labelProperty="value" />
										</html:select>
	 
        </td>
		<td>��ҵ���ͣ�</td>
		<td>
		<html:select name="t10_check_cust_cardForm" property="company_type_cd" >
											<html:options collection="company_typeMap" property="label" labelProperty="value" />
										</html:select>
		
		
		</td>
	  </tr>
	  <tr>
		<td>��ҵ��ģ��</td>
		<td><html:text name="t10_check_cust_cardForm"  property="company_scope" size="25" maxlength="4"/></td>
		<td>���˴���</td>
		<td><html:text name="t10_check_cust_cardForm"  property="legal_obj" size="25" maxlength="32"/></td>
	  </tr>
	  <tr>
		<td>���˴���֤�����ͣ�</td>
		<td>
		<html:select name="t10_check_cust_cardForm" property="legal_card_type" style="width:130px" styleId="legal_card_type"  onchange="card_inf_exp('legal_card_type','legal_card_type_inf');">
											<html:options collection="card_typeMap2" property="label" labelProperty="value" />
										</html:select>
		<html:text name="t10_check_cust_cardForm"  property="legal_card_type_inf" ></html:text>
		
		</td>
		<td>���˴���֤�����룺</td>
		<td><html:text name="t10_check_cust_cardForm"  property="legal_card_no" size="25" maxlength="20" onchange="validateCardNo(this.value);" /></td>
	  </tr>
	  <tr>
		<td>���˾�ס�أ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="legal_addr" size="25" maxlength="200"/></td>
		<td>������ϵ��ʽ��</td>
		<td><html:text name="t10_check_cust_cardForm"  property="legal_tel" size="25" maxlength="40"/></td>
	  </tr>
	  <tr>
		<td>����������֤�������գ�</td>
		<td>
		<html:text name="t10_check_cust_cardForm"  property="legal_card_no_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
       
		</td>
		<td>��˰�Ǽ�֤�����գ�</td>
		<td>
		<html:text name="t10_check_cust_cardForm"  property="local_affair_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
       
		
		</td>
	  </tr>
	  <tr>
		<td>��˰�Ǽ�֤�����գ�</td>
		<td>
		 <html:text name="t10_check_cust_cardForm"  property="nation_affair_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
       
		
		
		</td>
		<td>��֯�������뵽���գ�</td>
		<td>
		  <html:text name="t10_check_cust_cardForm"  property="organ_code_end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
       
		
		</td>
	  </tr>
	 
	  <tr>
	    <th colspan="4">ͨѶ��Ϣ</th>
	  </tr>
	  <tr>
		<td>ͨ�ŵ�ַ��</td>
		<td><html:text name="t10_check_cust_cardForm"  property="addr1" size="25" maxlength="200"/></td>
		<td>��ϵ�绰��</td>
		<td><html:text name="t10_check_cust_cardForm"  property="tel_no" size="25" maxlength="16"/></td>
	  </tr>
	  <tr>
	  <th colspan="4">������Ϣ</th>
	  </tr>
	  <tr>
		<td>�ͻ�����ţ�</td>
		<td><html:text name="t10_check_cust_cardForm"  property="manager_no" size="25" maxlength="24"/></td>
		<td>
		�ͻ���������
	</td>
	<td >
		<html:text name="t10_check_cust_cardForm"  property="manager_name" size="25" maxlength="32"/>
	</td>
	  </tr>
	  <tr>
		<td>�������룺</td>
		<td>
		<html:text name="t10_check_cust_cardForm"   property="area_no_disp" size="25" 
										onclick="window.open('../../common/editCountryArea.jsp?type=0&inname=country_residence&inname_disp=area_no_disp','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<html:text property="country_residence" readonly="true" />
		</td>
		<td>���ñ�־��</td>
		<td><html:select name="t10_check_cust_cardForm" property="flag"><html:options collection="flagMap" property="label" labelProperty="value" />
		    </html:select>
</td>
	  </tr>
	  <tr>
		<td>����������Ϣ��</td>
		<td><html:text name="t10_check_cust_cardForm"   property="other_info" size="25" /></td>
		<td>&nbsp;</td>
		<td>&nbsp;</td>
	  </tr>
	   <%if(request.getAttribute("flag_disp")==null){
	   
	   %>
	  <tr>
	    <td colspan="4">
		<input type="button" class="in_button1" name="button1" value="�� ��" onclick="checkForm('t47_client_modify_do.do')" />
		<input type="reset" class="in_button1" value="�� ��" />
		</td>
	  </tr>
	   <% } %>  
	</table>
    </div>
    </div>
    <div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
 
</html:form> 
<logic:notEqual name="t10_check_cust_cardForm" property="flag_disp" value="">	
<script>alert('�� �ĳɹ�');</script>
</logic:notEqual>
</BODY>
</HTML>
