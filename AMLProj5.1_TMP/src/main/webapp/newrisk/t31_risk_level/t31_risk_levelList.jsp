<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>������׼ - ������������</title>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
	function dosubmit(theUrl,type){
		var errMsg = "";
	     if(type=='del'){
	      errMsg = CheckBoxMustChecked(document.forms[0]);
	      if(errMsg !=""){
	      	alert(CheckBoxMustChecked(document.forms[0]));
	      }
	      if(errMsg==''){
            if(confirm('�����Ҫɾ��ѡ��ķ��յȼ����ã�')){
                document.forms[0].action=theUrl;
        		document.forms[0].submit();
            }
           }
        }else if(type=='add'){
       		document.forms[0].action=theUrl;
            document.forms[0].submit();
        }
	    
	}
</SCRIPT>

</HEAD>
<body leftmargin="0" topmargin="0">
	<html:form action="/t31_risk_level/t31_risk_levelList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>���ù��� - ���յȼ����� </span>
					<span class="buttons"> 
				
	   <!--<a href="#" onClick="dosubmit('t08_level_mod.do','mod')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>-->



		<a href="#" onClick="dosubmit('t13_level_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
	   <a href="#" onClick="dosubmit('t13_level_del_do.do','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>


 
				  </span>
				</div>
				<!-- table content -->

			</div>

			
			<html:errors />
			<div class="list">
				<TABLE border="0" cellspacing="0" cellpadding="0">
					<TR>
						<th>
							ѡ��
						</th>
						<th>
							��������
						</th>
						<th>
							��������
						</th>
						<th>
							��������
						</th>
						<th>
							��������
						</th>
						<th>
							��������
						</th>
						<th>
							����ʱ��
						</th>
					</TR>
					
					<logic:iterate id="level" name="t31_risk_levelList"
						type="com.ist.aml.newrisk.dto.T31_risk_level">

						<TR>
							<TD>
								<html:multibox property="selectedLevelkey">
									<bean:write name="level" property="levelkey" />
								</html:multibox>
							</TD>
							<TD>
								<bean:write name="level" property="levelname"></bean:write>
							</TD>
							<TD>
								<bean:write name="level" property="maxisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="level" property="levelmax"></bean:write>
							</TD>
							<TD>
								<bean:write name="level" property="levelmin"></bean:write>
							</TD>
							<TD>
								<bean:write name="level" property="minisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="level" property="create_dt"></bean:write>
								<br>
							</TD>
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
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
			<!-- all end -->
			<div class="sys_warning">
				<strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
				<p>
					1���ɵ���ÿ���ȼ���Ӧ�ķ�ֵ���䡣
					<br />
					2����ֵ�����������ƥ�����ջ��ֶ�Ӧ����ĵȼ���
				</p>
			</div>
		</div>
	</html:form>

</body>
</html:html>
