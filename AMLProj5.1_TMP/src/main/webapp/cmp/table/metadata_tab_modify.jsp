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
	<script language="JavaScript">
	function dosubmit(theUrl){
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	}
	
	function dbTabLocation2(id,name,link_id){
	
			if(link_id==null || link_id.length==0){
				alert('ʧ��!');
				return;
			}
	        var d=new Date();
			var f=document.forms(0);
	        var urlStr='metadata_tab_location_do.do';       
	        urlStr=urlStr+'?dblinkkey='+link_id+'&temp_seq_ram='+d.getTime();
	        //urlStr=urlStr+'?dblinkkey='+link_id+'&tableename='+id+'&tablecname='+name+'&temp_seq_ram='+d.getTime();
	        //alert(urlStr);
	        //return false;
			var retval=window.showModalDialog(urlStr,"","dialogWidth:600px; dialogHeight:600px; status:no;");	
			if(retval!=null && retval.length>0){
				var a=retval.split(',');
				if(a[0]==null || a[0].length==0){
					a[0]='';
				}
				if(a[1]==null || a[1].length==0){
					a[1]='';
				}
				if(a[2]==null || a[2].length==0){
					a[2]='';
				}
				if(a[3]==null || a[3].length==0){
					a[3]='';
				}
				var obj=eval('document.forms[0].'+id);
				obj.value=a[0];
	
				var obj=eval('document.forms[0].'+name);
				obj.value=a[1];
				
				document.forms[0].tabschema.value = a[2];
				document.forms[0].objtype.value = a[3];
				
			}
	  }
	
	function checkForm(theUrl){
	    var errMsg ="";
	    
	     if(getLength(document.forms[0].dblinkkey.value)==0){
	        errMsg+="���Ӳ���Ϊ�գ�";
	        document.forms[0].dblinkkey.focus();
	    }  
	    //else if(getLength(document.forms[0].categorykey.value)==0){
	    //    errMsg+="ҵ�������Ϊ�գ�";
	   //     document.forms[0].categorykey.focus();
	   // }  
	    else if(getLength(document.forms[0].tablecname.value)==0){
	        errMsg+="�����Ʋ���Ϊ�գ�";
	        document.forms[0].tablecname.focus();
	    }
	    else if(getLength(document.forms[0].flag.value)==0){
	        errMsg+="״̬����Ϊ�գ�";
	        document.forms[0].flag.focus();
	    } 
	    else if(getLength(document.forms[0].tablecname.value)>32){
	        errMsg+="���������Ʋ��ܴ���32���ַ���";
	        document.forms[0].tablecname.focus();
	    }
	    else if(getLength(document.forms[0].tableename.value)>32){
	        errMsg+="��Ӣ�����Ʋ��ܴ���32���ַ���";
	        document.forms[0].tableename.focus();
	    }     
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form action="/table/metadata_tab_modify_do.do"
			method="POST">
			<input type="hidden" name="isroot" value="<bean:write name="isroot"/>"/>
			<input type="hidden" name="isnew" value="<bean:write name="isnew"/>"/>
			<html:hidden property="tabschema"/>
			<html:hidden property="objtype"/>	
			<div class="conditions">
            <div class="cond_t">
               <span>Ԫ���ݹ��� - �޸ı���Ϣ</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit('metadata_tab_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
			   </span>
            </div>		

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class="cond_c2">
				<table border="0" cellpadding="0" cellspacing="0">
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>ҵ�����
						</td>
						<td>				
							<html:hidden property="categorykey"/>	
							<bean:write name="T01_mt_propertyActionForm" property="categorykey_disp"/>
						</td>
					</tr>

					<tr style="display:none">
						<td>
							<FONT color="#ff0000">*</FONT>�������ӣ�
						</td>
						<td>
							<html:select property="dblinkkey">
								<html:options collection="metadata_linkMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>��Ӣ�����ƣ�
						</td>

						<td>
							<html:text property="tableename" styleClass="text_white"
								size="30" readonly="true"/>
							<a href="#" onClick="dbTabLocation2('tableename','tablecname',document.forms(0).dblinkkey.value);" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>	
							
						</td>
					</tr>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>���������ƣ�
						</td>

						<td>
							<html:text property="tablecname" styleClass="text_white"
								size="30" />
							
						</td>
					</tr>

					

					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>״̬��
						</td>
						<td>
							<html:select property="flag">
								<html:options collection="stsMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>


					<tr>
						<td height="22" align="right">
							������
						</td>
						<td>
							<html:textarea property="des" rows="4" cols="60"
								styleClass="text_white"></html:textarea>
						</td>
					</tr>

					<tr>
						<td>
						</td>
						<td>
							<html:hidden property="tablekey" />
							<logic:notEqual value="1" name="isroot">
								<html:button property="button" styleClass="in_button1" value="��  ��"
									onclick="checkForm('metadata_tab_modify_do.do')" />
							</logic:notEqual>
							<logic:equal value="1" name="isroot">
								<html:button property="button" styleClass="in_button1" value="��  ��"
									onclick="checkForm('metadata_tab_modify_do.do?isroot=1')" />
							</logic:equal>
							<html:reset styleClass="in_button1" value="��  ��" />
						</td>
					</tr>
				</table>
				</div>
		</html:form>
		</div>
</body>
</html>
