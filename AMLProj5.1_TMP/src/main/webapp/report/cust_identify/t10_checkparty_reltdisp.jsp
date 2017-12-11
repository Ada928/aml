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
</head>
<body leftmargin="0" topmargin="0" class="mainbg">
<html:form method="post" action="/cust_identify/t10_checkparty_reltdisp.do">
  <div id="main">
    <!-- conditions -->
    <div class="conditions">
      <!-- title -->
	 <div class="cond_t">
	   <span>������ϸ��Ϣ</span>
	 </div>
      <!-- table content -->
      <div class="cond_c2">
        <table border="0" cellpadding="0" cellspacing="0">
          <tr>
            
            <td>���۱�ţ�</td>
            <td>
             <bean:write name="checkparty_relt" property="check_no" scope="request"/>
            </td>
            <td>ʶ�����ͣ�</td>
            <td>
              <bean:write name="checkparty_relt" property="check_type_disp" scope="request"/>
            </td>
          </tr>
          <tr>
            <td>������ۣ�</td>
            <td>
             <bean:write name="checkparty_relt" property="check_result_disp" scope="request"/>
            </td>
            <td>����;����</td>
            <td>
              <bean:write name="checkparty_relt" property="check_method_disp" scope="request"/>
            </td>
          </tr>
          <tr>
            <td>�ͻ��ţ�</td>
            <td>
             <bean:write name="checkparty_relt" property="party_id" scope="request"/>
            </td>
            <td>�ͻ����ͣ�</td>
            <td>
              <bean:write name="checkparty_relt" property="party_class_cd_disp" scope="request"/>
            </td>
          </tr>
           <tr>
            <td>������Ч�ڣ�</td>
            <td>
             <bean:write name="checkparty_relt" property="valid_dt_disp" scope="request"/>
            </td>
            <td>�������ڣ�</td>
            <td>
              <bean:write name="checkparty_relt" property="check_dt_disp" scope="request"/>
            </td>
          </tr>
         
          <tr>
            <td>���������</td>
            <td>
             <bean:write name="checkparty_relt" property="checker_org_name" scope="request"/>
            </td>
            <td>�����ˣ�</td>
            <td>
              <bean:write name="checkparty_relt" property="checker" scope="request"/>
            </td>
          </tr>
          <!--<tr>
            <td>AML���ͣ�</td>
            <td>
             <bean:write name="checkparty_relt" property="aml1_type_disp" scope="request"/>
            </td>
            <td>����ʶ�����ͣ�</td>
            <td>
              <bean:write name="checkparty_relt" property="recheck_type_disp" scope="request"/>
            </td>
          </tr>
          --><tr>
            <td>�����ȼ���</td>
            <td>
             <bean:write name="checkparty_relt" property="auditlevel" scope="request"/>
            </td>
            <td>����������</td>
            <td>
              <bean:write name="checkparty_relt" property="leader_num" scope="request"/>
            </td>
          </tr>
          <tr>
            <td>�Ƿ����밶�����йأ�</td>
            <td>
             <bean:write name="checkparty_relt" property="lian_flag_disp" scope="request"/>
            </td>
            <td>�Ƿ����˴���</td>
            <td>
              <bean:write name="checkparty_relt" property="agent_flag_disp" scope="request"/>
            </td>
          </tr>
           <tr>
            <td>�Ƿ����Ӱ�������</td>
            <td>
             <bean:write name="checkparty_relt" property="addw_flag" scope="request"/>
            </td>
            <td>�Ƿ����Ӻ�������</td>
            <td>
              <bean:write name="checkparty_relt" property="addb_flag" scope="request"/>
            </td>
          </tr>
           <tr>
            <td>�Ƿ�ͨ���������ô����ѯ��</td>
            <td>
             <bean:write name="checkparty_relt" property="credit_flag_disp" scope="request"/>
            </td>
            <td>�Ƿ�������գ�</td>
            <td>
              <bean:write name="checkparty_relt" property="auditlevel_flag" scope="request"/>
            </td>
          </tr>
          <tr>
            <td>�������˵����</td>
            <td colspan="3">
             <bean:write name="checkparty_relt" property="check_explain" scope="request"/>
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
