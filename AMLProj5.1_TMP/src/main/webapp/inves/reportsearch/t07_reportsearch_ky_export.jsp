<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40" />
<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%

        String cast_type=(String)request.getAttribute("cast_type");
        SimpleDateFormat formater = new SimpleDateFormat("yyyy-MM-dd");
		String nowdate = formater.format(new java.util.Date());
		String typename="";
		if(cast_type!=null && cast_type.equals("1")){
		  typename="���";
		}else{
		  typename="����";
		}
		String downloadname =typename+"���������б�" + nowdate;
		downloadname = new String(downloadname.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ downloadname + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="t07_inrep_fr.files/filelist.xml">
<link rel=Edit-Time-Data href="t07_inrep_fr.files/editdata.mso">
<link rel=OLE-Object-Data href="t07_inrep_fr.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:Author>dunkee</o:Author>
  <o:LastAuthor>999������</o:LastAuthor>
  <o:LastPrinted>2007-11-16T07:12:53Z</o:LastPrinted>
  <o:Created>2007-11-16T07:05:37Z</o:Created>
  <o:LastSaved>2009-07-06T02:56:49Z</o:LastSaved>
  <o:Company>longtop</o:Company>
  <o:Version>11.9999</o:Version>
 </o:DocumentProperties>
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
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	border:none;
	mso-protection:locked visible;
	mso-style-name:"";}
.style0
	{mso-number-format:General;
	text-align:general;
	vertical-align:bottom;
	white-space:nowrap;
	mso-rotate:0;
	mso-background-source:auto;
	mso-pattern:auto;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
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
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	mso-protection:locked visible;
	white-space:nowrap;
	mso-rotate:0;}
.xl25
	{mso-style-parent:style0;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl26
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl28
	{mso-style-parent:style0;
	font-size:10.0pt;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl29
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;}
.xl30
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;}
.xl31
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:left;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	font-size:10.0pt;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
	vertical-align:bottom;}
.xl34
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:left;
	border:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	font-weight:700;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt hairline windowtext;
	border-left:none;}
.xl36
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:none;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl39
	{mso-style-parent:style0;
	text-align:right;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl40
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:2.0pt double windowtext;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl41
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:none;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl42
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:.5pt solid windowtext;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl43
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid windowtext;
	border-left:.5pt solid windowtext;
	background:#CCFFFF;
	mso-pattern:auto none;
	white-space:normal;}
.xl44
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:left;}
.xl45
	{mso-style-parent:style0;
	font-size:16.0pt;
	text-align:left;
	border-top:none;
	border-right:none;
	border-bottom:2.0pt double windowtext;
	border-left:none;}
.xl46
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:left;
	border-top:2.0pt double windowtext;
	border-right:none;
	border-bottom:none;
	border-left:none;
	white-space:normal;}
.xl47
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:left;
	white-space:normal;}
