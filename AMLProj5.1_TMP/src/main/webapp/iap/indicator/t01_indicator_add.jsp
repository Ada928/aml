<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <html:base />
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

  	//Ϊ����ָ��ʱ�����Ȳ���ʾ ָ�������ʾ ��׼ֵ����ʾ
  	var trElement = document.getElementById("indic3");
  	var trElementorg = document.getElementById("noindic3");
  	var appEl = document.getElementsByName("apptype");
    if(selvalue==3){
    	trElement.style.display="";
    	trElementorg.style.display="none";
		trElementorg.value="";
    }else{
    	trElementorg.style.display="";
    	trElement.style.display="none";
		trElement.value="";
    }
}
        function checkForm(theUrl){
		    var errMsg ="";
		   if(getLength(document.forms[0].indickey.value)==0){
		        errMsg+="������ָ����룡";
		        document.forms[0].indickey.focus();
		    }
		    else if(getLength(document.forms[0].indickey.value)!=7){
		        errMsg+="ָ��������Ϊ7λ��";
		        document.forms[0].indickey.focus();
		    }  	
		   else if(getLength(document.forms[0].indicname.value)==0){
		        errMsg+="������ָ�����ƣ�";
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

<body class="mainbg">
    <div id='main'>
        <html:form method="POST" action="/indicator/indicator_add_do.do">
           <div class="conditions">
            <div class="cond_t">
               <span>ָ�궨�� - �� ��</span>
			   <span class="buttons">
			    <a href="javascript:void(0);" onclick="dosubmit(contextPath+'/iap/indicator/indicator_list.do');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
			   </span>
            </div>
            <html:messages id="errors" message="true">
                <bean:write name="errors" filter="fasle" />
            </html:messages>

            <div class="cond_c2">
                <table border="0" cellpadding="0" cellspacing="0">
                    <tr>
                        <td>
                            <FONT color="#ff0000">*</FONT>ָ����룺
                        </td>
                        <td>
                            <html:text property="indickey" size="30" />
                            <FONT color="#ff0000"> ע��ָ��������Ϊ7λ</FONT>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <FONT color="#ff0000">*</FONT>ָ�����ƣ�
                        </td>
                        <td>
                            <html:text property="indicname" size="30" />
                        </td>
                    </tr>

                    <tr>
                        <td>
                            ָ�����ԣ�
                        </td>
                        <td>
                            <html:select property="indictype" onchange="_Click()">
                                <html:options collection="indictypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                        <td>
                            ָ��ʵ�����ʣ�
                        </td>
                        <td>
                            <html:select property="resultype">
                                <html:options collection="resultypeMap" property="label"
                                    labelProperty="value" />
                            </html:select>
                        </td>
                    </tr>
                    <tr id="noindic3">
                        <td>
                            �������ȣ�
                        </td>
                        <td>
                            <html:checkbox property="guizld_1" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_4" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_5" value="1">��</html:checkbox>
                            <html:checkbox property="guizld_7" value="1">��</html:checkbox>
                        </td>
                    </tr>
                    <tr>
                        <td>
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
                        <td>
                            <FONT color="#ff0000">*</FONT>��ʾ��ţ�
                        </td>
                        <td>
                            <html:text property="dispseq" size="10" />
                        </td>
                    </tr>


                    <tr>
                        <td>
                            ָ��������
                        </td>
                        <td>
                            <html:textarea property="des" cols="60" rows="6" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                            <html:button property="button" styleClass="in_button1" value="�� ��"
                                onclick="checkForm('indicator_add_do.do')" />
                            <html:reset styleClass="in_button1" value="�� ��" />
                        </td>
                    </tr>
                </table>
            </div>
            </div>
        </html:form>
    </div>
    
</body>

</html>
