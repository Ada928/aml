<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<meta content="MSHTML 6.00.2600.0" name=GENERATOR />
<script language="JavaScript" src="../../js/title.js"></script>
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script language="JavaScript" src="../../js/uc.js"></script>
<script language="JavaScript" src="../../js/selectbox.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>

<script type="text/javascript">

function dosubmit(theUrl,type){
      var errMsg = "";
      var isSub = false;
      if(type=='del'){
         if(confirm('�����Ҫɾ����')){
             isSub = true;
         }
      }
     else if(type=='del_s'){
           errMsg = CheckBoxMustChecked(document.forms[0]);
           if(errMsg==''){
               if(confirm('�����Ҫɾ��ѡ������л�����')){
                   isSub = true;
               }
           }
       } 
     else if(type=='add'||type=='modi'||type=='back'||type=='search'){
      isSub = true;
     }
     if(isSub && errMsg==''){
          document.forms[0].action=theUrl;
          document.forms[0].submit();
      }else{
          if(errMsg!='')
              alert(errMsg);
          return false;
      }
   }
</script>
</HEAD>
<BODY class="mainbg">
<div id="main">
<html:form action="/t07_report_organ/t07_report_organ_disp.do" method="post">
 <div class="conditions">
    <!-- title -->
	<div class="cond_t">
	  <span>���л�����ϸ��Ϣ</span>
	  <span class="buttons">
	    <a href="#" id="hdd_display" class="bt_hidden"></a>
	    <a href="#" onclick="dosubmit('t07_report_organ_map_add.do?report_organkey=<bean:write name="t07_report_organ" property="report_organkey" scope="request"/>','add')"><img
			src="../../images/<%=session.getAttribute("style")%>/b_add.png" />�½�</a>
		<a href="#" onclick="dosubmit('t07_report_organ_map_delete_checkBox_do.do?report_organkey=<bean:write name="t07_report_organ" property="report_organkey" scope="request"/>','del_s')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>	
		<a href="#" onclick="dosubmit('t07_report_organ_list.do','back')"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>	
	  </span>  
 	</div>
 	<div class="cond_c" id="searchtable">
        <table   border="0"   cellpadding="0" cellspacing="0"  >       
            <tr>
            <td>����������</td>
         	<td>
                <html:text property="organkey"  size="10"/>
		        <html:text property="organname" 	size="23" readonly="true"/>
                <a href="#" onclick="window.open('../../common/t00_organ_search.do?newsearchflag=1&input_name=organkey&input_name_disp=organname','', 'height=400, width=600,left=100,top=100,scrollbars=yes,resizable=yes');" ><span class="cond_buttons"><img src="../../images/<%=session.getAttribute("style") %>/b_location.png" />��λ</span></a>  
			</td>
         	<td></td>
         	<td>
         	    <input name="" type="button" value="�顡ѯ"  class="in_button1" onClick="dosubmit('<%=request.getContextPath() %>/report/t07_report_organ/t07_report_organ_disp.do?newsearchflag=1&report_organkey=<bean:write name="t07_report_organ" property="report_organkey" scope="request"/>','search')"/>
			</td>
           </tr>
        </table>
      </div>
   </div>
  <html:errors />
    <div class="list">
  <table border="0" cellpadding="0" cellspacing="0"  >
     <tr>
      <th>ѡ��</th>
	  <th>������</th>
	  <th>��������</th>
	  <th>���л������</th>
	  <th>����</th>
	 </tr>
    <logic:iterate id="t07_report_organ_map" name="t07_report_organ_mapList" indexId="i" type="com.ist.aml.report.dto.T07_report_organ">
    <tr>
       <td>
         <html:multibox property="selectedOrgankey">
           <bean:write name="t07_report_organ_map" property="organkey" scope="page"/>
         </html:multibox>
       </td>
       <td>
         <bean:write name="t07_report_organ_map" property="organkey" scope="page" />
       </td>
	     <td>
         <bean:write name="t07_report_organ_map" property="organname" scope="page" />
       </td>
	     <td>
         <bean:write name="t07_report_organ_map" property="report_organkey" scope="page" />
       </td>
       
       
       <td>
	       <a href="#" onclick="dosubmit('t07_report_organ_map_modify.do?organkey=<bean:write name="t07_report_organ_map" property="organkey" />&report_organkey=<bean:write name="t07_report_organ_map" property="report_organkey" />','modi')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="�޸�" /></a>&nbsp;&nbsp;
		   <a href="#" onclick="dosubmit('t07_report_organ_map_delete_do.do?organkey=<bean:write name="t07_report_organ_map" property="organkey" />&report_organkey=<bean:write name="t07_report_organ_map" property="report_organkey" />','del')">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="ɾ��" /></a>
       </td>

    </tr>
	</logic:iterate>
	</table>
  </div>
</html:form>
<div class="list_page">
			<logic:present name="pageInfo">
				<table width="98%" align="center" border="0" cellpadding="3"
					cellspacing="3">
					<tr>
						<td align="center">
							<bean:write name="pageInfo" scope="request" filter="false" />
						</td>
					</tr>
				</table>
			</logic:present>
		</div> 
</div>
</body>
</html>