<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.HashMap"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=GBK">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet"
			type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
	
		<script type="text/javascript">
	
		   function _dosubmit2(theurl)
		   {
		     document.forms[0].action=theurl;
		     document.forms[0].submit();
		   }
	   
	   </script>
	</HEAD>
<BODY>
<div id="main">
	<html:form method="POST"
			action="/lipmanager/t20_list_search_type.do">
			<html:hidden property="tablecode"/>
			
			<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span>������������ - <%=(String)request.getAttribute("title") %></span>
					</div>
			</div>
			
		<div id="bigTab">
										
					<dl class="tabm">
						<dd >
							<span onclick="_dosubmit2('t20_list_search_all.do?newsearchflag=2')">ȫ�ļ���</span>
						</dd>
						<dd class="tabcur">
							<span >�������</span>
						</dd>
				  </dl>
		 </div>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="false"/>
			</html:messages>
			
		   <div class="cond_c">
				
				<table>
				
				<%  List condList_page =(List)request.getAttribute("condList"); 
								
				  if (condList_page==null) condList_page=new ArrayList();
				  
				  int condCount=condList_page.size();
				  String condFlag="";
				    if (condCount%2==1)
				    {
						condFlag="odd";				    
				    }else
				    {
				    	condFlag="even";
				    }
				    
				    Map condValueMap = (Map)request.getAttribute("condValueMap");
							if(condValueMap == null) {
						        condValueMap = new HashMap(); 
						    }
				
				
				%>
					<bean:define id="condFlag_p" value="<%=condFlag%>"></bean:define>
					<logic:iterate id="cond" name="condList" type="com.ist.aml.lip.dto.T00_list_cols" indexId="i">
				<%
					Map condTabKeyMap=(Map)request.getAttribute("condTabKeyMap"); 
						String colkey=cond.getColkey();
				
					//ArrayList condTabKeyList=(ArrayList)condTabKeyMap.get(colkey);
					Object condObj=condTabKeyMap.get(colkey);
					//pageContext.setAttribute("condTabKeyList", condTabKeyList, PageContext.PAGE_SCOPE);
					pageContext.setAttribute("condObj", condObj, PageContext.PAGE_SCOPE);
				
				    int my_i = i.intValue()%2;				    
				    String my_str =(new Integer(my_i) ).toString();
				    
				    Object obj =  condValueMap.get(colkey);
					 if(obj == null)obj = "";
					 String value = obj.toString();
					 
					String value_disp ="";
				     if(condValueMap.containsKey(colkey+"_disp")) {
				     	value_disp = (String)condValueMap.get(colkey+"_disp");
				     }
				    
				    /** �����������Сֵ */
					 String value_min = "";
					 if(condValueMap.containsKey(colkey+"_min")) {
						    value_min = (String)condValueMap.get(colkey+"_min");
						}
							    
					 /** ������������ֵ */
					 String value_max = "";
				 	 if(condValueMap.containsKey(colkey+"_max")) {
							value_max = (String)condValueMap.get(colkey+"_max");
					 }
				    
				    
				     %>
			    	<bean:define id="index" value="<%=my_str%>"></bean:define>
					           
            		<logic:equal value ="0" name="index" >
            		
               		 <tr>
               		</logic:equal>
               		
					
					
					<td>
					<bean:write name="cond" property="colname"  />
							��
					</td>
					<!-- ����������� -->
					<logic:notEqual value="ORDER_BY" name="cond" property="colkey">
					<td>
					<logic:equal value="1" name="cond" property="conddisp">
					<input type="text"	name="<bean:write name="cond" property="colkey"/>" value="<%=value %>" style="height:22px" size="32"/>
					</logic:equal>
					<logic:equal value="2" name="cond" property="conddisp">
					
					
					
					<select  name="<bean:write name="cond" property="colkey"/>">
							<option value="">--��ѡ��--</option>
							<logic:iterate id="option" name="condObj" >
							<option value="<bean:write name="option" property="key"/>" 
							<%if(option.toString().indexOf(value)!=-1&&!value.equals("")) {%> selected="selected"<%} %>>
							<bean:write name="option" property="value"/></option>
							</logic:iterate>
							
					</select>
					
					</logic:equal>
					
					<logic:equal value="3" name="cond" property="conddisp">
					<input name="<bean:write name="cond" property="colkey"/>" type="hidden" value="<%=value %>" />
					<input  readonly="readonly" type="text" name="<bean:write name="cond" property="colkey"/>_disp" value="<%=value_disp%>" style="height:22px" size="24"/>
					
					<input type="button" name="child" value="�� ѡ" class="in_button1"
					onclick="locate_pop_window('<%= request.getContextPath()%>','t00_categoryLocation','checkbox','forms[0]','<bean:write name="cond" property="colkey"/>,<bean:write name="cond" property="colkey"/>_disp','<bean:write name="condObj" filter="false"/>');"/>
					
					</logic:equal>
					
					<logic:equal value="4" name="cond" property="conddisp">
					
						<input type="text"	name="<bean:write name="cond" property="colkey"/>_min" value="<%=value_min%>" style="height:22px"	size="10"/>
						
					<img src="<%=request.getContextPath()%>/images/calendar.gif"
						 style="cursor:hand;" width="16" height="16" border="0"
						 alt="�������������˵�"
						 onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_min);" />
						 -
						<input type="text"
						name="<bean:write name="cond" property="colkey"/>_max" value="<%=value_max%>" style="height:22px"	 size="10"/>
				   <img src="<%=request.getContextPath()%>/images/calendar.gif"
						style="cursor:hand;" width="16" height="16" border="0"
						alt="�������������˵�"
						onclick="new Calendar().show(document.forms[0].<bean:write name="cond" property="colkey"/>_max)" />
					</logic:equal>
										
					</td>
					</logic:notEqual>
					
					<!-- ������� -->
						<logic:equal value="ORDER_BY" name="cond" property="colkey">
							<td>
								<html:select property="sort_column">
									<html:options collection="sortColumnList" property="label"
										labelProperty="value" />
								</html:select>
								&nbsp;
								<html:radio property="sort_type" value="asc">����</html:radio>
								<html:radio property="sort_type" value="desc">����</html:radio>
								<html:radio property="sort_type" value="">������</html:radio>

							</td>
						<logic:equal value="odd"  name="condFlag_p">
						<td></td>
						<td align="left"><html:button property="button" styleClass="in_button1" value="�� ѯ"
											onclick="_dosubmit2('t20_list_search_type.do?newsearchflag=1')" /></td>
						</tr>
						</logic:equal>	
						<logic:notEqual value="odd" name="condFlag_p">
						<tr>
						<td></td>
						<td></td>
						<td></td>
						<td align="left"><html:button property="button" styleClass="in_button1" value="�� ѯ"
											onclick="_dosubmit2('t20_list_search_type.do?newsearchflag=1')"/></td>
						
						</logic:notEqual>
							
						</logic:equal>
						
					
					
             		 
             		<logic:equal value ="1" name="index" >
            		   </tr>
               		</logic:equal>
             		 
					</logic:iterate>
					
					
				</table>
				
			</div>
			
			<div class="list">
				<table>
				 	<tr>
						<th>����</th>
						
						<logic:iterate id="col" name="showColList"
							type="com.ist.aml.lip.dto.T00_list_cols">
						
									<Th align="center" nowrap >
										<bean:write name="col" property="colname" />
									</Th>
							
						</logic:iterate>
						
					</tr>
					
					
					
				 	<logic:iterate id="result" name="resultList" type="java.util.List"
						indexId="seq">
						
						
						<% String pk=(String)result.get(0);%>
						
						<TR>
						
							<logic:iterate id="value" name="result" type="java.lang.String"
								indexId="i">
								
							<bean:define id="ii" value="<%=i.toString()%>"></bean:define>
							<logic:equal value="0" name="ii" >
							<td align="center" nowrap>
							 <% String url=request.getContextPath()+"/list/lipmanager/t20_list_details.do?party_id="+pk+"&tablecode="+(String)request.getAttribute("tablecode");%>
							<a onClick="window.open('<%=url%>','��ϸ','height=600,width=600,left=300,top=100,scrollbars=yes,resizable=yes');">��ϸ</a> 
							 </td>
							</logic:equal>
							
							
							<logic:notEqual  value="0" name="ii">
									<TD align="center" nowrap >
										<bean:write name="value" scope="page" />
									</TD>
							</logic:notEqual>
							
							</logic:iterate>
							
							
							
						</TR>
					</logic:iterate>
				</TABLE>
			</div>
			
			<div class='list_page'>
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
	
</BODY>

</HTML>

