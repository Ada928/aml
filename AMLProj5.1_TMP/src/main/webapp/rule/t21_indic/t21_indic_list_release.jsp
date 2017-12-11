<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script language="JavaScript">
function dosubmit1(theUrl,type){
    var errMsg = "";
    var isSub = false;
    <logic:present name="t21_indicList">
    <bean:size id="len" name="t21_indicList" />
    	<logic:equal name="len" value="0">
    		alert('û�пɲ��������ݣ�');
    		return false;
		</logic:equal>
    </logic:present>
    var len=document.forms[0].indickey1.length;
     
  	if(type=='do'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(len >= 1)
        {
            	for(var i=0;i<len;i++){
            		var obj = document.forms[0].indickey1[i];
            		if(obj.checked){
            			if(document.getElementById("indic_"+obj.value).value !='0'){
            				errMsg+="��ѡ���ָ����Ȩ������з�����";
            				break;
            			}
            		}
           	 }
        }
        if(errMsg==''){
            if(confirm('�����Ҫ������ѡ��ָ����')){
                isSub = true;
            }
        }
        
    }
    else if(type=='undo'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(len >= 1)
        {
            	for(var i=0;i<len;i++){
            		var obj = document.forms[0].indickey1[i];
            		if(obj.checked){
            			if(document.getElementById("indic_"+obj.value).value !='1'){
            				errMsg+="��ѡ���ָ����Ȩ�������ȡ������������";
            				break;
            			}
            		}
           	 }
        }
        if(errMsg==''){
            if(confirm('�����Ҫȡ��������ѡ��ָ����')){
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

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
     
  	if(type=='search')
	{
		if(checkChinese(document.forms[0].indickey.value)){
     		errMsg="ָ����벻�ܺ��к��֣�";
     		document.forms[0].indickey.focus();
    	}
    	else
    		isSub=true;
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
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<html:form action="/t21_indic/t21_indic_list_release.do" method="post">
			<html:hidden name="t21_indicActionForm" property="mark" />
			<html:hidden name="t21_indicActionForm" property="release" />
				<div class="conditions">
					<div class="cond_t">
						<span>ָ�����</span>
						<span class="buttons">
						<a href="#" id="hdd_display" class="bt_hidden"></a>
						<a href="#" onclick="dosubmit1('t21_indic_release_do.do?newsearchflag=1','do')"><img src="../../images/<%=session.getAttribute("style")%>/b_edit.png" />����</a>
						<a href="#" onclick="dosubmit1('t21_indic_release_undo.do?newsearchflag=1','undo')"><img src="../../images/<%=session.getAttribute("style")%>/b_re_refused.png" />ȡ������</a> 
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									ָ����룺
								</td>
								<td>
									<html:text property="indickey" size="24" maxlength="12" />
								</td>
								<td width="10%">ָ�����ƣ�</td>
								<td width="40%"><html:text property="indicname_str" size="39" maxlength="80" /></td>
								</tr>
								<tr>
								<td>
									����Ƶ�ȣ�
								</td>
								<td>
									<html:select property="granularitys">
										<html:options collection="granularitysMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									ָ�����ͣ�
								</td>
								<td>
									<html:select property="indic_attr">
										<html:options collection="indic_attrMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									����״̬��
								</td>
								<td>
									<html:select property="flag">
										<html:options collection="flagMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
								</td>
								<td>
									<input type="button" value="�� ѯ" class="in_button1"
										onclick="dosubmit('t21_indic_list_release.do?newsearchflag=1&newenterflag=1', 'search');"/>
								</td>
								
							</tr>

						</table>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							<th>
								ѡ��
							</th>


							<th>
								ָ�����
							</th>


							<th>
								ָ������
							</th>
							<th>
								ָ������
							</th>

							<th>
								����Ƶ��
							</th>

							<th>
								ָ�����
							</th>



							<th>
								ָ����ʵ��
							</th>

							<logic:equal name="t21_indicActionForm" property="mark" value="1">
							<th>
								ָ�꽻����ʵ��
							</th>
							</logic:equal>



							<th>
								����״̬
							</th>

							<th>
								��������
							</th>


						</TR>
						<logic:iterate id="info" name="t21_indicList" indexId="i"
							type="com.ist.aml.rule.dto.T21_indic">
							<TR align="center" class="interval"
								onMouseOver="this.className = 'interval2';"onMouseOut="this.className = 'interval';">
								<TD height=22>
									<html:multibox property="indickey1">
										<bean:write name="info" property="indickey" />-<bean:write name="info" property="indic_table" scope="page" />-<bean:write name="info" property="granularitys" scope="page" />
									</html:multibox>
									
									<input type="hidden"
											id="indic_<bean:write name="info" property="indickey" />-<bean:write name="info" property="indic_table" scope="page" />-<bean:write name="info" property="granularitys" scope="page" />"
											name="indic_<bean:write name="info" property="indickey" />"
											value="<bean:write name="info" property="flag" />">
								</TD>
								<TD>
									<a href="<%=request.getContextPath() %>/rule/t21_indic/t21_indic_disp.do?indickey=<bean:write name="info" property="indickey" />">
									<bean:write name="info" property="indickey" />
									</a>
								</TD>
								<TD>
									<bean:write name="info" property="indicname" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indic_attr_disp" scope="page" />
								</TD>
								
								<TD>
									<bean:write name="info" property="granularitys_disp" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indictype" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="indic_table" scope="page" />
								</TD>
								<logic:equal name="t21_indicActionForm" property="mark" value="1">
								<TD>
									<bean:write name="info" property="transtable" scope="page" />
								</TD>
								</logic:equal>
								<TD>
									<logic:equal name="info" property="flag" value="1">
									�ѷ���
									</logic:equal>
									<logic:equal name="info" property="flag" value="0">
									δ����
									</logic:equal>
								</TD>
								<TD>
									<bean:write name="info" property="create_dt_disp" scope="page" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>

				</div>
				<div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>

			</html:form>
			<!--��ʾ��-->
			<div id=div_hint
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style =   0, opacity =   80, finishOpacity =   100);"></div>
		</div>
	</BODY>
</HTML>
