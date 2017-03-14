<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style") %>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>


		<SCRIPT LANGUAGE="JavaScript">
		function addRow() {

			var js_type=document.getElementsByName("js_type")[0];
			
			var tab=document.getElementById("tab");
			var newTr= tab.insertRow();
			var newTd = newTr.insertCell();
			if(js_type.value=="1")
			{
				newTd.innerHTML ="<input type='text' name='elementname' size='20' maxlength='200'/>";
				newTd = newTr.insertCell();
				newTd.innerHTML ="<input type='text' name='base_occ' size='10' />";
			}else
			{
				newTd.innerHTML ="<input type='text' name='elementname' size='20' maxlength='200'/><input type='hidden' name='base_occ' value='0'/>";
			}
			newTd = newTr.insertCell();
			newTd.innerHTML ="<input type='text' name='des' size='50' maxlength='1000'/>";
			newTd = newTr.insertCell();
			newTd.innerHTML ="<a href='#' onclick='delRow(this)'><img src='../../images/blue/b_delete.png' title='ɾ��'/></a>";
			
		
		}

		function delRow(obj) {
			var tab=document.getElementById("tab");
			rowIndex=obj.parentNode.parentNode.rowIndex;
			tab.deleteRow(rowIndex);
		}
		
		function isEmpty(name)
		{
		  var names=eval('document.getElementsByName("'+name+'")');
			
		  for(var i=0;i<names.length;i++)
		  {     
			 if(trim(names[i].value)=='')
			 {
				 
				 names[i].focus();
				 return true;
			 }
		  }
		  return false;
		}
		

		
		function dosubmit(theUrl){
			   var errMsg = '';
		
			  var elementname=document.getElementsByName("elementname");

			  for(var i=0;i<elementname.length;i++)
			  {     
				 if(trim(elementname[i].value)=='')
				 {
					 alert("����Ҫ�����Ʋ���Ϊ��!");
					 elementname[i].focus();
					 return;
				 }
			  }

			  if(isEmpty('base_occ'))
				 {
					 alert("Ȩ�ز���Ϊ��!");				
					 return;
				 }
				 var base_occs= document.getElementsByName("base_occ");

				 for(var i=0;i<base_occs.length;i++)
				 {	
					 if(base_occs[i].type=='hidden')
					 {
						 continue;
					 }
					 if(!formatNum(base_occs[i].value,2,0,100)||base_occs[i].value==0)
						{
							alert("Ȩ��ֻ���������0С�ڵ���100,��С��������2λ������!");
							base_occs[i].focus();
							return;
						}
				 } 

			  var js_type=document.getElementsByName("js_type")[0];
			  
			  if (js_type.value=='1')
			  {		 
					  var sum=0;
					  for(var i=0;i<base_occs.length;i++)
					  {     
						  sum+=parseFloat(base_occs[i].value);
						 
					  }
					  
					  if(sum!=100)
					  {
						
						  errMsg="����Ȩ��֮��ӦΪ100%,����!";
					  }
			  }


				
			  if(elementname.length==0)
			  {
				  errMsg="�����ӷ��������ٱ���!";
			  }
			    if(errMsg==''){
			        document.forms[0].action=theUrl;
			        document.forms[0].submit();
			    	
			    }else{
			       
			        alert(errMsg);
			        return false;
			    }
			}
		function isLastChange(val)
		{
			
			if(val=='1')
			{
				document.forms[0].action='t31_def_element_add.do?is_last=1';
		        
			}else
			{
				document.forms[0].action='t31_def_element_add.do?is_last=0';
			}
			document.forms[0].submit();
		}

		function js_typeChange(val)
		{		
			var tab=document.getElementById("tab");	
			
			if(val=='1')
			{
				for(var i=0;i<tab.rows.length;i++)
				{
					var row=tab.rows[i];
					var newCell=null;
						
					if(i==0)
					{		
						newCell = document.createElement("th");				
						newCell.innerHTML="<font color='red'>*</font>Ȩ�أ�%��";
						newCell.className="listhspit";				
					}else
					{
						newCell=row.insertCell();
						newCell.innerHTML="<input  type='text' name='base_occ' size='10' />";
						row.cells[0].innerHTML=row.cells[0].innerHTML.substr(0,row.cells[0].innerHTML.toUpperCase().lastIndexOf("<INPUT"));
					
						//row.cells[0].innerHTML="<input type='text' name='elementname' size='20' maxlength='200'/>";
					}
					row.insertBefore(newCell,row.cells[1]);
					
				}
		        
			}else
			{
				if(tab.rows[0].cells.length==4)
				{
					for(var i=0;i<tab.rows.length;i++)
					{
						
						var row=tab.rows[i];		
						row.deleteCell(1);
						if(i>0)
						{
							row.cells[0].innerHTML+="<input type='hidden' name='base_occ' value='0'/>";
						}
						
					}
				}
			}
		}
		
		
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/t31_def_element/t31_def_element_add.do"
			method="post">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>��������ģ�� - ���ӷ�������</span><span class="buttons"><strong>�Ƿ����һ�㣺</strong><select name="is_last" onchange="isLastChange(this.value);">
										<logic:notEqual value="1" name="t31_def_elementActionForm" property="treelaye">
										<option value="1" >��</option>
										</logic:notEqual>
										<option value="0" selected="selected" >��</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>���㷽ʽ��</strong><select name="js_type" onchange="js_typeChange(this.value);">
										
										<option value="1" selected="selected">Ȩ��</option>										
										<option value="2"  >���ֵ</option>
										<option value="3"  >��Сֵ</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;								
						<a href="javascript:void(0);" onclick="addRow();"><img src="../../images/blue/b_add2.png" />���ӷ�������</a>
						<a href="###" onclick="dosubmit('t31_def_element_add_do.do');"><img src="../../images/blue/b_save.png" />����</a>
						<a href='t31_def_element_list.do?upelementkey=<bean:write name="t31_def_elementActionForm" property="upelementkey"/>&templatekey=<bean:write name="t31_def_elementActionForm" property="templatekey"/>&treelaye=<bean:write name="t31_def_elementActionForm" property="treelaye"/>'><img src="../../images/blue/b_back.png" />����</a></span>
					</div>
					<!-- table content -->
					<html:hidden property="templatekey"/>
					<html:hidden property="upelementkey"/>
					<html:hidden property="treelaye"/>						
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
						<tr>
							<th><font color="red">*</font>����Ҫ������</th>							
							<th><font color="red">*</font>Ȩ�أ�%��</th>
							<th id="aa">����Ҫ������</th>
							<th>����</th>							
						</tr>
						
							<tr>
								<td >									
									<input type="text" name="elementname" size="20" maxlength="200"/>
								</td>
								
								<td>
									<input type="text" name="base_occ" size="10"  />
								</td>							
							
								<td>
									<input type="text" name="des" size="50" maxlength="1000"/>
								</td>
								<td><a href="#" onclick="delRow(this)">
										<img src="../../images/blue/b_delete.png" title="ɾ��" /></a>
								</td>
							
							</tr>
						</table>

					</div>

				</div>

			</div>
		</html:form>
	</BODY>
</HTML>