<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl,str){
	if(str=="back"){
		document.forms[0].action=theUrl;
        document.forms[0].submit();
	}
	var v =document.forms[0].outcolcd.value;
	var m=0;
	var n=0;
	
	for(i=0;i<v.length;i++){
	
	if(v.charAt(i)=='(')
	m++;
	if(v.charAt(i)==')')
	n++;	
	}
	if( m>n){
	alert("ȱ�������ţ����飡");
	return;
	}
	else if(m<n)
	{
		alert("ȱ�������ţ����飡");
		return;
	}
   document.forms[0].action=theUrl;
   document.forms[0].submit();
   
   }
function checkForm(theUrl){
       var errMsg ="";
       
       if(errMsg!=""){
           alert(errMsg);
           return false;
       }else{
           document.forms[0].action=theUrl;
           document.forms[0].submit();
       }
}
//String.prototype.trim = function()
//{
//	var reExtraSpace = /^\s*(.*?)\s+$/;
//	return this.replace(reExtraSpace,"$1");
//}
String.prototype.Trim = function()
����{
���� return this.replace(/(^\s*)|(\s*$)/g, "");
����}
String.prototype.LTrim = function()
����{
���� return this.replace(/(^\s*)/g, "");
����}
String.prototype.Rtrim = function()
����{
���� return this.replace(/(\s*$)/g, "");
����}
function isDigit(s) {
 	var patrn=/^(0|[1-9][0-9]*)$/; 
 	if (!patrn.exec(s)){
 		return false ;
 	}
 	return true;
  }
function isNumeric(s) {
 	var patrn=/^(-|\+)?\d+(\.\d+)?$/ ; 
 	if (!patrn.exec(s)){
 		return false ;
 	}
 	return true;
  }  



