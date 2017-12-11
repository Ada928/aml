<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<HTML>
	<HEAD>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<meta name="save" content="history" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script src="../../js/title.js"></script>
		<SCRIPT language=JavaScript src="../../js/selectbox.js"></SCRIPT>
		<script language="JavaScript" src="../../js/basefunc.js"></script>
		<script LANGUAGE="JavaScript" src="../../js/uc.js"></script>
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/jquery-1.2.3.pack.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		<script type="text/javascript" src="../../js/ymPrompt.js"></script>
		<!--[if lte IE 6]>
<script type="text/javascript">var clear="../../js/blank.gif"; </script>
<script type="text/javascript" src="../../js/iepngfix.js"></script>
<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]-->

		<SCRIPT LANGUAGE="JavaScript">


function dosubmit(theUrl){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}


function checkForm(theUrl){
    var errMsg = "";
    if(!document.forms[0].indickey.value.match(new RegExp("^[0-9]+$")))
    {
    	errMsg+="ָ��������������";
        document.forms[0].indickey.focus();
    }
    else if(getLength(document.forms[0].indicname.value)==0){
        errMsg+="ָ��������Ϊ�գ�";
        document.forms[0].indicname.focus();
    }else if(getLength(document.forms[0].indicname.value>=80)){
		 errMsg+="ָ������������";
        document.forms[0].indicname.focus();
	}else if(getLength(document.forms[0].indecdes.value)==0){
        errMsg+="ָ����������Ϊ��";
        document.forms[0].indecdes.focus();
    }else if(getLength(document.forms[0].indecdes.value)>256){
        errMsg+="ָ������������";
        document.forms[0].indecdes.focus();
    }else if(getLength(document.forms[0].granularitys.value)==0){
        errMsg+="����Ƶ�Ȳ���Ϊ�գ�";
        document.forms[0].granularitys.focus();
    }else if(getLength(document.forms[0].callayer.value)==0){
        errMsg+="������β���Ϊ�գ�";
        document.forms[0].callayer.focus();
    }else if(getLength(document.forms[0].indic_attr.value)==0){
        errMsg+="ָ�����Ͳ���Ϊ�գ�";
        document.forms[0].indic_attr.focus();
    }else if(getLength(document.forms[0].use_type_cd.value)==0){
        errMsg+="ָ����;����Ϊ�գ�";
        document.forms[0].indic_attr.focus();
    }else if(getLength(document.forms[0].indic_sql.value)==0){
    	errMsg+="ָ��sql����Ϊ�գ�";
    	document.forms[0].indic_sql.focus();
	}else if(document.forms[0].use_type_cd.value!='2'){  
    
      if(getLength(document.forms[0].trans_ind.value)==0){
        errMsg+="��ѡ���Ƿ��ף�";
        document.forms[0].trans_ind.focus();
        }
       else if(document.forms[0].indic_attr.value == 'JC'&& getLength(document.forms[0].transtable.value)==0){
            errMsg+="ָ������Ϊ��������ʱ,ָ�꽻����ʵ����Ϊ�գ�";
        	document.forms[0].transtable.focus();
         }
    
    }
    
    else if(document.forms[0].indic_attr.value == 'GZ'){
       if(document.forms[0].trans_ind.value=='1'){
         if(getLength(document.forms[0].gz_defkey.value)==0){
    		errMsg+="ָ������Ϊ������ʱ,�������ڲ�������Ϊ�գ�";
        	document.forms[0].gz_defkey.focus();
         }
       }
    }

    if(errMsg==""){
        selectAllOptions(document.forms[0].list2);
        document.forms[0].action=theUrl;
        document.forms[0].submit();
    }else{
        alert(errMsg);
        return false;
    }
}

function check()
{
	if(getLength(document.forms[0].indickey.value)==0){
        alert("ָ�����Ϊ��ʱ,����ѡ��ָ�����ͣ�");
    }
    else if(getLength(document.forms[0].granularitys.value)==0){
        alert("����Ƶ��Ϊ��ʱ,����ѡ��ָ�����ͣ�");
    }
    else if(getLength(document.forms[0].use_type_cd.value)==0){
    	alert("ָ����;Ϊ��ʱ,����ѡ��ָ�����ͣ�");
    }
}

