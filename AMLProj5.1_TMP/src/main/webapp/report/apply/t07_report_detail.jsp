<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
              <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script src="../../js/title.js" ></script>
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
             <script type="text/javascript" src="../../js/jquery.js" ></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
<SCRIPT LANGUAGE="JavaScript" >
function _chengeUrl(url,id)
{
	var ifram=document.getElementById("report_detail");
	ifram.src=url;
}
function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0" class="mainbg">
<div id= "main">
<html:form method="post" action="/apply/t07_report_detail.do">
<html:hidden property="casesearchtime" />
	<div class="conditions" >
    	<div class="cond_t" >
             	<span>������룺<bean:write name="t07_report" property="reportkey"/></span >
                   <span class="buttons" ><a href ="#" onclick="javascript:window.close();" ><img src="../../images/blue/b_shut.png" />�� ��</a>
                 </span>
         </div>
         <div class="cond_c2" >
         	<table border="0" cellpadding= "0" cellspacing ="0">
            	<tr>
				<td align="right">�������ͣ�</td>
				<td align="left">
					<bean:write property="pbc_msg_type_cd" name="t07_report" />
				</td>
				<td align="right">�������ڣ�</td>
				<td align="left">
					<bean:write name="t07_report" property="rpdt_disp"/>
				</td>
				</tr>
				<tr>
				<td align="right">��֤״̬��</td>
				<td align="left">
					<bean:write property="validate_ind_disp" name="t07_report" />
				</td>
				<td align="right">���ͻ�����</td>
				<td align="left">
					<bean:write name="t07_report" property="create_org_name"/>
				</td>
				</tr>
				<tr>
				<td align="right">���ڻ�������:</td>
				<td align="left" >
					<bean:write name="t07_report" property="finm"/>
				</td>
				<td align="right">���ڻ�������:</td>
				<td align="left" >
					<bean:write name="t07_report" property="ficd"/>
				</td>
			</tr>
			<tr>
				<td align="right">����������</td>
				<td align="left" >
					<bean:write name="t07_report" property="ttnm"/>
				</td>
				<td align="right">�ͻ�������</td>
				<td align="left">
					<bean:write name="t07_report" property="cttn"/>
				</td>
			</tr>
			<tr>
				<td align="right">���ɳ̶�:</td>
				<td align="left">
					<bean:write name="t07_report" property="ssdg_disp"/>
				</td>
				<td align="right">��ˣ�</td>
				<td align="left">
					<bean:write name="t07_report" property="rpnm"/>
				</td>
			</tr>
			<tr rowspan="3">
				<td align="right">������Ϊ������</td>
				<td style="white-space:normal;" align="left" colspan=3>
	      			<bean:write property="ssds" name="t07_report" />
				</td>
			</tr>
			<tr rowspan="3">
				<td align="right">��ȡ��ʩ��</td>
				<td style="white-space:normal;" align="left" colspan=3>
	      			<bean:write property="tkms" name="t07_report" />
				</td>
			</tr>
            </table>
         </div>
    <!-- ��ѡ���ʼ -->
	<div id="bigTab">
		<dl class="tabm">   
			<dd class="tabcur">
		 		<span class="buttons">
		 			<a href='#' onClick="_chengeUrl('<%=request.getContextPath()%>/report/apply/t07_report_party_list.do?reportkey=<bean:write name="t07_report" property="reportkey"/>&newsearchflag=1&casesearchtime=<bean:write name="casesearchtime" />','report_detail')" title="�ͻ���Ϣ">
		 				<img src="../../images/blue/b_caseinfo.png" />�ͻ���Ϣ
		 			</a> 
		 		</span>
		 	</dd> 
		 	<dd>
		 		<span class="buttons">
		 			<a href='#' onClick="_chengeUrl('<%=request.getContextPath()%>/report/apply/t07_report_trans_list.do?reportkey=<bean:write name="t07_report" property="reportkey"/>&newsearchflag=1&casesearchtime=<bean:write name="casesearchtime"/>','report_detail2')" title="������Ϣ">
		 				<img src="../../images/blue/b_risktranc.png" />������Ϣ
		 			</a>
		 		</span>
		 	</dd>
		 	<dd>
		 		<span class="buttons">
		 			<a href='#' onClick="_chengeUrl('<%=request.getContextPath()%>/report/apply/t07_report_acct_list.do?reportkey=<bean:write name="t07_report" property="reportkey"/>&newsearchflag=1&casesearchtime=<bean:write name="casesearchtime"/>','report_detail3')" title="�˻���Ϣ">
		 				<img src="../../images/blue/b_caseinfo.png" />�˻���Ϣ
		 			</a>
		 		</span>
		 	</dd>
		 </dl>
	<dl class="tabc">
		 <iframe frameborder="0" width="100%" height="500px" src="<%=request.getContextPath()%>/report/apply/t07_report_party_list.do?reportkey=<bean:write name="t07_report" property="reportkey"/>&newsearchflag=1&casesearchtime=<bean:write name="casesearchtime" />" scrolling="no"  id="report_detail" name="report_detail"></iframe>
	</dl>
    </div>
</html:form>
</div>
</BODY>
</HTML>
