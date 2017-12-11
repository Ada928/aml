<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=GBK">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	
	<script LANGUAGE="JavaScript" src="<%=contextPath%>/js/basefunc.js"></script>
    <script language="JavaScript" src="<%=contextPath%>/js/selectbox.js"></script>
	<script language="JavaScript" src="<%=contextPath%>/js/load_window.js"></script>
</head>
<script language="JavaScript">

	/** ���غ���ʾ�Ǳ����ѯ���� **/
	function btnDisplayHiddenCon(object){	
		var btn = object;	
		try{
			if (document.getElementById("titleField").style.display == ""){				   
			    document.getElementById("titleField").style.display = "none";	  
		        document.getElementById("yAxisLabelField").style.display = "none";	  
		        document.getElementById("xAxisLabelField").style.display = "none";
		        document.getElementById("heightField").style.display = "none";
		        document.getElementById("widthField").style.display = "none";
		        	  
			    btn.value ="�߼�>>";  
			}else{
			    document.getElementById("titleField").style.display = "";	  
		        document.getElementById("yAxisLabelField").style.display = "";
		        document.getElementById("xAxisLabelField").style.display = "";
		        document.getElementById("heightField").style.display = "";
		        document.getElementById("widthField").style.display = "";
			    btn.value = "�߼�<<";				      	   
			}	
		}catch(ex){
		  alert(err);
		}
	}
	
	/** �鿴ͼ�κ���  **/
	function showChart(load_page_path) {
		var dataField = document.forms[0].dataField;
	    if (dataField.length == 0){
	    	alert("��ֵ����Ϊ��!");
	    	return false;
	    }
	    var result = checkform();//��У���ѯ����
		var result1 = checkxyNot();//���xy�Ƿ��ظ�
		if(result1 == false){
			return false ;
		}
		if(result1 && result){
			var theUrl = load_page_path + "/avp/template/show_image_analysis.do";
			var colAreaSelect = document.getElementById("colAreaSelect");
			avpSubmitPopUpSameNameWindow("", "selectField", theUrl, "800", "600");
	    }
	}

	/* У��x y�����겻���ظ�**/
	function checkxyNot(){
		var data_begin = parseInt(document.forms[0].data_begin.value , 10);
		var data_end = parseInt(document.forms[0].data_end.value , 10);
		var rowAreaSelect = document.forms[0].row_cond.value;//x����뵥ѡ 
		var colAreaSelect =  document.forms[0].disp_cond.value//y��
		var picType = getRadioValue();
		if(data_begin > data_end){
			alert("��ֹ��������ֹ��!");
			return false;
		}
		if (rowAreaSelect.length == 0){
			alert("X�᲻��Ϊ��!");
			return false ;
		}
		
		if (picType.indexOf("MS") != -1) {
			if (colAreaSelect.length == 0){
				alert("Y�᲻��Ϊ��!");
				return false ;
			}
			if(colAreaSelect.split(",")[0] == rowAreaSelect.split(",")[0]){
        		alert("Y���������X�����Ѿ�����!");
           		return false;
        	}
		}
		return true;
	}

	/**�õ���ѡ���ֵ*/
	function getRadioValue(){ 
		var temp = document.forms[0].charType;
		var value = "";
	 	for (var i = 0 ; i < temp.length ; i++){ 
			//����Radio    
			if(temp[i].checked){
				return temp[i].value;
			}     
		}
	}
	
	/** У�����ֵ���ܴ���1000 ���߲���Ϊ��*/
	function  maxValue(){
	var data_begin = parseInt(document.forms[0].data_begin.value , 10 );
	if(data_begin < 1){
		alert("���ݷ�Χ��ֹ���ֵ����С��1!");
		return ;
	}
	return true;
}

	/** У�����ֵ���ܴ���2000 ���߲���Ϊ��*/
	function  data_endMaxValue(){
		var data_end = parseInt(document.forms[0].data_end.value , 10 );
		if(data_end > 2000){
			alert("���ݷ�Χ��ֹ���ֵ���ܳ���2000!");
			return ;
		}
		if(data_end < 1){
			alert("���ݷ�Χ��ֹ���ֵ����С��1!");
			return ;
		}
		return true;
	}
	
	/** ͼƬ������1500 ��С100*/
	function widthMaxValue(){
		var width = parseInt(document.forms[0].width.value , 10);
		if (width > 1500){
			alert("������Ϊ:1500!");
			return false;
		}
		if (width < 100 ){
			alert("��Ȳ���С��100!");
			return false;
		}
		return true;
	}
	
	/** ͼƬ�߶����1500 ��С100*/
	function heightMaxValue(){
		var height = parseInt(document.forms[0].height.value , 10);
		if (height > 1500){
			alert("�߶����Ϊ:1500!");
			return false;
		}
		if (height < 100 ){
			alert("�߶Ȳ���С��100!");
			return false;
		}
		return true;
	}
      
	//������ͼ y���ɵ�ѡ �����Ƕ�ѡ
	function yNomal(type, typeName){
      	var labelStr = '<c:out value="${labelStr}"></c:out>';
      	document.forms[0].title.value = labelStr + "-" + typeName;
      	
      	if (type.indexOf("MS") != -1) {
      		document.getElementById("yzhou").style.display = "";
      	} else {
      		document.getElementById("yzhou").style.display = "none";
      	}
	}
