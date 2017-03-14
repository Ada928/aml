<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" src="../../js/basefunc.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]> 
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
<script type="text/javascript" src="../../js/calendar.js"></script>    
 <SCRIPT LANGUAGE="JavaScript">
	function _Click(){
	
	var  indictype=eval(document.forms[0].indictype);
   
    var index=indictype.selectedIndex;
	var selvalue=indictype.options[index].value;
	
	var tdElement = document.getElementById("ind");
	var tdElementcw = document.getElementById("cwind");
		if(selvalue==3){
			tdElementcw.style.display="";
	    	tdElement.style.display="none";
		}else{
			tdElementcw.style.display="none";
	    	tdElement.style.display="";
		}
	}
	function selectAllCheckBoxbyindic(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled && formElement.name!="guizld_1" && formElement.name!="guizld_4" && formElement.name!="guizld_5" && formElement.name!="guizld_7"){
				formElement.checked = trim(objElement.innerText)=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
	
function dosubmit(theUrl,type){
		var errMsg = "";
		var isSub = false;
		if(type=='modi'){
			errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
			isSub = true;
		 }
		 else if(type=='del'){
			errMsg = CheckBoxMustChecked(document.forms[0]);
			if(errMsg==''){
				if(confirm('�����Ҫɾ����')){
				isSub = true;
			}
			}
		}
		 else if(type=='search'){
				
				if(!_isDateSpaceComplete(document.forms[0].createdate_min.value, document.forms[0].createdate_max.value)){
		       		errMsg = "����д��������ʼʱ�䷶Χ��";
		       		}
		    	   else if(!_compareTwoDateForString(document.forms[0].createdate_min.value, document.forms[0].createdate_max.value)) {
		    			 errMsg = "��ʼʱ�䲻�ܴ��ڽ���ʱ��";	
		    		}
				isSub = true;
		}
		else if(type=='add' || type=='save'){
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
	function openWin(theUrl,win_name,height,width){	
	
    var top =  (window.screen.availHeight-30-400)/2;
    var left = (window.screen.availWidth-10-750)/2;
    var h,w;
    if(height==undefined){ h = 500 }else{ h = height; }
    if(width==undefined){ w = 600 }else{ w = width; }
   
	var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(theUrl,'',property);     
   }
</SCRIPT>
	</head>
	<body class="mainbg">
	<div id="main">
        <html:form action="/indicator/indicator_list.do" method="post">
            <div class="conditions">
					<div class="cond_t">
					   <span>ָ�궨���б�</span>
					   <span class="buttons">
					                <a href="#" id="hdd_display" class="bt_hidden"></a>
								    <a href="javascript:void(0);" onclick="dosubmit('indicator_add_page.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
									<a href="javascript:void(0);" onclick="dosubmit('indicator_modify_page.do','modi');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
								    <a href="javascript:void(0);" onclick="dosubmit('indicator_delete_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
							    	<a href="javascript:void(0);" onclick="dosubmit('indicator_depoly_do.do','search');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_publish.png" />���뷢��</a>
					   </span>
					</div>

            

    <div class="cond_c" id="searchtable">
	  <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                                                                  ָ����룺
                        </td>
                        <td>
                            <html:text property="indickey"/>
                        </td>
                        <td>
                                                                   ָ�����ƣ�
                        </td>
                        <td>
                            <html:text property="indicname"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                                                  ָ�����ԣ�
                        </td>
                        <td>
                            <html:select property="indictype" onchange="_Click();">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                        <td>
                                                                     ָ�����
                        </td>
                        <td id="ind">
                            <html:select property="apptype">
                                <html:options collection="apptypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                        
                    </tr>
                    <tr>
                        <td>
                                                                    �������ȣ�
                        </td>
                        <td>
                            <html:checkbox property="guizld_1" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_4" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_5" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_7" value="1">��</html:checkbox>
                        </td>
                        <td>
                                                                 ״ ̬��
                        </td>
                        <td>
                            <html:select property="flag">
                                <html:options collection="flagMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
                                                                  ����ʱ�䣺
                        </td>
                        <td>
                            <html:text property="createdate_min" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg" />
                            --
                            <html:text property="createdate_max" size="12" onclick="calendar.show(this);" readonly="true"
										styleClass="calimg"/>
                        </td>
                        <td>
                                                                   ����
                        </td>
                        <td>
                            <html:select property="sort">
                                <html:options collection="sortMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                            &nbsp;
                            <html:radio property="sort_type" value="asc">����</html:radio>
                            <html:radio property="sort_type" value="desc">����</html:radio>
                            <html:radio property="sort_type" value="">������</html:radio>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            &nbsp;
                        </td>
                        <td>
                            <html:button property="button" styleClass="in_button1" value="�� ѯ"
                                onclick="dosubmit('indicator_list.do?newsearchflag=1','search')" />
                        </td>
                    </tr>
                </table>
         </div>
      </div>
     <div class="list">
   		<table border="0" cellspacing="0" cellpadding="0">
                    <TR>
                        <th noWrap onclick='selectAllCheckBoxbyindic(this,document.forms[0])'
                            style='cursor:hand;' align="center" nowrap>
                                                                     ȫ��
                        </th>
                        <th align="center" nowrap>
                                                                  ָ�����
                        </th>
                        <th align="center" nowrap>
                                                                    ָ������
                        </th>
                        <th align="center" nowrap>
                                                                   ָ������
                        </th>
                        <th align="center" nowrap>
                                                                   ָ�����
                        </th>
                        <th align="center" nowrap>
                                                                    ��������
                        </th>
                        <th align="center" nowrap>
                                                                     ״̬
                        </th>
				         <th align="center" nowrap>
						      ʵ�ַ�ʽ
						</th>
                        <th align="center" nowrap>
                                                                      ����ʱ��
                        </th>
                        <th align="center" nowrap>
                                                                      ����
                        </th>
                    </TR>

                    <logic:iterate id="indicator" name="t01_indicatorList"
                        type="com.ist.iap.dto.T09_indicator">
                        <%
                                        java.util.HashMap map = new java.util.HashMap();
                                        map.put("indickey", indicator.getIndickey());

                                        map.put("rad", "" + (new java.util.Date()).getTime());
                                        pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
                        %>
                        <TR align="center">
                            <TD noWrap>
                                <html:multibox property="selectedindickey">
                                    <bean:write name="indicator" property="indickey" />
                                </html:multibox>
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="indickey" scope="page" />
                            </TD>
                            <TD noWrap>
                                <a
                                    href="javascript:openWin('<%=request.getContextPath()%>/iap/indicator/indicator_disp.do?indickey=<%=indicator.getIndickey()%>','indickey')">
                                    <bean:write name="indicator" property="indicname" scope="page" /></a>
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="indictype_disp" scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="apptype_disp" scope="page" />
                            </TD>
                            <!-- 
					<TD>
						<bean:write name="indicator" property="calmode_disp" scope="page" />
					</TD>
 					-->
                            <TD noWrap>
                                <bean:write name="indicator" property="granularity_disp"
                                    scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="flag_disp" scope="page" />
                            </TD>
                            <!-- 
					<TD>
						<bean:write name="indicator" property="dispseq" scope="page" />
					</TD>
					 -->
					  <TD noWrap>
                                <bean:write name="indicator" property="implway_disp" scope="page" />
                            </TD>
                            <TD noWrap>
                                <bean:write name="indicator" property="createdate" scope="page" />
                            </TD>
                            <TD noWrap>
                                <logic:equal name="indicator" property="indictype" value="1">
                                    <!-- ҵ��ָ�� -->
                                    <logic:equal name="indicator" property="calmode" value="1">
                                        <!-- SQL��ʽʵ�� -->
                                        <html:link name="map"
                                            page="/indicator/indicator_mulsql_edit.do?flag=1">SQL�༭</html:link>
                                        <html:link name="map"
                                            page="/indicator/indicator_colmap.do">��ϵӳ��</html:link>
                                    </logic:equal>
                                    <logic:equal name="indicator" property="calmode" value="2">
                                        <!-- ���淽ʽʵ�� -->
                                        <html:link name="map"
                                            page="/indicator/indicator_mulsql_edit.do">��ʽ�༭</html:link>
                                    </logic:equal>
                                     <logic:equal name="indicator" property="implway" value="2">
                                        <!-- ���淽ʽʵ�� -->
                                        <html:link name="map"
                                            page="/indicator/t09_indicator_md_back.do">�˻�̽��</html:link>
                                    </logic:equal>
                                </logic:equal>
                                <logic:equal name="indicator" property="indictype" value="2">
                                    <!-- ����ָ�� -->
                                    <html:link name="map"
                                        page="/indicator/t01_indic_subitem2_modify.do">��ʽ�༭</html:link>
                                </logic:equal>
                                <logic:equal name="indicator" property="indictype" value="3">
                                    <!-- ����ָ�� -->
                                    <html:link name="map"
                                        page="/indicator/t01_indic_subitem3_modify.do">��ʽ�༭</html:link>
                                </logic:equal>
                            </TD>
                        </TR>
                    </logic:iterate>
                </TABLE>
            </div>

		
		<div class="list_page">
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
</html>

