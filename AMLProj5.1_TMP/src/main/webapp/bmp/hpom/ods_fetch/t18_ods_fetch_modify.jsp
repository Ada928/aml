<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
		}
	function checkForm(theUrl){
	    var errMsg ="";
		var isfetch = document.getElementsByName("fetchmethod")[0].value;
	 	if(getLength(document.forms[0].tableename.value) == 0){
	        errMsg+=" ��������Ϊ�գ�";
	        document.forms[0].tableename.focus();
	    }else if(getLength(document.forms[0].tableename.value)>32){
	        errMsg+="�������ܶ���32���ַ���";
	        document.forms[0].tableename.focus();
	    } else if(getLength(isfetch) ==0){
	        	errMsg+="ж�ط�ʽ����Ϊ�գ�";
	        	document.forms[0].fetchmethod.focus();
	    	}
	    //client
		if(isfetch=="0"){
			if(getLength(trim(document.forms[0].shfilename.value)) ==0){
	        	errMsg+="�ű��ļ�������Ϊ�գ�";
	        	document.forms[0].shfilename.focus();
	    	}else if(getLength(document.forms[0].shfilename.value) >64){
	        	errMsg+="�ű��ļ������ܶ���64���ַ���";
	        	document.forms[0].shfilename.focus();
	    	} 
	    	
		}
		if(isfetch=="1"){
			if(getLength(document.forms[0].colnum.value) ==0){
	        	errMsg+="����������Ϊ�գ�";
	        	document.forms[0].colnum.focus();
	    	}else if(getLength(document.forms[0].sepchar.value) ==0){
	        	errMsg+="�ļ��ָ�������Ϊ�գ�";
	        	document.forms[0].sepchar.focus();
	    	}else if(getLength(document.forms[0].sepchar.value) >6){
	        	errMsg+="�ļ��ָ������ܶ���6���ַ���";
	        	document.forms[0].sepchar.focus();
	    	}else if(getLength(document.forms[0].fetchsql.value)==0){
	        	errMsg+="ж��sql����Ϊ�գ�";
	        	document.forms[0].fetchsql.focus();
	    	}else if(getLength(document.forms[0].fetchsql.value) >1024){
	        	errMsg+="ж��sql���ܶ���1024���ַ���";
	        	document.forms[0].fetchsql.focus();
	    	}
		}
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	    	document.forms[0].shfilename.value=trim(document.forms[0].shfilename.value);
	    	document.forms[0].shcontent.value=trim(document.forms[0].shcontent.value);
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
		function isfetch(t) {
			var isfetch = t.value;
			//client		
			if (isfetch == '0') {
				document.getElementById("shfilename").style.display = "";
				document.getElementById("shcontent").style.display = "";
				document.getElementById("colnum").style.display = "none";
				document.getElementById("sepchar").style.display = "none";
				document.getElementById("sql").style.display = "none";
			}
			//jdbc
			if (isfetch == '1') {
				document.getElementById("shfilename").style.display = "none";
				document.getElementById("shcontent").style.display = "none";
				document.getElementById("colnum").style.display = "";
				document.getElementById("sepchar").style.display = "";
				document.getElementById("sql").style.display = "";
			}
		}
	</SCRIPT>
	
</head>
<body >
	<html:form action="/hpom/t18_ods_fetch_modify.do" method="POST">
	 <div class="conditions">
	 <div class="cond_t">
	    <span>����ж�ؽű����� - �޸�</span>
	    <span class="buttons">
	       <a href="javascript:void(0);" onClick="checkForm('t18_ods_fetch_modify_do.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
		   <a href="javascript:void(0);" onClick="dosubmit('t18_ods_fetch_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	    </span>
	 </div>
	 
     
	<div  class='cond_c2'>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td noWrap>
          	<font color="#FF0000">*</font>������
          </td>
          <td><html:text property="tableename" styleClass="text_white" size="30" readonly="true" />
          </td>
        </tr>
        <tr>
          <td noWrap><font color="#FF0000">*</font>ж�ط�ʽ��</td>
          <td><html:select property="fetchmethod" onchange="isfetch(this)"  disabled="true">
					<html:options collection="fetchMap" property="label" 
						labelProperty="value" />
			</html:select>
         </td>
        </tr>
        <tr id="shfilename">
          <td noWrap><font color="#FF0000">*</font>�ű��ļ�����</td>
          <td><html:text property="shfilename" styleClass="text_white" size="30" readonly="true"/>
          </td>
        </tr>
        <tr id="shcontent">
          <td noWrap>�ű����ݣ�</td>
          <td><html:textarea property="shcontent" cols="6" rows="15" style="width=600"></html:textarea>
         </td>
        </tr>
        <tr id="colnum">
          <td noWrap><font color="#FF0000">*</font>��������</td>
          <td><html:text property="colnum" styleClass="text_white" size="30" />
         </td>
        </tr>
         <tr id="sepchar">
          <td noWrap><font color="#FF0000">*</font>�ļ��ָ�����</td>
          <td><html:text property="sepchar" styleClass="text_white" size="30" />
         </td>
        </tr>
        <tr id="sql">
          <td noWrap><font color="#FF0000">*</font>ж��sql��</td>
          <td><html:textarea property="fetchsql" cols="6" rows="10" style="width=670"></html:textarea>
         </td>
        </tr>
      </table>
	  </div>
	  </div>
	</html:form>
</body>
<script type="text/javascript">	
	isfetch(document.getElementsByName("fetchmethod")[0]);
</script>
</html>