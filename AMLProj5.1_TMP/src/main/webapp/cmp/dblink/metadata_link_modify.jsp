<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312"/>
		<link id="skincss" href="../../css/aml_<bean:write name="style" scope="session"/>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
	<script language="JavaScript">
	function dosubmit(theUrl){
	   document.forms[0].action=theUrl;
	   document.forms[0].submit();
	}
	function checkForm(theUrl){
	    var errMsg ="";
	     
	    
	    if(getLength(trim(document.forms[0].dblinkname.value))==0){
	        errMsg+="�������Ʋ���Ϊ�գ�";
	        document.forms[0].dblinkname.focus();
	    }
	    else if(getLength(trim(document.forms[0].dburl.value))==0){
	        errMsg+="URL����Ϊ�գ�";
	        document.forms[0].dburl.focus();
	    } 
	    else if(checkChinese(document.forms[0].dburl.value)){
	        errMsg+="URL���ܺ���˫�ֽ��ַ���";
	        document.forms[0].dburl.focus();
	    } 
	    <%--else if (getLength(document.forms[0].dbuser.value) == 0) {
			errMsg += "�û�������Ϊ�գ�";
			document.forms[0].dbuser.focus();
		}   
	    else if (getLength(document.forms[0].dbuser.value) > 32) {
			errMsg += "�û������ܴ���32���ַ���";
			document.forms[0].dbuser.focus();
		}else if (getLength(document.forms[0].dbpass.value) == 0) {
			errMsg += "���벻��Ϊ�գ�";
			document.forms[0].dbpass.focus();
		}
		else if (getLength(document.forms[0].dbpass.value) > 32) {
			errMsg += "���벻�ܴ���32���ַ���";
			document.forms[0].dbpass.focus();
		}
		else if (checkChinese(document.forms[0].dbpass.value)) {
			errMsg += "���벻�ܺ���˫�ֽ��ַ���";
			document.forms[0].dbpass.focus();
		}--%>
	    //��ʾ���
	    else if(getLength(document.forms[0].dispseq.value)==0){
	        errMsg+="��ʾ��Ų���Ϊ�գ�";
	        document.forms[0].dispseq.focus();
	    }
	    else if(document.forms[0].dispseq.value.replace(/[\d+]/ig,"").length>0){
	    	errMsg+="��ʾ��ű���Ϊ����";
	        document.forms[0].dispseq.focus();
	    }
	    else if (getLength(document.forms[0].itablespace.value) > 32) {
			errMsg += "��ռ䲻�ܴ���32���ַ���";
			document.forms[0].itablespace.focus();
		}else if (getLength(document.forms[0].indexname.value) > 32) {
			errMsg += "�����ռ䲻�ܴ���32���ַ���";
			document.forms[0].indexname.focus();
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
	<html:form action="/dblink/metadata_link_modify_do" method="POST">
	<input type="hidden" name="dblinkkey_old" value="<bean:write name="T01_db_linkActionForm" property="dblinkkey"/>" />
		<div id="main">
			<!-- conditions --> 
			  <div class="conditions">
				<div class="awp_wrap">
				  <!-- �������� -->
				    <div class="cond_t">
					  <span>�ڲ����ݿ�����  - �� ��</span>
					  <span class="buttons">
					   <a href="#" onclick="dosubmit('metadata_link_list.do');"><img src="../../images/blue/b_back.png" />����</a>
					  </span>
					</div>
				</div>
				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class="cond_c2">
		  			<table border="0" cellpadding="0" cellspacing="0">
						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>Springע��ID��
							</td>
							<td >
								<html:text property="dblinkkey" styleClass="text_white" size="32" />
							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>�������ƣ�
							</td>
							<td >
								<html:text property="dblinkname" styleClass="text_white" size="32" />

							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>��ʾ��ţ�
							</td>
							<td >
								<html:text property="dispseq" styleClass="text_white" size="20" />
							</td>
						</tr>

						<tr >
							<td height="22" align="right" >
								<FONT color="#ff0000">*</FONT>���ݿ����ͣ�
							</td>
							<td >
								<html:select property="dbtype">
									<html:options collection="link_typeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>


						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>URL��
							</td>
							<td >
								<html:text property="dburl" styleClass="text_white" size="64" />
							</td>
						</tr>

						<%--<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>�û�����
							</td>
							<td >
								<html:text property="dbuser" styleClass="text_white" size="32" />
								(���Կո����)
							</td>
						</tr>

						<tr >
							<td  >
								<FONT color="#ff0000">*</FONT>���룺
							</td>
							<td >
								<html:text property="dbpass" styleClass="text_white"
									size="32" />
								(���Կո����)
							</td>
						</tr>

						--%>
						<tr >
							<td height="22" align="right" >
								<FONT color="#ff0000">*</FONT>״̬��
							</td>
							<td >
								<html:select property="flag">
									<html:options collection="stsMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr >
							<td  >
								��ռ䣺
							</td>
							<td >
								<html:text property="itablespace" styleClass="text_white" size="32" />
							</td>
						</tr>
						<tr >
							<td  >
								�����ռ䣺
							</td>
							<td >
								<html:text property="indexname" styleClass="text_white" size="32" />
							</td>
						</tr>
						<tr >
							<td  >
								������
							</td>
							<td >
								<html:textarea property="des" rows="4" cols="60"
									styleClass="text_white"></html:textarea>
							</td>
						</tr>
						<tr >
							<td  >
							</td>
							<td >
								<html:button property="button" styleClass="in_button1" value="��  ��"
									onclick="checkForm('metadata_link_modify_do.do')" />
								<html:reset styleClass="in_button1" value="��  ��" />
							</td>
						</tr>
					</table>
				</div>	
			</div>
		</div>
	</html:form>
</body>
</html>