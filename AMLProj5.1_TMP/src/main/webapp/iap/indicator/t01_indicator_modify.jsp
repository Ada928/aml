<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>

<html:html lang="true">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
    <script language="JavaScript" src="../../js/basefunc.js"></script>
    <script type="text/javascript" src="../../js/jquery.js"></script>
    <script type="text/javascript" src="../../js/aml.js"></script>  
    <SCRIPT LANGUAGE="JavaScript">
	var contextPath='<%=request.getContextPath()%>';
	function _Click(){
			var  fromarea=eval(document.forms[0].indictype);
		   
		    var index=fromarea.selectedIndex;
			var selvalue=fromarea.options[index].value;
		  
		  	var j;
		  	
		  	//Ϊ����ָ��ʱ�����Ȳ���ʾ ָ�������ʾ ��׼ֵ����ʾ
		  	var trElement = document.getElementById("indic3");
		  	var trElementorg = document.getElementById("noindic3");
		  	var trElementcat = document.getElementById("noindic5");
		  	var trElementcatn = document.getElementById("noindic6");
		    if(selvalue==3){
		    	trElement.style.display="";
		    	trElementorg.style.display="none";
		    	trElementcat.style.display="none";
				trElementorg.value=""
				trElementcatn.value=""
		    }else{
		    	trElementorg.style.display="";
		    	trElementcat.style.display="";
		    	trElement.style.display="none";
		    	trElementcatn.value="none"
				trElement.value=""
		    }
		}
		function checkForm(theUrl){
		    var errMsg ="";
		   if(getLength(document.forms[0].indicname.value)==0){
		        errMsg+="ָ�����Ʋ���Ϊ�գ�";
		        document.forms[0].indicname.focus();
		    } 
		    else if(getLength(document.forms[0].indicname.value)>64){
		        errMsg+="ָ�����Ʋ��ܴ���64���ַ���";
		        document.forms[0].indicname.focus();
		    } 		       
		    
		    else if(getLength(document.forms[0].des.value)>256){
		        errMsg+="ָ���������ܴ���256���ַ���";
		        document.forms[0].des.focus();
		    } 
		    		       
		    if(errMsg!=""){
		        alert(errMsg);
		        return false;
		    }else{
		        document.forms[0].action=theUrl;
		        document.forms[0].submit();
		    }
		}
		function clearNoNum(obj){
			 obj.value = obj.value.replace(/[^\d.]/g,"");
			 obj.value = obj.value.replace(/^\./g,"");
			 obj.value = obj.value.replace(/\.{2,}/g,".");
			 obj.value = obj.value.replace(".","$#$").replace(/\./g,"").replace("$#$",".");
		}		
		function dosubmit(theUrl){			
			 parent.location = theUrl;
		}
</SCRIPT>
</head>

<body leftmargin="0" topmargin="0">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_add_do.do">
            <div class="conditions">
	            <div class="cond_t">
                  <span>ָ�궨�� - �� ��</span>
				  <span class="buttons">
				    <a href="javascript:void(0);" onclick="dosubmit(contextPath+'/iap/indicator/indicator_list.do');return false;"  class="btn btn_back"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
				  </span>
	            </div>
			

            <div class="cond_c2">
                <table id="query_table" border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>ָ����룺
                        </td>
                        <td>
                            <bean:write name="t09_indicatorActionForm" property="indickey" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>ָ�����ƣ�
                        </td>
                        <td>
                            <html:text property="indicname" size="30" />
                            <html:hidden property="indickey" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ָ�����ԣ�
                        </td>
                        <td>
                            <html:select property="indictype" onchange="_Click()" disabled="true">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                            <html:hidden property="indictype" name="t09_indicatorActionForm" />
                        </td>
                    </tr>
                   
                        <tr id="noindic5">
                            <td align="right">
                                ָ�����
                            </td>
                            <td>
                                <html:select property="apptype">
                                    <html:options collection="apptypeMap" property="label"
                                        labelProperty="value" />
                                </html:select>
                            </td>
                        </tr>
                   
                    <tr>
                        <td align="right">
                            ָ��ʵ�����ʣ�
                        </td>
                        <td>
                            <html:select property="resultype">
                                <html:options collection="resultypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                  
                    <logic:notEqual value="3" property="indictype" name="t09_indicatorActionForm">
                        <tr id="noindic3">
                            <td align="right">
                                �������ȣ�
                            </td>
                            <td>
                                <html:checkbox property="guizld_1" value="1">��</html:checkbox>
                                <html:checkbox property="guizld_4" value="1">��</html:checkbox>
                                <html:checkbox property="guizld_5" value="1">��</html:checkbox>
                                <html:checkbox property="guizld_7" value="1">��</html:checkbox>
                            </td>
                        </tr>
                    </logic:notEqual>
                    <logic:equal value="3" property="indictype" name="t09_indicatorActionForm">
                        <tr id="indic3">
                            <td align="right">
                                ��׼ֵ��
                            </td>
                            <td>
                                <table>
                                    <tr>
                                        <td nowrap align="right">
                                            ������׼ֵ��
                                        </td>
                                        <td>
                                            <html:text property="stdval1" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap>
                                            ��ҵ��׼ֵ��
                                        </td>
                                        <td>
                                            <html:text property="stdval2" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                            <FONT color="#ff0000">ע�⣺��׼ֵ����Ϊ�գ�������룬����Ϊ��������С��</FONT>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" nowrap>
                                            ���б�׼ֵ��
                                        </td>
                                        <td>
                                            <html:text property="stdval3" styleClass="text_white"
                                                onkeyup="clearNoNum(this)" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </logic:equal>
                    <tr>
                        <td align="right">
                            ״̬��
                        </td>
                        <td>
                            <html:select property="flag">
                                <html:options collection="flagMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <FONT color="#ff0000">*</FONT>��ʾ��ţ�
                        </td>
                        <td>
                            <html:text property="dispseq" size="10" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ָ��������
                        </td>
                        <td>
                            <html:textarea property="des" cols="60" rows="6" />
                        </td>
                    </tr>
                    <tr>
                        <td align="center">
                            <input type="hidden" name="indictype"
                                value="<bean:write property="indictype" name="t09_indicatorActionForm"/>" />
                        </td>
                        <td>
                            <html:button property="button" value="�� ��" styleClass="in_button1"
                                onclick="checkForm('indicator_modify_do.do')" />
                            <html:reset styleClass="in_button1" value="�� ��" />
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </html:form>
    </div>
</body>
<script type="text/javascript">
var frame = window.parent["leftFrame"];
frame.refresh();
</script>
</html:html>
