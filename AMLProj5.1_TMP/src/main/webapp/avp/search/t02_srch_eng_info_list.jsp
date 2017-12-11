<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.avp.search.Constants;"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	
	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
	<script src="<%=contextPath%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"	src="<%=contextPath%>/js/Calendar.js"></script>
	 <script type="text/javascript">
	 	var path = "<%=contextPath %>";
	 </script>
</head>
<script language="JavaScript">
 //��ѯ �ύ��̨
function dosubmit(theUrl) {
	 document.forms[0].action=theUrl;
     document.forms[0].submit();
}

//����ҳ��
function openFullWin(theUrl){
    	openWindow(theUrl,'900','600');
}
//�޸�
function update(theUrl){
	var val= CheckboxConfirm(document.forms[0],'#');
	if(val==false){
		return;
	}else{
		var num=val.split('#').length;
		if(num!=1){
			alert("ֻ��ѡ��һ����¼");
			return false;
		}else{
		    theUrl=theUrl+"&engkeys="+val;
			dosubmit(theUrl)
		}
	}
}
//ɾ��
function del(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("����ѡ��һ����¼");
		return false;
	}else{
	if(confirm("��ȷ��Ҫɾ����ѡ�����Ϣ��")){
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	
	}

}
//���뷢�� Ҫ������״̬Ϊ������
function reqState(theUrl){
	var num=CheckBoxCheckedNum(document.forms[0]);
	if(num < 1){
		alert("����ѡ��һ����¼");
		return false;
	}else{
	
		  	
  		var checkbox = document.forms[0].engkeys;
  		if (!checkbox.length) {
		  		checkbox = new Array(checkbox);
		  	}
        	for (var i=0; i < checkbox.length; i++) {
        		var oCheck = checkbox[i];
            	//�����ѡ������
              	if (oCheck.checked) {
                  	var engkeys= document.getElementsByName("engkeys")[i].value;//����
	                var state = document.getElementsByName("state")[i].value;//����״̬
	                if(state!=<%=Constants.ENG_SRCHENGSTAT_YES%>){//���������״̬�������� ��ֱ�ӷ���
	                  alert("����״̬��������״̬!!");
	                  return false;
	                }
	           }
         }
        //���뷢������
       if(confirm("��ȷ��Ҫ���뷢����")){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
	   }
	  }
         
}
 	//���浼����֤
 	function srchEngExport() {
 		var url = "srchEngExport.do";
 		var errMsg = CheckBoxMustChecked(document.forms[0]);
 		if (errMsg == "") {
 			document.forms[0].action=url;
        	document.forms[0].submit();
 		} else {
 			alert(errMsg)
 		}
 	}

 </script>
<body>
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div id='content'>
		<html:form method="post" action="/search/t02_srch_eng_inf_list.do">
			<!-- �������� -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%"><span class="awp_title_td2">ͳһ��ͼ �� �����б�</span></td>
						<td align="right">
							<input type="button" name="btsearch" value="�� ��" onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" value="�� ��" onclick="dosubmit('main_add.do?type=add');">
							<input type="button" value="�� ��" onClick="update('main_add.do?type=modify');">
							<input type="button" value="���뷢��" onClick="reqState('performReqIssueT02_srch_eng_inf.do')">
							<input type="button" value="ɾ ��" onClick="del('t02_srch_eng_inf_del.do');">
							<input type=button value="�� ��" name="btnSrchEngImport"  onClick="dosubmit('srchEngImport.do')">
							<input type=button value="�� ��" name="btnSrchEngExport"  onClick="srchEngExport();">
						</td>
					</tr>
				</table>
			</div>
			<!-- ������Ϣ��ʾ�� -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- ��ѯ������ -->
			<div class='awp_cond' id='searchtable' style="display: none">
				<table>
					<tr>
						<td>
							��ͼ���ƣ�
						</td>
						<td>
							<html:text property="srchengname" size="33" />
						</td>
						<td>
							�����ˣ�
						</td>
						<td>
							<html:hidden property="creator" />
							<html:text property="creator_disp" size="30" readonly="true" />							
							<html:button property="button1" onclick="locate_pop_window(path,'t00_userLocation' ,'radio' ,'forms[0]', 'creator,creator_disp','flag=\\'1\\'')" value="�� λ"/>
						</td>
					</tr>
					<tr>
						<td>
							�������ڣ�
						</td>
						<td>
							<html:text property="createdate_min" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="�������������˵�"
								onclick="new Calendar().show(document.forms[0].createdate_min);">
							��
							<html:text property="createdate_max" size="10" maxlength="10" />
							<img src="../../images/calendar.gif" id="img1"
								style="cursor:hand;" width="16" height="16" border="0"
								align="absmiddle" alt="�������������˵�"
								onclick="new Calendar().show(document.forms[0].createdate_max);">
						</td>
						<td>
							��ͼ״̬��
						</td>
						<td>
							<html:select property="srchengstat">
								<html:options collection="flagMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							����
						</td>
						<td>
							<html:select property="sort">
								<html:options collection="sortMap" property="label"
									labelProperty="value" />
							</html:select>
							&nbsp;
							<html:radio property="sort_type" value="asc">����</html:radio>
							<html:radio property="sort_type" value="desc">����</html:radio>
							<html:radio property="sort_type" value="">������</html:radio>
						</td>
						<td>
							����״̬��
						</td>
						<td>
							<html:select property="reqstat">
								<html:options collection="reqMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>

					</tr>
					<tr>
						<td>
						</td>
					<td>
						<input type="button" name="button" value="�� ѯ"
							onClick="dosubmit('t02_srch_eng_inf_list.do?newsearchflag=1')">
						<input type="button" value="�� ��" onClick="searchReset();">
						</td>
						<td>
						</td>
						<td>
						</td>
					</tr>
				</table>
			</div>
			<!-- ������ -->
			<div class='awp_list'>
				<table>
					<tr>
						<td>
							 <input type="checkbox" name="guizbms" value="0" onClick="selectORClearBox(forms[0],this.checked)">
						</td>
						<td>
							��ͼ����
						</td>
						<td>
							��ͼ״̬
						</td>
						<td>
							����״̬
						</td>
						<td>
							����������
						</td>
						<td>
							����ʱ��
						</td>
						<td>
							�޸�������
						</td>
						<td>
							�޸�ʱ��
						</td>
					</tr>
					<logic:iterate id="binfo" name="t02_srch_eng_infList"
						type="com.ist.avp.search.dto.T02_srch_eng_inf">
						<tr>
							<td align="center">
								<html:multibox property="engkeys"  >
									<bean:write name="binfo" property="srchengkey" />
								</html:multibox>
							</td>
							<input type="hidden" name="state" value="<bean:write name='binfo' property='srchengstat' />"/>
							<td align="left">
								<bean:write name="binfo" property="srchengname" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="srchengstat_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="reqstat_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="creator_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="createdate" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="modifier_disp" scope="page" />
							</td>
							<td align="center">
								<bean:write name="binfo" property="modifydate" scope="page" />
							</td>
						</tr>
					</logic:iterate>
				</table>
			</div>
			<!--��ҳ��ʾ�� -->
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
		</html:form>
	</div>
</body>
</html:html>
