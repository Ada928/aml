<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->
 
<script language="JavaScript">
function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    
    }else if(type=='del'){
    
          errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫɾ����')){
                isSub = true;
            }
        }
        
    }else if(type=='search' || type=='add'){
       isSub=true;
    }
    if(isSub && errMsg==''){
    //alert(theUrl);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        if(errMsg!='')
            alert(errMsg);
        return false;
    }
}
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}

</script>
</head>
<body  class="mainbg">
<div id="main">
<!-- conditions --> 
<html:form action="/templet/t07_nbs_templet_list.do" method="post">
  <div class="conditions">
   	<div class="cond_t">
	  <span>����ģ����Ϣά�� </span> 
      <span class="buttons">
       <a href="#" id="hdd_display" class="bt_hidden"></a>
	   <a href="#" onclick="dosubmit('t07_nbs_templet_add.do','add')"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
	   <a href="#"  onclick="dosubmit('t07_nbs_templet_modify.do','modi')"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
	   <a href="#" onclick="dosubmit('t07_nbs_templet_delete_do.do?newsearchflag=1','del')"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
	 
	  </span>
	</div>
 
 <div class="cond_c"  id="searchtable">
  <table   border="0" cellspacing="0" cellpadding="0">
            <tr  >
             <td>ģ������:</td>
             <td> <html:text property="templet_title" 
										size="24" maxlength="12" /> </td>
              <td   > ģ�����ͣ�</td>
              <td   >  
                <html:select property="templet_type_s" >
                  <html:options collection="templettypeMap"
                                property="label"
                                labelProperty="value" />
                   </html:select>
                   <input type="button"  value="�� ѯ"  class="in_button1" 
                             onclick="dosubmit('t07_nbs_templet_list.do?newsearchflag=1&newenterflag=1','add')" /></td>
            
             </td>
             
                   
</table>
 </div>
 </div>
  <html:errors/>
    <div class="list">
  <TABLE >
    <TR>
      <th onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
      <th >���</th> 
      <th>ģ������</th>
      <th>ģ������</th>
      <th>ģ������</th>
      <th>��������</th>
      <th>��������</th>
    </TR>
<logic:iterate id="info" name="t07_nbs_templetList" indexId="i" type="com.ist.platform.dto.T07_nbs_templet">
    <TR>
      <TD>
    <html:multibox property="templet_nums">
    <bean:write  name="info" property="templet_num" />
    </html:multibox>
    </TD>
      <TD><%=i.intValue()+ 1%></TD>
       <TD>
         <bean:write name="info" property="templet_type_disp" scope="page"/>
       </TD>
	   <TD>
	   	<div style="word-break:break-all;">
			<bean:write name="info" property="templet_title" scope="page"/>
		</div>
         
       </TD>
	   <TD width="500">
	   
	   <div style="word-break:break-all;">
					<bean:write name="info" property="templet_constant" scope="page"/>
	</div>
	   </TD>
	   <TD>
         <bean:write name="info" property="create_org" scope="page"/>
       </TD>
       <TD>
         <bean:write name="info" property="create_date" scope="page"/>
       </TD>
    </TR>
</logic:iterate>
  </TABLE>
  
 </div>
 			<div class="list_page">
						<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
 
</html:form>
<!--��ʾ��--> 
<div id=div_hint style="font-size:12px;color:red;display:none;position:absolute; z-index:6000; top:200;background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid;filter:Alpha(style=0,opacity=80,finishOpacity=100);"></div> 
</div>
</BODY>
</HTML>
