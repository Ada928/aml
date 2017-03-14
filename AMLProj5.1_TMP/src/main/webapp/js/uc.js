
//////////////////////////////
// UncCalendar 1.0          //
// Author: Zhong@UNC        //
// E-mail: zhong@uncnet.com //
// 06/01/2004               //
//////////////////////////////



function UncCalendar (sName, sDate)
{
  /////////////////////////////////////////////////////////////////////////
  //����UncCalendar��������Բ���Ĭ��ֵ��
  //inputValue���Ե�ֵΪ"today"ʱ��ʾ���ͻ�������ǰ���ڡ�
  //ֱ���������Ĭ��ֵ�޸ĳ�����Ҫ�ģ�ʹ��ʱ���ʲôҲ���������ˡ�
  this.inputName = sName || "uncDate";
  this.inputValue = sDate || "";
  this.inputSize = 10;
  this.inputClass = "";
  this.color = "#333333";
  this.bgColor = "#EEEEEE";
  this.buttonWidth = 60;
  this.buttonWords = "ѡ������";
  this.canEdits = true;
  this.hidesSelects = true;
  /////////////////////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////////////////////
  //����display������
  this.display = function ()
  {
    var reDate = /^(19[7-9]\d|20[0-5]\d)\-(0?\d|1[0-2])\-([0-2]?\d|3[01])$/;
    if (reDate.test(this.inputValue))
    {
      var dates = this.inputValue.split("-");
      var year = parseInt(dates[0], 10);
      var month = parseInt(dates[1], 10);
      var mday = parseInt(dates[2], 10);

    }
    else
    {
      var today = new Date();
      var year = today.getFullYear();
      var month = today.getMonth()+1;
      var mday = today.getDate();
    }
    if (this.inputValue == "today"){

       var temp_month=month+'';
       var temp_mday=mday+'';

       if(temp_month.length==1){temp_month='0'+temp_month;}
       if(temp_mday.length==1){temp_mday='0'+temp_mday;}

      this.inputValue = year + "-" + temp_month + "-" + temp_mday;
    }
    else{
      this.inputValue = this.inputValue;
    }
    var lastDay = new Date(year, month, 0);
    lastDay = lastDay.getDate();
    var firstDay = new Date(year, month-1, 1);
    firstDay = firstDay.getDay();

    var btnBorder =
      "border-left:1px solid " + this.color + ";" +
      "border-right:1px solid " + this.color + ";" +
      "border-top:1px solid " + this.color + ";" +
      "border-bottom:1px solid " + this.color + ";";
    var btnStyle =
      "padding-top:3px;cursor:default;width:" + this.buttonWidth + "px;text-align:center;height:18px;top:-9px;" +
      "font:normal 12px ����;position:absolute;z-index:99;background-color:" + this.bgColor + ";" +
      "line-height:12px;" + btnBorder + "color:" + this.color + ";";
    var boardStyle =
      "position:absolute;width:1px;height:1px;background:" + this.bgColor + ";top:8px;border:1px solid "+
      this.color + ";display:none;padding:3px;";
    var buttonEvent =
      " onmouseover=\"this.childNodes[0].style.borderBottom='0px';" +
          "this.childNodes[1].style.display='';this.style.zIndex=100;" +
          (this.hidesSelects ?
          "var slts=document.getElementsByTagName('SELECT');" +
          "for(var i=0;i<slts.length;i++)slts[i].style.visibility='hidden';"
          : "") + "\"" +
      " onmouseout=\"this.childNodes[0].style.borderBottom='1px solid " + this.color + "';" +
          "this.childNodes[1].style.display='none';this.style.zIndex=99;" +
          (this.hidesSelects ?
          "var slts=document.getElementsByTagName('SELECT');" +
          "for(var i=0;i<slts.length;i++)slts[i].style.visibility='';"
          : "") + "\"" +
      " onselectstart=\"return false;\"";
    var mdayStyle = "font:normal 9px Verdana,Arial,����;line-height:12px;cursor:default;color:" + this.color;
    var weekStyle = "font:normal 12px ����;line-height:15px;cursor:default;color:" + this.color;
    var arrowStyle = "font:bold 7px Verdana,����;cursor:hand;line-height:16px;color:" + this.color;
    var ymStyle = "font:bold 12px ����;line-height:16px;cursor:default;color:" + this.color;
    var changeMdays =
      "var year=parseInt(this.parentNode.cells[2].childNodes[0].innerText);" +
      "var month=parseInt(this.parentNode.cells[2].childNodes[2].innerText);" +
      "var firstDay=new Date(year,month-1,1);firstDay=firstDay.getDay();" +
      "var lastDay=new Date(year,month,0);lastDay=lastDay.getDate();" +
      "var tab=this.parentNode.parentNode, day=1;" +
      "for(var row=2;row<8;row++)" +
      "  for(var col=0;col<7;col++){" +
      "    if(row==2&&col<firstDay){" +
      "      tab.rows[row].cells[col].innerHTML='&nbsp;';" +
      "      tab.rows[row].cells[col].isDay=0;}" +
      "    else if(day<=lastDay){" +
      "      tab.rows[row].cells[col].innerHTML=day;" +
      "      tab.rows[row].cells[col].isDay=1;day++;}" +
      "    else{" +
      "      tab.rows[row].cells[col].innerHTML='';" +
      "      tab.rows[row].cells[col].isDay=0;}" +
      "  }";
    var pyEvent =
      " onclick=\"var y=this.parentNode.cells[2].childNodes[0];y.innerText=parseInt(y.innerText)-1;" +
                  changeMdays + "\"";
    var pmEvent =
      " onclick=\"var y=this.parentNode.cells[2].childNodes[0];m=this.parentNode.cells[2].childNodes[2];" +
                 "m.innerText=parseInt(m.innerText)-1;if(m.innerText=='0'){m.innerText=12;y.innerText=" +
                 "parseInt(y.innerText)-1;}" + changeMdays + "\"";
    var nmEvent =
      " onclick=\"var y=this.parentNode.cells[2].childNodes[0];m=this.parentNode.cells[2].childNodes[2];" +
                 "m.innerText=parseInt(m.innerText)+1;if(m.innerText=='13'){m.innerText=1;y.innerText=" +
                 "parseInt(y.innerText)+1;}" + changeMdays + "\"";
    var nyEvent =
      " onclick=\"var y=this.parentNode.cells[2].childNodes[0];y.innerText=parseInt(y.innerText)+1;" +
                  changeMdays + "\"";
    var mdayEvent =
      " onmouseover=\"if(event.srcElement.tagName=='TD'&&event.srcElement.isDay){" +
          "event.srcElement.style.backgroundColor='" + this.color + "';" +
          "event.srcElement.style.color='" + this.bgColor + "';" +
          "event.srcElement.style.cursor='hand';" +
          "var ym=event.srcElement.parentNode.parentNode.rows[0].cells[2].childNodes;" +
          "event.srcElement.title=ym[0].innerText+'-'+ym[2].innerText+'-'+event.srcElement.innerText;}\"" +
      " onmouseout=\"if(event.srcElement.tagName=='TD'&&event.srcElement.isDay){" +
          "event.srcElement.style.backgroundColor='" + this.bgColor + "';" +
          "event.srcElement.style.color='" + this.color + "';" +
          "event.srcElement.style.cursor='default';" +
          "var ym=event.srcElement.parentNode.parentNode.rows[0].cells[2].childNodes;" +
          "event.srcElement.title=ym[0].innerText+'-'+ym[2].innerText+'-'+event.srcElement.innerText;}\"" +
      " onclick=\"if(event.srcElement.tagName=='TD'&&event.srcElement.isDay){" +
          "var inp=this.parentNode.parentNode.parentNode.previousSibling.childNodes[0];" +
          "var temp_year=this.rows[0].cells[2].childNodes[0].innerText;"+
          "var temp_month=this.rows[0].cells[2].childNodes[2].innerText;"+
          "var temp_day=event.srcElement.innerText;"+
          "if(temp_month.length==1){temp_month='0'+temp_month;}"+
          "if(temp_day.length==1){temp_day='0'+temp_day;}"+
          "inp.value=temp_year+'-'+temp_month+'-'+temp_day;" +
          "this.parentNode.style.display='none';this.parentNode.parentNode.style.zIndex=99;" +
          "this.parentNode.previousSibling.style.borderBottom='1px solid " + this.color + "';" +
          (this.hidesSelects ?
          "var slts=document.getElementsByTagName('SELECT');" +
          "for(var i=0;i<slts.length;i++)slts[i].style.visibility='';"
          : "") + "}\"";

    var output = "";
    output += "<table cellpadding=0 cellspacing=1 style='display:inline;'><tr>";
    output += "  <td><input size=" + this.inputSize + " maxlength=10 value=\"" + this.inputValue + "\"";
    output +=    (this.canEdits ? "" : " readonly") + " name=\"" + this.inputName + "\"></td>";
    output += "  <td width=" + this.buttonWidth + ">";
    output += "    <div style=\"position:absolute;overflow:visible;width:0px;height:0px;\"" + buttonEvent + ">";
    output += "      <div style=\"" + btnStyle + "\"><nobr>" + this.buttonWords + "</nobr></div>";
    output += "      <div style=\"" + boardStyle + "\">";
    output += "        <table cellspacing=1 cellpadding=1 width=175" + mdayEvent + ">";
    output += "          <tr height=20 align=center>";
    output += "            <td style=\"" + arrowStyle + "\" title=\"��һ��\"" + pyEvent + ">&lt;&lt;</td>";
    output += "            <td style=\"" + arrowStyle + "\" align=left title=\"�ϸ���\"" + pmEvent + ">&lt;</td>";
    output += "            <td colspan=3 style=\"" + ymStyle + "\" valign=bottom>";
    output += "              <span>" + year + "</span><span>��</span><span>" + month + "</span><span>��</span>";
    output += "            </td>";
    output += "            <td style=\"" + arrowStyle + "\" align=right title=\"�¸���\"" + nmEvent + ">&gt;</td>";
    output += "            <td style=\"" + arrowStyle + "\" title=\"��һ��\"" + nyEvent + ">&gt;&gt;</td>";
    output += "          </tr>";
    output += "          <tr height=20 align=center bgcolor=" + this.bgColor + ">";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">һ</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "            <td width=14% style=\"" + weekStyle + "\">��</td>";
    output += "          </tr>";
    var day = 1;
    for (var row=0; row<6; row++)
    {
      output += "<tr align=center>";
      for (var col=0; col<7; col++)
      {
        if (row == 0 && col < firstDay)
          output += "<td style=\"" + mdayStyle + "\">&nbsp;</td>";
        else if (day <= lastDay)
        {
          output += "<td style=\"" + mdayStyle + "\" isDay=1>" + day + "</td>";
          day++;
        }
        else
          output += "<td style=\"" + mdayStyle + "\"></td>";
      }
      output += "</tr>";
    }
    output += "        </table>";
    output += "      </div>";
    output += "    </div>";
    output += "  </td>";
    output += "</tr></table>";
    document.write(output);
  }
  /////////////////////////////////////////////////////////////////////////
}

