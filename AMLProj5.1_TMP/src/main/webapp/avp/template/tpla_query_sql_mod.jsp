<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ page import="com.ist.common.db.common.I_SqlSingDef" %>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>ɸѡ����</title>
		<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		
		<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		
		<SCRIPT LANGUAGE="JavaScript">
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
	function save(theUrl){
	    //alert(getLength(document.forms[0].execsql.value));
	    var errMsg="";
	    if(getLength(document.forms[0].execsql.value)==0){
	         errMsg+="ִ��SQL����Ϊ�գ�";
             document.forms[0].execsql.focus();  
             alert(errMsg);
             return false;  
	    }
	    
	   // if(getLength(document.forms[0].execsql.value) > 4000){
	    //     errMsg+="ִ��SQL���ܴ���4000���ַ���";
        //     document.forms[0].execsql.focus();  
        //     alert(errMsg);
        //     return false;  
	    //}
	    
	    
	     if(document.forms[0].execseq.value!=null&&document.forms[0].execseq.value!=''){
		     if(!checkNumber((document.forms[0].execseq.value))||getLength(document.forms[0].execseq.value)>10){
		        errMsg+="ִ��˳��ֻ����������,���Ҳ��ܴ���10λ��";
		        document.forms[0].execseq.focus();  
		        alert(errMsg);
		        return false;
		      }
		 }
		//if(checkSql(document.forms[0].execsql.value)){
		if(confirm("SQL���¿��ܻ�Ӱ��Ӧ�쵽ģ�͵���ת��������ת��������ע���飬��ȷ��Ҫ������")){
			document.forms[0].action=theUrl;
		    document.forms[0].submit();
		}
	    //}else{
	    	//alert("����ʱ��Ĳ�����������*_temporary_table���ָ�ʽ��Ϊ��ʱ������");
	    //}
	}
	
  function   savePos(oE)   
  {   
		if(oE.createTextRange){         
			oE.caretPos   =   document.selection.createRange().duplicate();  
		}
  }  
  
  function   copychar(from ,to)   
  {   
		var parvalueStr = document.getElementsByName(from)[0].value;
	    var parlength=getLength(parvalueStr);
	    var parvalue=parvalueStr.substr(0, parlength-1);
	    var partype=parvalueStr.substr(parlength-1, parlength-1);
	    var text;

		 if(parvalue !=""){
        	if(partype=="1"){
        		if(parvalue.substr(0,1)!="@"){
        			text = '<%=I_SqlSingDef.STATIC_SING%>' +parvalue+ '<%=I_SqlSingDef.STATIC_SING%>' ;
        		}else{
        			text = parvalue;
        		}
	        }
	        else {
				text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
	        }
	
			var textEl = document.getElementsByName(to)[0];
	
	        if(textEl.createTextRange   &&   textEl.caretPos)   
	        {   
	              var   caretPos   =   textEl.caretPos;   
	              caretPos.text   =   caretPos.text.charAt(caretPos.text.length   -   1)   ==   ''   ?   text   +   ''   :   text;   
	        }   
	        else   
	              textEl.value     =   text;   
	        
	        }  
  } 
	
	
</SCRIPT>
	</HEAD>
	<BODY>
	<div id="content">
		<html:form method="post" action="/template/t02_tp_exec_qry_add_do.do">
	     <html:hidden property="tplakey"/>
	     <html:hidden property="execsqlkey"/>
			
		<div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap><span class="awp_title_td2">ģ�͹��� - ����SQL��ѯ</span></td>
						<td align="right">
							<input type=button value="�����ѯSQL" name=Button223 class="input" onClick="save('t02_tp_exec_qry_modify_do.do');">
                     		<input type=button value="�� ��" name=Button52 class="input" onClick="dosubmit('t02_tp_exec_qry_list.do')">				                  </td>
					</tr>
				</table>
			</div>
		
		 <html:errors/>
	     <html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle"/>
		  </html:messages>
	
		
						
    <div class='awp_detail' >
		<table  >
			<tr >
				<td ><font color="#FF0000">*</font>ִ��SQL��<br></td>
				<td width="55%">
				   <html:textarea property="execsql" onkeydown="savePos(this)"
											onkeyup="savePos(this)" onmousedown="savePos(this)"
											onmouseup="savePos(this)" onfocus="savePos(this)" rows="20"
											style="width:100%"></html:textarea>
				</td>
				<td width="54px">������</td>
				<td width="45%">
				    <html:select property="parmcd" size="20"   style="width:100%"
											ondblclick="copychar('parmcd','execsql')">
											<html:options collection="parMap" property="label"
												labelProperty="value" />
										</html:select>
				</td>
			</tr>
		
			<tr >
				<td >�Ƿ�����ѯSQL��</td>
				<td >
				   <input type="hidden" name="ismainqueryold" value="<bean:write name="t02_tp_exec_qryActionForm" property="ismainquery" />"/>
				   <html:radio property="ismainquery" value="1">��</html:radio>
                                     <html:radio property="ismainquery" value="0">��</html:radio>
				</td>
				<td  width="54px"> ִ��˳��</td>
				<td>
				    <html:text property="execseq" styleClass="text_white"
											size="15"></html:text>
				</td>
			</tr>
        </table>
	</div>
		
	<div class="awp_msgtab">
	  <table>
		<tr> 
        <td ><p><strong>ϵͳ��ʾ��</strong><br>
        <UL>
							<LI>1����̬������SQLִ��ʱ���ж�̬�滻������ִ��sqlʱ���滻Ϊ?����������־��#��������#
							<LI>2����̬������ֱ���滻Ϊ�û�����ֵ��������־��@��������:��������@�������������Ͱ���number��char��date���֣���������Ϊ��ѡ�����Ĭ��Ϊnumber
  							<LI>3���� �� ����awp_random��8λ��������磺@awp_random:char@,������8λ����ַ�
  							<LI>4���û�������awp_userid���û���¼�š�awp_username���û���¼���ơ�
  							<LI>5�����ڲ�����awp_curr_date����ǰ���ڡ�awp_curr_month_end����ǰ��ĩ��awp_curr_season_end����ǰ��ĩ��awp_curr_year_end����ǰ��ĩ
							<LI>6��in����ʹ�þ�̬����,����ʹ�ö�̬����
						</UL>
        </td>
        </tr>
      </table>
    </div>
	
	
		</html:form>
		</div>
		
		<script type="text/javascript">
		    document.forms[0].execsql.focus();
		</script>
	</BODY>
</HTML>
