<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language=JavaScript src="../../js/selectbox.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/load_window.js"></script>
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
		if(type == "back"){
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

<body class="mainbg">
	<html:form action="/t18_task_fact/getT18_task_fact_error.do" method="POST">
	<div id='main'>
    <div class='conditions'>
     <div class="cond_t">
       <span>���������־</span>
       <span class="buttons">
       		<!--<input type="button" value="�� ��" onclick="dosubmit('t18_errorlog_modify.do','modi')"  />
 			<input type="button" value="�� ��" onClick="dosubmit('t18_task_fact_list.do','back')"/>-->
       		<a href="#" onclick="dosubmit('t18_errorlog_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />���</a>
     	<a href="#" onclick="dosubmit('t18_task_fact_list.do','back')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />����</a>
       </span>
     </div>
	</div>
	
	<div class="list">
		<table>
				<tr>
					<td>����Դ���ƣ�</td>
					<td><bean:write name="t18_task_fact" property="dsname" scope="request" /></td>
					<td>���ȣ�</td>
					<td><bean:write name="t18_task_fact" property="granularity_diap" scope="request" /></td>
				</tr>
				<tr>
					<td>����ʱ�䣺</td>
					<td><bean:write name="t18_task_fact" property="statisticdate" scope="request" /></td>
					<td>�����ţ�</td>
					<td><bean:write name="t18_task_fact" property="taskkey" scope="request" /></td>
				</tr>
				<tr>
					<td>�������</td>
					<td><bean:write name="t18_task_fact" property="typename" scope="request" /></td>
					<td>ҵ����룺</td>
					<td><bean:write name="t18_task_fact" property="businesskey" scope="request" /></td>
				</tr>
		</table>
	</div>
	<div class='list'>
	<table>
			<tr align="center">
				<th width="2%" style='cursor:hand;'>��ѡ��</th>
				<th width="10%" nowrap>
					��־����		
				</th>
				
				<th width="20%" nowrap>
					��������
				</th>
				<th width="10%" nowrap>
					����ʱ��
				</th>
				<th width="10%" nowrap>
					�����
				</th>
				<th width="20%" nowrap>
					�������
				</th>
				<th width="10%" nowrap>
					���ʱ��
				</th>
			</tr>
			
			<logic:notEmpty name="t18_errorlog_list">
				 <logic:iterate id="dto" name="t18_errorlog_list"
					type="com.ist.bmp.hpom.dto.T18_errorlog">
					<TR align="center" >
						<td><input type="radio" name="selectlogkey" value="<%=dto.getLogkey() %>" /></td>
						<td nowrap><bean:write name="dto" property="logkey"  /></td>
						<td nowrap><bean:write name="dto" property="errdes"  /></td>
						<td nowrap><bean:write name="dto" property="errtime"  /></td>
						<td nowrap><bean:write name="dto" property="manager"  /></td>
						<td nowrap><bean:write name="dto" property="donemethod"  /></td>
						<td nowrap><bean:write name="dto" property="donetime"  /></td>
					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
		</div>
	</html:form>

</body>
</html>