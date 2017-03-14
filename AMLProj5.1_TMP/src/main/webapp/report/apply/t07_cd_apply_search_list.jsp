<%@ page contentType= "text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix ="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix ="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix ="logic"%>
<HTML>
       <HEAD>
             <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
             <meta name="save" content="history" />
             <link id= "skincss" href="../../css/aml_<%=session.getAttribute("style" )%>.css" rel="stylesheet" type="text/css" />
             <script language="JavaScript" src="../../js/basefunc.js" ></script>
             <script type="text/javascript" src="../../js/jquery.js"></script>
             <script type="text/javascript" src="../../js/aml.js" ></script>
             <script type="text/javascript" src="../../js/calendar.js"></script>
<SCRIPT LANGUAGE="JavaScript" >
function dosubmit(theUrl,type,status){
	var errMsg="";
	var isSub = false;
	if(type=="search"){
		_Date1 = document.forms[0].start_dt_disp.value;
        _Date2 = document.forms[0].end_dt_disp.value;  
        if(_Date1!="" && !formatDateAlert(_Date1))
           return false;       
        else if(_Date2!="" && !formatDateAlert(_Date2))
	        return false;	  
        else if(!_isDateSpaceComplete(_Date1, _Date2))
   		errMsg += "����д��������ʼʱ�䷶Χ��";  
        else if(!_compareTwoDateForString(_Date1, _Date2) )
 			errMsg += "��ʼʱ�䲻�ܴ��ڽ���ʱ�䣡";
            isSub = true;
	}else if(type=="sub"){
		var apply_nos=document.forms[0].apply_no;
		var status_cds=document.getElementsByName("status_cd1");
		if(checkRadio(apply_nos)<0){
	        errMsg+="��ѡ�����룡";
	    }else{
			for ( var i=0; i < apply_nos.length; i++ ){
	            if ( true==apply_nos[i].checked ){ 
	                var status_cd=status_cds[i].value;
	                if(status_cd!="7"){
	                	errMsg+="���ܲ������ѵ������룡";
		             }
	            }
	        }
	    }
		isSub = true;
	}else if(type=="export"){
		if(confirm('��ȷ��Ҫ������')){
            isSub = true;
        }
        if(status=='7'){
        	 if(isSub){
 		        window.open(theUrl,'','height=160, width=300,left=100,top=100');
 		        }
 		        return ;
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
<html:form method="post" action="/apply/t07_cd_apply_check_list.do">
       <div class="conditions" >
             <div class="cond_t" >
             	<span>�������</span >
                   <span class="buttons" >
                   <a href="#" onclick="dosubmit('t07_cd_apply_submit.do?status=5&opertype=3','sub');" ><img src="../../images/blue/b_pass.png" />��׼</a>
                   		<a href="#" onclick="dosubmit('t07_cd_apply_submit.do?status=6&opertype=3','sub');" ><img src="../../images/blue/b_rereport.png" />ʧЧ</a>
                 </span>
             </div>
             <div class="cond_c" id="searchtable">
                   <table border="0" cellpadding="0" cellspacing="0">
                         <tr>
                               <td> �������ͣ�</td >
                               <td><html:select property="msg_type">
										<html:options collection="msg_typeMap" property="label"
											labelProperty="value" />
									</html:select></td>
                               <td> �������ͣ�</td >
                               <td><html:select property="apply_type">
										<html:options collection="apply_typeMap" property="label"
											labelProperty="value" />
									</html:select></td>
                         </tr>
                         <tr><td>�������ڣ�</td >
                               <td>
							<html:text property="start_dt_disp" size="12" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
									-
							<html:text size="12" property="end_dt_disp" onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
								</td>
                               <td>״̬��</td >
                               <td>
                               <html:select property="status_cd">
										<html:options collection="status_cdMap" property="label"
											labelProperty="value" />
									</html:select>
                               <input type="button" name="button3" value="�� ѯ" class="in_button1"
										onclick="dosubmit('<%=request.getContextPath()%>/report/apply/t07_cd_apply_search_list.do?newsearchflag=1','search')" /></td>
                         </tr>
                   </table>
             </div>
             </div>
             <html:errors/>
             <div class="list" >
                  <table border="0" cellspacing="0" cellpadding="0" id="table_name">
						<tr>
							<th>ѡ��</th>
					          <th>������</th>
					          <th>��������</th>
					          <th>��������</th>
					          <th>�����������</th>
					          <th>������</th>
					          <th>�������</th>
					          <th>״̬</th>
					          <th>����</th>
				          </tr>
				          <logic:present name="t07_cd_applyList">
								<logic:iterate id="t07_cd_apply"
									name="t07_cd_applyList"
									type="com.ist.aml.report.dto.T07_cd_apply">
				          <tr>
				          	<td><html:radio property="apply_no" idName="t07_cd_apply" value="apply_no"></html:radio>
				          		<input type="hidden" name="status_cd1" value="<bean:write name="t07_cd_apply" property="status_cd"/>"/>
				          	</td>
				          <td>
				          	<a href="t07_cd_apply_detail.do?return_type=2&apply_no=<bean:write name="t07_cd_apply" property="apply_no"/>&msg_type=<bean:write name="t07_cd_apply" property="msg_type"/>&status_cd=<bean:write name="t07_cd_apply" property="status_cd"/>"><bean:write name="t07_cd_apply" property="apply_no" /></a>
				          </td>
				          <td><bean:write name="t07_cd_apply" property="msg_type_disp" /></td>
				          <td><bean:write name="t07_cd_apply" property="apply_type_disp" /></td>
				          <td><bean:write name="t07_cd_apply" property="rinm" /></td>
				          <td><bean:write name="t07_cd_apply" property="create_user" /></td>
				          <td><bean:write name="t07_cd_apply" property="create_dt_disp" /></td>
				          <td><bean:write name="t07_cd_apply" property="status_cd_disp" /></td>
				           <td><logic:equal value="4" name="t07_cd_apply" property="status_cd">
				              <a href="#" onclick="dosubmit('exportT07_cd_apply.do?apply_no=<bean:write name="t07_cd_apply" property="apply_no"/>&msg_type=<bean:write name="t07_cd_apply" property="msg_type"/>','export')">����</a>
				          </logic:equal>
				          <logic:equal value="7" name="t07_cd_apply" property="status_cd">
				              <a href="#" onclick="dosubmit('exportT07_cd_apply.do?apply_no=<bean:write name="t07_cd_apply" property="apply_no"/>&msg_type=<bean:write name="t07_cd_apply" property="msg_type"/>','export','<bean:write name="t07_cd_apply" property="status_cd"/>')">����</a>
				          </logic:equal>
				          </td>
				          </tr>
				          </logic:iterate>
				          </logic:present>
				          </table>
             </div>
             <div class="list_page">
					<bean:write name="pageInfo" scope="request" filter="false" />
				</div>
</html:form>
</div>
</BODY>
</HTML>