.xl48
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	white-space:normal;}
.xl49
	{mso-style-parent:style0;
	font-size:10.0pt;
	text-align:center;
	border:.5pt solid windowtext;
	background:yellow;
	mso-pattern:auto none;
	white-space:normal;}
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
    <x:Name>����</x:Name>
    <x:WorksheetOptions>
     <x:DefaultRowHeight>285</x:DefaultRowHeight>
     <x:Print>
      <x:ValidPrinterInfo/>
      <x:PaperSizeIndex>9</x:PaperSizeIndex>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:PageBreakZoom>60</x:PageBreakZoom>
     <x:Selected/>
     <x:DoNotDisplayGridlines/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>11</x:ActiveRow>
       <x:ActiveCol>1</x:ActiveCol>
       <x:RangeSelection>$B$12:$I$12</x:RangeSelection>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9720</x:WindowHeight>
  <x:WindowWidth>15480</x:WindowWidth>
  <x:WindowTopX>240</x:WindowTopX>
  <x:WindowTopY>75</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1240 style='border-collapse:
 collapse;table-layout:fixed;width:931pt'>
 <col width=10 style='mso-width-source:userset;mso-width-alt:320;width:8pt'>
 <col width=222 style='mso-width-source:userset;mso-width-alt:7104;width:167pt'>
 <col width=84 span=12 style='mso-width-source:userset;mso-width-alt:2688;
 width:63pt'>
 <col width=92 span=242 style='mso-width-source:userset;mso-width-alt:2944;
 width:69pt'>
 <tr height=35 style='mso-height-source:userset;height:26.25pt'>
  <td height=35 width=10 style='height:26.25pt;width:8pt'></td>
  <td colspan=13 class=xl35 width=1230 style='width:923pt'> <logic:equal value="1" name="cast_type">���������Ϣ��</logic:equal>
						     <logic:equal value="2" name="cast_type">���ɰ��������Ϣ��</logic:equal></td>
 </tr>
 <tr height=15 style='mso-height-source:userset;height:11.25pt'>
  <td height=15 style='height:11.25pt'></td>
  <td class=xl25>��</td>
  <td class=xl25>��</td>
  <td class=xl25>��</td>
  <td class=xl25>��</td>
  <td class=xl25>��</td>
  <td colspan=20 class=xl25>��</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <td class=xl31 colspan='27' width=1230 style='border-left:none;width:931pt;font-weight:700;text-align:left;'>�����ͻ���Ϣ</td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ڻ�������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ڻ�������(����)</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ�����/����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ����֤��/֤���ļ�����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ����֤��/֤���ļ�����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>����֤������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ�����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>����ʱ��</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ���ϸ��ַ</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ�����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��˽�ͻ���ְҵ</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�Թ��ͻ�����ҵ���</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�Թ��ͻ�ע���ʽ�</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�Թ��ͻ���������������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�Թ��ͻ��������������֤������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�Թ��ͻ��������������֤������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�����漰���</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ڻ������ڵ���������������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ���</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ�״̬</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ���ϵ�绰</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�ͻ�������ϵ��ʽ</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�˻�����</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>������������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ɽ�����ϸ�ܱ���</td>
 </tr>
 <tr class=xl33 height=17 style='height:12.75pt'>
    <td height=17 class=xl33 style='height:12.75pt'></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="application_num"/></td>
	<td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="case_date_disp"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="t07_case_application" property="app_org_name"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="app_org_id"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="party_name"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="card_type"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="card_no"/></td>
	<td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="t07_case_application" property="party_class_cd"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="create_dt_disp"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="addr1"/>;<bean:write name="t07_case_application" property="addr2"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="country_cd"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="t07_case_application" property="industrykey"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="enrol_fund_amt"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="legal_obj"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="legal_card_type"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="legal_card_no"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="tran_amt"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="union_organ"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="party_id"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="is_menu_disp"/></td>
	<td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="tel_no"/>;<bean:write name="t07_case_application" property="cell_no"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:nonewidth:931pt;'></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="stcr_count"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="tran_count"/></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <logic:equal value="2" name="t07_case_application" property="cast_type">
     <td class=xl31 colspan='14' width=1230 style='border-left:none;width:931pt;font-weight:700;text-align:left;'>����������Ϣ</td>
  </logic:equal>
  <logic:equal value="1" name="t07_case_application" property="cast_type">
     <td class=xl31 colspan='4' width=1230 style='border-left:none;width:931pt;font-weight:700;text-align:left;'>����������Ϣ</td>
  </logic:equal>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>������ֹʱ��</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��������״̬</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>ҵ������</td>
  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��������</td>
  <logic:equal value="2" name="t07_case_application" property="cast_type">
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���㴦������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���㴦����</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ɳ̶�</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�����������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>���ɽ�����������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��ȡ��ʩ</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>֧��������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>֧���������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>�����������</td>
	  <td class=xl31 width=1230 style='border-left:none;width:931pt'>��������ʱ��</td>
  </logic:equal>
 </tr>
 <tr class=xl33 height=17 style='height:12.75pt'>
    <td height=17 class=xl33 style='height:12.75pt'></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="app_dt_disp"/>��<bean:write name="t07_case_application" property="case_end_date_disp"/></td>
	<td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="casesearchtime_disp"/></td>
    <td class=xl48  width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="t07_case_application" property="currency_cd_disp"/><bean:write name="t07_case_application" property="party_class_cd"/></td>
    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="date_status_cd"/></td>
    <logic:equal value="2" name="t07_case_application" property="cast_type">
	    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post02_date"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post02_result"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="alert_level_disp"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="application_advice"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="action_descrip"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="take_action"/></td>
	    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post03_result"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post03_date"/></td>
	    <td class=xl48  width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post04_result"/></td>
	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="t07_case_application" property="post04_date"/></td>
    </logic:equal>
 </tr>
 <tr height=19 style='height:14.25pt'>
  <td height=19 style='height:14.25pt'></td>
 </tr>
 <tr height=19 style='height:14.25pt'>
    <td height=19 style='height:14.25pt'></td>
    <td class=xl31 colspan='26' width=1230 style='border-left:none;width:931pt;font-weight:700;text-align:left;'>���������뽻����Ϣ</td>
 </tr>
 <logic:iterate id="t07_case_stcr" name="t07_case_stcrList" type="com.ist.aml.report.dto.T07_case_stcr">
     <tr height=19 style='height:14.25pt'>
	    <td height=19 style='height:14.25pt'></td>
	 </tr>
     <tr height=19 style='height:14.25pt'>
	    <td height=19 style='height:14.25pt'></td>
	    <td class=xl31 colspan='26' width=1230 style='border-left:none;width:931pt;font-weight:700;text-align:left;'>����������<bean:write name="t07_case_stcr" property="stcr"/>&nbsp;&nbsp;<bean:write name="t07_case_stcr" property="stcr_disp"/></td>
	 </tr> 
	 <tr height=19 style='height:14.25pt'>
		<td height=19 style='height:14.25pt'></td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>��������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���״���</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׽��</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׶����˻�����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׶��ֿͻ��˺�</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�Է����ڻ�������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�Է����ڻ�����������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�Է����ڻ�������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׶�������/����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׶������֤��/֤���ļ�����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׶������֤��/֤���ļ�����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>ҵ���ʾ��</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�ʽ��ո���־</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�ʽ���Դ��;</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>����������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���������֤��/֤���ļ�����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���������֤��/֤���ļ�����</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�����˹���</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>��ˮ��</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>��������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׻���</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>������֧���׷��������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>�Է����ڻ�������������������</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>���׷�ʽ</td>
		<td class=xl31 width=1230 style='border-left:none;width:931pt'>����״̬���ų���������</td>
	 </tr>
	 <logic:iterate id="trans" name="t07_case_stcr" property="t07_stcr_transList" type="com.ist.aml.report.dto.T47_transaction">
	     <tr class=xl33 height=17 style='height:12.75pt'>
	        <td height=17 class=xl33 style='height:12.75pt'></td>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="tx_dt_disp"/></TD>
	  	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="cb_tx_cd"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="trans" property="currency_cd_disp"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="amt_disp"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_acct_type_cd"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_acct_num"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_organname"/></TD>
	  	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_organ_type"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="trans" property="opp_organkey"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_name"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_card_type"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="opp_card_no"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="transactionkey"/></TD>
	  	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="receive_pay_cd_disp"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:nonewidth:931pt;'><bean:write name="trans" property="use_des"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="agent_name"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="agent_card_type"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="agent_card_no"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="agent_country"/></TD>
	  	    <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="tx_no"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="cash_trans_flag_disp"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="organname"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="tsctkey"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="union_organ"/></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:nonewidth:931pt;'></TD>
	        <td class=xl48 width=1230 style='border-top:none;border-left:none;width:931pt'><bean:write name="trans" property="status_cd_disp"/></TD>
		 </tr>
     </logic:iterate>
 </logic:iterate>
</table>

</body>
</html>
