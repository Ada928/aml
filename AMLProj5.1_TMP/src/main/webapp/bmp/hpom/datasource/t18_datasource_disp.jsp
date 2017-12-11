<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	 <link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<SCRIPT LANGUAGE="JavaScript">
	/** 1 - FTP�Լ�ȡ  / 2 - FTP�ͻ��� / 3 - JDBCȡ  / 4 - DBLINK�� / 5 - DBLINKȡ  /**/
	function changEle(value){

		if(value){
			//�������е�td
			displayAll();
		}
		
		if(value == '1'){
			isFtpGet();
		}else if(value == '2'){
			isFtpSend();
		}else if(value == '3'){
			isJdbc();
		}else if(value == '4'){
			isDblinkGet();
		}else if(value == '5'){
			isDblinkSend();
		}else {
			return false;
		}

	}
	function displayAll(){
		
		document.getElementById("file_div").style.display = "none";
		document.getElementById("pemotefilepath").style.display = "none";
		document.getElementById("send").style.display = "none";
		document.getElementById("fetch").style.display = "none";
		document.getElementById("unload").style.display = "none";
		document.getElementById("data_type").style.display = "none";
		document.getElementById("jdbc_con").style.display = "none";
		document.getElementById("jdbc_dblink").style.display = "none";
		document.getElementById("ftp_con").style.display = "none";
		document.getElementById("filetype").style.display = "none";
		document.getElementById("load_param").style.display = "none";
		document.getElementById("load_path").style.display = "none";
		document.getElementById("unload_path").style.display = "none";
		document.getElementById("jdbc_form").style.display = "none";
		document.getElementById("dspath").style.display = "none";
		document.getElementById("workpath").style.display = "none";
	}
	function isFtpGet(){
		//Զ�� �ļ� �Լ�ȡ ftp
		
		document.getElementsByName("flaglocation")[0].value = "0";
		document.getElementsByName("flaglocation")[0].disabled = true;

		document.getElementsByName("flagtype")[0].value = "file";
		document.getElementsByName("flagtype")[0].disabled = true;

		 
		document.getElementById("file_div").style.display = "";
		document.getElementById("pemotefilepath").style.display = "";

		document.getElementsByName("isget")[0].value = "1";
		document.getElementsByName("isget")[0].disabled = true;
		
		document.getElementById("fetch").style.display = "";
		document.getElementsByName("getmode")[0].value = "2";
		document.getElementsByName("getmode")[0].disabled = true;

		document.getElementById("ftp_con").style.display = "";
		document.getElementById("filetype").style.display = "";   
		document.getElementById("load_param").style.display = "";
		document.getElementById("load_path").style.display = "";
		document.getElementById("dspath").style.display = "";
		document.getElementById("workpath").style.display = "";		

	}

	function isFtpSend(){
		//���� �ļ� �ͻ��� ftp
		
		document.getElementsByName("flaglocation")[0].value = "1";
		document.getElementsByName("flaglocation")[0].disabled = true;

		document.getElementsByName("flagtype")[0].value = "file";
		document.getElementsByName("flagtype")[0].disabled = true;
		 
		document.getElementById("file_div").style.display = "";

		document.getElementsByName("isget")[0].value = "0";
		document.getElementsByName("isget")[0].disabled = true;

		document.getElementById("send").style.display = "";
		document.getElementsByName("putmode")[0].value = "2";
		document.getElementsByName("putmode")[0].disabled = true;

		document.getElementById("filetype").style.display = "";   
		document.getElementById("load_param").style.display = "";
		document.getElementById("load_path").style.display = "";
		document.getElementById("dspath").style.display = "";
		document.getElementById("workpath").style.display = "";		

	}

	function isJdbc(){
		//Զ�� �� �Լ�ȡ jdbc
		
		document.getElementsByName("flaglocation")[0].value = "0";
		document.getElementsByName("flaglocation")[0].disabled = true;

		document.getElementsByName("flagtype")[0].value = "record";
		document.getElementsByName("flagtype")[0].disabled = true;

		document.getElementsByName("isget")[0].value = "1";
		document.getElementsByName("isget")[0].disabled = true;

		document.getElementById("fetch").style.display = "";
		document.getElementsByName("getmode")[0].value = "1";
		document.getElementsByName("getmode")[0].disabled = true;

		document.getElementById("unload").style.display = "";			
		document.getElementsByName("fetchmethod")[0].value = "1";
		document.getElementsByName("fetchmethod")[0].disabled = true;

		document.getElementById("data_type").style.display = "";
		document.getElementById("jdbc_con").style.display = "";
		
		document.getElementById("filetype").style.display = "";   
		document.getElementById("load_param").style.display = "";
		document.getElementById("load_path").style.display = "";
		document.getElementById("jdbc_form").style.display = "";			
		document.getElementById("dspath").style.display = "";
		document.getElementById("workpath").style.display = "";		

	}

	function isDblinkGet(){
		//���� �� �ͻ��� dblink
		
		document.getElementsByName("flaglocation")[0].value = "1";
		document.getElementsByName("flaglocation")[0].disabled = true;

		document.getElementsByName("flagtype")[0].value = "record";
		document.getElementsByName("flagtype")[0].disabled = true;

		document.getElementsByName("isget")[0].value = "0";
		document.getElementsByName("isget")[0].disabled = true;

		document.getElementById("send").style.display = "";
		document.getElementsByName("putmode")[0].value = "1";
		document.getElementsByName("putmode")[0].disabled = true;

		document.getElementById("fetch").style.display = "";
		document.getElementsByName("getmode")[0].value = "1";
		document.getElementsByName("getmode")[0].disabled = true;

<%--			document.getElementById("unload").style.display = "";			--%>
<%--			document.getElementsByName("fetchmethod")[0].value = "2";--%>
<%--			document.getElementsByName("fetchmethod")[0].disabled = true;--%>
<%--			--%>
<%--			document.getElementById("jdbc_dblink").style.display = "";--%>

	}

	function isDblinkSend(){
		//Զ�� �� �Լ�ȡ dblink
		
		document.getElementsByName("flaglocation")[0].value = "0";
		document.getElementsByName("flaglocation")[0].disabled = true;

		document.getElementsByName("flagtype")[0].value = "record";
		document.getElementsByName("flagtype")[0].disabled = true;

		document.getElementsByName("isget")[0].value = "1";
		document.getElementsByName("isget")[0].disabled = true;

		document.getElementById("fetch").style.display = "";
		document.getElementsByName("getmode")[0].value = "1";
		document.getElementsByName("getmode")[0].disabled = true;

		document.getElementById("unload").style.display = "";			
		document.getElementsByName("fetchmethod")[0].value = "2";
		document.getElementsByName("fetchmethod")[0].disabled = true;
		
		document.getElementById("jdbc_dblink").style.display = "";

		document.getElementById("data_type").style.display = "";
		document.getElementById("jdbc_con").style.display = "";			
		
	}
	
	function dosubmit(theUrl){
	 document.forms[0].action=theUrl;
	 document.forms[0].submit();
	}
    </SCRIPT>
