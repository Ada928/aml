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

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
<script src="../../js/load_window.js"></script>
<SCRIPT LANGUAGE="JavaScript"
		src="<%=request.getContextPath()%>/js/Calendar.js"></script>

<script src="../../js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">

function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type=='modi'){
        if(checkRadio(document.forms[0].username)<0){
            	errMsg = "��ѡ��";
            }
        isSub = true;
    }else if(type=='pass'){
        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
        isSub = true;
    }else if(type=='submit'){
        errMsg = CheckBoxMustChecked(document.forms[0]);
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
    }else if(type=='copy'){
        var  errMsg = '';
             errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
       if(errMsg==''){
          if(confirm('��Ҫ����ѡ�е�ģ����')){
           isSub = true;
          }
      }else{
        if(errMsg!='')
        alert(errMsg);
        return false;
    }
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
</SCRIPT>
</HEAD>
<body>
<div id="content">
<html:form method="post" action="/template/tpla_publish_list.do">
<div class='awp_title'>
				<table>
					<tr>
						<td width="2%"><span class="title_img"></span></td>
						<td width="23%" nowrap><span class="awp_title_td2">�������� - ģ�ͷ�������</span></td>
						<td align="right">
						<input type="button" name="btsearch2" value="�� ��"
									onclick="btnDisplayHidden(this, 'searchtable')" />
							<input type=button value="�� ��" name=Button22 class="input" onClick="dosubmit('tpla_submit.do?newsearchflag=1&tplareqstat_value=3','submit');">
							<input type=button value="�� ��" name=Button2222  onClick="dosubmit('tpla_copy.do?newsearchflag=1','copy');">
							<input type=button value="�� ��" name=Button22 class="input" onClick="dosubmit('tpla_recsubmit.do?newsearchflag=1&tplareqstat_value=4','recsubmit');">
							<input type=button value="�� ��" name="btnTplaExport"  onClick="tplaExport();">
							<!-- <input type=button value="�� ��" name=Button22 class="input" onClick="dosubmit('exportT02_tpla_all_infoDoc.do','search');"> -->						                  </td>
					</tr>
				</table>
			</div>

   <html:messages id="errors" message="true">
	 <bean:write name="errors" filter="false" />
   </html:messages>
  <div class='awp_cond' id="searchtable"  style="display:none"> 
    <table>
		<tr>
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
				<html:text property="creator_disp" styleClass="text_white" size="30" />
				<input type="button" name="locates" value="�� ѡ" class="text_white" onclick="locate_pop_window('<%=request.getContextPath()%>','t00_userLocation','checkbox','forms[0]','creator,creator_disp','flag=\'1\'');"/>			
			</td>	
		</tr>
		<tr>
		<td  >
				�������ڣ�
		</td>
		<td >
			<html:text property="createdate_min" styleClass="text_white" size="10" maxlength="10" />
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onClick="new Calendar().show(document.forms[0].createdate_min);"> �� 
									<html:text property="createdate_max" styleClass="text_white" size="10" maxlength="10" />
										<img src="../../images/calendar.gif" id="img1"
										style="cursor:hand;" width="16" height="16" border="0"
										align="absmiddle" alt="�������������˵�"
										onClick="new Calendar().show(document.forms[0].createdate_max);">	
		</td>	
		<td  >
				ģ��״̬��
		</td>
		<td >
			<html:select property="tplareqstat">
				<html:options collection="flagMap" property="label"	labelProperty="value" />
			</html:select>
		</td>	
	</tr>
	<tr>		
		<td >
			����
		</td>
		<td nowrap align="left">
			<html:select property="sort">
	        <html:options collection="sortMap" property="label" labelProperty="value"/>
	        </html:select>
			&nbsp;
			<html:radio property="sort_type" value="asc">����</html:radio>
			<html:radio property="sort_type" value="desc">����</html:radio>
			<html:radio property="sort_type" value="">������</html:radio>
		</td>
		<td nowrap >
			ҵ�����
		</td>
		<td nowrap >
			<html:select property="busstypecd">
			   <html:options collection="busstypecdMap" property="label" labelProperty="value" />
			</html:select>
		</td>
	</tr>
	<tr>
	  <td></td>
	  <td>
		  
	  </td>	
	  <td></td>
	  <td><input type="button" name="button11" value="�� ѯ" onClick="dosubmit('tpla_publish_list.do?newsearchflag=1','search')" class="input"></td>
	</tr>
	</table>
 </div>

  <div class="awp_list">
  <table>
    <tr align=center > 
      <TD width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</td>
      <td>���</TD> 
      <td width="20%" align="center" nowrap>ģ������</TD> 
      <td width="14%" nowrap>ģ�����</TD>
      <td width="14%" nowrap>ģ��״̬</TD>
      <td width="9%" noWrap>������</TD>
      <td width="18%" nowrap>��������</TD>
      <td width="18%" noWrap>��������</TD>
    </tr>
    <%
	   int currRecordNum=((Integer)request.getAttribute("currRecordNum")).intValue();
	%>
	 <html:hidden property="publish_flag" value="1"/>
	<logic:iterate id="binfo" name="t02_tp_bas_infList"  type="com.ist.avp.template.dto.T02_tp_bas_inf"  indexId="index">
    <tr id='id_<bean:write name="binfo" property="tplakey" />' onMouseOver=TableMouseOver(this,'id_<bean:write name="binfo" property="tplakey" />') onmouseout=TableMouseOut(this,'id_<bean:write name="binfo" property="tplakey" />')>
       <td height=22 nowrap align="center">
                           <html:multibox property="tplakeys">
								<bean:write name="binfo" property="tplakey" />
							</html:multibox>
		</td>
		<TD  align="center">
			 <%=index.intValue()+1+currRecordNum%>
		</TD>
       <td algin="left" nowrap>
       <a href="javascript:void(0);" onClick="window.open('<%=request.getContextPath()%>/avp/template/tpla_alltmpalt_info_link.do?tplakey=<bean:write name="binfo" property="tplakey" scope="page"/>&busstypecd=<bean:write name="binfo" property="busstypecd" scope="page"/>','','height=600, width=800,left=100,top=100,scrollbars=yes,resizable=yes')">
       <bean:write name="binfo" property="tplaname" scope="page" />
       </a>
       </td> 
       <td nowrap algin="left" ><bean:write name="binfo" property="tplacatecd_name" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="tplastat_disp" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="creator_disp" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="createdate" scope="page"/></td>
       <td align="center" nowrap><bean:write name="binfo" property="publishdate" scope="page"/></TD>
    </tr>
    </logic:iterate>
  </table>
  </div>
  <div class='awp_page_bottom'>
	<table>
		<tr>
			<td align="center">
				<bean:write name="pageInfo" scope="request" filter="false" />
			</td>
		</tr>
	</table> 
	</div> 
</html:form>
</div>
</body>
</html:html>
