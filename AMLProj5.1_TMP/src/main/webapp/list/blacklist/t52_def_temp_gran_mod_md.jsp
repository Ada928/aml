<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="save" content="history" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script src="../../js/title.js"></script>
<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">
function CheckNumber(form) { 
	if (!form.value.match(new RegExp("^[0-9]+$"))){ 
	alert("������������"); 
	form.focus(); 
	
	}
} 


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function checkForm(theUrl){
    var errMsg = "";
    
   
    
    if(errMsg==""){
    	document.forms[0].totalSize.value = TBSQL.rows.length-1;
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function addRow() {
				oTR    = TBSQL.insertRow(TBSQL.rows.length);
				tmpNum = oTR.rowIndex;
				
				oTD   = oTR.insertCell(0);
				oTD.innerHTML =
				     " <tr>"
				   + " <td align='left' valign='top'>"
				   + " <input name ='exeseq" + tmpNum + "' size='2' value='" + tmpNum + "' readonly>"
				   + " </td>";

				oTD1   = oTR.insertCell(1);
				oTD1.innerHTML=
				     " <td align='left' valign='top'>"
				   + " <a id = 'textRow" + tmpNum + "'></a> <br>"
				   + " <textarea name ='selsql" + tmpNum + "' rows='4' cols='80' onClick=\"addTextEvent('"+tmpNum+"')\"></textarea>"
				   + " </td>"
				   + " </tr>";
				textRowName = "textRow" + tmpNum;

				document.forms[0].totalSize.value = TBSQL.rows.length;

			}

function delRow() {
	if (!confirm('�����Ҫɾ��ҳ�����·�һ��SQL��')) {
		 return false;
	} 
	var vIndex = TBSQL.rows.length - 1;
	if (vIndex == 0){
		alert("û�п�ɾ����SQL��")
		return false;
	}
	TBSQL.deleteRow(vIndex);
	document.forms[0].totalSize.value = TBSQL.rows.length;
}

function addTextEvent(sqlnum){
			
		    	var obj=event.srcElement;
				var mn_expreObj=document.getElementById("selsql"+sqlnum);
				document.forms[0].currsqlnum.value=sqlnum;
				
				// ����¼�
				if(mn_expreObj==obj){
				  setPos(); 
				}
				
				
}
function setPos(){
			  
				var f=document.forms[0];
				sqlnum=document.forms[0].currsqlnum.value;
				f.pos.value=getPos();
}
function getPos(){ 
			   sqlnum=document.forms[0].currsqlnum.value;
				var txb = eval("document.forms[0].selsql"+sqlnum); //��ö��� (���ʽ)
			    var pos = 0;
			   
			    txb.focus();//������ý���
			    var s = txb.scrollTop;
			  
			    var r = document.selection.createRange();
			    var t = txb.createTextRange();//����������ı����� 
			
			    t.collapse(true);
			    t.select();//��ʾ��꣬������Ƶ�ͷ
			    var j = document.selection.createRange();
			    r.setEndPoint("StartToStart",j);
			    var str = r.text;
			
			    var re = new RegExp("[\\n]","g");//���˵����з�,����õ���������ô��ʵ�ʳ���Ҫ��. 
			    str = str.replace(re,"");//���� 
			    pos = str.length; 
			    r.collapse(false); 
			    r.select();
			    txb.scrollTop = s;
			
				return pos;
}

</SCRIPT>
</HEAD>
<body class="mainbg">
<html:form method="post" action="/blacklist/t52_def_temp_gran_mod.do">
<input type="hidden" name="totalSize" value="0" />
<input type="hidden" name="currsqlnum" value="0" />
<input type="hidden" name="pos" value="0" />
<html:hidden property="templatekey" />
<div id="main">
   <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>�޸�SQLִ������</span>
        <span class="buttons">
 	   		<a href="#" onclick="dosubmit('t52_def_temp_gran.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a>
		</span>
	</div>
  <html:errors/>
  <%
		if ((String) request.getAttribute("err") != null)
			{
	%>
	<TABLE width="98%" border=0 align="center" cellpadding="2"
		cellspacing="1">
		<font color="#FF0000" size="2"> <bean:write name="err" />
		</font>
	</table>
	<%
		}
	%>
	<div class="cond_c2">
  		<table border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td align="left">
					<div align="right">
						<font color="red">*</font>SQL���룺
					</div>
				</td>
				<td>
					<html:text property="sqlkey" styleClass="text_white" size="20" readonly="true" />
					<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������� ��"></html:img>
				</td>
			</tr>
		


			<tr>
			<table id="TBSQL" cellspacing="0" cellpadding="0">
				 <tr>
				 	<td align="left" width="15%">����˳��</td>
                    <td align="left" width="35%">��������(ִ��sql)
                    	<%-- <a href="#" onclick="addRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />���SQL</a>
						<a href="#" onclick="delRow()"><img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" />ɾ��SQL</a> --%>
                    </td>
                    <td></td><td></td>
                 </tr>
                 <% int i=0; %>
                 <logic:iterate id="list" name="sqlList" type="com.ist.aml.blacklist.dto.T52_def_temp" >
                 <tr>
                    <td align="left">
                                      <% 
                                       i=i+1;
                                      String j=String.valueOf(i);
                                      String exesql1="exeseq"+j; 
                                      String selsql1="selsql"+j; 
                                      String gs_sql_num=list.getCalsql();
                                      if(gs_sql_num==null || gs_sql_num.equals("")){
                                      gs_sql_num="1";
                                      }
                                    %>
                           <input name ="<%=exesql1%>" size="2" value="<%=gs_sql_num%>" readonly="true">
                     </td>
                     <td  colspan="3">
                          <textarea name ="<%=selsql1%>" rows='4' cols='80' styleClass="text_white"><bean:write name="list" property="sql_str"/></textarea>
                      </td>
                   </tr>
                   </logic:iterate>
                                
			</table>
			</tr>
			
			<tr>
				<td></td>
				<td align="right" colspan="3">
					<input type="button" name="button1" class="in_button1" value="�� ��" onclick="checkForm('t52_def_temp_gran_mod_do.do')" />
					<input type="reset" name="button1" class="in_button1" value="�� ��" />
				</td>
			</tr>
		</table>
    </div>
    
    <div class="sys_warning"><strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />ϵͳ��ʾ��</strong>
     <p>&nbsp;&nbsp;&nbsp;&nbsp;             			  <b>��ѯ���ת��  ID, ENNAMECONTENT, CNNAMEINDEX, FILEDATE, SOURCE_ID, REC_TYPE����һ������ </b> </p>
     <p>&nbsp;&nbsp;&nbsp;&nbsp; 						  ���磺SELECT   T.HOST_CUST_ID  <b style="color: #ff0000"> AS ID</b>, T.PARTY_CHN_NAME <b style="color: #ff0000">AS NAME</b>, T.CARD_NO <b style="color: #ff0000">AS CARD_NO</b>, T.COUNTRY_CD <b style="color: #ff0000">AS COUNTRY_CD</b> FROM T47_PARTY T</p> 
     <p>&nbsp;&nbsp;&nbsp;&nbsp; ʱ��������Կ������£�</p> 
     <p>&nbsp;&nbsp;&nbsp;&nbsp; 1.@DATE('')@            ��ǰ��������</p>
	 <p>&nbsp;&nbsp;&nbsp;&nbsp; 3.@DATEADD('','1')@     ������������Ϊ��ǰ�������������һ�죬��Ϊ����Ϊ��ǰ�������������һ��</p>
	 </div>
  </div>
</div>   
</html:form>
</BODY>
</HTML>
