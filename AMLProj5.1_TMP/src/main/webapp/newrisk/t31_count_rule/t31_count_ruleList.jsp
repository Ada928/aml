<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<title>��ֵת������</title>
	<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
		type="text/css" />
	<script language="JavaScript" src="../../js/basefunc.js"></script>
	<script type="text/javascript" src="../../js/jquery.js"></script>
	<script type="text/javascript" src="../../js/aml.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 	
</SCRIPT>

</HEAD>
<body leftmargin="0" topmargin="0" class="mainbg">
	<html:form action="/t31_count_rule/t31_count_ruleList.do" method="post">
		<div id="main">
			<!-- conditions -->
			<div class="conditions">
				<!-- title -->
				<div class="cond_t">
					<span>���ù��� - ����ת������</span>
					
				</div>
				<!-- table content -->

			</div>

			<html:errors />
			<div class="list">
				<table border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>
							��׼��ֵ
						</th>
						<th>
							ֵ����
						</th>
						<th>
							��������˵��
						</th>
						<th>
							Ҫ�ص÷�����
						</th>
						<th>
							Ҫ�ص÷�����
						</th>
						<th>
							��������˵��
						</th>
						<th>
							�޸�ʱ��
						</th>

					</tr>
					<logic:iterate id="valueRule" name="t31_count_ruleList"
						type="com.ist.aml.newrisk.dto.T31_count_rule">
						<TR>
							<TD>
								<bean:write name="valueRule" property="score"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="scoretype"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="maxisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="ctrulemax"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="ctrulemin"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="minisclosed"></bean:write>
							</TD>
							<TD>
								<bean:write name="valueRule" property="create_dt"></bean:write>
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
		</div>

	  <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
	<p>
1����ֵת������Ӧ���ڻ���������ϵ���������ǽ�����Ҫ�أ���ָ�꣩�ķ�ֵת��Ϊ��׼��ֵ���Ա������ϲ���㡣<br/>
2������������ϵ����һ�����Ҫ�ع��ɣ����������Ҫ�ر�׼��ֵ�Ļ����ϣ�ͨ�����ּ����������ͻ����յ÷֣��Ӷ�ƥ����Ӧ�ķ��յȼ���<br/>
3�����ּ�����򣺽�����������ϵ�²�ͬ����Ҫ�ؽ��з��࣬������ײ�Ϊ���������Ļ���Ҫ�أ���Բ�ͬ�ķ���������Ӧ��Ȩ�أ�ϵͳ������ײ�Ļ���Ҫ�ص���ֵ���з�ֵת���������м�Ȩ���㣬����ϲ����ķ�ֵ���ٶԷ�����м�Ȩ���㣬���������ϵ�����÷֣��ٽ����÷ֽ��з��յȼ�ת��������ͻ����յķ��յȼ���
	</p>
  </div>  
	</html:form>

</body>
</html:html>
