<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.net.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->

		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/uc.js" ></script>
		<script type="text/javascript" src="../../js/selectbox.js"></script>
		<script type="text/javascript">
function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
 
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='search'){
       isSub=true;
    }
    else if(type=='del'){
    	
    	errMsg = RadioMustChecked(document.forms[0]);
        }
    if(errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        
        alert(errMsg);
        return false;
    }
}


function getReportkey(){

	document.getElementsByName("reportkey")[0].value=window.parent.document.getElementsByName("reportkey")[0].value;
}

function _open(type)
{
	if (type=='add')
	{
		url='<%=request.getContextPath()%>/report/case/t07_case_app_add_party_page.do?newsearchflag=1';
	}
	if(type=='newadd')
	{
		url='<%=request.getContextPath()%>/report/case/t07_case_app_add_party_page_new.do';
	}
	window.open(url,'tranadd','height=400,width=1100,left=100,top=100,scrollbars=yes, resizable=yes');
}

function selectAll(obj){

    if(document.forms[0].transactionkeyCheckBox!=null){
    if(obj.innerHTML=="ȫѡ"){
   
        obj.innerHTML="ȫ��ѡ"
		if(document.forms[0].transactionkeyCheckBox.value!=""){
                document.forms[0].transactionkeyCheckBox.checked=true;
    	}
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ ){
             document.forms[0].transactionkeyCheckBox[i].checked=true;
        }
    }
    else{
	    obj.innerHTML="ȫѡ"
	    if(document.forms[0].transactionkeyCheckBox.value!="")
                document.forms[0].transactionkeyCheckBox.checked=false;
        if(document.forms[0].transactionkeyCheckBox.length!=0)
             for ( var i=0; i < document.forms[0].transactionkeyCheckBox.length; i++ )
	             document.forms[0].transactionkeyCheckBox[i].checked=false;
    }
  }
    else{
        alert("�Բ���û�п�ѡ����.");
    }
}

</script>

</head>

	<body >
<div id="iframecontent">
		<html:form action="/case/t07_case_app_add_party.do" method="post">
		
	<div class="conditions">
		<div class="cond_t">
		  <span>�ͻ��б�</span>
		   <span class="buttons">
		   <!--  <img src="../../images/blue/b_checkall.png" /><a href="#" onclick="selectAll(this)">ȫѡ</a> -->
		   <a href="#" onclick="dosubmit('<%=request.getContextPath() %>/report/case/t07_case_app_add_party_del.do','del');"><img src="../../images/blue/b_delete.png" />ɾ��</a>
		  <!--   <a href="#" onclick="_open('add');"><img src="../../images/blue/b_add2.png" />���</a> -->
		   <a href="#" onclick="_open('newadd');"><img src="../../images/blue/b_add.png" />����</a>
		  </span>
		</div>
	</div>				
		  <div class="list">
		   <table  border="0" cellspacing="0" cellpadding="0">
				  <tr>
					<th>ѡ��</th>
					<th>�ͻ���</th>
					<th>�ͻ�����</th>
					<th>�ͻ�����</th>
					<th>�Ƿ��пͻ�</th>
				  </tr>
				 <logic:present name="case_partyMap" scope="session" >
					 <logic:iterate id="partyMap" name="case_partyMap" scope="session"   >
						 <bean:define id="t47_party" name="partyMap" property="value" type="com.ist.aml.report.dto.T47_party" />
						 <%
						 	String val = t47_party.getParty_id() + "--" + t47_party.getParty_chn_name() + "--" + t47_party.getParty_class_cd() + "--" + t47_party.getIs_party();
						 %>
					<tr>
						<td>
							<html:hidden name="t47_party" property="is_party"/>
							<html:radio  property="party_id" value="<%=val %>"/>
						</td>
						<td>
							<bean:write name="t47_party" property="party_id" />
						</td>
						<td>
							<bean:write name="t47_party" property="party_chn_name" />
						</td>
						<td>
							<logic:equal name="t47_party" property="party_class_cd" value="I">��˽</logic:equal>
       						<logic:equal name="t47_party" property="party_class_cd" value="C">�Թ�</logic:equal>
						</td>
						<td>
							<logic:equal name="t47_party" property="is_party" value="1">����</logic:equal>
       						<logic:equal name="t47_party" property="is_party" value="0">����</logic:equal>
						</td>
					</tr>
									
					</logic:iterate>
				</logic:present>
				
			</table>
			</div>			
		
		</html:form>
	  </div>
	</body>
</html>
