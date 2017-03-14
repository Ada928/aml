<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title></title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/uc.js"></script>
				<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>
			<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/Calendar.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
			var path = '<%=request.getContextPath()%>';
		</script>
		<SCRIPT LANGUAGE="JavaScript">
		
		function dosubmit(theUrl,type){
		
		    var errMsg = "";
		    var isSub = false;
		    if(type == 'add'){
		    	isSub = true;
		    }
		    if(type == 'modi'){
		    	errMsg=CheckBoxCheckedSingleOne(document.forms[0]);
		    	isSub = true;
			}
		    if(type=='del'){
		    	errMsg = CheckBoxMustChecked(document.forms[0]);
		    	if(!errMsg &&��confirm('�����Ҫɾ����')){
		            isSub = true;
		        }
		    }
		    if(type=='search'){
		        if(errMsg==''){
					isSub = true;
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
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id='content'>
			<html:form action="/template/t02_tp_chart_list.do" method="post">
			<html:hidden property="tplakey"/>
			<div class='awp_title'>
				<table>
					<tr>						
						<td width="23%" nowrap><span class="awp_title_td2">ģ��ͼ�� - �б� </span></td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />
							<html:button value="�� ��" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_chart_add.do','add')" />
							<html:button value="�� ��" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_chart_modify.do','modi')" />
							<html:button value="ɾ ��" property="Button3" styleClass="input"
								onclick="dosubmit('t02_tp_chart_delete_do.do','del')" />
						</td>
					</tr>
				</table>
			</div> 			
			
			
			

				<div class='awp_cond' id="searchtable" style="display:none">
					<table>
						<tr>
							<td>
								ͼ�����ͣ�
							</td>
							<td>
								<html:select property="charType">
									<html:options collection="chartTypes" property="label" labelProperty="value"/>
								</html:select>
							</td>
							</td>				
								<td>
							</td>
							<td>
									<html:button value="�� ѯ" property="Buttondel" styleClass="input"
								onclick="dosubmit('t02_tp_chart_list.do?newsearchflag=1','search')" />
							</td>
						</tr>
									
					</table>
				</div>

				<html:messages id="errors" message="true">
					<bean:write name="errors" filter="fasle" />
				</html:messages>
				<div class='awp_list'>
					<TABLE>
						<TR align=center>
							<TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:pointer;'>ȫ��</td>
							<TD noWrap>
								ͼ������
							</TD>
							<TD noWrap>
								ϵ��(SERIES)
							</TD>
							<TD noWrap>
								X��
							</TD>
							<TD noWrap>
								Y��
							</TD>
							<TD noWrap>
								SY��
							</TD>
							<TD noWrap>
								����
							</TD>
							<TD noWrap>
								X�����
							</TD>
							<TD noWrap>
								Y�����
							</TD>
							<TD noWrap>
								SY�����
							</TD>
							<TD noWrap>
								���
							</TD>
							<TD noWrap>
								�߶�
							</TD>	
						</TR>
						<logic:iterate id="t02_tp_chart" name="t02_tp_chartList"
							type="com.ist.avp.template.dto.T02_tp_chart" indexId="index">
								<TR align=center>
								<TD  nowrap>
									<html:multibox property="selectchartkeys">
										<bean:write name="t02_tp_chart" property="chartkey" />
									</html:multibox>
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="charType_disp" />
								</TD>
								<td noWrap>
									<bean:write name="t02_tp_chart" property="disp_cond" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="row_cond" />
								</TD>
								<td noWrap>
									<bean:write name="t02_tp_chart" property="dataField" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="sy_cond" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="title" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="xaxislabel" />
								</TD>							
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="yaxislabel" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="syaxislabel" />
								</TD>
								<TD noWrap>	
									<bean:write name="t02_tp_chart" property="width" />
								</TD>
								<TD noWrap>
									<bean:write name="t02_tp_chart" property="height" />
								</TD>
							</TR>
						</logic:iterate>
					</TABLE>
				</div>
			</html:form>
		</div>
	</BODY>
</HTML>
