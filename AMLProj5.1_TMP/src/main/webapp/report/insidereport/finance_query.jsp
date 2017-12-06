<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_blue.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/basefunc.js"></script>
 <script type="text/javascript" src="../../js/ymPrompt.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
<script type="text/javascript">
     function dosubmit(theUrl){
     document.forms[0].action=theUrl;
     document.forms[0].submit();
}
</script>

<style type="text/css">
	* {
		font-size: 15px;
	}
	body {
		padding: 50px 0 0 100px;
	}
	select {
		padding: 4px;
		margin-top: 10px;
	}
	.download {
		margin-top: 10px;
	}
</style>
</head>
<body>
	<html:form action="/insidereport/finance_query.do" enctype="multipart/form-data" method="post">
		<label>上传:</label>&nbsp;<input type="file" name="file_upload" /><br />
		<input type="submit" value="提交" style="font-size: 15px;"/><br />
		
		<select><!--  property="match_file" -->
			<logic:iterate name="lists" id="o">
		       <option><bean:write name="o" /></option>
		    </logic:iterate>
		</select>&nbsp;&nbsp;
		<button onClick="dosubmit('<%=request.getContextPath() %>/report/t07_report_organ/t07_report_organ_list.do?newsearchflag=1','search')">匹配</button>
		<br />
		<button class="download">下载</button>
		
	</html:form>
</body>
</html>

