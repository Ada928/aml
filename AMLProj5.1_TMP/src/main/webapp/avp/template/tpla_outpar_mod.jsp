<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>����������</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
		function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		
		}
	function checkForm(theUrl){
	   var errMsg ="";
        
    if(getLength(document.forms[0].dispname.value)==0){
        errMsg+="��ʾ���Ʋ���Ϊ�գ�";
        document.forms[0].dispname.focus(); 
        alert(errMsg);
        return false;   
    }
    if(getLength(document.forms[0].dispname.value)>64){
        errMsg+="��ʾ���Ʋ��ܴ���32�����֣�";
        document.forms[0].dispname.focus(); 
        alert(errMsg);
        return false;    
    }
    
    var isInput=document.forms[0].datasrc.value;
    if(isInput=='2'){
    	if(getLength(document.forms[0].outcont.value)==0){
	        errMsg+="������ݲ���Ϊ�գ�";
	        document.forms[0].outcont.focus(); 
	        alert(errMsg);
	        return false;   
	    }
	    if(getLength(document.forms[0].outcont.value)>64){
	        errMsg+="������ݲ��ܴ���32�����֣�";
	        document.forms[0].outcont.focus(); 
	        alert(errMsg);
	        return false;    
	    }
    }
    
    
    var isChange=document.forms[0].iscdchg.value;   
    
    if(isChange=='1'){
        
       if(getLength(document.forms[0].catecd.value)==0){
        errMsg+="��Ӧ��ֵ����Ϊ�գ�"; 
        alert(errMsg);
        return false;   
       }
    }
    
     if(document.forms[0].dispseq.value!=null&&document.forms[0].dispseq.value!=''){
		     if(!checkNumber((document.forms[0].dispseq.value))||getLength(document.forms[0].dispseq.value)>10){
		        errMsg+="ִ��˳��ֻ����������,���Ҳ��ܴ���10λ��";
		        document.forms[0].dispseq.focus();  
		        alert(errMsg);
		        return false;
		      }
	 }
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
	}
       function chgInParmType(showID,sysID,userID){
	    var show_id = document.getElementsByName(showID);
		var user_id = document.getElementById(userID);
	    var sys_id = document.getElementById(sysID);
		var show_id_value = show_id[0].value;
		if(show_id_value=="1"){
			user_id.style.display='none';
			sys_id.style.display='block';
		}
        if(show_id_value=="2"){
			user_id.style.display='block';
			sys_id.style.display='none';
		}
	
	}
	function chgInParmType1(showID,hidID){
	    var show_id = document.getElementsByName(showID);
		var hid_id = document.getElementById(hidID);
		var show_id_value = show_id[0].value;
		if(show_id_value=="0"){
			hid_id.style.display='none';
		}
        if(show_id_value=="1"){
			hid_id.style.display='block';
		}
	
	}
</SCRIPT>
	</HEAD>
	<BODY>
		<div id="content">
			<html:form method="post" action="/template/t02_tp_disp_rst_list.do">
				<html:hidden property="tplakey" />
				<html:hidden property="dispcolkey" />
				<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">ģ����� - ���������� - �޸�</span></td>
						<td align="right">
							<input type=button value="�� ��" onClick="checkForm('t02_tp_disp_rst_modify_do.do')">
								<input type=button value="�� ��" onClick="dosubmit('t02_tp_disp_rst_list.do')">                  </td>
					</tr>
				</table>
			</div>
  
				<!-- ������Ϣ��ʾ�� -->
			    <html:messages id="errors" message="true">
			     	<bean:write name="errors" filter="fasle" />
			    </html:messages>

				<div class="awp_detail">
					<table>
						<tr >
							<td >
								<font color="#FF0000">*</font>��ʾ���ƣ�
							</td>
							<td >
								<html:text property="dispname" styleClass="text_white" size="25" />
								�����32�����֣�
							</td>
						</tr>
						<tr >
							<td nowrap>
								<font color="#FF0000">*</font>������Դ��
							</td>
							<td >
								<html:select property="datasrc" style="width:160"
									onclick="chgInParmType('datasrc','outcolkey','outcont')">
									<html:options collection="datasrcMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr  style="display: none" id="outcolkey">
							<td nowrap>
								<font color="#FF0000">*</font>����У�
							</td>
							<td >
								<html:select property="outcolkey" style="width:160">
									<html:options collection="outcolkeyMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr  style="display: none" id="outcont">
							<td  nowrap>
								<font color="#FF0000">*</font>������ݣ�
							</td>
							<td >
								<html:text property="outcont" styleClass="text_white" size="25" />
								�����32�����֣�
							</td>
						</tr>
						<tr >
							<td height="22" align="right" nowrap>
								<font color="#FF0000">*</font>�Ƿ�������ת��
							</td>
							<td >
								<html:select property="iscdchg" style="width:160"
									onclick="chgInParmType1('iscdchg','dictcd')">
									<html:options collection="iscdchgMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr  style="display: none" id="dictcd">
							<td  nowrap>
								<font color="#FF0000">*</font>��Ӧ��ֵ��
							</td>
							<td >
								<html:text property="catecdhname" styleClass="text_white"
									size="25" />
								<html:hidden property="catecd" />
								<input type="button" name="locate" value="�� λ" class="text_white" onclick="locate_dict_window('<%=request.getContextPath()%>','dict','catecd,catecdhname');"/>
							</td>
						</tr>
						<tr >
							<td  nowrap>
								<font color="#FF0000">*</font>���뷽ʽ��
							</td>
							<td >
								<html:select property="align" style="width:160">
									<html:options collection="alignMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr >
							<td  nowrap>
								<font color="#FF0000">*</font>�����ʽ����
							</td>
							<td >
								<html:select property="dispstyle" style="width:160">
									<html:options collection="dispstyleMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr >
							<td  nowrap>
								<font color="#FF0000">*</font>��ʾ���ͣ�
							</td>
							<td >
								<html:select property="disptype" style="width:160">
									<html:options collection="disptypeMap" property="label"
										labelProperty="value" />
								</html:select>
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
						<tr id="desen" style="display : none">
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
							<td  nowrap>
								<font color="#FF0000">*</font>�Ƿ����ã�
							</td>
							<td >
								<html:select property="isenable" style="width:160">
									<html:options collection="isenableMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr >
							<td  nowrap>
								��ʾ��ţ�
							</td>
							<td >
								<html:text property="dispseq" styleClass="text_white" size="25" />
								�����10λ���֣�
							</td>
						</tr>

					</table>
				</div>
			</html:form>
		</div>
		<script type="text/javascript">
		   chgInParmType('datasrc','outcolkey','outcont');
		   chgInParmType1('iscdchg','dictcd');
		   document.forms[0].dispname.focus(); 
		</script>
	</BODY>
</HTML>
