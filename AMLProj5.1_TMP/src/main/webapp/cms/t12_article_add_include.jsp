<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ page import="com.ist.cms.dto.T12_programa" %>
<%@page import="org.apache.commons.lang.StringUtils"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<%@ page import="com.ist.cms.common.constant.CmsConstant" %>
<%@ include file="../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
      <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/jquery-ui.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
			<script type="text/javascript"
			src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
			<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	//�����ͻ
	jQuery.noConflict();
		function showContentOrFile(value) {
		    if(value == "1") {//��ʾ��������
		        document.getElementById("contents").style.display = "block";
		        document.getElementById("file").style.display = "none";
		    }else {//��ʾ�����ϴ�
		        document.getElementById("contents").style.display = "none";
		        document.getElementById("file").style.display = "block";
		    }
		}
		function   savePos(oE)   
		{   
			if(oE.createTextRange){         
				oE.caretPos   =   document.selection.createRange().duplicate();  
			}
		} 
		
	  function   copychar(from ,to)   
	   
	  {    
            if (from == "") {
         	    //alert("��ѡ��");
         	    return ;
            }
			var parvalueStr = from;
		    var parlength = getLength(parvalueStr);
		    var parvalue = parvalueStr.substr(0, parlength);
		    
		    var text = "<%=CmsConstant.SPLITER_BEGIN%>" + parvalue + "<%=CmsConstant.SPLITER_END%>";
			var textEl = document.getElementById(to);
	
	        if(textEl.createTextRange   &&   textEl.caretPos)   
	        {   
	              var   caretPos   =   textEl.caretPos;   
	              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
	        }   
	        else   
	              textEl.value     =   text;   
 	 } 
  	// ��λ��ҳ����ҳ������������������������趨ѡ�����б���ʱ��
      function setSelectOption(elementName, value, text) {
          var oSelect = document.getElementById(elementName);
          var option = document.createElement("option");
          option.text = text;
          option.value = value + ":" + text;
          oSelect.add(option);
      } 
      //ɾ��select��Ԫ��
      function delSelectOption (elementName, value) {
        var oSelect = document.getElementById(elementName);
      	var length = oSelect.options.length - 1;    
	     for(var i = length; i >= 0; i--){  
	         if(oSelect[i].value.indexOf(value) != -1){  
	            var textValue = "<%=CmsConstant.SPLITER_BEGIN%>" + oSelect[i].value + "<%=CmsConstant.SPLITER_END%>"; 
	            var content =  document.getElementById('D_ARTICLECON').value;
	            while (content.indexOf(textValue) != -1) {
	            	content = content.replace(textValue ,"");
	            }
	            document.getElementById('D_ARTICLECON').value =  content;
	            oSelect.options[i] = null; 
	         }    
	     }    
      }
      //
      //У���������ݸ�ʽ
function checkforms (url) {
	if(exist('D_ARTICLECON')){ 
	      var content =  document.getElementById('D_ARTICLECON').value;//��������
	      var arrStr = content.split("<%=CmsConstant.SPLITER_END%>");
	      for (var i = 0;i < arrStr.length ; i++) {
	  	 	 var arrvalue = arrStr[i];
		  	 arrvalue = arrvalue.replace("<%=CmsConstant.SPLITER_BEGIN%>","");
		  	 if (arrvalue.indexOf("<%=CmsConstant.SPLITER_BEGIN%>") != -1){
		  	 	 alert("�ļ����ݸ�ʽ����ȷ!");
		  	 	return;
		  	 }
	  	}
	}
  	if(!checkTextArea()) return ;
  	if(!checkText()) return ;
  	if (<c:out value="${isartcategory} "/>==1&&document.getElementById("bookkey").value==1&&getLength(trim(document.forms[0].artcategorykey.value))==0) {
  		document.forms[0].artcategorykey.focus();
		alert("ѡ�����������Ϊ��!!");
		return;
	}
	avpCondSubmit(url);//�ύ
}
function exist(id){
    var s=document.getElementById(id);
    if(s)
 {
  return true;
 }
    else
 {
  return false;
 }
   }


