<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT language="JavaScript" src="../../js/load_window.js"></script>
<script language="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg ="";	
    
    if(getLength(trim(document.forms[0].rtettypekey.value))==0){
        errMsg+="���������������Ϊ�գ�";
        document.forms[0].rtettypekey.focus();
    }else if(getLength(document.forms[0].rtettypekey.value) != 3){
        errMsg+="���������������Ϊ3λ��";
        document.forms[0].rtettypekey.focus();
    }else if(getLength(trim(document.forms[0].rtetname.value))==0){
        errMsg+="����������Ʋ���Ϊ�գ�";
        document.forms[0].rtetname.focus();
    }else if(getLength(document.forms[0].rtetname.value)>64){
        errMsg+="����������Ʋ��ܴ���32�����֣�";
        document.forms[0].rtetname.focus();
    } else if(getLength(document.forms[0].rtetfacttable.value)==0){
        errMsg+="������ʵ���������Ϊ�գ�";
        document.forms[0].rtetfacttable.focus();
    }  
    else if(getLength(trim(document.forms[0].rtetfactkey.value))==0){
        errMsg+="�����������Ϊ�գ�";
        document.forms[0].rtetfactkey.focus();
    }else if(getLength(document.forms[0].rtetfactkey.value)>32){
   		errMsg+='����������ܴ���32���ַ�'; 
        document.forms[0].rtetfactkey.focus();
    	}
    else if(document.getElementsByName("iscopy")[0].value == '1'){
      	if(getLength(document.forms[0].rtetfactsctable.value)==0){
      		errMsg+='���������ʵ��Դ��������Ϊ��'; 
            document.forms[0].rtetfactsctable.focus();
       	}else if(getLength(trim(document.forms[0].rtetfactsckey.value))==0){
       		errMsg+='���������ʵ��Դ����������Ϊ��'; 
            document.forms[0].rtetfactsckey.focus();
        	}else if(getLength(trim(document.forms[0].rtetfactsckey.value)) > 32){
        		errMsg+='���������ʵ��Դ���������ܴ���32���ַ�'; 
            	document.forms[0].rtetfactsckey.focus();
        	}else if(getLength(document.forms[0].tplakey_disp.value)==0){
                errMsg+="ģ�����Ʋ���Ϊ�գ�";
                document.forms[0].tplakey_disp.focus();
            }else if(getLength(document.forms[0].comments.value) > 128){
                errMsg+="��ע���ܴ�Լ64�����֣�";
                document.forms[0].comments.focus();
            }
       }
    else if(getLength(document.forms[0].tplakey_disp.value)==0){
        errMsg+="ģ�����Ʋ���Ϊ�գ�";
        document.forms[0].tplakey_disp.focus();
    }
    else if(getLength(document.forms[0].comments.value) > 128){
        
        errMsg+="��ע���ܴ�Լ64�����֣�";
        document.forms[0].comments.focus();
    }  
   
   
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}
	function ding(){
	  var tplakey = document.forms[0].tplakey.value;
	  if(tplakey==''){
	     alert("��ѡ��ģ��!");
	     return false;
	  }
	  var temp="tplakey='"+tplakey+"'";
	  locate_pop_window('<%=request.getContextPath()%>','t02_page_in_parmLocation','radio','forms[0]','paramname,paramname_disp',temp);
	}
	
	
	function modeding(){
	   document.forms[0].paramname.value='';
	   document.forms[0].paramname_disp.value='';
	   locate_pop_window('<%=request.getContextPath()%>','t02_tp_bas_infLocation','radio','forms[0]','tplakey,tplakey_disp','');
	}
	function chgSel(){
	    var iscopy = document.getElementsByName("iscopy")[0].value;
		var sTab = document.getElementById('sTab');
		var sTabKey = document.getElementById('sTabKey');
		
		if(iscopy=="1"){
			sTab.style.display='block';
			sTabKey.style.display='block';
		}
		else{
	        sTab.style.display='none';
			sTabKey.style.display='none';  //�б�λ  
		}
	}

