<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>

<HEAD>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
 
<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
  if(type=='modi'){
          if(checkRadio(document.forms[0].opp_sys_ids)<0){
           errMsg = "��ѡ��";
          } 
        isSub = true;
    
    }else if(type=='del'){
    
         if(checkRadio(document.forms[0].opp_sys_ids)<0){
                errMsg = "��ѡ��";
            }
            if(errMsg==''){
                if(confirm('�����Ҫɾ����ѡ��Ϣ��')){
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

</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id="main">
<html:form action="/valpara/t07_indic_valpara_list.do" method="post">

   <div class="conditions">
  <div class="cond_t">
      <span>����ָ����Ϣ </span> 
         <span class="buttons">
	   <a href="#" onclick="javascript:window.close();" ><img src="../../images/<%=session.getAttribute("style") %>/b_shut.png" width="20" height="20"/>�ر�</a>
				 
				 </span>
				 </div>
      
 	<div class="cond_c2">
 	
		<TABLE   border=0 cellPadding=0  
			cellSpacing=0 >

							<tr  >
								<td  >
									ָ�����ƣ�
								</td>
								<td  >
									<bean:write  name="val"  property="indicname" />
								</td>
								<td  >
									ָ�굥λ��
								</td>
								<td  >
									<bean:write  name="val"  property="unit" />
								</td>
							</tr>
							<tr  >
								<td >
									����Ƶ�ȣ�
								</td>
								<td  >
									<bean:write name="val"   property="granularitys_disp" />
								</td>
								<td>��˽��
								</td>
								<td >
									<bean:write  name="val"   property="party_cd_disp" />
								</td>
							</tr>
							<tr  >
								<td >
									�ͻ����ͣ�
								</td>
								<td  >
									<bean:write name="val"   property="party_acct_cd_disp" />
								</td>
								<td  >
									ָ�����ͣ�
								</td>
								<td  >
									<bean:write name="val"   property="indictype_disp" />
								</td>
								
								         
							</tr>
                             
					 
							<tr  >
								<td  >
									��Чʱ�䣺
								</td>
								<td  >
									<bean:write name="val"   property="validate_dt_disp" />
								</td>
								 <td  >
									ʧЧʱ�䣺
								</td>
								<td >
									<bean:write  name="val"  property="invalidate_dt_disp" />
								</td>
							</tr>
						 
						 
						</table>
			 </div>
  <html:errors/>
    <div class="list">
  <TABLE   border=0  cellpadding="2" cellspacing="1"  >
    <TR >
      <TH  nowrap>ָ������</TH>
      <TH  nowrap>ָ�굥λ</TH>
      <TH  nowrap>����Ƶ��</TH>
      <TH  nowrap>����</TH>
      <TH  nowrap>��˽</TH>
      <TH  nowrap>�ͻ�����</TH> 
      <TH  nowrap>ָ������</TH>  
      <TH  nowrap>ָ�����</TH> 
      <TH  nowrap>��Чʱ��</TH>
      <TH  nowrap>ʧЧʱ��</TH>
    </TR>
    
<logic:iterate id="indic" name="t07_indic_valparaList" type="com.ist.platform.dto.T07_valpara">

    <TR align="center" class="interval" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD><bean:write name="indic" property="indicname" scope="page"/></TD>
      <TD><bean:write name="indic" property="unit" scope="page"/></TD>
      <TD><bean:write name="indic" property="granularitys_disp" scope="page"/></TD>
      <TD><bean:write name="indic" property="curr_cd_disp" scope="page"/></TD>
	  <TD><bean:write name="indic" property="party_cd_disp" scope="page"/></TD>
	  <TD><bean:write name="indic" property="party_acct_cd_disp" scope="page"/></TD>	  
	  <TD><bean:write name="indic" property="indictype_disp" scope="page"/></TD>  
	  <TD><bean:write name="indic" property="category_disp" scope="page"/></TD>
	  <TD><bean:write name="indic" property="validate_dt_disp" scope="page"/></TD>
	  <TD><bean:write name="indic" property="invalidate_dt_disp" scope="page"/></TD>	 
    </TR>
</logic:iterate>
  </TABLE>
  </div>
  </div>
</html:form>
</div>
</BODY>
</HTML>

