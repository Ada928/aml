<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss" href="../../css/aml_<%=session.getAttribute("style")%>.css" rel="stylesheet" type="text/css" />
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script type="text/javascript" src="../../js/awp_base.js"></script>
		<script language="JavaScript" src="../../js/App_Select.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
    <SCRIPT LANGUAGE="JavaScript"> 
	function dosubmit(theUrl,type){
    var errMsg = "";
    var isSub = false;
    if(type == 'add'){
    	isSub = true;
    }
    if(type=='modi'){ 
    	errMsg = CheckBoxCheckedSingleOne(document.forms[0]);  	
    	isSub = true;	
	}
    if(type=='del'){
    	errMsg = CheckBoxMustChecked(document.forms[0]);
    	if(errMsg == ""){
            if(confirm('�����Ҫɾ��ѡ�������')){
            	isSub = true;
            } 
    	}
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
<div id="main">
<html:form action="/entity/t03_entity_kind_list.do" method="post">
    <div class="conditions">
            <div class="cond_t">
               	<span>Ԥ������������ - �б�</span>
               	<span class="buttons">
					<a href="#" onClick="dosubmit('entity_kind_add.do','add');"><img src="../../images/<%=session.getAttribute("style") %>/b_add2.png" />�� ��</a>
					<a href="#" onClick="dosubmit('entity_kind_modify.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a>
					<a href="#" onClick="dosubmit('deleteT03_entity_kindDo.do','del');"><img src="../../images/<%=session.getAttribute("style") %>/b_delete.png" />ɾ ��</a>
					<a href="#" onClick="dosubmit('result_colmap.do','modi');"><img src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />ӳ ��</a>
				</span>
            </div>

           <html:errors />

            <div class="list">
                <TABLE border="0" cellspacing="0" cellpadding="0">
                    <TR align="center">
                        <th width="2%" onclick='selectAllCheckBox(this,document.forms[0])' style='cursor:hand;'>ȫ��</th>
                        <th width="8%" nowrap>
                           �����������
                        </th>
                        <th width="15%" nowrap>
                           �����������
                        </th>
                        <th width="15%" nowrap>
                           ���������ʵ�����
                        </th>
                        <th width="15%" nowrap>
                            ���������ʵ��Դ����
                        </th>
                        <th width="5%" nowrap>
                            ������������Ƿ���
                        </th>
                        <th width="5%" nowrap>
                            ���ƺ��Ƿ�����������
                        </th>
                           <th width="15%" nowrap>
                            �������鿴ģ������
                        </th>
                          <th width="15%" nowrap>
                           �������鿴ģ���������
                        </th>
                        
                    </TR>
                    <logic:iterate id="dto" name="t03_entity_kindList" type="com.ist.aml.rule.dto.T03_entity_kind">
                        <TR align="center">
                          <TD noWrap>
							<input type="checkbox" name="select_rtettypekey" value="<bean:write name="dto" property="rtettypekey"/>"/>							
						</TD>
						<TD >
							<bean:write name="dto" property="rtettypekey"  />
						</TD>
						<TD >
							<bean:write name="dto" property="rtetname"  />
						</TD>
						<TD >
							<bean:write name="dto" property="rtetfacttable"  />
						</TD>
						<TD >
							<bean:write name="dto" property="rtetfactsctable"  />
						</TD>
						<TD >
							<bean:write name="dto" property="iscopy_disp"  />
						</TD>
						<TD >
							<bean:write name="dto" property="isnewmkey_disp"  />
						</TD>
						<TD >
							<bean:write name="dto" property="tplakey_disp"  />
						</TD>
						<TD >
							<bean:write name="dto" property="paramname_disp"  />
						</TD>
						
                        </TR>
                    </logic:iterate>
                </TABLE>
               </div>
           </div>
    </div>
    </html:form>
</BODY>
</HTML>
