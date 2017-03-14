<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
<head>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/basefunc_report.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;   
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
          if(errMsg===""){
        	var selects = document.getElementsByName("selectods2dmkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value === "1"){
		        			errMsg+=" ����״̬�����޸ģ�";
	    				}else{
        					isSub = true;
        				} 
						break;		
					}				
				}
        }
     
    }else if(type == 'generate'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg==''){
            isSub = true;
    	}
    }
    else if(type=='compare'){
         errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg==''){
                isSub = true;
        }
    } 
    else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
           if(errMsg==""){
        	var selects = document.getElementsByName("selectods2dmkey");				
			for(var i=0; i<selects.length; i++){						
					if(selects[i].checked){	
						var islock=document.getElementById(selects[i].value);
						if(islock.value === "1"){
		        			errMsg+=" ����״̬����ɾ����";
	    				}else{
        					if(confirm('�Ƿ�ɾ����')){
				                isSub = true;
				            }
        				} 
						break;		
					}				
				}
        }
       
    }  else if(type=='deploy'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('ȷ��Ҫ������')){
                isSub = true;
            }
        }
    }
    else if(type=='cancel'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('ȷ��Ҫ����������')){
                isSub = true;
            }
        }
    }
    else if(type=='batchdown'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
 			var a = document.getElementsByName("selectods2dmkey"); 	
 			for(var i=0; i<a.length; i++){
				if(a[i].checked){     							
					b = a[i];
					if(b.parentNode.nextSibling.nextSibling.nextSibling.innerHTML == ""){ 							
						errMsg+="�����ɽű����ٽ������ض�����";
						isSub = false; 		
						break;	
 					}
					isSub = true; 							
				}				
 			} 		 	
      	}
    }    
    else if(type=='copy'){
        if(checkRadio(document.forms[0].selectTrpkeys)<0){
            errMsg = "��ѡ��!";
        }
        isSub = true;
    }else if(type=='search' || type=='add' || type == 'down'){
        isSub = true;
    }
    else if(type=='release'){
     		errMsg = CheckBoxMustChecked(document.forms[0]);
     		if(errMsg==''){
     			var a = document.forms[0].selectods2dmkey;  		
     			for(var i=0; i<a.length; i++){
     					if(a[i].checked){     							
     							
     					}     					
     			}
     		 isSub = true;
     	 }
    }
    if(isSub && errMsg==''){
    
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
	function lock(theUrl){
	
        document.forms[0].action=theUrl;
        document.forms[0].submit();
				
	}
	
	function dosubmit_openFullWin(theUrl,type){
		var isSub = false;
		var selects=document.getElementsByName("selectods2dmkey");
		if(type=='get'){
			errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
				 if(errMsg==''){
					for(var i=0; i<selects.length; i++){						
						if(selects[i].checked==true){	
							var tableename=selects[i].value;
							theUrl=theUrl+"?tableename="+tableename;
							isSub=true;	
							break;
						}else{
							isSub=false;
						}				
					}
				}
		 }
	  if(isSub && errMsg==''){
	        avpPopUp(theUrl,'800','500');
	    }else{
	        if(errMsg!='')
	        alert(errMsg);
	        return false;
	    }
	}

	function modifyShfile(tableename){
		var islock=document.getElementById(tableename);
		if(islock.value === "1"){
			alert("����״̬�����޸�");
			return false;
		}
		 document.forms[0].action= 't18_ods_dblink_modify.do?tableename='+tableename;
	     document.forms[0].submit();	
	}
	function selectAllCheckBox(objElement,currentForm){
		var strInnerText = "";
		var isSelectAll = false;
		if(currentForm){
			for(var i=0;i<currentForm.elements.length;i++){
				var formElement = currentForm.elements[i];
				if(formElement.type=="checkbox" && !formElement.disabled){
					formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
					isSelectAll = formElement.checked;
				}						
			}
			strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
			objElement.innerText = strInnerText;
		}
	}
</SCRIPT>	
</head>

<body class="mainbg">
	<html:form action="/hpom/t18_ods_dblink_list.do" method="POST">
	<html:errors/>
<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
		    <span>���ݳ�ȡ(DBLINK)</span>
		    <span class="buttons">
		    		<a href="#" id="hdd_display" class="bt_hidden"></a>
					<a href="#" onclick="dosubmit('t18_ods_dblink_deploy.do?isdeploy=1','deploy')"><img src="../../images/<bean:write name="style" scope="session"/>/b_edit.png" />��������</a>
					<a href="#" onclick="dosubmit('t18_ods_dblink_deploy.do?isdeploy=0','cancel')"><img src="../../images/<bean:write name="style" scope="session"/>/b_re_refused.png" />��������</a>
					<a href="#" onclick="dosubmit('../../bmp/hpom/generate_script_dblink.do','generate')"><img src="../../images/<bean:write name="style" scope="session"/>/b_agencyinfo.png" />���ɽű�</a>
					<a href="#" onclick="dosubmit('../../bmp/hpom/dblink_batch_download.do','batchdown')"><img src="../../images/<bean:write name="style" scope="session"/>/b_download.png" />��������</a>
			 	</span>
			</div>
	 		<div class="cond_c" id="searchtable">
				<table border="0" cellspacing="0" cellpadding="0">
		  		  <tr>
		            <td>������</td>
		  		    <td><html:text property="tableename" styleClass="text_white" size="30" /></td>
		  		    <td>�ű��ļ�����</td>
		  		    <td><html:text property="shfilename" styleClass="text_white" size="30" /></td>
			      </tr>
		  		  <tr>
					<td>������ʽ��</td>
		  		    <td><html:select property="creatmethod"  >
							<html:options collection="creatmethodmap" property="label"
								labelProperty="value" />
						</html:select>
					</td>
		            <td>����ʱ�䣺</td>
		  		    <td>
						<html:text property="createdate" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
					</td>
					</tr>
					<tr>
		  		    <td>�Ƿ��˹��༭��</td>
		  		    <td><html:select property="isedit"  >
							<html:options collection="map" property="label"
								labelProperty="value" />
						</html:select>
					</td>
					<td>�Ƿ��Ѳ���������</td>
						<td>
						<html:select property="isdeploy"  >
							<html:options collection="map" property="label"
								labelProperty="value" />
						</html:select>
						</td>
					</tr>
					<tr>
					<td align="right" nowrap>
						����
					</td>
					<td nowrap>
						<html:select property="sort">
							<html:options collection="sortMap" property="label"
								labelProperty="value" />
						</html:select>
						&nbsp;
						<html:radio property="sort_type" value="asc">����</html:radio>
						<html:radio property="sort_type" value="desc">����</html:radio>
						<html:radio property="sort_type" value="">������</html:radio>
					</td>
					<td></td>
					<td><input type="button" name="button" value="�� ѯ"
							onClick="dosubmit('t18_ods_dblink_list.do?newsearchflag=1','search')"
							class="in_button1">
						</td>
					</tr>
				 </table>
			 </div>
			<div class="list">
			  	 <table border="0" cellspacing="0" cellpadding="0">
					<tr align="center">
						<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
						<th width="15%" nowrap>
							����				
						</th>
						<th width="5%" nowrap>
							����			
						</th>
						<th width="15%" nowrap>
							�ű��ļ���			
						</th>
						
						<th width="5%" nowrap>
							����ʱ��	
						</th>
						
						<th width="5%" nowrap>
							�Ƿ��˹��༭				
						</th>
						<th width="5%" nowrap>
							�Ƿ��Ѳ�������				
						</th>
						<th width="9%" nowrap> 
							����ʱ�� 
						</th>
						<th width="5%" nowrap>
							����				
						</th>
						<th width="5%" nowrap>
							����״̬				
						</th>
					</tr>
					
					<logic:notEmpty name="t18_ods_dblinkList">
						 <logic:iterate id="dto" name="t18_ods_dblinkList"
							type="com.ist.bmp.hpom.dto.T18_ods_dblink">
							<TR align="center" >
								<TD noWrap>
									<html:multibox property="selectods2dmkey" onclick="changcol(this)">
										<bean:write name="dto" property="tableename" />
									</html:multibox>
								</TD>
								<TD noWrap align="left">
									<bean:write name="dto" property="tableename" />
								</TD>
								<TD noWrap align="center">
									<bean:write name="dto" property="granularity_disp" />
								</TD>
		
								<TD noWrap align="left">
									<a herf="###" onclick="modifyShfile('<bean:write name="dto" property="tableename" />');return false;" ><bean:write name="dto" property="shfilename" /></a>
								</TD>
								
								<TD noWrap>
									<bean:write name="dto" property="createdate" />
								</TD>
								<TD noWrap>
									<bean:write name="dto" property="isedit_disp"  />
								</TD>
								<TD noWrap>
									<bean:write name="dto" property="isdeploy_disp"  />
								</TD>
								<TD noWrap>
									<bean:write name="dto" property="deploytime"  />
								</TD>
								<TD noWrap>
									<logic:notEqual value="" name="dto" property="shfilename">
										<a href="javascript:void(0);" onclick="dosubmit('../../bmp/hpom/dblink_batch_download.do?tableename=<bean:write name="dto" property="tableename" />','down'); return false;">����</a>
									</logic:notEqual>
								</TD>
								<TD noWrap>
									<logic:equal value="1" name="dto" property="islock">
									<img src="../../images/blue/b_lock.png" onclick="lock('t18_ods_dblink_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=0')">
									</logic:equal>
									<logic:equal value="0" name="dto" property="islock">
									<img src="../../images/blue/lock_unlock.png" onclick="lock('t18_ods_dblink_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=1')">
									</logic:equal>
									<input type="hidden" id="<bean:write name="dto" property="tableename" />"  value="<bean:write name="dto" property="islock" />"/>
								</TD>
		
							</TR>
						</logic:iterate>
					</logic:notEmpty>
				</table>
			</div>
		</div>
	</div>
	</html:form>
</body>
</html>