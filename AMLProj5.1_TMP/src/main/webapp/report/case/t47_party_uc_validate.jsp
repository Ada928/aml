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
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 

<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />

<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
<script type='text/javascript' src='./dwr/engine.js'></script>
<script type='text/javascript' src='./dwr/util.js'></script>

<script type='text/javascript' src='../../js/web_draw.js'></script>
<script src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script src="../../js/validate.js" language="javascript"></script>
<script language="JavaScript">
		var _st = window.setTimeout;
window.setTimeout = function(fRef, mDelay) {
 if(typeof fRef == 'function'){
  var argu = Array.prototype.slice.call(arguments,2);
  var f = (function(){ fRef.apply(null, argu); });
  return _st(f, mDelay);
 }
 return _st(fRef,mDelay);
}

function card_disp(){
	var card_type = eval(document.forms[0].card_type.value);
	if(card_type=='19'||card_type=='29'){
		document.forms[0].card_type_inf.style.visibility='visible';
	}else{
		document.forms[0].card_type_inf.style.visibility='hidden';
	}
}

		function card_inf_exp(type,value){ 
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value'); 
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
				validate_type(value);
			}else{
				eval('document.forms[0].'+value+".style.visibility='hidden'"); 
				showValidateMsg($$(value,0),'4','');
				//var validate_typeNode=document.getElementById(type); 
				var validate_typeNode=document.getElementsByName(type)[0];
				var parent=validate_typeNode.parentNode;
			for(var node=0;node<parent.childNodes.length;node++){
				var currentNode = parent.childNodes[node];
				if(currentNode.nodeName.toLowerCase() == "img" ||currentNode.nodeName.toLowerCase() == "font"){
					parent.removeChild(currentNode);
				}
			}
			}
		}else{
			var agent_card_type_value=document.forms[0].card_type.value;
			var class_cdValue='<bean:write name="class_cd"></bean:write>';
			var cd = '<bean:write name="t47_party" property="alert_type"/>';			
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_type_inf.style.visibility='hidden';
				showValidateMsg($$('card_type_inf',0),'4','');
			}else {
				document.forms[0].card_type_inf.focus();
				validate_type('card_type_inf');
			}
			if(class_cdValue=='1'&& cd=='2'){
				var legal_card_type_value=document.forms[0].legal_card_type.value;
					if(legal_card_type_value!='19' && legal_card_type_value!='29'){
					    showValidateMsg($$('legal_card_type_inf',0),'4','');
						document.forms[0].legal_card_type_inf.style.visibility='hidden';
					}else {
						document.forms[0].legal_card_type_inf.focus();
						validate_type('legal_card_type_inf');
					}				
			}
		}
		}
		function validate_type(value){
			var validate_type_value=eval('document.forms[0].'+value+'.value');		
			if(getLength(validate_type_value)>30||getLength(validate_type_value)<4
			||IndexSpaceLast(validate_type_value)>0){
				showValidateMsg($$(value,0),'2','������֤������ϸ��Ϣ�����Ҳ����пո񣬲�����4��30���ַ�֮��!');
			}else{
			    showValidateMsg($$(value,0),'3','');
			}
		}
function inputConfim(theUrl){
	if(checkAnyValidating()){
		window.setTimeout(inputConfim,100,theUrl);
	}else{
		if(!checkAllValidate()){ 
			return false; 
		} 
		else{ 
			document.forms[0].action=theUrl; 
			document.forms[0].submit();
		}
	}
}
/*
 * check any Validating by ajax
*/
function checkAnyValidating() {
	
	for(var i=0; i<g_ArrMsg.length; i++) {		
		var msg = g_ArrMsg[i].ps;		
		if(msg == "VALIDATING") {
			return true;
		} 
	}
	return false;
}
		
          function IndexSpace(str2){
           var str1 = " ";
           var str3 = "��";
          if (str2.length>0){
         var s = str2.indexOf(str1);
         var t = str2.indexOf(str3);
         if (t>s){
         s=t;
         }
         if (str2.substr(0,1)==str1||str2.substr(0,1)==str3){     
         s=1;
         }
         return(s);
         }
       }
		function IndexSpaceLast(str2){
		   var str1 = " ";
           var str3 = "��";
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==str1)||(str2.substr(0,1)==str1)||(str2.substr(str2.length-1,1)==str3)||(str2.substr(0,1)==str3)){
         return(1);
         }
         }
       }
       function dosubmit(theUrl){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}