function checkTextArea() {//У���ı����Ƿ񳤶��Ƿ񳬹���󳤶�
    var flag = true;
    var ta = document.getElementsByTagName('textarea');
    for(var i = 0; i < ta.length; i++ ) {
       var obj = ta[i];
       if(getLength(obj.value) > obj.maxlength ) {
           alert("["+obj.title+"]���ַ�����["+getLength(obj.value)+"]������󳤶�["+obj.maxlength+"]��");
           obj.focus();
           flag = false;
           break;
       };       
    }
    return flag;
}

function checkText() {//У���ı�������Ƿ񳤶��Ƿ񳬹���󳤶�
    var flag = true;
    var ta = document.getElementsByTagName('input');
    for(var i = 0; i < ta.length; i++ ) {
       var obj = ta[i];
       if(obj.type != 'text')continue;//�����ı����벻���ж� 
       if(obj.readOnly)continue;//ֻ�������ж�
       if(getLength(obj.value) > obj.maxLength ) {
           alert("["+obj.title+"]���ַ�����["+getLength(obj.value)+"]������󳤶�["+obj.maxLength+"]��");
           obj.focus();
           flag = false;
           break;
       };
    }
    return flag;
}
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
			if(confirm('�����Ҫɾ����')){
			isSub = true;
		}
		}
	}
	else if( type=='save' ){
		if (<c:out value="${isartcategory} "/>==1&&getLength(trim(document.forms[0].categorykey.value))==0&&getLength(trim(document.forms[0].artcategorykey.value))==0&&document.getElementById("bookkey").value=="1") {
	  		document.forms[0].artcategorykey.focus();
			alert("ѡ�����������Ϊ��!!");
			return;
		}
		if(!checkTextArea()) return ;
	  	if(!checkText()) return ;
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
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
<div class='awp_detail'>
	<table>
				
	    <tr>
	        <html:hidden property="programakey" />
            <html:hidden property="articlekey" />
            <input type="hidden" value="1" id="isBack" name="isBack"/>
			<td>��Ŀ���ƣ�</td>
			<td>
			    <bean:write property="programaname" name="t12_programa" ignore="true"/> 
			</td>
		</tr>
		 <!-- ѡ��������� -->
		 <logic:equal value="1" name="isartcategory">
			   <tr>
			       <td><font color="red" style="color: red">*</font>ѡ���������</td>
				   <td>
				     <html:text property="artcategorykey" readonly="true" size="8"/>
				     <html:text property="artcategorykey_disp" readonly="true"></html:text> 
				     <logic:equal value="" name="categorykey">
					<input type="hidden" id = "bookkey" value="1"/>
				     	<input type="button" name="locate" value="�� ѡ" class="input" onclick="locate_tree_window('<%= request.getContextPath() %>','<%= request.getAttribute("menu_id") %>','forms[0]','artcategorykey,artcategorykey_disp','lastradio','&programakey=<bean:write name="t12_articleActionForm" property="programakey" />');return false;" />
				   	 </logic:equal>
				   </td>
			   </tr>	
			   <logic:notEqual value="" name="categorykey">
			   <input type="hidden" id = "bookkey" value="0"/>
					<html:hidden property="artcategorykey"/>
					<html:hidden property="artcategorykey_disp" />
			</logic:notEqual>  
		</logic:equal>
		<%=request.getAttribute("htmlStr0") %>
		<%=request.getAttribute("htmlStr1") %>
	</table>
			<% 
				List t12_programa_attachtypeList = (List)request.getAttribute("t12_programa_attachtypeList");
				if(StringUtils.isNotBlank((String)request.getAttribute("htmlStr1"))){
				if(t12_programa_attachtypeList == null && t12_programa_attachtypeList.size() <= 0){
			%>
				<jsp:include page="../cmp/attachment/attach_include.jsp" />
			<%}else{ %>
				<jsp:include page="../cmp/attachment/attach_include_n.jsp" />
			<% }}%>
		
</div>

		