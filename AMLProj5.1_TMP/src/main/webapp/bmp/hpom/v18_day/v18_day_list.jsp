<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/FusionCharts.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl,type){
		 var errMsg = "";
		 var isSub = false;
		 if(type == 'modi'){		
			 
			 if(RadioMustChecked(document.forms[0])){				
				 errMsg = "��ѡ��";
			}
			 isSub = true;
		}   
		 if(type == 'back'){
			isSub = true;
		}  
		 if(type == 'search'){
			 var begin = document.forms[0].time_begin.value;
				var end = document.forms[0].time_end.value;
				if(begin != "" && end != ""){
			        if(begin > end){
						alert("����ʱ���������");
						return false;
			        }
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
	
</SCRIPT>
	</head>

	<body>
		<div id='content'>
			<html:form action="/v18_day/v18_day_list.do" method="POST">
				<div class='awp_title'>
					<table>
						<td>
							<span class="awp_title_td2">������Ч�ܷ���</span>
						</td>
						<td width="84%" align="right">

						</td>
						</tr>
					</table>
				</div>
<br/>
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8">
							<strong>����ʱ�䣺</strong>
							<html:text property="time_begin" styleClass="text_white"
								size="12" readonly="true" maxlength="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor: hand;" width="16" height="16"
								border="0" align="absmiddle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].time_begin);">
							&nbsp;-
							<html:text property="time_end" styleClass="text_white" size="12"
								readonly="true" maxlength="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img2" style="cursor: hand;" width="16" height="16"
								border="0" align="absmiddle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].time_end);">
								
							<input type="button" value="�� ѯ" onClick="dosubmit('v18_day_list.do?newsearchflag=1','search')" />
						</td>
					</tr>
				</table>


				<table width="98%" align=center border="1" borderColor="#FFFFFF"
					cellPadding="1" cellSpacing="1" style="BORDER-COLLAPSE: collapse">
					<tr>
						<td width="48%" valign="top">

							<div class="awp_list">
								<table>
									<tr align="center">
		                                <td nowrap="nowrap"> ��������</td>
									    <td nowrap="nowrap">��ʼʱ��</td>
									    <td nowrap="nowrap"> ����ʱ�� </td>
									    <td nowrap="nowrap"> ʵ�ʺ�ʱ�����ӣ�</td>
									    <td nowrap="nowrap"> ��ɣ�%��</td>
									    <td nowrap="nowrap"> ״̬</td>
								      </tr>
									<logic:iterate id="dto" name="v18_dayList"
										type="com.ist.bmp.hpom.dto.V18_day">
										<tr align="center">
											<td nowrap="nowrap">
												<bean:write name="dto" property="statisticdate" />
											</td>
											<td nowrap="nowrap">
												<bean:write name="dto" property="begintime" />
											</td>
											<td nowrap="nowrap">
												<bean:write name="dto" property="endtime" />
											</td>
											<td nowrap="nowrap">
												<bean:write name="dto" property="usetime" />
											</td>
											<td nowrap="nowrap">
												<bean:write name="dto" property="proportion" />
											</td>
											<td nowrap="nowrap">
												<bean:write name="dto" property="taskstatus_disp" />
											</td>
										</tr>
									</logic:iterate>
								</table>
							</div>

						</td>
						<td width="48%" valign="top">
							<table border="0" cellpadding="0" cellspacing="0">
								<tr>
									<td>
										<div id="chartdiv" style="border: 0px solid">
											&nbsp;
										</div>
										<%
											String datestr = (String) request.getAttribute("datestr") == null
														? ""
														: (String) request.getAttribute("datestr");
										%>
					<script>					
						var exist = "MSLine.swf";
						if (exist != "") {
							if('<%=datestr%>' != ""){
								var chart1 = new FusionCharts('../../charts/MSLine.swf', 'Chart1Id', '450', '300', '0', '0');										
								chart1.setDataXML('<%=datestr%>');
									chart1.render("chartdiv");
							}
						}
					</script>
									</td>
								</tr>
							</table>
						</td>
					</tr>

				</table>


			</html:form>
		</div>
	</body>
</html>