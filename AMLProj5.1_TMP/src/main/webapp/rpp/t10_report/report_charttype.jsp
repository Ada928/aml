<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gbk">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
     <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
<SCRIPT LANGUAGE="JavaScript">

   function clickRadio(obj) {
       if(!obj.checked) return;
       //����ѡ�е�radio����ӦcheckboxҲҪѡ����
       var value = obj.value;
      
       var sct = document.getElementsByName("selectedChartType");
       for ( var i = 0; i < sct.length; i++) {
		  if(sct[i].value == value) {
		      sct[i].checked = true;
		  }
	   }
   }
   
   function clickCheckBox(obj) {
      if(obj.checked) return ;
      //����ȡ����checkbox����ӦradioҲҪȡ����
      var value = obj.value;
      
      var dct = document.getElementsByName("defaultChartType");
      for ( var i = 0; i < dct.length; i++) {
		  if(dct[i].value == value) {
		      dct[i].checked = false;
		  }
	  }
   }

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="content">
	<html:form method="post" action="/t10_report/t10_report_charttype_add.do">
	<html:hidden property="reportkey"/>
	<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%">
							<span class="awp_title_td2">������ - ѡ��ͼ������
							</span>
						</td>
					<td align="right">
					<!--  
					<input type=button value="�� ��"  onClick="dosubmitChk('t10_reportparm_check_do.do');">&nbsp;	
					-->				
					</td>
					</tr>
				</table>
	  </div>
	
	  <div class='awp_detail'>
					<table>
						<tr>
							<td>
								ѡ��ͼ�����ͣ�
							</td>
							<td>
							  <logic:iterate id="chartType" name="chartTypeMap">
							     <bean:define id="value" name="chartType" property="key"></bean:define>
							      <html:multibox property="selectedChartType" onclick="clickCheckBox(this)">
							          <bean:write name="chartType" property="key"/>							          
							      </html:multibox>
							      <bean:write name="chartType" property="value"/>
							      &nbsp;&nbsp;&nbsp;&nbsp;
							      <html:radio idName="chartType" property="defaultChartType" value="key" onclick="clickRadio(this)"></html:radio>Ĭ����ʾ��ͼ������
							      <br/>
							  </logic:iterate>
							  
							</td>
						</tr>
						<tr>
							<td>
								&nbsp;
							</td>
							<td>
								<input type="button" value="�� ��"
									OnClick="awpDoSubmit('t10_report_charttype_add_do.do','search')">
							</td>
						</tr>
					</table>
				</div>   	 
      
	</html:form>
	</div>
</BODY>
</html:html>
