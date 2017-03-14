<%@ page contentType="text/html; charset=GBK"%>
<%@page import="java.util.*"%>
<%@page import="com.ist.bmp.hpom.dto.*"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<head>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">

		<META content="MSHTML 6.00.2600.0" name=GENERATOR>
		<link id="skincss" href="<%=request.getContextPath()%>/css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.js"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/calendar.js"></script>
			
			<script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/jquery.autocomplete.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
	
	function dosubmit(theUrl,type){
		 var errMsg = "";
		 var isSub = false;
		 if(type == 'modi'){		
			 
			 if(RadioMustChecked(document.forms[0])){				
				 errMsg = "��ѡ��";
			}
			 isSub = true;
		}   
		 if(type == 'back'){
			isSub = true;
		}  
		 if(type == 'search'){
			 if(document.forms[0].statisticdate.value == ""){
				alert("��ѡ������ʱ�䣡");
				return false;
			}			
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
	<script type="text/javascript">
	var jq = jQuery.noConflict();
	jq(document).ready(function(){
		jq('.awp_art02 table').each(function(){
		    
		     var artab = jq(this);
			 
			 jq('tr:first td',artab).addClass('tir b-r');
			 jq('td',artab).addClass('b-b');
			 jq('tr:gt(0) td:nth-child(odd)',artab).addClass('viewimgbg');
			 jq("tr:gt(0) td[innerHTML!='']",artab).removeClass('viewimgbg').addClass('tir2 b-r');
			 
			 jq('tr',artab).each(function(){jq('td:last',jq(this)).css('border-right','0')});
			 
			 jq('tr:gt(0)',artab).each(function(){
		        var trgt0 = jq(this);
				var view = jq("td[class*='art_']",trgt0);
				
				view.removeClass('tir2').attr('name','viewimg');
				
				view.prev("td[name!='viewimg']").next().html('<div name="imgl" />');
				view.next("td[name!='viewimg']").prev().html('<div name="imgr" />'); 
				view.prev("td[name!='viewimg']").next().next("td[name!='viewimg']").prev().html('<div name="imgl" /><div name="imgr" />');
				
				jq('.art_blue div[name="imgl"]').removeClass().addClass('blue_l');
				jq('.art_blue div[name="imgr"]').removeClass().addClass('blue_r');
				
				jq('.art_red div[name="imgl"]').removeClass().addClass('red_l');
				jq('.art_red div[name="imgr"]').removeClass().addClass('red_r');
				
				jq('.art_green div[name="imgl"]').removeClass().addClass('green_l');
				jq('.art_green div[name="imgr"]').removeClass().addClass('green_r');
			  
			 });
			 //������
			 if(jq.browser.msie && jq.browser.version<"9.0" && artab.width()> jq(artab.parent()).width()){ artab.css('marginBottom','18px');}else{ artab.css('marginBottom','0')}
			
		});
		  
	});
	
</SCRIPT>
	</head>

	<body>
		<div id='content'>
			<html:form action="/v18_day_detail/v18_day_detail_list.do" method="POST">
				<div class='awp_title'>
					<table>
						<td>
							<span class="awp_title_td2">��������ȱ���</span>
						</td>
<%--						<td width="84%" align="right">--%>
<%--							<input type="button" value="�� ��" onClick="dosubmit('','')" />--%>
<%--						</td>--%>
						</tr>
					</table>
				</div>
<br/>
				<table width="100" border="0" align="center" cellpadding="0"
					cellspacing="0">
					<tr>
						<td height="8">
							<strong>	<font color="#FF0000">*</font>����ʱ�䣺</strong>
							<html:text property="statisticdate" styleClass="text_white"
								size="12" readonly="true" maxlength="10" />
							<img src="<%=request.getContextPath()%>/images/calendar.gif"
								id="img1" style="cursor: hand;" width="16" height="16"
								border="0" align="absmiddle" alt="�������������˵�"
								onClick="new Calendar().show(document.forms[0].statisticdate);">						
							<input type="button" value="�� ѯ" onClick="dosubmit('v18_day_detail_list.do?newsearchflag=1','search')" />
						</td>
					</tr>
				</table>

			<div class="awp_tabpanel" >
					<table>
						<tr>
							<td width="12%">����׼�����</td>
							
						</tr>
					</table>
				</div>
			
			<div class='awp_list'>
					<table>
					  <tr align="center">
                        <TD nowrap>����Դ</td>
					    <TD align="center"> ����׼�� </TD>
					    <TD align="center"> ���ݳ�ȡ </TD>
					    <TD align="center"> ����װ�� </TD>
				      </TR>
				      <%
				      	HashMap dsnameMap = (HashMap)request.getAttribute("dsnameMap")	;					//����Դ����
						HashMap datereadyMap = (HashMap)request.getAttribute("datereadyMap")	;				//����׼��
						HashMap dateextractMap = (HashMap)request.getAttribute("dateextractMap")	;			//���ݳ�ȡ
						HashMap dateloadMap = (HashMap)request.getAttribute("dateloadMap")	; 				//����װ��
						
						Iterator it = dsnameMap.entrySet().iterator();
						while(it.hasNext()){
							Map.Entry entry = (Map.Entry)it.next();
							String dskey = (String)entry.getKey();			
							
							String dsname = (String)dsnameMap.get(dskey);
							String dateready = (String)datereadyMap.get(dskey);
							String dateextract = (String)dateextractMap.get(dskey);
							String dateload = (String)dateloadMap.get(dskey);
						
				      %>
				       <tr align="center">
                        <TD nowrap><%=dsname %></td>
					    <TD align="center"> <%=dateready %> </TD>
					    <TD align="center"> <%=dateextract %> </TD>
					    <TD align="center"> <%=dateload %> </TD>
				      </TR>
				      <%
						}
				      
				      %>
				     </table>
			</div>	
			
			
			
			<table><tr><td height="1%"></td></tr></table>
				<div class="awp_tabpanel" >
					<table>
						<tr>
							<td width="15%">�������������</td>
							
						</tr>
					</table>
				</div>
				
				
				<div class="awp_art02">
					<table border="0" cellpadding="0" cellspacing="0">    
					 	<tr align="center">
							<td nowrap="nowrap">����\����</td>
							<td nowrap="nowrap">10%</td>
							<td nowrap="nowrap">20%</td>
							<td nowrap="nowrap">30%</td>
							<td nowrap="nowrap">40%</td>
							<td nowrap="nowrap">50%</td>
							<td nowrap="nowrap">60%</td>
							<td nowrap="nowrap">70%</td>
							<td nowrap="nowrap">80%</td>
							<td nowrap="nowrap">90%</td>
							<td nowrap="nowrap">100%</td>						
						</tr>
						
						<%
						ArrayList v18_day_detailList = (ArrayList)request.getAttribute("v18_day_detailList");
						if(v18_day_detailList != null && v18_day_detailList.size() >0){
							for(int i=0; i<v18_day_detailList.size(); i++){
								com.ist.bmp.hpom.dto.V18_day_detail dto = (com.ist.bmp.hpom.dto.V18_day_detail)v18_day_detailList.get(i);
								String typename = dto.getTypename();
								int rate = dto.getRate();
								%>
								<tr align="center">
									<td><%=typename %></td>
								<% 
								for(int j=0; j<10; j++){
									if(j<rate){
										%>
										<td class="art_green" width="8%"></td>
										<% 										
									}else{
										%>
										<td width="8%"></td>
										<% 
									}								
								
								}
								%>
								</tr>
								<%						
								
							}
						}
						%>
					</table>
				</div>
				
				<div class="viewExplain">    
	 <img src="<%=request.getContextPath()%>/skin/blue/images/art_greenicon.gif" /> ��ɽ���
   </div>

			</html:form>
		</div>
	</body>
</html>