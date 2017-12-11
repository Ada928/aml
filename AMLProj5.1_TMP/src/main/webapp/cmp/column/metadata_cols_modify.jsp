<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
				
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    
		    if(type=='modi'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);        
		        isSub = true;
		    }
		    else if(type=='del'){
		        errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('�����Ҫɾ��ѡ�������')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type=='add'){
		        var colListObj=document.forms[0].cols_id_selected;
		    	//var colListObj=document.getElementById("cols_id_selected");
		    	
		    	if(colListObj.value==null || colListObj.value==''){
		    		errMsg+="��ѡ������Ϣ��";
		    		isSub = false;
		    	}else{
		    		isSub = true;
		    	}
		    	
		    }
		    else if(type=='test'){
		     	if(getLength(document.forms[0].colexpress.value)==0){
		        	errMsg+="�б��ʽ����Ϊ�գ�";
		        	document.forms[0].colexpress.focus();
		        	isSub = false;
		    	}else{
		    		isSub = true;
		    	}
		    	
		    }
		    else{
		    	isSub = true;
		    }
		       
		    if(isSub && errMsg==''){
		        document.forms[0].action=theUrl;
		        //alert(document.forms[0].action);
		        document.forms[0].submit();
		    }else{
		        if(errMsg!='')
		            alert(errMsg);
		        return false;
		    }
		}
		
		function checkForm(theUrl){
		    var errMsg =""; 
		    if(getLength(document.forms[0].colexpress.value)==0){
		        errMsg+="�б��ʽ����Ϊ�գ�";
		        document.forms[0].colexpress.focus();
		    }      
		    else if(getLength(document.forms[0].colename.value)==0){
		        errMsg+="Ӣ��������Ϊ�գ�";
		        document.forms[0].colename.focus();
		    }  
		    else if(getLength(document.forms[0].colcname.value)==0){
		        errMsg+="����������Ϊ�գ�";
		        document.forms[0].colcname.focus();
		    }
		    else if(getLength(document.forms[0].colexpress.value)==0){
		        errMsg+="�б��ʽ����Ϊ�գ�";
		        document.forms[0].colexpress.focus();
		    }
		    else if(checkRadio(document.forms[0].iscd)<0){
		        errMsg+="��Ҫ������ѡ��";
		    }
		    else if(document.forms[0].iscd[1].checked == true && getLength(document.forms[0].targetcd_disp.value)==0 ){
		        errMsg+="��Ӧ�����Ϊ�գ�";
		        document.forms[0].targetcd_disp.focus();
		    }	    
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		    	if(document.forms[0].iscd[0].checked == true){
			    	document.forms[0].targetcd.value = '';
			    	document.forms[0].targetcd_disp.value = '';
		    	}		    
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		function cancelModi(){
			document.forms[0].cols_name.value='';
			document.forms[0].cols_express.value='';
			document.forms[0].cols_id.value='';
			document.forms[0].des.value='';
			document.forms[0].sts.value='1';
		}
		
		function getPos(){ 
				var txb = document.forms[0].colexpress; //��ö��� (���ʽ)
			    var pos = 0;
			
			    txb.focus();//������ý���
			    var s = txb.scrollTop;
			
			    var r = document.selection.createRange();
			    var t = txb.createTextRange();//����������ı����� 
			
			    t.collapse(true);
			    t.select();//��ʾ��꣬������Ƶ�ͷ
			    var j = document.selection.createRange();
			    r.setEndPoint("StartToStart",j);
			    var str = r.text;
			
			    var re = new RegExp("[\\n]","g");//���˵����з�,����õ���������ô��ʵ�ʳ���Ҫ��. 
			    str = str.replace(re,"");//���� 
			    pos = str.length;
			    r.collapse(false); 
			    r.select();
			    txb.scrollTop = s;
			
				return pos;
			}
			
			function editFomular(tag,type){
				var f=document.forms[0];
		
				var text=f.colexpress.value;  //���ʽ
				var pos=parseInt(f.pos.value);// ��λ���
				var index=parseInt(f.pos.value);
		
				var preStr=text.substring(0,pos);
				var appStr=text.substring(pos,text.length);
				var newStr=preStr+appStr;
				
				if(type=='op'){
					newStr=preStr+tag+appStr;
					index=pos+tag.length;
				}
				if(type=='callPro'){
					if(f.callPro.value!=''){
						newStr=preStr+f.callPro.value+"()"+appStr;
						index=pos+f.callPro.value.length+1;
					}
				}
				if(type=='constant'){
					newStr=preStr+f.constant.value+appStr;
					index=pos+f.constant.value.length;
				}
				if(type=='accCol'){
					newStr=preStr+f.cols_id_selected.value+appStr;
					index=pos+f.cols_id_selected.value.length;
				}
		
				f.colexpress.value=newStr;
				movePoint(index);
				return;
			}
		
			function movePoint(pos){
				var pn = parseInt(pos); 
				if(isNaN(pn)){ 
					 return; 
		 		}
				var rng = document.forms[0].colexpress.createTextRange(); 
				rng.moveStart("character",pn); 
				rng.collapse(true); 
				rng.select(); 
		
				document.forms[0].pos.value=pos;
				document.forms[0].colexpress.focus();
				return;
			}
			
			function setPos(){
				var f=document.forms[0];
				f.pos.value=getPos();
			}
		
			function addTextEvent(){
		    	var obj=event.srcElement;
				var mn_expreObj=document.getElementById("colexpress");
				
				// ����¼�
				if(mn_expreObj==obj){
					mn_expreObj.attachEvent("onclick",setPos);
					mn_expreObj.attachEvent("onchange",setPos);
				}
			}
		
			function addColEvent(){
				var obj=event.srcElement;
				var colListObj=document.getElementById("cols_id_selected");
				if(obj==colListObj){
					colListObj.attachEvent("ondblclick",editFomular('','accCol'));
				}
			}
		
			document.onclick=addTextEvent;

			function setValue(obj){
				var colcname = obj.value;
				if(colcname.length > 0){					
					var b = colcname.substr(colcname.length-1).replace(/\(|\)|\,|\��|\*|\s|\��|\��/,"");
					document.getElementsByName(obj.name)[0].value = colcname.substr(0,colcname.length-1) + b;
				}
			}				
			function selectQc_type(){
			   if(jQuery("input[name='iscd']:checked").val() == '0' && jQuery("input[name='isqc']:checked").val() == '1'){
					jQuery("#condtp").show();
				}else{
				    jQuery("#condtp").hide();
				}
			}
			
		</SCRIPT>
		<script type="text/javascript">
			jQuery(document).ready(function(){
				if(jQuery("input[name='iscd']:checked").val() == '1'){
					jQuery("#codetab").show();
				}
				else {
					jQuery("#codetab").hide();
				}
				if(jQuery("input[name='isdesensitization']:checked").val() == '1'){
					jQuery("#desen").show();
				}
				else {
					jQuery("#desen").hide();
				}
				if(jQuery("input[name='iscd']:checked").val() == '0' && jQuery("input[name='isqc']:checked").val() == '1'){
					jQuery("#condtp").show();
				}
				else {
					jQuery("#condtp").hide();
				}
			});
		</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
		<html:form action="/column/metadata_cols_list.do"
			method="POST">

			<input type="hidden" name="pos" value="0" />
			<html:hidden property="tablekey" />
			<html:hidden property="colkey" />
			<div class="conditions">
            <div class="cond_t">
               <span>Ԫ���ݹ��� - �� - ���½�</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_list.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
			   </span>
            </div>	

			<table width="98%" align="center" border="0" cellspacing="0"
				cellpadding="0">
				<tr>
					<td height="30" valign="bottom">
						��Ӣ������
						<bean:write name="t01_mt_property" property="tableename" />
						����������
						<bean:write name="t01_mt_property" property="tablecname" />
					</td>
				</tr>
			</table>

			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class='cond_c2'>
				<table>
								<tr >
									<td  >
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>�б��ʽ
												</td>
												<td align="left" >
													<html:textarea property="colexpress" rows="6"
														styleClass="text_white" cols="40"></html:textarea>
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>Ӣ������
												</td>
												<td align="left">
													<html:text property="colename" styleClass="text_white"
														size="40" />
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>��������
												</td>
												<td align="left">
													<html:text property="colcname" styleClass="text_white"
														size="40" onkeyup="setValue(this);"/>
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>״̬��
												</td>
												<td align="left" >
													<html:select property="flag">
														<html:options collection="stsMap" property="label"
															labelProperty="value" />
													</html:select>
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>�Ƿ���Ҫ���
												</td>
												<td align="left" >
													<html:radio  property="iscd" value="0" onclick="selectQc_type();jQuery('#codetab').hide();">��</html:radio>
													<html:radio  property="iscd" value="1" onclick="jQuery('#codetab').show();jQuery('#condtp').hide();">��</html:radio>													
												</td>
											</tr>
											<tr id="codetab">
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>��Ӧ���
												</td>
												<td align="left" >
													<html:hidden property="targetcd"/>
													<html:text property="targetcd_disp" size="25" readonly="true"></html:text>
													<a href="#" onClick="locate_dict_window('<%=request.getContextPath()%>','dict','targetcd,targetcd_disp');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>
												</td>
											</tr>
											
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>�Ƿ������
												</td>
												<td align="left" >			
													<html:radio property="isorgan" value="0" >��</html:radio>
													<html:radio property="isorgan" value="1" >��</html:radio>									
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>�Ƿ�������
												</td>
												<td align="left" >
													<html:radio property="isdesensitization" value="0" onclick="jQuery('#desen').hide();">��</html:radio>
													<html:radio property="isdesensitization" value="1" onclick="jQuery('#desen').show();">��</html:radio>
												</td>
											</tr>
											<tr id="desen">
												<td  align="right" nowrap>
													<FONT color="#ff0000">*</FONT>��������
												</td>
												<td align="left" >
													<html:select property="desenlevel">
														<html:options collection="levelMap" property="label" labelProperty="value"/>
													</html:select>
												</td>
											</tr>
											<tr >
												<td  align="right" nowrap>
													������
												</td>
												<td align="left" >
													<html:textarea property="des" rows="4" cols="40"
														styleClass="text_white"></html:textarea>
												</td>
											</tr>
											<tr >
												<td  align="right" >
													&nbsp;
												</td>
												<td align="left" class="in_button">
													<html:button property="button" styleClass="input"
														value="�� ��"
														onclick="checkForm('metadata_cols_modify_do.do')" />
													<html:button property="button" styleClass="input"
														value="���ʽ����"
														onclick="dosubmit('metadata_cols_express_test_do.do','test')" />
												</td>
											</tr>
										</table>
									</td>
									<td  valign="top">
										<table width="100%" border="0" cellpadding="1" cellspacing="1">
											<tr >
												<td align="left" >
													<html:select property="cols_id_selected"
														style="{width:250px} " multiple="true" size="12"
														ondblclick="editFomular('','accCol');">
														<html:options collection="colsListMap" property="label"
															labelProperty="value" />
													</html:select>
												</td>
												<td></td>
											</tr>
											<tr >
												<td  align="left">
													<input type="button" name="Submit422322" value=" ( "
														class="input" onClick="editFomular('(','op');">
													<input type="button" name="Submit422322" value=" ) "
														class="input" onClick="editFomular(')','op');">
													<input type="button" name="Submit422322" value=" + "
														class="input" onClick="editFomular('+','op');">
													<input type="button" name="Submit422322" value=" - "
														class="input" onClick="editFomular('-','op');">
													<input type="button" name="Submit422322" value=" * "
														class="input" onClick="editFomular('*','op');">
													<input type="button" name="Submit422322" value=" / "
														class="input" onClick="editFomular('/','op');">
												</td>
												<td></td>
											</tr>
											<tr >
												<td align="left" >
													<select name="callPro" style="width:150px">
														<option selected>
															��ѡ����
														</option>
														<option value="avg">
															ƽ���� avg()
														</option>
														<option value="sum">
															��� sum()
														</option>
														<option value="count">
															ͳ�� count()
														</option>
														<option value="max">
															���ֵ max()
														</option>
														<option value="min">
															��Сֵ min()
														</option>
													</select>
													<input type=button value="ȷ ��" name=Button522224222
														class="input" onClick="editFomular('','callPro');">
												</td>
												<td></td>
											</tr>
											<tr >
												<td  align="left">
													<input type="text" name="constant" class="text_white">
													<input type=button value="�� ��" name=Button52222432
														class="input" onClick="editFomular('','constant');">
												</td>
												<td></td>
											</tr>
											<tr >
												<td align="left" class="in_button">
													<html:button property="button" styleClass="input"
														value="�����������"
														onclick="dosubmit('metadata_cols_add_batch_do.do','add')" />
												</td>
												<td></td>
											</tr>
										</table>
									</td>
								</tr>
							</table>
						</div>
		</html:form>
		</div>
	</BODY>
</HTML>
