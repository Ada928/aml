<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%String analy_from = (String)request.getAttribute("analy_from"); %>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript" src="../../js/calendar.js"></script>
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
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
	_Date1 = document.forms[0].start_dt_display.value;
    _Date2 = document.forms[0].end_dt_display.value;  
    if(_Date1 == '' && _Date2 == ''){
        errMsg += "����ʱ�䲻��Ϊ�գ�";
    }    
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";  
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
</script>
</head>
<body class="mainbg"  id="iframecontent">
<html:form action="/custcheck/t10_cust_capital_chain.do" method="post">
<input type="hidden" name="analy_from" value="<bean:write name="analy_from"/>"/>
<input type="hidden" name="party_id" value="<bean:write name="party_id"/>"/>

<div class="conditions">
    <div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
   		<tr> 
        	<td><font color="red">*</font>�������ڣ�</td>
            <td>
            <html:text property="start_dt_display" onclick="calendar.show(this);" readonly="true" styleClass="calimg" /> --
            <html:text property="end_dt_display" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
		    </td>
		    <td>
				�˺ţ�
			</td>
			<td>
				<html:text property="acct_num" styleClass="text_white" size="24" require="false" maxlength="64"/>
			</td>
            
        </tr>
        <tr>
			<td>
				��Ŀ�ţ�
			</td>
			<td>
				<html:text property="subjectno" styleClass="text_white" size="24" require="false" maxlength="7"/>
			</td>
			<td>
				�Է��˺ţ�
			</td>
			<td>
				<html:text property="opp_acct_num" styleClass="text_white" size="24" require="false" maxlength="64"/>
			</td>
        </tr>
        <tr>
			<td>
				�Է������ţ�
			</td>
			<td>
				<html:text property="opp_organkey" styleClass="text_white" size="24" require="false" maxlength="60"/>
			</td>
			<td>����</td>
	           <td>
	            <html:select property="order_type">
					<html:options collection="order_type_map" property="label" labelProperty="value" />
	   			</html:select>
	   			<html:radio property="fashion" value="asc" >����</html:radio>
	   			<html:radio property="fashion" value="desc">����</html:radio>
	   			<input type="button" name=Button3  class="in_button1" value="�� ѯ" styleClass="input"   onClick="dosubmit('t10_cust_capital_chain.do?newsearchflag=1','search')" >
	           </td>
	           
        </tr>
    </table>
    </div>
    </div>
    <html:errors />
    <%
    	int in_trans=((Integer)request.getAttribute("in_trans")).intValue();
       	String in_amt_str = ((String)request.getAttribute("in_amt_str"));
    	int in_row = ((ArrayList)request.getAttribute("t10_in_result")).size();
    	
    	String root = request.getContextPath() + "/report/custcheck/t10_cust_capital_chain_out.do?newsearchflag=1&analy_from="+request.getAttribute("analy_from")+"&party_id="+request.getAttribute("party_id");
    %>
    <div class="cond_t2">
		   <span class="buttons">
		     <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />�ʽ�����</strong>
		     	�����ܱ�����<%=in_trans %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	  	 	 			�����ܽ�<%=in_amt_str %>�����
		   </span>
 	</div>
    <div class="list">
    <table>
    <tr>
      <th>�ʽ�ת��ͻ���</th>
	  <th>�ʽ�ת��ͻ�����</th>
	  <th>�ʽ�ת�뽻����</th>
	  <th>�ʽ�ת����ڻ������ڵ�</th>
	  <th>��������</th>
	  <th>���׽��</th>
	  <th>����</th>
	  <th>���׷�ʽ</th>
	  <th>�Է��ͻ���</th>
	   <th>�Է��ͻ�����</th>
    </tr>
    <logic:iterate id="in_result" name="t10_in_result" indexId="i" type="com.ist.aml.report.dto.T10_capital_chain">
    <tr>
       <td><bean:write name="in_result" property="party_id" scope="page"/></td>
       <td><bean:write name="in_result" property="party_chn_name" scope="page"/></td>
       <td><bean:write name="in_result" property="organName" scope="page"/></td>
       <td><bean:write name="in_result" property="tx_occur_area" scope="page"/></td>
       <td><bean:write name="in_result" property="tx_dt_display" scope="page"/></td>
       <td><bean:write name="in_result" property="amt" scope="page"/></td>
       <td><bean:write name="in_result" property="currency_cd" scope="page"/></td>
       <td><bean:write name="in_result" property="tx_type" scope="page"/></td>
        <td><bean:write name="in_result" property="opp_party_id" scope="page"/></td>
         <td><bean:write name="in_result" property="opp_name" scope="page"/></td>
    </tr>
	</logic:iterate>
    </table>
    </div>
    <div class="list_page">
			<bean:write name="pageInfo" scope="request" filter="false" />
	</div>
	
	<iframe id="out" src="<%=root%>" scrolling="auto" height="500" width="100%" name="out" frameborder="0"></iframe>
	
	
	
</html:form>
</body>
</html>
