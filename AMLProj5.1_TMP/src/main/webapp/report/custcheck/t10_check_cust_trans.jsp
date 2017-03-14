<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

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

<script type="text/javascript">
function checkForm(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function dosubmit(theUrl,type){
	var errMsg = "";
  var isSub = false;
  if(type=='search'){
		_Date1 = document.forms[0].tx_dt_start_disp.value;
		_Date2 = document.forms[0].tx_dt_end_disp.value;  
		if(_Date1 == '' && _Date2 == ''){
	        errMsg += "��ʼʱ�䲻��Ϊ�գ�";
	    }
		if(!_isDateSpaceComplete(_Date1, _Date2))
			errMsg += "����д��������ʼʱ�䷶Χ��";
		else if(_Date1!="" && !formatDateAlert(_Date1))
				return false;       
		else if(_Date2!="" && !formatDateAlert(_Date2))
				return false;	      
		else if(!_compareTwoDateForString(_Date1, _Date2) )
				errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
		else if(document.forms[0].amt_end_search.value !="" )
		{
			if(parseFloat(document.forms[0].amt_end_search.value) < parseFloat(document.forms[0].amt_start_search.value)){
				document.forms[0].amt_end_search.focus();
				errMsg += "��ֹ���׽��ܴ�������׽��";
		     }
		}
		else if (!checkFloat(document.forms[0].amt_start_search.value))
		{
			errMsg += "���׽��ֻ�������֣�";
			document.forms[0].amt_start_search.focus();
		}
		else if(!checkFloat(document.forms[0].amt_end_search.value))
		{
			errMsg += "���׽��ֻ�������֣�";
			document.forms[0].amt_end_search.focus();
		}
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


</script>
</head>
<body id="iframecontent">
<html:form action="/custcheck/t10_check_cust_translist.do" method="post">
<input type="hidden" name="party_id" value="<bean:write name="party_id"/>"/>
<div class="conditions">
	<div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
			<tr>
          		<td>��ʼʱ�䣺</td>
          		<td>
          		  <html:text property="tx_dt_start_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
            
     
	
					
					��
					<html:text property="tx_dt_end_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg"  size="12"/>
            
     
					
				</td>          		
            	<td>�����˻���</td>
          		<td>
          			<html:text property="acct_num" styleClass="text_white" />
          		</td>
			</tr>
        	<tr>
          		<td>���׽�</td>
          		<td>
					<html:text property="amt_start_search" styleClass="text_white"
						size="12" maxlength="10" />
					��
					<html:text property="amt_end_search" styleClass="text_white"
						size="12" maxlength="10" />
					(�������)
				</td>
          		<td>���׻�����</td>
          		<td>
					<html:text property="organkey" styleClass="text_white"
						size="10" onblur="_Onblur('organName')" />

					<html:text property="organName" styleClass="text_white"
						size="23" readonly="true" maxlength="10" />
						<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organName','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
					 </td>
        	</tr>
        	<tr>
          		<td>��ת��ǣ�</td>
          		<td>
					<html:select property="cash_trans_flag">
						<html:options collection="goflagMap" property="label" labelProperty="value" />
					</html:select>
			  	</td>
			  	<td>�����־��</td>
          		<td>
					<html:select property="debit_credit">
						<html:options collection="trackflagMap" property="label" labelProperty="value" />
					</html:select>
			  	</td>
			  </tr>
			  	
			 <tr>
          		<td>����������</td>
          		<td>
					<html:select property="channel">
						<html:options collection="channelMap" property="label" labelProperty="value" />
					</html:select>
			  	</td>
			  	<td>���㷽ʽ��</td>
          		<td>
					<html:select property="settle_type_cd">
						<html:options collection="jsMap" property="label" labelProperty="value" />
					</html:select>
			  	</td>
			  	
          		<!-- <td>�ͻ���</td>
          		<td>
					<html:text property="party_id" styleClass="text_white"
						size="10" onblur="_Onblur('party_chn_name')" />
					<html:text property="party_chn_name" styleClass="text_white"
						size="23" readonly="true" />
						<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t47_party_list.do?newsearchflag=1&input_name=party_id&input_name_disp=party_chn_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
					 	</td>
					 	 -->
        	</tr>
        	<tr>
          		<td> </td>
          		<td>
				 
			  	</td>
          		<td>����</td>
          		<td>
          			<html:select property="orderby">
				   		<html:options collection="ordernameMap" property="label" labelProperty="value" />
				    </html:select>
				   <html:radio property="order" value="1" />����
  				   <html:radio property="order" value="2" />����
				   <input name="" type="button" value="�顡ѯ"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/custcheck/t10_check_cust_translist.do?newsearchflag=1','search')"/>
				 </td>
       		</tr>
      	</table>
    </div>
    </div>
    <html:errors />
    <div class="list">
    <table  border="0"   cellpadding="0" cellspacing="0"  >
     <tr>
      <th>��ˮ��</th>
	  <th>�ͻ���</th>
	  <th>�ͻ�����</th>
	  <th>��������</th>
	  <th>���׻���</th>
	  <th>�˻�</th>
	  <th>����</th>
      <th>���׽��</th>
	  <th>�����־</th>
	  <th>��������</th>
	  <th>��������</th>
	  <th>���㷽ʽ</th>
	  <th>�Է�����</th>
	  <th>�Է��˺�</th>
	  <th>�Է����׻���</th>
	  <th>��;</th>
	  <th>��Ŀ��</th>
	 </tr>
    <logic:iterate id="transactio" name="t47_transactionList" indexId="i" type="com.ist.aml.report.dto.T47_transaction">
    <tr>
       <td><bean:write name="transactio" property="tx_no" scope="page"/></td>
       <td><bean:write name="transactio" property="host_cust_id" scope="page"/></td>
       <td><bean:write name="transactio" property="party_chn_name" scope="page"/></td>
       <td><bean:write name="transactio" property="tx_dt_disp" scope="page"/></td>
       <td><bean:write name="transactio" property="organkey" scope="page"/></td>
       <td><bean:write name="transactio" property="acct_num" scope="page"/></td>
       <td><bean:write name="transactio" property="currency_cd" scope="page"/></td>
       <td><bean:write name="transactio" property="amt_disp" scope="page"/></td>
       <td><bean:write name="transactio" property="debit_credit" scope="page"/></td>
       <td><bean:write name="transactio" property="tx_type_cd" scope="page"/></td>
       <td><bean:write name="transactio" property="channel" scope="page"/></td>
       <td><bean:write name="transactio" property="settle_type_cd" scope="page"/></td>
       <td><bean:write name="transactio" property="opp_name" scope="page"/></td>
       <td><bean:write name="transactio" property="opp_acct_num" scope="page"/></td>
       <td><bean:write name="transactio" property="opp_organname" scope="page"/></td>
       <td><bean:write name="transactio" property="use_des" scope="page"/></td>
       <td><bean:write name="transactio" property="subjectno" scope="page"/></td>
    </tr>
</logic:iterate>
  	</table>
  	 </div>
    <table width="98%" border="0" align="center" cellpadding="3" cellspacing="3">
       <tr>
          <td align="center"><bean:write name="pageInfo" scope="request" filter="false"/></td>
       </tr>
    </table>
   
</html:form>
</body>
</html>