function _onblur(use_value)
{
   if(use_value=="2"){
     document.forms[0].transtable.value="";
     document.forms[0].trans_ind.value="";
     document.forms[0].trans_sql.value="";
   	 document.getElementById("pj1").style.display='none';
     document.getElementById("pj2").style.display='none'; 
     document.getElementById("trans_sqltag").style.display='none';
     document.getElementById("transform_flag").style.display='none';
   }else{
   	 document.getElementById("pj1").style.display='';
   	 document.getElementById("pj2").style.display='';
   	 if(document.forms[0].indic_attr.value=="JC"){
   	 document.getElementById("trans_sqltag").style.display='';
   	 document.getElementById("transform_flag").style.display='';
   	 }
   }
}
function _onblur1()
{
	var ss = document.forms[0].mark.value;
	var tt = document.forms[0].use_type_cd.value;
	if(ss == "2" && tt == "2")
	{
		if(document.forms[0].granularitys.value == "1")
		{
			document.forms[0].indic_table.value = "T65_F_S_P" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_D";
		}
		else
		{
			document.forms[0].indic_table.value = "T65_F_S_P" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_M";
		}
	}
	else
	{
		if(document.forms[0].granularitys.value == "1")
		{
			document.forms[0].indic_table.value = "T64_F_S_K" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_D";
			if(document.forms[0].indic_attr.value == 'JC'){
			 document.getElementById("pj2").style.display=''; 
			document.forms[0].transtable.value = "T64_R_S_K" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_D";
			}else{
			 document.getElementById("pj2").style.display='none'; 
			}
		}
		else
		{
			document.forms[0].indic_table.value = "T64_F_S_K" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_M";
			 document.getElementById("pj2").style.display='none'; 
			//document.forms[0].transtable.value = "T64_R_S_K" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_R";
		}
	}
}
function _onblur2()
{
	if(getLength(document.forms[0].indickey.value)==0){
        alert("ָ����벻��Ϊ�գ�");
        document.forms[0].indickey.focus();
    }
	else if(getLength(document.forms[0].indickey.value)>5){
        alert("ָ����볤��ӦС�ڵ���5λ");
        document.forms[0].indickey.focus();
    }
    else if(!document.forms[0].indickey.value.match(new RegExp("^[0-9]+$")))
    {
    	alert("ָ��������������");
        document.forms[0].indickey.focus();
    }
}
function _onblur3()
{
	if(document.forms[0].indic_attr.value == "JC")
		if(document.forms[0].trans_ind.value == "1")
		{
			if(document.forms[0].indic_sql.value.indexOf("T47_TRANSACTION_D")< 0)
				alert("ָ��sql��д����׼,ȱʧ���ױ�!");
		}
			
}
function _onblur4()
{

	var indic_sql = document.forms[0].indic_sql.value;
	var trans_ind = document.forms[0].trans_ind.value;
	var indic_attr = document.forms[0].indic_attr.value;
	
	if(indic_sql!=""){
	
	if(document.forms[0].indic_attr.value == "JC")
	{		
		if(indic_sql != null)
		{		
                $.ajax({
	 			type:"post",
				url:"t21_indic_trans_sqlAdd.do",
				data:{indic_sql:indic_sql,trans_ind:trans_ind,indic_attr:indic_attr},
				dataType:"text",
				success:function(msg){
					document.forms[0].trans_sql.value=msg;
				 }
	 		});
                
			
		}
	}
	}
	
}

