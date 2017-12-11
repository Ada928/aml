<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>

<html>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<SCRIPT LANGUAGE="JavaScript"> 
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
		            if(confirm('�����Ҫɾ��ѡ���������')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type='add'){
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
		function selectAllCheckBox(objElement,currentForm){
			var strInnerText = "";
			var isSelectAll = false;
			if(currentForm){
				for(var i=0;i<currentForm.elements.length;i++){
					var formElement = currentForm.elements[i];
					if(formElement.type=="checkbox" && !formElement.disabled){
						formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
						isSelectAll = formElement.checked;
					}						
				}
				strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
				objElement.innerText = strInnerText;
			}
		}
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<html:form action="/dblink/metadata_link_list.do" method="POST">
		<div id="main">
		<!-- conditions --> 
		  <div class="conditions">
		    <!-- title -->
		    <div class="cond_t">
			    <span>���ݳ�ȡ����DBLINK��</span>
			    <span class="buttons">
					<a href="#" onclick="dosubmit('metadata_link_add.do','add')"><img src="../../images/<bean:write name="style"/>/b_add.png" />�� ��</a>
					<a href="#" onclick="dosubmit('metadata_link_modify.do','modi')"><img src="../../images/<bean:write name="style"/>/b_edit.png" />�� ��</a>
					<a href="#" onclick="dosubmit('metadata_link_delete_logic_do.do','del')"><img src="../../images/<bean:write name="style"/>/b_delete.png" />ɾ ��</a>
			 	</span>
			</div>
			
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<div class="list">
				 <table border="0" cellspacing="0" cellpadding="0">
					<TR >
						<th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
						<th noWrap>
							Springע��ID
						</th>
						<th noWrap>
							��������
						</th>
						<th noWrap>
							���ݿ�����
						</th>
						<th noWrap>
							URL
						</th>
						<%--<th noWrap>
							�û���
						</th>
						
						--%><th noWrap>
							��ռ�
						</th>
						<th noWrap>
							�����ռ�
						</th>
						<th noWrap>
							״̬
						</th>
						<th noWrap>
							��ʾ���
						</th>					
					</TR>
					<logic:iterate id="dto" name="t01_db_linkList"
						type="com.ist.common.metadata.dto.T01_db_link">
						<%
									java.util.HashMap map = new java.util.HashMap();
									map.put("dblinkkey", ""+dto.getDblinkkey());
									pageContext.setAttribute("map", map, PageContext.PAGE_SCOPE);
						%>
						<TR >
							
							<TD >
								<html:multibox property="selecteddblink">
									<bean:write name="dto" property="dblinkkey" />
								</html:multibox>
							</TD>
							<TD ><bean:write name="dto" property="dblinkkey" /></TD>
							<TD >
								<html:link name="map" page="/dblink/metadata_link_disp.do">
									<bean:write name="dto" property="dblinkname" scope="page" />
								</html:link>
							</TD>
							<TD>
								<bean:write name="dto" property="dbtype_disp" scope="page" />
							</TD>
							<TD>
								<bean:write name="dto" property="dburl" scope="page" />
							</TD>
							<%--<TD>
								<bean:write name="dto" property="dbuser" scope="page" />
							</TD>
							
							--%><TD>
								<bean:write name="dto" property="itablespace" scope="page" />
							</TD>
							<TD>
								<bean:write name="dto" property="indexname" scope="page" />
							</TD>
							<TD>
								<bean:write name="dto" property="flag_disp" scope="page" />
							</TD>
							<TD>
								<bean:write name="dto" property="dispseq" scope="page" />
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
	    		<div class="sys_warning">
					<strong><img src="../../images/blue/warning.png" />�ڲ����ݿ����Ӳ��裺</strong><br/>
					1�����ñ����ܴ������ݿ�������Ϣ��<br/>
					2����Spring�����ļ��У��������ݿ�����������Ϣ��<br/>
					3����Ӧ�÷��������������ݿ����ӵ�Datasource��Ϣ��
				</div>
			</div>
			</div>
		</html:form>
	</BODY>
</HTML>
