<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv=Content-Type content="text/html; charset=GBK" />
		<!-- <link rel="stylesheet" href="<%=request.getContextPath()%>/css/css_all.css" type="text/css" /> -->
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/title.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../js/blank.gif"; </script>
<script type="text/javascript" src="../js/iepngfix.js"></script>
<script type="text/javascript" src="../js/unitpngfix.js"></script>
<![endif]-->
		<script language="JavaScript">
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
        for (i=0;i<document.all.length ;i++ )
           {
             e=document.all[i];
             if(e.type=="text"){
                 var textname=e.name;
                 var obj=eval('document.forms[0].'+textname);
                
                // alert(textname+obj.disabled);
                 if(obj.disabled=="true"){
                    obj.disabled=false;
                 }
             }
           
            }

        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }
}

</script>
	</head>
	<body class="mainbg">
		<div id="main">
			<html:form method="post" action="/trade/t47_transaction_disp.do">
				<html:errors />
				<!-- conditions -->
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>���� - ������ϸ</span>
						<span class="buttons"> <a href="#"
							onclick="window.close();"><img
									src="../../images/<%=session.getAttribute("style") %>/b_shut.png" />�� ��</a> <!-- <html:button property="backbutton" value="�� ��" styleClass="input" onclick="javascript:window.close()"/> -->
						</span>
					</div>
					<!-- table content -->
					<div class="cond_c2">
						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									��ˮ�ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_no" />
								</td>
								<td>
									�Է��Ƿ����пͻ���
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_isparty_flag" />
								</td>
							</tr>
							<tr>
								<td>
									���׻�����
								</td>
								<td>
									<bean:write name="t47_transaction" property="organName" />
								</td>
								<td>
									�Է��������ƣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_organname" />
								</td>
							</tr>
							<tr>
								<td>
									�������ڣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_dt_disp" />
								</td>
								<td>
									�Է��������ڣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_tx_dt_disp" />
								</td>
							</tr>

							<tr>
								<td>
									�����˺ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="acct_num" />
								</td>
								<td>
									�Է��˺ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_acct_num" />
								</td>
							</tr>
							<tr>
								<td>
									�����˻����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="acct_type_string" />
								</td>
								<td>
									�Է��˻����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_acct_type_cd_string" />
								</td>
							</tr>
							<tr>
								<td>
									���пͻ��ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="party_id" />
								</td>
								<td>
									�Է��ͻ��ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_party_id" />
								</td>
							</tr>

							<tr>
								<td>
									�ͻ����ƣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="party_chn_name" />
								</td>
								<td>
									�Է����ƣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_name" />
								</td>
							</tr>
							<tr>
								<td>
									�ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="party_class_cd_flag" />
								</td>
								<td>
									�Է��ͻ����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_party_class_cd_falg" />
								</td>
							</tr>

							<tr>
								<td>
									��Ŀ��
								</td>
								<td>
									<bean:write name="t47_transaction" property="subjectno" />
									--
									<bean:write name="t47_transaction" property="subjectname" />
								</td>
								<td>
									�Է�֤�����룺
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_card_no" />
								</td>
							</tr>
							<tr>
								<td>
									�ո���־��
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="receive_pay_cd_flag" />
								</td>
								<td>
									�Է�֤�����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="opp_Card_type_flag" />
								</td>
							</tr>
							<tr>
								<td>
									����־��
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="remit_type_cd_flag" />
								</td>
								<td>
									������־��
								</td>
								<td>
									<bean:write name="t47_transaction" property="batch_ind_flag" />
								</td>
							</tr>
							<tr>
								<td>
									��/ת��־��
								</td>
								<td>
									<bean:write name="t47_transaction"
										property="cash_trans_flag_disp" />
								</td>
								<td>
									Ĩ�˱�־��
								</td>
								<td>
									<bean:write name="t47_transaction" property="cancel_ind_disp" />
								</td>
							</tr>
							<tr>
								<td>
									���״��룺
								</td>
								<td>
									<bean:write name="t47_transaction" property="cb_tx_cd" />
									--
									<bean:write name="t47_transaction" property="cb_tx_cd_name" />
								</td>
								<td>
									�Ƿ�羳���ף�
								</td>
								<td>
									<bean:write name="t47_transaction" property="overarea_ind_flag" />
								</td>
							</tr>
							<tr>
								<td>
									�����־��
								</td>
								<td>
									<bean:write name="t47_transaction" property="debit_credit_disp" />
								</td>
								<td>
									���㷽ʽ��
								</td>
								<td>
									<bean:write name="t47_transaction" property="settle_type_cd" />
								</td>
							</tr>
							<tr>
								<td>
									���֣�
								</td>
								<td>
									<bean:write name="t47_transaction" property="currency_cd_disp" />
								</td>
								<td>
									��;��
								</td>
								<td>
									<bean:write name="t47_transaction" property="use_des" />
								</td>
							</tr>
							<tr>
								<td>
									ԭ�ҽ��׽�
								</td>
								<td>
									<bean:write name="t47_transaction" property="amt_string" />
								</td>
							
								<td>
									ժҪ��
								</td>
								<td>
									<bean:write name="t47_transaction" property="des" />
								</td>
							</tr>
							<tr>
								<td>
									���׷����أ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_occur_disp" />
								</td>
								<td>
									���׷���
								</td>
								<td>
									<bean:write name="t47_transaction" property="tx_go_disp" />
								</td>
							</tr>
							<tr>
								<td>
									����ң�
								</td>
								<td>
									<bean:write name="t47_transaction" property="cny_amt_string" />
								</td>
								<td>
									��Ա��
								</td>
								<td>
									<bean:write name="t47_transaction" property="teller" />
									<!----<bean:write name="t47_transaction" property="teller_disp" />-->
								</td>
							</tr>
							<tr>
								<td>
									����Ԫ��
								</td>
								<td>
									<bean:write name="t47_transaction" property="usd_amt_string" />
								</td>
								<td>
									��Ʊ�ţ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="voucher_no" />
								</td>
							</tr>
								<tr>
								<td>
									�Է�������룺
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_organkey" />
								</td>
								<td>
									�Է���������������
								</td>
								<td>
									<bean:write name="t47_transaction" property="opp_area" />
								</td>
							</tr>
								<tr>
								<td>
									������������
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_name" />
								</td>
								<td>
									������֤�����ͣ�
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_card_type" />
								</td>
							</tr>
								<tr>
								<td>
									�����˹�����
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_country" />
								</td>
								<td>
									������֤�����룺
								</td>
								<td>
									<bean:write name="t47_transaction" property="agent_card_no" />
								</td>
							</tr>
							<tr>
								<td>
									�Ƿ���㣺
								</td>
								<td>
									<bean:write name="t47_transaction" property="cal_ind_disp" />
								</td>
								<td>
									����ʱ�䣺
								</td>
								<td>
									<bean:write name="t47_transaction" property="dt_time_disp" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</html:form>
		</div>
	</body>
</html>