<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<link id="skincss"
			href="../../css/aml_<%=session.getAttribute("style")%>.css"
			rel="stylesheet" type="text/css" />
		<script type="text/javascript" src="../../js/jquery.js"></script>
		<script type="text/javascript" src="../../js/aml.js"></script>
		

<script language="JavaScript">
function dosubmit(theUrl,type){
		    var errMsg = "";
		    var isSub = false;
		    if(type=='modi'){
		        errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
		        isSub = true;
		    }
		    else if(type=='del'){
		      
		        if(errMsg==''){
		            if(confirm('�ò���������������ֵȫ��ɾ���������أ�')){
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
		
		
			
			function editFomular(tag,type,fieldName){
				var f = parent.document.forms[0];
				fieldName=fieldName+parent.document.forms[0].currsqlnum.value;
				var field = eval("parent.document.forms[0]." + fieldName);			
				
				if(typeof(field)==='undefined'){
					alert("��������SQL��䣡");
					return;
				}
				var text=field.value;  //���ʽ
			
				var pos=parseInt(f.pos.value);// ��λ��� 
				
				var index=parseInt(f.pos.value);
		
				var preStr=text.substring(0,pos);
				var appStr=text.substring(pos,text.length);
				var newStr=preStr+appStr;
				
		
				if(type=='param'){
					newStr=preStr+tag+appStr;
					index=pos+tag.length;
				}
				
				field.value=newStr;
			  
				movePoint(index,fieldName);
				return;
			}
		
			function movePoint(pos,fieldName){
				var f = "parent.document.forms[0]." + fieldName;
				var pn = parseInt(pos); 
				if(isNaN(pn)){ 
					 return; 
		 		}
				//var rng = parent.document.forms[0].drlcontent.createTextRange(); 
				var rng = eval(f).createTextRange(); 
				rng.moveStart("character",pn); 
				rng.collapse(true); 
				rng.select(); 
		
				parent.document.forms[0].pos.value=pos;
				eval(f).focus();
				return;
			}
			
		
function dosubmit(theUrl,type){
    document.forms[0].action=theUrl;
    document.forms[0].submit();
}

function _Open(url){
 
  window.open(url,'','height=200, width=500,left=100,top=100,scrollbars=yes,resizable=yes');
 // window.open(url);
      
}

</script>
	</head>
	<body leftmargin="0" topmargin="0">
		<div id="main">
			<!-- conditions -->
		
			<html:form action="/t21_rule/t21_rulepara_list.do" method="post">
				<div class="conditions">
					<div class="cond_t">
						<span>���������Ϣ</span>
						<span class="buttons">
							<a href="#" onclick="_Open('t21_rulepara_add.do?rulekey=<%=(String)request.getAttribute("rulekey")%>')">
								<img src="../../images/<%=session.getAttribute("style")%>/b_add.png" />����</a>
						</span>
					</div>
				</div>
				<html:errors />
				<div class="list">
					<TABLE border=0 cellpadding="2" cellspacing="1">
						<TR align=center class="tdhead">
							 <th>ѡ�� </th>
 							 <th>��������</th>     
  							 <th>����</th>    

						</TR>
						<logic:iterate id="t21_rule" name="t21_ruleparaList" indexId="i"
							type="com.ist.aml.rule.dto.T21_rule">
							<TR>
								<TD>
								
								
									<logic:equal name="t21_rule" property="paratype" value="1" >
									   <a href="#" onclick=editFomular("@paramval('val','<bean:write name="t21_rule" property="parakey"/>')@","param","selsql")>
									   ����ֵ[<bean:write name="t21_rule" property="para_min_val"/>]</a>
									</logic:equal>
									<logic:equal name="t21_rule" property="paratype" value="2" >
									 <a href="#" onclick=editFomular("@paramval('pre_val','<bean:write name="t21_rule" property="parakey"/>')@","param","selsql")>[<bean:write name="t21_rule" property="para_min_val"/>]ǰֵ</a>
                                      <a href="#" onclick=editFomular("@paramval('nxt_val','<bean:write name="t21_rule" property="parakey"/>')@","param","selsql")>��ֵ[<bean:write name="t21_rule" property="para_max_val"/>]</a>					
									</logic:equal>
								</TD>
								<TD>
									<bean:write name="t21_rule" property="parakey" />-<bean:write name="t21_rule" property="para_des" />
								</TD>
							
								<TD>
									<a href="#" onclick="_Open('t21_rulepara_modify.do?rulekey=<bean:write name="t21_rule" property="rulekey" />&parakey=<bean:write name="t21_rule" property="parakey" />')">
											<img src="../../images/<%=session.getAttribute("style")%>/modify.gif" title="�޸�" /></a>&nbsp;&nbsp;
									<a href="#" onclick="dosubmit('t21_rulepara_delete.do?rulekey=<bean:write name="t21_rule" property="rulekey" />&parakey=<bean:write name="t21_rule" property="parakey" />')">
											<img src="../../images/<%=session.getAttribute("style")%>/b_delete.png" title="ɾ��" /></a>
								</TD>      
							</TR>
						</logic:iterate>
					</TABLE>

				</div>

			</html:form>
			<!--��ʾ��-->
			<div id=div_hint
				style="font-size: 12px; color: red; display: none; position: absolute; z-index: 6000; top: 200; background-color: #F7F7F7; layer-background-color: #0099FF; border: 1px #9c9c9c solid; filter: Alpha(style =   0, opacity =   80, finishOpacity =   100);"></div>
		</div>
		 
	</BODY>
</HTML>
