<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<link rel="stylesheet" href="<%= request.getContextPath() %>/css/css_all.css" type="text/css">
		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<title>����������</title>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
<script language="JavaScript">	
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
          if(getLength(Charstr)>22){
	          alert('��Ӣ�����Ʋ��ܴ���22���ַ���');
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
			if(j==0 && !((Tempstr >= "a" && Tempstr <= "z") || (Tempstr >= "A" && Tempstr <= "Z"))){
			    err=1;
			    msg='��Ӣ�����Ʊ�������ĸ��ͷ��';
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
      
      if(getLength(document.forms[0].memo.value)>512){
          alert('�������ܴ���256������');
          document.forms[0].des.focus(); 
          return false;
      }
      //setChangeFalse(); 
      document.forms[0].action=theUrl;
      document.forms[0].submit();
     
    }
	
</SCRIPT>
	</HEAD>
 <BODY leftmargin="0" topmargin="0"   onbeforeunload="leaveChk()"	>
 <div id="main">
 <html:form method="post" action="/entity/t03_entity_kind_man_add.do">
<html:hidden property="tablekey"/>
<html:hidden property="flag"/>
<html:hidden property="tableename_old"/>
	<div class="conditions">
		<div class="cond_t">		
			<span>�������ά�� - �޸ı�����</span>
			<span class="buttons">
				<a href="#" onclick="save('t03_entity_kind_man_modify_do.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_save.png" />�� ��</a>
 	   			<a href="#" onclick="dosubmit('t03_entity_kind_man_list.do')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />��  ��</a>
			</span>
		</div>
	<html:errors/>
	<div class="cond_c2">
       <table>
         <tr>
           <td><font color="#FF0000">*</font>��Ӣ�����ƣ�</td>
           <td>
             <logic:equal value="0" name="t03_entity_kind_manActionForm" property="flag">
                  <html:text property="tableename" style="width:30%"></html:text>
             </logic:equal>
              <logic:equal value="1" name="t03_entity_kind_manActionForm" property="flag">
                  <html:text property="tableename" style="width:30%" readonly="true"></html:text>
             </logic:equal>
             
             <br>�����22���ַ�����������ĸ��ͷ��������������ֺ�_�»���,Ĭ�ϱ�����t69_alert_��ͷ��
           </td>
         </tr>
         <tr>
           <td><font color="#FF0000">*</font>���������ƣ�</td>
           <td>
             <html:text property="tablecname"  style="width:30%"></html:text>�����16�����֣�
           </td>
         </tr>
          <tr>
           <td>������<br>�����256�����֣�</td>
           <td>
            <html:textarea property="memo" rows="10" style="width:95%"></html:textarea>
           </td>
         </tr>
         <tr>
           <td>״̬��</td>
           <td>
             <bean:write name="t03_entity_kind_manActionForm"  property="flag_disp" ></bean:write>
 
           </td>
         </tr>
         <tr>
           <td>�����ˣ� </td>
           <td>
            <bean:write name="t03_entity_kind_manActionForm" property="creator_disp"/>
           </td>
         </tr>
         <tr>
           <td>����ʱ�䣺 </td>
           <td>
            <bean:write name="t03_entity_kind_manActionForm" property="createdate"/>
           </td>
         </tr>
         <tr>
           <td>�޸��ˣ� </td>
           <td>
            <bean:write name="t03_entity_kind_manActionForm" property="modifier_disp"/>
           </td>
         </tr>
         <tr>
           <td>�޸�ʱ�䣺 </td>
           <td>
            <bean:write name="t03_entity_kind_manActionForm" property="modifydate"/>
           </td>
         </tr>
           
       </table>
	</div>				
	</div>
		</html:form>
		</div>
		<script type="text/javascript"> 
		  var f=document.forms[0].flag.value;
		  if(f=='0'){
		      document.forms[0].tableename.focus(); 
		  }else if(f=='1'){
		      document.forms[0].tablecname.focus(); 
		  }
		  
		</script>
	</BODY>
</HTML>
