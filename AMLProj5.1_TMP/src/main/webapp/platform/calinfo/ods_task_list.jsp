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
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        errMsg = CheckBoxCheckedSingleOne(form1);
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(form1);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫɾ��ѡ��Ĺ�����')){
                isSub = true;
            }
        }
    }else if(type=='pause'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫ��ͣѡ��Ĺ�����')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(form1);
        if(errMsg==''){
            if(confirm('�����Ҫ����ѡ��Ĺ�����')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
        location.href=theUrl+"&"+Math.random();
    }
    if(isSub && errMsg==''){
        document.form1.action=theUrl;
        document.form1.submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function checkForm(type){
    if(type=='turnPage'){
        document.form1.action='user_list.htm';
        document.form1.submit();
    }
}
    function selectAll(obj){
        if(form1.subitemkey!=null){
    if(obj.value=="ȫ  ѡ"){
    obj.value="ȫ��ѡ"
        for ( var i=0; i < form1.subitemkey.length; i++ ){
             form1.subitemkey[i].checked=true;
        }
    }
    else{
    obj.value="ȫ  ѡ"
                for ( var i=0; i < form1.subitemkey.length; i++ ){
             form1.subitemkey[i].checked=false;
        }
    }
    }
    else{
        alert("�Բ���û�п�ѡ����.");
    }
}

</SCRIPT>
<style type="text/css">
<!--
.STYLE1 {color: #FF0000}
-->
</style>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<FORM name=form1 action="" method="post">
  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
    <tr>
      <td width="72%" class="td1">
          <span class="css014">
          <strong><font color="0072BC">ODS������� - �����б� </font></strong>          </span>      </td>
      <td width="28%" align="right" nowrap class="td2"><input type=button value="ȫ  ѡ" name=selectAllButton class="input" onClick="selectAll(this)">
	  <input type=button value="�������¼���" name=Button3322 class="input" onClick="dosubmit('ods_task_list.htm?intPage=1','add')"></td>
    </tr>
	<tr>
	  <td height="30" class="td1">����ʱ�䣺
        <select name="select2" id="select2">
          <option value="2005" selected>2005-01</option>
          <option value="2006">2005-02</option>
          <option value="2007">2005-03</option>
          <option value="2008">2005-04</option>
          <option>2005-05</option>
          <option>2005-06</option>
        </select>
������
<select name="select" id="select">
  <option selected>--ȫ��--</option>
  <option value="2005">����ϵͳ</option>
</select>
<input type=button value="ȷ  ��" name=Button32 class="input" onClick="dosubmit('ods_server_list.htm','backup')"></td>
	  <td align="center" nowrap class="td2">&nbsp;</td>
    </tr>
  </table>
  <table width="100" border="0" align="center" cellpadding="0" cellspacing="0">
     <tr><td height="8"></td></tr>
  </table>

  <TABLE width="98%" border=0 align="center" cellpadding="2" cellspacing="1" bgcolor="#000000">
    <TR align=center class="tdhead">
      <TD width="5%" height="22" nowrap>���</TD>
      <TD width="15%" nowrap>������</TD>
      <TD width="15%" nowrap>��������</TD>
      <TD width="10%" align="center" nowrap>����</TD>
      <TD width="10%" align="center" nowrap>״̬</TD>
      <TD width="10%" align="center" nowrap>��ʼʱ��</TD>
      <TD width="10%" align="center" nowrap>����ʱ��</TD>
      <TD width="10%" align="center" nowrap>������ʱ��S��</TD>
    </TR>


    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>1
      <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>�����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>ODS�ɹ�</TD>
      <TD align="center" nowrap>2006-02-28 20:02:07</TD>
      <TD align="center" nowrap>2006-02-28 20:09:14</TD>
      <TD align="center" nowrap>427.0</TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>2
      <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>ȫ����ʵ����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>DM�ɹ�</TD>
      <TD align="center" nowrap>2006-02-28 20:09:46</TD>
      <TD align="center" nowrap>2006-02-28 20:09:53</TD>
      <TD align="center" nowrap>7.0 </TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>3
        <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>������ʵ����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>ODS���µ���</TD>
      <TD align="center" nowrap>2006-02-28 20:09:56</TD>
      <TD align="center" nowrap>2006-02-28 20:09:57</TD>
      <TD align="center" nowrap>1.0 </TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>4
        <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>������ʵ����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>ODS���µ���</TD>
      <TD align="center" nowrap>2006-02-28 20:09:56</TD>
      <TD align="center" nowrap>2006-02-28 20:09:57</TD>
      <TD align="center" nowrap>1.0 </TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>5
        <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>������ʵ����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>ODS���µ���</TD>
      <TD align="center" nowrap>2006-02-28 20:09:56</TD>
      <TD align="center" nowrap>2006-02-28 20:09:57</TD>
      <TD align="center" nowrap>1.0 </TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>6
        <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>������ʵ����</TD>
      <TD align="center" nowrap>����</TD>
      <TD align="center" nowrap>ODS���µ���</TD>
      <TD align="center" nowrap>2006-02-28 20:09:56</TD>
      <TD align="center" nowrap>2006-02-28 20:09:57</TD>
      <TD align="center" nowrap>1.0 </TD>
    </TR>
    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22 nowrap>7
        <input type="checkbox" name="subitemkey" value="checkbox"></TD>
      <TD align="left" nowrap>����ϵͳ</TD>
      <TD align="left" nowrap>������ʵ����</TD>
      <TD align="center" nowrap>��</TD>
      <TD align="center" nowrap>ODS���µ���</TD>
      <TD align="center" nowrap>2006-02-28 20:09:56</TD>
      <TD align="center" nowrap>2006-02-28 20:09:57</TD>
      <TD align="center" nowrap>1.0 </TD>
    </TR>
  </TABLE>
</FORM>
</BODY>
</HTML>
