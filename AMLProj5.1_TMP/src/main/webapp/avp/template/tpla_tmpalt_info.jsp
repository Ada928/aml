<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<title></title>
<SCRIPT LANGUAGE="JavaScript" src="<%= request.getContextPath() %>/js/basefunc.js"></script>

<script src="<%= request.getContextPath() %>/js/load_window.js"></script>
<link rel="stylesheet" href="<%= request.getContextPath() %>/css/awp_base.css" type="text/css">
<script language="javascript" src="<%= request.getContextPath() %>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
        document.forms[0].action=theUrl;
		document.forms[0].submit();
        parent.location.href="<%=request.getContextPath()%>/avp/template/tpla_maint_list.do";
        event.srcElement.disabled = true;
}
function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		}
</SCRIPT>
</HEAD>
<BODY>
<div id="content">
<html:form method="post" action="/template/t02_jump_tp_achive.do">
  <html:hidden property="tplakey"/>
  <html:hidden property="busstypecd"/>
  
  
  
  <div class='awp_title'>
          <table >                
                          <tr>
                            
                            <td width="200" align='left' >ģ����ϸ��Ϣ</td>
                            
                            <td width="*" align="right">
                              <input type=button value="�� ��" class="input"
							onclick="javascript:window.history.go(-1)"/>
   
                            </td>
                          </tr>                                
                                        
          </table>
        </div>
 
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="8"></td>
    </tr>
  </table>
  
 <div class="awp_detail">
       <table>
            <tr bgcolor="ECF3FF">
              <td width="30%" height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>�������</td>
              <td width="70%"bgcolor="F6F9FF">
              <html:hidden property="tplacatecd" styleClass="text_white" />
              <bean:write name="t02_tp_bas_infActionForm" property="tplacatecd_name"/>
             </td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>ģ�����ƣ�</td>
              <td bgcolor="F6F9FF">
              <bean:write name="t02_tp_bas_infActionForm" property="tplaname"/>
              </td>
            </tr>
           
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>ģ������ʾ���ͣ�</td>
              <td bgcolor="F6F9FF">
                 <bean:write name="t02_tp_bas_infActionForm" property="rsltdisptype"/>
			  </td>
            </tr>
              
             <tr bgcolor="ECF3FF">
                <td align="right" bgcolor="ECF3FF" height="22"><font color="#FF0000">*</font>�Ƿ��ڵ���������ʾ��</td>
                <td bgcolor="F6F9FF">
                  <bean:write name="t02_tp_bas_infActionForm" property="isdisp"/>               
                </td>
             </tr>
              <tr bgcolor="ECF3FF">
                <td height="20" align="right" >��ʾ��ţ�</td>
                <td bgcolor="F6F9FF">
                <bean:write name="t02_tp_bas_infActionForm" property="dispseq"/>
                </td>
              </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>�Ƿ��ҳ��</td>
              <td bgcolor="F6F9FF">
              <bean:write name="t02_tp_bas_infActionForm" property="ispage"/>
			  </td>
            </tr>
             <tr bgcolor="ECF3FF">
                <td height="20" align="right" >ÿҳ��¼������</td>
                <td bgcolor="F6F9FF">
                <bean:write name="t02_tp_bas_infActionForm" property="pagerecnum"/>
                </td>
              </tr>
             <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>ִ�в�ѯ���ͣ�</td>
              <td bgcolor="F6F9FF">
              <bean:write name="t02_tp_bas_infActionForm" property="querytype"/>
			  </td>
            </tr>
              <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF"><font color="#FF0000">*</font>ҳ����ʾ���ͣ�</td>
              <td bgcolor="F6F9FF">
               <bean:write name="t02_tp_bas_infActionForm" property="pagetype"/>
			  </td>
            </tr>
             <tr bgcolor="ECF3FF">
              <td height="22" align="right" >����������ʾ���ͣ�</td>
              <td bgcolor="F6F9FF">
              <bean:write name="t02_tp_bas_infActionForm" property="condtype"/>
              </td>
            </tr>
             <tr bgcolor="ECF3FF">
              <td height="22" align="right" >����������ͣ�</td>
              <td bgcolor="F6F9FF">
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode1" value="1">ͳ�ơ�</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode2" value="1">����</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode3" value="1">������</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode4" value="1">ɸѡ��</logic:equal>
              <logic:equal name="t02_tp_bas_infActionForm" property="rsltmode5" value="1">����</logic:equal> 
              </td>
            </tr>
           <tr bgcolor="ECF3FF">
              <td height="22" align="right" >����������</td>
              <td bgcolor="F6F9FF"><bean:write name="t02_tp_bas_infActionForm" property="fundes"/>
              </td>
            </tr>
          </table>
        </div>
  	<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
  <div class="awp_list">
   <TABLE>
			<TR align=center bgcolor="A3C0EE">
				<TD width="18%" align="center" >
					��������
				</TD>
				<TD width="26%" >
					��ʾ����
				</TD>
				<TD width="17%" >
					�����������
				</TD>
				<TD width="11%" >
					�Ƿ����
				</TD>
				<TD width="9%" >
					��ʾ���
				</TD>
			</TR>

            <logic:iterate id="parinfo" name="t02_tp_in_parmList"  type="com.ist.avp.template.dto.T02_tp_in_parm">
			<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="parinfo" property="parmkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="parinfo" property="parmkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="parinfo" property="parmkey" />')>
				<TD >
					<bean:write name="parinfo" property="sysinparmcd" scope="page" />
				</TD>
				<TD >
					<bean:write name="parinfo" property="dispname" scope="page" />
				</TD>
				<TD >
					<bean:write name="parinfo" property="parmtype_disp" scope="page" />
				</TD>
				<TD >
					<bean:write name="parinfo" property="isness_disp" scope="page" />
				</TD>
				<TD >
					<bean:write name="parinfo" property="dispseq" scope="page" />
				</TD>
			</TR>
			</logic:iterate>
		</TABLE>
	</div>
			<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
	 <div class="awp_list">
		<TABLE>
				<TR align=center bgcolor="A3C0EE">
					<TD width="20%" align="center" >
						����ʾ����
					</TD>
					<TD width="24%" align="center" >
						�д���
					</TD>
					<TD width="8%" >
						�Ƿ����ת��
					</TD>
					<TD width="8%" >
						��Ӧ���
					</TD>
					<TD width="6%" >
						��ʾ���
					</TD>
				</TR>
				<logic:iterate id="binfo" name="t02_tp_disp_rstList"
					type="com.ist.avp.template.dto.T02_tp_disp_rst">
					<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="dispcolkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="dispcolkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="dispcolkey" />')>
						<TD >
							<bean:write name="binfo" property="dispname" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="outcolkey" scope="page" />
						</TD>

						<TD >
							<bean:write name="binfo" property="iscdchg_disp" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="catecd" scope="page" />
						</TD>
						<TD >
							<bean:write name="binfo" property="dispseq" scope="page" />
						</TD>
					</TR>
				</logic:iterate>

			</TABLE>
		</div>
			  	<table width="100" border="0" align="center" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>
		 <div class="awp_list">
			<TABLE>
				<TR align=center bgcolor="A3C0EE">
					<TD width="21%" >
						��ת������
					</TD>
					<TD width="28%" >
						��תģ��
					</TD>
					<TD width="20%" >
						��ת����
					</TD>
					<TD width="26%" >
						��ת����
					</TD>
				</TR>

				<logic:iterate id="binfo" name="t02_jump_tpList"
					type="com.ist.avp.template.dto.T02_jump_tp">
				<TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="jumpkey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="jumpkey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="jumpkey" />')>
					<TD >
						<bean:write name="binfo" property="dispname" scope="page" />
					</TD>
					<TD >
						<bean:write name="binfo" property="jumptplaname" scope="page" />
					</TD>
					<TD >
						<bean:write name="binfo" property="dispjumpcond" scope="page" />
					</TD>
					<TD >
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
