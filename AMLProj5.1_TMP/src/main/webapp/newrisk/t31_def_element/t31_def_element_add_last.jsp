<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.ArrayList"%>
<HTML>
	<HEAD>

		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>


		<SCRIPT LANGUAGE="JavaScript">
		function addRow() {
			var tab=document.getElementById("tab");
			var newTr= tab.insertRow();
			var newTd = newTr.insertCell();
			newTd.innerHTML ="<select name='caltype' onchange='caltypeChange(this)'>"
								+"<option value=''>--��ѡ��--</option>"
								+"<option value='1'>ָ���׼ֵ</option>"
								+"<option value='2'>�����¼�</option>"
								+"<option value='3'>ֱ�ӵ÷�</option>"
								+"<option value='4'>ָ��ֵ</option>"
								+"<option value='5'>ָ��Ҫ������</option>"
								+"</select>";
			newTd = newTr.insertCell();			
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
			  if(names[i].type=='hidden')
				 {
					 continue;
				 }
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
		
			  if(isEmpty('caltype'))
			  {
				  alert("��ѡ��Ҫ������!");
				  return;
			  }


		 	 if(isEmpty('indickey'))
			 {
				 alert("ָ����벻��Ϊ��!");				
				 return;
			 }
			     
			 if(isEmpty('elementname'))
			 {
				 alert("����Ҫ�����Ʋ���Ϊ��!");				
				 return;
			 }

			

			 var valnums= document.getElementsByName("valnum");

			 for(var i=0;i<valnums.length;i++)
			 {	
				 if(valnums[i].type=='hidden')
				 {
					 continue;
				 }
				 if(formatNum(valnums[i].value,0,1)==false)
				 {
					 alert("ָ��˳�����������1������!");
					 valnums[i].focus();
					 return;
				 }
			 }
			 var js_type= document.getElementsByName("js_type")[0].value;
			 
			 if(isEmpty('base_occ')&&js_type=='1')
			 {
				 alert("Ȩ�ز���Ϊ��!");				
				 return;
			 }
			 var base_occs= document.getElementsByName("base_occ");

			 for(var i=0;i<base_occs.length;i++)
			 {	
				 
				 if(base_occs[i].type=='hidden'||js_type!='1')
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
			  
			  var sum=0;
			  for(var i=0;i<base_occs.length;i++)
			  {     
				  var occ=base_occs[i].value;
				  if(trim(occ)=='')
				  {
					  occ=0;  
				  }
				  sum+=parseFloat(occ);
				 
			  }

			  var tab=document.getElementById("tab");
			 
			  if(tab.rows.length==1)
			  {
				  errMsg="������Ҫ���ٱ���!";
			  }else  if(sum!=100&&js_type=='1')
			  {
				
				  errMsg="����Ȩ��֮��ӦΪ100%,����!";
			  }

			  if(isEmpty('base_score'))
			 {
				 alert("��׼��ֵ����Ϊ��!");				
				 return;
			 }
			  var base_scores= document.getElementsByName("base_score");

				 for(var i=0;i<base_scores.length;i++)
				 {	
					 if(base_scores[i].type=='hidden')
					 {
						 continue;
					 }
					 
					 if(base_scores[i].value=='0'||formatNum(base_scores[i].value,2,0)==false)
					 {
						 alert("��׼��ֵֻ��Ϊ��Ϊ0������,��С��������2λ!");
						 base_scores[i].focus();
						 return;
					 }
				 }

				  if(isEmpty('element_score'))
					 {
						 alert("�����ֵ����Ϊ��!");				
						 return;
					 }
					  var element_scores= document.getElementsByName("element_score");

						 for(var i=0;i<element_scores.length;i++)
						 {	
							 if(element_scores[i].type=='hidden')
							 {
								 continue;
							 }
							 
							 if(element_scores[i].value=='0'||formatNum(element_scores[i].value,2,0,5)==false)
							 {
								 alert("�����ֵֻ��Ϊ����0С�ڵ���5������,��С��������2λ!");
								 element_scores[i].focus();
								 return;
							 }
						 }
				var is_edits= document.getElementsByName("is_edit");
				for(var i=0;i<is_edits.length;i++)
				{
					if(is_edits[i].value=='0')
					{
						alert("��༭Ҫ������!");
						return;
					}
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
		
		function  randomChar(len){
			  var  x="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
			  var  tmp="";
			  for(var  i=0;i<len;i++)  {
			  	tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
			  }
			  return  tmp;
		}
		
		function caltypeChange(selObj)
		{
			
			var secondTd=selObj.parentNode.parentNode.getElementsByTagName("td")[1];
			if(selObj.value=='')
			{				
				secondTd.innerHTML="";
			}else if(selObj.value=='1')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>ָ�����</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
				+"		<a href='#' title='ѡ��' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
				+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />ѡ��</a></td>"
				+"<td align='right'><font color='red'>*</font>����Ҫ������</td>"				
				+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"			
				+"<tr><td align='right'><font color='red'>*</font>ָ��˳��</td>"
				+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
				+"		<td align='right'>Ȩ�أ�%��</td>"
				+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
				+"		<input type='hidden' name='riskcaltype' value='' /><input type='hidden' name='randomChar' value='' /></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>��׼��ֵ</td>"
				+"		<td align='left'><input type='text' name='base_score' size='20' maxlength='11' /></td>"
				+"		<td align='right'>�ۼƷ�ʽ</td>"
				+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>ֱ��ȡֵ</option>"
				+"		<option value='2' >���</option><option value='3' >ȡƽ��ֵ</option></select></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>�����ֵ</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' /></td>"
				+"      <td align='right'>�Ƿ��������</td>"
				+"		<td align='left'><select name='is_audit'><option value='1' selected='selected'>��</option>"
				+"		<option value='0' >��</option></select></td></tr>"
				+"<tr><td align='right'>����</td>"
				+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
				
			}else if(selObj.value=='2')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>����Ҫ������</td>"
				+"<td align='left'><input type='hidden' name='indickey' value='' /><input type='hidden' name='valnum' value='0' />"
				+"<input type='text' name='elementname' size='20' maxlength='200' /></td>"
				+"<td align='right'>Ȩ�أ�%��</td>"
				+"<td align='left'><input type='text' name='base_occ' size='20' maxlength='7' /></td></tr>"				
				+"<tr><td align='right'><font color='red'>*</font>�����ֵ</td>"
				+"<td align='left'><input type='text' name='element_score' size='20'  maxlength='7' />"
				+"<input type='hidden' name='is_sum' value='1' />"
				+"<input type='hidden' name='base_score' value='0' /><input type='hidden' name='randomChar' value='' /></td>"
				+"<td align='right'>�����¼��㷨</td><td align='left'><select name='riskcaltype'>"
				+"<option value='MIN'>��Сֵ</option><option value='MAX' selected='selected'>���ֵ</option><option value='AVG'>ƽ��ֵ</option></select></td></tr>"
				+"<tr><td align='right'>�Ƿ��������</td>"
				+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>��</option>"
				+"	  <option value='0' >��</option></select></td></tr>"
				+"<tr><td align='right'>����</td><td align='left' colspan='3'>"
				+"<textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
			}else if(selObj.value=='3')
			{
				secondTd.innerHTML="<table>"
				+"<tr><td align='right'><font color='red'>*</font>����Ҫ������</td>"
				+"<td align='left'><input type='hidden' name='indickey' value='' /><input type='hidden' name='valnum' value='0' />"
				+"<input type='text' name='elementname' size='20' maxlength='200' /></td>"
				+"<td align='right'>Ȩ�أ�%��</td>"
				+"<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' /></td></tr>"
				+"<tr><td align='right'><font color='red'>*</font>�����ֵ</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' />"
				+"<input type='hidden' name='is_sum' value='1' /><input type='hidden' name='base_score' value='0' /><input type='hidden' name='riskcaltype' value='' /><input type='hidden' name='randomChar' value='' /></td>"
				+"    <td align='right'>�Ƿ��������</td>"
				+"	  <td align='left'><select name='is_audit'><option value='1' selected='selected'>��</option>"
				+"	  <option value='0' >��</option></select></td></tr>"				
				+"<tr><td align='right'>����</td><td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
				+"</table>";
			}else if(selObj.value=='4')
			{
				secondTd.innerHTML="<table>"
					+"<tr><td align='right'><font color='red'>*</font>ָ�����</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
					+"		<a href='#' title='ѡ��' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />ѡ��</a></td>"
					+"<td align='right'><font color='red'>*</font>����Ҫ������</td>"				
					+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"
					+"<tr><td align='right'><font color='red'>*</font>ָ��˳��</td>"
					+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
					+"		<td align='right'>Ȩ�أ�%��</td>"
					+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
					+"		<input type='hidden' name='riskcaltype' value='' />"
					+"		<input type='hidden' name='base_score' value='0' /><input type='hidden' name='randomChar' value='' /></td></tr>"
					+"<tr><td align='right'><font color='red'>*</font>�����ֵ</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' />"
					+"		<td align='right'>�ۼƷ�ʽ</td>"
					+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>ֱ��ȡֵ</option>"
					+"		<option value='2' >���</option><option value='3' >ȡƽ��ֵ</option></select></td></tr>"
					+"<tr><td align='right'>�Ƿ��������</td>"
					+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>��</option>"
					+"		<option value='0' >��</option></select></td></tr>"
					+"<tr><td align='right'>����</td>"
					+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
					+"</table>";
			}else if(selObj.value=='5')
			{	var randomChar8=randomChar(8);
				secondTd.innerHTML="<table>"
					+"<tr><td align='right'><font color='red'>*</font>ָ�����</td><td align='left'><input type='text' name='indickey' readonly='readonly' value='' />"				
					+"		<a href='#' title='ѡ��' onclick='selectElement(this.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.rowIndex)'><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />ѡ��</a></td>"
					+"<td align='right'><font color='red'>*</font>����Ҫ������</td>"				
					+"<td align='left'><input type='text' name='elementname' size='50' maxlength='200' /></tr>"
					+"<tr><td align='right'><font color='red'>*</font>ָ��˳��</td>"
					+"		<td align='left' ><input type='text' name='valnum' size='20' maxlength='2' value='1'/></td>"
					+"		<td align='right'>Ȩ�أ�%��</td>"
					+"		<td align='left'><input type='text' name='base_occ' size='20'  maxlength='7' />"
					+"		<input type='hidden' name='riskcaltype' value='' />"
					+"		<input type='hidden' name='base_score' value='0' />"
					+"      <input type='hidden' name='randomChar' value='"+randomChar8+"' /><input type='hidden' name='is_edit' id='"+randomChar8+"' value='0' /></td></tr>"
					+"<tr><td align='right'><font color='red'>*</font>�����ֵ</td><td align='left'><input type='text' name='element_score' size='20'maxlength='7' /></td>"
					+"		<td align='right'>�ۼƷ�ʽ</td>"
					+"		<td align='left'><select name='is_sum'><option value='1' selected='selected'>ֱ��ȡֵ</option>"
					+"		<option value='2' >���</option><option value='3' >ȡƽ��ֵ</option></select>"
					+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"					
					+"<font color='red'>*</font><a href='#' title='�༭Ҫ������' onclick=\"editRange('"+randomChar8+"')\"><img "
					+"		src='../../images/<%=session.getAttribute("style")%>/b_add.png' />�༭Ҫ������</a></td></tr>"
					+"<tr><td align='right'>�Ƿ��������</td>"
					+"	  <td align='left' colspan='3'><select name='is_audit'><option value='1' selected='selected'>��</option>"
					+"	  <option value='0' >��</option></select></td></tr>"				
					+"<tr><td align='right'>����</td>"
					+"		<td align='left' colspan='3'><textarea name='des' rows='2' cols='50' maxlength='1000'></textarea></td></tr>"
					+"</table>";
				
			}
			
		}

		function selectElement(index)
		{
			
			var url='<%=request.getContextPath()%>/rule/t21_indic/indic_search.do?mark=2&dispatcher=radio&newsearchflag=1&index='+(index-1);
			ymPrompt.win({message:url,width:650,height:420,title:'ѡ��',handler:handler,iframe:true,fixPosition:true,dragOut:false});
		}
		function editRange(randomChar)
		{
			
			var url='<%=request.getContextPath()%>/newrisk/t31_def_element/editRange.do?index='+randomChar+'&type=edit';
			ymPrompt.win({message:url,width:650,height:420,title:'',handler:handler,iframe:true,fixPosition:true,dragOut:false});
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
						<span>��������ģ�� - ��ӷ���Ҫ��</span><span class="buttons"><strong>�Ƿ����һ�㣺</strong>
						<select name="is_last" onchange="isLastChange(this.value)">
								<option value="1" selected="selected">
									��
								</option>
								<option value="0">
									��
								</option>
							</select>
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									<strong>���㷽ʽ��</strong><select name="js_type" >
										
										<option value="1" selected="selected">Ȩ��</option>										
										<option value="2"  >���ֵ</option>
										<option value="3"  >��Сֵ</option>
									</select>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;	
							<a href="javascript:void(0);" onclick="addRow();"><img
									src="../../images/blue/b_add2.png" />����Ҫ��</a> <a
							href="###"
							onclick="dosubmit('t31_def_element_add_do.do');"><img
									src="../../images/blue/b_save.png" />����</a> <a
							href='t31_def_element_list.do?upelementkey=<bean:write name="t31_def_elementActionForm" property="upelementkey"/>&templatekey=<bean:write name="t31_def_elementActionForm" property="templatekey"/>&treelaye=<bean:write name="t31_def_elementActionForm" property="treelaye"/>'><img
									src="../../images/blue/b_back.png" />����</a>
						</span>
					</div>
					<!-- table content -->
					<html:hidden property="templatekey" />
					<html:hidden property="upelementkey" />
					<html:hidden property="treelaye" />
					<div class="list">
						<table border="0" cellpadding="0" cellspacing="0" id="tab">
							<tr>
								<th>
									<font color="red">*</font>Ҫ������
								</th>
								<th>
									Ҫ������
								</th>

								<th>
									����
								</th>


							</tr>

							<tr>
							<td>
									<select name="caltype" onchange="caltypeChange(this)">
										<option value="">
											--��ѡ��--
										</option>
										<option value="1">
											ָ���׼ֵ
										</option>
										<option value="2">
											�����¼�
										</option>
										<option value="3">
											ֱ�ӵ÷�
										</option>
										<option value="4">
											ָ��ֵ
										</option>
										<option value="5">
											ָ��Ҫ������
										</option>
									</select>
								</td>
								<td></td>
								<td>
									<a href="#" onclick="delRow(this);"><img
											src="../../images/blue/b_delete.png" title="ɾ��" /></a>
								</td>
							</tr>

							
						</table>

					</div>

				</div>

			</div>
		</html:form>
	</BODY>
</HTML>