function _Confim(url, type){
		var bAlertType = '<bean:write name='t47_party' property='alert_type'/>';
		var errMsg ="";
     //�ͻ���
    if (getLength(document.forms[0].party_id.value)==0) {
        errMsg = "�ͻ��Ų���Ϊ�գ�";
        document.forms[0].party_id.focus();
    }    
    if ((document.forms[0].card_type.value=='19'||document.forms[0].card_type.value=='29')&&(getLength(document.forms[0].card_type_inf.value)>30||getLength(document.forms[0].card_type_inf.value)<=0)) {
        errMsg = "������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�";
    }
    //�ͻ���
    else if (IndexSpace(document.forms[0].party_id.value)>0) {
        errMsg = "�ͻ���ǰ����м䲻�ܳ��ֿո�";
        document.forms[0].party_id.focus();
    }
    //�ͻ�����
    else  if (getLength(document.forms[0].party_chn_name.value)==0) {
        errMsg = "�ͻ����Ʋ���Ϊ�գ�";
        document.forms[0].party_chn_name.focus();
    }
    //�ͻ�����
    else  if (IndexSpaceLast(document.forms[0].party_chn_name.value)>0) {
        errMsg = "�ͻ�����ǰ���ܳ��ֿո�";
        document.forms[0].party_chn_name.focus();
    }
    //�ͻ�����
    else if (getLength(document.forms[0].country_cd.value)==0) {
        errMsg = "�ͻ���������Ϊ�գ�";
        document.forms[0].country_cd.focus();
    }//�ͻ�֤������
    else if (getLength(document.forms[0].card_no.value)==0) {
        errMsg = "�ͻ�֤�����벻��Ϊ�գ�";
        document.forms[0].card_no.focus();
    }  
     //�ͻ�֤������
    else if (IndexSpace(document.forms[0].card_no.value)>0) {
        errMsg = "�ͻ�֤������ǰ����м䲻�ܳ��ֿո�";
        document.forms[0].card_no.focus();
    } 
    //�ͻ�֤������
    if(document.forms[0].card_type.value=='19'){//����ͻ����֤����Ϊ[��������������Ч֤��  ����ѡ�����������Ӧ�������֤����������һ��˵����]ʱ����֤
    	if (IndexSpace(document.forms[0].card_type_inf.value)>0) {
        errMsg = "�ͻ�֤������ǰ����м䲻�ܳ��ֿո�";
        document.forms[0].card_type_inf.focus();
   		}
    }
    
    if (bAlertType=='2'){
     //�ͻ�����
      if (getLength(document.forms[0].aml2_type_cd.value)==0) {
        errMsg = "�ͻ����Ͳ���Ϊ�գ�";
        document.forms[0].aml2_type_cd.focus();
      }
      if ((document.forms[0].aml2_type_cd.value=='02'&&document.forms[0].card_type.value.substr(0,1)=="2")||
             (document.forms[0].aml2_type_cd.value!='02'&&document.forms[0].card_type.value.substr(0,1)=="1")) {
        errMsg = "�ͻ�������֤�����Ͳ�ƥ��!";
      }

    //  if (!isIndividual()){
      //��������������
    //   if (IndexSpaceLast(document.forms[0].legal_obj.value)>0) {
    //    errMsg = "��������������ǰ����м䲻�ܳ��ֿո�";
    //    document.forms[0].legal_obj.focus();
    //   }
    //  }
	}
     var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
			if(document.activeElement.tagName=="INPUT")
			{
				window.setTimeout(inputConfim,100,url);
			}else{
				if(!checkAllValidate()) {
						return false;
				}else{
				   document.forms[0].action=url;
		           document.forms[0].submit();
				}
			}
          
		 //  document.forms[0].action=url;
		 //  document.forms[0].submit();
}
		</SCRIPT>
		<%
			String saveflag = (String) request.getAttribute("savesucc");
			if (saveflag == null)
				saveflag = "-1"; // ���Ǵӱ�������
			else if ("1".equalsIgnoreCase(saveflag))
				saveflag = "1"; // �ɹ���������
			else
				saveflag = "0";
		%>
		<script language="javascript">
		//if("<%=saveflag%>"=="0") alert("����ʧ��");
		//else if("<%=saveflag%>"=="1") alert("����ɹ�!");
		
		//var g_changed = false; // �Ƿ��� ��
		var g_appid = "2";
        
		function isIndividual() {
			var cd = '<bean:write name="t47_party" property="party_class_cd"/>';

			if("i" == cd || "I" == cd)
				return true;
			else
				return false;
		}
		
		function isBH() {
			var tp = '<bean:write name='t47_party' property='alert_type'/>';
			if(tp=='1') {
				return true;
			} else {
				return false;
			}
			
		}
		
		function isI() {
			var cd = '<bean:write name="class_cd"></bean:write>';	
			if(cd=='0') {
				return true;
			} else {
				return false;
			}
			
		}
		function validateDetail() {

			//while(g_ArrMsg.length > 0) // ��֤��ʾ��
			//	g_ArrMsg.pop();
			//�ж�֤�������Ƿ�Ϊ�����������Ч֤��
			card_disp();
			
			g_changed = true;
			validate($$('party_chn_name',0), '', 'card_type');
			g_changed = true;
			validate($$('card_no',0), 'card_type', '');
			g_changed = true;
			validate($$('party_id',0), '', '');
						
			if(isBH()) {
				g_changed = false;
				document.forms[0].save.disabled = false;
				return;
			}
							
			g_changed = true;
			validate($$('tel_no',0), '', '');
			g_changed = true;
			validate($$('addr1',0), '', '');

<!--			g_changed = true;-->
<!--			validate($$('otherContact',0), '', '');-->

			if (isI()) {
				g_changed = false;
				document.forms[0].save.disabled = false;
				return;
			}
			g_changed = true;
			validate($$('enrol_fund_amt',0), '', '');
			//while(!g_validating);
			g_changed = true;
			validate($$('legal_obj',0), 'legal_card_type', 'legal_card_type');
			//while(!g_validating);
			g_changed = true;
			validate($$('legal_card_no',0), 'legal_card_type', '');			
			g_changed = false;	
			document.forms[0].save.disabled = false;
			
		}
		
		</script>


		<style type="text/css">
