<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
        <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
		<SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
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
		            if(confirm('�����Ҫɾ��ѡ�������')){
		                isSub = true;
		            }
		        }
		    }
		    else if(type=='add'){
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
		  function doRefesh(){	
		  		var tkey = document.forms[0].tablekey.value;
		        var theUrl='<%=request.getContextPath() %>/cmp/column/metadata_cols_list.do';	
				theUrl=theUrl+'?tablekey='+tkey+'&isroot=<%=request.getAttribute("isroot")%>&newsearchflag=1 ';
				location.href=theUrl;  
		} 
		  function openChildWin(theUrl){

				window.open(theUrl, '', 'height=250, width=450,left=50,top=30,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');	
				}
		</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
	<div id='content'>
		<html:form
			action="/column/metadata_cols_list.do"
			method="POST">

			<html:hidden name="t01_mt_property" property="tableename" />
			<html:hidden name="t01_mt_property" property="tablekey" />
			<html:hidden name="t01_mt_property" property="categorykey" />
            <div class="conditions">
					<div class="cond_t">
					   <span>Ԫ���ݹ��� - �� - ����Ϣ</span>
					   <span class="buttons">
					                <a href="javascript:void(0);" onClick="locate_order_window('<%=request.getContextPath()%>','<%=request.getAttribute("keys") %>','<%=request.getAttribute("names") %>','t01_mt_col_pro','colkey','dispseq');"><img src="../../images/<%=session.getAttribute("style")%>/b_susnot.png" />����</a>
							    	<a href="javascript:void(0);" onclick="dosubmit('metadata_cols_batch_add.do','add');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_add2.png" />����ά��</a>
								    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_addnewpage.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_add.png" />�� ��</a>
									<a href="javascript:void(0);" onclick="dosubmit('metadata_cols_modify.do','modi');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
								    <a href="javascript:void(0);" onclick="dosubmit('metadata_cols_delete_do.do','del');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
							    	<a href="javascript:void(0);" onclick="dosubmit('metadata_cols_test_do.do?newsearchflag=1','add');return false;"><img src="../../images/<%=session.getAttribute("style")%>/b_check.png" />����</a>
							    	<logic:equal value="1" name="isroot">
							    	<a href="javascript:void(0);" onclick="dosubmit('../table/metadata_tab_list.do?isroot=1','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
							    	</logic:equal>
							    	<logic:notEqual value="1" name="isroot">
							    	<a href="javascript:void(0);" onclick="dosubmit('../table/metadata_tab_list.do','add');return false;"><img src="../../images/<%=session.getAttribute("style") %>/b_back.png" />�� ��</a>
							    	</logic:notEqual>
					   </span>
					</div>

			<table width="98%" align="center" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="30" valign="bottom">
						��Ӣ������
						<bean:write name="t01_mt_property" property="tableename" />
						����������
						<bean:write name="t01_mt_property" property="tablecname" />					
					</td>
				</tr>
			</table>


<html:messages id="errors" message="true">
<bean:write name="errors" filter="fasle"/>
</html:messages>

			<div class='list'>
			<table>
		<tr align="center">
	          <th width="2%" nowrap onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>

					<th noWrap>���</th>
					<th noWrap>
						Ӣ������
					</th>
					<th noWrap>
						��������
					</th>					
					<th noWrap>
						��������
					</th>
					<th noWrap>
						״̬
					</th>
					<th noWrap>
						�Ƿ����
					</th>
					<th noWrap>
						��Ӧ��ֵ
					</th>
					<th noWrap>
						����
					</th>
				</TR>

				<logic:iterate id="dto" name="t01_mt_col_proList" indexId="index" offset="0"
					type="com.ist.common.metadata.dto.T01_mt_col_pro">

					<TR align="center" >
						<TD noWrap>
							<html:multibox property="colkeys">
								<bean:write name="dto" property="colkey" />
							</html:multibox>
						</TD>
						<TD noWrap><%=index.intValue()+1%></TD>

						<TD noWrap>
							<bean:write name="dto" property="colename" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="colcname" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="coltype" />
						</TD>

						<TD noWrap>
							<bean:write name="dto" property="flag_disp" scope="page" />
						</TD>
						<TD noWrap>
							<bean:write name="dto" property="iscd_disp"/>
						</TD>
						<TD noWrap>							
							<a href="#" onclick="openChildWin('<%=request.getContextPath()%>/platform/t00_category/category.do?typekey=<bean:write name="dto" property="targetcd"/>','400','500')"><bean:write name="dto" property="targetcd"/></a>
						</TD>	
						<TD noWrap>
							<bean:write name="dto" property="des" scope="page" />
						</TD>

					</TR>
				</logic:iterate>
			</TABLE>
		</div>
		</html:form>
		</div>
	</BODY>
</HTML>
