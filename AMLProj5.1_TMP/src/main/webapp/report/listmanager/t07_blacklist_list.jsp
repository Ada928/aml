<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<!-- 
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
		 -->
		 <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>


<script type="text/javascript" src="../../js/aml.js">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript" src="../../js/jquery.validator.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		

	
	function selectAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = true;
        }
    }
}

function clearAll(form){
   for( var i=0; i < form.elements.length; i++ ){
        if (form.elements[i].type == 'checkbox' ){
            form.elements[i].checked = false;
        }
    }
}
	
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
}	
function dosubmit(theUrl,type){
        var errMsg = "";
        var isSub = false;
        if(type=='modi'||type=='del'){
        if (checkRadio(document.forms[0].selectedPartyId)<0){
            alert("��ѡ��!");
            return false;
        }
        }
        /*
        if(type=='modi'){
            errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
            var len=document.forms[0].selectedPartyId.length;
            if(len >= 1)
            {
            	for(var i=0;i<len;i++){
            		var obj = document.forms[0].selectedPartyId[i];
            		if(obj.checked){
            			if(document.getElementById("check_"+obj.value).value !='2' && document.getElementById("check_"+obj.value).value !='5'){
            				errMsg+="��ѡ��Ŀͻ�" + obj.value + "����Ȩ��������޸ģ�";
            				break;
            			}
            		}
           	 }
            }
            else
            {
            	var obj = document.forms[0].selectedPartyId;
            	if(document.getElementById("check_"+obj.value).value !='2' && document.getElementById("check_"+obj.value).value !='5')
            	{
            		errMsg+="��ѡ��Ŀͻ�" + obj.value + "����Ȩ��������޸ģ�";
            	}
            }
            isSub = true;
        }
        else if(type=='del'){
            errMsg = CheckBoxMustChecked(document.forms[0]);
            var len=document.forms[0].selectedPartyId.length;
            if(len >= 1)
            {
            	for(var i=0;i<len;i++){
            	var obj = document.forms[0].selectedPartyId[i];
            	if(obj.checked){
            		if(document.getElementById("check_"+obj.value).value !='2' ){
            			errMsg+="��ѡ��Ŀͻ�" + obj.value + "�Ѵ��ڷǴ����״̬����Ȩ����ɾ����";
            			break;
            		}
            	}
            }
            }
            else
            {
            	var obj = document.forms[0].selectedPartyId;
            	if(document.getElementById("check_"+obj.value).value !='2' )
            	{
            		errMsg+="��ѡ��Ŀͻ�" + obj.value + "�Ѵ��ڷǴ����״̬����Ȩ����ɾ����";
            	}
            }
            
            if(errMsg==''){
                if(confirm('�����Ҫɾ��ѡ���������')){
                    isSub = true;
                }
            }
        }    
        else if(type=='search' || type=='add'){*/
        
        /*if(type=='modi' && checkRadio(document.forms[0].selectedPartyId) > 1){
        	alert(checkRadio(document.forms[0].selectedPartyId));
            alert("��ѡ��һ������!");
            return false;
        }else if(type=='modi' && checkRadio(document.forms[0].selectedPartyId) = 1){
        	isSub = true;
        }*/
        if(type=='add'|| type=='modi'){
            isSub = true;
        }
        if(type=='del' && errMsg==''){
        	if(confirm('�����Ҫɾ��ѡ���������')){
                isSub = true;
            }
        }
         if(type=='search'){
        _Date1 = document.forms[0].create_dt_disp.value;
    	_Date2 = document.forms[0].create1_dt_disp.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";		  		
  		isSub = true;     	
        }
           if(type=='inport'){
             isSub = true;
             if(getLength(document.forms[0].filename.value)==0){
               errMsg="��ѡ���ļ�·����";
             }  
        }
           if(isSub && errMsg=='')
           {
               document.forms[0].action=theUrl;
               if(jQuery('#form0').validateAll()){
       	          document.forms[0].submit()
       	         }
           }else{
               if(errMsg!='')
                   alert(errMsg);
               return false;
           }
}

