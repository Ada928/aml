<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />	
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<script language="JavaScript">
		
	
function dosubmit(theUrl,type){
	var errMsg = "";
	var isSub = false;
	if(type=='modi'){
		errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		isSub = true;
	}
	else if(type=='del'){
			errMsg = CheckBoxMustChecked(document.forms[0]);
			if(errMsg==''){
				if(confirm('�����Ҫ�ų�ѡ��ĺ������ͻ���')){
					isSub = true;
				}
			}
		}
	else if(type=='search' || type=='add'){
		isSub = true;
	}
	if(type=='search'){
		if(!_compareTwoDateForString(document.forms[0].startDt.value, document.forms[0].endDt.value)) {
			errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ��";		    
		}     
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
function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }
	 return true
}
function selectAll(obj){
    if(document.forms[0].selectedKeys!=null){
 
    if(obj.innerHTML=="ȫѡ"){
        obj.innerHTML="ȫ��ѡ"
		if(document.forms[0].selectedKeys.value!=""){
                document.forms[0].selectedKeys.checked=true;
    	}
        if(document.forms[0].selectedKeys.length!=0)
             for ( var i=0; i < document.forms[0].selectedKeys.length; i++ ){
             document.forms[0].selectedKeys[i].checked=true;
        }
    }
    else{
	    obj.innerHTML="ȫѡ"
	    if(document.forms[0].selectedKeys.value!="")
                document.forms[0].selectedKeys.checked=false;
        if(document.forms[0].selectedKeys.length!=0)
             for ( var i=0; i < document.forms[0].selectedKeys.length; i++ )
	             document.forms[0].selectedKeys[i].checked=false;
    }
  }
    else{
        alert("�Բ���û�п�ѡ����.");
    }
}
</script>
</head>
	<body leftmargin="0" topmargin="0" class="mainbg">
	<div id="main">
		<html:form action="/list/getCustBlackListFact.do" method="post"
			enctype="multipart/form-data">
			<div class="conditions">
				<div class="cond_t">
					<span>����������</span>
				
				<span class="buttons">				
					<img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" /><a href="#" onclick="selectAll(this)">ȫѡ</a>
					<img src="../../images/<%=session.getAttribute("style") %>/b_susnot.png" /><a href="#" onclick="dosubmit('/platform/list/removeCustFromBlackList.do','del')" >�� ��</a>
				</span>
				</div>
			
			<html:errors />
			<div class="cond_c">
			
							<table>
								<tr >
									<td>
										�������ڣ�
									</td>

									<td >
									 <html:text property="startDt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/> ��
									 <html:text property="endDt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
   
									</td>
									<td>
										�ͻ�ID��
									</td>
									<td >
										<html:text property="party_id" size="20" />
									</td>
								</tr>
								<tr >
									<td>
										�ͻ����ƣ�
									</td>
									<td >
										<html:text property="party_name" size="20" />
									</td>
									<td >
										֤�����룺
									</td>
									<td >
										<html:text property="card_no" size="20" />
									</td>
								</tr>
								<tr >
									<td >
										����
									</td>
									<td >
										<html:select property="orders">
											<html:options collection="orderList" property="label"
												labelProperty="value" />
										</html:select>
										<html:radio property="fashion" value='asc' />
										����
										<html:radio property="fashion" value='desc' />
										����
									</td>
									<td></td>
									<td>
										<html:button property="button" styleClass="input" value="�� ѯ"
											onclick="dosubmit('/platform/list/getCustBlackListFact.do?newsearchflag=1','search')" />
									</td>
								</tr>
							</table>
			
			</div>
			</div>
			<div class="list">
			<table  border="0" cellpadding="0"	cellspacing="0" >
				<tr>
					<th>
						ѡ��
					</th>
					<th>
						�ͻ���
					</th>
					<th>
						�ͻ�����
					</th>
					<th>
						֤������
					</th>
					<th>
						��������
					</th>
					<th>
						����ʱ��
					</th>
					<th>
						����
					</th>
				</tr>
				<logic:iterate id="result" name="t11_cust_blacklist"
					type="com.ist.platform.dto.T11_BlackList_Cust">
					<tr>
						<td>
							<html:multibox property="selectedKeys">
								<bean:write name="result" property="party_id" scope="page"/>_<bean:write name="result" property="type_cd" scope="page" />
							</html:multibox>
						</td>
						<td>
							<bean:write name="result" property="party_id" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="party_name" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="card_no" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="organkey" scope="page" />
						</td>
						<td>
							<bean:write name="result" property="create_dt_display" scope="page" />
						</td>
						<td>
							<logic:equal value="1" name="result" property="type_cd" scope="page">
							<a href="#" onclick="window.open('/report/listmanager/t07_blacklist_disp.do?party_id=<bean:write name="result" property="party_id" scope="page" />','enter2','height=500, width=700,left=400,top=100,scrollbars=no,resizable=yes')";>
							<font color="#FF0000">�˹�ʶ��</font></a>
							</logic:equal>
							<logic:equal value="2" name="result" property="type_cd" scope="page">
							<a href="#" onclick="window.open('/platform/list/getDetailBlackCustInfo.do?party_id=<bean:write name="result" property="party_id" scope="page"  />','enter2','height=500, width=700,left=400,top=100,scrollbars=yes,resizable=no');">
							<font color="#FF0000">ϵͳ����</font></a>
							</logic:equal>
						
						</td>
					</tr>
				</logic:iterate>
			</table>
			</div>
			<div class="list_page">
				<logic:present name="pageInfo" scope="request">
							<bean:write name="pageInfo" scope="request" filter="false" />
				</logic:present>
			</div>
		</html:form>
		</div>
	</body>
</html>
