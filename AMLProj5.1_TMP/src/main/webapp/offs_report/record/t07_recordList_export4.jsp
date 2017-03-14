<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html xmlns:o="urn:schemas-microsoft-com:office:office"
xmlns:x="urn:schemas-microsoft-com:office:excel"
xmlns="http://www.w3.org/TR/REC-html40">
<%

		String excelName = (String)request.getAttribute("excelName");
		excelName = new String(excelName.getBytes("GBK"), "ISO8859_1")
				.trim();
		response.setHeader("Content-disposition", "attachment; filename="
				+ excelName + ".xls");
  
 %>
<head>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<meta name=ProgId content=Excel.Sheet>
<meta name=Generator content="Microsoft Excel 11">
<link rel=File-List href="010021100001836E20120F000.files/filelist.xml">
<link rel=Edit-Time-Data href="010021100001836E20120F000.files/editdata.mso">
<link rel=OLE-Object-Data href="010021100001836E20120F000.files/oledata.mso">
<!--[if gte mso 9]><xml>
 <o:DocumentProperties>
  <o:LastAuthor>user</o:LastAuthor>
  <o:Created>2012-07-09T03:03:27Z</o:Created>
  <o:LastSaved>2012-07-09T03:03:27Z</o:LastSaved>
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
	mso-footer-margin:.5in;
	mso-page-orientation:landscape;}
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
	mso-style-name:����;
	mso-style-id:0;}
