<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<%@ page contentType="text/html; charset=GBK"%>
	<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
	<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
	<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
	<%@ page import="com.ist.aml.report.dto.T47_transaction"%>

	<head>
		<%
			String url = request.getContextPath();
			String basefuncurl = url + "/js/basefunc.js";
			String app_selecturl = url + "/js/App_Select.js";

			String valurl = url + "/js/validate.js";
			String countryurl = url + "/js/country.js";
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=valurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<%
			String tx_occur_area2 = "0";
			String tx_occur_area1 = "0";
			String tx_occur_area = "0";
			String tx_go_area2 = "0";
			String tx_go_area1 = "0";
			String tx_go_area0 = "0";
			String chinavalueflag = "0";
			if (request.getAttribute("p_areavalue") != null)
				chinavalueflag = (String) request.getAttribute("p_areavalue");
			T47_transaction t47_transaction = (T47_transaction) request
					.getAttribute("t47_transaction");
			String validateflag = t47_transaction.getValidateflag();

			if (t47_transaction.getTx_occur_area2() != null
					&& !"".equals(t47_transaction.getTx_occur_area2().trim()))
				tx_occur_area2 = t47_transaction.getTx_occur_area2();
			if (t47_transaction.getTx_occur_area1() != null
					&& !"".equals(t47_transaction.getTx_occur_area1()))
				tx_occur_area1 = t47_transaction.getTx_occur_area1();
			if (t47_transaction.getTx_occur_area() != null
					&& !"".equals(t47_transaction.getTx_occur_area()))
				tx_occur_area = t47_transaction.getTx_occur_area();

			if (t47_transaction.getTx_go_area2() != null
					&& !"".equals(t47_transaction.getTx_go_area2().trim()))
				tx_go_area2 = t47_transaction.getTx_go_area2();
			if (t47_transaction.getTx_go_area1() != null
					&& !"".equals(t47_transaction.getTx_go_area1().trim()))
				tx_go_area1 = t47_transaction.getTx_go_area1();
			if (t47_transaction.getTx_go_area() != null
					&& !"".equals(t47_transaction.getTx_go_area().trim()))
				tx_go_area0 = t47_transaction.getTx_go_area();

			String cashind = "";
			if (t47_transaction.getCash_ind() != null
					&& !"".equals(t47_transaction.getCash_ind())) {
				cashind = t47_transaction.getCash_ind();
			}
			String alertType = "BS";
			if (validateflag.equals("1") || validateflag.equals("3"))
				alertType = "BH";
		%>


		<script language="JavaScript">
var alert_type='<%=alertType%>';
var _st = window.setTimeout;
window.setTimeout = function(fRef, mDelay) {
 if(typeof fRef == 'function'){
  var argu = Array.prototype.slice.call(arguments,2);
  var f = (function(){ fRef.apply(null, argu); });
  return _st(f, mDelay);
 }
 return _st(fRef,mDelay);
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
			var agent_card_type_value=document.forms[0].agent_card_type.value;
			var opp_card_type_value=document.forms[0].opp_card_type.value;
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].card_inf.style.visibility='hidden';
				showValidateMsg($$('card_inf',0),'4','');
			}else {
				document.forms[0].card_inf.focus();
				validate_type('card_inf');
			}
			
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
			
				document.forms[0].opp_card_inf.style.visibility='hidden';
				showValidateMsg($$('opp_card_inf',0),'4','');
				
			}else {
				
				document.forms[0].opp_card_inf.focus();
				validate_type('opp_card_inf');
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
		
var valflag=<%=validateflag%>;
//���ַ���ת����javascript�е�����
arrItem1=getArrayArea();

//��ʼ��������
var  occur_area1="<%=tx_occur_area1%>";
var occur_area2="<%=tx_occur_area2%>";
var occur_area="<%=tx_occur_area%>";
var  go_area1="<%=tx_go_area1%>";
var go_area2="<%=tx_go_area2%>";
var go_area0="<%=tx_go_area0%>";
var chinavalueflag="<%=chinavalueflag%>";


function IndexSpace(str2){
         var str1 = " ";
        var s = str2.indexOf(str1);
        return(s);
 }
function IndexSpaceLast(str2){
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==" ")||(str2.substr(0,1)==" ")){
         return(1);
         }
         }
 }
function _Click(fromstr,tostr,type){
 var arrItem;
   if(type=="1"){
  // arrItem=arrItem2;
   }else{
     arrItem=arrItem1;
   }
   changelocation(fromstr,tostr,arrItem);
}

function  _DispRep(country,rowid,rowidreplay,type){
    var countryobj=eval('document.forms[0].'+country);
	var rowobj=eval('document.all.'+rowid);
	var rowobj1=eval('document.all.'+rowidreplay);
     var index=countryobj.selectedIndex; 
   var selvalue=countryobj.value;

   if(selvalue=="CHN"||selvalue=="Z01"||selvalue=="Z02"||selvalue=="Z03"){
   
    rowobj.style.display="";
    rowobj1.style.display="none";
     if(type=="1"){
     changeArea('tx_occur_area1','tx_occur_area2',arrItem1,'tx_occur_area',occur_area2,'1');
     }
     if(type=="2"){
     changeArea('tx_go_area1','tx_go_area2',arrItem1,'tx_go_area',go_area2,'1'); 
     } 
   }else{
     rowobj.style.display="none";
     rowobj1.style.display="";
   }

}

		
		
		var g_appid = "2";
				
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // ��֤��ʾ��
			//	g_ArrMsg.pop();
			//g_changed = true;
			//validate($$('acct_num',0), '', '')
			//g_changed = true;
			//validate($$('transactionkey',0), '', '');
	     
			g_changed = true;
			validate($$('agent_name',0), '', 'agent_card_type');
			g_changed = true;
			validate($$('agent_card_no',0), 'agent_card_type', '');
		   
			//g_changed = true;
			//validate($$('use_des',0), '', '');
			if(valflag=='1' ||valflag=='3'){
			g_changed = true; 
			   validate($$('org_trans_rela',0), 'rltp_hash', '');
			   g_changed = true;
				validate($$('organ_code',0), '', 'organ_code_type');
				g_changed = true;
				validate($$('organname',0), '', '');
				g_changed = true;
				validate($$('organ_area',0), '', '');
				
			}	
			//g_changed = true;
			//validate($$('opp_organname',0), '', '1');
			//g_changed = true;
			//validate($$('opp_organkey',0), '', 'opp_organ_type');
			//g_changed = true;
			//validate($$('opp_name',0), '', 'opp_card_type');
			g_changed = true;
			validate($$('opp_card_no',0), 'opp_card_type', '');
			//g_changed = true;
			//validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');	
			//g_changed = true;
			//set_tx_occur_allValue();
			g_changed = false;
		    var agent_name=document.forms[0].agent_name.value;
			var agent_card_type=document.forms[0].agent_card_type.value;
			var agent_card_no=document.forms[0].agent_card_no.value;
			var agent_country=document.forms[0].agent_country.value;
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','��������Ϣ������һ��Ϊ��ʱ�����д�������Ϣ�ֶζ�Ӧ�գ�����һ��ǿ�ʱ�����ж�����ǿ�');
			}
			
			validateDetail2('all');
			//document.forms[0].save.disabled = false;
		}
		function validateAgent() {
������������ ��var agent_name=document.forms[0].agent_name.value;	
			var agent_card_type=document.forms[0].agent_card_type.value;
			var agent_card_no=document.forms[0].agent_card_no.value;
			var agent_country=document.forms[0].agent_country.value;
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_name=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','��������Ϣ������һ��Ϊ��ʱ�����д�������Ϣ�ֶζ�Ӧ�գ�����һ��ǿ�ʱ�����ж�����ǿ�');
			}
		}
		