</script>
</HEAD>
<BODY leftmargin=0 topmargin=0>
<div id="main">
	<html:form method="post" action="/entity/entity_kind_modify.do">
		<div class="conditions">
			<div class="cond_t">
				<span><strong>���������� - �޸�</strong></span>
				<span class="buttons">
				<a href="#" onclick="checkForm('entity_kind_modify_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
 	   			<a href="#" onclick="dosubmit('t03_entity_kind_list.do')">
 	   			<img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a>
				</span>
			</div>
			<html:errors/>
			<div class="cond_c2">
				<table>
					<tr>
						<td nowrap>
							<font color="#FF0000">*</font>�������������
						</td>
						<td>
							<html:text property="rtettypekey" styleClass="text_white" size="3" readonly="true"/>�����������������Ϊ3λ��
						</td>
					</tr>
					<tr>
						<td nowrap>
							<font color="#FF0000">*</font>����������ƣ�
						</td>
						<td>
							<html:text property="rtetname" styleClass="text_white" size="30" />
							�����32�����֣�
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>���������ʵ�������
						</td>
						<td>
							<html:text property="rtetfacttable" styleClass="text_white" size="15" readonly="true"/>	
							<html:text property="rtetfacttable_disp" styleClass="text_white" size="30" readonly="true"/>
							<input type="button" name="locate" value="�� λ" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t18_dm_tableLocation','radio','forms[0]','rtetfacttable,rtetfacttable_disp','')"/>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>���������ʵ��������
						</td>
						<td>
							<html:text property="rtetfactkey" size="30" />							
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>������������Ƿ��ƣ�							
						</td>
						<td>
							<html:select property="iscopy" onchange="chgSel()">
								<html:options collection="flagMap" property="label"
										labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr id='sTab'>
						<td>
							<font color="#FF0000">*</font>���������ʵ��Դ������
						</td>
						<td>
							<html:text property="rtetfactsctable" styleClass="text_white" size="15" readonly="true"/>	
							<html:text property="rtetfactsctable_disp" styleClass="text_white" size="30" readonly="true"/>	
							<input type="button" name="locate" value="�� λ" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t18_dm_tableLocation','radio','forms[0]','rtetfactsctable,rtetfactsctable_disp','')"/>					
						</td>
					</tr>
					<tr id='sTabKey'>
						<td>
							<font color="#FF0000">*</font>���������ʵ��Դ��������
						</td>
						<td>
							<html:text property="rtetfactsckey" styleClass="text_white" size="30" />							
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>���ƺ��Ƿ�������������							
						</td>
						<td>
							<html:select property="isnewmkey">
								<html:options collection="flagMap" property="label"
										labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<font color="#FF0000">*</font>�������鿴ģ�����ƣ�
						</td>
						<td>
							<html:hidden property="tplakey"/>	
							<html:text property="tplakey_disp" styleClass="text_white" size="30" readonly="true"/>	
							<input type="button" name="locate" value="�� λ" class="text_white" onclick="modeding()"/>	
						</td>
					</tr>
					
					<tr>
						<td>
							�������鿴ģ������Σ�
						</td>
						<td>						
							<html:hidden property="paramname"/>	
							<html:text property="paramname_disp" styleClass="text_white" size="30" readonly="true"/>
							<input type="button" name="locate" value="�� λ" class="text_white" onclick="ding()"/>						
						</td>
					</tr>
					<tr>
						<td>
							��ע��
							<br/>
							�����64�����֣�
						</td>
						<td>					
							
							<html:textarea property="comments" rows="6" cols="10"></html:textarea>								
						</td>
					</tr>						
				</table>
			</div>
		</div>
		</html:form>
		</div>
	</BODY>
		<script type="text/javascript"> 
			chgSel();
		  document.forms[0].rtetname.focus(); 
		</script>
</html>
