<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gbk">

<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/awp_calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
<script LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function CheckBoxMustCheckedAndTplaStat(objCheckBox,objTplstat) {
	var errMsg='';
	var num = 0;
	for (var i = 0; i < objCheckBox.length; i++) {
		if ((true == objCheckBox.item(i).checked) && (objCheckBox[i].type == "checkbox")) {
			if (objTplstat[i].value == '����'){
			    errMsg='ѡ���ģ���а�������ģ�壬�����ͨ���ٷ�����';
				return errMsg;
			}
		}
	}
	return errMsg;
}

function dosubmit(theUrl,type){
       var errMsg = "";
    var isSub = false;
    if(type=='modi'){
         isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='del'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('��Ҫɾ��ѡ��ģ����')){
                isSub = true;
            }
        }
    }else if(type=='submit'){
    	var objTplstat = document.getElementsByName('tplastat_disp');
    	var objCheckBox = document.getElementsByName('tplakeys');
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg==''){
        	errMsg = CheckBoxMustCheckedAndTplaStat(objCheckBox,objTplstat);
        }
        
        if(errMsg==''){
            if(confirm('��Ҫ����ѡ��ģ����')){
               isSub = true;
           }
        }
    }else if(type=='recsubmit'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('��Ҫ�˻�ѡ��ģ����')){
                isSub = true;
            }
        }
    }else if(type=='active'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
        if(errMsg==''){
            if(confirm('�����Ҫ����ѡ��Ĺ�����')){
                isSub = true;
            }
        }
    }else if(type=='search' || type=='add'){
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


function dosubmit_openFullWin(theUrl,type){
    var busstypecd=document.forms[0].busstypecd.value;
    theUrl=theUrl+"&busstypecd="+busstypecd;
    var errMsg = "";
    var isSub = false;
    if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        if(errMsg==''){
            
            theUrl=theUrl+"&tplakeys="+getOnlyOneSelectValue("tplakeys");
        }
        isSub = true;
    }else if(type=='add'){
        isSub = true;
    }
    if(isSub && errMsg==''){
        document.forms[0].action=theUrl;
        document.forms[0].submit();
        //openFullWin(theUrl,'theUrl_only_one_mode');
        //avpPopUp(theUrl,'800','500');
    }else{
        if(errMsg!='')
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

 function copy(theUrl){
    var  errMsg = 'export.do';
    errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
    if(errMsg==''){
        if(confirm('��Ҫ����ѡ�е�ģ����')){
        	document.forms[0].action=theUrl;
        	document.forms[0].submit();
        }
    }else{
        if(errMsg!='')
        alert(errMsg);
        return false;
    }
 }
 	
 	//ģ�嵼����֤
 	function tplaExport() {
 		var url = "export.do";
 		var errMsg = CheckBoxMustChecked(document.forms[0]);
 		if (errMsg == "") {
 			document.forms[0].action=url;
        	document.forms[0].submit();
 		} else {
 			alert(errMsg)
 		}
 	}
 function ruleback(tplakey){
   var theUrl = '<%=request.getContextPath()%>/avp/template/tpla_ts_back_do.do?tplakey='+tplakey;
   document.forms[0].action=theUrl;
   document.forms[0].submit();
}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id='content'>
<html:form method="post" action="/template/tpla_publish_list.do">
<div class='awp_title'>
				<table>
					<tr>
						<td width="23%">
							<span class="awp_title_td2">��֤ģ�� - �б�
							</span>
						</td>
						<td align="right">
							<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />	
							<!-- <input type=button value="��׼ģ��" name=Button223 class="input" onClick="dosubmit_openFullWin('t02_tp_bzbas_inf_add.do?tplatype=1','add');"> --> 

		           <input type=button value="�� ��" name=Button2232  onClick="dosubmit('t02_tp_bas_inf_add.do?tplatype=1','add');">
		           <input type=button value="�� ��" name=Button22  onClick="dosubmit_openFullWin('t02_tp_bas_inf_modify_base.do?a=1','pass');">
				   <input type=button value="Ͷ��Ӧ��" name=Button2222  onClick="dosubmit('tpla_maint_product_do.do','pass');">
		           <input type=button value="�� ��" name="btnTplaCopy"  onClick="copy('tpla_copy.do?newsearchflag=1&busstypecd=<%=request.getParameter("busstypecd") %>');">
		           <input type=button value="ɾ ��" name=Button222  onClick="dosubmit('tpla_del.do?newsearchflag=1&tplastat_value=2&busstypecd=<%=request.getParameter("busstypecd") %>','del');">
		           <input type=button value="�� ��" name="btnTplaImport"  onClick="dosubmit('import.do', 'add')">
		           <input type=button value="�� ��" name="btnTplaExport"  onClick="tplaExport();">					</td>
					</tr>
				</table>
			</div>      


  
  <html:messages id="errors" message="true">
		<bean:write name="errors" filter="fasle" />
  </html:messages>
 
  
  <div class='awp_cond' id="searchtable"  style="display:none"> 
  <table>
								<tr >
								    <td >
										ģ�����ƣ�
									</td>
									<td >
										<html:text property="tplaname" styleClass="text_white" size="30" />
									</td>	
									<td   >
										�����ˣ�
									</td>
									<td >
										<html:hidden property="creator"/>
				<html:text property="creator_disp" styleClass="text_white" size="30"  readonly="true"/>
				<input type="button" name="locates" value="�� ѡ" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t00_userLocation','checkbox','forms[0]','creator,creator_disp','flag=\'1\'');"/>			
			
									</td>	
								</tr>
								<tr >
								    <td  >
										�������ڣ�
									</td>
									<td >
									<html:text property="createdate_min" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].createdate_min);"> �� 
									<html:text property="createdate_max" styleClass="text_white" size="10" maxlength="10"  readonly="true"/>
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onclick="new Calendar().show(document.forms[0].createdate_max);">	
									</td>	
									<td  >
										ģ������״̬��
									</td>
									<td >
										<html:select property="tplareqstat">
											<html:options collection="flagMap" property="label"
												labelProperty="value" />
										</html:select>
									</td>	
								</tr>
								<tr >		
								       <td >
										   ģ�����ͣ�
										</td>
										<td nowrap >
											<html:select property="tplatype">
											<html:options collection="tplatypeMap" property="label"
												labelProperty="value" />
										    </html:select>
										</td>
										 <td >
										   ����
										</td>
										<td >
										<html:select property="sort">
	                  						<html:options collection="sortMap" property="label" labelProperty="value"/>
	               							</html:select>
											&nbsp;
											<html:radio property="sort_type" value="asc">����</html:radio>
											<html:radio property="sort_type" value="desc">����</html:radio>
											<html:radio property="sort_type" value="">������</html:radio>
										
									</td>
								</tr>
								
								<tr >		
								       <td >
										
										</td>
										<td nowrap>
											
										</td>
										 <td >
										 
										</td>
										<td > <input type="button" name="button11" value="�� ѯ" onClick="dosubmit('tpla_maint_list.do?newsearchflag=1&busstypecd=<%=request.getAttribute("busstypecd") %>','search')" ></td>
								</tr>

							</table>
	</div>					
  <input type="hidden" name="busstypecd" value=<%=request.getAttribute("busstypecd") %>>
 