function checktrans_sql()
{
 
   var flag=document.forms[0].indic_attr.value;
   var use_type=document.forms[0].use_type_cd.value;
   if(flag=="JC" && use_type != "2"){
   	 document.getElementById("trans_sqltag").style.display='';
   	 document.getElementById("transform_flag").style.display='';
    
   }else{
   	 document.getElementById("trans_sqltag").style.display='none';
   	 document.getElementById("transform_flag").style.display='none';
   }
}
function _clear_text()
{
 
   var flag=document.forms[0].trans_ind.value;
   if(flag=="0"){
   	 document.getElementById("gz_defkey").value='';
     document.getElementById("transtable").value='';
   }
   else if(flag=="1"&& document.forms[0].indic_attr.value == 'JC'){
     document.getElementById("transtable").value="T64_R_S_K" + document.forms[0].indic_attr.value + document.forms[0].indickey.value + "_D";
   }
}

</SCRIPT>
	</HEAD>
	<BODY leftmargin="0" topmargin="0">
		<div id="main">
			<html:form method="post" action="/t21_indic/t21_indic_add.do">
			<html:hidden  property="mark" />
				<div class="conditions">
					<!-- title -->
					<div class="cond_t">
						<span> ���ָ�� </span>
						<span class="buttons"> <a href="#" onclick="dosubmit('t21_indic_list.do?');">
							<img src="../../images/blue/b_back.png" />�� ��</a>
						</span>
					</div>
					<html:errors />
					<div class="cond_c2">

						<table border="0" cellpadding="0" cellspacing="0">
							<tr>
								<td>
									<font color="red">*</font>ָ����룺
								</td>
								<td>
									<html:text property="indickey" name="t21_indic" readonly="true"/>
								</td>
								<td>
									<font color="red">*</font>ָ�����ƣ�
								</td>
								<td>
									<html:text property="indicname" size="40" />

								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>ָ��������
								</td>
								<td colspan="10">
									<html:text property="indecdes" size="100" />
								</td>
								
								
							</tr>
							<tr>
								<td>
									<font color="red">*</font>����Ƶ�ȣ�
								</td>
								<td>
									<html:select property="granularitys">
										<html:options collection="granularitysMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>������Σ�
								</td>
								<td>
									<html:select property="callayer">
									<html:options collection="callayerMap" property="label"
											labelProperty="value" />
								</html:select>
								</td>
							</tr>
							<tr>
								<td>
									ָ�����壺
								</td>
								<td>
									<html:select property="party_acct_cd">
										<html:options collection="party_acct_cdMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>ָ����;��
								</td>
								<td>
									<html:select property="use_type_cd" onchange="_onblur(this.value)">
										<html:options collection="indic_useMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								
							</tr>
							<tr>
								<td>
									ָ�����
								</td>
								<td>
									<html:select property="indictype">
										<html:options collection="indictypeMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
								<td>
									<font color="red">*</font>ָ�����ͣ�
								</td>
								<td>
									<html:select property="indic_attr" onclick="check();" onchange="checktrans_sql();_onblur1();">
										<html:options collection="indic_attrMap" property="label"
											labelProperty="value" />
									</html:select>
								</td>
							</tr>
							<tr>
								<td>
									<font color="red">*</font>ָ����ʵ��
								</td>
								<td>
									<html:text property="indic_table" readonly="true"/>
								</td>
								<td>
									<font color="red">*</font>�Ƿ����ã�
								</td>
								<td>
									<html:select property="flag" disabled="true">
										<html:options collection="flagMap" property="label"
											labelProperty="value" />
									</html:select>
									<html:img border="0" page="../../images/lock.jpg" align="absmiddle" alt="���ݲ������� ��"></html:img>
								</td>
								
							</tr>
							
							
							<logic:equal name="t21_indicActionForm" property="mark" value="1">
							<tr id="pj1">
							    <td>
									<font color="red">*</font>�Ƿ��н��ף�
								</td>
								<td>
									<html:select property="trans_ind">
										<html:options collection="trans_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							    <td>
									�������ڲ�����
								</td>
								<td>
									<html:text styleId="gz_defkey" property="gz_defkey" size="20" />
									<a href="#" title="����" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=gz_defkey&mark=3',width:600,height:400,title:'����',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_location.png" /></a>
									(����ָ����д��)
								</td>
							</tr>
							<tr id="pj2">
								<td>
									<font color="red">*</font>ָ�꽻����ʵ��
								</td>
								<td colspan="3">
									<html:text styleId="transtable" property="transtable" maxlength="32"/>
								</td>
							</tr>
							</logic:equal>
							
							
							<logic:equal name="t21_indicActionForm" property="mark" value="2">
							<tr id="pj1" style="display:none">
							    <td>
									<font color="red">*</font>�Ƿ��н��ף�
								</td>
								<td>
									<html:select property="trans_ind">
										<html:options collection="trans_indMap" property="label"
											labelProperty="value" />
									</html:select>

								</td>
							    <td>
									�������ڲ�����
								</td>
								<td>
									<html:text styleId="gz_defkey" property="gz_defkey" size="20" />
									<a href="#" title="����" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=gz_defkey&mark=3',width:600,height:400,title:'����',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/b_location.png" /></a>
									(����ָ����д��)
								</td>
							</tr>
							<tr id="pj2" style="display:none">
								<td>
									<font color="red">*</font>ָ�꽻����ʵ��
								</td>
								<td colspan="3">
									<html:text styleId="transtable" property="transtable" maxlength="32"/>
								</td>
							</tr>
							</logic:equal>
							
							
							<tr>
								<td>
									<font color="red">*</font>ָ��sql��
								</td>
								<td colspan="3">
									<textarea name="indic_sql" cols="70" rows="6" onblur="_onblur3();"></textarea>
										<a href="#" title="����" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=defparakey&mark=1&newsearchflag=1',width:600,height:400,title:'����',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/modify2.gif" /></a>
										<span id="transform_flag" style="display:none">
										<a href="#" onclick="_onblur4();" ><img src="../../images/blue/b_complete.png" title="ת��"  /></a>
										</span>
								</td>
							</tr>
							
							
							
							
							
							
							
							
					 		<tr id="trans_sqltag" style="display:none">
								<td>
									<font color="red">*</font>ָ�꽻��sql��
								</td>
								<td colspan="3">
									<textarea name="trans_sql" cols="70" rows="6"></textarea>
									<a href="#" onclick="ymPrompt.win({message:'<%=request.getContextPath()%>/rule/t21_defpara/defpara_search.do?input_name=defparakey&mark=2',width:600,height:400,title:'����',handler:handler,iframe:true,fixPosition:true,dragOut:false});"><img src="../../images/blue/modify2.gif" /></a>
								</td>
							</tr>
							
							
							<tr>
							</tr>
							<tr>
							<td></td>
							<td colspan="4" align="center" class="in_button">
								<html:button property="button" styleClass="input" value="�� ��"
									onclick="checkForm('t21_indic_add_do.do')"/>
							</td>
							</tr>
						</table>
					</div>
				</div>
			  <div class="sys_warning">
			    <strong><img src="../../images/<%=session.getAttribute("style") %>/warning.png" />��ʾ��</strong>
				<p>
				  1������ָ�꣺��Ҫ��д����ָ��sql���н���ʱ��ָ��sql��д��Ҫ���ֳ����ױ��޽���ʱ��ָ��sql���ܳ��ֽ��ױ��ͻ������ֶδ�t47_party,t47_corporation,t47_individualȡ�ã��˻������ֶδ�t47_agreement,t47_cp_deposit,t47_id_depositȡ�á����ܺ�������£�ָ��sql�к��Ĳ��ֶ�Ҫ��group by��β�� <br/>
				  2������ָ�꣺��Ҫ�û��������������ڲ��������Ҵ󲿷�������Ǵ���֪��ָ����ʵ����ժȡ���� <br/>
				  3���������֣�ָ��sql����Ҫժȡ��INDICKEY,OBJKEY,INDICVAL1,STATISTIC_DT������ָ����ܻ���ҪժȡINDICVAL2
				</p>
			  </div>
			</html:form>
		</div>
	</BODY>
</HTML>
