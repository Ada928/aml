<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="java.util.*" %>
<%@ page import="com.ist.util.*" %>
<%
    //��ǰ��ʾʱ�䣬Ĭ��Ϊ��ǰʱ��
    DateUtils dateUtils = new DateUtils();
    String s_date = (String)request.getParameter("daykey_disp");
    String curr_year = dateUtils.getYear( dateUtils.getCurrDateTime() );
    String curr_month = dateUtils.getMonth( dateUtils.getCurrDateTime() );
    String curr_day = dateUtils.getDay( dateUtils.getCurrDateTime() );
    String curr_date = curr_year+"-"+curr_month;
    String s_year = curr_year;
    String s_month = curr_month;
    if(s_date!=null && s_date.length()==7){
        s_year = s_date.substring(0,4);
        s_month = s_date.substring(5,7);
    }
    //
    ArrayList holidayList = (ArrayList)request.getAttribute("sub_List");
    HashMap holidayHash = (HashMap)holidayList.get(0);
    HashMap isfirstHash = (HashMap)holidayList.get(1);
    HashMap workdayHash = (HashMap)holidayList.get(2);
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript" src="js/iepngfix.js"></script>
<![endif]--> 
<script language="JavaScript">
function dosubmit(theUrl){  
        document.forms[0].action=theUrl;
        document.forms[0].submit();
}
</script>
</head>
<body  class="mainbg">
<div id="main">
<html:form action="/workdate/t07_workdate_list.do" method="post">
  <div class="conditions">
<input type="hidden" name="daytype" value="<%=(String)request.getAttribute("daytype") %>"/>

   <div class="cond_t">
	  <span>�����趨 - �ڼ�������</span>
	  <span class="buttons"> 
	  <a href="#" id="hdd_display" class="bt_hidden"></a></span>
	</div>
 
     
  	<div class="cond_c2" id="searchtable">
  <table   border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      
<td>��ѯʱ�䣺 <select name="daykey_disp">
<%
ArrayList list = (ArrayList)request.getAttribute("t07_workdateList");
Iterator dateIter = list.iterator();
while(dateIter.hasNext()){
    String dateStr = (String)dateIter.next();
    String se = "";
    if(dateStr.equals(s_year+"-"+s_month)) se = " selected ";
    out.println("<option value='"+dateStr+"' "+se+">"+dateStr+"</option>");
}
%>
              </select>
              </td>
              <td colspan="4" align="center" class="in_button">
		 <input type="button" value="�� ѯ" name=Button22322  onclick="dosubmit('t07_workdate_list.do')"/>	</td>
            
            
  </table>
   </div>
   </div>
    <div class="list">
  <table align=center border=0 cellPadding=0 cellSpacing=0  >
    
            <tr >
              <th>����һ</th>
              <th> ���ڶ� </th>
              <th> ������ </th>
              <th> ������ </th>
              <th> ������ </th>
              <th> ������ </th>
              <th> ������ </th>
            </tr>
<%
//out.println(hash);
String[][] mycal= (String[][])request.getAttribute("mycal");
int rowNum = mycal.length;
    for(int i=1;i<rowNum;i++){
        out.println("<tr align=\"center\" bgcolor=\"E7EDFE\" class=\"css034\">");
        for(int j=0;j<7;j++){
            String outStr = "";
            String bgcolor = "";
            String first = "";
            //Ӧ��Ϊfalse ,������Ըľ�����Ϊtrue
            boolean canchange = false;
            String workday = "";
            if(!mycal[i][j].equals("")){
                outStr = mycal[i][j];
                String dateStr = s_year+"-"+s_month+"-";
                if(outStr.length()==1) dateStr +="0";
                dateStr += outStr;
                workday = (String)workdayHash.get(dateStr);
                if(holidayHash.containsKey(dateStr)){
                    bgcolor = "red";
                }
                if(isfirstHash.containsKey(dateStr)){
                    first = "1";
                }
                Date d1 = dateUtils.stringToDateShort(dateStr);
                Date d2 = dateUtils.stringToDateShort(curr_year+"-"+curr_month+"-"+curr_day);
//                System.out.println("d1="+d1);
//                System.out.println("d2="+d2);
                if(dateUtils.diffTwoDateDay(d1,d2)>=-1){
                    canchange = true;
                }
            }
            //
          //  String titleStr = "�����գ�";

            //
            if(bgcolor.trim().equals("")){//�ǽڼ���
                if(first.equals("")){//��ͨ����
                    if(canchange)
                        out.println("<td height='30'><a href='#'  onClick=\"dosubmit('t07_workdate_modify_do.do?day="+outStr+"&isholiday=1','change')\">"+outStr+"</a></td>");
                    else
                        out.println("<td height='30'>"+outStr+"</td>");
                }else{//�ں��һ��
                    if(canchange)
                        out.println("<td height='30'><a href='#'  onClick=\"dosubmit('t07_workdate_modify_do.do?day="+outStr+"&isholiday=1','change')\"><b>"+outStr+"</b></a></td>");
                    else
                        out.println("<td height='30'><b>"+outStr+"</b></td>");
                }
            }else{//�ڼ���
                if(canchange)
                out.println("<td height='30'><b><a href='#'onClick=\"dosubmit('t07_workdate_modify_do.do?day="+outStr+"&isholiday=0','change')\"><font color=\""+bgcolor+"\">"+outStr+"</font></a></b></td>");
                else
                    out.println("<td height='30'><b><font color=\""+bgcolor+"\">"+outStr+"</font></b></td>");
            }
        }
        out.println("</tr>");
    }
%>
        
  </table>
</div>
   
  <div class="sys_warning">
    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
	<p>
	1����ɫ����Ϊ�ڼ��գ���ɫ����Ϊ�ǽڼ��ա� <br/>
	2������ڼ�������Ϊ�ǽڼ��գ�����ǽڼ�������Ϊ�ڼ��ա�<br/>
	3��ֻ���ڶ��޸���ǰһ���֮������ڵĽ������á�
	</p>
  </div>
</html:form>
</div>
</body>
</html>


