<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/avpfunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/load_window.js"></script>
		
	<SCRIPT LANGUAGE="JavaScript">
	//���ѡ
	function locate_dict_window(load_page_path ,type,localset){	
		 var whole_path = load_page_path+'/platform/dict/location_window_dict.do?newsearchflag=1&type='+type+'&localset='+localset;
		 var top =  (window.screen.availHeight-30-400)/2;
		 var left = (window.screen.availWidth-10-750)/2;
	     var	property = 'height=650, width=600,left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	     window.open(whole_path,'',property);     
	}		
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
	function checkForm(theUrl){
	   var errMsg ="";
	   var sel_type = document.getElementsByName("parmtype");
	   var sel_type_value = sel_type[0].value;
        
    if(getLength(document.forms[0].dispname.value)==0){
        errMsg+="��ʾ���Ʋ���Ϊ�գ�";
        document.forms[0].dispname.focus();    
    }else if(getLength(document.forms[0].dispname.value)>64){
        errMsg+="��ʾ���Ʋ��ܴ���32�����֣�";
        document.forms[0].dispname.focus(); 
    }
    else if(getLength(document.forms[0].displen.value) == 0){
        errMsg+="��ʾ���Ȳ���Ϊ�գ�";
        document.forms[0].displen.focus();   
    }
     else if(getLength(document.forms[0].displen.value)>10){
        errMsg+="��ʾ���Ȳ��ܴ���10λ��";
        document.forms[0].displen.focus();   
    }else  if(getLength(document.forms[0].dispseq.value)>10){
          errMsg+="��ʾ��Ų��ܴ���10λ��";
          document.forms[0].dispseq.focus();   
    }else  if(getLength(document.forms[0].maxlen.value)>6){
        errMsg+="��󳤶Ȳ��ܴ���6λ��";
        document.forms[0].maxlen.focus();   
    }
    
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }
    
     if(getLength(document.forms[0].minlen.value)>6){
        errMsg+="��С���Ȳ��ܴ���6λ��";
        document.forms[0].minlen.focus();  
        alert(errMsg);
        return false;      
    }
    
    if(getLength(document.forms[0].des.value)>256){
        errMsg+="�������ܴ���128�����֣�";
        document.forms[0].des.focus();  
         alert(errMsg);
        return false;  
    } 
    
    if(getLength(document.forms[0].warning.value)>256){
        errMsg+="������Ϣ��ʾ���ܴ���128�����֣�";
        document.forms[0].des.focus();
         alert(errMsg);
        return false;    
    } 
    
    if(parseInt(document.forms[0].maxlen.value)<parseInt(document.forms[0].minlen.value)){
       // alert(document.forms[0].maxlen.value+'==========small'+document.forms[0].minlen.value);
        errMsg+="��󳤶Ȳ���С����С���ȣ�";
        document.forms[0].maxlen.focus();
        alert(errMsg);
        return false;
    }
    //alert(sel_type_value);
    	if(sel_type_value=="2"){
        
           
           
		    var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //����λ
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	 if(getLength(document.forms[0].targetcde_tree.value)==0){
		             errMsg+="��Ӧ��λ������Ϊ�գ�";
		            // document.forms[0].targetcde_tree.focus(); 
		              alert(errMsg);
		            return false;   
		            }
            }else{
	            //�б�λ  
				 if(getLength(document.forms[0].targetcde.value)==0){
		             errMsg+="��Ӧ��λ����Ϊ�գ�";
		           //  document.forms[0].targetcde.focus(); 
		              alert(errMsg);
		            return false;   
		          }
			}
		}
	   if(sel_type_value=="3"){
		 if(getLength(document.forms[0].targetcdeh.value)==0){
             errMsg+="��Ӧ�����Ϊ�գ�";
              //document.forms[0].targetcdeh.focus();  
              alert(errMsg);
              return false;  
            }
		}
	   if(sel_type_value=="5"){
			 if(getLength(document.forms[0].targetcdeh.value)==0){
	             errMsg+="��Ӧ�����Ϊ�գ�";
	              //document.forms[0].targetcdeh.focus();  
	              alert(errMsg);
	              return false;  
	            }
			}
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
	}
	
	function chgInParmType(){
	    var sel_type = document.getElementsByName("parmtype");
		var sys_disp = document.getElementById('sys_sel');
		var user_disp_1 = document.getElementById('user_sel_1');
		var user_disp_3 = document.getElementById('user_sel_3');
		var user_disp_2 = document.getElementById('user_sel_2');
		var user_disp_tree = document.getElementById('user_sel_tree');
		var user_disp_5 = document.getElementById('user_sel_5');
		var user_disp_6 = document.getElementById('user_sel_6');
		var user_disp_7 = document.getElementById('user_sel_7');
		var user_disp_8 = document.getElementById('user_sel_8');

		var sel_type_value = sel_type[0].value;
		
		if(sel_type_value=="1"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='none';
			sys_disp.style.display='block';
		}
        if(sel_type_value=="2"){
            var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            //����λ
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	user_disp_2.style.display='none'; 
            	user_disp_tree.style.display='block'; 
            }else{
	            //�б�λ  
				user_disp_2.style.display='block'; 
				user_disp_tree.style.display='none'; 
			}
			user_disp_1.style.display='block'; 
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			sys_disp.style.display='none';
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='block';
		}
	   if(sel_type_value=="3"){
			user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='block';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='block';
		}
	 	if(sel_type_value=="4"){
		    user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='none';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='block';
			user_disp_6.style.display='block';
			user_disp_7.style.display='none';
			user_disp_8.style.display='block';
		}
	 	if(sel_type_value=="5"){
		    user_disp_1.style.display='none';
			user_disp_2.style.display='none';
			user_disp_3.style.display='none';
			user_sel_4.style.display='block';
			sys_disp.style.display='none';
			user_disp_tree.style.display='none'; 
			user_disp_5.style.display='none';
			user_disp_6.style.display='none';
			user_disp_7.style.display='block';
			user_disp_8.style.display='none';
		}
	}
	
	function chgInParmTree(){
		    var user_disp_tree = document.getElementById('user_sel_tree');
	    	var user_disp_2 = document.getElementById('user_sel_2');
		    var sysinparmkey_user_temp = document.getElementsByName("sysinparmkey_user");
            var sysinparmkey_user_temp_value=sysinparmkey_user_temp[0].value;
            
            //����λ
            if(sysinparmkey_user_temp_value == '230' || sysinparmkey_user_temp_value == '240'|| sysinparmkey_user_temp_value == '250'){
            	user_disp_2.style.display='none'; 
            	user_disp_tree.style.display='block'; 
            }else{
	            //�б�λ  
				user_disp_2.style.display='block'; 
				user_disp_tree.style.display='none'; 
			}
	
	}
