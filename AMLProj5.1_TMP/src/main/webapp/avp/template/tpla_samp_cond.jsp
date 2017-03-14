<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<HTML>
	<HEAD>
		<!-- 清除缓存 -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>

		
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_抽样条件</title>
		<script language="javascript" src="../../js/basefunc.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/avpfunc.js"></script>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

		
		<script language="JavaScript">
		function chMode(oElement){
			var tr_rate = document.getElementById('tr_rate');
			var tr_step = document.getElementById('tr_step');
			var tr_num = document.getElementById('tr_num');

			var hid_samp = oElement.value;
			document.getElementById('hid_samp').value = hid_samp;
			
			if(hid_samp == '1'){
				tr_rate.style.display='none';
				tr_step.style.display='none';
				tr_num.style.display='block';
				document.getElementById('samp_num').focus();
			}else if ( hid_samp == '2'){
				tr_rate.style.display='block';
				tr_step.style.display='none';
				tr_num.style.display='none';
				document.getElementById('samp_rate').focus();
			}else{
				tr_rate.style.display='none';
				tr_step.style.display='block';
				tr_num.style.display='none';
				document.getElementById('samp_step').focus();
			}
		}
		
		
		function checkform(){
			var exam_rate = document.getElementById('samp_rate');
			var exam_step = document.getElementById('samp_step');
			var exam_num = document.getElementById('samp_num');
			var hid_samp = document.getElementById('hid_samp').value ;			
			var hid_save = document.getElementById('hid_save').value ;
			
			if(hid_samp == '1'){
				
				var maxc = 20000;
				if (hid_save=='2'){
					maxc = document.getElementById('maxcount').value;
				}else{
					maxc = 20000;
				}
				
				if(exam_num.value == ''){
					alert('请输入抽样数量！');
					exam_num.focus();
					return false;
				}else if(parseInt(exam_num.value,10) > maxc||parseInt(exam_num.value,10) < 1){
					alert('请注意抽样数量在1——'+maxc+'之间');
					exam_num.focus();
					return false;
				}
			}

			if(hid_samp == '2'){
				if(exam_rate.value == ''){
					alert('请输入抽样比例！');
					exam_rate.focus();
					return false;
				}else if(parseFloat(exam_rate.value,10) > 100.0 || parseFloat(exam_rate.value,10) < 1){
					alert('抽样比例在1%——100%之间，请重新设置抽样比例');
					exam_rate.focus();
					return false;
				}
				
			}
			
			if(hid_samp == '3'){
			    maxc = 20000;
				if(exam_step.value == ''){
					alert('请输入抽样步长！');
					exam_step.focus();
					return false;
				}else if(parseInt(exam_step.value,10) > maxc||parseInt(exam_step.value,10) < 1){
					alert('请注意抽样步长在1——'+maxc+'之间');
					exam_step.focus();
					return false;
				}
			}	
			return true;			
		}
		
		function doSubmit(theUrl){
			if (checkform()){
				awpDoSubmit(theUrl);
			}
		}
		
		
		function chsaveMode(oElement){
			var tr_switchid = document.getElementById('tr_swithid');
			var tr_swithdes = document.getElementById('tr_swithdes');
			var tr_sampsave = document.getElementById('tr_sampsave');
			var btn_next = document.getElementById('btn_next');

			var hid_save = oElement.value;
			document.getElementById('hid_save').value = hid_save;
			
			if(hid_save == '1'){
				tr_switchid.style.display='none';
				tr_swithdes.style.display='none';
				tr_sampsave.style.display='block';
				btn_next.disabled=true;						
			}else if ( hid_save == '2'){	
				tr_switchid.style.display='block';
				tr_swithdes.style.display='block';
				tr_sampsave.style.display='none';				
				btn_next.disabled = false;			
			}else{
				alert("1");
			}
		}	
		
		
		
		function next_step(){ 			
			if (!checkform()){
				return false;
			}							
			var list2 = document.getElementById("list2"); 
			var select1 = document.getElementById("select1"); 
			var value002 = "";	
				
			if (list2.length==0){
				alert("请选择样本描述所对应的字段！");
				return false;
			}				 		    		     
		    for(var i=0; i<select1.length; i++){
		    	if (select1[i].selected){
		    		value002 =select1[i].value;
		    	}
		    }	  		                 
		    for(var i=0;i<list2.length;i++){    
		       var temp=list2.options[i].value;
		       value002=value002+","+temp;
		    }            		    
		    if (value002!=""){
		        var url = "<%=request.getContextPath()%>/avp/template/tpla_sampleintegration_List.do?newsearchflag=1&&mappingfield="+value002;
			    document.forms[0].action=url;
		    	document.forms[0].submit();    	    
		    }                    
		}					
		</script>

	</HEAD>

	<BODY>
	  <div id="content">
		<html:form method="post" action="/template/tpla_samp_cond.do">
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>_抽样条件</span></td>
						<td align="right">
							<input type="button" name="btn_next" disabled value="下一步"  onClick="next_step()">
                            	<c:out value="${buttonHtml}" escapeXml="false"></c:out>				                  </td>
					</tr>
				</table>
			</div>
		

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="false" />
			</html:messages>

			<div class='awp_detail'>
				<table>
					<tr>
						<td width="20%" align="right" nowrap="nowrap"><font color="#FF0000">*</font>抽样方法：</td>
						<td colspan="3" align="left"  nowrap="nowrap">
							<c:forEach var="samp_mode" items="${samp_mode_map}">
								<input type="radio" name="samp_mode" value='<c:out value="${samp_mode.key}" />' onClick="chMode(this)"
								 	<c:if test="${samp_mode.key==1}">checked</c:if> 
								/>
								<c:out value="${samp_mode.value}" />
							</c:forEach>
			  			</td>
			  		</tr>
			
					<tr id="tr_num" >
			  			<td align="right" nowrap="nowrap"><font color="#FF0000">*</font>抽样数量：</td>
			  			<td colspan="3" align="left" nowrap="nowrap">
			  				<input type="text" id="samp_num" name="samp_num" class="avp_number">
			  			</td>
					</tr>
					
					<tr id="tr_rate" style="display: none">
			  			<td align="right" nowrap="nowrap" ><font color="#FF0000">*</font>抽样比例：</td>
			  			<td colspan="3" align="left" nowrap="nowrap">
			  				<input type="text" id="samp_rate" name="samp_rate"  class="avp_number"  > %</td>
					</tr>
					
					<tr id="tr_step" style="display: none">
			  			<td align="right" nowrap="nowrap"><font color="#FF0000">*</font>抽样步长：</td>
			  			<td colspan="3" align="left" nowrap="nowrap">
			  				<input type="text" id="samp_step" name="samp_step" class="avp_number" >
			  				
			  			</td>
					</tr>

			          <tr>
			             <td align="right"><font color="#FF0000">*</font>保存方式：</td>
			             <td align="left"  colspan="3">
							<input type='radio' name="isexamsave" value="1" checked onclick="chsaveMode(this)">文件
							<input type='radio' name="isexamsave" value="2" onclick="chsaveMode(this)"">项目抽样测试表           
			             </td>
			          </tr> 

						<tr id="tr_swithid"  style="display:none">
							<td nowrap align="right">
								样本编号：
							</td>
							<td colspan="3">
								<SELECT NAME="select1" ondblclick="moveSelectedOptions(this.form['list1'],this.form['list2'],'add',true,this.form['hi'].value)">
									<OPTION VALUE="">--请选择--										
									<c:forEach var="selectcolumn" items="${selectColumnMap}" step="1">
										<OPTION VALUE="<c:out value="${selectcolumn.key}" />"  	<c:if test="step==1">SELECTED</c:if> ><c:out value="${selectcolumn.value}" />
									</c:forEach>																												
								</SELECT>
				
							</td>
						</tr>
						<tr id="tr_swithdes"  style="display:none">
							<td width="20%">
								<font color="#FF3300">*</font>样本描述：<br>
							</td>
							<td width="15">							
								<SELECT NAME="list1" multiple size="15" style="width:200px" ondblclick="moveSelectedOptions(this.form['list1'],this.form['list2'],'add',true,this.form['hi'].value)" >										
									<c:forEach var="selectcolumndes" items="${selectColumnMapDes}" step="1">
										<OPTION VALUE="<c:out value="${selectcolumndes.key}" />" 
										<c:if test="step==1">SELECTED</c:if> ><c:out value="${selectcolumndes.value}" />
									</c:forEach>																												
								</SELECT>						
							</td>
							<td align="center" width="8%">
								<INPUT name="right" type="button" class="input"
									onClick="moveSelectedOptions(this.form['list1'],this.form['list2'],'add')"
									value="-&gt;">
								<BR>
								<BR>
								<INPUT name="right" type="button" class="input"
									onClick="moveAllOptions(this.form['list1'],this.form['list2'],'add')"
									value="&gt;&gt;">
								<BR>
								<BR>
								<INPUT name="left" type="button" class="input"
									onClick="moveSelectedOptions(this.form['list2'],this.form['list1'],'del')"
									value="&lt;-">
								<BR>
								<BR>
								<INPUT name="left" type="button" class="input"
									onClick="moveAllOptions(this.form['list2'],this.form['list1'],'del')"
									value="&lt;&lt;">
								<br>
							
							</td>
							<td align="left">
								<select name=list2 id='list2' size=15 multiple style="width:200"
									ondblclick="moveSelectedOptions(this.form['list2'],this.form['list1'],'del',true,this.form['hi'].value)">
								</select>
							<br></td>
						</tr>

						<tr id="tr_sampsave" style="display:block">
							<td>
							&nbsp;
							</td>
							<td align="left" colspan="3">
								<input type="button" value="抽 样"
									onClick="doSubmit('tpla_samp_export.do')">
							</td>
						</tr>						
				</table>
			</div>
			<div class="awp_msgtab">
			  <table>
				<tr> 
		        <td ><p><strong>系统提示：</strong><br>
		        		<li>进行抽样操作时，要消耗大量的系统资源，请尽量选择在系统空闲时间进行。</li>
						<li>保存到文件，系统的最大抽样数量为20000。		</li>				
						<li>保存到项目抽样测试表，系统的最大抽样数量为<c:out value="${maxcount}" />。</li>
						<li>系统进行抽样操作时，消耗时间较长，请耐心等待。</li>
		        </td>
		        </tr>
		      </table>
		    </div>
		   
			
			
			<div id='loading' class='css012'>
				<font color='#FF0000'>正在加载数据，请稍候...</font>
			</div>

			<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
			<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>

			<input type="hidden" id="hid_samp" value="1" >
			<input type="hidden" id="hid_save" value="1" >	
			<input type="hidden" name="hi">		
			<input type="hidden" name="maxcount" value='<c:out value="${maxcount}" />'>		
			

		</html:form>
		
		</div>
	</BODY>
</HTML>
