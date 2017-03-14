<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
	<%
			String url = request.getContextPath();
			String cssurl = url + "/css/css_all.css";
			String titlejsurl = url + "/js/title.js";
			String basefuncurl = url + "/js/basefunc.js";
		%>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<script language="JavaScript" src=<%=titlejsurl%>></script>
		<script language="JavaScript" src=<%=basefuncurl%>></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

<script language="JavaScript">
function dosubmit(theUrl){
    ���� document.forms[0].action=theUrl;
      document.forms[0].submit();
}
function _Click(){
     var temp=document.getElementsByName("defparakey1");
     for (i=0;i<temp.length;i++)
     { 
       if(temp[i].checked) 
         document.forms[0].tag.value = temp[i].value ;
     }
     
}
function _Commit(){
	var mark = "<%=(String) request.getAttribute("mark")%>";
	//alert(mark);
    if(checkRadio(document.forms[0].defparakey1)<0){
           alert("��ѡ��");
           return false;
    } 
	else{
		if(mark == "1")
		{
			window.parent.document.forms[0].indic_sql.value = window.parent.document.forms[0].indic_sql.value + document.forms[0].tag.value;
		}
		else if(mark == "3"){
		    window.parent.document.forms[0].gz_defkey.value = document.forms[0].tag.value;
		}
		else if(mark == "2"){
			window.parent.document.forms[0].trans_sql.value = window.parent.document.forms[0].trans_sql.value + document.forms[0].tag.value;
   	 	}
   	 	window.parent.ymPrompt.close();
   }
}
</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
			<html:form action="/t21_defpara/defpara_search.do" method="post">
			<html:errors />
			<input type="hidden" name="input_name"
					value="<%=(String) request.getAttribute("input_name")%>" />
			<input type="hidden" name="mark"
					value="<%=(String) request.getAttribute("mark")%>" />
			
				<div class="conditions">
					<div class="cond_t">
						<span>�����б� </span>
						<span class="buttons">
						<a href="#" onclick="javascript:_Commit();"><img src="../../images/blue/b_choose.png" />ѡ��</a>
						<a href="#" onclick="window.parent.ymPrompt.close();"><img src="../../images/blue/b_shut.png" />�ر�</a>
	  					
						</span>
					</div>

					<div class="cond_c" id="searchtable">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<td>
									����ID:
								</td>
								<td>
									
									<html:text property="defparakey" size="10" maxlength="12" />
									
								</td>
								<td>
									����������
								</td>
								
									<td>
										<html:text property="para_des" size="20" maxlength="12" />
									</td>
									<td>
									  �Ƿ�Ϊ��̬������
									</td>
									<td>
									<html:select property="dyna_ind">
										<html:options collection="dyna_indMap" property="label"
											labelProperty="value" />
									</html:select>
								    </td>
									<td>
									<html:button property="button3" value="�� ѯ"
										styleClass="in_button1"
										onclick="dosubmit('defpara_search.do?newsearchflag=1')" />
									<html:hidden property="defparakey" />
									<html:hidden property="tag" />
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
								����ID
							</th>
							<th>
								��������
							</th>
							<th>
								����ֵ
							</th>
							<th>
								��������
							</th>
							<!--<th>
								������ʶ
							</th>-->
							
						</TR>
						<logic:iterate id="info" name="t21_defparaList" indexId="i"
							type="com.ist.aml.rule.dto.T21_defpara">
							<TR align="center" class="interval"
								onmouseover="this.className='interval2'"
								onmouseout="this.className='interval'">
								
								<td>
									<input type="radio" name="defparakey1" value="<bean:write name="info" property="tag" />" onclick="_Click()" />
								</td>
								<td>
									<bean:write name="info" property="defparakey" />
								</TD>
								<TD>
									<bean:write name="info" property="para_des" scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="para_val"scope="page" />
								</TD>
								<TD>
									<bean:write name="info" property="paratype" scope="page" />
								</TD>
								<!--<TD>
									<bean:write name="info" property="tag" scope="page" />
								</TD>-->
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
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style = 0, opacity = 80, finishOpacity = 100);"></div>
		</div>
	</BODY>
</HTML>
