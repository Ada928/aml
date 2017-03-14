<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<!-- ������� -->
		<meta http-equiv="expires" content="0">
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">

		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title><c:out value="${labelStr}" escapeXml="false"></c:out>_��������</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script language="javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>			

		<script language="JavaScript">
		function doSubmit(theUrl){
		    var theredirtUrl = theUrl;
			var begin_no = document.forms[0].begin_no;
			var end_no = document.forms[0].end_no;
			
			if(begin_no.value == ''){
				alert('�����뵼����ʼ���');
				begin_no.focus();
				return false;
			}
			if(end_no.value == ''){
				alert('�����뵼���������');
				end_no.focus();
				return false;
			}
			if(parseInt(begin_no.value,10)<=0 || parseInt(end_no.value,10)<=0){
			    alert('������ʼ��ź͵���������Ų���С�ڻ����0');
			    return false;
			}
			if(parseInt(end_no.value,10)-parseInt(begin_no.value,10)<0){
				alert('����������Ų���С�ڵ�����ʼ���');
				begin_no.select();
				begin_no.focus();
				return false;
			}
			if(parseInt(end_no.value,10)-parseInt(begin_no.value,10)> 10000){
				alert('���ε�����¼�����ܳ���10000��');
				begin_no.select();
				begin_no.focus();
				return false;
			}

			dispLoadInfo1();
			document.forms[0].action=theredirtUrl;
			document.forms[0].submit();
		}
		
		function chsaveMode(oElement){
			var tr_subbtn = document.getElementById('tr_subbtn');	
			var tr_begin_no = document.getElementById('tr_begin_no');	
			var tr_end_no = document.getElementById('tr_end_no');	
			var tr_curr_subbtn = document.getElementById('tr_curr_subbtn');			

			var hid_save = oElement.value;
			document.getElementById('hid_save').value = hid_save;
			
			if(hid_save == '1'){  //��ѡ���ݵ���
				tr_begin_no.style.display='block';
				tr_end_no.style.display='block';
				tr_subbtn.style.display='block';
				tr_curr_subbtn.style.display='none';
			}else { //������ǰҳ����
				tr_begin_no.style.display='none';
				tr_end_no.style.display='none';				
				tr_subbtn.style.display='none';
				tr_curr_subbtn.style.display='block';
			}
		}	
		
		function exportMyExecl(){
			try{
				var loading = document.getElementById('loading'); 
				loading.style.visibility = "visible";
				event.srcElement.disabled = true;
				exportExecl_avp('data_table','<c:out value="${labelStr}" escapeXml="false"></c:out>');
				loading.style.visibility = "hidden";
				event.srcElement.disabled = false;
				}catch(err){
			}
		}

		</script>

	</HEAD>

	<BODY>
		<div id="content">
			<html:form method="post" action="/template/tpla_sort_cond.do">
			<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2"><c:out value="${labelStr}"></c:out>- ��������</span></td>
						<td align="right">
							<c:out value="${buttonHtml}" escapeXml="false"></c:out>&nbsp; </td>
					</tr>
				</table>
			</div>         
			
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>

				
				<div class='awp_detail'>
					<table>
						 <tr>
				             <td width="20%"  align="right"><font color="#FF0000">*</font>������ʽ��</td>
				             <td align="left">
								<input type='radio' name="isexamsave" value="3" checked onclick="chsaveMode(this)">������ǰҳ����
								<input type='radio' name="isexamsave" value="1" onclick="chsaveMode(this)">��ѡ���ݵ���         
				             </td>
			            </tr> 	
			            
						<tr id="tr_begin_no" style="display:none">
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>������ʼ��ţ�
							</td>
							<td width="*" align='left'>
								<html:text property="begin_no" size="20"></html:text>
							</td>
						</tr>
						<tr id="tr_end_no" style="display:none">
							<td width="20%" align='right' nowrap="nowrap">
								<font color="#FF0000">*</font>����������ţ�
							</td>
							<td width="*" align='left'>
								<html:text property="end_no" size="20"></html:text>
							</td>
						</tr>											
						<tr id="tr_subbtn" style="display:none">
							<td width="20%" >
								&nbsp;
							</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="�� ��"
									onClick="doSubmit('tpla_export_rslt.do')">
							</td>
						</tr>
						<tr id="tr_curr_subbtn">
							<td width="20%" >&nbsp;</td>
							<td align="left">
								<input type="hidden" name="new_qry_flag" value="1" />
								<input type="button" value="�� ��"
									onClick="exportMyExecl()">
								<font color="#FF3300">���������Ҫ10�����ң������ĵȴ�</font>
							</td>
						</tr>						
												
					</table>
				</div>
				
				<input type="hidden" name="hid_save" id="hid_save"/>
				<div id='loading' class='css012'>
					<font color='#FF0000'>���ڵ�����ǰҳ���ݣ����Ժ�...</font>
				</div>

				<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
				<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
				<div class="awp_msgtab">
				  <table>
					<tr> 
			        <td ><p><strong>ϵͳ��ʾ��</strong><br>
			        <UL>
							<LI>1��������ʱ����ѡ��ļ�¼�����йأ�ѡ��ļ�¼����Խ�࣬��Ҫ�ĵ���ʱ��Խ��
							<LI>2�����ڴ������ݣ����Է�Ϊ��ε���
							<LI>3��Ŀǰϵͳ�������ĵ�������Ϊ255���������������255��Ĭ��ѡ��ǰ255�е���
							<LI>4��Ŀǰϵͳ�������ĵ�����¼��Ϊ10000��
						</UL>
			        </td>
			        </tr>
			      </table>
			    </div>
			</html:form>
		</div>
	</BODY>
</HTML>
