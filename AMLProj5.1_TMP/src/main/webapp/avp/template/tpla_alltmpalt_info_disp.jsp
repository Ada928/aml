<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<title></title>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
<script src="<%= request.getContextPath() %>/js/load_window.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
		
        var left_value=window.parent.leftFrame.location+""; 
        var p_url="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd")%>";
        //alert(left_value.indexOf("tpla_add_left"));
        if(left_value.indexOf("tpla_add_left") != -1){ 
            //window.parent.opener.location=p_url;
            var _parentWin = window.parent ;
		    _parentWin.close();
            
        }else{
        	parent.location.href=p_url;
            event.srcElement.disabled = true;
        }
        
}
function dosubmit(theUrl,type){
		if (type == "testSQL"){
			var tplaname = "<bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>";
			var tplatype = "<bean:write name="t02_tp_bas_infActionForm" property="tplatype"/>";
			if (null == tplaname || "" == tplaname){
				alert('����ά������������Ϣ��');
				return;
			}			
			if(<%=request.getAttribute("isHaveMainSQL")%> != 1 && tplatype !=1 ){
				alert('�������SQL��䣡');
				return;
			}
			avpPopUp(theUrl,'900','600');
		}else{
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		        
}
</SCRIPT>
</HEAD>
<BODY>
<div id="content">
<html:form method="post" action="/template/t02_jump_tp_achive.do">
  <html:hidden property="tplakey"/>
  <html:hidden property="busstypecd"/>
  
  <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">ģ����� - ģ����Ϣ����</span></td>
						<td align="right">
							 <html:button property="button_next" styleClass="input" value="�� ��" onclick="window.close();"/>						                  </td>
					</tr>
				</table>
			</div>  
  
  
  
  <div class="awp_detail">
     <table>
            <tr >
              <td  ><font color="#FF0000">*</font>�������</td>
              <td >
              <html:hidden property="tplacatecd" styleClass="text_white" />
              <bean:write name="t02_tp_bas_infActionForm" property="tplacatecd_name"/>
             </td>
            </tr>
            <tr >
              <td  ><font color="#FF0000">*</font>ģ�����ƣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>
              </td>
            </tr>
           
            <tr >
              <td  ><font color="#FF0000">*</font>ģ������ʾ���ͣ�</td>
              <td >
                 <bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype"/>
			  </td>
            </tr>
              
             <tr >
                <td ><font color="#FF0000">*</font>�Ƿ��ڵ���������ʾ��</td>
                <td >
                  <bean:write name="t02_tp_bas_infActionForm" property="isdisp"/>               
                </td>
             </tr>
              <tr >
                <td  nowrap>��ʾ��ţ�</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="dispseq"/>
                </td>
              </tr>
            <tr >
              <td  ><font color="#FF0000">*</font>�Ƿ��ҳ��</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="ispage"/>
			  </td>
            </tr>
             <tr >
                <td  nowrap><font color="#FF0000">*</font>ÿҳ��¼������</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="pagerecnum"/>
                </td>
              </tr>
             <tr >
              <td  ><font color="#FF0000">*</font>ִ�в�ѯ���ͣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="querytype"/>
			  </td>
            </tr>
              <tr >
              <td  ><font color="#FF0000">*</font>ҳ����ʾ���ͣ�</td>
              <td >
               <bean:write name="t02_tp_bas_infActionForm" property="pagetype"/>
			  </td>
            </tr>
             <tr >
              <td  nowrap><font color="#FF0000">*</font>����������ʾ���ͣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="condtype"/>
              </td>
            </tr>
            <tr >
              <td  nowrap><font color="#FF0000">*</font>����������ʾ������</td>
              <td >
                <bean:write name="t02_tp_bas_infActionForm" property="condnum"/>
              </td>
            </tr>
             <tr  style="display: none">
              <td  nowrap>����������ͣ�</td>
              <td >
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode1" value="1">ͳ�ơ�</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode2" value="1">����</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode3" value="1">������</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode4" value="1">ɸѡ��</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode5" value="1">����</logic:equal> 
              </td>
            </tr>
           <tr >
              <td  nowrap>����������</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="fundes"/>
              </td>
            </tr>
            <tr >
              <td  nowrap><font color="#FF0000">*</font>������Դ��</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="qryconncd_disp"/>
              </td>
            </tr>
           <tr >
              <td  nowrap>��ѯȨ�ޣ�</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="useauth_disp"/>
              </td>
            </tr>
            <tr >
              <td  nowrap>ִ��sql��</td>
              <td ><%=request.getAttribute("sql") %>
              </td>
            </tr>
          </table>
       </div>

	<div class="awp_list">
      <TABLE>
			<TR align=center>
				<TD width="10%" align="center" nowrap>
					���
				</TD>
				<TD width="15%" align="center" nowrap>
					��������
				</TD>
				<TD width="35%" noWrap>
					��ʾ����
				</TD>
				<TD width="20%" noWrap>
					�����������
				</TD>
				<TD width="10%" noWrap>
					�Ƿ����
				</TD>
				<TD width="10%" noWrap>
					��ʾ���
				</TD>
			</TR>

            <logic:iterate id="parinfo" name="t02_tp_in_parmList"  type="com.ist.avp.template.dto.T02_tp_in_parm" indexId="id" offset="0">
			<TR align="center" >
				<TD nowrap>
					<bean:write name="id" />
				</TD>
				<TD nowrap align="left">
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD nowrap align="left">
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD nowrap>
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
  	</div>

	<div class="awp_list">
		<TABLE>
				<TR align=center>
					<TD width="10%" align="center" nowrap>
						���
					</TD>
					<TD width="15%" align="center" nowrap>
						�д���
					</TD>
					<TD width="35%" align="center" nowrap>
						����ʾ����
					</TD>
					<TD width="20%" noWrap>
						�Ƿ����ת��
					</TD>
					<TD width="10%" noWrap>
						��Ӧ���
					</TD>
					<TD width="10%" noWrap>
						��ʾ���
					</TD>
				</TR>
				<logic:iterate id="binfo" name="t02_tp_disp_rstList" indexId="id" offset="0"
					type="com.ist.avp.template.dto.T02_tp_disp_rst">
					<TR align="center" >
						<TD nowrap>
							<bean:write name="id"/>
						</TD>					
						<TD nowrap align="left">
							<bean:write name="binfo" property="colaliascd" scope="page" />
						</TD>
						<TD nowrap align="left">
							<bean:write name="binfo" property="dispname" scope="page" />
						</TD>

						<TD nowrap>
							<bean:write name="binfo" property="iscdchg_disp" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="catecd" scope="page" />
						</TD>
						<TD nowrap>
							<bean:write name="binfo" property="dispseq" scope="page" />
						</TD>
					</TR>
				</logic:iterate>

			</TABLE>
		</div>
			
		<div class="awp_list">
			<TABLE>
				<TR align=center >
					<TD width="10%" noWrap>
						���
					</TD>
					<TD width="21%" noWrap>
						��ת������
					</TD>
					<TD width="28%" noWrap>
						��תģ��
					</TD>
					<TD width="20%" noWrap>
						��ת����
					</TD>
					<TD width="26%" noWrap>
						��ת����
					</TD>
				</TR>

				<logic:iterate id="binfo" name="t02_jump_tpList"
					type="com.ist.avp.template.dto.T02_jump_tp" indexId="id" offset="0">
				<TR align="center" >
					<TD nowrap>
						<bean:write name="id"/>
					</TD>
					<TD nowrap align="left">
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD nowrap align="left">
						<bean:write name="binfo" property="jumptplaname" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispjumpcond" scope="page" />
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispjumpparm" scope="page" />
					</TD>
				</TR>
				</logic:iterate>
			</TABLE>
		</div>
</html:form>
</div>
</BODY>
</HTML>
