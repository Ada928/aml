<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="java.util.*" %>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>��Ӽ�����</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
        <link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript"
			src="<%=request.getContextPath()%>/js/basefunc.js"></script>

		<SCRIPT LANGUAGE="JavaScript">
		function dosubmit(theUrl){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		
		}
		var n=0;//������
		function addRow()
		{    //�����
		    n++;//������++��������Ψһ�ı�ʶ
		    var tempNode = document.createElement("div");//����div�ڵ�
		    tempNode.style.color = "#FF0066";
		    tempNode.style.marginTop="3 px";
		    tempNode.innerHTML = "<b><span id='a"+n+"' >&nbsp;" +<%=request.getAttribute("pre_sb")%>+n+<%=request.getAttribute("sec_sb")%><%=request.getAttribute("third_sb")%>+n+<%=request.getAttribute("four_sb")%>+n+<%=request.getAttribute("fifth_sb")%>+n+<%=request.getAttribute("end_sb")%>+"&nbsp;<input type='button'  value='ɾ��' onclick=delRow('a"+n+"')></span></b>";
		    divForm.appendChild(tempNode);//��ӵ�divForm���ӽڵ����ȥ
		    //setdynamicListStyle();
		}
		function addModRow()
		{  
		 
		   <%ArrayList list=(ArrayList)request.getAttribute("condList");
		    for(int i=1;i<=list.size();i++){
		    %>
		    n++;
		    var tempNode = document.createElement("div");//����div�ڵ�
		    tempNode.style.color = "#0072BC";
		    tempNode.style.marginTop="3 px";
		    tempNode.innerHTML = "<span id='a"+n+"'><b>&nbsp;" +<%=request.getAttribute("pre_sb"+i)%>+n+<%=request.getAttribute("sec_sb"+i)%><%=request.getAttribute("third_sb"+i)%>+n+<%=request.getAttribute("four_sb"+i)%>+n+<%=request.getAttribute("fifth_sb"+i)%>+n+<%=request.getAttribute("end_sb"+i)%>+"&nbsp;<input type='button'  value='ɾ��' onclick=delRow('a"+n+"')></b></span>";
		    divForm.appendChild(tempNode);//��ӵ�divForm���ӽڵ����ȥ
		    <%}%>
		}
		function delRow(id)
		{    //ɾ����
		   document.getElementById(id).removeNode(true);
		}
		function coundByte()
		{ 
			var all = document.getElementsByTagName("*");
			var length = all.length;
			var temp_id = "";
			var id = "";
			var valargs = "";
			var jump_value = "";//����ת��
			var op_value = "";//������
			var compar_value = "";//�ȽϷ�
			var byjump_value = "";//��ת��
			var compvalue_value = "";//ֵ
			for(var i = 0; i < length; i++)
			{
		     temp_id = all[i].getAttribute("id");
		     if(temp_id){
			     if(if_id(temp_id,"jump") != ""){
				   jump_value = jump_value+document.getElementById(temp_id).value+",";
				 }else if(if_id(temp_id,"op") != ""){
				   op_value = op_value+document.getElementById(temp_id).value+",";
				 }else if(if_id(temp_id,"compare") != ""){
				   compar_value = compar_value+document.getElementById(temp_id).value+",";
				 }else if(if_id(temp_id,"byjump") != ""){
				   byjump_value = byjump_value+document.getElementById(temp_id).value+",";
				 }else if(if_id(temp_id,"compvalue") != ""){
				   compvalue_value = compvalue_value+document.getElementById(temp_id).value+",";
				 }
			 }
			}
			 document.getElementById("ju_value").value = jump_value;
			 document.getElementById("o_value").value = op_value;
			 document.getElementById("comp_value").value = compar_value;
			 document.getElementById("byju_value").value = byjump_value;
			 document.getElementById("compval").value = compvalue_value;
		}
		function if_id(str,ifstr){
		    var strlength = str.length;
			var ifstrlength = ifstr.length;
			var tmp_str = "";
			if(strlength>0 && strlength>ifstrlength){
			  tmp_str = str.substr(0,ifstrlength);
			  if(tmp_str == ifstr){
			    return str;
			  }
			}
		    return "";
		}
	     function show(id){
	     var num = id.substr(7);
	     var value_id = "compvalue"+num;
	     var byjump_id = "byjump"+num;
	     if(document.getElementById(id).value == "2"){
	      document.getElementById(value_id).style.display="inline"; 
	      document.getElementById(byjump_id).style.display="none"; 
	     }else if(document.getElementById(id).value == "1"){
	      document.getElementById(value_id).style.display="none"; 
	      document.getElementById(byjump_id).style.display="inline"; 
	     }
	    }
	    
</SCRIPT>
	</HEAD>
	<BODY>
	   <div id="content">
	<html:form method="post" action="/template/tpla_publish_list.do">
	<input type="hidden" name="newsearchflag" value="1"/>
	 <div class='awp_title'>
				<table>
					<tr>
						<td width="23%" nowrap><span class="awp_title_td2">ģ�͹��� - ������ת����ҳ��</span></td>
						<td align="right">
							<input class="input" type="button" onclick="coundByte();dosubmit('t02_parm_sub_add_do.do');" value="�� ��">&nbsp;&nbsp;
                             <input class="input" type="button" onclick="dosubmit('t02_jump_tp_list.do');" value="�� ��">
                         </td>
					</tr>
				</table>
			</div>    
	 

	   <div class='awp_dynamic_list'>
			<table>

		   <TR align=center bgcolor="A3C0EE">
		       <TD height=22 align="center" noWrap>������ת����</TD>
				<TD height=22 align="right" noWrap>
				<input type="button" onclick="addRow()" value="�� ��">
				</TD>
			</TR>
		</TABLE>
		</div>
<div id="divForm" align="left" style='table-layer:fixed; overflow:visible'>
</div>
		<input type="hidden" id="ju_value" name="ju_value">
		<input type="hidden" id="o_value" name="o_value">
		<input type="hidden" id="comp_value" name="comp_value">
		<input type="hidden" id="byju_value" name="byju_value">
		<input type="hidden" id="compval" name="compval">
		<input type="hidden" name="tplakey" value=<%=request.getParameter("tplakey") %>>
		<input type="hidden" name="jumpkey" value=<%=request.getParameter("jumpkey") %>>
		<input type="hidden" name="busstypecd" value="<%=request.getAttribute("busstypecd") %>"/>
	</html:form>	
	 </div>
	 <script type="text/javascript">
	    addModRow();
	 </script>
	</BODY>
</HTML>