</SCRIPT>
	</HEAD>
 <BODY>
 <div id="main">
 <html:form method="post" action="/t09_page_in_parm/t09_page_in_parm_modify.do">
 	  <html:hidden property="indickey"/>
 	  <html:hidden property="parmkey"/> 
 		<div class="conditions">	
	 		<div class='cond_t'>
	 		     <span>ָ����� - �� ��</span>
	 		     <span class="buttons">
	 		       <a href="javascript:void(0);" onClick="checkForm('t09_page_in_parm_modify_do.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
							 	
				   <a href="javascript:void(0);" onClick="dosubmit('t09_page_in_parm_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
	 		     </span>
				</div>   
		 </div>

        <div class="cond_c2">	
		      <table border="0" cellpadding="0" cellspacing="0">
		      					<tr>
									<td align="right">
										<font color="#FF0000">*</font>�������룺
									</td>
									<td >
										p_<html:text property="sysinparmcd" styleClass="text_white"
											size="25" readonly="true"/>
									</td>
								</tr>
								<tr>
									<td align="right">
										<font color="#FF0000">*</font>��ʾ���ƣ�
									</td>
									<td >
										<html:text property="dispname" styleClass="text_white" size="15"/>�����32�����֣�
									</td>
								</tr>
								<tr >
									<td align="right" nowrap>
										<font color="#FF0000">*</font>����������ͣ�
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="parmtype" onclick="chgInParmType()">
							                 <html:options collection="parmtypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

								<tr    id="sys_sel">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>ϵͳ�������������
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_sys">
							              <html:options collection="sysinparmkeyMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>

									<tr   style="display:none" id="user_sel_1">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>��λ�������ͣ�
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_user"  onclick="chgInParmTree()"   style="width:160">
							              <html:options collection="parmintypeMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
							<tr   style="display:none" id="user_sel_3">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>����������ͣ�
									</td>
									<td bgcolor="F6F9FF">
										<html:select property="sysinparmkey_user_m"  style="width:160">
							              <html:options collection="parmtypehashMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr   style="display:none" id="user_sel_2">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>��Ӧ��λ��
									</td>
									<td bgcolor="F6F9FF">
										 <html:hidden property="targetcde"/>
										<html:text property="targetcde_disp" size="25" readonly="true"></html:text>
                                        <a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>','location','targetcde,targetcde_disp');" ><span class="cond_buttons"><img
													src="../../images/blue/b_location.png"/>��λ</span> </a>									</td>
								</tr>
								<tr   style="display:none" id="user_sel_tree">
									<td   >
										<font color="#FF0000">*</font>��Ӧ����λ��
									</td>
									<td >
                                     <html:hidden property="targetcde_tree"/>
										<html:text property="targetcde_tree_disp" size="25" readonly="true"></html:text>
										<a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>','tree','targetcde_tree,targetcde_tree_disp');"><span class="cond_buttons"><img
													src="../../images/blue/b_location.png" />��λ</span>
									</td>
								</tr>
                               <tr   style="display:none" id="user_sel_4">
									<td height="22" align="right" nowrap>
										<font color="#FF0000">*</font>��Ӧ���
									</td>
									<td bgcolor="F6F9FF">
                                        <html:text property="targetcdehname" styleClass="text_white" size="25"/>
										 <html:hidden property="targetcdeh"/>
										<a href="#" onclick="locate_dict_window('<%=request.getContextPath()%>', 'dict', 'targetcdeh,targetcdehname');"><span class="cond_buttons"><img
													src="../../images/blue/b_location.png" />��λ</span>
										
									</td>
								</tr>
								<tr style="display:none" id="user_sel_5">
									<td>
										<font color="#FF0000">*</font>Ȩ��ѡ�����ͣ�
									</td>
									<td>
										<html:select property="sysinparmkey_right"  style="width:160">
							              <html:options collection="rightorgMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_8">
									<td>
										�Ƿ���ʾ��ֵ��
									</td>
									<td>
									  <html:radio property="keyvisible" value="1">��</html:radio>
                                      <html:radio property="keyvisible" value="0">��</html:radio>
									</td>
								</tr>
							    <tr style="display:none" id="user_sel_6">
									<td>
										<font color="#FF0000">*</font>Դҵ��ϵͳ��
									</td>
									<td>
										<html:select property="systemflag"  style="width:160">
							              <html:options collection="systemflagMap" property="label" labelProperty="value" />
						                </html:select>
									</td>
								</tr>
								<tr style="display:none" id="user_sel_7">
									<td align="right" nowrap>
										�Ƿ���䣺
									</td>
									<td >
									 <html:radio property="isness" value="1">��</html:radio>
                                     <html:radio property="isness" value="0">��</html:radio>
									</td>
								</tr>
								<tr >
									<td align="right" nowrap>
										<font color="#FF0000">*</font>��ʾ���ȣ�
									</td>
									<td >
										 <html:text property="displen" size="15" styleClass="awp_number"></html:text>�����10λ���֣�
									</td>
								</tr>
								<tr >
									<td height="20" align="right" nowrap>
										��ʾ��ţ�
									</td>
									<td >
										<html:text property="dispseq" styleClass="awp_number" size="15"/>�����10λ���֣�
									</td>
								</tr>
								<!--<tr >
									<td height="22" align="right" width="20%">
										����Ĭ��ֵ��
									</td>
									<td >
										<html:text property="defaultval" styleClass="text_white" size="15"/>
									</td>
								</tr>-->
								<tr >
									<td align="right" nowrap>
										<font color="#FF0000">*</font>�����������ͣ�
									</td>
									<td >
													<html:select property="indatatype">
										              <html:options collection="indatatypeMap" property="label" labelProperty="value" />
									                </html:select>
									</td>
								</tr>
								<tr >
									<td height="22" align="right" width="20%">
										������볤�ȣ�
									</td>
									<td >
										<html:text property="maxlen" styleClass="awp_number" size="15"/>�����6λ���֣�
									</td>
								</tr>
								<tr >
									<td height="22" align="right" width="20%">
										��С���볤�ȣ�
									</td>
									<td >
										<html:text property="minlen" styleClass="awp_number" size="15"/>�����6λ���֣�
									</td>
								</tr>
								<tr >
									<td height="22" align="right" width="20%">
										������Ϣ��ʾ��<br>�����128�����֣�
									</td>
									<td >
										<html:textarea property="warning" cols="70" rows="4"></html:textarea>
									</td>
								</tr>
								<tr >
									<td align="right" nowrap>
										������<br>�����128�����֣�
									</td>
									<td >
									    <html:textarea property="des" cols="70" rows="4"></html:textarea>
									</td>
								</tr>
							</table>
						</div>
		</html:form>
		</div>
	</BODY>
	<script>
	chgInParmType();
	document.forms[0].dispname.focus(); 
	</script>
</HTML>