<div class="awp_list">
  <TABLE  >
    <TR align=center > 
      <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
      <TD width="18%" align="center" nowrap>ģ������</TD> 
      <TD width="10%" nowrap>ģ�����</TD>
      <TD width="10%" nowrap>ģ������״̬</TD>
      <TD width="10%" nowrap>ģ��״̬</TD>
      <TD width="10%" nowrap>ģ������</TD>
      <TD width="10%" noWrap>������</TD>
      <TD width="10%" nowrap>��������</TD>
      <TD width="10%" noWrap>��������</TD>
       <TD width="10%" noWrap>����</TD>
    </TR>


	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf">
    <TR align="center" bgcolor="#FFFFFF" id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
       <TD height=22 nowrap>
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />||<bean:write name="binfo" property="tplatype" />
							</html:multibox>
						    <html:hidden name="binfo" property="tplastat_disp" />
		</TD>
       <TD align="left"><bean:write name="binfo" property="tplaname" scope="page" /></TD> 
       <TD align="left"><bean:write name="binfo" property="tplacatecd_name" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplareqstat" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="tplatype_disp" scope="page"/></TD>
       <TD noWrap ><bean:write name="binfo" property="creator_disp" scope="page"/></TD>
       <TD align="left" noWrap><bean:write name="binfo" property="createdate" scope="page"/></TD>
       <TD noWrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
       <td>
       	<% if("2".equals(binfo.getTplatype())){%>
            <a href="<%=request.getContextPath()%>/avp/template/tpla_ts_back_do.do?tplakey=<%=binfo.getTplakey()%>">�˻�̽�� </a>
       <% }%>
       </td>
         
    </TR>
    </logic:iterate>
  </TABLE>
  </div>
  <div class='awp_page_bottom'>
	<table width="98%" border="0" align="center" cellpadding="3"
		cellspacing="3">
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table>  
	</div>
</html:form>
</div>
</BODY>
</html:html>
