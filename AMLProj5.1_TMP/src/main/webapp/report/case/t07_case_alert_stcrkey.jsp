<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
		<script type="text/javascript" src="../../js/unitpngfix.js"></script>
		<![endif]-->
		<link rel="stylesheet" href="../../css/css_all.css" type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/uc.js"></script>
		<script language="JavaScript" src="../../js/selectbox.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script language="JavaScript">
		     var s;
			 function get_stcrkey(o){
				          var a=o.value;
				          document.getElementById("new1").value=a;
				          s=a;
				      }
		   function dosubmit(theUrl){
		      if (s==null){
		      alert('��ѡ�����������������');
		      }
		      else
		      {
			      if (confirm('��ȷ��Ҫ�ѿ��������޸�Ϊ'+s+'��')) {
			          var application_num='<bean:write name="application_num" />';
			          var stcr='<bean:write name="stcr" />';
			          document.forms[0].action=theUrl+'?stcrkey='+s+'&application_num='+application_num+'&stcr='+stcr;
		              document.forms[0].submit();
		           
		              var obj = window.parent;
		              window.parent.ymPrompt.close();
		              obj.test1();
				 } else {
				     return false;
			    }
		     }
/**
			alert("�޸ĳɹ�!");
			var obj = window.opener;
            obj.changeS(s);
            window.close();
**/
       	         
	      }

        </script>
	</head>
	<body class="mainbg">
		<html:form method="post" action="/case/modifyT07_case_stcrDo.do">
			<div id="main">
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>����������Ϣ</span>
						<span class="buttons"> 
						   <a href="#" onclick="dosubmit('modifyT07_case_stcrDo.do')">
						       <img src="../../images/<%=session.getAttribute("style") %>/b_submit.png" />ȷ ��
						   </a>&nbsp;&nbsp; 
						   <a href="#" onclick="javascript:window.parent.ymPrompt.close(); ">
						       <img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��
						   </a>&nbsp;&nbsp;
						    
					    </span>
					</div>
					
						<div class="cond_c">
							<table border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td>
										ԭ��������:
									</td>
									<td>
										<bean:write name="stcr" />
									</td>
									<td>
										����������:
									</td>
									<td>
										<input type="text" name="stcrkey" value="" id="new1" readonly />
									</td>
								</tr>
							</table>
						</div>
					</div>
					<!--  <div class="cond_t2">
						<span class="buttons">
					        <strong><img src="../../images/<%=session.getAttribute("style") %>/titleicon02.gif" />���������б�</strong> 
					    </span>
					</div>
					-->
					<div class="list">
						<table border="0" cellspacing="0" cellpadding="0">
							<tr>
								<th>
									ѡ��
								</th>
								<th>
									��������
								</th>
								<th>
									���ʹ���
								</th>
								<th>
									�������
								</th>
							</tr>
							<logic:iterate id="t07_pbcruleList" name="t07_pbcruleList"
								type="com.ist.aml.report.dto.T07_pbcrule">
								<tr>
									<td>
										<input type="radio" name="radio" value="<bean:write name="t07_pbcruleList" property="pbckey" />" onclick="get_stcrkey(this)" />
									</td>
									<td>
										<bean:write name="t07_pbcruleList" property="pbckey" />
									</td>
									<td>
										<bean:write name="t07_pbcruleList" property="stcrkey" />
									</td>
									<td>
										<bean:write name="t07_pbcruleList" property="pbc_des" />
									</td>
								</tr>
							</logic:iterate>
						</table>
					</div>

					<!-- list_page -->
					<%--  <div class="list_page">
						<bean:write name="pageInfo" scope="request" filter="false" />
					</div>--%>
				</div>
		</html:form>
	</body>
</html>
