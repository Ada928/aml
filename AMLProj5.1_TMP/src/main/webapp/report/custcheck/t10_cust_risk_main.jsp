<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script type="text/javascript"> 
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
function _OpenVale(url){
    window.open(url,'','height=450, width=820,left=100,top=100,scrollbars=yes,resizable=yes');
   //window.open(url);
      
}
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].open_dt_start_disp.value;
		_Date2 = document.forms[0].open_dt_end_disp.value;  
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "����д��������ʼʱ�䷶Χ��";
			else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
			else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
			else if(!_compareTwoDateForString(_Date1, _Date2) )
				errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";		  		
  		isSub = true;
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
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
</SCRIPT>
</HEAD>
<body class="mainbg">
<div id="main"> 
<html:form action="/custcheck/t10_survey_cust_risk.do" method="post">
<input type="hidden" name="flag" value="<bean:write name="flag"/>"/>
<div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�ͻ�ʶ��</span>
		<span class="buttons">	
		<a href="#" onclick="checkForm('<%=request.getContextPath() %>/report/custcheck/t10_cust_risk_main.do?newsearchflag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />���յ���</a>
	   
	   <a href="#" onclick="checkForm('<%=request.getContextPath() %>/report/custcheck/t10_cust_trans_analysis.do?newsearchflag=1&analy_type_flag=0&analy_from=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>')"><img src="../../images/<%=session.getAttribute("style") %>/b_analysis.png" />���׷���</a>   
     <logic:equal  name="flag" value="1">
	  <a href="#" onclick="checkForm('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_kelist.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a> 
	  </logic:equal>
	   <logic:equal  name="flag" value="2">
	  <a href="#" onclick="checkForm('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_cardlist.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a> 
	  </logic:equal>
	  </span>
	</div>
	    <!--�ͻ��ϱ�һ�Ű�ť-->
	<div class="cond_t2">
		 <span class="buttons" id="iframemenu">
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_custinfo.png" />�ͻ���Ϣ</a>
		   <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_acctlist.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_riskaccout.png" />�˻���Ϣ</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/t10_check_cust_caselist.do?newsearchflag=1&id_flag=1&party_id=<bean:write name="party_id"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_caseinfo.png" />������Ϣ</a>
     	  <a href="<%=request.getContextPath() %>/report/custcheck/modifyT10_colu.do?newsearchflag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_custbusiness.png" />�ͻ�����</a>
		  <a href="<%=request.getContextPath() %>/report/custcheck/modifyT10_check_info_result.do?newsearchflag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>&flag=<bean:write name="flag"/>" target="iframe_cus"><img src="../../images/<%=session.getAttribute("style") %>/b_result.png" />�������</a>  
		 
     	 </span>
	</div>
	  <!--�ͻ��ϱ�ť��Ӧ����iframe -->
       <iframe frameborder="0" width="100%" src="<%=request.getContextPath() %>/report/custcheck/t10_survey_cust_risk.do?newsearchflag=1&party_id=<bean:write name="party_id"/>&party_class_cd=<bean:write name="party_class_cd"/>" scrolling="yes" id="iframe_cus" name="iframe_cus">
       </div>
</html:form> 
</div>
</BODY>
</HTML>
