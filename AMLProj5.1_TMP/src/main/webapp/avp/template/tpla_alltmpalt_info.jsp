<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<title></title>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
<script src="<%= request.getContextPath() %>/js/load_window.js"></script>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
		
        var left_value=window.parent.leftFrame.location+"";
        var p_url="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd")%>";
        //alert(left_value.indexOf("tpla_add_left"));
        if(left_value.indexOf("tpla_add_left") != -1 || left_value.indexOf("tpla_bz_add_left") != -1){ 
            //window.parent.opener.location=p_url;
            var _parentWin = window.parent ;
		    _parentWin.close();
        }else{
        	parent.location.href=p_url;
            event.srcElement.disabled = true;
        }
        
}
function dosubmit(theUrl,type){
		var rsltdisptype = "<bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype"/>";
		if (type == "testSQL"){
			var tplaname = "<bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>";
			var tplatype = "<bean:write name="t02_tp_bas_infActionForm" property="tplatype"/>";
			if (null == tplaname || "" == tplaname){
				alert('����ά������������Ϣ��');
				return;
			}			
			if(<%=request.getAttribute("isHaveMainSQL")%> != 1 && tplatype !=1 && rsltdisptype !=4){
				alert('�������SQL��䣡');
				return;
			}
			avpPopUp(theUrl,'900','600');
		}else{
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
		        
}
function parentpage(theUrl){
	  parent.location=theUrl;
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
							<input type="button" name="button_save" Class="input" value="����ģ��" onclick="dosubmit('tpla_chk_main_test.do?newsearchflag=1&pop_win_flag=1&tplakey=<bean:write name="t02_tp_bas_infActionForm" property="tplakey"/>','testSQL')"/>
			<html:button property="button_next" styleClass="input" value="�� ��" onclick="parentpage('t02_jump_tp_achive.do')"/>     </td>
					</tr>
				</table>
	</div>      
  
  
   
  <div class="awp_detail">
     <table>
            <tr>
              <td ><font color="#FF0000">*</font>�������</td>
              <td >
              <html:hidden property="tplacatecd" styleClass="text_white" />
              <bean:write name="t02_tp_bas_infActionForm" property="tplacatecd_name"/>
             </td>
            </tr>
            <tr>
              <td ><font color="#FF0000">*</font>ģ�����ƣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>
              </td>
            </tr>
           
            <tr>
              <td ><font color="#FF0000">*</font>ģ������ʾ���ͣ�</td>
              <td >
                 <bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype_disp"/>
			  </td>
            </tr>
              <!-- 
             <tr>
                <td ><font color="#FF0000">*</font>�Ƿ��ڵ���������ʾ��</td>
                <td >
                  <bean:write name="t02_tp_bas_infActionForm" property="isdisp"/>               
                </td>
             </tr>
              -->
              <tr>
                <td nowrap>��ʾ��ţ�</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="dispseq"/>
                </td>
              </tr>
            <tr>
              <td ><font color="#FF0000">*</font>�Ƿ��ҳ��</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="ispage"/>
			  </td>
            </tr>
             <tr>
                <td nowrap><font color="#FF0000">*</font>ÿҳ��¼������</td>
                <td >
                <bean:write name="t02_tp_bas_infActionForm" property="pagerecnum"/>
                </td>
              </tr>
             <tr>
              <td ><font color="#FF0000">*</font>ִ�в�ѯ���ͣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="querytype"/>
			  </td>
            </tr>
              <tr>
              <td ><font color="#FF0000">*</font>ҳ����ʾ���ͣ�</td>
              <td >
               <bean:write name="t02_tp_bas_infActionForm" property="pagetype"/>
			  </td>
            </tr>
             <tr>
              <td nowrap><font color="#FF0000">*</font>����������ʾ���ͣ�</td>
              <td >
              <bean:write name="t02_tp_bas_infActionForm" property="condtype"/>
              </td>
            </tr>
            <tr>
              <td nowrap><font color="#FF0000">*</font>����������ʾ������</td>
              <td >
                <bean:write name="t02_tp_bas_infActionForm" property="condnum"/>
              </td>
            </tr>
             <tr style="display: none">
              <td  nowrap>����������ͣ�</td>
              <td >
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode1" value="1">ͳ�ơ�</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode2" value="1">����</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode3" value="1">������</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode4" value="1">ɸѡ��</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode5" value="1">����</logic:equal> 
              </td>
            </tr>
           <tr>
              <td  nowrap>����������</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="fundes"/>
              </td>
            </tr>
           <tr>
              <td  nowrap><font color="#FF0000">*</font>������Դ��</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="qryconncd_disp"/>
              </td>
            </tr> 
           <tr>
              <td  nowrap>��ѯȨ�ޣ�</td>
              <td ><bean:write name="t02_tp_bas_infActionForm" property="useauth_disp"/>
              </td>
            </tr>
            <tr>
              <td  nowrap>ִ��sql��</td>
              <td ><%=request.getAttribute("sql") %>
              </td>
            </tr>
            <tr>
              <td  nowrap>����ִ��ʱ�䣺</td>
              <td  ><input type="text" id="test_time" readonly="readonly" size="4" value="0">��
              </td>
            </tr>
            <tr>
              <td  nowrap>�ű���</td>
              <td  ><bean:write name="t02_tp_bas_infActionForm" property="scriptcd"/>
              </td>
            </tr>
          </table>
       </div>

<div class="awp_list">
      <TABLE>
			<TR align=center >
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
			<TR align="center"  id='id_<bean:write name="parinfo" property="parmkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="parinfo" property="parmkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="parinfo" property="parmkey" />')>
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
					<TR align="center"  id='id_<bean:write name="binfo" property="dispcolkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="dispcolkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="dispcolkey" />')>
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
				<TR align="center" id='id_<bean:write name="binfo" property="jumpkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="jumpkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="jumpkey" />')>
					<TD nowrap>
						<bean:write name="id"/>
					</TD>
					<TD nowrap>
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD nowrap>
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
		
		<div class="awp_list">
			<TABLE>
				<TR align=center >
					<td>��������</td>
					<td>������ַ</td>
					<td>��ʾ����</td>
					<td>λ������</td>
					<td>�ύ����</td>
					<td>���ڿ��</td>
					<td>���ڸ߶�</td>
					<td>��ʾ˳��</td>
				</TR>
				<logic:iterate id="javaBean" name="t02_tp_cus_actionList" type="com.ist.avp.template.dto.T02_tp_cus_action">
				<tr>
					<td>
						<bean:write name="javaBean" property="actionname"/>
					</td>
					<td>
						<bean:write name="javaBean" property="actionurl"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="disptype_disp"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="locatetype_disp"/>
					</td>
					<td align="center">
						<bean:write name="javaBean" property="submittype_disp"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="width"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="height"/>
					</td>
					<td align="right">
						<bean:write name="javaBean" property="dispseq"/>
					</td>
				</tr>
				</logic:iterate>
			</TABLE>
		</div>
		
</html:form>
</div>
</BODY>
</HTML>
