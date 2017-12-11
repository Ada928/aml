<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language=JavaScript src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

	<script language="JavaScript">
    function dosubmit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
    }
</script>
</head>
<body class="mainbg">
      <html:form action="/user/user_list.do" method="post">
   <div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>ϵͳ���� - �û���ϸ��Ϣ</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('user_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
  <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
						�û�����
					</td>
					<td>
						<bean:write name="t00_user" property="username" scope="request"/>
					</td>
					<td>
						��ʵ������
					</td>
					<td>
						<bean:write name="t00_user" property="realname" scope="request"/>
					</td>
				</tr>
				<tr>
					<td>
						����������
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="organkey_disp" scope="request"/>
					</td>
					<td>
						״̬��
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="flag_disp" scope="request"/>
					</td>
				</tr>
				
	 <tr>
      <td>
     ��ɫ��</td>
      <td  colspan="3" style="white-space:normal;">
           <logic:iterate id="role" name="t00_user" property="roleList" type="com.ist.platform.dto.T00_com_auth">
			      	<bean:write name="role" property="rolekey_disp" scope="page"/>
			      </logic:iterate>
      </td>
    </tr>
				 <tr>
         <td>��ַ��</td>
         <td colspan="3">
         <bean:write name="t00_user" property="address" scope="request"/>
         </td>
        </tr>
		<tr>
         <td>�绰���룺</td>
         <td> <bean:write name="t00_user" property="telephone" scope="request"/>
        </td>
         <td>�ƶ��绰��</td>
         <td> <bean:write name="t00_user" property="mobilephone" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>�������룺</td>
         <td> <bean:write name="t00_user" property="postalcode" scope="request"/>
       </td>
         <td>Email��</td>
         <td> <bean:write name="t00_user" property="emailaddress" scope="request"/>
         </td>
       </tr>
       <tr>
         <td>�����ˣ�</td>
         <td> <bean:write name="t00_user" property="creator" scope="request"/>
        </td>
         <td>����ʱ�䣺</td>
         <td> <bean:write name="t00_user" property="createdate" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>����޸��ˣ�</td>
         <td> <bean:write name="t00_user" property="modifier" scope="request"/>
       </td>
         <td>����޸�ʱ�䣺</td>
         <td> <bean:write name="t00_user" property="modifydate" scope="request"/>
         </td>
       </tr>
	  
	    <tr>
         <td>������</td>
         <td colspan="3">  <bean:write name="t00_user" property="remark" scope="request"/>
       
         </td>
       </tr>
       </table>
	</div>
  </div>

<!-- all end -->   
</div>
</html:form>
</body>
</html>      
      