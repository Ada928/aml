<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<SCRIPT LANGUAGE="JavaScript" src="../../js/App_Select.js"></script>
<script language="JavaScript">
function dosubmit(theUrl){
    var errMsg = "";
    _Date1 = document.forms[0].report_dt_disp.value;
    _Date2 = document.forms[0].report_dt_end.value;  
         if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
         else if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";  
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";	  
 if(errMsg!=''){
     alert(errMsg);
      return false; 
  }
   errMsg = DateDiff(_Date1,_Date2,30);
   if(errMsg!=''){
      alert(errMsg);
      bool = false;
      return false;
   }
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

var bool = true;
function toExcel(theUrl){
	<logic:present name="t07_inrep_bh_msg_List">
    <bean:size id="len" name="t07_inrep_bh_msg_List" />
    	<logic:equal name="len" value="0">
    		alert('û�пɵ��������ݣ�');
    		bool = false;
    		return false;
		</logic:equal>
    </logic:present>
    var _Date1 = document.forms[0].report_dt_disp.value;
    var _Date2 = document.forms[0].report_dt_end.value;  
    if(_Date1=="" || _Date2==""){
    	alert("����ʱ����д�������ڣ����ʱ�䲻�ܳ���30�죡");
    	bool = false;
    	return false;
    }
   	if(!formatDateAlert(_Date1) || !formatDateAlert(_Date2)){
   		bool = false;
   		return false;
   	}
   	if(!_compareTwoDateForString(_Date1, _Date2)){
   		alert("��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡");
   		bool = false;
   		return false;
   	}
   	var errMsg = DateDiff(_Date1,_Date2,30);
    if(errMsg!=''){
    	alert(errMsg);
    	bool = false;
    	return false;
    }
	if(!bool || s_date != _Date1 || e_date != _Date2){
		alert("���ѯ��");
		return false;
	}
	//alert(theUrl);
	document.forms[0].action=theUrl;
    document.forms[0].submit();
}
var s_date = "";
var e_date = "";
function initDate(){
  	s_date = document.forms[0].report_dt_disp.value;
  	e_date = document.forms[0].report_dt_end.value;
}
</script>
	</head>
	<body onload="initDate()" class="mainbg">
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<div id="main">
			<html:form action="/t07_inrep_bh_msg/t07_inrep_bh_msg_list.do"
				method="post">

				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>����ͳ�Ʊ�</span>
						<span class="buttons"> <a href="#" id="hdd_display"
							class="bt_hidden"></a> <a
							onclick="btnDisplayHidden(this, 'searchtable')" class="btn1"></a>
							<a href="#" onclick="toExcel('t07_inrep_bh_msg.do');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_excel.png" />����</a>
							<!-- <input type="button" name="upload" value="����Excel" class="input" onclick="toExcel();" /> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									�������ڣ�
								</td>
								<td>

									<html:text property="report_dt_disp" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									--
									<html:text property="report_dt_end" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />

								</td>
								<td>
									���ͻ�����
								</td>
								<td>
									<html:text property="organkey" styleClass="text_white"
										size="10" maxlength="60" />
									<html:text property="organname" styleClass="text_white"
										readonly="true" size="23" maxlength="60" />
									<a href="#"
										onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');"><span
										class="cond_buttons"><img
												src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span>
									</a>
									<input type="button" name="ok" value="�� ѯ" class="in_button1"
										onclick="dosubmit('t07_inrep_bh_msg_list.do?newsearchflag=1','search')" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<html:errors />
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr align=center>
							<th>
								����
							</th>
							<th>
								��ͨ����
							</th>
							<th>
								�ط�����
							</th>
							<th>
								��������
							</th>
							<th>
								������
							</th>
							<th>
								ɾ������
							</th>
							<th>
								��������
							</th>
						</tr>
						<logic:present name="t07_inrep_bh_msgList">
							<logic:iterate id="search" name="t07_inrep_bh_msgList"
								type="com.ist.aml.inves.dto.T07_INREP_BH_msg">
								<tr>
									<td>
										<bean:write name="search" property="organname" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_n" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_r" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_a" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_c" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_d" scope="page" />
									</td>
									<td>
										<bean:write name="search" property="msg_i" scope="page" />
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<!-- list_page -->
				<div class="list_page">
					<logic:present name="pageInfo">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</logic:present>
				</div>
				<!-- all end -->
			</html:form>
		</div>
	</body>
</html>