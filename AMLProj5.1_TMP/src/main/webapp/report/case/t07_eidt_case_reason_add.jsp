<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="<%=request.getContextPath() %>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath() %>/js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
		<link rel="stylesheet"
			href="<%=request.getContextPath() %>/css/css_all.css" type="text/css" />
		<script language="JavaScript"
			src="<%=request.getContextPath() %>/js/basefunc.js"></script>
		<script language="JavaScript">


function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
    
}
function Commit(theUrl)
{
	var errMsg ="";
	var isVerifyAct_exp='<%=request.getAttribute("isVerifyAct_exp")%>';
 var actiondescrip=document.forms[0].action_descrip.value;
 var action_explain=document.forms[0].action_explain;
    if(isVerifyAct_exp=='1'){
    	if(getLength(action_explain.value)==0){
    	    errMsg+="����д������Ϊ˵����";
    	    action_explain.focus();
    	}
       }
          var inputNum = action_explain.value.replace(/[^\x00-\xff]/g, "**").length; 
    if (inputNum>500) {
        errMsg = "������Ϊ˵�����Ȳ��ܶ���500���ַ�,250�����֣�";  
����������action_explain.focus();
    }

    if(getLength(actiondescrip)==0){
       errMsg = "������Ϊ��������Ϊ�գ�";
        document.forms[0].action_descrip.focus();
    }
   
    if(!checkNullAndLen(document.forms[0].take_action.value,0,500)){
       errMsg = "��ȡ��ʩ����Ϊ���ҳ��Ȳ��ܶ���128���ַ�,64�����֣�";
        document.forms[0].take_action.focus();
    }
   
    if (errMsg != "") {
        alert(errMsg);
        return false;
    } else {
    	if(isVerifyAct_exp=='1')
        {
    		if(confirm("'��Ϊ˵��'�Ƿ���ӵ�'��Ϊ����'�У�")){
        		var temp_str = actiondescrip.substring(actiondescrip.indexOf("2."),actiondescrip.length);
    			document.forms[0].action_descrip.value = "1." + document.forms[0].action_explain.value + '\n' + temp_str;
            }
             inputNum = actiondescrip.replace(/[^\x00-\xff]/g, "**").length; 
             if (inputNum>500) {
             if(confirm("������Ϊ����̫���Ƿ����ɸ���?")){
              }else{
                 return false;
              }
             }
               
����������
                
        }
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	   var obj = window.parent;
	   aa();
    }
   
}
function _Click(constant,type){
    var distype="";
    
    var temp=document.getElementsByName("distype"); 
     for (i=0;i<temp.length;i++){ 
        if(temp[i].checked)distype=temp[i].value ;
     }
    if(distype==2){
      if(type==1){
       document.forms[0].action_descrip.value=document.forms[0].action_descrip.value+constant;
      }else{
       document.forms[0].take_action.value=document.forms[0].take_action.value+constant;
     }
   }else{
     if(type==1){
       document.forms[0].action_descrip.value=constant;
      }else{
       document.forms[0].take_action.value=constant;
     }
   }
}
function aa(){
    window.parent.document.getElementById("maskLevel").style.zIndex="-20000";
    window.parent.document.getElementById("ym-window").style.zIndex="-10000";
    window.parent.ymPrompt.close();   
}
</script>
	</head>

	<body class="mainbg">
		<html:form method="post" action="/case/addT07_case_ky_msgDO.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>��ӿ��ɳ̶ȵ������Ϣ</span>
						<span class="buttons">	
						   <a href="#" onclick="Commit('addT07_case_ky_msgDO.do');">
							  <img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��
						   </a> 					  
					        <a href="#" onclick="aa();">
							   <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��
							</a> 
					    </span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									���ɳ̶ȣ�
								</td>
								<td>
									<html:select property="alert_level">
										<html:options collection="alert_levelMap" property="label" labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									ģ����ط�ʽ��
								</td>
								<td>
									<input type="radio" checked="checked" name="distype" value="1" />
									����
									<input type="radio" name="distype" value="2" />
									׷��
								</td>
							</tr>
							<tr>
								<td>
									������Ϊ˵����
								</td>
								<td>
									<html:textarea styleId="action_explain" property="action_explain" cols="49" rows="3">
									<bean:write name="t07_case_applicationActionForm" property="action_explain" />
									</html:textarea>
								</td>
							</tr>
							<tr>
								<td>
									������Ϊ������
								</td>
								<td>
									<html:textarea styleId="action_descrip" property="action_descrip" cols="49" rows="3">
										<bean:write name="t07_case_applicationActionForm" property="action_descrip" />
									</html:textarea>
									<font color="#FF0000">* </font>
									<a href="#" onClick="locate_pop_window('<%=request.getContextPath()%>','t21_actioncodeLocation','checkbox','forms[0]','action_descrip,action_descrip','');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />������ɽ�����Ϊ</span></a>
								</td>
							</tr>
							<tr>
								<td>
									������Ϊ����ģ�壺
								</td>
								<td>
									<logic:iterate id="temp" name="templetlist" type="com.ist.platform.dto.T07_nbs_templet">
										<logic:equal property="templet_type" name="temp" value="2">
											<input type="radio" name="num2" value="<%=temp.getTemplet_num()%>"
												onclick="_Click('<bean:write name="temp" property="templet_constant" />','1')" />
											<bean:write name="temp" property="templet_title" />&nbsp;
											<br/>
                                        </logic:equal>
									</logic:iterate>
								</td>
							</tr>
<%--							<tr>--%>
<%--								<td>--%>
<%--									������Ϊ����������Ϊ������ʾ--%>
<%--								</td>--%>
<%--						--%>
<%--								<td>--%>
<%--									���轫��Ͽͻ���ݽ��з�����Ľ�����д�ڿհ״�--%>
<%--								</td>--%>
<%--							</tr>--%>
							<tr>
								<td>
									��ȡ��ʩ(��Ϣ�����ο�)��
								</td>
								<td>
									<html:textarea styleId="take_action" property="take_action" cols="49" rows="3">
										<bean:write name="t07_case_applicationActionForm" property="take_action" />
									</html:textarea>
									<font color="#FF0000">*</font>
								</td>
							</tr>
							<tr>
								<td>
									��ȡ��ʩģ�壺
								</td>
								<td>
									<logic:iterate id="temp" name="templetlist" type="com.ist.platform.dto.T07_nbs_templet">
										<logic:equal property="templet_type" name="temp" value="1">
											<input type="radio" name="num1" value="<%=temp.getTemplet_num()%>" onclick="_Click('<bean:write name="temp" property="templet_constant" />','2');"/>
											<bean:write name="temp" property="templet_title" />
											<br/>
                                        </logic:equal>
									</logic:iterate>
								</td>
							</tr>
							<html:hidden property="cast_type" name="t07_case_applicationActionForm" />
							<!--  <tr>
								<td align="center" colspan="2">
									<input type="button" name="button3" class="in_button1"
										value="�� ��" onclick="Commit('addT07_case_ky_msgDO.do');" />
								</td>
							</tr>-->
						</table>
					</div>
				</div>
			</div>
		</html:form>
	</body>
</html>
