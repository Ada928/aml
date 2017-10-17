<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<HTML xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,type){
   var isSub = false;
   var errMsg = "";
   if(type=='search'){
        isSub = true;
    }
   if(type=='search'){
   		if(!_compareTwoDateForString(document.forms[0].statistic_dt_disp.value, document.forms[0].statistic_dt_disp_end.value))
   		{
    		errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ��";	
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

//������������ú�����ֱ��<input type="reset"/>���ֵĻ����ύ֮��Ͳ��������ˣ����������������
function reset_input() {
	document.getElementById("organ_name").value="";
	document.getElementById("statistic_dt_disp").value="";
	document.getElementById("statistic_dt_disp_end").value="";
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
	<html:form action="/check/t37_investigation_delay_list.do" method="post">
	<input type="hidden" name="backurl" value="/check/t37_investigation_delay_list.do"/>
	
		<div id="main">
				<!-- conditions -->
			<div class="conditions">
					<!-- title -->
				<div class="cond_t">
					<span>�����ѯ - �ͻ�������ڲ�ѯ</span>
				</div>
				<div class="cond_c" id="searchtable">
					<table width="100%" border="0" cellpadding="1" cellspacing="1">
							<tr>
								<td width="14%" height="22" align="right" nowrap>����������</td>
								<td width="36%">
									<html:text styleId="organ_name" property="organ_name" styleClass="text_white" size="20" maxlength="32"/>
									<a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organ_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
								</td>
								<td width="14%" height="22" align="right">
									�������ڣ�
								</td>
								<td width="36%">
									<html:text styleId="statistic_dt_disp" property="statistic_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
	                                --
	                                <html:text styleId="statistic_dt_disp_end" property="statistic_dt_disp_end" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12" />
								</td>
							</tr>
							
							<tr>
								<td width="14%" height="22" align="right" nowrap>
									
								</td>
								<td width="36%">
									
								</td>
								<td>
									<input type="button" value="��  ѯ" name="Button522"
										onClick="dosubmit('t37_investigation_delay_list.do?newsearchflag=1','search')"
										class="in_button1" />
									
								</td>
								<td><input type="button" value="�� ��" class="in_button1" onclick="reset_input()"/></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>�ͻ���</th>
							<th>�ͻ�����</th>
							<th>��������</th>
							<th>ʵ��������</th>
							<th>ϵͳ��������</th>
							<th>�������</th>
							<th>����ʱ��</th>
							<th>����ʱ��</th>
							<th>�༭�ڹ�Ա��</th>
							<th>�༭�ڹ�Ա��</th>
							<th>�༭���ύʱ��</th>
							<th>��˸ڹ�Ա��</th>
							<th>��˹�Ա��</th>
							<th>���ʱ��</th>
							<th>�����ڹ�Ա��</th>
							<th>�����ڹ�Ա��</th>
							<th>����ʱ��</th>
							
						</tr>
						<logic:present name="t37_investigation_delay_List">
							<logic:iterate id="result" name="t37_investigation_delay_List"
								type="com.ist.aml.risk_rate.dto.T37_party_resultAndT00_organAndT00_user">
								
								<tr align="center" bgcolor="#FFFFFF">
									
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="party_id" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
							            &nbsp;&nbsp;&nbsp;<bean:write name="result" property="party_chn_name" /> &nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="organname" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="statisticdate" format="yyyy-MM-dd" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="statistic_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="fristappralevel"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="create_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="dealmax_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="audit_user" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="audit_realname" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="audit_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="check_user" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="check_realname" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="check_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="rcheck_user" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="rcheck_realname" />&nbsp;&nbsp;&nbsp;
									</td>
									<td>
										&nbsp;&nbsp;&nbsp;<bean:write name="result" property="rcheck_dt" format="yyyy-MM-dd"/>&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</logic:iterate>
						</logic:present>
					</table>
				</div>
				<div class="list_page">
					<logic:present name="pageInfo">
						<table width="98%" align="center" border="0" cellpadding="3"
							cellspacing="3">
							<tr>
								<td align="center">
									<bean:write name="pageInfo" scope="request" filter="false" />
								</td>
							</tr>
						</table>
					</logic:present>
				</div>
				<!-- all end -->
			</div>
	</html:form>
</BODY>

</HTML>
