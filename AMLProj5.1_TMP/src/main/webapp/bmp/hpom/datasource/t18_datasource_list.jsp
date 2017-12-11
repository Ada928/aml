<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<HEAD>
		<meta http-equiv=Content-Type content="text/html; charset=gb2312"/>

		<meta content="MSHTML 6.00.2600.0" name=GENERATOR/>
         <link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/aml.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
		<SCRIPT LANGUAGE="JavaScript">
		
		
		function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){ 
				 if(checkRadio(document.forms[0].select_dskey)<0){
				   alert("��ѡ��!");
				   return false;
				 }else{
				 	isSub = true;
				 }
			  }
		    else if(type=='del'){
		    	if(checkRadio(document.forms[0].select_dskey)<0){
				   alert("��ѡ��!");
				   return false;
				 }else{
		            if(confirm('�����Ҫɾ��ѡ�������')){
		                isSub = true;
		            }
				 }
		    }else if(type=='deploy'){
		    	if(checkRadio(document.forms[0].select_dskey)<0){
					   alert("��ѡ��!");
					   return false;
				}
		    	if(confirm('ȷ��Ҫ������')){
		             isSub = true;
		        }
		        
		    }
		    else if(type=='cancel'){
		    	if(checkRadio(document.forms[0].select_dskey)<0){
					   alert("��ѡ��!");
					   return false;
				}
		       
	            if(confirm('ȷ��Ҫ����������')){
	                isSub = true;
	            }
		       
		    }
		    else if(type=='add'){
		    	isSub = true;
		    }
		    else if(type=='search'){
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
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	
		<html:form
			action="/hpom/t18_datasource_list.do"
			method="POST">
			<div id='main'>
             <div class="conditions">
				<div class="cond_t">
				   <span>�ⲿ����Դ����     - �б�</span>
				   <span class="buttons">
				      <a href="#" id="hdd_display" class="bt_hidden"></a>
				      <a href="javascript:void(0);" onclick="dosubmit('t18_datasource_add.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
				      <a href="javascript:void(0);" onclick="dosubmit('t18_datasource_modify.do','modi');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
				      <a href="javascript:void(0);" onclick="dosubmit('t18_datasource_delete_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
					  <a href="javascript:void(0);" onclick="dosubmit('t18_datasource_deploy.do?isdeploy=1','deploy');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />��������</a>
					  <a href="javascript:void(0);" onclick="dosubmit('t18_datasource_deploy.do?isdeploy=0','cancel');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_re_refused.png" />��������</a>
					  
				   </span>
				</div>
			     
			<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle"/>
			</html:messages>
			<div class='cond_c' id="searchtable">
					 <table border="0" cellpadding="0" cellspacing="0"> 
						<tr>
							<td>
								����Դ���ƣ�
							</td>
							<td>
								<html:text property="dsname" styleClass="text_white" size="30" />
							</td>
							<td>
								ODS���ݱ�ǰ׺��
							</td>
							<td>
								<html:text property="odsprefix" styleClass="text_white" size="30" />
							</td>
						</tr>
						<tr>
							<td>
								��ʶ�ļ�λ�ã�
							</td>
							<td>
								<html:select property="flaglocation">
									<html:options collection="flaglocationMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td>
								��ʶ���
							</td>
							<td >
								<html:select property="flagtype">
									<html:options collection="flagtypeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
								�Ƿ���Ҫȡ����
							</td>
							<td>
								<html:select property="isget">
									<html:options collection="isgetMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							<td>
								ȡ����ʽ��
							</td>
							<td >
								<html:select property="getmode">
									<html:options collection="getmodeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>
						<tr>
							<td>
							ж�ط�ʽ��
							</td>
							<td>
								<html:select property="fetchmethod" >
									<html:options collection="fetchMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
							
							
							<td>
								������ʽ��
							</td>
							<td >
								<html:select property="putmode">
									<html:options collection="putmodeMap" property="label"
										labelProperty="value" />
								</html:select>
							</td>
						</tr>	
						<tr>
							<td>
								����
							</td>
							<td >
								<html:select property="sort">
									<html:options collection="sortMap" property="label"
										labelProperty="value" />
								</html:select>
								&nbsp;
								<html:radio property="sort_type" value="asc">����</html:radio>
								<html:radio property="sort_type" value="desc">����</html:radio>
								<html:radio property="sort_type" value="">������</html:radio>
							</td>	
							<td>�Ƿ��Ѳ���������</td>
							<td>
							<html:select property="isdeploy"  >
								<html:options collection="map" property="label"
									labelProperty="value" />
							</html:select>
							</td>
							
						</tr>
						<tr>
							<td>
							</td>
							<td>
							</td>
							<td>
							</td>
							<td>
								<input type="button" name="button" value="�� ѯ"
									onClick="dosubmit('t18_datasource_list.do?newsearchflag=1','search')"
									class="in_button1">
							</td>
						</tr>
					</table> 
				</div>
			</div>	
			<div class='list'>
			<table>
				<tr align="center">
	         		<th noWrap>
						��ѡ��
					</th>
					<th noWrap>
						����Դ����
					</th>
					<th noWrap>
						ODS���ݱ�ǰ׺
					</th>
					<th noWrap>
						��ʶ�ļ�λ��
					</th>
					<th noWrap>
						��ʶ���
					</th>
					<th noWrap>
						�Ƿ���Ҫȡ��
					</th>
					<th noWrap>
						ȡ����ʽ
					</th>	
					<th noWrap>
						������ʽ
					</th>
					<th noWrap>
						ж�ط�ʽ
					</th>
					<th noWrap>
						�Ƿ��Ѳ�������
					</th>
					<th noWrap>
						����ʱ��
					</th>
					<th noWrap>
						��ע
					</th>	
						
				</TR>
				<logic:notEmpty name="t18_datasourceList">
				 <logic:iterate id="dto" name="t18_datasourceList"
					type="com.ist.bmp.hpom.dto.T18_datasource">
					<%
								java.util.HashMap map = new java.util.HashMap();
								map.put("dskey", dto.getDskey());
								pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
					%>
					<TR align="center" >
						<TD noWrap>
							<input type="radio" name="select_dskey" value="<bean:write name="dto" property="dskey"/>"/>
							
						</TD>

						<TD noWrap>
							<html:link name="map" page="/hpom/t18_datasource_disp.do">
								<bean:write name="dto" property="dsname" scope="page" />
							</html:link>
							
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="odsprefix" />
						</TD>
						
						<TD noWrap>
							<bean:write name="dto" property="flaglocation_disp" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="flagtype_disp" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="isget_disp" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="getmode_disp" />
						</TD>
						<TD noWrap align="left">
							<bean:write name="dto" property="putmode_disp"  />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="fetchmethod_disp"  />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="isdeploy_disp"  />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="deploytime"  />
						</TD>						
						<TD >
							<bean:write name="dto" property="des"  />
						</TD>

					</TR>
				</logic:iterate>
				</logic:notEmpty>
			</TABLE>
		</div>
		<!-- list_page --> 
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
		    </div>
		</html:form>
		
	</BODY>
</HTML>
