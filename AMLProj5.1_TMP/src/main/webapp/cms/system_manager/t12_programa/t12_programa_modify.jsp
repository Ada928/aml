<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html:html>
<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<script src="<%= path %>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%= path %>/js/basefunc.js"></script>
<script language="JavaScript">
/**
* ����֤
*/
function checkForm(theUrl){
    var errMsg ="";
    
    var errMsg ="";
    var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;
	
    if(getLength(document.forms[0].programaname.value)==0){
        errMsg+="��Ŀ���Ʋ���Ϊ�գ�";
        document.forms[0].programaname.focus();
    }else if(getLength(document.forms[0].releasetype.value)==0){
        errMsg+="��ѡ�񷢲����ͣ�";
        document.forms[0].releasetype.focus();
    }
    else if(getLength(document.forms[0].programaname.value)>64){
        errMsg+="��Ŀ���Ʋ��ܴ���64���ַ���";
        document.forms[0].programaname.focus();
    }
    else if(selvalue == 3 && getLength(document.forms[0].programaadd.value)==0){
    	errMsg+="��Ŀ��ַ����Ϊ�գ�";
        document.forms[0].programaadd.focus();
    }
    else if(selvalue == 3 && getLength(document.forms[0].programaadd.value)>64){
    	errMsg+="��Ŀ��ַ���ܴ���64���ַ���";
        document.forms[0].programaadd.focus();
    }
    /**    
    }else if(getLength(document.forms[0].programaadd.value)>64){
    	errMsg+="��Ŀ��ַ���ܴ���64���ַ���";
        document.forms[0].programaadd.focus();
    }else if(getLength(document.forms[0].defaultname.value)>64){
    	errMsg+="Ĭ��ҳ���Ʋ��ܴ���64���ַ���";
        document.forms[0].defaultname.focus();
    */
    else if(!checkNum(document.forms[0].dispseq.value)) {
        errMsg+="��ʾ˳��ֻ���������� ��";
        document.forms[0].dispseq.focus();
    }
    else if(getLength(document.forms[0].des.value)>128){
    	errMsg+="��ע���ܴ���128���ַ���";
        document.forms[0].des.focus();
    }
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
function releasetypeChange(){
	//alert(document.forms[0].releasetype);
	var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;

  	var trElement = document.getElementById("addr");
    if(selvalue==3){//ϵͳ�ڷ���
    	trElement.style.display="";
    }else{
    	trElement.style.display="none";
    }
    
    var applytype = document.getElementById("applytype");
    if(selvalue == 4) {//���ⷢ��
        applytype.selectedIndex = "0";
    }else {
        applytype.selectedIndex = "1";
    }
  
}
</script>

<script type="text/javascript">
   function init(){
    var  fromarea=eval(document.forms[0].releasetype);
    var index=fromarea.selectedIndex;
	var selvalue=fromarea.options[index].value;

  	var trElement = document.getElementById("addr");
    if(selvalue==3){//ϵͳ�ڷ���
    	trElement.style.display="";
    }else{
    	trElement.style.display="none";
    }
    
    var applytype = document.getElementById("applytype");
    if(selvalue == 4) {//���ⷢ��
        applytype.selectedIndex = "0";
    }else {
        applytype.selectedIndex = "1";
    }
   }
</script>
</HEAD>
<div id='content'>
<BODY >
<html:form method="post" action="/system_manager/t12_programa/t12_programa_modify_do.do">
	<html:hidden property = "categorykey"/>
	<html:hidden property = "programakey"/>

  	<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">ϵͳ���� - <bean:write name="t12_programaActionForm" property = "categorykey_disp"/> - �޸���Ŀ</span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="��  ��" styleClass="input" onclick="awpDoSubmit('t12_programa_list.do','add')"/>
						</td>
					</tr>
				</table>
			</div>
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle"/>
  </html:messages>
  <div class='awp_detail'>
  <TABLE>
   
           <tr>
              <td> <font color="#FF0000">*</font>��Ŀ���ƣ�</td>
              <td bgcolor="F6F9FF"><html:text property="programaname" styleClass="text_white" size="40"/>
              </td>
            </tr>
            <tr>
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>�������ͣ�</td>
              <td bgcolor="F6F9FF">
              		<html:select property="releasetype" onchange="releasetypeChange();">
                      <html:options collection="releasetypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            
            <tr>
               <td><font color="#FF0000">*</font>Ӧ�����ͣ�</td>
              <td> 
              		<html:select property="applytype" >
                      <html:options collection="appTypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            <!-- 
            <logic:equal value="4" property="releasetype" name="t12_programaActionForm">
            	 <tr id ="yes1">
	              <td><font color="#FF0000">*</font>�Ƿ���ά���ṹ��</td>
	              <td>
	              	  <html:select property="isstructure">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes2">
	              <td><font color="#FF0000">*</font>�Ƿ��ܷ������ݣ�</td>
	              <td>
	              	  <html:select property="iscontent">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes3">
	              <td><font color="#FF0000">*</font>�Ƿ��ܲ�ѯ���ݣ�</td>
	              <td>
	              	  <html:select property="issearch">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
            </logic:equal>
            
            <logic:notEqual value="4" property="releasetype" name="t12_programaActionForm">
            	<tr id ="yes1" style="display:none">
	              <td><font color="#FF0000">*</font>�Ƿ���ά���ṹ��</td>
	              <td>
	              	  <html:select property="isstructure">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes2" style="display:none">
	              <td><font color="#FF0000">*</font>�Ƿ��ܷ������ݣ�</td>
	              <td>
	              	  <html:select property="iscontent">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
	             <tr id ="yes3" style="display:none">
	              <td><font color="#FF0000">*</font>�Ƿ��ܲ�ѯ���ݣ�</td>
	              <td>
	              	  <html:select property="issearch">
                         <html:options collection="yesNoMap" property="label" labelProperty="value"/>
                  	  </html:select>
	              </td>
	             </tr>
            </logic:notEqual>
             -->
            
            <logic:equal value="3" property="releasetype" name="t12_programaActionForm">
            	 <tr id ="addr">
	              <td><font color="#FF0000">*</font>��Ŀ��ַ��</td>
	              <td>
	              		<html:text property="programaadd" styleClass="text_white" size="40"/>
	              </td>
	            </tr>
            </logic:equal>
            <logic:notEqual value="3" property="releasetype" name="t12_programaActionForm">
            	<tr id ="addr" style="display:none">
	              <td><font color="#FF0000">*</font>��Ŀ��ַ��</td>
	              <td>
	              		<html:text property="programaadd" styleClass="text_white" size="40"/>
	              </td>
	            </tr>
            </logic:notEqual>
             
             <tr>
               <td><font color="#FF0000">*</font>չ�����ͣ�</td>
              <td>
              		<html:select property="showtype">
                      <html:options collection="showtypeMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
           <tr>
              <td><font color="#FF0000">*</font>״̬��</td>
              <td bgcolor="F6F9FF">
              		<html:select property="flag">
                      <html:options collection="flagMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
           <tr>
              <td> <font color="#FF0000">*</font>��ʾ˳��</td>
              <td bgcolor="F6F9FF"><html:text property="dispseq" styleClass="awp_intnumber" size="10" maxlength="10"/>
              </td>
            </tr>  
            <!--             
             <tr>
              <td> ������ַ��</td>
              <td bgcolor="F6F9FF"><html:text property="programaadd" styleClass="text_white" size="64"/>
              </td>
            </tr>
			<tr bgcolor="ECF3FF">
              <td>Ĭ��ҳ�����ƣ�</td>
              <td bgcolor="F6F9FF">
              		<html:text property="defaultname" styleClass="text_white" size="15"/>
              </td>
            </tr>
             -->
            <!-- 
            
            <tr>
              <td><font color="#FF0000">*</font>���״̬��</td>
              <td bgcolor="F6F9FF">
              		<html:select property="auditstat">
                      <html:options collection="auditstatMap" property="label" labelProperty="value"/>
                  	</html:select>
              </td>
            </tr>
            
             -->
            
           <tr>
              <td>��ע��</td>
              <td bgcolor="F6F9FF">
              		<html:textarea property="des" styleClass="text_white" cols="30" rows = "3"/>
              </td>
            </tr>
            <tr>
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF">
                <html:button property="button" styleClass="input" value="�� ��" onclick="checkForm('t12_programa_modify_do.do')"/>
                <html:reset styleClass="input" value="�� ��"/>
              </td>
            </tr>
         
  </TABLE></div>
  
   <div class='awp_msgtab'>
	<table>
		<tr>
			<td>
				<p>
					<strong>ϵͳ��ʾ��</strong>
				</p>
				
				�������ͣ�<br>
				ǰ̨:������ϵͳǰ̨ʹ���ߣ���ʹ�ù�����������ӣ�������̨����Ա��ˣ�����Ҫ���󣬷�����ϵͳ�� ��ǰ̨�û����ԶԸÿ���������Ͳ�ѯ����Ȩ�ޣ�
				<br>
				��̨:�����ɺ�̨����Ա��ϵͳ��̨�������ܣ�ҵ�����-�������£����з�����ά����ϵͳǰ̨�û�ֻ���� ��ѯȨ�ޣ����ܸ��¸ÿ���Ϣ��
				<br>
				ϵͳ��:��ϵͳ������ģ��Ĳ�ѯ���ܣ�ͨ��URL��ʽ���жԽӣ�ʵ��֪ʶ�����ݵļ���չʾ��
				<br>
				��ʾ���ͣ�<br>
				������ʾ:�������µ�ģ��չʾ��ϸ���棬������չʾ������Ϊ����<br>
				��Ŀ��ʾ:������Ŀ��ģ��չʾ��ϸ���棬�����Ա��������Ŀ��ϵΪ����
				<br>
			</td>
		</tr>
	</table>
</div>
</html:form>
<script type="text/javascript">
init();
</script>
</BODY></div>
</html:html>
