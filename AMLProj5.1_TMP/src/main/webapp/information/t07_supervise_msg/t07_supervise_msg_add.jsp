<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit(theUrl){
var msg_name=document.forms[0].msg_name.value;
msg_name1=msg_name.replace(/[\s\u12288\u3000]*/g,'');

   var error="";
       if(msg_name1==""){
            alert("������ⲻ��Ϊ�գ�");
            return false;
            }
         if(document.forms[0].msg_type.value==""){
            alert("��ѡ�񶽰�����");
            return false;
            }

         if(document.forms[0].receipt_org.value==""){
            alert("��ѡ����ջ���");
            return false;
            }
       if(document.forms[0].msg_content.value==""){
            alert("�������ݲ���Ϊ�գ�");
            return false;
          }else{
             if(document.forms[0].msg_content.value.length>500){
                  alert("��������̫����");
                 return false;
             }
          }
          if(document.forms[0].voer_dt.value!=""){
              if(!formatDate2(document.forms[0].voer_dt.value)){
					alert("��������ȷ�����ڣ�YYYY-MM-DD��!");
					return false;
				}else 
              if(document.forms[0].voer_dt.value<document.forms[0].currdate.value){
                 alert("ʧЧ���ڲ���С�ڵ�ǰ���ڣ�");
                 return false;
              }
          }
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
   
function _submit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}

function _Onblur(pname){
   var obj=eval("document.forms[0]."+pname);
   obj.value="";
}
</script>
</head>
<body class="mainbg">
<html:form  method="post" action="/t07_supervise_msg/t07_supervise_msg_add.do" enctype="multipart/form-data"  >
  <input type="hidden" name="backurl" value="<bean:write name="backurl"/>"/>
  <input type="hidden" name="currdate" value="<bean:write name="currdate"/>"/>
  <html:hidden property="msg_mode"/>
  <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>���𶽰�</span>
	  <span class="buttons">
	   <a href="#" onclick="_submit('<%=request.getAttribute("backurl")%>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />����</a>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td ><font color="red">*</font>������⣺</td>
         <td><html:text property="msg_name" size="50" maxlength="50"/></td>
		 <td><font color="red">*</font>�������ͣ�</td>
         <td><html:select property="msg_type">
				<html:options collection="msg_typeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
        </tr>
       <tr>
		 <td><font color="red">*</font>���ջ�����</td>
         <td >
		  	 <html:text property="msg_org_name" readonly="true"/>
			<html:hidden property="receipt_org"/>
             <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=receipt_org&input_name_disp=msg_org_name','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
              </td>
		  <td>ʧЧ���ڣ�</td>
         <td>
      
          <html:text property="voer_dt" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />    
            
         </td>
        </tr>
          <tr>
	       <td>��������:</td>
         <td>
         <html:select property="case_type" >
				<html:options collection="casetypeMap" property="label"
			      labelProperty="value" />
				</html:select></td>
		   <td>�ͻ����ͣ�</td>
          <td >
           <html:select property="party_class_cd" >
				<html:options collection="clienttypeMap" property="label"
			      labelProperty="value" />
				</html:select>
          </td>
        </tr>
	        <tr>
        
		 <td><font color="red">*</font>�������ݣ�</td>
         <td colspan="3">
         <html:textarea property="msg_content" rows="6" cols="70" ></html:textarea>
        </td>
        </tr>
		
       
       <tr>
	  
		<td align="center" class="in_button" colspan="4">
		 <input name="" type="button" value="�� ��" onclick="dosubmit('t07_supervise_msg_add_do.do')" />	
		  <input name="" type="reset" value="�� ��" />		</td>
	   </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
  