function clearText(){
    var ele=document.getElementsByTagName("input");
    for(var i=0;i<ele.length;i++){
       if(ele[i].type.toLowerCase()!="text" && ele[i].type.toLowerCase()!="hidden")continue;
       ele[i].value="";
    }
    
    var sel=document.getElementsByTagName("select");
    for(var i=0;i<sel.length;i++){
       sel[i].value="";
    }
}
</SCRIPT>
<script> 
var jq = jQuery.noConflict();
jq(function(){
 jq("#checkall").toggle(
	  function(){
	   jq("input:checkbox").attr("checked",'checked');
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checknot.png />ȫ ��");
	  },
	  function(){
	   jq("input:checkbox").removeAttr("checked");
	   jq("#checkall").html("<img src=../../images/<%=session.getAttribute("style") %>/b_checkall.png />ȫ ѡ");
	  });
});
</script>

	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id="main">
		<html:form action="/listmanager/t07_blacklist_list.do" method="post" styleId="form0" enctype="multipart/form-data">
			
<!-- conditions --> 
  <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>
						
							����������
						
					
		</span>
		</div>
		<div class="cond_t2">
		<span class="buttons">
			<a href="#" id="hdd_display" class="bt_hidden"></a>
			<logic:equal name="organlevel" value="0">
			<a href="#" id="checkall" ><img src="../../images/<%=session.getAttribute("style") %>/b_checkall.png" />ȫ ѡ</a>
		   </logic:equal>		 
			<a href="#"
				onClick="dosubmit('t07_blacklist_add.do?listtype=b','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
			
			<a href="#"
				onClick="dosubmit('t07_blacklist_modify.do?listtype=b','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
			
			<a href="#" 
				onClick="dosubmit('t07_blacklist_delete_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
			
			<logic:equal name="organlevel" value="0">
			<html:file property="filename" styleClass="input"/>
			<a href="#"  
				onClick="dosubmit('t07_blacklist_inport.do','inport')"><img src="../../images/<%=session.getAttribute("style") %>/b_import.png" />��������</a>
			<a href="#"   
				onClick="window.open('<%=request.getContextPath() %>/common/download_attach.jsp?url=/report/listmanager/t07_listtable.xls&flag=1','','height=160, width=300,left=100,top=100');">
				<img src="../../images/<%=session.getAttribute("style") %>/b_download.png" />���ر���</a>
			</logic:equal>		 
		</span>
	</div>
			
			<html:errors />
			<div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
       <tr>
									<td >
										�������ڣ�
									</td>

									<td>
									
                                      <html:text property="create_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										
										��
										<html:text property="create1_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" size="12"/>
 
										
									</td>
									<td>
										����������
									</td>
									<td>
										<html:text property="organkey" size="10" require="false" datatype="number|limit_max" max="12" msg="����������|���ܳ���12������"/>
										<html:text property="organname" styleClass="text_white" size="23" readonly="true" maxlength="10" />
										<!--<html:text property="organname" size="20"/>-->
                                       <a href="#" onclick="window.open('<%=request.getContextPath()%>/common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','enter2','height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
										<br>
									</td>
									<td>
									</td>
								</tr>
								<tr >
									<td >
										�ͻ����ͣ�
									</td>
									<td>
										<bean:define id="party_class_str" name="party_class_str"></bean:define><%=party_class_str %>
									</td>
									<td >
										�ͻ����ƣ�
									</td>
									<td >
										<html:text property="obj_name" size="20"/>
									</td>
									<td >
									</td>
								</tr>
								<tr >
									<td height="22"  >
										�ͻ��ţ�
									</td>
									<td >
										<html:text property="party_id" require="false" datatype="safeString|limit_max" max="32" msg="������Ϸ����û�id|���ܳ���32���ַ�"/>
									</td>
									<td>
						               
							                �������ͣ�
						             
									</td>
									<td  >
											<html:select property="m_list_type" style="width:200px"
												onmouseover="FixWidth(this);">
												<html:options collection="m_list_typeMap" property="label"
													labelProperty="value" />
											</html:select> 
										</td>
									<td >
									</td>
								</tr>
								<tr >
									<td>
										����״̬��
									</td>
									<td >
										<html:select property="ischeck">
											<html:options collection="ischeckforpartyMap"
												property="label" labelProperty="value" />
										</html:select>
									</td>
									<td>		
										����
									</td>
									<td >

										<html:select property="listsearch_type">
											<html:options collection="listsearch_typeMap"
												property="label" labelProperty="value" />
										</html:select>

										<html:radio property="fashion" value='asc' />
										����

										<html:radio property="fashion" value='desc' />
										����
									</td>
						
									
								</tr>
								<tr>
								<td></td><td></td><td></td>
								
								<td align="right">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
								<input type="button" class="in_button1" value="�� ѯ"
										onclick="dosubmit('t07_blacklist_list.do?newsearchflag=1&intPage=0&listtype=b','search')" />
								<input type="hidden" name="list_type" value="<bean:write name="list_type"/>"/>
								<input type="hidden" name="check" value="<bean:write name="check"/>"/>
										</td>
								</tr>
								
							</table>
					</div>
			<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
			<div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
   <tr>
					<TH width=5% height=22 noWrap>
						ѡ��
					</TH>
					<TH width=15% noWrap>
						�ͻ���
						<br>
					</TH>
					<TH width=15% noWrap>
						�ͻ�����
					</TH>
					<TH width=25% noWrap>
						��������
					</TH>
					<TH width=13% noWrap>

						����ʱ��
					</TH>
					<TH width=8% noWrap>
						�ͻ�����
					</TH>