function validateDetail2(type) {
	   if(type=='all'||type=='acct_num'){
           g_changed = true; 
           if(valflag==3){
			    validate1($$('acct_num',0), '', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }else{
		        validate1($$('acct_num',0), '', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		}
	   if(type=='all'||type=='acct_type'){
           		g_changed = true; 
           	 if(valflag==3){
			    validate1($$('acct_type',0), 'pbc_catp', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
	         }else{
	            validate1($$('acct_type',0), 'pbc_catp', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
	         }
		}
		if(type=='all'||type=='opp_organname'){
		if(valflag==3){
		      g_changed = true;
              validate1($$('opp_organname',0), '', '1','',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
            }else{
		      g_changed = true;
			  validate1($$('opp_organname',0), '', '1',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		 }
		if(type=='all'||type=='opp_organkey'){
		    g_changed = true;
		    validate1($$('opp_organkey',0), '', 'opp_organ_type',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
         }
        if((type=='all'||type=='opp_organarea')&&valflag!=1){
		    g_changed = true;
		    set_opp_area_allValue();
		    validate1($$('opp_organarea',0), 'cfrc', '','BS',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
        }
        if(type=='all'||type=='opp_organ_type'){
            g_changed = true;
			validate1($$('opp_organ_type',0), 'cfct_hash', '',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
         }
        if(type=='all'||type=='opp_name'){
           if (valflag==2||valflag==3){
			    g_changed = true;
			    if(valflag==3&&get_opp_country('opp_country','opp_area1','opp_area2','opp_area')=='')
			     validate1($$('opp_name',0), '', 'opp_card_type','BS',get_obj_value('receive_pay_cd'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
			     else 
			     validate1($$('opp_name',0), '', 'opp_card_type','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		    else{
			    g_changed = true;
			    validate1($$('opp_name',0), '', 'opp_card_type',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
		}
		if(type=='all'||type=='opp_acct_num'){
           if(valflag==3){
               g_changed = true;
			   validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
            }else if (valflag==1){
			    g_changed = true;
			    validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }else if (valflag==2){
			    g_changed = true;
			    validate1($$('opp_acct_num',0), 'opp_acct_type_cd', '',alert_type,get_obj_value('receive_pay_cd'),get_opp_country('opp_country','opp_area1','opp_area2','opp_area'),'',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		    }
        }
        if(type=='all'||type=='tx_occur'){
            g_changed = true;
            set_tx_occur_allValue();
            if(valflag==3){
              g_changed = true;
              validate1($$('tx_occur',0), 'trcd', '','BS',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
            }else{
              g_changed = true;
			  validate1($$('tx_occur',0), 'trcd', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
           }		
		}
		if((type=='all'||type=='tx_go')&&valflag!=2){
            g_changed = true;
            set_tx_go_allValue();
			validate1($$('tx_go',0), 'tdrc', '',alert_type,get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		}
		if(type=='all'||type=='use_des'){
          if (valflag==3){
			g_changed = true;
			validate1($$('use_des',0), '', '','BS',get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		  }else{
		    g_changed = true;
			validate1($$('use_des',0), '', '',alert_type,get_obj_value('receive_pay_cd'),'','',get_tstp_value('currency_cd','cash_ind','settle_type_cd'));		
		  }
		    
        }
        if(type=='all'||type=='settle_type_cd'){
            var settle_type_cd_val=get_obj_value('settle_type_cd');
            if(settle_type_cd_val==null||settle_type_cd_val=='')
            {
            ����showValidateMsg($$('settle_type_cd',0),'2','���㷽ʽ����Ϊ��');
            }else{
				showValidateMsg($$('settle_type_cd',0),'4','');
			}
        }
        //Begin  2009-05-18 �޸�
       if(type=='all'||type=='opp_card_no'){
           		g_changed = true;
			    validate1($$('opp_card_no',0), 'opp_card_type', '','',get_obj_value('receive_pay_cd'),'',get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area'),get_tstp_value('currency_cd','cash_ind','settle_type_cd'));
		}
        //end   2009-05-18 �޸�
       //�Ե�������֤�������׷�ʽΪ20(����֧��)ʱ�����⽻�״�����дIP
       <% String isTestPoint=(String)request.getAttribute("isTestPoint");
       	  if("1".equals(isTestPoint))
       	  {
       %>
	       if(type=='all')
	       {	
	    	   des_disp2();
	       }
	  <%}%>
	}
				

		function set_tx_occur_allValue()
		{
			var tx_occur=get_opp_country('tx_occur_country','tx_occur_area1','tx_occur_area2','tx_occur_area');
			document.forms[0].tx_occur.value=tx_occur;
		}
		function set_tx_go_allValue()
		{
			var tx_occur=get_opp_country('tx_go_country','tx_go_area1','tx_go_area2','tx_go_area');
			document.forms[0].tx_go.value=tx_occur;
		}
		function set_opp_area_allValue()
		{
			var tx_occur=get_opp_country('opp_country','opp_area1','opp_area2','opp_area');
			document.forms[0].opp_organarea.value=tx_occur;
		}
		</script>
		<script type="text/javascript">
		
function _Confim(url){
	
			var errMsg ="";
			
			var nowDate = new Date();
			var str = nowDate.getFullYear()+"-"+(nowDate.getMonth() + 1)+"-"+nowDate.getDate();
			if(!_compareTwoDateForString(document.forms[0].dt_time_disp.value,str))
			{
				errMsg = "�������ڲ��ܴ��ڵ�ǰϵͳ����";
			}
				
	if ((document.forms[0].agent_card_type.value=='19')&&(getLength(document.forms[0].card_inf.value)>30||getLength(document.forms[0].card_inf.value)<=0)) {
        errMsg = "��д����ϸ��������Ϣ����֤�����͵�ע��ӦС��30���ַ���";
    }
	if ((document.forms[0].opp_card_type.value=='19' || document.forms[0].opp_card_type.value=='29')&&(getLength(document.forms[0].opp_card_inf.value)>30||getLength(document.forms[0].opp_card_inf.value)<=0)) {
        errMsg = "��д����ϸ��������Ϣ����֤�����͵�ע��ӦС��30���ַ���";
    }	
   //ҵ���ʶ��
   // if (getLength(document.forms[0].transactionkey.value)==0) {
   //     errMsg = "ҵ���ʶ�벻��Ϊ�գ�";
  //      document.forms[0].transactionkey.focus();
 //   } //�ʽ��ո���ʶ
   

   // var index1=document.forms[0].receive_pay_cd.selectedIndex;
   // if(document.forms[0].receive_pay_cd.options[index1].value==""){
   //   errMsg+="�ո���־����Ϊ��  ";
   // }
  //  var index2=document.forms[0].currency_cd.selectedIndex;
  //  if(document.forms[0].currency_cd.options[index2].value==""){
 //    errMsg+="���ֱ�־����Ϊ��  ";
  //  }
    

   
  //�ʽ���Դ����;
     if (getLength(document.forms[0].use_des.value)>128) {
        errMsg = "�ʽ���Դ����;���ܶ���128���ַ���";
      
    }
   
     // �Է����ڻ�����������
     if (getLength(document.forms[0].opp_organname.value)>256) {
        errMsg = "�Է����ڻ����������Ʋ��ܶ���256���ַ���";
    }
  
     //�˺�
  //if (getLength(document.forms[0].acct_num.value)>24) {
   //     errMsg = "�˺Ų��ܶ���24���ַ���";
   // }
     if(getLength(document.forms[0].tx_no.value)==0){
			 errMsg = "��ˮ�Ų���Ϊ�գ�";
	 }
 
     // ���״���������
     if (getLength(document.forms[0].agent_name.value)>10) {
        errMsg = "���״������������ܶ���10���ַ���";
    }
 
     //���״��������֤������
    if (getLength(document.forms[0].agent_card_no.value)>20) {
        errMsg = "���״��������֤�����벻�ܶ���20���ַ���";
    }
   
      //�Է����ڻ����������
     if (getLength(document.forms[0].opp_organkey.value)>24) {
        errMsg = "�Է����ڻ���������벻�ܶ���24���ַ���";
    }
  
     //���׶�������
     if (getLength(document.forms[0].opp_name.value)>64) {
        errMsg = "���׶����������ܶ���64���ַ���";
    }

    //���׶���֤������
     if (getLength(document.forms[0].opp_card_no.value)>24) {
        errMsg = "���׶���֤�����벻�ܶ���24���ַ���";
    }

    //���׶����˺�
     if (getLength(document.forms[0].opp_acct_num.value)>64) {
        errMsg = "���׶����˺Ų��ܶ���64���ַ���";
    }
    //�˺�
    else if (IndexSpace(document.forms[0].acct_num.value)>0) {
        errMsg = "�˺�ǰ����м䲻�ܳ��ֿո�";
       document.forms[0].acct_num.focus();
    }
     //���״��������֤������
    else if (IndexSpace(document.forms[0].agent_card_no.value)>0) {
        errMsg = "���������֤������ǰ����м䲻�ܳ��ֿո�";
       document.forms[0].agent_card_no.focus();
    }
     //ҵ���ʶ��
   // else if (IndexSpace(document.forms[0].transactionkey.value)>0) {
   //     errMsg = "ҵ���ʶ��ǰ����м䲻�ܳ��ֿո�";
    //   document.forms[0].transactionkey.focus();
   // }
    //�Է����ڻ����������
    else if (IndexSpace(document.forms[0].opp_organkey.value)>0) {
        errMsg = "�Է����ڻ����������ǰ����м䲻�ܳ��ֿո�";
       document.forms[0].opp_organkey.focus();
    }
    //���׶���֤������
    else if (IndexSpace(document.forms[0].opp_card_no.value)>0) {
        errMsg = "���׶���֤������ǰ����м䲻�ܳ��ֿո�";
       document.forms[0].opp_card_no.focus();
    }
    //���׶����˺�
    else if (IndexSpace(document.forms[0].opp_acct_num.value)>0) {
        errMsg = "���׶����˺�ǰ����м䲻�ܳ��ֿո�";
       document.forms[0].opp_acct_num.focus();
    }
     //���׶�������
    else if (IndexSpaceLast(document.forms[0].opp_name.value)>0) {
        errMsg = "���׶�������ǰ���ܳ��ֿո�";
       document.forms[0].opp_name.focus();
    }
    //����������
    else if (IndexSpaceLast(document.forms[0].agent_name.value)>0) {
        errMsg = "����������ǰ���ܳ��ֿո�";
       document.forms[0].agent_name.focus();
    }
    //�ո��������֤
    else if(document.forms[0].receive_pay_cd.value=="01" && document.forms[0].debit_credit.value=="D"){
      errMsg="�ո���־�ͽ����־���� ";
    }
    else if(document.forms[0].receive_pay_cd.value=="02" && document.forms[0].debit_credit.value=="C"){
      errMsg="�ո���־�ͽ����־���� ";
    }
    
    
 if(valflag=="1" ||valflag=="3"){
     //�˺ű�ʶ��
    if (getLength(document.forms[0].acct_num.value)==0&&document.forms[0].org_trans_rela.value=="01") {
        errMsg = "���ڻ�������׵Ĺ�ϵΪ'�յ���'ʱ,�˺Ų���Ϊ�գ�";
        document.forms[0].acct_num.focus();
        }

      //���ڻ�������׵Ĺ�ϵ
     if (getLength(document.forms[0].org_trans_rela.value)==0) {
        errMsg = "���ڻ�������׵Ĺ�ϵ����Ϊ�գ�";
      
    }
 
    var tx_go_countryindex=document.forms[0].tx_go_country.selectedIndex;
   
     if (document.forms[0].tx_go_country.options[tx_go_countryindex].value=="XXX" && getLength(document.forms[0].opp_organname.value)==0) {
        errMsg = "�����׷���Ϊ�����ʽ�ľ������Ϊת����ʱ���Է����ڻ����������Ʋ���Ϊ��Ӧ��дת�������ƣ�";
      
    }
  }  
  	
	

   // var settleindex=document.forms[0].settle_type_cd.selectedIndex;
   // if(document.forms[0].settle_type_cd.options[settleindex].value==""){
   //    errMsg = "���㷽ʽ����Ϊ�գ�";
  //  }
    //else{
     //  var cashIndex=document.forms[0].cash_ind.selectedIndex;
     //  if(document.forms[0].cash_ind.options[cashIndex].value==""){
      //     errMsg = "�ֳ���־����Ϊ�գ�";
      // }else{
      //    if(document.forms[0].cash_ind.options[cashIndex].value=="00"){
       //       var occrsel=document.forms[0].tx_occur_area.selectedIndex; 
       //       var occrsel2=document.forms[0].tx_occur_area1.selectedIndex; 
       //        if(document.forms[0].tx_occur_area1.options[occrsel2].value==""){
      //          errMsg = "�����׷�ʽΪ�ֳ�����ʱ���׷����ز���Ϊ�գ�";
       //        } 
       //   }
      // }
    // } 
      var cash_ind='<%=cashind%>';
   if(cash_ind=="00"){
       var occrsel=document.forms[0].tx_occur_country.selectedIndex; 
              var occrsel2=document.forms[0].tx_occur_area1.selectedIndex; 
               if(document.forms[0].tx_occur_area1.options[occrsel2].value==""||document.forms[0].tx_occur_country.options[occrsel].value==""){
                errMsg = "�����׷�ʽΪ�ֳ�����ʱ���׷����ز���Ϊ�գ�";
          } 
    }
     
     
    if(valflag=="2" ||valflag=="3"){
      var seleceindex1=document.forms[0].opp_country.selectedIndex;
      if(document.forms[0].opp_country.options[seleceindex1].value==""){
             var selectindex2=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex2].value!=""){
               errMsg="�Է����ڻ������Ҳ���Ϊ�գ�" 
             }
      }else{
        if(document.forms[0].opp_country.options[seleceindex1].value=="CHN"){
         var selectindex3=document.forms[0].opp_area1.selectedIndex;
             if(document.forms[0].opp_area1.options[selectindex3].value==""){
               errMsg="�Է����ڻ������ҵ�������Ϊ�գ�" 
             }
           
          }
       }
    }
      /*if(valflag=="1" ||valflag=="3"){ 
      var seleceindex2=document.forms[0].tx_go_country.selectedIndex;
      if(document.forms[0].tx_go_country.options[seleceindex2].value=="" ){
             var selectindex4=document.forms[0].tx_go_area1.selectedIndex;
             if(document.forms[0].tx_go_area1.options[selectindex4].value!=""){
               errMsg="���׷�����Ҳ���Ϊ�գ�" 
             }
      }else{
        if(document.forms[0].tx_go_country.options[seleceindex2].value=='CHN'||document.forms[0].tx_go_country.options[seleceindex2].value=='Z01'
        ||document.forms[0].tx_go_country.options[seleceindex2].value=='Z02'||document.forms[0].tx_go_country.options[seleceindex2].value=='Z03'){
         var selectindex5=document.forms[0].tx_go_area1.selectedIndex;
             if(document.forms[0].tx_go_area1.options[selectindex5].value==""){
               errMsg="���׷����������Ϊ�գ�" 
             }
         }
           
      }
    }*/
      

//if(valflag=="2"||valflag=="3"){
    //����ʱ�䲻��С�ڿ���ʱ��
 //    if (getLength(document.forms[0].close_dt_disp.value)!=0&&document.forms[0].open_dt_disp.value>document.forms[0].close_dt_disp.value) {
 //       errMsg = "����ʱ�䲻��С�ڿ���ʱ�䣡";  
 //    }
//}
 
   var err = "";
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
			if(document.activeElement.tagName=="INPUT")
			{
				window.setTimeout(inputConfim,100,url);
			}else{
		       window.setTimeout(function(){
			        if(!checkAllValidate()) {
							return false;
					}else{
						//alert("����");
					   document.forms[0].action=url;
			           document.forms[0].submit();
				    }
		       },100);
			}
          
		 //  document.forms[0].action=url;
		 //  document.forms[0].submit();
		}
		
		function _Confim1(url){
		document.forms[0].action=url;
		   document.forms[0].submit();
		}
function des_disp(){
	var jsfs=document.forms[0].settle_type_cd.value;
	if(jsfs=="E100" || jsfs=="E110" || jsfs=="E120"){
		str_v="";
		if(jsfs=="E100"){
			str_v="������˻����㲢ת�˽����ʽ���;Ӧ˵����ұ��ֺͽ��";
		}else if(jsfs=="E110"){
			str_v="����˻���㲢ת�˽����ʽ���;Ӧ˵������ҽ��";
		}else{
			str_v="��Ҽ�һ���ת�˽����ʽ���;Ӧ˵���ʽ�ת���˻��ı��ֺͽ��";
		}
		document.getElementById('des_disp').innerHTML='<font color="red">'+str_v+'</font>';
		document.getElementById('des_disp').style.display='block';
	}else{
		document.getElementById('des_disp').style.display='none';
	}
}
function des_disp2(){

	var jsfs=document.forms[0].settle_type_cd.value;
	
	if (jsfs=='20')
	{
		document.getElementsByName('tsctkey')[0].style.display='none';			
		document.getElementById('ipaddr').style.display='';
		
		testRegx($$('ipaddr',0));
	}else
	{
		document.getElementsByName('tsctkey')[0].style.display='';
		document.getElementById('ipaddr').style.display='none';
		showValidateMsg($$('ipaddr',0),'3','');
	}
	

}

	

//��֤���ڸ�ʽ obj�ֶ� flag 1����Ϊ��  0������Ϊ��
function isDate(obj,flag) {
	showValidateMsg(obj, 0, "");
	if(flag=='0')
	{
    if(obj.value==''||obj.value==null)
    {
    showValidateMsg(obj, 2,"����Ϊ�գ�");
    //obj.focus();
    return false;
    }
    }
    
	
     if(obj.value!=null&&obj.value!=''&&obj.value.match(/^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/)==null)
         {
                     //alert("��������Ч������!");
                    showValidateMsg(obj, 2, "���ڸ�ʽ����");
                    // obj.focus();
                     return false;
        }
     
      showValidateMsg(obj, 1, "");  
     }
//��֤����ʽ obj�ֶ�  flag 1����Ϊ��  0������Ϊ��
	function check_amt(obj,flag)
	{
		if(flag=='0')
		{
	    if(obj.value==''||obj.value==null)
	    {
	    showValidateMsg(obj, 2,"����Ϊ�գ�");
	    //obj.focus();
	    return false;
	    }
	    }
		
		if(!checkFloat(obj.value)){
			showValidateMsg(obj, 2, "������Ϊ���֣�");
			return false;
	     }
	     
		showValidateMsg(obj, 1, ""); 
	}

	function  _Change(curr_cd){

		   var currobj=eval('document.forms[0].currency_cd');
		   var cash_ind = eval('document.forms[0].cash_ind');
		   var cash_indValue = cash_ind.value;
		   var selvalue=currobj.value;
		   if(selvalue=="CNY"){//����
		   		if(cash_indValue=="00"){//�ֳ�
		   			document.all.settle1.style.display="";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="none";
		   		}else{//����
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="";
		    		document.all.settle4.style.display="none";
		   		}
		   		//for(var i = 0; i < document.getElementById('currency_cd').getElementsByTagName('option').length; i ++) {
		   		//	if(document.getElementById('currency_cd').getElementsByTagName('option')[i].value == "CNY") {
		   				//document.getElementById('currency_cd').getElementsByTagName('option')[i].selected = true;
		   		//	}
		   		//}
		   }else{//���
		   		if(cash_indValue=="00"){//�ֳ�
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="none";
		   		}else{//����
		   			document.all.settle1.style.display="none";
		    		document.all.settle2.style.display="none";
		    		document.all.settle3.style.display="none";
		    		document.all.settle4.style.display="";
		   		}
		   		//for(var i = 0; i < document.getElementById('currency_cd').getElementsByTagName('option').length; i ++) {
		   		//	if(document.getElementById('currency_cd').getElementsByTagName('option')[i].value == "USD") {
		   				//document.getElementById('currency_cd').getElementsByTagName('option')[i].selected = true;
		   			//}
		   		//}
		   }
		}
	//��settle_type_cd1-4��ֵ�ı��ʱ��ͬ���ı�settle_type_cd��ֵ
	function  syn_settle_type_cd(obj){

			document.forms[0].settle_type_cd.value=obj.value;
			//alert(document.forms[0].settle_type_cd.value);
		}
   function _Open2(url){
 
      window.open(url,'','height=500, width=900,left=100,top=100, status=yes, scrollbars=yes,resizable=yes');
         
	}
</script>


		<style type="text/css">
.STYLE2 {
	color: red;
}
</style>


	</head>
	<body class="mainbg"
		onload="card_inf_exp('1','');_Change('curr_cd');validateDetail();">
		<div id="main">
			<html:form action="/case/t07_case_app_add_trans_page_new.do"
				method="post">
				<html:hidden name="t47_transaction" property="party_class_cd" />
				<html:hidden name="t47_transaction" property="party_chn_name" />
				<html:hidden name="t47_transaction" property="party_id" />
				<html:hidden name="t47_transaction" property="organkey_new" />
				<html:hidden name="t47_transaction" property="organ_name" />				
				<html:hidden name="t47_transaction" property="validate_ind" />
				<html:hidden name="t47_transaction" property="validate_ind2" />
				<html:hidden name="t47_transaction" property="validateflag" />

				<bean:define id="p_areavalue" name="p_areavalue" />

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>��������</span>
						<span class="buttons"> <a href="#"
							onclick="_Confim('t07_case_app_add_trans_page_new_do.do')"> <img
									src="../../images/blue/b_save.png" />�� ��</a> </span>
					</div>

					<%
						if (validateflag.equals("1") || validateflag.equals("3")) {
					%>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />������Ϣ</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td align="right">
									���ڻ�������������ͣ�
								</td>
								<td align="left">
									<html:text property="organ_code_type_disp" value="00"
										readonly="true" />
									<img src="../../images/lock.jpg" />
									<html:hidden property="organ_code_type" />
								</td>
								<td align="right">
									���ڻ���������룺
								</td>
								<td align="left">
									<html:text property="organ_code" readonly="true" alt="���ڻ����������"
										onchange="change();"
										onblur="validate(this, '', 'organ_code_type');" />
									<img src="../../images/lock.jpg" />
									<html:hidden property="isInnerOrganCode"></html:hidden>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--FICT-->
									���ڻ����������ƣ�
								</td>
								<td align="left">
									<html:text property="organname" readonly="true"
										onchange="change();" onblur="validate(this, '', '');" />
									<img src="../../images/lock.jpg" height='20' />
								</td>
								<td align="right">
									���ڻ������ڵ�����������
								</td>
								<td align="left">
									<html:text property="organ_area_disp" readonly="true"
										onchange="change();validate(this, '', '');" />
									<!-- onclick="window.open('/common/editCountryArea.jsp?inname=organ_area&inname_disp=organ_area_disp&type=short','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');" -->
									<html:text property="organ_area" size="9" readonly="true" />
									<img src="../../images/lock.jpg" />

								</td>
							</tr>
							<tr>
								<td align="right">
									<!--RLTP-->
									���ڻ�������׵Ĺ�ϵ��
								</td>
								<td align="left" colspan="3">
									<html:select property="org_trans_rela" alt="���ڻ�������׵Ĺ�ϵ"
										onchange="change();validate(this, 'rltp_hash', '');" onblur="">
										<html:options collection="org_trans_relaMap" property="label"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font> ���ο�ϵͳ��ʾ��
								</td>
							</tr>

						</table>
					</div>
					<%
						} else {
					%>
					<html:hidden property="org_trans_rela" />
					<%
						}
					%>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />��������Ϣ</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" align="center"
							id="agent_table">
							<tr>
								<td align="right">

									���״�����������
								</td>
								<td align="left">
									<html:text property="agent_name" onchange="change();"
										onblur="validate(this, 'agent_country', '0');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
								<td align="right">
									�����˹�����
								</td>
								<td align="left">
									<html:select property="agent_country"
										onchange="change();validate($$('agent_name',0), 'agent_country', '');validateAgent();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="nationalityMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--FICT-->
									���������֤�����ͣ�
								</td>
								<td align="left" colspan="3">
									<html:select property="agent_card_type" style="width:250px"
										onchange="card_inf_exp('agent_card_type','card_inf');change();validate($$('agent_card_no',0), 'agent_card_type', '');validateAgent();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="agent_card_typeMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:text property="card_inf" size="30" maxlength="30"
										onblur="validate_type('card_inf');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
							</tr>
							<tr>
								<td align="right">
									���������֤�����룺
								</td>
								<td align="left" colspan="3">
									<html:text property="agent_card_no" onchange="change();"
										onblur="validate(this, 'agent_card_type', '');validateAgent();" />
									<!--  <img style="display: none" dir=""  width="20" height="20" />-->
								</td>
							</tr>
						</table>
					</div>
					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />������Ϣ</strong> </span>
					</div>

					<div class="cond_c2">
						<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<!-- ������ϸ��Ϣ -->
							<!-- ���ڻ���������Ϣ  -->
							<!-- ��������Ϣ  -->

							<!-- ������Ϣ  -->
							<tr>

								<td width="24%" align="right" bgcolor="ECF3FF">
									����ʱ�䣺
								</td>
								<td width="76%" bgcolor="F6F9FF" >
									<input type="text" name="dt_time_disp" alt="����ʱ��"
										onpropertychange="isDate(this,0)" size="20" maxlength="20"
										onclick="calendar.show(this);" class="calimg" />
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									��ˮ�ţ�
								</td>
								<td bgcolor="F6F9FF">
									<html:text property="tx_no" alt="��ˮ��" />
									<font color="#FF0000"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									�ʽ��ո���ʶ��
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="receive_pay_cd" alt="�ʽ��ո���ʶ">
										<html:options collection="receive_pay_cdMap" property="key"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									���׽�
								</td>
								<td bgcolor="F6F9FF">
									<!--<html:hidden  property="cny_amt" />-->
									<input type="text" name="amt_disp" maxlength="15"
										onpropertychange="check_amt(this,'0');" />
									<font color="#FF0000"> *</font>
								</td>

							</tr>


							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									���֣�
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="currency_cd" alt="����"
										onclick="_Change('curr_cd');" style="width:80">
										<html:options collection="currency_cdMap" property="key"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
								<td align="right" bgcolor="ECF3FF">
									�ֳ���־��
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="cash_ind" onclick="_Change('curr_cd');">
										<html:options collection="t87_pbc_cashMap" property="label"
											labelProperty="value" />
									</html:select>
									<font color="#FF0000"> *</font>
								</td>
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									�˺ţ�
								</td>
								<td  bgcolor="F6F9FF">
									<html:text property="acct_num" onchange="change();"
										onblur="validateDetail2('acct_num');" alt="�˺�" />

								</td>
								<td>
									��/����
								</td>
								<td>
									<html:select property="debit_credit"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="debit_creditMap" property="label"
											labelProperty="value" />
									</html:select>

									<font color="red">*</font>
								</td>
								
							</tr>
							<tr>
								<td align="right" bgcolor="ECF3FF">
									�˻����ͣ�
								</td>
								<td colspan="3">
									<html:select property="acct_type" onchange="change();"
										onblur="validateDetail2('acct_type');" alt="�˻�����"
										style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="acct_typeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								
							</tr>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TSTP-->

									֧�����߼����㷽ʽ��
								</td>
								<td colspan="3">

									<html:select property="settle_type_cd1" styleId="settle1"
										onchange=" syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs1Map" property="label"
											labelProperty="value" />
									</html:select>


									<html:select property="settle_type_cd2" styleId="settle2"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs2Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:select property="settle_type_cd3" styleId="settle3"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs3Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:select property="settle_type_cd4" styleId="settle4"
										onchange="syn_settle_type_cd(this);validateDetail2('all');des_disp();"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="t87_pbc_gjfs4Map" property="label"
											labelProperty="value" />
									</html:select>

									<html:hidden property="settle_type_cd" />
									<font color="#FF0000"> *</font>
								</td>
								
							</tr>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TSCT-->

									������֧���׷�������룺
								</td>
								<td bgcolor="F6F9FF" colspan="3">

									<html:select property="tsctkey" style="width:300px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="tsctMap" property="label"
											labelProperty="value" />
									</html:select>
                                    <input type="text" id="ipaddr" style="display:none" value=""  name="ipaddr" onblur="testRegx(this);"></input>
								</td>

							</tr>
							<tr>

								<td height="18" align="right" bgcolor="ECF3FF">
									<!--CRSP-->

									�ʽ���Դ����;��
								</td>
								<td bgcolor="F6F9FF" colspan="3" align="left">
									<html:text property="use_des" size="40" maxlength="64"
										onchange="change();" onblur="validateDetail2('use_des');" />
									<div id="des_disp" style="display: none;">
									</div>
								</td>
							</tr>
							<tr>

								<td height="18" align="right" bgcolor="ECF3FF">
									<!--TRCD-->

									���׷����أ�
								</td>

								<td bgcolor="F6F9FF">
									<html:select property="tx_occur_country" style="width:150"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="_DispRep('tx_occur_country','org2','orgreplay2','1');set_tx_occur_allValue();change();"
										onblur="validateDetail2('tx_occur');">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<logic:equal name="t47_transaction" property="tx_occur_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay2">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org2" style="display: none">
								</logic:equal>

								<logic:notEqual name="t47_transaction" property="tx_occur_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay2" style="display: none">

									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org2">
								</logic:notEqual>
								<html:select property="tx_occur_area1" style="width:150"
									onchange="_Click('tx_occur_area1','tx_occur_area2');_Click('tx_occur_area2','tx_occur_area');set_tx_occur_allValue();change();"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))"
									onblur="validateDetail2('tx_occur');">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>
								<html:select property="tx_occur_area2" style="width:150"
									onchange="_Click('tx_occur_area2','tx_occur_area');set_tx_occur_allValue();change();"
									onblur="validateDetail2('tx_occur');" style="width:100">
									<option value="">
										��ѡ��
									</option>
									<option
										value="<bean:write property="tx_occur_area2" name="t47_transaction" />"
										selected>
										<bean:write property="tx_occur_area2name"
											name="t47_transaction" />
									</option>
								</html:select>
								<html:select property="tx_occur_area" style="width:100"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))"
									onchange="set_tx_occur_allValue();change();"
									onblur="validateDetail2('tx_occur');">
									<option value="">
										��ѡ��
									</option>
									<option
										value="<bean:write property="tx_occur_area" name="t47_transaction" />"
										selected>
										<bean:write property="tx_occur_areaname"
											name="t47_transaction" />
									</option>
								</html:select>
								<input type="hidden" name="tx_occur"/>
								</td>

							</tr>
							<%
								if (validateflag.equals("1") || validateflag.equals("3")) {
							%>
							<tr>
								<!-- ��� -->
								<td width="20%" height="18" align="right" bgcolor="ECF3FF">
									<!--TDRC-->

									���׷���
								</td>
								<td bgcolor="F6F9FF">

									<html:select property="tx_go_country"
										onchange="_DispRep('tx_go_country','org1','orgreplay1','2');_Click('tx_go_area1','tx_go_area2','0');_Click('tx_go_area2','tx_go_area','0');change();set_tx_go_allValue();"
										onblur="validateDetail2('all');" style="width:150"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<logic:equal name="t47_transaction" property="tx_go_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay1">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org1" style="display: none">
								</logic:equal>
								<logic:notEqual name="t47_transaction" property="tx_go_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay1" style="display: none">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org1">
								</logic:notEqual>
								<html:select property="tx_go_area1"
									onchange="_Click('tx_go_area1','tx_go_area2','0');_Click('tx_go_area2','tx_go_area');set_tx_go_allValue();change();"
									onblur="validateDetail2('tx_go');" style="width:150"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>

								<html:select property="tx_go_area2"
									onchange="_Click('tx_go_area2','tx_go_area','0');change();set_tx_go_allValue();"
									onblur="validateDetail2('tx_go');" style="width:100"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										��ѡ��
									</option>

								</html:select>
								<html:select property="tx_go_area" style="width:100"
									onchange="change();set_tx_go_allValue();"
									onblur="validateDetail2('tx_go');">
									<option value="">
										��ѡ��
									</option>
								</html:select>
                               <input type="hidden" name="tx_go" value="" />
								</td>
								
							</tr>
							<%
								} else {
							%>
							<html:hidden property="tx_go_country" />
							<html:hidden property="tx_go_area" />
							<%
								}
							%>





						</table>
					</div>

					<div class="cond_t2">
						<span class="buttons"> <strong><img
									src="../../images/blue/titleicon02.png" />������Ϣ</strong> </span>
					</div>

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">



							<tr>
								<td align="right">
									���׶����˺�����:
								</td>
								<td align="left" colspan="3">
									<html:select property="opp_acct_type_cd" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="change();validate($$('opp_acct_num',0), 'opp_acct_type_cd', '');">
										<html:options collection="opp_acct_type_cdMap"
											property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td align="right">
									���׶����˺ţ�
								</td>
								<td align="left">
									<html:text property="opp_acct_num" onchange="change();"
										onblur="validateDetail2('opp_acct_num');" />
								</td>
								<td align="right">
									<!--TCNM-->
									���׶���������
								</td>
								<td align="left">
									<%
										if (validateflag.equals("1") || validateflag.equals("3")) {
									%>
									<html:text property="opp_name" onchange="change();"
										onblur="validateDetail2('opp_name');" />
									<%
										} else {
									%>
									<html:text property="opp_name" onchange="change();"
										onblur="validateDetail2('opp_name');" />
									<%
										}
									%>
								</td>
							</tr>
							<tr>
								<td align="right">
									<!--TCIT-->
									���׶������֤�����ͣ�
								</td>
								<td align="left" colspan="3">

									<html:select property="opp_card_type" style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
										onchange="card_inf_exp('opp_card_type','opp_card_inf');change();validateDetail2('opp_name');change();validateDetail2('opp_card_no');">
										<html:options collection="opp_card_typeMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:text property="opp_card_inf" size="30" maxlength="30"
										onblur="validate_type('opp_card_inf');" />

								</td>
							</tr>
							<tr>

								<td align="right">
									<!--CFRC-->
									���׶������֤�����룺
								</td>
								<td align="left">
									<html:text property="opp_card_no" onchange="change();"
										onblur="validate(this, 'opp_card_type', '');validateDetail2('opp_card_no');" />
								</td>
								<td align="right">
									�Է����ڻ����������ƣ�
								</td>
								<td align="left">
									<html:text property="opp_organname" onchange="change();"
										onblur="validateDetail2('opp_organname');" />
										<!--  
										<a href="#" onclick="_Open2('<%=request.getContextPath() %>/report/case/t47case_opp_bank_list.do?newflag=1')" ><span class="cond_buttons"><img src="../../images/blue/b_location.png" />��λ</span></a>
								       -->
								</td>
							</tr>

							<tr>
								<td align="right">
									<!--CFIN-->
									�Է����ڻ����������ͣ�
								</td>
								<td align="left">
									<html:select property="opp_organ_type"
										onchange="change();validateDetail2('opp_organ_type');
											change();validateDetail2('opp_organkey');"
										style="width:250px"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="opp_organ_typeMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
								<td align="right">
									�Է����ڻ���������룺
								</td>
								<td align="left">
									<html:text property="opp_organkey" onchange="change();"
										onblur="validateDetail2('opp_organkey');" />
								</td>
							</tr>
							<%
								if (validateflag.equals("2") || validateflag.equals("3")) {
							%>
							<tr>
								<td height="18" align="right" bgcolor="ECF3FF">
									�Է����ڻ������������������룺
								</td>
								<td bgcolor="F6F9FF">
									<html:select property="opp_country" style="width:150"
										onchange="_DispRep('opp_country','org','orgreplay','0');change();set_opp_area_allValue();"
										onblur="validateDetail2('all');"
										onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))">
										<html:options collection="countryMap" property="label"
											labelProperty="value" />
									</html:select>
									<input type="hidden" name="opp_organarea" vlaue="" />
								</td>
								<logic:equal name="t47_transaction" property="opp_area"
									value="<%=p_areavalue.toString()%>">
									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org" style="display: none">
								</logic:equal>
								<logic:notEqual name="t47_transaction" property="opp_area"
									value="<%=p_areavalue.toString()%>">

									<td height="22" bgcolor="F6F9FF" colspan="2" align="left"
										id="orgreplay" style="display: none">
									</td>
									<td height="22" bgcolor="ECF3FF" colspan="2" align="left"
										id="org">
								</logic:notEqual>
								<html:select property="opp_area1" style="width:150"
									onchange="_Click('opp_area1','opp_area2');change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<html:options collection="area1Map" property="label"
										labelProperty="value" />
								</html:select>
								&nbsp;&nbsp;

								<html:select property="opp_area2" style="width:100"
									onchange="_Click('opp_area2','opp_area');change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										��ѡ��
									</option>
									<option
										value="<bean:write property="opp_area2" name="t47_transaction" />"
										selected>
										<bean:write property="opp_area2Name" name="t47_transaction" />
									</option>
								</html:select>
								&nbsp;&nbsp;
								<html:select property="opp_area" style="width:100"
									onchange="change();set_opp_area_allValue();"
									onblur="validateDetail2('opp_organarea');"
									onmouseover="selMouseOver(this,$('div_hint'))"
									onmouseout="selMouseOut(this,$('div_hint'))">
									<option value="">
										��ѡ��
									</option>
									<option
										value="<bean:write property="opp_area" name="t47_transaction" />"
										selected>
										<bean:write property="opp_areaName" name="t47_transaction" />
									</option>
								</html:select>
								</td>
							</tr>
							<%
								} else {
							%>
							<html:hidden property="opp_country" />
							<html:hidden property="opp_area" />
							<%
								}
							%>
						</table>
					</div>

					<div class="sys_warning">
						<strong><img src="../../images/blue/warning.png" />ϵͳ��ʾ��</strong>
						<p> &nbsp;&nbsp;1�����ڻ�������׵Ĺ�ϵ��ֵ�����пͻ���������ʱѡ�� '��������'��ͨ���������п���������ʱѡ�� '�յ���';�Ǳ��пͻ���������ʱѡ�� '����ҵ�����'
							<br />
							&nbsp;&nbsp;2�������׽����֤��������ȫ��ͬ����к�ʵ���磺�ͻ����֤�����룬���׶������֤�����룬�˺Ż��׶����˺ţ����������֤�����룬�Թ��������������֤������(���޿���)��
							<br />
							&nbsp;&nbsp;3�������ʴ�����ɽ��׽���1��Ԫ����һ��ֵ1000����Ԫʱ����к�ʵ��
							<br />
							&nbsp;&nbsp;4�����ͻ�����д���˻�����(CATP)���򡰽��׶����˻�����(TCAT)��ʱ�����޷���������Ҹ��������˻�Ϊ�������˻������ǡ�����˻�����һ��ѡ�񡰱����˻�����д��
							<br />
							&nbsp;&nbsp;5�����ͻ�����д���˻�����(CATP)���򡰽��׶����˻�����(TCAT)��ʱ�������˻����ǡ�6100��֤ת���˻���(��6200��֤ת���˻���)���������˻�����(����0011����ұ��ش����-�����˻�)ʱ,һ��ѡ��6100��֤ת���˻���(��6200��֤ת���˻���)��д��
							<br />
						</p>
					</div>
				</div>

			</html:form>
		</div>
		<script type="text/javascript">

if(valflag=="1" || valflag=="3"){	
_init(go_area1,go_area2,go_area0,'2');
}
_init(occur_area1,occur_area2,occur_area,'1');

function  _init(area1,area2,area,type){

if(area1!="0"){

  if(area!=chinavalueflag){
     if(type=="1")
      changeArea('tx_occur_area1','tx_occur_area2',arrItem1,'tx_occur_area',area2,'1'); 
      else{
   
      changeArea('tx_go_area1','tx_go_area2',arrItem1,'tx_go_area',area2,'1'); 
      
      }
    } 
}

if(area2!="0"){
  if(area=="0")
     area="";
    
   if(area!=chinavalueflag){
    if(type=="1"){
   changeArea('tx_occur_area2','tx_occur_area',arrItem1,'',area,0); 
   }
     else{ 
       changeArea('tx_go_area2','tx_go_area',arrItem1,'',area,0); 
       } 
   }
}

}
</script>
		<!--��ʾ��-->
		<div id=div_hint
			style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
	</body>
</html>