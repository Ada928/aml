<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html>
	<head>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
        <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script language="javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
    function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
    }
    
	function checkForm(theUrl){
	    var errMsg ="";
	    
	    if(getLength(document.forms[0].reportkey.value)==0){
	        errMsg="�����Ų���Ϊ�գ�";
	        document.forms[0].reportkey.focus();
	    }else if(getLength(document.forms[0].reportkey.value)!=6){
	        errMsg="�����ű���Ϊ6λ��";
	        document.forms[0].reportkey.focus();
	    }else if(getLength(trim(document.forms[0].reportname.value))==0){
	        errMsg="�������Ʋ���Ϊ�գ�";
	        document.forms[0].reportname.focus();
	    }else if(getLength(document.forms[0].reportname.value)>64){
	        errMsg="�������Ʋ��ܶ���64���ַ���";
	        document.forms[0].reportname.focus();
	    }
	   /** else if(getLength(document.forms[0].data_file.value)==0){
	        errMsg="����ģ�岻��Ϊ�գ�";
	        document.forms[0].data_file.focus();
	    }
	     else if(getLength(document.forms[0].excel_file.value)==0){
	        errMsg="չ��ģ�岻��Ϊ�գ�";
	        document.forms[0].excel_file.focus();
	    }*/
	    else if(getLength(document.forms[0].tplsheet_name.value)> 256){
	        errMsg="ģ�����Ʋ��ܶ���256���ַ���";
	        document.forms[0].tplsheet_name.focus();
	    }else if(getLength(document.forms[0].reportdes.value)> 256){
	        errMsg="�����������ܶ���256���ַ���";
	        document.forms[0].reportdes.focus();
	    } 
	   
	   
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	        document.forms[0].action=theUrl;
	        document.forms[0].submit();
	    }
	}
	function locationrole(){
		locate_pop_window('<%=request.getContextPath()%>','t02_tp_bas_inf_location','radio','forms[0]','parampage,parampage_disp','');
	}
	function finish(url) {
	    window.parent.location.href = url;
	}
	
	</SCRIPT>
	</HEAD>
	<div id='content'>
		<body>
			<html:form method="post" enctype="multipart/form-data"
				action="/t10_report/t10_report_add_baseinfo.do">

				<div class='awp_title'>
					<table>
						<tr>
							<td width="23%">
								<span class="awp_title_td2">������ - �� ��</span>
							</td>
							<td align="right">
							   <!--  
								<input type="button" value="�� ��" name=Button2 class="input"
									onClick="dosubmit('t10_report_list.do')">
                               -->
                               <input type="button" name="button_next" value="�� ��" 
                               onclick="finish('t10_report_list.do?newsearchflag=1');" class="input">
                               
							</td>
						</tr>
					</table>
				</div>
				
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>


				<div class='awp_detail'>
					<table>

						<tr>
							<td>
								<font color="red">*</font>�����ţ�
							</td>
							<td>
								<html:text property="reportkey" size="30"
									styleClass="text_white"
									onkeyup="value=value.replace(/[\W]/g,'')" />
								<font color="red"> ע�������ű���Ϊ6λ</font>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>�������ƣ�
							</td>
							<td>
								<html:text property="reportname" size="30"
									styleClass="text_white" />
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>������ϵͳ��
							</td>
							<td>
								<html:select property="reportsys">
									<html:options collection="sysMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								<font color="red">*</font>�������
							</td>
							<td>
								<html:select property="reportype">
									<html:options collection="reportTypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						
						<tr>
							<td>
								�Ƿ���ʾ������
							</td>
							<td>
								<html:select property="ismenudisp">
									<html:options collection="commonMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr> 
						<tr>
							<td>
								�Ƿ���������
							</td>
							<td>
								<html:select property="isexport">
									<html:options collection="commonMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						
						<!--  
						<tr>
							<td>
								<font color="red">*</font>����ҳ�棺
							</td>
							<td>
								<html:hidden property="parampage" />
								<html:text property="parampage_disp" size="20" readonly="true" />
								<html:button property="Button52" styleClass="text_white"
									onclick="locationrole()">�� ѡ</html:button>
							</td>
						</tr>
						
						-->
						<tr>
							<td>
								����ģ�壺
							</td>
							<td>
								<html:file property="data_file" />
								<font color="red"> ע�������ϴ�xml�ļ�</font>
							</td>
						</tr>
						<tr>
							<td>
								չ��ģ�壺
							</td>
							<td>
								<html:file property="excel_file" />
								<font color="red"> ע�������ϴ�excel�ļ�</font>
							</td>
						</tr>
						<tr>
							<td>
								ģ�����ƣ�
							</td>
							<td>
								<html:text property="tplsheet_name" size="30"
									styleClass="text_white" />
								<font color="red"> ע��ģ���Ӧ��sheet����,Ĭ��sheet1</font>
							</td>
						</tr>
						
						<tr >
                             <td   ><font color="#FF0000">*</font>ҳ����ʾ���ͣ�<br></td>
                             <td >
                                <html:select property="pagetype" style="width:160">
							          <html:options collection="pagetypeMap" property="label" labelProperty="value" />
						        </html:select>
                             </td>
                        </tr>
                       <!-- 
                        <tr >
                           <td   ><font color="#FF0000">*</font>�Ƿ��ҳ��ʾ��<br></td>
                           <td >
                               <html:radio property="ispage" value="1" >��</html:radio>
                               <html:radio property="ispage" value="0">��</html:radio> 
			               </td>
                        </tr>

                        <tr >
                           <td><font color="#FF0000">*</font>ÿҳ��¼������<br></td>
                           <td ><html:text property="pagerecnum" styleClass="text_white" size="25" maxlength="6"/>�����6λ���֣�</td>
                        </tr>
                          -->
                        <tr >
                           <td   ><font color="#FF0000">*</font>����������ʾ���ͣ�<br></td>
                           <td >
                               <html:select property="condtype"  style="width:160">
							       <html:options collection="condtypeMap" property="label" labelProperty="value"  />
						       </html:select>
						   </td>
                        </tr>
                        
						<tr>
							<td>
								����������
							</td>
							<td>
								<html:textarea property="reportdes" cols="60" rows="6" />
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<input type="button" value="�� ��"
									OnClick="checkForm('t10_report_add_baseinfo_do.do?doRefresh=1')">
								<html:reset styleClass="input" value="�� ��" />
							</td>
						</tr>
					</table>
				</div>
			</html:form>
		</body>
	</div>
</html>