</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/hpom/t18_datasource_disp.do" method="post">
		<div id="main">
		    <div class="conditions">
				    <!-- title -->
					<div class="cond_t">
					  <span>ҵ������Դ���� - �鿴</span>
					  <span class="buttons">
						<a href="javascript:void(0);" onClick="dosubmit('t18_datasource_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
					  
					  </span>
					</div>
					
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="cond_c2">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							����Դ���룺
						</td>
						<td>
							<bean:write name="t18_datasource" property="dskey" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							����Դ���ƣ�
						</td>
						<td>
							<bean:write name="t18_datasource" property="dsname" scope="request" />
						</td>
					</tr>
					<tr>
						<td>
							ODS���ݱ�ǰ׺��
						</td>
						<td>
							<bean:write name="t18_datasource" property="odsprefix" scope="request" />
						</td>
					</tr>					
					<tr>
						<td>
							��ʶ�ļ�λ�ã�
						</td>
						<td>
							<bean:write name="t18_datasource" property="flaglocation_disp" scope="request" />
							<input type="hidden" name="flaglocation" value="<bean:write name="t18_datasource" property="flaglocation"/>"/>
						</td>
					</tr>
					<tr>
						<td>
							��ʶ���
						</td>
						<td>
							<bean:write name="t18_datasource" property="flagtype_disp" scope="request" />
							<input type="hidden" name="flagtype" value="<bean:write name="t18_datasource" property="flagtype"/>"/>
								<div style="display: none" id="file_div">
									<font color="red">FILE:{�ļ�·��} /{�ļ�ǰ׺}YYYYMMDD{�ļ���׺}</font>
									<br>
									file��
									<bean:write name="t18_datasource" property="filepath" scope="request" />
									/
									<bean:write name="t18_datasource" property="filepre" scope="request" />
									YYYYMMDD
									<bean:write name="t18_datasource" property="fileend" scope="request" />
								</div>
								<div style="display: none" id="pemotefilepath">
									Զ��·����
									<bean:write name="t18_datasource" property="remotefilepath" scope="request" />
								</div>
						</td>
					</tr>
					<tr>
						<td>
							�Ƿ���Ҫȡ����
						</td>
						<td>
							<bean:write name="t18_datasource" property="isget_disp" scope="request" />
							<input type="hidden" name="isget" value="<bean:write name="t18_datasource" property="isget"/>"/>
						</td>
					</tr>
					<tr id="fetch">
						<td>
							ȡ����ʽ��
						</td>
						<td>
							<bean:write name="t18_datasource" property="getmode_disp" scope="request" />
							<input type="hidden" name="getmode" value="<bean:write name="t18_datasource" property="getmode"/>"/>
						</td>
					</tr>
					<tr id="unload">
							<td>
								ж�ط�ʽ��
							</td>
							<td>
								<bean:write name="t18_datasource" property="fetchmethod_disp" scope="request" />
								<input type="hidden" name="fetchmethod" value="<bean:write name="t18_datasource" property="fetchmethod"/>"/>
							</td>
						</tr>
					<tr id="send" style="display: none">
						<td>
							������ʽ��
						</td>
						<td>
							<bean:write name="t18_datasource" property="putmode_disp" scope="request" />
							<input type="hidden" name="putmode" value="<bean:write name="t18_datasource" property="putmode"/>"/>
						</td>
					</tr>
					<tr id="data_type">
						<td>
							����Դ���ݿ����ͣ�
						</td>
						<td>
							<bean:write name="t18_datasource" property="dbtype_disp" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_con" style="display:none">
						<td>
							ȡ��������Ϣ��
						</td>
						<td>
							&nbsp;&nbsp;DRIVER��
								<bean:write name="t18_datasource" property="driver" scope="request" />
								<br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;URL��
								<bean:write name="t18_datasource" property="url" scope="request" />
								<br>
								USERNAME��
								<bean:write name="t18_datasource" property="username" scope="request" />
								<br>
								PASSWORD��
								<bean:write name="t18_datasource" property="password" scope="request" />
								<br>
								���ݿ������
								<bean:write name="t18_datasource" property="serveralias" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_dblink" style="display: none">
							<td noWrap>
								dblink��
							</td>
							<td>
								<bean:write name="t18_datasource" property="getmethod" scope="request" />
							</td>
						</tr>
					<tr id="ftp_con" style="display:none">
						<td>
							ȡ��������Ϣ��
						</td>
						<td>  	
						<font color="red">*FTP://IP��ַ:�û���:����</font>
						<br>
						FTP://				
						<bean:write name="t18_datasource" property="ftp_url" scope="request" />
						:
						<bean:write name="t18_datasource" property="ftp_username" scope="request" />
						:
						<bean:write name="t18_datasource" property="ftp_password" scope="request" />
						<br>			
						</td>
					</tr>
					<tr id="filetype">
						<td>
							�ļ����ͣ�
						</td>
						<td>
							<bean:write name="t18_datasource" property="db2filetype_disp" scope="request" />
							<input type="hidden" name="db2filetype" value="<bean:write name="t18_datasource" property="fetchmethod"/>"/>
						</td>
					</tr>
					<tr id="load_param" style="display: none">
							<td noWrap>
							</td>
							<td>
								<bean:write name="t18_datasource" property="loadparam" scope="request" />
							</td>
						</tr>
					<tr id="load_path" style="display: none">
							<td noWrap>
								װ������·����
							</td>
							<td>
								<bean:write name="t18_datasource" property="loadcmdpath" scope="request" />
							</td>
					</tr>
					<tr id="unload_path" style="display: none">
						<td noWrap>
							ж������·����
						</td>
						<td>
							<bean:write name="t18_datasource" property="fetchcmdpath" scope="request" />
						</td>
					</tr>
					<tr id="jdbc_form">
						<td>
							��ҳ��С��
						</td>
						<td>
							<bean:write name="t18_datasource" property="totalcount"  scope="request" />
						</td>
					</tr>
					<tr id="dspath">
						<td>
							�����ļ���ʱĿ¼��
						</td>
						<td>
							<bean:write name="t18_datasource" property="dspath" scope="request" />
						</td>
					</tr>
					<tr id="workpath">
						<td>
							�����ļ�����Ĺ���Ŀ¼��
						</td>
						<td>
							<bean:write name="t18_datasource" property="workpath"  scope="request" />
						</td>
					</tr>	
					<tr>
						<td>
							��ע��
						</td>
						<td>
							<bean:write name="t18_datasource" property="des" scope="request" />
						</td>
					</tr>				
				</table>
			</div>
			
			<input type="hidden" id="dst" value="<bean:write name="t18_datasourceActionForm" property="dstype"/>"/>
			</div>
			</div>
		</html:form>
	</BODY>
	<script type="text/javascript">
	displayAll();
	changEle(document.getElementById('dst').value);
	</script>
</html:html>
