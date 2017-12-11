<%@ page language="java" pageEncoding="GBK"%>

<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html:html lang="true">
<head>
	<html:base />
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	function checkForm(theUrl){

		    var errMsg ="";
		     if(getLength(document.forms[0].setype.value)==0){
		        errMsg+="�������Ͳ���Ϊ�գ�";
		        document.forms[0].setype.focus();
		    }else if(getLength(document.forms[0].des.value)==0){
		        errMsg+="���������Ʋ���Ϊ�գ�";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].des.value)> 256){
		        errMsg+="���������Ʋ��ܶ���256���ַ���";
		        document.forms[0].des.focus();
		    } else if(getLength(document.forms[0].sql.value)==0){
		        errMsg+="SQL����Ϊ�գ�";
		        document.forms[0].sql.focus();
		    //} 	
		    //else if(getLength(document.forms[0].block.value)==0){
		       // errMsg+="�ϼ������鲻��Ϊ�գ�";
		       // document.forms[0].block.focus();
		    }else if(getLength(document.forms[0].sql.value)> 4000){
		        errMsg+="������ϲ��ܶ���4000���ַ���";
		        document.forms[0].sql.focus();
		    //}else if(getLength(document.forms[0].fields.value)> 500){
		    //    errMsg+="�ֶμ��ϲ��ܶ���500���ַ���";
		    //    document.forms[0].fields.focus();
		    }else if(getLength(document.forms[0].url.value)> 200){
		        errMsg+="����URL���ܶ���200���ַ���";
		        document.forms[0].url.focus();
		    } 
		    		       
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		function seturl(val){
		   var urlEle = document.getElementById('url');
			if(val == '0'){
			   urlEle.value = "/awp/cmp/attachment/t01_attachment_disp.do?attachkey=#attachkey#";
			}else{
			   urlEle.value  = '<bean:write name="t12_se_file_dbActionForm" property="url"/>';
			}
		}
	</SCRIPT>
</head>

<body>
	<div id='content'>
		<html:form method="POST"
			action="/system_manager/t12_se_file_db/t12_se_file_db_modify.do">

			<div class='awp_title'>

				<table>
					<tr>
						<td width="23%" nowrap>
							<span class="awp_title_td2">���ݿ��������� - �� �� </span>
						</td>
						<td align="right">
							<html:button property="backbutton" value="��  ��"
								styleClass="input" onclick="awpDoSubmit('t12_se_file_db_list.do','add')" />
						</td>
					</tr>
				</table>
			</div>

			<div class='awp_detail'>
				<TABLE>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>���������ƣ�
						</td>
						<td>
							<html:text property="des" size="32"></html:text>
						</td>
					</tr>
					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>�������ͣ�
						</td>
						<td>
							<html:select property="setype" onchange="seturl(this.value)">
								<html:options collection="seTypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<!--  <tr>
						<td>
							�Ƿ���HTML��ǩ��
						</td>
						<td>
							<html:select property="ishtml">
								<html:options collection="yesNoMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>
					<tr>
						<td>
							�ϼ������飺
						</td>
						<td>
							<html:select property="block">
								<html:options collection="indexBlockMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
					</tr>-->

					<tr>
						<td>
							<FONT color="#ff0000">*</FONT>SQL���壺
						</td>
						<td>
							<html:textarea property="sql" cols="60" rows="10">

							</html:textarea>
						</td>
					</tr>
					<!-- <tr>
						<td>
		 					�ֶμ��ϣ�
						</td>
						<td>

							<html:text property="fields" size="64"></html:text>
						</td>
					</tr>
					 -->
					<tr>
						<td>
							����URL��
						</td>
						<td>
							<html:textarea property="url" cols="60" rows="5">

							</html:textarea>

						</td>
					</tr>

					<tr>
						<td>
							<input type="hidden" name="id"
								value="<bean:write property="id" name="t12_se_file_dbActionForm"/>" />
						</td>
						<td>
							<html:button property="button" value="��  ��" styleClass="input"
								onclick="checkForm('t12_se_file_db_modify_do.do')" />
							<html:reset styleClass="input" value="��  ��" />
						</td>
					</tr>

				</TABLE>
			</div>
			<div class="awp_msgtab">
			    <table>
			      <tr>
			        <td ><p><strong>˵ ����</strong><br>
			            ��sql���塿<br>
			                                   ���ݱ��������(TITLE�� ����,SECLEVEL�� �ܼ� ,CONTENT�� ����)<br/>
			                                    �������������(TITLE�� ����,SECLEVEL�� �ܼ� ,CONTENT�� ����·��) <br/> 
			            ������URL��<br> 
			                               ����sql�����г������ֶ���������ֶ�������<br>
			             ��ʾ����<br/>
			                            ��������:���ݱ�<br/> 
			           sql���壺 SELECT title AS TITLE,'1' AS SECLEVEL,DES AS CONTENT,NOTETIME,USERNAME FROM T00_CAL_NOTES<br/>
			                             ����URL�� bmp/platform/t00_cal_notes/t00_cal_notes_list_bytime.do?newsearchflag=1&type=2&USERNAME=#USERNAME#<br/>       
			      </tr>
			    </table>	    
			  </div>
		</html:form>
	</div>
</body>

</html:html>
