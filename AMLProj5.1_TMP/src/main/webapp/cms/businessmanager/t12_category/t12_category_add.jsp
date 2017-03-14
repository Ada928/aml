<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
   <SCRIPT LANGUAGE="JavaScript"> 
	function checkForm(theUrl){
	    var errMsg ="";
	    if(getLength(document.forms[0].categorytypename.value)>64){
	        errMsg="����������Ʋ��ܴ���64���ַ���";
	        document.forms[0].categorytypename.focus();
	    }else if(getLength(document.forms[0].categorytypename.value)==0){
	        errMsg="����������Ʋ���Ϊ�գ�";
	        document.forms[0].categorytypename.focus();
	    }if(getLength(document.forms[0].categorytype.value)>32){
	        errMsg="������ͱ��벻�ܴ���32���ַ���";
	        document.forms[0].categorytype.focus();
	    }else if(getLength(document.forms[0].categorytype.value)==0){
	        errMsg="������ͱ��벻��Ϊ�գ�";
	        document.forms[0].categorytype.focus();
	    }else if(getLength(document.forms[0].desc.value)> 256){
	        errMsg="�������ܴ���256���ַ���";
	        document.forms[0].desc.focus();
	    }
		
	    if(errMsg == ""){
		    if(document.forms[0].isquote.value == "0"){
				var true_level = parseInt(document.getElementById("true_level").value);
				var level = parseInt(document.getElementById("level").value);
				if(true_level != level){
					errMsg="�趨�Ĳ㼶������Ĳ㼶������";
	       			document.forms[0].level.focus();
				}else{
					var digits = document.getElementsByName('digit');
				    if(digits.length > 0){
				    	 for(var i = 0;i < digits.length; i++){
				          if(digits[i].value == ""){
				             	errMsg="λ������Ϊ�գ�";
				                break;
				           } 
				           if (isNaN(digits[i].value))
				            {   errMsg="λ������Ϊ���֣�";
				                break;
				            }
				           if (!checkNum(digits[i].value))
				            {   errMsg="λ��ֻ����0����������";
				                break;
				            } 
				        }
				    }
				}
	       }
	    }
	    if(errMsg!=""){
	        alert(errMsg);
	        return false;
	    }else{
	       document.forms[0].action=theUrl;
	       document.forms[0].submit();
	    }
	}
	
	function checkNum(val)
	{
	     var str = "";
	     var re = /^[0-9]\d*$/;
	     if (!re.test(val))
	    {
	        return false;
	     }else{
	     	return true;
	     }
	     
	} 
	function quotechange(val){
		var obj = document.getElementById("levelarea");
	    var quoteObj = document.getElementById("quote");
	    var codeObj = document.getElementById("levelcode");//�㼶
		//����
		if(val == '1'){
			quoteObj.style.display="";
			obj.style.display="none";
			codeObj.style.display="none";
			
		}else{
			obj.style.display="";
			codeObj.style.display="none";
			quoteObj.style.display="none";
			
		}
	}
	function display(){
	  var val = document.getElementById("level").value;
	  var obj = document.getElementById("levelcode");
	  document.getElementById("true_level").value = val;
	  if(val !="") obj.style.display = "";
	  var tb = document.getElementById('tableid');
      val = parseInt(val)+2;
  	  var num = parseInt(tb.rows.length);
 	  for(var k=num-1;k>0;k--)
      {
  	  	  tb.deleteRow(k);
      }
      //��ʾ��
      for(var j=1;j<val;j++)
      {
    	 if(j == val-1){
		     	//�������±��뼶
		    	 addrow(j,"final");
		     }else{
		    	 addrow(j,"");
		     }
      }
	}
	function addrow(num,type){
	        var tab=document.getElementById("tableid");
			var newRow = tab.insertRow();
		    newRow.align="center"; 
		    
		   	var cel1 = newRow.insertCell();
			if(type == "final"){
				cel1.innerHTML="���±���";
			}else{
				cel1.innerHTML=num+"��";
			}
			
		   	var cell0 = newRow.insertCell();
			if(num != 1)cell0.innerHTML="<c:out value="${splitstr}" escapeXml="false"/>";	
			
			var cell2 = newRow.insertCell();
			cell2.innerHTML="<c:out value="${prestr}" escapeXml="false"/>";
			
			var cell3 = newRow.insertCell();
			cell3.innerHTML=" <input name=\"digit\" type=\"text\" size=\"5\" class=\"avp_number\">";
			
			//ˢ����ʽ
			setInputStyle();   
                
	   }
	    function displaylayer(){
	  	var type = document.getElementById("isquote").value;
	  	//�����������
	  	if(type == "0"){
	  		quotechange(type);
	  		display();
	  	}
	  }
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_category/t12_category_add_do.do">

			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">������
									- �½����</span>
                        </td>
                        <td align="right" nowrap>
                             
						    <html:button property="button4" value="�� ��" styleClass="input"
							onclick="awpDoSubmit('t12_category_list.do','add')" />
                        </td>
                    </tr>
                </table>
            </div>
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<input type="hidden" name="true_level" id="true_level" value=""/>
			<table border="0" align="center" cellpadding="0" cellspacing="0">
				<tr>
					<td height="8"></td>
				</tr>
			</table>

			<div class='awp_detail'>
				<table>
					<tr>
						<td>
							<font color="red">*</font>�����룺
						</td>
						<td>
							<html:text property="categorytype" size="30" styleClass="text_white" onkeyup="value=value.replace(/[^\w\.\/]/ig,'')"/>
						</td>
					</tr>
					<tr>
						<td>
							<font color="red">*</font>������ƣ�
						</td>
						<td>
							<html:text property="categorytypename" size="30" styleClass="text_white" />
						</td>
					</tr>
					
					<tr>
						<td>
							<font color="red">*</font>�Ƿ����ã�
						</td>
						<td>
						  <html:select property="isquote" onchange="quotechange(this.value);">
                             <html:options collection="isMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
					
					<tr id="quote" style="display:none">
						<td>
							<font color="red">*</font>�������ͣ�
						</td>
						<td>
						 <html:select property="quotetype">
                             <html:options collection="categorytypeMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
					
					 <tr id="levelarea" >
		              <td> ���㼶��</td>
		              <td>
		                <html:text property="level"  size="10" styleClass="text_white" styleId="level"></html:text>
		                <input type="button" value="ȷ��" onclick="display();"/>
		              </td>
		            </tr>
		            
		             <tr id="levelcode" style="display:none">
			              <td> �㼶���룺</td>
			              <td id="code">
				             <div class='awp_detail_bgz'>
				               		<table id="tableid">
										<tr align="center">
											<td align="center" noWrap>
												�㼶
											</td>
											<td align="center" noWrap>
												�ָ���
											</td>
											<td align="center" noWrap>
												ǰ׺
											</td>
											<td align="center" noWrap>
												λ��
											</td>
										</tr>
										<div id="add"></div>
									</table>
							</div>
					     </td>
           			 </tr>
           			 
					<tr>
						<td>
							<font color="red">*</font>״̬��
						</td>
						<td>
						  <html:select property="flag">
                             <html:options collection="flagMap" property="label" labelProperty="value"/>
                         </html:select>
						</td>
					</tr>
				
					<tr>
						<td>
							���������
						</td>
						<td>
							<html:textarea property="desc" cols="60" rows="6" />
							
						</td>
					</tr>
				    <tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="�� ��" OnClick="checkForm('t12_category_add_do.do')">
							<html:reset styleClass="input" value="�� ��"/>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
	<script language="JavaScript">
	displaylayer();
</script>
</body>
</html:html>