</script>
 
     
<body>
	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
	<div id='content'>
		<html:form method="post" action="/template/tpla_image_analysis.do">
		 <input type="hidden" name="tpla_sessionId" value="<c:out value='${tpla_sessionId}' />">
         <input type="hidden" name="<c:out value='${tpla_sessionId}' />" value="<c:out value='${tpla_sessionId_value}' />">
			<!-- �������� -->
			<div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out> - ͼ������</span></td>
						<td align="right">
							<input type="button"  value="�� ��" class="botton" onClick="closeFullWin(false)">
											                  </td>
					</tr>
				</table>
			</div> 
			
			<!-- ������Ϣ��ʾ�� -->
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<!-- ��ѯ������ -->
			<div class='awp_detail'>
				<table>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>ͼ�����ͣ�
						</td>
						<td colspan="3" >
							<logic:iterate id="type" name="chartTypes">
								<c:if test="${tpla_image_analysisActionForm.charType == type.key}">
									<input type="radio" name="charType" value="<bean:write name="type" property="key"/>" checked="checked"
										onclick="yNomal('<bean:write name="type" property="key"/>', '<bean:write name="type" property="value"/>')"/>
								</c:if>
								<c:if test="${tpla_image_analysisActionForm.charType != type.key}">
									<input type="radio" name="charType" value="<bean:write name="type" property="key"/>" 
										onclick="yNomal('<bean:write name="type" property="key"/>', '<bean:write name="type" property="value"/>')"/>
								</c:if>
								<bean:write name="type" property="value"/>
							</logic:iterate>
						</td>
						</tr>
						<tr>
						<td width="380">
							<font color="#FF3300">*</font>���ݷ�Χ��
						</td>
						<td colspan="3" >
							<html:text property="data_begin" style="{width:95px}" checkfunc="maxValue()" styleClass="awp_number" minlength="1" maxlength="3" warning="���ݷ�Χ��ʼ" /> - <html:text property="data_end" style="{width:95px}" checkfunc="data_endMaxValue()" styleClass="awp_number" minlength="1" maxlength="4" warning="���ݷ�Χ����" />����д��¼������ֹ��ţ����Ϊ2000��
						</td>
					</tr>
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>����(X��)��
						</td>
						<td colspan="3">
             				 <html:select  property="row_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						 </td>
					</tr>
					<tr id="yzhou" style="display:none">
						<td width="380">
							<font color="#FF3300">*</font>����(Y��)��
						</td>
						<td colspan="3">
							<html:select property="disp_cond" style="{width:210px}">
								<html:options collection="t02_tp_exec_rstList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
					</tr>
					 
					<tr>
						<td width="380">
							<font color="#FF3300">*</font>��ֵ��
						</td>
						<td colspan="3" >
            				 	<html:select  property="dataField" style="{width:210px}">
								<html:options collection="dataList" labelProperty="outcolname" property="colaliascd"/>
							</html:select>
						</td>
					</tr>
				 	<tr id="widthField" style="display:none">
				        <td width="380"><font color="#FF3300">*</font>��ȣ�</td>
				        <td colspan="3">
							<html:text property="width"   style="{width:210px}" checkfunc="widthMaxValue()" styleClass="awp_number" minlength="1" maxlength="4" warning="���" />
						</td>	
			       	  
		      		</tr> 
		       		<tr id="heightField" style="display:none">
			       		<td width="380"><font color="#FF3300">*</font>�߶ȣ�</td>
			        	<td colspan="3"><html:text property="height"  style="{width:210px}" checkfunc="heightMaxValue()"  styleClass="awp_number" minlength="1" maxlength="4" warning="�߶�"/>
						</td>	
			       	  
		       		</tr> 	 
				
					<tr id="titleField" style="display:none">
						<td width="380">
							<font color="#FF3300">*</font>���⣺
						</td>
						<td colspan="3" >
						    <html:text property ="title"  minlength="1" style="{width:210px}"  warning="����"/>
					   </td>
			   		</tr>
		        
		       		<tr id="xAxisLabelField" style="display:none">
				        <td width="380">����(X��)���⣺</td>
				        <td colspan="3">
							<html:text property="xaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
			       	  
		       		</tr> 
		       		<tr id="yAxisLabelField" style="display:none">
				        <td width="380">����(Y��)���⣺</td>
				        <td colspan="3">
							<html:text property="yaxislabel" style="{width:210px}"  maxlength="40" />
						</td>	
			       	  
		       		</tr> 
		      
					<tr>
				    	<td></td>
						<td colspan="3" align="center">
						<input type="button" name="button" value="�鿴ͼ��" onClick="showChart('<%=request.getContextPath()%>')"> 
						<input type="button" name="btnsearch" value="�߼�>>" class="botton" onClick="btnDisplayHiddenCon(this)">  
						<html:reset onclick="bgcolor()" value="�� ��"/>
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>
</html:html>
