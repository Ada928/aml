<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
pageContext.setAttribute("ctx",request.getContextPath());
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gb2312"/>

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
		<link id="skincss" href="<bean:write name="ctx"/>/css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/jquery.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/aml.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/basefunc.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/calendar.js"></script>
		<script type="text/javascript" src="<bean:write name="ctx"/>/js/load_window.js"></script>
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
 
    }else if(type=='compare'){
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
    else if(type=='batch'){
      errMsg = CheckBoxMustChecked(document.forms[0]);      
    }
    else if(type=='batchdown'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
 			var a = document.getElementsByName("selectods2dmkey"); 	
 			for(var i=0; i<a.length; i++){
				if(a[i].checked){     							
					b = a[i];
					if(b.parentNode.nextSibling.nextSibling.innerHTML == ""){ 							
						errMsg+="�����ɽű����ٽ������ض�����";
						isSub = false; 		
						break;	
 					}
					isSub = true; 							
				}				
 			} 		 	
      	}
    } 
    else if(type=="[object]"){            
		if(type.parentNode.firstChild.nextSibling.nextSibling.innerHTML == ""){ 							
			errMsg+="�����ɽű����ٽ������ض�����";			
		}
		theUrl += "&tableename="+type.parentNode.firstChild.nextSibling.innerHTML;
		isSub = true;
    }
    else if(type=='copy'){
        if(checkRadio(document.forms[0].selectTrpkeys)<0){
            errMsg = "��ѡ��!";
        }
        isSub = true;
    }else if(type=='search' || type=='add'){
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
			return flase;
		}
		 document.forms[0].action= 't18_ods2dm_modify.do?tableename='+tableename;
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

	function openWin(theUrl,win_name,height,width){	
		
	    var top =  (window.screen.availHeight-30-400)/2;
	    var left = (window.screen.availWidth-10-750)/2;
	    var h,w;
	    if(height==undefined){ h = 500 }else{ h = height; }
	    if(width==undefined){ w = 600 }else{ w = width; }
	   
		var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
		
	    window.open(theUrl,'',property);     
	}
		
</SCRIPT>	
</head>

<body >
	<html:form action="/hpom/t18_ods2dm_list.do" method="POST">
   <div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
				<span>����ת��(ODS2DM)</span>
				<span class="buttons">
					<a href="#" id="hdd_display" class="bt_hidden"></a>
					<a href="#" onclick="openWin('createtable_from_dm.do?newsearchflag=1','')"><img src="../../images/blue/b_approve.png" />����DM���Զ�����</a>
					<a href="#" onclick="dosubmit('t18_ods2dm_deploy.do?isdeploy=1','deploy')"><img src="../../images/blue/b_edit.png" />��������</a>
					<a href="#" onclick="dosubmit('t18_ods2dm_deploy.do?isdeploy=0','cancel')"><img src="../../images/blue/b_re_refused.png" />��������</a>
					<a href="#" onclick="dosubmit('<bean:write name="ctx"/>/bmp/hpom/ods2dm_batch_download.do?isgenerating=1','batchdown')"><img src="../../images/blue/b_download.png" />��������</a>
					<a href="#" onclick="dosubmit('deleteT18_ods2dmetlDo.do','del')"><img src="../../images/blue/b_delete.png" />ɾ ��</a>
				</span>
			</div>
		
		<div class="cond_c" id="searchtable">
			 <table border="0" cellpadding="0" cellspacing="0">
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
	            <html:text property="createdate" size="14" onclick="calendar.show(this);" styleClass="calimg" readonly="readonly"></html:text>
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
						onClick="dosubmit('t18_ods2dm_list.do?newsearchflag=1','search')"
						class="in_button1"/>
					</td>
				</tr>
		 </table>
	 </div>
	 </div>
  	<html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
	</html:messages>
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
				<th width="9%" nowrap>
					������ʽ				
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
			
			<logic:notEmpty name="t18_ods2dmetlList">
				 <logic:iterate id="dto" name="t18_ods2dmetlList"
					type="com.ist.bmp.hpom.dto.T18_ods2dmetl">
					<TR align="center" >
						<TD noWrap>
							<html:multibox property="selectods2dmkey">
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
							<bean:write name="dto" property="creatmethod_disp" />
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
							<a href="<bean:write name="ctx"/>/bmp/hpom/ods2dm_batch_download.do?isgenerating=1">����</a>
						</TD>
						<TD noWrap>
							<logic:equal value="1" name="dto" property="islock">
							<img src="../../images/blue/b_lock.png" onclick="lock('t18_ods2dm_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=0')">
							</logic:equal>
							<logic:equal value="0" name="dto" property="islock">
							<img src="../../images/blue/lock_unlock.png" onclick="lock('t18_ods2dm_lock.do?tableename=<bean:write name="dto" property="tableename" />&islock=1')">
							</logic:equal>
							<input type="hidden" id="<bean:write name="dto" property="tableename" />"  value="<bean:write name="dto" property="islock" />"/>
						</TD>

					</TR>
				</logic:iterate>
				</logic:notEmpty>
		</table>
	</div>
	    <div class = "sys_warning">
		<TABLE width="100%" border="0" align="center" cellpadding="0" >
			<TR >
				<TD align="left">
					<b>ODS2DM�ű����ò��裺</b><br/>
					1����DM�н������Ƚ�����ص����ݱ�<br/>
					2������DM���Զ�����ETL�ű���ܣ�<br/>
					3������ű��ļ������������޸Ľű����ݣ�<br/>
					4��������ؽű�������Ӧ�����ݿ���ִ�У�����ETL�ű���
				</TD>
			</TR>
		</TABLE>
	</div>	
	</div>
	</html:form>
	
	
	
</body>
</html>