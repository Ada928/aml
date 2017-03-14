<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script language="javascript"> 
	function doSubmit(theUrl){
		var errMsg = checkFormat("starttime");
		var errorMsg = checkFormat("endtime");
		if(isShowFlex()){
			var st = document.getElementById("flex").value;
			if(st.length<1){
				alert("��ʱ����������д!");
				document.forms[0].flex.focus();
				return false;
			}
			var regFlex = /^\d+$/;
			if(!regFlex.test(st)){
				alert("��ʱ������ʽ���ԣ���������ȷ��������!");
				document.forms[0].flex.focus();
				return false;
			}else if(st.length>1){
				alert("��ʱ����ӦΪ0��10֮���������!");
				document.forms[0].flex.focus();
				return false;
			}
		}
		if("" != errMsg){
			alert(errMsg);
			return false;
		}
		if("" != errorMsg){
			alert(errorMsg);
			return false;
		}
		if(""==errMsg && ""==errorMsg){
			document.forms[0].action=theUrl;
			document.forms[0].submit();
		}
	}
	function checkFormat(param){
		var errMsg = "";
		var st = document.getElementById(param).value;
		var regIsFlex = /^([01]\d|2[0123]):([0-5]\d)$/;
		
		if(st.length == 0){
			if(param=="starttime"){
				errMsg = "��ʼʱ�������д! ";
				document.forms[0].starttime.focus();
				return errMsg;
			}else if(param="endtime"){
				errMsg = "����ʱ�������д! ";
				document.forms[0].endtime.focus();
				return errMsg;
			}
		}
		if(!regIsFlex.test(st)){
			if(param=="starttime"){
				errMsg = "��ʼʱ���ʽ����ȷ!";
				document.forms[0].starttime.focus();
				return errMsg;
			}else if(param="endtime"){
				errMsg = "����ʱ���ʽ����ȷ!";
				document.forms[0].endtime.focus();
				return errMsg;
			}
		}
		return errMsg;
	}
	function isShowFlex(){
		var t = document.getElementById("isflex");
		var selectedVal = t.options[t.selectedIndex].value;
		var tmp = document.getElementById("flexId");
		if(""==selectedVal || "0"==selectedVal){
			tmp.style.display = "none";
			return false;
		}else{
			tmp.style.display = "";
			return true;
		}
	}
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/t18_task_type/t18_task_type_modify.do" method="post">
<div class="conditions">
	<!-- table content -->
	<div class="cond_c2" id="searchtable">
	<table border="0" cellpadding="0" cellspacing="0" width="100%">
		<tr>
			<th colspan="4"><strong>����ʼʱ���޸�</strong></th>
        </tr>
        <tr>
        	<td>�Ƿ���ʱ</td>
			<td>
				<html:select styleId="isflex" property="isflex" onchange="isShowFlex();">
					<html:options collection="isflexMap" property="label" labelProperty="value" />
				</html:select>
			</td>
		</tr>
		<tr id="flexId">
			<td>��ʱ����</td>
			<td>
				<html:text styleId="flex" property="flex" />
			</td>
		</tr>
		<tr>
        	<td>��������ִ������ʼʱ�䣺</td>
			<td>
				<html:text styleId="starttime" property="starttime" />
			</td>
        </tr>
        <tr>
        	<td>��������ִ�н���ʱ�䣺</td>
        	<td>
        		<html:text styleId="endtime" property="endtime" />
        	</td>
        </tr>
		<tr>
			<td>
				<%
					String tasktypeStr = (String) request.getAttribute("tasktypeStr");
				%>
				<input type="hidden" name="tasktypeStr" value="<%=tasktypeStr %>" />
			</td>
        	<td>
        		<input name="Button522" type="button" class="in_button1" value="�ύ"
					 onClick="doSubmit('t18_task_type_modify_do.do')" />
			</td>
        </tr>
	  </table>
	</div>
	<div class="sys_warning"><strong><img src="../../images/blue/warning.png" />��ʾ��</strong>
    &nbsp;&nbsp;<p>1����д��ʱ���ʽ��׼Ϊ"00:00"��������д��ֵ��</p>
    &nbsp;&nbsp;<p>2����ѡ����ʱ������ʱ����ӦΪ����0С��10����������</p>
	&nbsp;&nbsp;<p>3����д��ʱ���ʽӦΪ24Сʱ�ƣ�ð��ӦΪ���Ӣ��״̬��</p>
	&nbsp;&nbsp;<p>4���ύ���޸ĵ�����һ�������й�ѡ��ȫ�������ִ����Ϣ��</p>
	&nbsp;&nbsp;<p>5����ʼʱ��������ʱ���������Ǻ�̨����ִ��ʱ�䣬�翪ʼʱ����ڽ���ʱ�䣬�����񽫿���ִ�У���֮����ִ�У�</p>
	&nbsp;&nbsp;<p>�磺���ÿ�ʼʱ��Ϊ20:00������ʱ��Ϊ08:00�����ڵ���20�㿪ʼ������8������������ÿ�ʼʱ��Ϊ08:00������ʱ��Ϊ20:00������8�㿪ʼ���񣬵���20�������</p>
	</div>
  </div>
  </html:form>
<script language="javascript">
	isShowFlex();
</script>
<!-- all end -->   
</div>
</body>
</html>
