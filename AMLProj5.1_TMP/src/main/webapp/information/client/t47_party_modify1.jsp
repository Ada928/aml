<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
	<script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script src="../../js/title.js"></script>
<script language="javascript" src="../../js/basefunc.js"></script>
<script language="javascript"><!--
function _submit(type,id){

if (type=='C'){
  document.forms[0].action= "/information/client/t47_party_modify1.do?newsearchflag=1&party_id="+id
  
  }else  {
  document.forms[0].action= "/information/client/t47_party_modify.do?newsearchflag=1&party_id="+id
  }
  document.forms[0].submit();
  }
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].party_id)<0){
           errMsg = "��ѡ��";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].party_id)<0){
                errMsg = "��ѡ��";
            }
            if(errMsg==''){
                if(confirm('�����Ҫɾ����ѡ��һ����Ʒ��')){
                    isSub = true;
                }
            }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
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
				var validate_typeNode=document.getElementById(type);
				var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}
			}
		}else{
				var legal_card_type_value=document.forms[0].legal_card_type.value;
					if(legal_card_type_value!='19' && legal_card_type_value!='29'){
						document.forms[0].legal_card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].legal_card_type_inf.focus();
					}
					var card_type_value=document.forms[0].card_type.value;
					if(card_type_value!='19' && card_type_value!='29'){
						document.forms[0].card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].card_type_inf.focus();
					}					
		}
		}
		function validate_type(value){
			var validate_type_value=eval('document.forms[0].'+value+'.value');
			//ɾ���ڵ�
			var validate_typeNode=document.getElementById(value);
			var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}			
			if(getLength(validate_type_value)>30||getLength(validate_type_value)<=0){
				//alert("��д����ϸ��������Ϣ����֤�����͵�ע��ӦС��30���ַ���");
				var newimage=document.createElement("font");
				newimage.setAttribute("color", "#ff0000");
				var text=document.createTextNode("������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�");
				newimage.appendChild(text);
				parent.appendChild(newimage);
			}else{
				var newimage=document.createElement("img");
				newimage.setAttribute("src", "../../images/validate.jpg");
				parent.appendChild(newimage);
			}
		}