/**
<script src=uc.js></script>
<script language=javascript>
//�ù����Ϳ����ã��ܼ򵥡�
//ʵ����ʱ��һ��������input��name���ڶ���������value����Ϊ"today"���ǵ��졣
  var date1 = new UncCalendar ("date", "2008-08-08");
  date1.display();
</script>
<br>gjjgjg<br>
<script language=javascript>
//��һЩ���ԣ��������Ķ��ơ�
//��ʵ��ֱ�ӵ�uc.js���޸�Ĭ������ֵʹ�������������һЩ��������ע�͡�
  var date2 = new UncCalendar ();
  date2.inputName = "date"; //input��name��
  date2.inputValue = "today";  //��ῴ����input�н���ʾ�ͻ���ϵͳ��ǰʱ�䡣
  date2.inputSize = 10;  //input��size
  date2.inputClass = "";  //input��class������������Լ�����input����ʽ��
  date2.color = "#000080";  //ѡ��ť�����ı߿��Լ��������ֵ���ɫ��
  date2.bgColor = "#EEEEFF";  //ѡ��ť�����ı���ɫ��
  date2.buttonWidth = 60;  //��ť����
  date2.buttonWords = "ѡ������";  //��ť��ʾ�����֡�
  date2.canEdits = false;  //input�Ƿ��������
  date2.hidesSelects = true;  //��������ѡ�����ʱ�Ƿ�����ҳ���е�select�ؼ���
  date2.display();
</script>
<br>gjjgjg<br>
<script language=javascript>
//�ù����Ϳ����ã��ܼ򵥡�
//ʵ����ʱ��һ��������input��name���ڶ���������value����Ϊ"today"���ǵ��졣
  var date1 = new UncCalendar ("date", "today");
  date1.display();
</script>
*/