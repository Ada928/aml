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
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit(theUrl){
   var error="";
       if(document.forms[0].msg_name.value==""){
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
            }
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}
    function fPopUpCalendarDlg(ctrlobj)
{
	showx = event.screenX - event.offsetX - 4 - 210 ; // + deltaX;
	showy = event.screenY - event.offsetY + 18; // + deltaY;
	newWINwidth = 210 + 4 + 18;

	retval = window.showModalDialog("../../js/date.htm", "", "dialogWidth:197px; dialogHeight:210px; dialogLeft:"+showx+"px; dialogTop:"+showy+"px; status:no; directories:yes;scrollbars:no;Resizable=no; "  );
	if( retval != null ){
		ctrlobj.value = retval;
	}else{
		//alert("canceled");
	}
}
function _submit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
}


</script>
</head>
<body class="mainbg">
<html:form  method="post" action="/t07_supervise_msg/t07_supervise_msg_detail.do" enctype="multipart/form-data"  >
 
  <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>��������</span>
	  <span class="buttons">
	  <logic:equal name="flag" value="0">
	   <a href="#" onclick="_submit('<%=request.getAttribute("backurl")%>')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />����</a>
	  </logic:equal>
	  <logic:equal name="flag" value="1">
	   <a href="#" onclick="window.close()"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
	  </logic:equal>
	  </span>
	</div>
	<!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
        <tr>
         <td >������⣺</td>
         <td><bean:write name="t07_supervise_msg" property="msg_name"/></td>
		 <td>�������ͣ�</td>
         <td><bean:write name="t07_supervise_msg" property="msg_type"/>
       </td>
        </tr>
       <tr>
		 <td>���ջ�����</td>
         <td ><bean:write name="t07_supervise_msg" property="receipt_org"/>
              </td>
		  <td>ʧЧ���ڣ�</td>
         <td><bean:write name="t07_supervise_msg" property="voer_dt"/>
           
         </td>
        </tr>
        <tr>
		 <td> �������ͣ�</td>
         <td ><bean:write name="t07_supervise_msg" property="case_type_s"/>
              </td>
		  <td>�ͻ����ͣ�</td>
         <td><bean:write name="t07_supervise_msg" property="party_class_cd_s"/>
           
         </td>
        </tr>
            <tr>
		 <td>�����ˣ�</td>
         <td ><bean:write name="t07_supervise_msg" property="create_user"/>
              </td>
		  <td>����ʱ�䣺</td>
         <td><bean:write name="t07_supervise_msg" property="create_dt"/>
           
         </td>
        </tr>
	      <tr>
		 <td>�������ݣ�</td>
         <td colspan="3"><bean:write name="t07_supervise_msg" property="msg_content"/></td>
        </tr>
          <tr>
		 <td>�ظ��ˣ�</td>
         <td ><bean:write name="t07_supervise_msg" property="deal_user"/>
              </td>
		  <td>�ظ����ڣ�</td>
         <td><bean:write name="t07_supervise_msg" property="deal_dt"/>
           
         </td>
        </tr>
         <tr>
		 <td>�ظ����ݣ�</td>
         <td colspan="3"><bean:write name="t07_supervise_msg" property="dealadvise"/></td>
        </tr>
	  </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>
  

