<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gbk">
<meta http-equiv="refresh" content="60"> 
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/Calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
       var errMsg = "";
    var isSub = false;
    if(type=='modi'){
         isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('��Ҫɾ��ѡ��ģ����')){
                isSub = true;
            }
        }
    }else if(type=='submit'){
    	var objTplstat = document.getElementsByName('tplastat_disp');
    	var objCheckBox = document.getElementsByName('tplakeys');
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg==''){
        	errMsg = CheckBoxMustCheckedAndTplaStat(objCheckBox,objTplstat);
        }
        
        if(errMsg==''){
            if(confirm('��Ҫ����ѡ��ģ����')){
               isSub = true;
           }
        }
    }else if(type=='recsubmit'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('��Ҫ�˻�ѡ��ģ����')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫ����ѡ��Ĺ�����')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add' || type=='view'){
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
<BODY leftmargin="0" topmargin="0">
<div id='content'>
<html:form method="post" action="/template/tpla_backexec_mylist.do">
<div class='awp_title'>
				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">��ִ̨��- �ҵĲ�֤
							</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />	
							<input type="button" name="btsearch2" value="ɾ ��"
									onclick="dosubmit('<%=request.getContextPath() %>/avp/template/tpla_backexec_deleteDo.do?newsearchflag=1&back=0', 'del')" />	
					</tr>
				</table>
			</div>      


  
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
 
  
  <div class='awp_cond' id="searchtable"  style="display:none"> 
  <table>
								<tr >
								    <td >
										ģ�����ƣ�
									</td>
									<td >
										<html:text property="tplaname" styleClass="text_white" size="30" />
									</td>	
									<td  >
										�������ڣ�
									</td>
									<td >
									<html:text property="createdate_min" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].createdate_min);"> �� 
									<html:text property="createdate_max" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].createdate_max);">	
									</td>	
								</tr>
								<tr >
								    <td >
									   ģ�����ͣ�
									</td>
									<td nowrap >
										<html:select property="tplatype">
										<html:options collection="tplatypeMap" property="label"
											labelProperty="value" />
									    </html:select>
									</td>
									<td  >
										ģ������״̬��
									</td>
									<td >
										<html:select property="tplareqstat">
											<html:options collection="flagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>	
								</tr>
								<tr >		
								        <td >
										   ����
										</td>
										<td >
										<html:select property="sort">
	                  						<html:options collection="sortMap" property="label" labelProperty="value"/>
	               							</html:select>
											&nbsp;
											<html:radio property="sort_type" value="asc">����</html:radio>
											<html:radio property="sort_type" value="desc">����</html:radio>
											<html:radio property="sort_type" value="">������</html:radio>
										
									</td>
										 <td >
										</td>
										<td >
										
									</td>
								</tr>
								
								<tr >		
								       <td >
										
										</td>
										<td nowrap>
											
										</td>
										 <td >
										 
										</td>
										<td > <input type="button" name="button11" value="�� ѯ" onClick="dosubmit('<%=request.getContextPath() %>/avp/template/tpla_backexec_mylist.do?newsearchflag=1','search')" ></td>
								</tr>

							</table>
	</div>					
  <input type="hidden" name="busstypecd" value=<%=request.getAttribute("busstypecd") %>>
 
<div class="awp_list">
  <TABLE  >
    <TR align=center > 
      <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
      <TD width="18%" align="center" nowrap>ģ������</TD> 
      <TD width="10%" nowrap>ģ�����</TD>
      <TD width="10%" nowrap>ģ������״̬</TD>
      <TD width="10%" nowrap>ģ��״̬</TD>
      <TD width="10%" nowrap>ģ������</TD>
      <TD width="10%" noWrap>��������</TD>
      <TD width="10%" nowrap>��ʼʱ��</TD>
      <TD width="10%" nowrap>����ʱ��</TD>
      <TD width="10%" noWrap>������ʱ</TD>
       <TD width="10%" noWrap>״̬</TD>
    </TR>


	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
	       <TD height=22 nowrap>
	            <html:multibox property="taskkeys">
					<bean:write name="binfo" property="taskkey" />
				</html:multibox>
		    <html:hidden name="binfo" property="tplastat_disp" />
			</TD>
			<TD align="left">
				<c:choose>
					<c:when test="${binfo.calstatus eq '4'}">
						<a href="javascript:void(0);" onclick="avpSubmitPopUp('','<%=request.getContextPath() %>/avp/template/tpla_backexec_resultView_do.do?newsearchflag=1&tplakey=<bean:write name="binfo" property="tplakey" scope="page" />&taskkey=<bean:write name="binfo" property="taskkey" scope="page" />','900','600');return false;"><bean:write name="binfo" property="tplaname" scope="page" /></a>
					</c:when>
					<c:otherwise>
						<bean:write name="binfo" property="tplaname" scope="page" />
					</c:otherwise>
				</c:choose>
			</TD>
			<TD align="left">
				<bean:write name="binfo" property="tplacatecd_name" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplareqstat" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplastat_disp" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="tplatype_disp" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="statisticdate" scope="page" />
			</TD>
			<TD align="left" noWrap>
				<bean:write name="binfo" property="begintime" scope="page" />
			</TD>
			<TD noWrap>
				<bean:write name="binfo" property="endtime" scope="page" />
			</TD>
			<td>
				<bean:write name="binfo" property="usetime" scope="page" />
			</td>
			<td>
				<c:if test="${binfo.calstatus eq '0'}">
					<img alt="ʧ��" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon4.gif" title="ʧ��"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '2'}">
					<img alt="δ����" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon1.gif" title="δ����"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '3'}">
					<img alt="���ڼ���" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon2.gif" title="���ڼ���"/>
				</c:if>
				<c:if test="${binfo.calstatus eq '4'}">
					<img alt="�Ѽ���" src="<%=request.getContextPath()%>/skin/<%=style %>/images/stutas_icon3.gif"  title="�Ѽ���"/>
				</c:if>
			</td>

		</TR>
    </logic:iterate>
  </TABLE>
  </div>
  <div class='awp_page_bottom'>
	<table width="98%" border="0" align="center" cellpadding="3"
		cellspacing="3">
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table>  
	</div>
</html:form>
</div>
</BODY>
</html:html>
