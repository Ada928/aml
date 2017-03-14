<%@ page contentType="text/html; charset=GBK" import="com.ist.common.metadata.dto.T01_mt_property"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gbk">
		<%@ include file="../../../bmp/platform/common/style_include.jsp" %>
		<script language="javascript" src="<%=request.getContextPath()%>/js/avpfunc.js"></script>
		<script src="<%=request.getContextPath()%>/js/title.js"></script>
        <script language="JavaScript" src="<%=request.getContextPath() %>/js/basefunc.js"></script>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
        <script language="javascript" src="<%=request.getContextPath() %>/js/awp_base.js"></script>
        
        
        
		<script type="text/javascript">
		   function dosubmit(theUrl,type){
             var errMsg = "";
            
             if( errMsg==''){
                document.forms[0].action=theUrl;
                document.forms[0].submit();
             }else{
                if(errMsg!='') alert(errMsg);
                return false;
             }
           }
           
           
           function modify(theUrl){
               var errMsg;
		       errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		      
		      if(errMsg==''){
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		      }else{ 
		        alert(errMsg);
		        return false;
		      } 
           }
           
           
           function getUrl(url,parm){
             var theUrl = url+"?newsearchflag=1&"+parm;
             document.forms[0].action=theUrl;
             document.forms[0].submit();
           }
           
           
           function del(theUrl){
		       var errMsg; 
		       errMsg = CheckBoxMustChecked(document.forms[0]);
		        if(errMsg==''){
		            if(confirm('�����Ҫɾ��ѡ�е�������,�����أ�')){
		                document.forms[0].action=theUrl;
		        		document.forms[0].submit();
		            }
		        }
		      
		      if(errMsg!=''){ 
		        alert(errMsg);
		        return false;
		      } 
		   }
		   
		   function mapping(theUrl){
               var errMsg;
		       errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		      
		      if(errMsg==''){
		        var selectcheckbox = getOnlyOneSelectValue ("selectcheckbox");
		        var iscopy=$F("iscopy_"+selectcheckbox);
		        if(iscopy !='1'){
		           alert("ѡ�еĽ�����岻��Ҫ��ӳ�䣬���Ҫ��ӳ�䣬����������� [�Ƿ���] ���״̬Ϊ[��]���С�");
		           return false;
		        }
		         document.forms[0].action=theUrl;
		         document.forms[0].submit(); 
		      }else{ 
		        alert(errMsg);
		        return false;
		      } 
           }
           
           function getOnlyOneSelectValue(selectName){
                        var elements = document.getElementsByName(selectName);
                        for(var i=0;i<elements.length;i++){
                                if(elements[i].checked==true){
                                        return elements[i].value;
                                }
                        }
           }
		</script>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	  <div id='content'>
		<html:form method="post" action="/template/t01_mt_property_tmp_list.do">
		<html:hidden property="dblinkkey"/>
		<html:hidden property="tplakey"/>
		  <div class='awp_title'>
            <table >                
              <tr>
                <td align='left' nowrap >��ʱ�����</td>
                <td align="right">
				  <input type=button value="�� ��" name=Button22 class="input" onClick="dosubmit('addT01_mt_property_tmp.do','add');"> 
				  <input type=button value="ɾ ��" name=Button22 class="input" onClick="del('deleteT01_mt_property_tmpDo.do');">
				  <input type=button value="�� ��" name=Button22 class="input" onClick="window.close();">
				</td>
               </tr>                                
            </table>
          </div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
    </html:messages>
		  <div class='awp_list' > 
		     <table>
		       <tr>
		        <td   onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;' width="5%">ȫ��</td>
		        <td width="5%">���</td>
		         <td>��ʱ��������</td> 
		         <td>��ʱ��Ӣ����</td>
		         <td>���ݿ�</td>
		         <td>����</td>
		         <td>������</td>
		         <td>����ʱ��</td>
		       </tr>
		       
	           <logic:iterate id="dataMaintList" name="t01_mt_propertyList" type="com.ist.common.metadata.dto.T01_mt_property"  indexId="index">
	            <tr> 
	              <td height=22 align="center" nowrap>
                    <html:multibox property="selectedtable">
						<bean:write name="dataMaintList" property="tablekey" />
					</html:multibox> 
		          </td> 
		             <TD align="center">
							 <%=index.intValue()+1%>
					 </TD>
	               <td align="left"><bean:write name="dataMaintList" property="tablecname" scope="page"/></td>
	               <td align="left"><bean:write name="dataMaintList" property="tableename" scope="page"/></td>
	               <td><bean:write name="dataMaintList" property="dblinkkey_disp" scope="page"/></td>
	               <td align="left"><bean:write name="dataMaintList" property="des" scope="page"/></td>
	               
	               <td><bean:write name="dataMaintList" property="creator_disp" scope="page"/></td>
	               <td nowrap="nowrap"><bean:write name="dataMaintList" property="createdate" scope="page"/></td> 
	                 
                </tr>
	           </logic:iterate>
	         </table>
	       </div>
		</html:form> 
 
	  </div>
	</BODY>
</HTML>