<!--
.STYLE2 {
	color: #ff0000
}
-->
</style>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg" onload="card_inf_exp('1','');validateDetail();">
		<html:form action="/case/savet47_party_ucmodify.do" method="post">
			<input type="hidden" name="saveString"
				value='<bean:write name="saveString" />' />
	<div id="main">
	<!-- conditions --> 
	  <div class="conditions">
	    <!-- title -->
		<div class="cond_t">
		  <span>�ͻ���Ϣ��¼</span>
		  <html:hidden property="party_class_cd"></html:hidden>
		  <span class="buttons">
  			<%
				
					String root = request.getContextPath();
					String root1 = "\"dosubmit('"
							+ root
							+ "/information/client/t47_party_uc_list.do?newsearchflag=1')\"";
					
			%>
			
		
				<a href="javascript:history.back(-1);"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	
		  </span>
		</div>
		<!-- table content -->
		<div class="cond_c2">
		  <table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="right">
					�ͻ����ƣ�
				</td>
				<td align="left">
					<script language="javascript">
				 		var class_cd = '<bean:write name="class_cd"></bean:write>';	
				 	</script>
					<html:text property="party_chn_name" onchange="change();"
						onblur="validate(this, '', 'card_type');"></html:text>
					<font color="#FF0000"> *</font>
					<html:hidden property="host_cust_id"></html:hidden>
					<logic:equal value="1" name="t47_party" property="alert_type">
						<html:hidden property="aml2_type_cd"></html:hidden>
						<html:hidden property="tel_no"/>
						<html:hidden property="addr1"/>
						<html:hidden property="industrykey"/>
						<html:hidden property="enrol_fund_amt"/>
						<html:hidden property="legal_obj"/>
						<html:hidden property="legal_card_type"/>
						<html:hidden property="legal_card_type_inf"/>
						<html:hidden property="legal_card_no"/>
						
					</logic:equal>
					<logic:equal value="2" name="t47_party" property="alert_type">
						<logic:notEqual  value="1" name="class_cd">
						<html:hidden property="enrol_fund_amt"/>
						<html:hidden property="legal_obj"/>
						<html:hidden property="legal_card_type"/>
						<html:hidden property="legal_card_type_inf"/>
						<html:hidden property="legal_card_no"/>
						</logic:notEqual>	
					</logic:equal>
				</td>
			</tr>
			<tr>
				<td align="right" nowrap>
					<!-- id=CITP -->
					�ͻ����֤�����ͣ�
				</td>
				<td align="left">
					<html:select property="card_type" style="width:250px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
						onchange="card_inf_exp('card_type','card_type_inf');change();validate($$('card_no',0), 'card_type', '');change();validate($$('party_chn_name',0), '', 'card_type');">
						<html:options collection="card_typeMap" property="label"
							labelProperty="value" />
					</html:select>
					<html:text property="card_type_inf" size="30" maxlength="30"
						onchange="change();" onblur="validate_type('card_type_inf');" />
				</td>
			</tr>
			<tr>
				<td align="right">
					<!--CTID-->
					�ͻ�֤�����룺
				</td>
				<td align="left">
					<html:text property="card_no" onchange="change();"
						onblur="validate(this, 'card_type', '');"></html:text>
					<font color="#FF0000"> *</font>
				</td>
			</tr>
			<tr>
				<td align="right">
					<!--CSNM-->
					�ͻ��ţ�
				</td>
				<td align="left">
					<html:text property="party_id" onchange="change();"
						readonly="true" onblur="validate(this, '', '');"></html:text>
					<font color="#FF0000"> *</font>
					<img src="../../images/lock.jpg" height='20'>
				</td>
			</tr>
			<tr>
				<td align="right">
					<!--CTNT-->
					�ͻ�������
				</td>
				<td align="left">
					<html:select property="country_cd" onchange="">
						<!--   onchange="change();" onblur="validate(this, '', '');" -->
						<html:options collection="nationalityMap" property="label"
							labelProperty="value" />
					</html:select>
					<font color="#FF0000"> *</font>
				</td>
			</tr>
			<logic:equal value="2" name="t47_party" property="alert_type">
				<tr>
					<td align="right">
						<!--CTTP-->
						�ͻ����ͣ�
					</td>
					<td align="left">
						<html:select property="aml2_type_cd" onchange="">
							<html:options collection="clienttypeMap" property="label"
								labelProperty="value" />
						</html:select>
						<font color="#FF0000"> *</font>
					</td>
				</tr>
				<tr>
					<td align="right">
						<!--CCTL-->
						�ͻ���ϵ�绰��
					</td>
					<td align="left">
						<html:text property="tel_no" onchange="change();"
							onblur="validate(this, '', '');"></html:text>
					</td>
				</tr>
				<tr>
					<td align="right">
						<!--CTAR-->
						�ͻ�סַ��
					</td>
					<td align="left">
						<html:text property="addr1" onchange="change();"
							onblur="validate(this, '', '');"></html:text>
					</td>
				</tr>
				<tr>
					<!-- ���ݶԹ� ��˽ ���ݲο����� pbc_ctvc_i pbc_ctvc_c -->
					<td align="right">
						<logic:equal value="0" name="class_cd">��˽�ͻ�ְҵ��</logic:equal>
						<logic:equal value="1" name="class_cd">�Թ��ͻ�����ҵ���</logic:equal>
					</td>
					<td align="left">
						<script language="javascript">
						var industrykeymap = '<bean:write name='t47_party' property='industrykeymap'/>';
						</script>
						<html:select property="industrykey">
							<html:options collection="industrykeyMap" property="label"
								labelProperty="value" />
						</html:select>

					</td>
				</tr>
				<logic:equal value="1" name="class_cd">
					<tr>
						<td>
							<!--RGCP-->
							ע���ʽ�
						</td>
						<td align="left">
							<html:text property="enrol_fund_amt"
								onchange="if(isIndividual()) return; change();"
								onblur="validate(this, '', '');"></html:text>
						</td>
					</tr>
					<tr>
						<!-- ��Ҫ�ο����� ��˽���� 0 ˽ 1 �� -->
						<td>
							����������������
						</td>
						<td align="left">
							<html:text property="legal_obj"
								onchange="if(isIndividual()) return; change();"
								onblur="validate(this, '', 'legal_card_type');"></html:text>
						</td>
					</tr>
					<tr>
						<td>
							<!--CRIT-->

							�������������֤�����ͣ�
						</td>
						<td align="left">
							<html:select property="legal_card_type" style="width:250px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
								onchange="card_inf_exp('legal_card_type','legal_card_type_inf');if(isIndividual()) return; change();validate($$('legal_card_no',0), 'legal_card_type', ''); change();validate($$('legal_obj',0), '', 'legal_card_type');">
								<html:options collection="legal_card_typeMap"
									property="label" labelProperty="value" />
							</html:select>
							<html:text property="legal_card_type_inf" size="30"
								maxlength="30"
								onblur="validate_type('legal_card_type_inf');" />
						</td>
					</tr>
					<tr>
						<td>
							<!--CRID-->

							�������������֤�����룺
						</td>
						<td align="left">
							<html:text property="legal_card_no"
								onchange="if(isIndividual()) return; change();"
								onblur="validate(this, 'legal_card_type', '');"></html:text>
						</td>
					</tr>
				</logic:equal>
			</logic:equal>
			<tr>
				<%
					
						String root2 = "\"_Confim('"
								+ root
								+ "/report/case/savet47_party_ucmodify.do', '')\"";
				%>
				<td colspan="2" align="center">
					<input type="button" name="save" value="��  ��" class="in_button1"
						disabled="true" onClick=<%=root2%> />
				</td>
			</tr>
		</table>
       </div>
     </div>
   </div>
   		<!--��ʾ��--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
   
   </html:form>
  </body>
</html>