td
	{mso-style-parent:style0;
	padding-top:1px;
	padding-right:1px;
	padding-left:1px;
	mso-ignore:padding;
	color:windowtext;
	font-size:10.0pt;
	font-weight:400;
	font-style:normal;
	text-decoration:none;
	font-family:Arial, sans-serif;
	mso-font-charset:0;
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
	color:black;
	font-family:SansSerif, sans-serif;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl25
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border:.5pt solid black;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl26
	{mso-style-parent:style0;
	color:black;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl27
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl28
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:none;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl29
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl30
	{mso-style-parent:style0;
	color:black;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl31
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:right;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl32
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl33
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:.5pt solid black;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl34
	{mso-style-parent:style0;
	color:black;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:.5pt solid black;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:none;
	background:#969696;
	mso-pattern:auto none;
	white-space:normal;}
.xl35
	{mso-style-parent:style0;
	color:black;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:none;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl36
	{mso-style-parent:style0;
	color:black;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border-top:none;
	border-right:.5pt solid black;
	border-bottom:.5pt solid black;
	border-left:.5pt solid black;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl37
	{mso-style-parent:style0;
	color:black;
	font-size:18.0pt;
	font-weight:700;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:center;
	vertical-align:middle;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
	white-space:normal;}
.xl38
	{mso-style-parent:style0;
	color:black;
	font-size:12.0pt;
	font-family:����;
	mso-generic-font-family:auto;
	mso-font-charset:0;
	text-align:left;
	vertical-align:top;
	border:none;
	mso-background-source:auto;
	mso-pattern:auto;
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
    <x:Name>t07_report3</x:Name>
    <x:WorksheetOptions>
     <x:Print>
      <x:LeftToRight/>
      <x:ValidPrinterInfo/>
      <x:HorizontalResolution>300</x:HorizontalResolution>
      <x:VerticalResolution>300</x:VerticalResolution>
     </x:Print>
     <x:Selected/>
     <x:Panes>
      <x:Pane>
       <x:Number>3</x:Number>
       <x:ActiveRow>10</x:ActiveRow>
       <x:ActiveCol>5</x:ActiveCol>
      </x:Pane>
     </x:Panes>
     <x:ProtectContents>False</x:ProtectContents>
     <x:ProtectObjects>False</x:ProtectObjects>
     <x:ProtectScenarios>False</x:ProtectScenarios>
    </x:WorksheetOptions>
   </x:ExcelWorksheet>
  </x:ExcelWorksheets>
  <x:WindowHeight>9150</x:WindowHeight>
  <x:WindowWidth>14940</x:WindowWidth>
  <x:WindowTopX>360</x:WindowTopX>
  <x:WindowTopY>270</x:WindowTopY>
  <x:ProtectStructure>False</x:ProtectStructure>
  <x:ProtectWindows>False</x:ProtectWindows>
 </x:ExcelWorkbook>
</xml><![endif]-->
</head>

<body link=blue vlink=purple>

<table x:str border=0 cellpadding=0 cellspacing=0 width=1596 style='border-collapse:
 collapse;table-layout:fixed;width:1197pt'>
 <col width=132 style='mso-width-source:userset;mso-width-alt:4827;width:99pt'>
 <col width=180 style='mso-width-source:userset;mso-width-alt:6582;width:135pt'>
 <col width=217 style='mso-width-source:userset;mso-width-alt:7936;width:163pt'>
 <col width=196 style='mso-width-source:userset;mso-width-alt:7168;width:147pt'>
 <col width=235 style='mso-width-source:userset;mso-width-alt:8594;width:176pt'>
 <col width=132 span=4 style='mso-width-source:userset;mso-width-alt:4827;
 width:99pt'>
 <col width=108 style='mso-width-source:userset;mso-width-alt:3949;width:81pt'>
 <tr height=53 style='mso-height-source:userset;height:39.95pt'>
  <td colspan=6 height=53 class=xl37 width=1092 style='height:39.95pt;
  width:819pt'>���ڻ�����ϴǮ�����ڲ�������</td>
  <td class=xl24 width=132 style='width:99pt'>��</td>
  <td class=xl24 width=132 style='width:99pt'>��</td>
  <td class=xl24 width=132 style='width:99pt'>��</td>
  <td class=xl24 width=108 style='width:81pt'>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl25 width=132 style='height:30.0pt;width:99pt'>�������ͣ�</td>
  <td class=xl26 width=180 style='width:135pt'><bean:write name="type_cd"/></td>
  <td class=xl27 width=217 style='width:163pt'>������Դ��</td>
  <td class=xl26 width=196 style='width:147pt'><bean:write name="level"/></td>
  <td class=xl27 width=235 style='width:176pt'>��ȣ�</td>
  <td class=xl26 width=132 style='width:99pt'><bean:write name="year"/></td>
  <td class=xl27 width=132 style='width:99pt' x:str="">��</td>
  <td class=xl28 width=132 style='width:99pt' x:str="">��</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl29 width=132 style='height:30.0pt;width:99pt'>���ڻ��������룺</td>
  <td class=xl30 width=180 style='width:135pt'><bean:write name="report_organcode"/></td>
  <td class=xl31 width=217 style='width:163pt'>���λ���ƣ�</td>
  <td class=xl30 width=196 style='width:147pt'><bean:write name="report_orgname"/></td>
  <td class=xl31 width=235 style='width:176pt'>���λ�������룺</td>
  <td class=xl30 width=132 style='width:99pt'><bean:write name="report_organkey"/></td>
  <td class=xl31 width=132 style='width:99pt'>�㱨���־��</td>
  <td class=xl28 width=132 style='width:99pt'><bean:write name="zero_flag"/></td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl29 width=132 style='height:30.0pt;width:99pt'>�Ʊ��ˣ�</td>
  <td class=xl30 width=180 style='width:135pt'><bean:write name="realName"/></td>
  <td class=xl31 width=217 style='width:163pt'>��ϵ�绰��</td>
  <td class=xl30 width=196 style='width:147pt'><bean:write name="telephone"/></td>
  <td class=xl31 width=235 style='width:176pt'>����ڣ�</td>
  <td class=xl26 width=132 style='border-top:none;width:99pt'><bean:write name="reportDate"/></td>
  <td class=xl31 width=132 style='width:99pt' x:str="">��</td>
  <td class=xl32 width=132 style='width:99pt' x:str="">��</td>
  <td colspan=2 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=6 height=26 class=xl38 width=1092 style='height:20.1pt;
  width:819pt' x:str="">��</td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td rowspan=2 height=80 class=xl25 width=132 style='height:60.0pt;width:99pt'>�ڲ���ƽ��ۣ�</td>
  <td class=xl27 width=180 style='width:135pt'>�ڿ��ƶȲ����ƣ�</td>
  <td class=xl26 width=217 style='width:163pt'><bean:write name="t07_recordor" property="remark4"/></td>
  <td class=xl27 width=196 style='width:147pt'>�����ɽ���©����</td>
  <td class=xl26 width=235 style='width:176pt'><bean:write name="t07_recordor" property="remark5"/></td>
  <td class=xl27 width=132 style='width:99pt'>�ͻ����ʶ�𲻵�λ��</td>
  <td class=xl26 width=132 style='width:99pt'><bean:write name="t07_recordor" property="remark6"/></td>
  <td class=xl27 width=132 style='width:99pt'>δ�������⣺</td>
  <td class=xl26 width=132 style='width:99pt'><bean:write name="t07_recordor" property="remark7"/></td>
  <td class=xl24>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl31 width=180 style='height:30.0pt;width:135pt'>������ѵ����λ��</td>
  <td class=xl30 width=217 style='width:163pt'><bean:write name="t07_recordor" property="remark8"/></td>
  <td class=xl31 width=196 style='width:147pt'>�ͻ����ϱ��治ȫ��</td>
  <td class=xl30 width=235 style='width:176pt'><bean:write name="t07_recordor" property="remark9"/></td>
  <td class=xl31 width=132 style='width:99pt'>�������⣺</td>
  <td class=xl30 width=132 style='width:99pt'><bean:write name="t07_recordor" property="remark10"/></td>
  <td colspan=3 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=26 style='mso-height-source:userset;height:20.1pt'>
  <td colspan=6 height=26 class=xl38 width=1092 style='height:20.1pt;
  width:819pt' x:str="">��</td>
  <td colspan=4 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl33 width=132 style='height:30.0pt;width:99pt'>��Ʋ�������</td>
  <td class=xl34 width=180 style='width:135pt'>�������</td>
  <td class=xl34 width=217 style='width:163pt'>�����Ŀ���Ƽ���Ҫ����</td>
  <td class=xl34 width=196 style='width:147pt'>��Ʒ�����Ҫ����</td>
  <td class=xl34 width=235 style='width:176pt'>�����������</td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 <logic:iterate id="record" name="t07_recordList" type="com.ist.aml.offs_report.dto.T07_record">
 <tr height=40 style='mso-height-source:userset;height:30.0pt'>
  <td height=40 class=xl35 width=132 style='height:30.0pt;width:99pt'><bean:write name="record" property="record_obj"/></td>
  <td class=xl35 width=180 style='width:135pt'><bean:write name="record" property="create_dt_disp"/> - <bean:write name="record" property="create_end_dt_disp"/></td>
  <td class=xl35 width=217 style='width:163pt'><bean:write name="record" property="content"/></td>
  <td class=xl35 width=196 style='width:147pt'><bean:write name="record" property="remark1"/></td>
  <td class=xl36 width=235 style='width:176pt'><bean:write name="record" property="remark3"/></td>
  <td colspan=5 class=xl24 style='mso-ignore:colspan'>��</td>
 </tr>
 </logic:iterate>
</table>

</body>

</html>
