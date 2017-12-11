<%@ page language="java" pageEncoding="GBK"%>
<%@ taglib uri="http://struts.apache.org/tags-bean" prefix="bean"%>
<%@ taglib uri="http://struts.apache.org/tags-html" prefix="html"%>
<%@ taglib uri="http://struts.apache.org/tags-logic" prefix="logic"%>
<%@ taglib uri="http://struts.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

<html:html lang="true">
<head>
    <META http-equiv=Content-Type content="text/html; charset=GBK">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
</head>
 <SCRIPT LANGUAGE="JavaScript"> 
  function displaylayer(){
	  	var type = '<c:out value="${t12_category.isquote}"/>';
	  	//�����������
	  	if(type == "0"){
	  		var obj = document.getElementById("levelcode");
	  		var areaobj = document.getElementById("levelarea");
	  		obj.style.display="";
	  		areaobj.style.display="";
	  	}else{
	  		var quoteobj = document.getElementById("quotetype");
	  		quoteobj.style.display="";
	  	}
	  }
</SCRIPT>
<body leftmargin="0" topmargin="0">
    <div id='content'>
        <html:form method="POST" action="/businessmanager/t12_category/t12_category_disp.do">
            <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">������ϸ</span>
                        </td>
                        <td align="right">
                            <html:button property="closebutton" value="�� ��" onclick="window.close()" />
                        </td>
                    </tr>
                </table>
            </div>

            <div class='awp_detail'>
                <table>
                    <tr>
                        <td align="right">
                            �����룺
                        </td>
                        <td>
                            <bean:write name="t12_category" property="categorytype" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ������ƣ�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="categorytypename" scope="request" />
                        </td>
                    </tr>
                  
                    <tr>
                        <td width="160" align="right">
                            ��ţ�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="dispseq" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td width="160" align="right">
                            �Ƿ����ã�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="isquote_disp" scope="request" />
                        </td>
                    </tr>
                    <tr id="levelarea" style="display:none">
                        <td >
                            �㼶��
                        </td>
                        <td>
                            <bean:write name="t12_category" property="level" scope="request" />
                        </td>
                    </tr>
                    <logic:present name="list">
	                      <tr id="levelcode" style="display:none">
	                         <td> �㼶���룺</td>
			                 <td >
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
									<logic:iterate id="code" name="list" indexId="index"
										type="com.ist.cms.dto.T12_article_coderule">
										<tr align="center">
											<td align="center">
											 <%
											   java.util.ArrayList list = (java.util.ArrayList)request.getAttribute("list");
											   if(index.intValue()+1 != list.size()){
											 %>
													<%=index.intValue()+1 %>��
											<%}else{ %>
														���±��뼶
											<%} %>
											</td>
											<%
												if(index.intValue()+1 == 1){
											 %>
											 <td>
												
											 </td>
											 <%}else{ %>
											<td align="center">
												<bean:write name="code" property="separator_disp" scope="page" />
											</td>
											 <%} %>
											<td align="center">
												<bean:write name="code" property="pre_disp" scope="page" />
											</td>
											<td align="center">
											 <bean:write name="code" property="codedigit" scope="page" />
											</td>
										</tr>
									</logic:iterate>
								</table></div>
			              </td>
	                    </tr>
                    </logic:present>
                    
                    <tr id="quotetype" style="display:none">
                        <td width="160" align="right">
                            �������ͣ�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="quotename" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ״̬��
                        </td>
                        <td>
                            <bean:write name="t12_category" property="flag_disp"
                                scope="request" />
                        </td>
                    </tr>

                    <tr>
                        <td align="right">
                            ������
                        </td>
                        <td>
                            <bean:write name="t12_category" property="desc" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            �����ˣ�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="creator" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            ����ʱ�䣺
                        </td>
                        <td>
                            <bean:write name="t12_category" property="createdate" scope="request" />
                        </td>
                    </tr>

                    <tr>
                        <td align="right">
                            �޸��ˣ�
                        </td>
                        <td>
                            <bean:write name="t12_category" property="modifier" scope="request" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            �޸�ʱ�䣺
                        </td>
                        <td>
                            <bean:write name="t12_category" property="modifydate"
                                scope="request" />
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
