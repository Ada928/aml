<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html:html>
	<HEAD>
		<title>�����鿴</title>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"> 
		 function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
			    document.forms[0].submit();
		    }
	 	 function valChange(){
			var  results=eval(document.forms[0].ispublic);
		    var index = results.selectedIndex;
			var selvalue=results.options[index].value;
			
		  	var trElement = document.getElementById("subject");
		  	var trElement1 = document.getElementById("user");
		    if(selvalue==1){//��
		    	trElement.style.display="";
		    	trElement1.style.display="";
				
	        }else{
		        trElement.style.display="none";
		        trElement1.style.display="none";
		    }
	     }
</SCRIPT>
	</HEAD>
	<body>
		<div id='content'>
			<html:form method="post" action="/t12_answer_sheet_list.do">
	
			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">�鵵</span>
						</td>
						<td align="right">
							&nbsp;
						</td>
					</tr>
				</table>
			</div>
	
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>

		<input type="hidden" name="publishkey" value="<bean:write name="publishkey"/>"/>
		
	 
				<div class='awp_detail'>
					<table>
		  				<tr>
		  					<td noWrap><font color="red">*</font>�Ƿ񹫲��Ծ�</td>
		  					<td noWrap>
			  					<html:select property="ispublic" onchange="valChange()">
			  						<html:options collection="isMap" 
			  								property="label" labelProperty="value"/>
			  					</html:select>
		  					</td>
		  					
		  				</tr>
		  				<tr id="subject">
		  					<td noWrap><font color="red">*</font>�Ƿ񹫲���Ŀ��</td>
		  					<td noWrap>
			  					<html:select property="ispcsubject">
			  						<html:options collection="isMap" 
			  								property="label" labelProperty="value"/>
			  					</html:select>
		  					</td>
		  					
		  				</tr>
		  				<tr id="user">
		  					<td noWrap>�鿴�Ծ���Ա��</td>
		  					<td noWrap>
				  				 <html:textarea property="user_name" readonly="true" rows="3" cols="30"></html:textarea>
			  					 <html:hidden property="user_Id"/>
			  					 <input type="button" value="�� ѡ" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t00_userLocation','checkbox','forms[0]','user_Id,user_name','');"/>
		  					</td>
		  				
		  				</tr>
		  				<tr align="center">
		  					<td></td>
		  					<td noWrap><html:button property="Button55" value="�� ��" onclick="dosubmit('t12_publish_hold_do.do','add')" styleClass="input" /></td>
		  				</tr>
  			       </table>
				</div>


		<div class="awp_list">
  			<TABLE>
				<TR align="center"  nowrap>
					
					<TD width="20%"  nowrap>
						�����
					</TD>
					<TD width="20%" nowrap>
						��ʼʱ��
					</TD>
					<TD width="15%" nowrap>
						����ʱ��
					</TD>
					<TD width="20%" nowrap>
						״̬
					</TD>
					<TD width="20%" nowrap>
						�÷�
					</TD>
				</TR>
			
				<logic:iterate id="answer" name="answer_list" type="com.ist.cms.dto.T12_answer_questionnaire" >
							<tr>
							 
								<td align="center" noWrap>
									<bean:write name="answer" property="username" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="answer" property="starttime" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="answer" property="endtime" scope="page" />
								</td>
								<td align="center" noWrap>
									<bean:write name="answer" property="state_disp" scope="page" />
								</td>
							 	<td align="center" noWrap>
									<bean:write name="answer" property="totalscore" scope="page" />
								</td>
							
							</tr>
						</logic:iterate>
			</TABLE>
  		</div>

			</html:form>
		</div>
	</body>
	<SCRIPT LANGUAGE="JavaScript">
	  valChange();
     </SCRIPT>
	</html:html>