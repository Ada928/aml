<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>����������</title>
		<SCRIPT LANGUAGE="JavaScript" src="<%= request.getContextPath() %>/js/basefunc.js"></script> 
		
<script language="JavaScript" src="<%= request.getContextPath() %>/js/avpfunc.js"></script>
<script language="javascript" src="<%= request.getContextPath() %>/js/awp_base.js"></script>
<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	
     function save(theUrl){ 
        
      if(getLength(document.forms[0].tableename.value)==0){
          alert('��Ӣ�����Ʋ���Ϊ��');
          document.forms[0].tableename.focus(); 
          return false;
      }else{
          var Charstr=document.forms[0].tableename.value;
          if(getLength(Charstr)>25){
	          alert('��Ӣ�����Ʋ��ܴ���25���ַ���');
	          document.forms[0].tableename.focus(); 
	          return false;
	      }
          
          var err=0;
          var msg='';
          for (j = 0; j <= Charstr.length - 1; j++) {
			Tempstr = Charstr.charAt(j);
			if(Tempstr==' '){
			   err=1;
			   msg='��Ӣ�������ܰ����ո�';
			   break;
			}
			 
			
			if(Tempstr=='_'){
			
			}else if (!((Tempstr >= "0" && Tempstr <= "9") || (Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))) {
				 
                    err=1;
				    msg='��Ӣ������ֻ�ܰ�����ĸ�����ֺ�_�»��ߣ�';
				    break; 
		    }
		  }
		  
		  if(err==1){
		     alert(msg);
	         document.forms[0].tableename.focus(); 
	         return false;
		  }
      
      }
      
      
      if(getLength(document.forms[0].tablecname.value)==0){
          alert('���������Ʋ���Ϊ��');
          document.forms[0].tablecname.focus(); 
          return false;
      }else if(getLength(document.forms[0].tablecname.value)>32){
          alert('���������Ʋ��ܴ���16������');
          document.forms[0].tablecname.focus(); 
          return false;
      }
      
      if(getLength(document.forms[0].sql.value)==0){
          alert('�����ֶ���䲻��Ϊ��');
          document.forms[0].sql.focus(); 
          return false;
      }else if(getLength(document.forms[0].sql.value)>4000){
          alert('�����ֶ���䲻�ܴ���4000���ַ�');
          document.forms[0].sql.focus(); 
          return false;
      }
      
      if(getLength(document.forms[0].des.value)>256){
          alert('�������ܴ���128������');
          document.forms[0].des.focus(); 
          return false;
      }
      //setChangeFalse(); 
      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0" >
 <div id="content">
 <html:form method="post" action="/template/addT01_mt_property_tmp.do">
        <html:hidden property="dblinkkey"/>
		<html:hidden property="tplakey"/>
<div class='awp_title'>
	  <table >		
			  <tr>
			    <td  align='left'>��ʱ����� - ���</td>
			    <td align="right">
			         <input type=button value="�� ��" name=Button223  onClick="save('addT01_mt_property_tmpDo.do');">
                      <input type=button value="�� ��" name=Button223  onClick="dosubmit('t01_mt_property_tmp_list.do');">
			    </td>
			  </tr>				
					
	  </table>
	</div>
	<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
    </html:messages>
	 <div class='awp_detail'>
       <table>
         <tr>
           <td><font color="#FF0000">*</font>��Ӣ�����ƣ�</td>
           <td>
             tmp<html:text property="tableename" style="width:30%"></html:text><br>�����25���ַ���Ĭ����tmp��ͷ��������������ֺ�_�»��ߣ�
           </td>
         </tr>
         <tr>
           <td><font color="#FF0000">*</font>���������ƣ�</td>
           <td>
             <html:text property="tablecname"  style="width:30%"></html:text>�����16�����֣�
           </td>
         </tr>
           <tr >
					<td>
						<font color="#FF0000">*</font>�����ֶ���䣺<br>�����4000���ַ���
					</td>
					<td>
						<html:textarea property="sql" style="width:95%" rows="10"></html:textarea>
					</td>
				</tr>
         <tr>
           <td>������<br>�����128�����֣�</td>
           <td>
             <html:textarea property="des" rows="5" style="width:95%"></html:textarea>
           </td>
         </tr>
       </table>
	</div>		
	<table width="100" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="8"></td>
				</tr>
	 </table>
	<!--������ʾ��-->
	<div class='awp_msgtab'>
		<table>
			<tr>
		 		<td>ϵͳ��ʾ��</td>
		 		<td>
		 			<ol>
						<li> �����ֶ����: �ֶ�֮��Ҫ��","���ŷֿ�(�ֶ�����A �ֶ�����,�ֶ�����B �ֶ�����)
						<li> ����: REALNAME   VARCHAR(64),USERNAME VARCHAR(64)
					</ol>
		 		</td>
			</tr>
		</table>		
	</div> 
		</html:form>
		</div>
		<script type="text/javascript"> 
		  document.forms[0].tableename.focus();  
		  
		</script>
	</BODY>
</HTML>
