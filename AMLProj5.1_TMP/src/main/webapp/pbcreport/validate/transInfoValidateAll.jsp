<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.aml.report.dto.T47_transaction"%>
<%@ page import="com.ist.util.StringUtils"%>
<%@ page import="java.util.HashMap"%>
<%HashMap errorMap=(HashMap)request.getAttribute("errorHash"); %>
	<head>
		<%String url = request.getContextPath();
     String cssurl=url+"/css/css_all.css";
     String  titlejsurl=url+"/js/title.js";
     String basefuncurl=url+"/js/basefunc.js";
     String app_selecturl=url+"/js/App_Select.js";

     String valurl=url+"/js/validate.js";
     String  countryurl=url+"/js/country.js";
   %>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src=<%=valurl%>></script>
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<script language="JavaScript" src=<%=app_selecturl%>></script>
		<script type='text/javascript' src=<%=countryurl%>></script>
		<script type='text/javascript' src='./dwr/interface/BasicReport.js'></script>
		<script type='text/javascript' src='./dwr/engine.js'></script>
		<script type='text/javascript' src='./dwr/util.js'></script>
		<script src="/js/validate.js" language="javascript"></script>

		<%
		String saveflag = (String)request.getAttribute("savesucc");
		if(saveflag==null) saveflag="-1"; // ���Ǵӱ�������
		else if("1".equalsIgnoreCase(saveflag)) saveflag="1"; // �ɹ���������
		else saveflag="0";
		 %>
		<script language="javascript">		
		if("<%=saveflag%>"=="0") alert("����ʧ��");
		else if("<%=saveflag%>"=="1") alert("����ɹ�!");
		
		var g_appid = "1";
		function card_inf_exp(type,value){
		if(type!='1'){
			var agent_card_type_value=eval('document.forms[0].'+type+'.value');
			if(agent_card_type_value=='19'||agent_card_type_value=='29'){
				eval('document.forms[0].'+value+".style.visibility='visible'");
				eval('document.forms[0].'+value+".focus()");
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
			var agent_card_type_value=document.forms[0].tbit.value;
			var opp_card_type_value=document.forms[0].tcit.value;
			if(agent_card_type_value!='19' && agent_card_type_value!='29'){
				document.forms[0].tbit_inf.style.visibility='hidden';
				showValidateMsg($$('tbit_inf',0),'4','');
			}else {
				document.forms[0].tbit_inf.focus();
			}
			if(opp_card_type_value!='19'&& opp_card_type_value!='29'){
				document.forms[0].tcit_inf.style.visibility='hidden';
				showValidateMsg($$('tcit_inf',0),'4','');
			}else {
				document.forms[0].tcit_inf.focus();
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
		 function IndexSpaceLast(str2){
		   var str1 = " ";
           var str3 = "��";
           if (str2.length>0){
         if ((str2.substr(str2.length-1,1)==str1)||(str2.substr(0,1)==str1)||(str2.substr(str2.length-1,1)==str3)||(str2.substr(0,1)==str3)){
         return(1);
         }
         }
       }				
		function validateDetail() {
			//while(g_ArrMsg.length > 0) // ��֤��ʾ��
			//	g_ArrMsg.pop();
			var bAlertType = '<bean:write name='report_type'/>';
			
			//g_changed = true;
			//validate($$('ticd',0), '', '');
			g_changed = true;
			validate($$('tbnm',0), '', 'tbit');
			g_changed = true;	
			validate($$('tbid',0), 'tbit', '');
			g_changed = true;
			validate($$('settle_type_cd',0), 'tstp', '');
			
			<% String isTestPoint=(String)request.getAttribute("isTestPoint");
		      	  if(!"1".equals(isTestPoint))
		      	  {
		     %>
				g_changed = true;
				validate($$('tsct_key',0), 'tsct', '');
			<%}%> 
			
			g_changed = true;
			validate($$('ocurr',0), 'trcd', '');
			g_changed = true;
		    
			
			if(bAlertType=="1") {
			//g_changed = true;
			//validate($$('go',0), 'tdrc', '');
			g_changed = true;
	        validate($$('rltp',0), 'rltp_hash', '');
	        //g_changed = true;
	       // validate($$('ctac',0), '', '');
	       //  g_changed = true;
	       // validate($$('crat',0), '', '');
	        //g_changed = true;
	       // validate($$('crpp',0), '', '');
			g_changed = true;
				validate($$('finc',0), '', 'fict');
				g_changed = true;
				validate($$('finn',0), '', '');
				//g_changed = true;
				//validate($$('area',0), 'firc', '');
			}
			/*if (bAlertType=="2"){
				validate($$('opp_organarea',0), 'cfrc', '');
				g_changed = true;
				validate($$('crsp',0), '', '');
			}
			g_changed = true;
			validate($$('cfin',0), '', '1');
			g_changed = true;
			validate($$('cfic',0), '', 'cfct');
			g_changed = true;
			validate($$('tcnm',0), '', 'tcit');*/
			g_changed = true;
			validate($$('tcid',0), 'tcit', '');
			//g_changed = true;
			//validate($$('cfrc',0), 'cfrc', '');		
			//g_changed = true;
			//validate($$('tcac',0), 'tcat', '');		
			g_changed = false;
			
		 var agent_name=document.forms[0].tbnm.value;
			var agent_card_type=document.forms[0].tbit.value;
			var agent_card_no=document.forms[0].tbid.value;
			var agent_country=document.forms[0].tbnt.value;
	 
		   if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_card_no=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
 
				showValidateMsg($$('agent_table',0),'4','');	
			}else{
				showValidateMsg($$('agent_table',0),'2','��������Ϣ������һ��Ϊ��ʱ�����д�������Ϣ�ֶζ�Ӧ�գ�����һ��ǿ�ʱ�����ж�����ǿ�');
			}
			validateDetail2('all');
		}
		function validateAgent() {
������������ ��  var agent_name=document.forms[0].tbnm.value;
			var agent_card_type=document.forms[0].tbit.value;
			var agent_card_no=document.forms[0].tbid.value;
			var agent_country=document.forms[0].tbnt.value;
	 
			if (( (getLength(agent_name)==0||agent_name=='@I'||agent_name=='@N')&&getLength(agent_card_type)==0
				&& (getLength(agent_card_no)==0||agent_card_no=='@I'||agent_card_no=='@N')
				&& getLength(agent_country)==0)
			|| ( getLength(agent_name)>0&&agent_name!='@I'&&agent_name!='@N'&&getLength(agent_card_type)>0
				&& getLength(agent_card_no)>0&&agent_card_no!='@I'&&agent_card_no!='@N'&& getLength(agent_country)>0)){
		 
				showValidateMsg($$('agent_table',0),'4','');
				
			}else{
				showValidateMsg($$('agent_table',0),'2','��������Ϣ������һ��Ϊ��ʱ�����д�������Ϣ�ֶζ�Ӧ�գ�����һ��ǿ�ʱ�����ж�����ǿ�');
			}
		}
		
		function validateDetail2(type) {
		var valflag= '<bean:write name='report_type'/>';
		var alert_type='BS';
		if(valflag==1||valflag==3)alert_type='BH';	
		if(valflag==1){
	   if(type=='all'||type=='ctac'){
	      g_changed = true;
          if(valflag==3){
                validate1($$('ctac',0), '', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));    
          } else{		
			    validate1($$('ctac',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));    
		  }
		}
		
		if(type=='all'||type=='catp'){
           		g_changed = true;
           if(valflag==3){
               validate1($$('catp',0), 'pbc_catp', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
           }else{
			    validate1($$('catp',0), 'pbc_catp', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
		   }
		}
		}
		if(type=='all'||type=='cfin'){
		if(valflag==3){
		      g_changed = true;
              validate1($$('cfin',0), '', '1','',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
            }else{
		      g_changed = true;
			  validate1($$('cfin',0), '', '1',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
		    }
		 }
		if(type=='all'||type=='cfic'){
		    g_changed = true;
		    validate1($$('cfic',0), '', 'cfct',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
         if((type=='all'||type=='opp_organarea')&&valflag!=1){
		    g_changed = true;
		    validate1($$('opp_organarea',0), 'cfrc', '','BS',get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        if(type=='all'||type=='cfct'){
            g_changed = true;
			validate1($$('cfct',0), 'cfct_hash', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        if(type=='all'||type=='tcnm'){
            if(valflag==2||valflag==3){
			    g_changed = true;
			    if(valflag==3&&get_obj_value('opp_organarea')=='')
			       validate1($$('tcnm',0), '', 'tcit','BS',get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));
		        else
			    validate1($$('tcnm',0), '', 'tcit','BS',get_obj_value('tsdr'),get_obj_value('opp_organarea'),'',get_obj_value('settle_type_cd'));
		    } else{
			    g_changed = true;
			    validate1($$('tcnm',0), '', 'tcit',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));
		    }
		}
		if(type=='all'||type=='tcac'){
		   if(valflag==3){
		       g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),get_obj_value('opp_organarea'),get_obj_value('go'),get_obj_value('settle_type_cd'));
           }else if(valflag==1){
               g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));     
           }else if(valflag==2){
               g_changed = true;
			   validate1($$('tcac',0), 'tcat', '',alert_type,get_obj_value('tsdr'),get_obj_value('opp_organarea'),'',get_obj_value('settle_type_cd'));
           }
        }
        if(type=='all'||type=='ocurr'){
            if(valflag==3){
             g_changed = true;
              validate1($$('ocurr',0), 'trcd', '','BS',get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
            }else{
             g_changed = true;
			  validate1($$('ocurr',0), 'trcd', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
           }		
		}
		
		if((type=='all'||type=='go')&&valflag!=2){
            g_changed = true;
			validate1($$('go',0), 'tdrc', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));		
		}
		
	    if(type=='all'||type=='crsp'||type=='crpp'){
		 if((type=='all'||type=='crsp')&&alert_type=='BS'){
			  g_changed = true;
			  validate1($$('crsp',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));		    
         }else{
             g_changed = true;
			 validate1($$('crpp',0), '', '',alert_type,get_obj_value('tsdr'),'','',get_obj_value('settle_type_cd'));
         }
        }
        //Begin  2009-05-18 �޸�
      if(type=='all'||type=='tcid'){
           		g_changed = true;
           		validate1($$('tcid',0), 'tcit', '',alert_type,get_obj_value('tsdr'),'',get_obj_value('go'),get_obj_value('settle_type_cd'));     	    
		}
	��//end   2009-05-18 �޸�
	
      //add by qiuyun 2013-3-22 �Ե�������֤�������׷�ʽΪ20(����֧��)ʱ�����⽻�״�����дIP
      <%
      	  if("1".equals(isTestPoint))
      	  {
      %>
	       if(type=='all')
	       {	
	    	   des_disp2();
	       }
	  <%}%>
    	
        
	}

		function des_disp2(){

			var jsfs=document.forms[0].settle_type_cd.value;

			var isTestPoint='<%=isTestPoint%>';
			if (jsfs=='000120'&&isTestPoint=='1')
			{
				document.getElementById('tsct_disp').style.display='none';		
				document.getElementById('tsct_key').readOnly=false;
				
				testRegx($$('tsct_key',0));
			}else
			{
				
				document.getElementById('tsct_disp').style.display='';		
				document.getElementById('tsct_key').readOnly=true;
				change();				
				validate($$('tsct_key',0), 'tsct', '');
			}
			
		
		}

	
		</script>
		<script language="javascript"><!--
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
function _Confim(url, type){
	    var  bAlertType = '<bean:write name='report_type'/>';
			var errMsg ="";
		if ((document.forms[0].tbit.value=='19')&&(getLength(document.forms[0].tbit_inf.value)>30||getLength(document.forms[0].tbit_inf.value)<=0)) {
        errMsg = "������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�";
    }
	if ((document.forms[0].tcit.value=='19' || document.forms[0].tcit.value=='29')&&(getLength(document.forms[0].tcit_inf.value)>30||getLength(document.forms[0].tcit_inf.value)<=0)) {
        errMsg = "������֤������ϸ��Ϣ��������30���ַ�֮�ڣ�";
    }		
   //ҵ���ʶ��
    if (getLength(document.forms[0].ticd.value)==0) {
        errMsg = "ҵ���ʶ�벻��Ϊ�գ�";
    } //�ʽ��ո���ʶ
    else if (getLength(document.forms[0].tsdr.value)==0) {
        errMsg = "�ʽ��ո���ʶ����Ϊ�գ�";
    } //����
    else if (getLength(document.forms[0].crtp.value)==0) {
        errMsg = "���ֲ���Ϊ�գ�";
       
    }
    // else if (getLength(document.forms[0].tx_occur.value)==0) {
  //      errMsg = "���׷����ز���Ϊ�գ�";
       
  //  }
  
     //�Է����ڻ�����������
    else if (getLength(document.forms[0].cfin.value)>256) {
        errMsg = "�Է����ڻ����������Ʋ��ܶ���256���ַ���";
    }
    
     //���״���������
    else if (getLength(document.forms[0].tbnm.value)>10) {
        errMsg = "���״������������ܶ���10���ַ���";
    }
     //���״��������֤������
    else if (getLength(document.forms[0].tbid.value)>20) {
        errMsg = "���״��������֤�����벻�ܶ���20���ַ���";
    }
      //�Է����ڻ����������
    else if (getLength(document.forms[0].cfic.value)>24) {
        errMsg = "�Է����ڻ���������벻�ܶ���24���ַ���";
    }
     //���׶�������
    else if (getLength(document.forms[0].tcnm.value)>256) {
        errMsg = "���׶����������ܶ���256���ַ���";
    }
    //���׶���֤������
    else if (getLength(document.forms[0].tcid.value)>24) {
        errMsg = "���׶���֤�����벻�ܶ���24���ַ���";
    }
    //���׶����˺�
    else if (getLength(document.forms[0].tcac.value)>64) {
        errMsg = "���׶����˺Ų��ܶ���64���ַ���";
    }
    if (bAlertType=='1'){
    //�˺�
 /* if (getLength(document.forms[0].ctac.value)>24) {
        errMsg = "�˺Ų��ܶ���24���ַ���";
        }
        //�ʽ���Դ����;
    else if (getLength(document.forms[0].crpp.value)>128) {
        errMsg = "�ʽ���Դ����;���ܶ���128���ַ���";
      
    }*/
     //�˺ű�ʶ��
    if (getLength(document.forms[0].ctac.value)==0&&document.forms[0].rltp.value=="01") {
        errMsg = "���ڻ�������׵Ĺ�ϵΪ'�յ���'ʱ,�˺Ų���Ϊ�գ�";
         
    }
    
      //���׷���
  // else if (getLength(document.forms[0].tx_go.value)==0) {
  //     errMsg = "���׷�����Ϊ�գ�";
        
   // }
      //���ڻ�������׵Ĺ�ϵ
    else  if (getLength(document.forms[0].rltp.value)==0) {
        errMsg = "���ڻ�������׵Ĺ�ϵ����Ϊ�գ�";
      
    }
     if (document.forms[0].go.value=="XXX000000" && getLength(document.forms[0].cfin.value)==0) {
        errMsg = "�����׷���Ϊ�����ʽ�ľ������Ϊת����ʱ���Է����ڻ����������Ʋ���Ϊ��Ӧ��дת�������ƣ�";
      
    }
    }
 /*if (bAlertType=='2'){
    //����ʱ�䲻��С�ڿ���ʱ��
    /* if (getLength(document.forms[0].close_dt_disp.value)!=0&&document.forms[0].open_dt_disp.value>document.forms[0].close_dt_disp.value) {
        errMsg = "����ʱ�䲻��С�ڿ���ʱ�䣡";
      
    }
 }*/
    /*if (document.forms[0].settle_type_cd.value.substr(2,2)=="00" && getLength(document.forms[0].ocurr.value)==0){
       errMsg = "�����׷�ʽΪ�ֳ�����ʱ���׷����ز���Ϊ�գ�";
  }
//�ʽ���Դ����;
    else if (getLength(document.forms[0].crsp.value)>128) {
        errMsg = "�ʽ���Դ����;���ܶ���128���ַ���";
      
    }
    }*/
  /* if (document.forms[0].cny_amt.value==document.forms[0].acct_num.value){
     errMsg = "���׽��ܵ����˺ţ�";
    }else if (document.forms[0].cny_amt.value==document.forms[0].opp_acct_num.value){
     errMsg = "���׽��ܵ��ڽ��׶����˺ţ�";
    }else if (document.forms[0].cny_amt.value==document.forms[0].agent_card_no.value){
     errMsg = "���׽��ܵ��ڴ��������֤�����룡";
    }else if (document.forms[0].cny_amt.value==document.forms[0].opp_card_no.value){
     errMsg = "���׽��ܵ��ڽ��׶������֤�����룡";
    }else if (document.forms[0].cny_amt.value==document.forms[0].card_no.value){
     errMsg = "���׽��ܵ��ڿͻ����֤�����룡";
    }else if (bAlertType=='2'&& document.forms[0].cny_amt.value==document.forms[0].lgent_card_no.value){
     errMsg = "���׽��ܵ��ڷ������������֤�����룡";
    }*/
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } 
				if( !checkAllValidate()) {
				//alert("����δУ�������ݣ�����ʧ�ܣ�");
				return ;
			}
		   document.forms[0].action=url;
		   document.forms[0].submit();
		   
		}
		
		--></script>
		<style type="text/css">
			.STYLE2 {color: #ff0000}
		</style>
		<script language="javascript">
			var c= new Array();
			c.push(0);c.push(0);c.push(0);c.push(0);
			function expand(idx, id) {
				/*c[idx]++; 
				var disp='none'; 
				if(c[idx]==1) 
					disp='none'; 
				else {
					disp=''; 
					c[idx]=0;
				} 
				document.getElementById(id).style.display=disp;*/
			}
			
function  _back(url){
           document.forms[0].action=url;
		   document.forms[0].submit();
}
		</script>
	</head>
	<body leftmargin="0" topmargin="0" class="mainbg"
		onload="card_inf_exp('1','');validateDetail();"> 
		<html:form action="/validate/getValidateTransDisp" method="post">	
		<input type="hidden" name="reportkey" value="<bean:write name="reportkey"/>"/>
			<input type="hidden" name="ticd" value="<bean:write name="ticd"/>"/>
			<input type="hidden" name="rpdi_seqno" value="<bean:write name="rpdi_seqno"/>"/>	
			<input type="hidden" name="ctif_seqno" value="<bean:write name="ctif_seqno"/>"/>
			<input type="hidden" name="crcd" value="<bean:write name="crcd"/>"/>
			<input type="hidden" name="trans_type" value="<bean:write name="trans_type"/>"></input>
        	<input type="hidden" name="saveString" value="<bean:write name="saveString"/>"></input> 		
	 <div id="main">
			<!-- conditions --> 
               <div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>������Ϣ��¼</span>
						<span class="buttons">
						 	<input type="checkbox" name="toSource" checked="true"  value="1"/>�����ԭ����&nbsp;&nbsp;&nbsp;
						 <logic:present name="fromcase">
						 <logic:notEqual name="fromcase" value="1">
							 �޸���һ��: <html:select
								property="trans_seq" style="width:350px" 
								onchange="_back('getValidateTransDisp.do')">
								<html:options collection="transMap" property="label"
									labelProperty="value" />
							</html:select> &nbsp; 
							</logic:notEqual>
							</logic:present>
							<a href="#" onclick="_Confim('<%=request.getContextPath()%>/pbcreport/validate/modifyTransDo.do')">
							    <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
						    <a href="#"
							    onclick="_back('<%=request.getAttribute("validbackurl")%>')">
							    <img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
							    <input type="hidden" name="validbackurl"
								value="<%=request.getAttribute("validbackurl")%>" />
								 <input type="hidden" name="fromcase"
								value="<%=request.getAttribute("fromcase")%>" />
							    
					     </span>
					</div>
					
			<logic:equal value="1" name="report_type">
   
						<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
	             <tr><th colspan="4"><strong>������Ϣ</strong></th></tr>
									<tr>
										<td><!--FICT-->
											
											 ����������ͣ�
										</td>
										<td>
											<html:text property="fict"  readonly="true"/>
											<img src="../../images/lock.jpg" height='20' />		
											<font color=#CC0000><strong><%if(errorMap!=null&&errorMap.containsKey("FICT")) out.print("["+errorMap.get("FICT")+"]");%>
											</strong>
											</font>											
										</td>
										<td><!--FINC-->
											
											 ������룺
										</td>
										<td>
											 <html:text property="finc" onchange="change();"
												onblur="validate(this, '', 'fict');"/>
											
										<font color=#CC0000><strong><%if(errorMap!=null&&errorMap.containsKey("FINC")) out.print("["+errorMap.get("FINC")+"]");%>
											</strong>
											</font>			 
										</td>
									</tr>
									<tr>
										<td><!--FINN-->
											

											 ���ڻ����������ƣ�
										</td>
										<td>
											  <html:text property="finn" onchange="change();" onblur="validate(this, '', '');" />
											 <font color="#CC0000"><strong>
											  <%if(errorMap!=null&&errorMap.containsKey("FINN")) out.print("["+errorMap.get("FINN")+"]");%>
											</strong>
											</font>
										</td>
										<td><!--RLTP-->
											
											 ��������׹�ϵ��
										</td>
										<td >
											<html:select property="rltp">
												<html:options collection="rltpMap" property="key" labelProperty="value" />
											</html:select><font color="#FF0000"> *</font>
											  <font color=#CC0000><strong>
											   <%if(errorMap!=null&&errorMap.containsKey("RLTP")) out.print("["+errorMap.get("RLTP")+"]");%>
											</strong>
											</font>
										</td>
										
									</tr>
									<tr>
										<td><!--FIRC-->
											
											 ���������������룺
										</td>
										<td colspan="3">
										
											<html:text property="firc_disp" readonly="true" />
											<html:text property="firc"  readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	
											<font color=#CC0000><strong>
											<%if(errorMap!=null&&errorMap.containsKey("FIRC")) out.print("["+errorMap.get("FIRC")+"]");%>
											</strong>
											</font>
											</td>
									</tr>
 </table>
					</div>
			</logic:equal>
			
 

					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0" align="center" id="agent_table">
						<tr><th colspan="4"><strong>��������Ϣ</strong></th></tr>
								<tr>
									<td>
										<!--TBNM-->������������ </td>
									<td>
										<html:text property="tbnm" onchange="change();"
											onblur="validate(this, '', 'tbit');validateAgent();" />
										<img style="display:none" width="20" height="20" />
											 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBNM")||errorMap.containsKey("BKNM"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBNM"))+StringUtils.nullToStr((String)errorMap.get("BKNM"))+"]");%>
									  </strong>
									  </font>
									</td>
									<td><!--TBNT-->
										
										 �����˹�����
									</td>
									<td>
										<html:select property="tbnt"
											onchange="validateAgent();">
											<html:options collection="nationalityMap" property="label"
												labelProperty="value" />
										</html:select>
										<img style="display:none" width="20" height="20" />
										  <font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBNT")||errorMap.containsKey("BKNT"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBNT"))+StringUtils.nullToStr((String)errorMap.get("BKNT"))+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>
								
								<tr>
									<td><!--TBIT-->
										
										 ���������֤�����ͣ�
									</td>
									<td colspan="3">
										<html:select property="tbit" style="width:250px"  onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" 
											onchange="card_inf_exp('tbit','tbit_inf');change();validate($$('tbid',0), 'tbit', '');change();validate($$('tbnm',0), '', 'tbit');validateAgent();">
											<html:options collection="agent_card_typeMap" property="label"
												labelProperty="value" />
										</html:select>
										<html:text  property="tbit_inf" size="30" maxlength="30"  onblur="validate_type('tbit_inf');validateAgent();"/> 
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBIT")||errorMap.containsKey("BITP"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBIT"))+StringUtils.nullToStr((String)errorMap.get("BITP"))+"]");%>
									 </strong>
									  </font>
									</td>
								 </tr>
									<tr>
									<td><!--TBID-->
										
										 ���������֤�����룺
									</td>
									
									<td colspan="3">
										<html:text property="tbid" onchange="change();"
											onblur="validate(this, 'tbit', '');validateAgent();" />
											
										<img style="display:none" width="20" height="20" />
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("TBID")||errorMap.containsKey("BKID"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("TBID"))+StringUtils.nullToStr((String)errorMap.get("BKID"))+"]");%>
									  </strong>
									  </font>
									</td>
								</tr>
						
			</table>
					</div>
			 

					<div class="cond_c2">
						 <table width="100%" border="0" cellpadding="1" cellspacing="1">
					 <tr><th colspan="4"><strong>������Ϣ</strong></th></tr>
							<logic:equal value="1" name="report_type">
								<tr>
									<td><!--CATP-->
										 �ʻ����ͣ�
									</td>
									<td>										
										<html:select style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))" property="catp" onchange="change();" onblur="validateDetail2('catp');">
											<html:options collection="catpMap" property="key" labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CATP")) out.print("["+errorMap.get("CATP")+"]");%>
									 </strong>
									  </font>
									</td>
									<td><!--CTAC-->
										 �˺ţ�
									</td>
									<td>
								    <html:text property="ctac" onchange="change();" onblur="validateDetail2('ctac');" alt="�˺�" />
									  <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CTAC")) out.print("["+errorMap.get("CTAC")+"]");%>
									 </strong>
									  </font>
									</td>
								</tr>	
								  </logic:equal>
								 <tr>
							     <td><!--TSTM-->
										 ����ʱ�䣺
									</td>
									<td>

										<html:text property="tstm_disp" readonly="true" />
									  <img src="../../images/lock.jpg" height='20' />
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSTM")) out.print("["+errorMap.get("TSTM")+"]");%>
									  </strong>
									  </font>
									</td>
									
									<td><!--CRTP-->
										 ���֣�
									</td>
									<td>
										<%--<html:select property="crtp" disabled="true">
											<html:options collection="crtpMap" property="key"
												labelProperty="value" />
										</html:select>
											<img src="../../images/lock.jpg" height='20'>--%>
										<html:text property="crtp_disp" readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	<html:hidden property="crtp" />	
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRTP")) out.print("["+errorMap.get("CRTP")+"]");%>
									  </strong>
									  </font>
									</td>
								</tr>
								
								<tr>
								<td><!--CRAT-->
										 ���׽�
									</td>
									<td>
										<html:text property="crat_disp" onchange="change();" onblur="validate(this, '', '');" readonly="true" />
											<img src="../../images/lock.jpg" height='20' />	<html:hidden property="crat" />
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRAT")) out.print("["+errorMap.get("CRAT")+"]");%>
									  </strong>
									  </font>
									</td>
			<td><!--TSDR-->
										

										 �ʽ��ո���ʶ��
									</td>
									<td>
										<html:select property="tsdr" onchange="change();" onblur="validateDetail2('all');">
											<html:options collection="tsdrMap" property="key" labelProperty="value" />
										</html:select><font color="#FF0000"> *</font>
	                                 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSDR")) out.print("["+errorMap.get("TSDR")+"]");%>
									 </strong>
									  </font>
									</td>	
								</tr>
								 <tr>
									<td><!--TSTP-->
										 ���׷�ʽ��
									</td>
									<td colspan="3"><!--<html:select property="tstp">
											<html:options collection="tstpMap" property="key"
												labelProperty="value" />
										</html:select>-->
									    <html:text property="tstp_disp" readonly="true"  size="30"  alt="���׷�ʽ" onclick="window.open('../../common/editTransWay.jsp?inname=settle_type_cd&inname_disp=tstp_disp','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');" />   
										<html:text property="settle_type_cd"  readonly="true"onchange="change();" onblur="validate(this, 'tstp', '');validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSTP")) out.print("["+errorMap.get("TSTP")+"]");%>
									 </strong>
									  </font>
									</td>
									</tr>
											
								<tr>
								<tr>
									
									
									<td><!--TSCT-->
										 ���⽻�׷�����룺
									</td>
									<td colspan="3"><!-- select tsctMap key value-->
									 <html:text styleId="tsct_disp" property="tsct_disp" readonly="true" size="30"  onclick="window.open('../../common/editTsct.jsp?inname=tsct_key&inname_disp=tsct_disp','enter1','height=20, width=650,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<html:text styleId="tsct_key" property="tsct_key"  readonly="true" onchange="" onblur="des_disp2();"/>
									 
									 <font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TSCT")) out.print("["+errorMap.get("TSCT")+"]");%>
									  </strong>
									  </font>
									
									   
									</td>
								</tr>	
								<tr>
									<td><!--TRCD-->
										 ���׷����أ�
									</td>
									<td colspan="3">
										<html:text property="trcd_disp" size="30"  readonly="true"onclick="window.open('../../common/editCountryArea.jsp?inname=ocurr&inname_disp=trcd_disp&type=0','enter1','height=20, width=850,left=100,top=100,scrollbars=yes,resizable=yes');" alt="���׷�����"/>
										<html:text property="ocurr" readonly="true"onchange="change();" onblur="validateDetail2('ocurr');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TRCD")) out.print("["+errorMap.get("TRCD")+"]");%>
									  </strong></font>
									</td>
								</tr>
								<logic:equal value="1" name="report_type">
									<tr>
										<!-- ��� -->
										<td><!--TDRC-->
											
											 ���׷���
										</td>
										<td colspan="3"><!--  onclick="showCountryAreaInput(this)" --><!-- <img src="../../images/lock.jpg" height='20'> --><!-- onchange="change();" onblur="validate(this, '', '');"  -->
										    <html:text property="tdrc_disp" size="30" readonly="true" onclick="window.open('../../common/editCountryArea.jsp?inname=go&inname_disp=tdrc_disp&type=1','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');" alt="���׷���"/>
										<html:text property="go" readonly="true"onchange="change();" onblur="validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TDRC")) out.print("["+errorMap.get("TDRC")+"]");%>
									  </strong></font>
									</td>
									</tr>
									<tr>
									<!-- ��� -->
										<td><!--CRPP-->
											 �ʽ���;��
										</td>
										<td colspan="3">
											<html:text property="crpp"  size="30" maxlength="64"  onchange="change();"
												onblur="validateDetail2('crpp');" />
												<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRPP")) out.print("["+errorMap.get("CRPP")+"]");%>
									  </strong></font>
                                        </td>
								</tr>
								</logic:equal>
								<logic:equal value="2" name="report_type">
									<!-- ���� -->
									<!-- ���׶�����Ϣ  -->
									<tr>
										<!-- ���� -->
										<td><!--CRSP-->
											 �ʽ���Դ����;��
										</td>
										<td>
											<html:text property="crsp"  size="40" maxlength="64" onchange="change();"
												onblur="validateDetail2('crsp');" />
												<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CRSP")) out.print("["+errorMap.get("CRSP")+"]");%>
									  </strong></font>
                                        </td>
									</tr>

								</logic:equal>
							 <tr><th colspan="4"><strong>������Ϣ</strong></th></tr>

				 
								<logic:equal value="2" name="report_type">
								<tr>
									<td>
										<!--CFRC-->
										�Է����ڻ������������������룺
									</td>
									<td colspan="3">
										<html:text property="cfrc_disp" size="40"  readonly="true" onclick="window.open('../../common/editCountryArea.jsp?inname=opp_organarea&inname_disp=cfrc_disp','enter1','height=20, width=800,left=100,top=100,scrollbars=yes,resizable=yes');"/>
										<!--select oppPbcAreaMap key  value-->
										<html:text property="opp_organarea" readonly="true" onchange="change();" onblur="validateDetail2('all');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFRC")) out.print("["+errorMap.get("CFRC")+"]");%>
									 </strong> </font>
									</td>
								</tr>
								</logic:equal>
								<tr>
									<td>
										<!--CFIN-->
										�Է����ڻ����������ƣ�
									</td>
									<td colspan="3">
										<html:text property="cfin" size="40" onchange="change();"onblur="validateDetail2('cfin');" />
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFIN")) out.print("["+errorMap.get("CFIN")+"]");%>
									 </strong> </font>
									</td>
								 </tr>
								<tr>
									<td>
										<!--CFCT-->
										�Է����ڻ����������ͣ�
									</td>
									<td colspan="3">
										<html:select property="cfct"  onchange="change();validateDetail2('cfct');validateDetail2('cfic');">
										<html:option value="@I" >--��ѡ��--</html:option>
											<html:options collection="opp_organ_typeMap" property="key"
												labelProperty="value" />
										</html:select>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("CFCT")) out.print("["+errorMap.get("CFCT")+"]");%>
									 </strong> </font>
									</td>
								</tr>
								<tr>
									<td>
										<!--CFIC-->
										�Է����ڻ���������룺
									</td>
									<td colspan="3">
										<html:text property="cfic" size="40" onchange="change();"
											onblur="validateDetail2('cfic');" />
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&(errorMap.containsKey("CFIC")||errorMap.containsKey("CFNC"))) out.print("["+StringUtils.nullToStr((String)errorMap.get("CFIC"))+StringUtils.nullToStr((String)errorMap.get("CFNC"))+"]");%>
									 </strong> </font>
                                    </td>
							
								</tr>
								 <tr>
								 		<td>
										<!--TCNM-->
										���׶���������
									</td>
									<td colspan="3">
										<script language="javascript">
												var class_cd = '<bean:write name='class_cd'></bean:write>';
												
											</script>
										<html:text property="tcnm" size="40" onchange="change();"
											onblur="validateDetail2('tcnm');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCNM")) out.print("["+errorMap.get("TCNM")+"]");%>
									  </strong></font>
									</td>
									</tr>
								<tr>
									<td>
										<!--TCID-->
										���׶���֤�����룺
									</td>
									<td colspan="3">
										<html:text property="tcid" size="40" onchange="change();"  
											onblur="validate(this, 'tcit', '');validateDetail2('tcid');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCID")) out.print("["+errorMap.get("TCID")+"]");%>
									  </strong></font>
									</td>
								</tr>
								<tr>
									<td>
										<!--TCIT-->
										���׶���֤�����ͣ�
									</td>
									<td colspan="3">
									
										<html:select property="tcit" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="card_inf_exp('tcit','tcit_inf');change();validateDetail2('tcnm');change();validateDetail2('tcid');">
											<html:option value="@I" >--��ѡ��--</html:option>
											<html:options collection="opp_card_typeMap" property="key"
												labelProperty="value" />
										</html:select>
										 <html:text  property="tcit_inf" size="30" maxlength="30" onblur="validate_type('tcit_inf');"/>
									<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCIT")) out.print("["+errorMap.get("TCIT")+"]");%>
									</strong>  </font>
									</td>
								 </tr>
								
								
								<tr>
									<td>
										<!--TCAT-->
										���׶����˺����ͣ�
									</td>
									<td colspan="3">
										
										<html:select property="tcat" style="width:250px" onmouseover="selMouseOver(this,$('div_hint'))"
										onmouseout="selMouseOut(this,$('div_hint'))"
											onchange="change();validate($$('tcac',0), 'tcat', '');">
											<html:option value="@I" >--��ѡ��--</html:option>
											<html:options collection="opp_acct_type_cdMap" property="key"
												labelProperty="value" />
										</html:select>
										<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCAT")) out.print("["+errorMap.get("TCAT")+"]");%>
									  </strong></font>
									</td>
								 </tr>
								<tr>
									<td>
										<!--TCAC-->
										���׶����˺ţ�
									</td>
									<td colspan="3">
										<html:text property="tcac" size="40" onchange="change();"
											onblur="validateDetail2('tcac');" />
											<font color=#CC0000><strong>
									  <%if(errorMap!=null&&errorMap.containsKey("TCAC")) out.print("["+errorMap.get("TCAC")+"]");%>
									 </strong> </font>
                                     </td>
								</tr>
					</table>
					</div>
					</div>
					
		</html:form>
	</BODY>
	<!--��ʾ��-->
	<div id=div_hint style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
	
</html>
