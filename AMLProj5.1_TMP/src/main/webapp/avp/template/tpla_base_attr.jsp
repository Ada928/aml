<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
<HEAD>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<META content="MSHTML 6.00.2600.0" name=GENERATOR>
<title></title>
 <%@ include file="../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">

<script language="JavaScript"
			src="<%=request.getContextPath()%>/js/awp_base.js"></script>

<SCRIPT LANGUAGE="JavaScript" src="<%= request.getContextPath() %>/js/basefunc.js"></script>
<script src="<%= request.getContextPath() %>/js/load_window.js"></script>

<SCRIPT LANGUAGE="JavaScript">
function checkForm(theUrl){
var errMsg ="";
    
    if(getLength(document.forms[0].tplacatecd.value)==0){
       
        errMsg+="���������Ϊ�գ�";
        alert(errMsg);
        return false;    
    }
    if (/[`~!@#$%^&*()+=|{}':;',\[\].<>\/?~��@#��%����&*��������+|{}������������������������\\\\]/gi.test(document.forms[0].tplaname.value)) {
    	if (confirm('ģ�����Ʋ��ܰ��������ַ�,���������ַ����ᱻ�滻��')) {
    		document.forms[0].tplaname.value = stripscript(document.forms[0].tplaname.value);
			return true;
		}else{
			return false;
		}
	}
    if(getLength(document.forms[0].tplaname.value)==0||getLength(document.forms[0].tplaname.value)>64){
        errMsg+="ģ�����Ʋ���Ϊ��,����ģ�����Ƴ��Ȳ��ܴ���32�����֣�";
        document.forms[0].tplaname.focus();  
        alert(errMsg);
        return false;  
    }
    
    if(document.forms[0].dispseq.value!=null&&document.forms[0].dispseq.value!=''){
        if(!checkNumber((document.forms[0].dispseq.value))||getLength(document.forms[0].dispseq.value)>10){
	        errMsg+="��ʾ���ֻ����������,���Ҳ��ܴ���10λ��";
	        document.forms[0].dispseq.focus(); 
	        alert(errMsg);
            return false;  
        }
    }
    if(document.forms[0].condnum.value!=null&&document.forms[0].condnum.value!=''){
        if(!checkNumber((document.forms[0].condnum.value))||getLength(document.forms[0].condnum.value)>3){
	        errMsg+="����������ʾ����ֻ����������,���Ҳ��ܴ���3λ��";
	        document.forms[0].condnum.focus(); 
	        alert(errMsg);
            return false;  
        }
    }
   if(!checkNumber((document.forms[0].pagerecnum.value))||getLength(document.forms[0].pagerecnum.value)>6){
        errMsg+="ÿҳ��¼����ֻ����������,���Ҳ��ܴ���6λ��";
        document.forms[0].pagerecnum.focus(); 
        alert(errMsg);
        return false;  
    }
   
   if(getLength(document.forms[0].fundes.value)>4000){
        //alert('aa');
        errMsg+="�����������ܴ���2000�����֣�";
        document.forms[0].fundes.focus();    
        alert(errMsg);
        return false;
    }
    
    
    if(errMsg!=""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }    
}
	function dosubmit(theUrl){
	    document.forms[0].action=theUrl;
	    document.forms[0].submit();
	}
	function selectChangeRsltmode3() {
		if(document.forms[0].rsltmode3.checked == true) {
			document.forms[0].rsltmode9.checked = false;
		}
	}
	function selectChangeRsltmode9() {
		if(document.forms[0].rsltmode9.checked == true) {
			document.forms[0].rsltmode3.checked = false;
		}
	}
	function selectChangeRsltmode5() {
		if(document.forms[0].rsltmode5.checked == true) {
			document.forms[0].rsltmode10.checked = false;
		}
	}
	function selectChangeRsltmode10() {
		if(document.forms[0].rsltmode10.checked == true) {
			document.forms[0].rsltmode5.checked = false;
		}
	}
	function stripscript(s) {
	    var pattern = new RegExp("[`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~��@#��%����&*��������+|{}������������������������\\\\]")
	    var rs = "";
	    for (var i = 0; i < s.length; i++) {
	        rs = rs + s.substr(i, 1).replace(pattern, '');
	    }
	    return rs;
	}
</SCRIPT>
</HEAD>
<BODY leftmargin="0" topmargin="0">
<div id='content'>
<html:form method="post" action="/template/t02_tp_bas_inf_add.do">
  <html:hidden property="tplakey"/>
  <html:hidden property="busstypecd"/>

  <div class='awp_title'>
				<table>
					<tr>
						
						<td width="23%" nowrap>
							<span class="awp_title_td2">ģ����� - �������Զ���</span>
						</td>
						<td align="right">
							<input type="button" value="�� ��" onclick="avpSubmitPopUp('', 'modifyT02_tp_scriptcd.do', 800, 600)" />
			    	<html:button property="button_save" value="�� ��" onclick="checkForm('t02_tp_bas_inf_base_attr_modify.do')"/>				</td>
					</tr>
				</table>
			</div> 


  <div class='awp_detail' >
          <table>
            <tr >
              <td ><font color="#FF0000">*</font>�������<br></td>
              <td >
               <html:select property="tplacatecd" style="width:160">
							<html:options collection="applytypeMap" property="label" labelProperty="value" />
						</html:select>
              	<!--<html:hidden property="tplacatecd" styleClass="text_white" />
              	<html:text property="tplacatecd_name" size="25" />
             	 <input type="button" name="locate"  value="�� ѡ" onclick="locate_pop_window('<%= request.getContextPath() %>','t00_categoryLocation','radio','forms[0]','tplacatecd,tplacatecd_name','');"/> -->
             	<br>
             </td>
            </tr>
            <tr >
              <td  ><font color="#FF0000">*</font>ģ�����ƣ�<br></td>
              <td ><html:text property="tplaname" styleClass="text_white" size="25"/>�����32�����֣�</td>
            </tr>
           
            <tr >
              <td  ><font color="#FF0000">*</font>�����ʾ���ͣ�<br></td>
              <td >
                         <html:select property="rsltdisptype" style="width:160">
							<html:options collection="resuleDTMap" property="label" labelProperty="value" />
						</html:select>
			  <br></td>
            </tr>    
             <tr >
              <td   ><font color="#FF0000">*</font>ҳ����ʾ���ͣ�<br></td>
              <td >
                         <html:select property="pagetype" style="width:160">
							<html:options collection="pagetypeMap" property="label" labelProperty="value" />
						</html:select>
			  <br></td>
            </tr>
             <tr >
                <td><font color="#FF0000">*</font>����������ʾ��<br></td>
                <td >
                <html:radio property="isdisp" value="1">��</html:radio>
                <html:radio property="isdisp" value="0">��</html:radio>               
                <br></td>
             </tr>
             <tr >
              <td   ><font color="#FF0000">*</font>�Ƿ��ҳ��ʾ��<br></td>
              <td >
              	<html:radio property="ispage" value="1">��</html:radio>
                <html:radio property="ispage" value="0">��</html:radio> 
			  <br></td>
            </tr>

             <tr >
                <td><font color="#FF0000">*</font>ÿҳ��¼������<br></td>
                <td ><html:text property="pagerecnum" styleClass="text_white" size="25"/>�����6λ���֣�</td>
              </tr>
             <tr >
                <td   >��ʾ��ţ�<br></td>
                <td ><html:text property="dispseq" styleClass="text_white" size="25"/>�����10λ���֣�</td>
              </tr>
             <input type="hidden" name="querytype" value="1"/>
              <!-- 
             <tr >
              <td   ><font color="#FF0000">*</font>ִ�в�ѯ���ͣ�</td>
              <td >
                         <html:select property="querytype">
							<html:options collection="querytypeMap" property="label" labelProperty="value" />
						</html:select>
			  </td>
            </tr>
             -->
           <tr >
              <td   ><font color="#FF0000">*</font>����������ʾ���ͣ�<br></td>
              <td >
                        <html:select property="condtype"  style="width:160">
							<html:options collection="condtypeMap" property="label" labelProperty="value" />
						</html:select>
              <br></td>
            </tr>
            <tr>
              <td><font color="#FF0000">*</font>����������ʾ������<br></td>
              <td><html:text property="condnum" styleClass="text_white" size="25"/>�����3λ���֣�</td>
            </tr>
             <tr >
              <td   ><font color="#FF0000">*</font>����Դ��</td>
              <td >
                        <html:select property="qryconncd"  style="width:160">
							<html:options collection="qryconncdMap" property="label" labelProperty="value" />
						</html:select>
              </td>
            </tr>
            <tr >
              <td >�Ƿ��ִ̨�У�</td>
              <td >
                <html:radio property="backexec" value="1">��</html:radio>
                <html:radio property="backexec" value="0">��</html:radio>
              </td>
            </tr>
           <!--  <tr >
              <td width="30%"  >��ѯȨ�ޣ�<br></td>
              <td width="70%">
              <html:hidden property="useauth" styleClass="text_white" />
              <html:text property="useauth_disp" styleClass="text_white" size="25" readonly="true"/>
             <input type="button" name="locate"  value="�� λ" onclick="locate_pop_window('/awp','E00921loc','checkbox1','forms[0]','useauth,useauth_disp','');"/>
             <br></td>
            </tr> -->
             <tr >
              <td   >����������ͣ�<br></td>
              <td >
	              <html:checkbox property="rsltmode1" value="1">ͳ��</html:checkbox>
	              <html:checkbox property="rsltmode2" value="1">����</html:checkbox>
	              <html:checkbox property="rsltmode9" value="1">����</html:checkbox>
	              <html:checkbox property="rsltmode12" value="1">����(ѡ���ֶ�)</html:checkbox>
	             	<!--   <html:checkbox property="rsltmode4" value="0" disabled="true" >ɸѡ</html:checkbox> -->
	              <html:checkbox property="rsltmode10" value="1" onclick="isSelected(this)">����</html:checkbox>
	              <html:checkbox property="rsltmode7" value="1">����</html:checkbox>
	              <html:checkbox property="rsltmode8" value="1">ͼ��</html:checkbox>
	              <html:checkbox property="rsltmode6" value="1">����</html:checkbox>
	              <html:checkbox property="rsltmode5" value="1" onclick="isSelected(this)">���������������嵥��</html:checkbox>
	              <html:checkbox property="rsltmode11" value="1" onclick="isSelected(this)">��������ˣ�</html:checkbox>
              <br></td>
            </tr> 
           <tr >
              <td   >����������<br>�����2000�����֣�</td>
              <td ><html:textarea property="fundes" styleClass="text_white"  rows="20" style="width:95%"/><br></td>
            </tr>
          </table>
      </div>
</html:form>
</div>
</BODY>
<script type="text/javascript">
	// ��ť  ����  ��  ���������������嵥������
	function isSelected(obj){
		var msg;
		var name = obj.name;
		if(name == 'rsltmode10'){			
			if(document.forms[0].rsltmode5.checked || document.forms[0].rsltmode11.checked){
				msg = "�Ѿ�ѡ���ˡ����������������嵥������������ѡ�񡰵�������";
			}
		}else if(name == 'rsltmode5'){
			if(document.forms[0].rsltmode10.checked || document.forms[0].rsltmode11.checked){
				msg = "�Ѿ�ѡ���ˡ���������������ѡ�񡰵��������������嵥������";					
			}
		}	
		else if(name == 'rsltmode11'){
			if(document.forms[0].rsltmode5.checked || document.forms[0].rsltmode10.checked){
				msg = "�Ѿ�ѡ���ˡ����������ߡ����������������嵥������������ѡ�񡰵�������ˣ�����";					
			}
		}	
		if(msg){
			alert(msg);
			obj.checked = false;
		}
	}

</script>
<script type="text/javascript">
var frame = window.parent["leftFrame"];
var tplakey = <%=request.getAttribute("tplakey")%>;
var rsltdisptype = document.getElementsByName('rsltdisptype')[0].value;
frame.location='<%=request.getContextPath()%>/avp/template/tpla_add_left.jsp?tplakey=' + tplakey + '&rsltdisptype=' + rsltdisptype;
</script>
</HTML>
