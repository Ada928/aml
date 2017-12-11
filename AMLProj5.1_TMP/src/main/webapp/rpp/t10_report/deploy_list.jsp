<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
<head>
	<title></title>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/awp_base.js"></SCRIPT>
	<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/basefunc.js"></SCRIPT>
	<script language="javascript"
		src="<%=request.getContextPath()%>/js/load_window.js"></script>
	<script src="<%=request.getContextPath()%>/js/fdp_rules.js"></script>
	<SCRIPT LANGUAGE="JavaScript"> 
   function dosubmit(theUrl,type){
  
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫɾ����������')){
                isSub = true;
            }
        }
    }
    else if(type=='deploy'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
                isSub = true;
        }
    }
    else if(type=='search' || type=='add'){
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
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>

		<html:form method="post" action="/t10_report/t10_report_list.do">
			<div class='awp_title'>

				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">������ - �� ��</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
								onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type="button" name="add" value="�� ��"
								onClick="dosubmit('deploy_report_do.do','deploy')" class="input">
							<input type="button" name="delete" value="��������"
								onclick="dosubmit('repeal_report_do.do?deployflag=2&type=deploy','deploy')"
								class="input">
							<input type="button" name="delete" value="��������"
								onclick="dosubmit('t10_report_deploy.do?deployflag=1&type=deploy','deploy')"
								class="input">
						</td>
					</tr>
				</table>
			</div>

			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>

			<div class='awp_cond' id="searchtable" style="display:none">
				<table>
					<tr>
						<td>
							�����ţ�
						</td>
						<td>
							<html:text property="reportkey" styleClass="text_white" size="30"
								maxlength="10" onkeyup="value=value.replace(/[\W]/g,'')" />

						</td>

						<td>
							�������ƣ�
						</td>
						<td>
							<html:text property="reportname" size="30"
								styleClass="text_white" />
					</tr>
					<tr>
						<td>
							�������
						</td>
						<td>
							<html:select property="reportype">
								<html:options collection="reportTypeMap" property="label"
									labelProperty="value" />
							</html:select>
						</td>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" name="button" value="�� ѯ"
								onClick="dosubmit('t10_report_deploy_list.do?newsearchflag=1','search')"
								class="input">
						</td>

					</tr>
				</table>
			</div>

			<div class="awp_dynamic_list">
				<table>
					<tr>
						<td width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
						<td align="center" nowrap>
							������
						</td>
						<td align="center" nowrap>
							��������
						</td>
						<td align="center" nowrap>
							�������
						</td>
						<td align="center" nowrap>
							������ϵͳ
						</td>
						<td align="center" nowrap>
							����״̬
						</td>
						<td align="center" nowrap>
							��������
						</td>
						<!--  
				 <td  align="center">�Ƿ�������</td>
				 <td  align="center">����ҳ��</td>
				 <td  align="center">����ģ��</td>
				 <td  align="center">չ��ģ��</td>
 				 <td  align="center">��������</td> -->
					</tr>
					<logic:iterate id="report" name="t10_reportList"
						type="com.ist.rpp.report.dto.T10_report" indexId="i">
						<tr>
							<td align="center" nowrap>
								<logic:notEmpty name="report" property="reportkey">
									<html:multibox property="selectReportkeys" disabled="false"
										onclick="changcol(this)">
										<bean:write name="report" property="reportkey" />
									</html:multibox>
								</logic:notEmpty>
							<td align="left" nowrap>
								
								<logic:notEqual value="1" name="report" property="ishavepara">
								<a
									href="javascript:openWin('/<%=request.getContextPath()%>/rpp/showReport.do?new_qry_flag=1&jump_rslt_flag=1&fast_qry=1&reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>','','600','800')">
									<bean:write name="report" property="reportkey" scope="page" />
								</a>
							    </logic:notEqual>
							    <logic:equal value="1" name="report" property="ishavepara">
							    <a
									href="javascript:openWin('t10_report_test.do?reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>','','600','800')">
									<bean:write name="report" property="reportkey" scope="page" />
								</a>
							    </logic:equal>
							</td>
							<td align="left" nowrap>		
									<bean:write name="report" property="reportname" scope="page" />	
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="reportype_disp" scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="reportsys_disp" scope="page" />
							</td>
							<td align="center" nowrap>
								<bean:write name="report" property="deployflag_disp"
									scope="page" />
							</td>
							<td align="left" >
							<logic:notEqual value="1" name="report" property="ishavepara">
							<%=request.getContextPath()%>/rpp/showReport.do?new_qry_flag=1&jump_rslt_flag=1&fast_qry=1&reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>
							</logic:notEqual>
							<logic:equal value="1" name="report" property="ishavepara">
							<%=request.getContextPath()%>/rpp/t10_report/t10_report_test.do?reportkey=<%=report.getReportkey()%>&p_reportkey=<%=report.getReportkey()%>
							</logic:equal>
							
							</td>
							<!-- 
				 <td align="center"><bean:write name="report" property="isexport_disp" scope="page" /></td>
				 <td align="center"><bean:write name="report" property="parampage" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="datatpl_file" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="exceltpl_file" scope="page" /></td>
				 <td align="center" style="word-wrap: break-word;word-break:break-all;"><bean:write name="report" property="reportdes" scope="page" /></td>
			  -->
						</tr>
					</logic:iterate>

				</table>
				<br>
			</div>
			<div class='awp_page_bottom'>
				<table>
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</div>
		</html:form>
	</div>
</body>

</html:html>
