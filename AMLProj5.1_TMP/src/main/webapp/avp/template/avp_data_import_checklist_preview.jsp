<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html>
<HEAD>
	<META http-equiv=Content-Type content="text/html; charset=gb2312">
	<META content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script language="JavaScript" src="<%=request.getContextPath()%>/js/lib.js"></script>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	
	<script language="JavaScript">
	   function checkForm(theUrl){
	    //alert("123456");
	    var objTab = document.getElementById("tableid");
		var len=objTab.rows.length;
		//alert("len:" + len);
		if(len <= 1) {
		    alert("δ��������Ϣ��");
		    return "";
		}
		var columnListStr="";
		var colkey1 ="";
		var colkey2 ="";
		for(var rowNo=1;rowNo<len;rowNo++){		
			var obj = objTab.rows[rowNo];
			var result = getTr(obj);
			if(result.indexOf(",") ==-1)continue;
			colkey1+=result.substring(0,result.indexOf(",")) + ",";
			colkey2+=result.substring(result.indexOf(",")+1) + ",";
		}
		
		if(colkey1 =='' || colkey2 =='') {
		    alert("δ��������Ϣ��");
		    return false;
		}
		if(colkey1.length > 0)colkey1 = colkey1.substring(0,colkey1.length-1);
		if(colkey2.length > 0)colkey2 = colkey2.substring(0,colkey2.length-1);
		
		columnListStr = colkey1 + ";" + colkey2;
		document.getElementById("columnListStr").value=columnListStr;
		//alert("columnListStr:"+document.getElementById("columnListStr").value);
		//return false;
		document.forms[0].action=theUrl;
		document.forms[0].submit();
	}
	
	//���ؽ��:�ֶ�����$�ֶγ���$�ֶξ���$�Ƿ�����$�ֶ�����
	function getTr(obj) {//У��һ��	    
	    var colkey = "";
	    var checkFlag = false;
	    var inputArray = obj.getElementsByTagName("input");
	    for(i=0;i <inputArray.length;i++) {//�ı����
		   var name = inputArray[i].name;
		   var value = inputArray[i].value;
		   
		   if(inputArray[i].type == 'checkbox') {
		        if(inputArray[i].checked) {
		            checkFlag = true;
		        }		        
		   }

		   if(name == 'key') {//�ֶ���
		       colkey = value;
		   }	   
        } 
        
        if(!checkFlag) return "";
        
        var selectArray = obj.getElementsByTagName("select");
        for(i=0;i <selectArray.length;i++) {//���������
           var name = selectArray[i].name;
           var value = selectArray[i].value;
		   if(name == 'columncode') {//
		      colkey+=","+value;
		   }
        }
        
        //alert("colkey:"+colkey);
        return colkey;
	}
	
	
	function controlSelectedColumn(obj) {
	    var trObj = obj.parentNode.parentNode;
	    var selectObj = trObj.getElementsByTagName("select");
	    for(i=0;i <selectObj.length;i++) {//���������
	        if(obj.checked) {
	            selectObj[i].disabled = false;
	        }else {
	            selectObj[i].disabled = true;
	        }
	    }
	}
	</script>
</head>

<body leftmargin="0" topmargin="0">
<div id='content'>
	<html:form action="/template/importCheckListPreview.do"  method="POST">
	<html:hidden property="begin_no"/>
	<html:hidden property="end_no"/>
	<html:hidden property="columnListStr" styleId="columnListStr"/>
	<html:hidden property="targetkey"/>
	<c:out value="${hideCondHtmlStr}" escapeXml="false"></c:out>
	<c:out value="${awp_avp_tpla_session}" escapeXml="false"></c:out>
	<input type="hidden" value="<c:out value="${labelStr}" />" name="labelStr" />
	<div class="awp_title">
                <table>
                    <tr>
                        <td align="left"  width="10%" >
                            <strong>�����嵥�ֶ�����</strong>
                        </td>
                        <td align="right"   >
                            <input type="button" name="btsearch2" value="�� ��"
									onclick="checkForm('avp_data_import_checklist_do.do');" />								
				    <input type="button" name="btsearch2" value="�� ��"
									onclick="history.back();" />
                        </td>
                    </tr>
                </table> 
      </div>
      
      
	
      <html:messages id="errors" message="true">
         <bean:write name="errors" filter="fasle"/>
      </html:messages>
      
   
      
      <div class='awp_list'>
	    <table id="tableid">
	         <tr align="center">
	                <td noWrap style="display:none">
						�嵥�ֶ�KEY
					</td>
	                <td noWrap>
						�嵥�ֶ�����
					</td>
					<td noWrap>
						�嵥�ֶγ���
					</td>
					<td noWrap>
						ѡ���Զ������ֶ�
					</td>
					<td noWrap>
						������
					</td>
	         </tr>
		     <logic:iterate id="map" name="columnList" type="java.util.Map">
					<tr align="center">
					<logic:iterate id="column" name="map"  indexId="i" >
					   <logic:equal value="COLUMN_NAME" name="column" property="key">
					        <td style="display:none">
					            <input type="text" name="key" value="<bean:write name="column" property="value"/>"/>
					        </td>
					   </logic:equal>
					   <logic:equal value="COLUMN_COMMENT" name="column" property="key">
					        <td >
					            <bean:write name="column" property="value"/>
					        </td>
					   </logic:equal>
					   <logic:equal value="COLUMN_LENGTH" name="column" property="key">
					        <td >
					            <bean:write name="column" property="value"/>
					        </td>
					   </logic:equal>
					    
					</logic:iterate>
					  <td>
					      <html:select property="columncode" >
					          <%--�ж������������Ƿ���ͬ����ӳ���ϵ --%>
				      	  	   <c:forEach var="col" items="${customColumnMap}">
				      	  	   	<c:choose>
				      	  			<c:when test="${col.value eq comment}">
				      	  				 <option value='<c:out value="${col.key}"/>' selected="selected">
		                          			<c:out value="${col.value}"/>
		                        		  </option>
				      	  	   		</c:when>
				      	  	   		<c:otherwise>
				      	  	   			 <option value='<c:out value="${col.key}"/>'>
		                          			<c:out value="${col.value}"/>
		                        		  </option>
				      	  	   		</c:otherwise>
				      	  	   	</c:choose>			                       
		                      </c:forEach>
					      </html:select>
					  </td>
					  <td>
					     <input type="checkbox" name="cont" checked="checked" onclick="controlSelectedColumn(this)">
					  </td>
					</tr>
				</logic:iterate>
		</table>
	 </div>		   
	</html:form>
	</div>
</body>
</html:html>