function addsign(sourceName,aimName1,aimName2)
{
	 var sourceValue=sourceName.value.Trim();
	 var aimValue1=aimName1.value.Trim();
	 var aimValue2=aimName2.value.Trim();
	 var lastchar=aimValue1.charAt(aimValue1.length-1);
	 if(sourceValue==")"&&aimValue1.indexOf("(")==-1){
		 alert("����������)������������ֵ����ţ�");
	 	return false;
	 }
	 if(sourceValue!="("&&aimValue1.length==0){
	    alert("�������������������������ʽ!");
	 	return false;
	 }
	 if(lastchar=="+"||lastchar=="-"||lastchar=="*"||lastchar=="/"){
	 	if(sourceValue=="("){
	 		aimName1.value=aimValue1+" "+sourceValue;
	 		aimName2.value=aimValue2+" "+sourceValue;
	 	}else{
	 		alert("�������������������������ʽ��");
	 	}	
	 }
	 else if((lastchar=="("&&sourceValue==")")||(lastchar==")"&&sourceValue=="(")){
	 	alert("�������������������������ʽ��");
	 }else if(lastchar=="("&&(sourceValue=="+"||sourceValue=="-"||sourceValue=="*"||sourceValue=="/")){
	 	alert("�������������������������ʽ��");
	 }else if(sourceValue=="("&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("&&lastchar!=""){
	 	alert("���������������");
	 }
	 else{
	 	aimName1.value=aimValue1+" "+sourceValue;
	 	aimName2.value=aimValue2+" "+sourceValue;
	 }
}
function addnum(sourceName,aimName1,aimName2)
{
	var sourceValue=sourceName.value.Trim();
	var aimValue1=aimName1.value.Trim();
	var aimValue2=aimName2.value.Trim();
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	//alert(sourceValue);
	if(isNumeric(sourceValue)){
		if(aimValue1.length!=0&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("){
			alert("��������ţ�");
		}else{
			aimName1.value=aimValue1+" "+sourceValue;
			aimName2.value=aimValue2+" "+sourceValue;
		}
		
	}else{
	alert("����������ֲ��Ϸ������������룡");
	}
}
function addcol(sourceName,aimName1,aimName2)
{
	//var str=document.forms[0].colenname.options[document.forms[0].colenname.selectedIndex].text;
	var sourceID=document.getElementsByName(sourceName);
	var textarea_str1 = document.getElementById(aimName1);
	var textarea_str2 = document.getElementById(aimName2);
	var sourceValue = sourceID[0].value.Trim();
	var array_value=sourceValue.split(",");
	var sourceValue1=array_value[1];
	var sourceValue2=array_value[0];	
	var aimValue1=textarea_str1.value.Trim();
	var aimValue2=textarea_str2.value.Trim();
	var lastchar=aimValue1.charAt(aimValue1.length-1);
	if(aimValue1.length!=0&&lastchar!="+"&&lastchar!="-"&&lastchar!="*"&&lastchar!="/"&&lastchar!="("){
			alert("��������ţ�");
	}else{
		textarea_str1.value=aimValue1+" "+sourceValue1;
		textarea_str2.value=aimValue2+" "+sourceValue2;
	}
}
function checkradio(orderID1,orderID2){
	//document.getElementById('textid1').style.display=checked?'':'block';
	var checkID1=document.getElementById(orderID1);
	var checkID2=document.getElementById(orderID2);
	checkID1.style.display='inline';
	checkID2.style.display='none';
}
function addFunc(sourceName,aimName1,aimName2){
	var sourceID=document.getElementsByName(sourceName);
	var sourceValue = sourceID[0].value.Trim();
	var array_value=sourceValue.split(",");
	var count=array_value[1];
		for(i=1;i<=5;i++)
	{
		var str="paraid"+i;
		eval(str+".style.display='none'");
	}
	//alert("��Ҫ��� "+count+" ������");
	for(i=1;i<=count;i++)
	{
		var str="paraid"+i;
		eval(str+".style.display='inline'");
	}
	
}

/**
   * У���ַ��Ƿ�Ϊ��ĸ
   * @param s
   * @return boolean
   */
function checkChar123(s) {
	var ln = 0, i = 0;
	var t = "";
	if (s.length != len(s)||s.length==0||s.Trim()=="") {
		return false;
	}
	for (i = 0; i < s.length; i++) {
		c = s.charAt(i);
	if (c >= "0" && c <= "9") {
			continue;
		}
		if (c >= "A" && c <= "Z") {
			continue;
		}
		if (c >= "a" && c <= "z") {
			continue;
		}
		if (c == "_" || c <= "-"||c == "."||c=="*") {
			continue;
		}
		return false;
	}
	return true;
}

//�ж����ְ���С��

function checkFloat123(s) {
	var ln = 0, i = 0;
	var t = "";
	if (s.length != len(s)||s.length==0||s.Trim()=="") {
		return false;
	}
		if(s.charAt(0)=='0'&&s.charAt(1)!='.')
	{
		return false;
	}
if(s.charAt(0)=='0'&&s.length==1)
	{
		return false;
	}
	
	if((s.charAt(1)=='.'||s.charAt(0)=='.')&&s.length<=2)
	{
		return true;
	}
			
	for (i = 0; i < s.length; i++) {
		c = s.charAt(i);
	if (c >= "0" && c <= "9") {
			continue;
		}
		return false;
	}
	return true;
}
function joinfunc(sourceName,aimName1,aimName2){
	var sourceID=document.getElementsByName(sourceName);
	var sourceValue = sourceID[0].value.Trim();
	var textarea_str1 = document.getElementById(aimName1);
	var textarea_str2 = document.getElementById(aimName2);
	var array_value=sourceValue.split(",");
	var count=array_value[1];
	var funcname=array_value[0];
	//�ַ������ֱ�ʶ
	var flags=array_value[2];
//alert("flag="+flags.charAt(0));
	//���ʽ ���һ��
	 var lastchar=textarea_str1.value.charAt(textarea_str1.value.length-1);
	 //alert(lastchar);
	 if(lastchar=="+"||lastchar=="-"||lastchar=="*"||lastchar=="/"||lastchar=="("||lastchar=="")
	 {
			for(i=1;i<=count;i++)
			{	
				var flag=flags.charAt(i-1);
				//alert("flag="+flag);
				var text_str="textid"+i;
				var col_str="colenname"+i;
				var col_array=eval("document.forms[0]."+col_str+".value").split(",");
				if(eval("document.forms[0]."+text_str+".style.display=='inline'"))
				{
					if(flag==1){
						if(isDigit(eval("document.forms[0]."+text_str+".value"))){
							//alert("v==="+eval("document.forms[0]."+text_str+".value"));
						}
						else{
							alert("������ĵ�"+i+"�������Ϸ������������֣�");
							//alert("vcuo����==="+eval("document.forms[0]."+text_str+".value"))
							//reback(textarea_str1,textarea_str2);
							return;
						}
					}
					else
					{
						if(checkChar123(eval("document.forms[0]."+text_str+".value"))){	
							//alert("v==="+eval("document.forms[0]."+text_str+".value"));
						}else{
							//alert("vcuo�ַ�==="+eval("document.forms[0]."+text_str+".value"))
							alert("������ĵ�"+i+"�������Ϸ����������ַ���");
							return;
						}
					}
				}
				else{
					if(flag==1){
						alert("������ĵ�"+i+"�������Ϸ������������֣�");
						//alert("vcuo����==="+eval("document.forms[0]."+text_str+".value"))
						
						return;
					}
					else {
						if(eval("document.forms[0]."+col_str+".value")==""){
							alert("��ѡ���"+i+"��������ֵ��");
							//alert("��ѡ���"+i+"��������ֵ=="+eval("document.forms[0]."+col_str+".value"))
							return;
						}
					}
				}
		}

	for(i=1;i<=count;i++)
	{	
		var flag=flags.charAt(i-1);
		//alert("flag="+flag);
		var text_str="textid"+i;
		var col_str="colenname"+i;
		var col_array=eval("document.forms[0]."+col_str+".value").split(",");
		
		
		if(i==1)
		{  
			if(eval("document.forms[0]."+text_str+".style.display=='inline'"))
			{
				if(flag==0){
				textarea_str1.value=textarea_str1.value.Trim()+" "+funcname+"('"+eval("document.forms[0]."+text_str+".value")+"',";
				textarea_str2.value=textarea_str2.value.Trim()+" "+funcname+"('"+eval("document.forms[0]."+text_str+".value")+"',";
				}
				else{textarea_str1.value=textarea_str1.value.Trim()+" "+funcname+"("+eval("document.forms[0]."+text_str+".value")+",";
				textarea_str2.value=textarea_str2.value.Trim()+" "+funcname+"("+eval("document.forms[0]."+text_str+".value")+",";
				
				}
			}else{
				textarea_str1.value=textarea_str1.value.Trim()+" "+funcname+"("+col_array[1]+",";
				textarea_str2.value=textarea_str2.value.Trim()+" "+funcname+"("+col_array[0]+",";
			}
		}
		else
		{
		  
			if(eval("document.forms[0]."+text_str+".style.display=='inline'"))
			{if(flag==0){
				textarea_str1.value=textarea_str1.value.Trim()+"'"+eval("document.forms[0]."+text_str+".value")+"',";
				textarea_str2.value=textarea_str2.value.Trim()+"'"+eval("document.forms[0]."+text_str+".value")+"',";
				}
				else{
				textarea_str1.value=textarea_str1.value.Trim()+eval("document.forms[0]."+text_str+".value")+",";
				textarea_str2.value=textarea_str2.value.Trim()+eval("document.forms[0]."+text_str+".value")+",";
				
				}
			}else{
				textarea_str1.value=textarea_str1.value.Trim()+col_array[1]+",";
				textarea_str2.value=textarea_str2.value.Trim()+col_array[0]+",";
			}
		}	
	}
			var str1=textarea_str1.value.Trim();
			var str2=textarea_str2.value.Trim();
			textarea_str1.value=str1.substring(0,str1.length-1)+")";
			textarea_str2.value=str2.substring(0,str2.length-1)+")";
	 	}else{
	 		alert("������������ʽ���������������");
	 	}	

}
function reback(aimName1,aimName2){
	 var str1=aimName1.value.Trim();
	 var str2=aimName2.value.Trim();
	 //var arraystr=str.split(" ");
	 //for(i=0;i<=arraystr.length-1;i++){
		//alert(str1[i]);
	 //}
	 var str11=str1.substring(0,str1.lastIndexOf(" "));
	 var str22=str2.substring(0,str2.lastIndexOf(" "));
	 aimName1.value=str11;
	 aimName2.value=str22;
}


</SCRIPT>
	</HEAD> 
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_exec_rst_add.do">
			<html:hidden property="tplakey" />
			
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">ģ�͹��� - ��Ӽ�����</span></td>
						<td align="right">
							 <input type=button value="�� ��" name=Button52 class="input"
							onClick="dosubmit('t02_tp_exec_rst_add_do.do','sub')">
						<input type=button value="�� ��" name=Button522 class="input"
							onClick="dosubmit('t02_tp_exec_rst_list.do','back')">					                  </td>
					</tr>
				</table>
			</div>     
			
			<div class="awp_detail">
			<table>
								<tr >
									<td nowrap>
										���������ƣ�
									</td>
									<td >
										<html:text value="" size="28" property="outcolname"
											styleClass="text_white" maxlength="64"></html:text>
									</td>
								</tr>
								<tr>
									<td nowrap>
										�����ͣ�
									</td>
									<td >
										<html:select property="coldatatype">
											<html:options collection="coltypeMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
								<tr >
									<td  nowrap>
										������ʽ��
									</td>
									<td >
										<html:textarea readonly="true" value="" property="pseudocode"   
											cols="100" rows="10" styleClass="text_white"></html:textarea>
										<html:textarea style="display:none" readonly="true" value="" 
											property="outcolcd" cols="100" rows="10"
											styleClass="text_white"></html:textarea>
									</td>
								</tr>
								<tr>
									<td  nowrap>
										&nbsp;
									</td>
									<td >
										�� �� �У�&nbsp;&nbsp;
										<html:select property="colenname"
											onchange="addcol('colenname','outcolcd','pseudocode')">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>

								<tr>
								<td></td>
									<td >
										��ѡ������
										<html:select property="function"
											onchange="addFunc('function')">
											<html:options collection="funcMap" property="label"
												labelProperty="value"></html:options>
										</html:select>
									</td>
								</tr>

								<tr style="display:none" id="paraid1" >
								<td></td>
									<td >
										����1��ֵ����
										<input type="radio" name="para1" id="radioid1" 
											onclick="checkradio('textid1','colenname1')">
										�в���
										<input type="radio" name="para1" checked
											onclick="checkradio('colenname1','textid1')">
										<html:select property="colenname1">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
										<input style="display:none" type="text" name="textfield" id="textid1">
									</td>
								</tr>
								<tr style="display:none" id="paraid2">
								<td></td>
									<td >
										����2��ֵ����
										<input type="radio" name="para2" checked
										onclick="checkradio('textid2','colenname2')">
										�в���
										<input type="radio" name="para2"
										onclick="checkradio('colenname2','textid2')">
										<html:select property="colenname2" style="display:none">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
										<input style="display:inline" type="text" name="textfield" id="textid2">
									</td>
								</tr>
								<tr style="display:none" id="paraid3">
								<td></td>
									<td >
										����3��ֵ����
										<input type="radio" name="para3" checked
										onclick="checkradio('textid3','colenname3')">
										�в���
										<input type="radio" name="para3"
										onclick="checkradio('colenname3','textid3')">
										<html:select property="colenname3" style="display:none">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
										<input style="display:inline" type="text" name="textfield" id="textid3">
									</td>
								</tr>
								<tr style="display:none" id="paraid4">
								<td></td>
									<td >
										����4��ֵ����
										<input type="radio" name="para4" checked
										onclick="checkradio('textid4','colenname4')">
										�в���
										<input type="radio" name="para4"
										onclick="checkradio('colenname4','textid4')">
										<html:select property="colenname4" style="display:none">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
										<input style="display:inline" type="text" name="textfield" id="textid4">
									</td>
								</tr>
								<tr style="display:none" id="paraid5">
								<td></td>
									<td >
										����5��ֵ����
										<input type="radio" name="para5" checked
										onclick="checkradio('textid5','colenname5')">
										�в���
										<input type="radio" name="para5"
										onclick="checkradio('colenname5','textid5')">
										<html:select property="colenname5" style="display:none">
											<html:options collection="colMap" property="label"
												labelProperty="value" />
										</html:select>
										<input style="display:inline" type="text" name="textfield" id="textid5">
									</td>
								</tr>
								<tr>
									<td></td>
									<td    align="left">
										<input type="button" name="Submit432" value="�� ��"
											class="input" onClick="joinfunc('function','outcolcd','pseudocode')">
									</td>
								</tr>
								<tr>
									<td></td>
									<td height="24"   align="left">
									
										ѡ���������
										<input type="button" name="Submit_add" value=" + "
											class="input"
											onClick="addsign(Submit_add,outcolcd,pseudocode)">
										<input type="button" name="Submit_minus" value=" - "
											class="input"
											onClick="addsign(Submit_minus,outcolcd,pseudocode)">
										<input type="button" name="Submit_multiply" value=" * "
											class="input"
											onClick="addsign(Submit_multiply,outcolcd,pseudocode)">
										<input type="button" name="Submit_divide" value=" / "
											class="input"
											onClick="addsign(Submit_divide,outcolcd,pseudocode)">

										<input type="button" name="Submit_left" value=" ( "
											class="input"
											onClick="addsign(Submit_left,outcolcd,pseudocode)">
										<input type="button" name="Submit_right" value=" ) "
											class="input"
											onClick="addsign(Submit_right,outcolcd,pseudocode)">
									</td>
								</tr>

								<tr>
									<td></td>
									<td   align="left">
								
										��������ֵ��
										<html:text property="numvalue" styleClass="text_white">
										</html:text>
										<input type="button" name="Submit432" value="�� ��"
											class="input" onClick="addnum(numvalue,outcolcd,pseudocode)">
										<input type="button" name="Submit432" value="�� ��"
											class="input" onClick="reback(outcolcd,pseudocode)">
									</td>
								</tr>
							</table>
						</div>
       
			
			
		</html:form>
		</div>
	</BODY>
</HTML>
