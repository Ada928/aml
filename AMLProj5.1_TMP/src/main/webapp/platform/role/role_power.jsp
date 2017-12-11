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


/** �ж��Ƿ�Ϊ��ID */
function isMyChild(myrealid,permCode){
       if(myrealid.length!=permCode.length){
          return false;
       }
       else{
         var len = myrealid.length -3;
         if(len>0){
           //�ж�myrealid����λ�Ƿ�Ϊ0
           for(var i=len;i<myrealid.length;i++){
             if(myrealid.charAt(i)!='0'){
               return false;
             }
           }
           //�ж�ǰ��λ�Ƿ���ͬ
           for(var i=0;i<len;i++){
             if(myrealid.charAt(i)!=permCode.charAt(i)){
               return false;
             }
           }
         }
       }
    return true;
}
/** �ж��Ƿ�Ϊ��ID */
function isMyParent(myrealid,permCode){
    if(myrealid.length!=permCode.length){
       return false;
    }
    else{
      var len = myrealid.length -3;
      if(len>0){
        //�ж�permCode����λ�Ƿ�Ϊ0
        for(var i=len;i<permCode.length;i++){
          if(permCode.charAt(i)!='0'){
            return false;
          }
        }
        //�ж�ǰ��λ�Ƿ���ͬ
        for(var i=0;i<len;i++){
          if(myrealid.charAt(i)!=permCode.charAt(i)){
            return false;
          }
        }
      }
    }
    return true;
}
/** ѡ������߼����� */
function checkPower(permCode){
    var myrealid = permCode.value;
    for ( var i=0; i < document.forms[0].selectedSystemkey.length; i++ ){
        if(permCode.checked){//
            if(isMyParent(myrealid,document.forms[0].selectedSystemkey[i].value)){//��ѡ����ѡ
                document.forms[0].selectedSystemkey[i].checked=true;
            }
        }else{//����ȡ������ȡ��
            if(isMyChild(myrealid,document.forms[0].selectedSystemkey[i].value)){
                document.forms[0].selectedSystemkey[i].checked=false;
            }
        }
    }
}
/** ȫѡ��ȫ�� */
function selectAllRoles(permCodeValue,seType){
    var myrealid = permCodeValue;
    for ( var i=0; i < document.forms[0].modulekey.length; i++ ){
        if(isMyChild(myrealid,document.forms[0].modulekey[i].value)){
            document.forms[0].modulekey[i].checked=seType;
        }
    }
}
/** �ж��Ƿ�ѡ����Ȩ�� */
function checkRolesChk(){
    for ( var i=0; i < document.forms[0].modulekey.length; i++ ){
        if(document.forms[0].modulekey[i].checked==true){
            return true;
        }
    }
    return false;
}

</script>
</head>
<body class="mainbg">
<html:form method="post" action="/role/role_power_do.do">
<div id="main">
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>��ɫ��Ȩ</span>
	  <span class="buttons">
	   <a href="#" onclick="dosubmit('role_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	  </span>
	</div>
  <html:errors/>
  
  <!-- table content -->
	<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
              <td><font color="#FF0000">*</font>��ɫ����</td>
              <td> <html:hidden  name="t00_role"  property="rolekey"  />
              <bean:write name="t00_role" property="rolename" scope="request"/></td>
           </tr>
           
           <tr>   
              	<td>
                  <font color="#FF0000">*</font>��ɫ����
            	</td>
              	<td >
                  <bean:write name="t00_role" property="rolelevel_disp" scope="request"/>
                </td>
            </tr>
            
            <tr>
              <td>
                  <font color="#FF0000">*</font>����ģ�飺
              </td>
              <td bgcolor="F6F9FF">
            <table cellpadding="0" cellspacing="0" border="0">
<bean:define id="systemkey" name="t00_role" property="systemkey" type="java.lang.String" scope="request"/>
<logic:iterate id="t00_module" name="moduleList" type="com.ist.platform.dto.T00_module">
   
        <logic:equal value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td colspan="2">
                    <html:multibox property="selectedSystemkey" onclick="checkPower(this)">
                    	<bean:write name="t00_module" property="modulekey"/>
                    </html:multibox>
                    <b><bean:write name="t00_module" property="modulename"/></b><br/>
                </td>
            </tr>
    	</logic:equal>
    	<logic:notEqual value="-1" name="t00_module" property="upmodulekey">
            <tr>
                <td width="20">&nbsp;</td>
                <td>
                    <html:multibox property="selectedSystemkey" onclick="checkPower(this)">
                        <bean:write name="t00_module" property="modulekey"/>
                    </html:multibox>
                    <bean:write name="t00_module" property="modulename"/>
                </td>
            </tr>
    	</logic:notEqual>

</logic:iterate>
        </table>
              </td>
            </tr>
            <tr>
	  
		<td align="center" class="in_button" colspan="4">
		 <input name="" type="button" value="�� ��" onclick="checkForm('role_power_do.do')" />	
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
      