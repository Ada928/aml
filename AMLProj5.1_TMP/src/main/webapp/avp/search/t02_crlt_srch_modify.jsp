<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ page import="com.ist.common.db.common.I_SqlSingDef" %>
<html>
  <head>
    <meta http-equiv=Content-Type content="text/html; charset=gb2312">
    <meta content="MSHTML 6.00.2600.0" name=GENERATOR>
   	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" type="text/css">
    	
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <script language="JavaScript">
	function save(theUrl){
       	var result = checkform();//У���
		if(result){
        	awpDoSubmit(theUrl);
        }
	}
	
	function savePos(oE){��   
		if(oE.createTextRange){         
			oE.caretPos = document.selection.createRange().duplicate();  
		}
  	}  

  	function copychar(from ,to){   
		var parvalueStr = document.getElementById(from).value;
	    var parlength=getLength(parvalueStr);
	    var parvalue=parvalueStr.substr(0, parlength);
	    var partype=parvalueStr.substr(parlength-1, parlength-1);
	    var text;

		if(partype=="1"){
			text = '<%=I_SqlSingDef.STATIC_SING%>' +parvalue+ '<%=I_SqlSingDef.STATIC_SING%>' ;
        }
        else {
			text = '<%=I_SqlSingDef.DYNC_SING%>' +parvalue+ '<%=I_SqlSingDef.DYNC_SING%>' ;
        }

		var textEl = document.getElementById(to);

        if(textEl.createTextRange && textEl.caretPos){   
              var caretPos = textEl.caretPos;   
              caretPos.text = caretPos.text.charAt(caretPos.text.length - 1) == '' ? text + '' : text;   
        } else {  
              textEl.value = text;   
        }
 	} 
    </script>
  </head>
  <body>
 	<!-- ϵͳ�����ܣ�ռҳ���ȵ�98�� -->
    <div id='content'>
      <html:form method="post" action="/search/t02_crlt_srch_modify.do">
        <html:hidden property="crltsrchkey" />
   	    <html:hidden property="srchengkey" />
   	    <html:hidden property="creator" />
        <html:hidden property="createdate" />
        <!-- �������� -->
	    <div class='awp_title'>
	      <table>
	        <tr>
	        	<td width="23%"><span class="awp_title_td2">�޸��������</span></td>
			  	<td align="right">
	            <input type="button" name="Submit3" value="�� ��" onClick="save('t02_crlt_srch_modify_do.do');">
	            <input type="button" name="Submit1" value="�� ��" onClick="awpDoSubmit('t02_crlt_srch_list.do');">
		          &nbsp;
	          </td>
	        </tr>
	      </table>
		</div>
	    <!-- ������Ϣ��ʾ�� -->
	    <html:messages id="errors" message="true">
          <bean:write name="errors" filter="fasle" />
        </html:messages>
	    <!-- ��ѯ������ -->
	    <!-- ������ -->
 	    <div class='awp_detail'>
  	      <table>
	   	    <tr>
              <td width="10%" nowrap><font color="#FF3300">*</font>����������ƣ�</td>
              <td colspan="3"><html:text property="crltsrchname" minlength="1" maxlength="64" warning="�����������"/>
              	�����32�����֣�
			  </td>
	   	    </tr>
			<tr>
              <td width="10%" nowrap><font color="#FF0000">*</font>����Դ��</td>
        	  <td colspan="3">
              	<html:select property="qryconncd">
					<html:options collection="qryconncdMap" property="label" labelProperty="value" />
				</html:select>
        	  </td>
     		</tr>
	   	    <tr> 
              <td width="10%" nowrap><font color="#FF3300">*</font>ִ��SQL��<br>�����4000���ַ���</td>
              <td width="55%">
       		    <html:textarea property="crltsrchsql" onkeydown="savePos(this)"
				  onkeyup="savePos(this)" onmousedown="savePos(this)"
				  onmouseup="savePos(this)" onfocus="savePos(this)" rows="20"
				  style="width:100%" minlength="1" maxlength="4000" warning="ִ��SQL"/>
              </td>
              <td width="10%" nowrap>������</td>
	          <td width="25%">
			    <html:select property="parmelmtcod" size="20" ondblclick="copychar('parmelmtcod','crltsrchsql')">
				  <html:options collection="parMap" property="label" labelProperty="value" />
			    </html:select>
	          </td> 
           </tr>
       	   <tr>
			<td nowrap="nowrap" align="right">
				<font color="#FF0000">*</font>����������Ӳ�����<br>�����512���ַ���
			</td>
			<td>
				<html:textarea property="linkparm" rows="10" style="width:100%" 
				  minlength="1" maxlength="512" warning="����������Ӳ���"></html:textarea>
			</td>
			<td nowrap="nowrap" align="right">�������<br>�����У�</td>
			<td nowrap="nowrap" align="center">
				<html:select property="parmelmtcod" size="10" ondblclick="cpSelToText(this,'linkparm','')">
					<html:options collection="parMap" property="label" labelProperty="value"/>
				</html:select>
			</td>
		  </tr>
           <tr>
		     <td width="10%" nowrap>��ʾ��ţ�</td>
  			 <td colspan="3"><html:text property="dispseq" styleClass="awp_number" maxlength="3" warning="��ʾ���"/>�����3λ���֣�</td>
		   </tr>
	   	   <tr> 
             <td width="10%" nowrap>����˵����<br>�����2000�����֣�</td>
             <td colspan="3"> 
               <html:textarea style="width:97%" property="crltsrchdes" rows="4" maxlength="256" warning="����˵��"/>     
             </td>
           </tr>
         </table>
       </div>
      	<table border="0" align="center" cellpadding="0" cellspacing="0">
			<tr>
				<td height="8"></td>
			</tr>
		</table>
		<!--ϵͳ��Ϣ��ʾ��-->
     	<div class='awp_msgtab'>
		  	<table>
		   		<tr>
		    		<td>ϵͳ��ʾ��</td>
		    		<td>
		    			<UL>
							<LI>1��ִ��SQL��SELECT�ĵ�һ����ĿΪ�������������ʾ���ƣ���Ϊ����������Ӳ�������ʾ������
							<LI>2������������Ӳ�����������֮����&�ָ����Ⱥ����Ϊ����������Ҳ�Ϊִ��SQL�е�SELECT��Ŀ���磺#��ʾ����#&���������#SELECT��Ŀ#
						</UL>
		    		</td>
		   		</tr>
		  	</table>		
	    </div>
     </html:form>
   </div>
 </body>
</html>