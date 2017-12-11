<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<script type="text/javascript" src="../../js/ymPrompt.js"></script>
<script type="text/javascript" src="../../js/calendar.js"></script>
<script language="javascript">
function dosubmit(theUrl){
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
function checkForm(theUrl){
  var errMsg ="";
  if(getLength(document.forms[0].statistic_dt_disp.value)==0){
      errMsg+="��ѡ�����ڣ�";
      document.forms[0].statistic_dt_disp.focus();
  }
  else if(getLength(document.forms[0].querycount_n.value)==0){
      errMsg+="��ѯ��������Ϊ�գ�";
      document.forms[0].querycount_n.focus();
   }
  else if(formatNum(document.forms[0].querycount_n.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].querycount_n.focus();
   }
  else if(getLength(document.forms[0].partycount_n.value)==0){
      errMsg+="�漰�ͻ�������Ϊ�գ�";
      document.forms[0].partycount_n.focus();
   }
  else if(formatNum(document.forms[0].partycount_n.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].partycount_n.focus();
  } 
  else if(getLength(document.forms[0].acctcount_n.value)==0){
      errMsg+="�漰�˻�������Ϊ�գ�";
      document.forms[0].acctcount_n.focus();
   }
  else if(formatNum(document.forms[0].acctcount_n.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].acctcount_n.focus();
  }else if(getLength(document.forms[0].kycount_n.value)==0){
      errMsg+="�����쳣���������������Ϊ�գ�";
      document.forms[0].kycount_n.focus();
   }
  else if(formatNum(document.forms[0].kycount_n.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].kycount_n.focus();
  }else if(getLength(document.forms[0].querycount_r.value)==0){
      errMsg+="��ѯ��������Ϊ�գ�";
      document.forms[0].querycount_r.focus();
   }
  else if(formatNum(document.forms[0].querycount_r.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].querycount_r.focus();
  }else if(getLength(document.forms[0].partycount_r.value)==0){
      errMsg+="�漰�ͻ�������Ϊ�գ�";
      document.forms[0].partycount_r.focus();
   }
  else if(formatNum(document.forms[0].partycount_r.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].partycount_r.focus();
  }
  else if(getLength(document.forms[0].acctcount_r.value)==0){
      errMsg+="�漰�˻�������Ϊ�գ�";
      document.forms[0].acctcount_r.focus();
   }
  else if(formatNum(document.forms[0].acctcount_r.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].acctcount_r.focus();
  }
  else if(getLength(document.forms[0].kycount_r.value)==0){
      errMsg+="�����쳣���������������Ϊ�գ�";
      document.forms[0].kycount_r.focus();
   }
  else if(formatNum(document.forms[0].kycount_r.value,0,null,null,false)==false){
      errMsg+="������������";
      document.forms[0].kycount_r.focus();
  }
   
  if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
 }
</script>
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/cust_identify/modifyT10_party_cretal.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>�޸Ļ������ô���Ӧ�ñ�</span>
	   <span class="buttons">
	    <a href="#" onclick="dosubmit('t10_party_cretal_managelist.do')"><img src="../../images/blue/b_back.png" />����</a>
	   </span>
	 </div>
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td><font color="#FF0000">*</font> ͳ�����ڣ�</td>
            <td>
             <html:hidden name="t10_party_cretal" property="organkey"/>
             <html:text name="t10_party_cretal" property="statistic_dt_disp"  readonly="true"  size="6" />
            </td>
            <td><font color="#FF0000">*</font>��ѯ����(���¿ͻ�ʶ��)��</td>
            <td>
               <html:text name="t10_party_cretal" property="querycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font>��ѯ����(�¿��ͻ�)��</td>
            <td>
               <html:text name="t10_party_cretal" property="querycount_n"/>
            </td>
            <td><font color="#FF0000">*</font> �漰�ͻ���(���¿ͻ�ʶ��)��</td>
            <td>
             <html:text name="t10_party_cretal" property="partycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font> �漰�ͻ���(�¿��ͻ�)��</td>
            <td>
             <html:text name="t10_party_cretal" property="partycount_n"/>
            </td>
            <td><font color="#FF0000">*</font>�漰�˻���(���¿ͻ�ʶ��)��</td>
            <td>
               <html:text name="t10_party_cretal" property="acctcount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font>�漰�˻���(�¿��ͻ�)��</td>
            <td>
               <html:text name="t10_party_cretal" property="acctcount_n"/>
            </td>
            <td><font color="#FF0000">*</font> �����쳣�����������(���¿ͻ�ʶ��)��</td>
            <td>
             <html:text name="t10_party_cretal" property="kycount_r"/>
            </td>
          </tr>
          <tr>
            <td><font color="#FF0000">*</font> �����쳣�����������(�¿��ͻ�)��</td>
            <td colspan="3">
             <html:text name="t10_party_cretal" property="kycount_n"/>
            </td>
            
            
          </tr>
          <tr>
            <td align="center" colspan="4"><input name="" type="button" class="in_button1" value="�� ��" onclick="checkForm('modifyT10_party_cretal.do')" />
              <input name="" type="reset" class="in_button1" value="�� ��" />
            </td>
          </tr>
        </table>
      </div>
    </div>
    <!-- all end -->
  </div>
</html:form>
</body>
</html>
