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
		<script src="../../js/avpfunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript"> 
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    if(type=='add'){
		    	if(getLength(document.forms[0].cols_id_textarea.value)==0){
		    		errMsg = "����������Ϣ�������ʽ�ο������˵��";
		    	}else{
		    		errMsg = check_input(document.forms[0].cols_id_textarea.value);
		    	}		    		
		    }
		    //�ж��Ƿ��д���   
		    if(errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }else{
		        alert(errMsg);
		        return false;
		    }
		}		
//��������ʽ�Ƿ�����	
		function check_input(str){
			var arrcol = str.split("\n");		
			for(i=0;i<arrcol.length;i++){
				if(arrcol[i].length != 0 && arrcol[i].length != 1){				
					var col = arrcol[i].split(",");
					if(col.length != 3){
						return("�����ʽ�д�������������");
					}
				}				
			}		
			return("");
		}
		
		</SCRIPT>
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
               <span>Ԫ���ݹ��� - �� - ����Ϣ����ά��</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_list.do','back');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
			   </span>
            </div>
	        <div class="cond_t2">
	        <strong>
	         <span>
                                          ��Ӣ������
				<bean:write name="t01_mt_property" property="tableename" />
				����������
				<bean:write name="t01_mt_property" property="tablecname" />
	         </span>
			</strong>
			</div>

			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
				<table>

							<!-- 
							 <tr>
									<td>
										<html:select property="cols_id_selected"
											style="{width:250px} " multiple="true" size="5">											
											<html:options collection="colsListMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>
								</tr>
							 -->
								<tr align="left">
									<td>
										<html:textarea property="cols_id_textarea" rows="12" cols="100"
											styleClass="text_white"></html:textarea>
									</td>
								</tr>
								<tr align="left">
									<td class="in_button">
										<html:button property="batchadd" styleClass="input"
											value="�������"
											onclick="dosubmit('metadata_cols_batch_add_do.do','add')" />
									</td>
								</tr>
							</table>
						</div>
						  <div class="sys_warning">
							  <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />�����ʽ��ʾ��</strong>
							        <p>ÿ���������������Ӣ�������������������������м���','����<br>
									        ��Ӣ��������������������������Ϊ�գ������м��','����ʡ��<br>
									        �������ʱʹ��'�س�'����<br>
									        ��Ӣ�������Բο��Ҳ��г�������<br>
									</p>
						      
						      
						    </div>
						
		</html:form>
		</div>
	</BODY>
</HTML>