<%--					<TH width=8% noWrap>--%>
<%--						�ͻ�״̬--%>
<%--					</TH>--%>
				
						<TH>
						����״̬
						</TH>
					
				</TR>
				<logic:iterate id="t07_blacklist" indexId="i"
					name="t07_blacklistList"
					type="com.ist.aml.report.dto.T07_Blacklist">
					<%
						java.util.HashMap map = new java.util.HashMap();
										map.put("party_id", t07_blacklist.getParty_id());
										map.put("objkey",t07_blacklist.getObjkey());
										pageContext.setAttribute("map", map,
												PageContext.PAGE_SCOPE);
					%>
					<TR>
						<!--<TD>
							<input type="checkbox" name="selectedPartyId" value="<bean:write name="t07_blacklist" property="party_id" />;<bean:write name="t07_blacklist" property="obj_name" />;<bean:write name="t07_blacklist" property="objkey" />">
				  			
							<html:multibox property="selectedPartyId">
								<bean:write name="t07_blacklist" property="party_id" />;<bean:write name="t07_blacklist" property="obj_name" />
							</html:multibox>
							<input type="hidden" id="check_<bean:write name="t07_blacklist" property="party_id" />" name="check_<bean:write name="t07_blacklist" property="party_id" />" value="<bean:write name="t07_blacklist" property="ischeck" />">
				
						</TD>-->
						<TD>
										<html:multibox property="selectedPartyId" >
											<bean:write name="t07_blacklist" property="party_id" />
										</html:multibox>
									
										 
										<input type="hidden"
											id="check_<bean:write name="t07_blacklist" property="party_id" />"
											name="check_<bean:write name="t07_blacklist" property="party_id" />"
											value="<bean:write name="t07_blacklist" property="ischeck" />">
						</TD>
									
						<TD >
							<html:link name="map" page="/listmanager/t07_blacklist_disp.do?changeflag=1">
								<bean:write name="t07_blacklist" property="party_id" />
							</html:link>
						</TD>
						<TD >
							<bean:write name="t07_blacklist" property="obj_name" scope="page" />
						</TD>
						<TD >
							<bean:write name="t07_blacklist" property="organkey" scope="page" />
						</TD>
						<TD> 
							<bean:write name="t07_blacklist" property="create_dt_disp"
								scope="page" />
						</TD>

						<TD noWrap>
							<bean:write name="t07_blacklist" property="party_class_cd"
								scope="page" />
						</TD>
