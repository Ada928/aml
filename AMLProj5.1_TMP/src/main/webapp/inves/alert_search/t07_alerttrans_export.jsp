<%@ page contentType="text/html; charset=GBK"%>

<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new Date());
		String downloadname = "Ԥ��������Ϣ" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
	
  
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">

<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="t07_alerttrans_export.files/filelist.xml">
<link rel=Edit-Time-Data href="t07_alerttrans_export.files/editdata.mso">
<link rel=OLE-Object-Data href="t07_alerttrans_export.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Created>1996-12-17T01:32:42Z</o:Created>
  <o:LastSaved>2011-05-26T02:00:39Z</o:LastSaved>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
 <o:OfficeDocumentSettings>
  <o:RemovePersonalInformation/>
 </o:OfficeDocumentSettings>
</xml><![endif]-->
<style>
<!--table
	{mso-displayed-decimal-separator:"\.";
	mso-displayed-thousand-separator:"\,";}
@page
	{margin:1.0in .75in 1.0in .75in;
	mso-header-margin:.5in;
	mso-footer-margin:.5in;}
tr
	{mso-height-source:auto;
	mso-ruby-visibility:none;}
col
	{mso-width-source:auto;
	mso-ruby-visibility:none;}
br
	{mso-data-placement:same-cell;}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	border:none;
	mso-protection:locked visible;
	mso-style-name:����;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:12.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl24
	{mso-style-parent:style0;
	font-size:22.0pt;
	font-weight:700;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl25
	{mso-style-parent:style0;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;}
.xl26
	{mso-style-parent:style0;
	text-align:center;
	border:.5pt solid windowtext;}
ruby
	{ruby-align:left;}
rt
	{color:windowtext;
	font-size:9.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:134;
	mso-char-type:none;
	display:none;}
-->
</style>
<!--[if gte mso 9]><xml>
 <x:ExcelWorkbook>
  <x:ExcelWorksheets>
   <x:ExcelWorksheet>
    <x:Name>Sheet1</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:CodeName>Sheet1</x:CodeName>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>6</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet2</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:CodeName>Sheet2</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
   <x:ExcelWorksheet>
    <x:Name>Sheet3</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:CodeName>Sheet3</x:CodeName>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>4530</x:WindowHeight>
  <x:WindowWidth>8505</x:WindowWidth>
  <x:WindowTopX>480</x:WindowTopX>
  <x:WindowTopY>120</x:WindowTopY>
  <x:AcceptLabelsInFormulas/>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=914 style='border-collapse:
 collapse;table-layout:fixed;width:685pt'>
 <col width=72 style='width:54pt'>
 <col width=95 style='mso-width-source:userset;mso-width-alt:3040;width:71pt'>
 <col width=91 style='mso-width-source:userset;mso-width-alt:2912;width:68pt'>
 <col width=100 span=2 style='mso-width-source:userset;mso-width-alt:3200;
 width:75pt'>
 <col width=111 span=2 style='mso-width-source:userset;mso-width-alt:3552;
 width:83pt'>
 <col width=120 style='mso-width-source:userset;mso-width-alt:3840;width:90pt'>
 <col width=114 style='mso-width-source:userset;mso-width-alt:3648;width:86pt'>
 <tr height=58 style='mso-height-source:userset;height:43.5pt'>
  <td height=58 width=72 style='height:43.5pt;width:54pt'></td>
  <td colspan=24 class=xl24 width=842 style='width:631pt'>Ԥ��������Ϣ</td>
 </tr>
 <tr height=20 style='height:15.0pt'>
  <td height=20 style='height:15.0pt'></td>
  <td class=xl25 style='border-top:none'>Ԥ�����</td>
   <td class=xl25 style='border-top:none;border-left:none'>Ԥ������</td>
  <td class=xl25 style='border-top:none;border-left:none'>Ԥ������</td>
  <td class=xl25 style='border-top:none;border-left:none'>�ͻ���</td>
   <td class=xl25 style='border-top:none;border-left:none'>�ͻ�����</td>
  <td class=xl25 style='border-top:none;border-left:none'>�ͻ�����</td>
  <td class=xl25 style='border-top:none;border-left:none'>���׺�</td>
  <td class=xl25 style='border-top:none;border-left:none'>�ʺ�</td>
  <td class=xl25 style='border-top:none;border-left:none'>������</td>
  <td class=xl25 style='border-top:none;border-left:none'>��������</td>
  <td class=xl25 style='border-top:none;border-left:none'>����</td>
   <td class=xl25 style='border-top:none;border-left:none'>��������</td>
  <td class=xl25 style='border-top:none;border-left:none'>���׽��</td>
  <td class=xl25 style='border-top:none;border-left:none'>������</td>
  <td class=xl25 style='border-top:none;border-left:none'>��ת��־</td>
  <td class=xl25 style='border-top:none;border-left:none'>�ո���־</td>
    <td class=xl25 style='border-top:none;border-left:none'>�����־</td>
   <td class=xl25 style='border-top:none;border-left:none'>���㷽ʽ</td>
  <td class=xl25 style='border-top:none;border-left:none'>��;</td>
  <td class=xl25 style='border-top:none;border-left:none'>�Է�����</td>
  <td class=xl25 style='border-top:none;border-left:none'>�Է��ʺ�</td>
  <td class=xl25 style='border-top:none;border-left:none'>�Է��ͻ�����</td>
   <td class=xl25 style='border-top:none;border-left:none'>�Է�������</td>
   <td class=xl25 style='border-top:none;border-left:none'>�Է���������</td>
  
  
 </tr>
 <logic:present name="t07_alertList">
 <logic:iterate id="trans" name="t07_alertList" type="com.ist.aml.report.dto.T47_transaction">
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <td class=xl25 style='border-top:none'><bean:write name="trans" property="alertkey" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="alert_mode_cd_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="rulekey_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="party_id" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="party_chn_name" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="party_class_cd" scope="page"/></td>
   <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="transactionkey" scope="page"/></td>
      <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="acct_num" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="organkey" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="organName" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="curr_cd" scope="page"/></td>
  
   <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="tx_dt_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="amt" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="cb_tx_cd" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="cash_trans_flag_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="receive_pay_cd" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="debit_credit_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="settle_type_cd" scope="page"/></td>
  
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="use_des" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="opp_name" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="opp_acct_num" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="opp_party_class_cd_disp" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="opp_organkey" scope="page"/></td>
  <td class=xl26 style='border-top:none;border-left:none'><bean:write name="trans" property="opp_organname" scope="page"/></td>
 

 </tr>
 </logic:iterate>
 </logic:present>

</table>

</body>

</html>
