<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=GBK">
<link rel="stylesheet" href="../../css/css_all.css" type="text/css">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<script src="../../js/title.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<SCRIPT LANGUAGE="JavaScript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
    var errMsg ="";
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
 <html:form action="/calinfo/dm_task_list.do" method="post">
<html:hidden property="newsearchflag" value="1"/>
<html:hidden property="domainkey"/>
<html:hidden property="serverkey"/>
<html:hidden property="statisticdate_disp"/>
<table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="94%" class="td1">
          <span class="css014">
          <strong><font color="0072BC">DM������� - �����ѯ</font></strong></span>      </td>
      <td width="6%" align="right" nowrap class="td2">
          <html:button property="backbutton" value="��  ��" styleClass="input" onclick="dosubmit('dm_task_list.do','back')"/>
      </td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>

  <TABLE align=center border=1 borderColor=333333 cellPadding=0 cellSpacing=0 style="BORDER-COLLAPSE: collapse" width="98%">
    <TBODY>
      <TR>
        <TD align="center" valign="top" style="PADDING-BOTTOM: 2px; PADDING-LEFT: 2px; PADDING-RIGHT: 2px; PADDING-TOP: 2px">
  <table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr bgcolor="ECF3FF">
              <td width="160" height="22" align="right" bgcolor="ECF3FF"> ������</td>
              <td bgcolor="F6F9FF"><select name="select3" id="select3">
                <option value="1">--ȫ��--</option>
                <option value="0">����</option>
                <option value="-1">��������</option>
                                                                      </select>              </td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">���ȣ�</td>
              <td bgcolor="F6F9FF"><select name="select4" id="select4">
                <option>--ȫ��--</option>
                <option value="1">��</option>
                <option value="0">��</option>
                <option value="-1">��</option>
                <option>��</option>
                                                        </select></td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="right" bgcolor="ECF3FF">�������ƣ�</td>
              <td bgcolor="F6F9FF"><select name="select5" id="select5">
                <option selected>--ȫ��--</option>
                <option value="1">1201-��ƿ�Ŀ�� </option>
                <option value="0">1202-�ʲ���ծ��</option>
                <option value="-1">1203-�����</option>
                <option>1204-������ϸ��</option>
                                                                      </select></td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">�������</td>
              <td bgcolor="F6F9FF"><select name="select2" id="select2">
                  <option selected>--ȫ��--</option>
                  <option>�����</option>
                  <option>ȫ����ʵ����</option>
                  <option>������ʵ����</option>
                  <option>�ڲ�����</option>
                                                          </select>
              </td>
            </tr>
            <tr bgcolor="F6F9FF">
              <td height="22" align="right" bgcolor="ECF3FF">����״̬��</td>
              <td bgcolor="F6F9FF"><select name="select2" id="select2">
                <option>--ȫ��--</option>
                <option>δ����</option>
                <option>���ڼ���</option>
                <option>�������</option>
                <option>�������</option>
                                                        </select>              </td>
            </tr>
            <tr bgcolor="ECF3FF">
              <td height="22" align="center" bgcolor="ECF3FF">&nbsp;</td>
              <td bgcolor="F6F9FF"><input type=button value="�� ��" name=Button52 class="input" onClick="checkForm('dm_task_list.htm')">
              <input name="Submit2" type="reset" class="input" value="�� ��"></td>
            </tr>
          </table>
        </TD>
      </TR>
    </TBODY>
  </TABLE>
</html:form>
</BODY>
</HTML>
