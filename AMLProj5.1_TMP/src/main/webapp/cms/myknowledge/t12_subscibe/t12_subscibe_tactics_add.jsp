<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
			
		<SCRIPT LANGUAGE="JavaScript"> 	
		function dosubmit(theUrl,type){
	      var errMsg = "";
	      var isSub = false;
	       if(type=='search'){
	          isSub=true;
	       }
	       if(type=='adddo'){
	          if(document.forms[0].subscibename.value==null||document.forms[0].subscibename.value==''){
	             errMsg="�������Ʋ���Ϊ�գ�";
	             document.forms[0].subscibename.focus();
	         }else if(getLength(document.forms[0].subscibename.value) > 128){
		        errMsg="�������Ʋ��ܶ���128���ַ���";
		        document.forms[0].subscibename.focus();
		    }else if(document.forms[0].subscibetype.value==null||document.forms[0].subscibetype.value==''){
	             errMsg="�������Ͳ���Ϊ�գ�";
	              document.forms[0].subscibetype.focus();
	         }else if(getLength(document.forms[0].des.value) > 128){
		        errMsg="�������ܶ���128���ַ�";
		        document.forms[0].des.focus();
		    }	          
	          isSub=true;
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
	   
		function showContent(obj){		
		if(obj.value==1){
		document.getElementById("1").style.display="";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
		
		
		}else if(obj.value==2){
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="";
		document.getElementById("3").style.display="none";
		
		
		}else if(obj.value==3){
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="";
		
		
		}else{
		document.getElementById("1").style.display="none";
		document.getElementById("2").style.display="none";
		document.getElementById("3").style.display="none";
				}
		}
		
	</SCRIPT>
		
	</head>

	<body><div id='content'>
	
		<html:form method="post"
			action="/myknowledge/t12_subscibe/t12_subscibe_tactics_add_do.do">
			<html:hidden property="subscibekey" />		
		
			
		<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">���Ĺ��� - �� ��</span>
						</td>
						<td align="right">
							 <input type="button" name="goback" value="��  ��" 
                                onclick="awpDoSubmit('t12_subscibe_tactics_list.do','search')")>
						</td>
					</tr>
				</table>
			</div>
		
			<html:messages id="errors" message="true">
			    <bean:write name="errors" filter="false"/>
			</html:messages>

<div class='awp_detail'>
			<TABLE>
			
					<tr>
						<td align="right">
							<font color="#FF0000">*</font>�������ƣ�
							<br>
						</td>
						<td>
							<html:text property="subscibename" size="32"/>
							�����64�����֣�
						</td>
					</tr>
					<tr>
						<td align="right">
							<font color="#FF0000">*</font>�������ͣ�
							<br>
						</td>
						<td>
							<html:select property="subscibetype" onchange="showContent(this);">
								<html:options collection="subscibetypeMap" property="label" labelProperty="value"/>
							</html:select>
						</td>
					</tr>

					<tr id="1" style="display:none">

						<td align="right">
							��Ŀѡ��
						</td>
						<td >
						    <html:hidden property="programakey"/>
							<html:text property="programaname" size="40" 
								readonly="true" />
							<input type="button" name="locate" value="�� ѡ" class="text_white"
								onClick="locate_pop_window('<%= request.getContextPath() %>','t12_programaLocation','checkbox','forms[0]','programakey,programaname','');" />
						</td>

					</tr>
					<tr id="2" style="display:none">

						<td align="right">
							��Աѡ��
						</td>
						<td>
						    <html:hidden property="username" />
							<html:text property="realname" size="40" 
								readonly="true" />
							<input type="button" name="locate" value="�� ѡ" class="text_white"
								onclick="locate_pop_window('<%= request.getContextPath() %>','t00_userLocation','checkbox','forms[0]','username,realname','');"/>
						</td>					

					</tr>
					
					<tr  id="3" style="display:none">
						<td align="right">
							������ֹ���ڣ�
							<br>
						</td>
						<td>
						    <html:text property="begindate" maxlength="10" size="10" readonly="true"/>
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].begindate);">
								-
								<html:text property="enddate" maxlength="10" size="10" readonly="true"/>
								<img src="<%=request.getContextPath()%>/images/calendar.gif"
									id="img1" style="cursor:hand;" width="16" height="16"
									border="0" align="middle" alt="�������������˵�"
									onClick="new Calendar().show(document.forms[0].enddate);">
							<br>
						</td>
					</tr>

					<tr>
						<td  align="right">
							��ע��
							<br>
						</td>
						<td>
							<html:text property="des" size="60"/>
						</td>
					</tr>
					
					<tr>
						<td align="center">
						<br></td>
						<td>
							<input type="button" name="button_save" value="��  ��"
								onclick="dosubmit('t12_subscibe_tactics_add_do.do','adddo')">
							<html:reset styleClass="input" value="��  ��" />
						</td>
					</tr>						
				
			
			
		</TABLE></div>
		
		</html:form></div>
	</body>

</html>