<%--						<TD  noWrap>--%>
<%--							<bean:write name="t07_blacklist" property="isuse" scope="page" />--%>
<%--						</TD>--%>
					
					    <%-- start modify lixx 2011.09.26 �������� ��������Ƿ�����˲��� --%>
						<%-- <TD align="center" noWrap>
							<logic:equal value="4" name="t07_blacklist" property="ischeck">
								<font color=red style="font-size:12px;">������ͨ��</font>
							</logic:equal>
							<logic:equal value="1" name="t07_blacklist" property="ischeck">
								ͨ��
							</logic:equal>
							<logic:equal value="2" name="t07_blacklist" property="ischeck">
								�������
							</logic:equal>
								 <logic:equal value="3" name="t07_blacklist" property="ischeck">
								�޸�����
							
							</logic:equal>
							</TD> --%>
							<TD align="center" noWrap>
								<logic:equal value="4" name="t07_blacklist" property="ischeck">
									<font color=red style="font-size:12px;">
									    <bean:write name="t07_blacklist" property="ischeck_disp" scope="page" />
									</font>
								</logic:equal>
								<logic:equal value="7" name="t07_blacklist" property="ischeck">
									<font color=red style="font-size:12px;">
									    <bean:write name="t07_blacklist" property="ischeck_disp" scope="page" />
									</font>
								</logic:equal>
								<logic:notEqual value="4" name="t07_blacklist" property="ischeck">
								    <logic:notEqual value="7" name="t07_blacklist" property="ischeck">
									     <bean:write name="t07_blacklist" property="ischeck_disp" scope="page" />
									</logic:notEqual>
								</logic:notEqual>
							</TD> 
							<%-- start modify lixx 2011.09.26 �������� ��������Ƿ�����˲��� --%>
						
					</TR>
					
				</logic:iterate>
			</TABLE>
			</div>
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="3">
				<tr>
					<td align="center">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</td>
				</tr>
			</table>
			<logic:equal name="organlevel" value="0">
			  <div class="sys_warning"><strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
     &nbsp;&nbsp;<p>1�������������׺����Ϊ.xls��ʽ����������������ϣ��ڡ��ҡ�������Ψһ�ԣ�ʱ��˳�򡢸�ʽ����2009-09-09����ȷ�����ɲ����ֵ�����С�</p>
							&nbsp;&nbsp;<p>2�������������һ��Ϊ��ͷ�������У���һ��Ϊ�ͻ����ƣ��ڶ���Ϊ�ͻ��ţ�������Ϊ�ͻ����ͣ�������Ϊ�Ƿ����ã�������Ϊ��Ч���ڣ�������ΪʧЧ���ڡ�</p>
							&nbsp;&nbsp;<p>3���������Ч���ں�ʧЧ�������е�Ԫ��Ϊ�ı���ʽ���ͻ�����ֻ��Ϊ&ldquo;�Թ�&rdquo;��&ldquo;��˽&rdquo;���Ƿ�����ֻ��Ϊ&ldquo;��&rdquo;��&ldquo;��&rdquo;
							��ֱ������ģ�浼�룬���&ldquo;���ر���&rdquo;��ť��</p>
      		  </div>
			</logic:equal>
		</html:form>
		</div>
				<!-- ��ʾ�� -->
		<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div>
		<script>
		jQuery('#form0').checkFormSearch();
        </script> 
	</BODY>
</HTML>
