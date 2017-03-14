<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="../../css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='recal' || type=='havecal' ){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        isSub = true;
    }else if(type=='search' || type=='back' || type=='refresh'){
        isSub = true;
    }
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        //return false;
    }
}


</script>
		<style type="text/css">
<!--
.STYLE1 {
	color: #FF0000
}
-->
<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />ȫ ��");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />ȫ ѡ");
	  });
});
</script>

</style>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form action="/calinfo/dm_task_list.do" method="post">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> DM������� - �����б� </span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('dm_task_list.do','refresh');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_refresh.png" />ˢ ��</a> <a href="#"
							id="checkall"><img
									src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫ ѡ</a> <a href="#"
							onclick="dosubmit('dm_havecal_do.do','havecal');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_compute.png" />����Ϊ�Ѽ���</a> <a href="#"
							onclick="dosubmit('dm_recal_do.do','recal');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_computer.png" />����Ϊ���¼���</a> <a href="#"
							onclick="dosubmit('dm_server_list.do','back');"><img
									src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a> <!--<input type=button value="�� ѯ" name=Button33222 class="input" onClick="dosubmit('dm_task_query.do','search')"> -->
							<!--<input type=button value="ˢ  ��" name=Button33222 class="input" onClick="dosubmit('dm_task_list.do','refresh')"> -->
							<!--<input type=button value="ȫ  ѡ" name=selectAllButton class="input" onClick="selectAll(this)"> -->
							<!--<input type=button value="����Ϊ�Ѽ���" name=Button3322 class="input" onClick="dosubmit('dm_havecal_do.do','havecal')"> -->
							<!--<input type=button value="����Ϊ���¼���" name=Button3322 class="input" onClick="dosubmit('dm_recal_do.do','recal')"> -->
							<!--<html:button property="backbutton" value="��  ��" styleClass="input" onclick="dosubmit('dm_server_list.do','back')"/> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									<strong>����ʱ�䣺</strong>
									<bean:write name="statisticdate_disp" />
									<strong> ������</strong>
									<bean:write name="t18_server" property="domainname" />
									<strong> �������棺</strong>
									<bean:write name="t18_server" property="servername" />
								</td>
							</tr>
						</table>
					</div>
				</div>
				<!-- list -->
				<div class="list">
					<table border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>
								���
							</th>
							<th>
								����
							</th>
							<th>
								����
							</th>
							<th>
								��������
							</th>
							<th>
								�������
							</th>
							<th>
								״̬
							</th>
							<th>
								��ʼʱ��
							</th>
							<th>
								����ʱ��
							</th>
							<th>
								������ʱ��S��
							</th>
							<th>
								������Ϣ
							</th>
						</tr>
						<logic:iterate id="task" name="t18_task_factList"
							type="com.ist.platform.dto.T18_task_fact">
							<%
								java.util.HashMap map = new java.util.HashMap();
											//map.put("domainkey",task.getDomainkey());
											//map.put("serverkey",task.getServerkey());
											//map.put("taskkey",task.getTaskkey());
											map.put("schedulekey", task.getSchedulekey());
											//map.put("statisticdate_disp",task.getStatisticdate_disp());
											pageContext.setAttribute("map", map,
													PageContext.PAGE_SCOPE);

											java.util.HashMap map1 = new java.util.HashMap();
											map1.put("domainkey", task.getDomainkey());
											map1.put("serverkey", task.getServerkey());
											map1.put("taskkey", task.getTaskkey());
											map1.put("granularity", task.getGranularity());
											map1.put("organkey", task.getOrgankey());
											map1.put("statisticdate_disp", task
													.getStatisticdate_disp());
											pageContext.setAttribute("map1", map1,
													PageContext.PAGE_SCOPE);
							%>
							<tr>
								<td>
									<bean:write name="task" property="seq" scope="page" />
									<html:multibox property="selectedSchedulekey">
										<bean:write name="task" property="schedulekey" />
									</html:multibox>
								</td>
								<td>
									<bean:write name="task" property="organkey_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="granularity_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="task" property="taskkey" scope="page" />
									-
									<bean:write name="task" property="taskkey_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="tasktype_disp" scope="page" />
								</td>
								<td>
									<logic:notEqual value="4" name="task" property="calstatus">
									<bean:write name="task" property="calstatus_disp" scope="page" />
									<logic:equal value="0" name="task" property="calstatus">
            						(<html:link name="map"
											page="/calinfo/dm_tocontinue_byschedulekey_do.do">
											<font>��������</font>
										</html:link>)
        							 </logic:equal>
        							 </logic:notEqual>
        							 
        							 
         							<logic:equal value="4" name="task" property="calstatus">
         							<img src="../../images/blue/stutas_icon3.gif" title="�Ѽ���"/>
         							</logic:equal>
								</td>
								<td>
									<bean:write name="task" property="begindate_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="enddate_disp" scope="page" />
								</td>
								<td>
									<bean:write name="task" property="timestr" scope="page" />
								</td>
								<td>
									<html:link name="map1"
										page="/calinfo/dm_task_log_info.do?newsearchflag=1"><img src="../../images/blue/stutas_icon4.gif" title="������Ϣ"/></html:link>
								</td>
							</tr>
						</logic:iterate>
					</table>
				</div>
			</html:form>
		</div>
	</body>
</html>