function _Click(party_id,party_chn_name){
     document.forms[0].party_id.value=party_id;
     document.forms[0].party_chn_name.value=party_chn_name;
}
function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
function _Commit(){
    if(checkRadio(document.forms[0].party_id)<0){
           alert("��ѡ��");
           return false;
    } 
     opener.document.forms[0].party_id.value=document.forms[0].party_id.value;
     opener.document.forms[0].party_name.value=document.forms[0].party_chn_name.value;
   
     window.close();
}
function checkID(numstr){
var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='X'&& TempChar!='x'&& TempChar!='-'){
           i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
function checkForm(theUrl){
    var errMsg ="";
    //�ͻ�����
    if (getLength(document.forms[0].party_chn_name.value)==0) {
        errMsg = "�ͻ����Ʋ���Ϊ�գ�";
        document.forms[0].party_chn_name.focus();
    }//֤������
    else if (getLength(document.forms[0].card_type.value)==0) {
        errMsg = "֤�����Ͳ���Ϊ�գ�";
        document.forms[0].card_type.focus();
    } else if ((document.forms[0].card_type.value =="19"||document.forms[0].card_type.value =="29")&&(getLength(document.forms[0].card_type_inf.value)>30||getLength(document.forms[0].card_type_inf.value)<=0)) {
        errMsg = "������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�";
         document.forms[0].card_type_inf.focus();
    }
    
    //�ͻ���
    else if (getLength(document.forms[0].host_cust_id.value)==0) {
        errMsg = "�ͻ��Ų���Ϊ�գ�";
        document.forms[0].host_cust_id.focus();
    }
    //֤������
    else if (getLength(document.forms[0].card_no.value)==0) {
        errMsg = "֤�����벻��Ϊ�գ�";
        document.forms[0].card_no.focus();
    }
    //����
    else if (getLength(document.forms[0].country_cd.value)==0) {
        errMsg = "�ͻ���������Ϊ�գ�";
        document.forms[0].country_cd.focus();
    }
    //�ͻ�����
    else if (getLength(document.forms[0].aml2_type_cd.value)==0) {
        errMsg = "�ͻ����Ͳ���Ϊ�գ�";
        document.forms[0].aml2_type_cd.focus();
    } 
     else if (getLength(document.forms[0].legal_card_type.value)>0){
    	if((document.forms[0].legal_card_type.value=='19'||document.forms[0].legal_card_type.value=='29')&&(getLength(document.forms[0].legal_card_type_inf.value)>30||getLength(document.forms[0].legal_card_type_inf.value)<=0)){
    		errMsg = "������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�";
    		 document.forms[0].legal_card_type_inf.focus();
    		 }
    }
      //ע���ʽ�
  /*  else if (getLength(document.forms[0].enrol_fund_amt.value)==0) {
        errMsg = "ע���ʽ���Ϊ�գ�";
        document.forms[0].enrol_fund_amt.focus();
    }
     //ע���ʽ����
    else if (getLength(document.forms[0].enrol_fund_currency_cd.value)==0) {
        errMsg = "ע���ʽ���ֲ���Ϊ�գ�";
        document.forms[0].enrol_fund_currency_cd.focus();
    }
     //��������������
    else if (getLength(document.forms[0].legal_obj.value)==0) {
        errMsg = "������������������Ϊ�գ�";
        document.forms[0].legal_obj.focus();
    }
    //�������������֤������
    else if (getLength(document.forms[0].legal_card_type.value)==0) {
        errMsg = "�������������֤�����Ͳ���Ϊ�գ�";
        document.forms[0].legal_card_type.focus();
    }
    //�������������֤������
    else if (getLength(document.forms[0].legal_card_no.value)==0) {
        errMsg = "�������������֤�����벻��Ϊ�գ�";
        document.forms[0].legal_card_no.focus();
    }*/
   
     //ע���ʽ����Ϊ����
    else if(!checkFloat(document.forms[0].enrol_fund_amt.value)){
    	errMsg = "ע���ʽ����Ϊ���֣�";
        document.forms[0].enrol_fund_amt.focus();
    }
   //�ͻ��ű���Ϊ����host_cust_id
   // else if(!checkID(document.forms[0].card_no.value)){ 
    //	errMsg = "֤���������Ϊ���ֻ�'X'��";
    //    document.forms[0].card_no.focus();
   // }//�ƶ��绰����Ϊ����
    else if((getLength(document.forms[0].cell_no.value)!=0) && (!checkTelephone(document.forms[0].cell_no.value))){
    	errMsg = "�ƶ��绰���벻���ϱ�׼��";
        document.forms[0].cell_no.focus();
    }//�̶��绰����Ϊ����
    else if((getLength(document.forms[0].tel_no.value)!=0) && (!checkTelephone(document.forms[0].tel_no.value))){
    	errMsg = "�̶��绰���벻���ϱ�׼��";
        document.forms[0].tel_no.focus();
    }//�����������Ϊ����
    else if((getLength(document.forms[0].postalcode.value)!=0) && (!checkNum(document.forms[0].postalcode.value))){
    	errMsg = "�����������Ϊ���֣�";
        document.forms[0].postalcode.focus();
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

      
--></script>
</head>
	<body class="mainbg"  onload="card_inf_exp('1','');">

		<html:form action="/client/t47_party_modify.do" method="post">
			<div class="conditions">
				<div class="cond_t">
					<span> �޸ĶԹ��ͻ���Ϣ </span>
					<span class="buttons"> <a href="#"
						onclick="dosubmit('<%=request.getContextPath()%>/information/client/t47_party_list.do','add')"><img
								src="../../images/<%=session.getAttribute("style") %>/b_back.png" />����</a> </span>
				</div>
	
			  <div class="cond_c2">
			    <table border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <th colspan="4"> �ͻ��ſ� </th>
                  </tr>
                  <tr>
                    <td> �ͻ����������� </td>
                    <td colspan="3"><logic:equal property="organkey_flag" name="t47_party" value="0">
                        <html:text property="organ_name" size="35" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                        <img src="../../images/lock.jpg" /> </logic:equal>
                        <logic:notEqual property="organkey_flag" name="t47_party"
								value="0">
                          <%-- <html:hidden property="organkey"/> --%>
                          <html:text property="organkey" size="10" onblur="_Onblur('organ_name')" />
                          <html:text property="organ_name" size="35" readonly="true" />
                           <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organ&input_name_disp=searchOrganName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>

                           </logic:notEqual>
                    </td>
                  </tr><html:hidden property="party_id"></html:hidden>
                    <html:hidden property="party_class_cd"></html:hidden>
                  <tr>
                    
                    <td> �ͻ����ƣ� </td>
                    <td><logic:equal property="party_chn_name_flag" name="t47_party"
								value="0">
                        <html:text property="party_chn_name" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                        <img src="../../images/lock.jpg" /> </logic:equal>
                        <logic:notEqual property="party_chn_name_flag" name="t47_party"
								value="0">
                          <html:text property="party_chn_name" size="25" />
                          <font color="#FF0000">*</font> </logic:notEqual>
                    </td>
                    <td> �ͻ�֤�����ͣ� </td>
                    <td><logic:equal property="card_type_flag" name="t47_party" value="0" >
                     <html:select property="card_type" style="width:250px" onchange="card_inf_exp('card_type','card_type_inf');"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                            <html:options collection="card_typeMap" property="label"
											labelProperty="value" />
                          </html:select>
                       
                        <img src="../../images/lock.jpg" />
                        <html:hidden property="card_type"></html:hidden>
                      </logic:equal>
                        <logic:notEqual property="card_type_flag" name="t47_party"
								value="0">
                          <html:select property="card_type" style="width:250px" onchange="card_inf_exp('card_type','card_type_inf');"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                            <html:options collection="card_typeMap" property="label"
											labelProperty="value" />
                          </html:select>
                          <font color="#FF0000">*</font> </logic:notEqual>
                          <html:text  property="card_type_inf" size="15" maxlength="30" onblur="validate_type('card_type_inf');"/>
                    </td>
                  </tr>
                  <tr>
                    <td> �ͻ��ţ� </td>
					<td>
                    <logic:equal property="host_cust_id_flag" name="t47_party"
								value="0">
                      <html:text property="host_cust_id" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" /> 
                    </logic:equal>
                    <logic:notEqual property="host_cust_id_flag" name="t47_party"
								value="0"><html:text property="host_cust_id" size="25" />
                          <font color="#FF0000">*</font> 
                    </logic:notEqual>
					</td>
                    <td> �ͻ�֤�����룺 </td>
					<td>
                    <logic:equal property="card_no_flag" name="t47_party" value="0">
                      <html:text property="card_no" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="card_no_flag" name="t47_party"
								value="0" >
                      <html:text property="card_no" size="25"/>
                          <font color="#FF0000">*</font>
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> �ͻ������� </td>
					<td>
                    <logic:equal property="country_cd_flag" name="t47_party"
								value="0">
                      <html:text property="country_disp" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="country_cd"></html:hidden>
                    </logic:equal>
                    <logic:notEqual property="country_cd_flag" name="t47_party"
								value="0">
                      <html:select property="country_cd">
                          <html:options collection="nationalityMap" property="label"
											labelProperty="value" />
                        </html:select>
                          <font color="#FF0000">*</font> 
                    </logic:notEqual>
					</td>
                    <td> �ͻ����ͣ� </td>
					<td>
                    <logic:equal property="aml2_type_cd_flag" name="t47_party"
								value="0">
                      <html:text property="aml2_type_disp" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="aml2_type_cd"></html:hidden>
                    </logic:equal>
                    <logic:notEqual property="aml2_type_cd_flag" name="t47_party"
								value="0">
                     <html:select property="aml2_type_cd" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                          <html:options collection="pbc_cttp2Map" property="label"
											labelProperty="value" />
                        </html:select>
                          <font color="#FF0000">*</font> 
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> �Թ��ͻ���ҵ�� </td>
					<td>
                    <logic:equal property="industrykey_flag" name="t47_party"
								value="0">
                      <html:text property="industrykey_disp" size="25"
										readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="industrykey"></html:hidden>
                     
                    </logic:equal>
                    <logic:notEqual property="industrykey_flag" name="t47_party"
								value="0">
                     <html:select property="industrykey" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                          <html:options collection="pbc_ctvc_cMap" property="label"
											labelProperty="value" />
                        </html:select>
                      
                    </logic:notEqual>
					</td>
                    <td> ע���ʽ� </td>
					<td>
                    <logic:equal property="enrol_fund_amt_flag" name="t47_party"
								value="0">
                      <html:text property="enrol_fund_amt" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="enrol_fund_amt_flag" name="t47_party"
								value="0">
                     <html:text property="enrol_fund_amt" size="25" />
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> ע���ʽ���֣� </td>
					<td>
                    <logic:equal property="enrol_fund_amt_flag" name="t47_party"
								value="0">
                      <html:text property="enrol_fund_currency_disp" size="25"
										readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="enrol_fund_currency_cd"></html:hidden>
                    </logic:equal>
                    <logic:notEqual property="enrol_fund_amt_flag" name="t47_party"
								value="0">
								<html:select property="enrol_fund_currency_cd"
										 
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                          <html:options collection="pbc_currencyMap" property="label"
											labelProperty="value" />
                        </html:select>
                      
                    </logic:notEqual>
					</td>
					  <td> �������������֤�����ͣ� </td>
					<td>
                    <logic:equal property="legal_card_type_flag" name="t47_party"
								value="0">
                      <html:text property="legal_card_type_disp" size="25"
										readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="legal_card_type"></html:hidden>
                     
                    </logic:equal>
                    <logic:notEqual property="legal_card_type_flag" name="t47_party"
								value="0">
                      <html:select
										onchange="card_inf_exp('legal_card_type','legal_card_type_inf');"
										property="legal_card_type" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                          <html:options collection="agent_typeMap" property="label"
											labelProperty="value" />
                        </html:select>
                          <html:text property="legal_card_type_inf" size="15"
										maxlength="30" onblur="validate_type('legal_card_type_inf');" />
                      
                    </logic:notEqual>
					</td>
                  
                  </tr>
                  <tr>
                    <td> ���������������� </td>
					<td>
                    <logic:equal property="legal_obj_flag" name="t47_party" value="0">
                      <html:text property="legal_obj" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" /> 
                    </logic:equal>
                    <logic:notEqual property="legal_obj_flag" name="t47_party"
								value="0">
                     <html:text property="legal_obj" size="25" />
                      
                    </logic:notEqual>
					</td>
                     <td> �������������֤�����룺 </td>
					<td>
                    <logic:equal property="legal_card_no_flag" name="t47_party"
								value="0">
                      <html:text property="legal_card_no" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="legal_card_no_flag" name="t47_party"
								value="0">
                     <html:text property="legal_card_no" size="25" />
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                  	<td>�������ô��룺</td>
					<td><html:text property="org_credit_no" size="25"  /></td>
					<td>�������ô�����Ч�ڣ�</td>
					<td>
					<html:text property="org_credit_vt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
					</td>
                  </tr>
                  <tr>
                    <td> ϵͳ�ͻ����ͣ� </td>
					<td colspan="3">
                    <logic:equal property="aml1_type_cd_flag" name="t47_party"
								value="0">
                      <html:text property="aml1_type_disp" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                          <html:hidden property="aml1_type_cd"></html:hidden>
                    </logic:equal>
                    <logic:notEqual property="aml1_type_cd_flag" name="t47_party"
								value="0">
                     <html:select property="aml1_type_cd" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
                          <html:options collection="aml1_corpMap" property="label"
											labelProperty="value" />
                        </html:select>
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <th colspan="4"> ͨ�ŵ�ַ1 </th>
                  </tr>
                  <tr>
                    <td> ͨ�ŵ�ַ1�� </td>
					<td>
                    <logic:equal property="addr1_flag" name="t47_party" value="0">
                      <html:text property="addr1" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" /> 
                    </logic:equal>
                    <logic:notEqual property="addr1_flag" name="t47_party" value="0">
                      <html:text property="addr1" size="25" />
                      
                    </logic:notEqual>
					</td>
                    <td> ͨ�ŵ�ַ2�� </td>
					<td>
                    <logic:equal property="addr2_flag" name="t47_party" value="0">
                     <html:text property="addr2" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="addr2_flag" name="t47_party" value="0">
                     <html:text property="addr2" size="25" />
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> �ƶ��绰�� </td>
					<td>
                    <logic:equal property="cell_no_flag" name="t47_party" value="0">
                      <html:text property="cell_no" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="cell_no_flag" name="t47_party"
								value="0">
                     <html:text property="cell_no" size="25" />
                      
                    </logic:notEqual>
					</td>
                    <td> �̶��绰�� </td>
					<td>
                    <logic:equal property="tel_no_flag" name="t47_party" value="0">
                     <html:text property="tel_no" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="tel_no_flag" name="t47_party" value="0">
                     <html:text property="tel_no" size="25" />
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> ��ַ�� </td>
					<td>
                    <logic:equal property="net_address_flag" name="t47_party"
								value="0">
                      <html:text property="net_address" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="net_address_flag" name="t47_party"
								value="0">
                     <html:text property="net_address" size="25" />
                      
                    </logic:notEqual>
					</td>
                    <td> E-Mail�� </td>
					<td>
                    <logic:equal property="email_addr_flag" name="t47_party"
								value="0">
                      <html:text property="email_addr" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="email_addr_flag" name="t47_party"
								value="0">
                    <html:text property="email_addr" size="25" />
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td> �������룺 </td>
					<td colspan="3">
                    <logic:equal property="postalcode_flag" name="t47_party"
								value="0">
                      <html:text property="postalcode" size="25" readonly="true"> <img src="../../images/lock.jpg" height='15' /> </html:text>
                          <img src="../../images/lock.jpg" />
                    </logic:equal>
                    <logic:notEqual property="postalcode_flag" name="t47_party"
								value="0">
                      <html:text property="postalcode" size="25" />
                      
                    </logic:notEqual>
					</td>
                  </tr>
                  <tr>
                    <td colspan="4" align="center" class="in_button"><input type="button" name="button1" value="�� ��" 
									onclick="checkForm('<%=request.getContextPath()%>/information/client/t47_party_modify1_do.do')" />
                        <html:reset  value="�� ��" />
                    </td>
                  </tr>
                </table>
			  </div>
			</div>
		</html:form>
		<!--��ʾ��--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
		
</body>
</html>