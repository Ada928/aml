<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/calendar.js"></script>
		<script language="JavaScript">
function dosubmit(theUrl,type){
       var errMsg = "";
       var isSub = false;
       <logic:present name="t23_rule_moduleList">
       <bean:size id="len" name="t23_rule_moduleList" />
       	<logic:equal name="len" value="0">
       		alert('û�пɲ��������ݣ�');
       		return false;
   		</logic:equal>
       </logic:present>
       var len=document.forms[0].selectedModuleno.length;
       
       if(type=='cancel'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫȡ��������ѡ��ģ����')){
                isSub = true;
            }
        }
      }
        else if(type=='release'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(len > 1)
        {
        for(var i=0;i<len;i++){
        	var obj = document.forms[0].selectedModuleno[i];
        	if(obj.checked){
        		if(document.getElementById("module_"+obj.value).value=='1' ){
        			errMsg+="��ѡ��ģ�� �Ѵ��ڷ���״̬��";
        		}
        	}
        }
        }
        else
        {
        	var obj = document.forms[0].selectedModuleno;
        	if(obj.checked){
        		if(document.getElementById("module_"+obj.value).value=='1' ){
        			errMsg+="��ѡ��ģ�� �Ѵ��ڷ���״̬��";
        		}
        	}
        }
        if(errMsg==''){
            if(confirm('�����Ҫ������ѡ��ģ����')){
                isSub = true;
            }
        }
      }
      if(isSub && errMsg==''){
            document.forms[0].action=theUrl;
            document.forms[0].submit();
        }else{
            if(errMsg!='')
                alert(errMsg);
            return false;
        }
    }
function dosubmit1(theUrl,type){
	var errMsg = "";
    var isSub = false;
	if(type=='search'){
         _Date1 = document.forms[0].create_dt_start_disp.value;
    	_Date2 = document.forms[0].create_dt_end_disp.value;  
    	if(!_isDateSpaceComplete(_Date1, _Date2))
    		errMsg += "����д��������ʼʱ�䷶Χ��";
         else if(_Date1!="" && !formatDateAlert(_Date1))
            return false;       
         else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	      
         else if(!_compareTwoDateForString(_Date1, _Date2) )
  			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
        isSub = true;
       }
      if(isSub && errMsg==''){
            document.forms[0].action=theUrl;
            document.forms[0].submit();
        }else{
            if(errMsg!='')
                alert(errMsg);
            return false;
        }
}
</script>
	</head>
	<body class="mainbg">
		<html:form action="/module/module_releaselist.do" method="post">
			<html:errors />
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->

					<div class="cond_t">
						<span>�߼�ģ�ͷ���</span>
						<span class="buttons"> <a href="#"
							onclick="dosubmit('module_release.do?status_cd=1','release')"><img
									src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />����</a>
							<a href="#" onclick="dosubmit('module_cancelRelease.do?status_cd=0','cancel')"><img
									src="../../images/<%=session.getAttribute("style")%>/b_re_refused.png" />ȡ������</a>
						</span>	
					</div>
					<!-- table content -->
					<div class="cond_c" id="searchtable">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									ģ�����ƣ�
								</td>
								<td>
									<html:text property="module_name" maxlength="100"/>
								</td>

								<td nowrap>
									���ͣ�
								</td>
								<td>
									<html:select property="module_type">
										<html:options collection="module_typeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>

								<td>
									״̬��
								</td>
								<td>
									<html:select property="status_cd">
										<html:options collection="status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									�������ڣ�
								</td>
								<td>
									<html:text property="create_dt_start_disp" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
									<!--<html:text property="create_dt" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />-->
									--
									<html:text property="create_dt_end_disp" size="12"
										onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
								</td>

							</tr>
							<tr>
								<td >
									���
								</td>
								<td>
									<html:select property="module_grey">
										<html:options collection="module_greyMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									&nbsp;
								</td>
								<td>
									<input type="button" class="in_button1" name="search"
										value="�� ѯ"
										onclick="dosubmit1('module_releaselist.do?newsearchflag=1&flag=1&status=1,2','search')" />
								</td>
							</tr>


						</table>

					</div>
				</div>


				<div class="list">
					<table>
						<tr>
							<th>
								ѡ��
							</th>
							<th>
								ģ�ͱ��
							</th>
							<th>
								ģ������
							</th>
							<th>
								����
							</th>
							
							<!-- <th>
								ģ������
							</th> -->
							<th>
								������
							</th>
							<th>
								��������
							</th>
							<th>
								���
							</th>
							<th>
								״̬
							</th>
						</tr>
						<logic:iterate id="t23_rule_module" name="t23_rule_moduleList"
							type="com.ist.mfa.dto.T23_rule_module">
							<%
								java.util.HashMap map = new java.util.HashMap();
										map.put("module_no", t23_rule_module.getModule_no());
										pageContext
												.setAttribute("map", map, PageContext.PAGE_SCOPE);
							%>

							<tr>
								<td>
									<html:multibox property="selectedModuleno">
										<bean:write name="t23_rule_module" property="module_no" />,<bean:write name="t23_rule_module" property="status_cd" />
									</html:multibox>
									<input type="hidden"
											id="module_<bean:write name="t23_rule_module" property="module_no" />,<bean:write name="t23_rule_module" property="status_cd" />"
											name="module_<bean:write name="t23_rule_module" property="module_no" />"
											value="<bean:write name="t23_rule_module" property="status_cd" />">
								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_no"
										scope="page" />
								</td>
								<td>
									<html:link name="map" page="/module/module_release_disp.do">
										<bean:write name="t23_rule_module" property="module_name"
											scope="page" />
									</html:link>
								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_type"
										scope="page" />
								</td>
								<!-- 
								<td>
									<bean:write name="t23_rule_module" property="module_des"
										scope="page" />
								</td> -->
								<td>
									<bean:write name="t23_rule_module" property="create_user"
										scope="page" />
								</td>
								<td>
									<bean:write name="t23_rule_module" property="create_dt_disp"
										scope="page" />


								</td>
								<td>
									<bean:write name="t23_rule_module" property="module_grey_disp"
										scope="page" />
								</td>
								<td>
									<bean:write name="t23_rule_module" property="status_cd_disp"
										scope="page" />
								</td>
							</tr>
						</logic:iterate>

					</table>
				</div>

				<!-- all end -->
				<div class="list_page">
					<table width="98%" border="0" align="center" cellpadding="3"
						cellspacing="3">
						<tr>
							<td align="center">
								<bean:write name="pageInfo" scope="request" filter="false" />
							</td>
						</tr>
					</table>
				</div>
			</div>
		</html:form>
	</body>
</html>