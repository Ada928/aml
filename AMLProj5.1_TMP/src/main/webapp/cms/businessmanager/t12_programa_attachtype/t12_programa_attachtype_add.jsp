<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>
<html:html>
<HEAD>
    <META http-equiv=Content-Type content="text/html; charset=gb2312">
    <%@ include file="../../../bmp/platform/common/style_include.jsp" %>
<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
    
    <script language="JavaScript" src="<%=request.getContextPath()%>/js/awp_base.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/basefunc.js"></script>
    <SCRIPT LANGUAGE="JavaScript" src="<%=request.getContextPath()%>/js/load_window.js"></script>
   <SCRIPT LANGUAGE="JavaScript"> 

function checkForm(theUrl){
    var errMsg ="";
    //��������
    if(getLength(document.forms[0].attachname.value)==0){
        errMsg += "������ݲ���Ϊ�գ�";
        document.forms[0].attachname.focus();
    }else{
		errMsg = check_input(document.forms[0].attachname.value);
	}
    if(errMsg != ""){
        alert(errMsg);
        return false;
    }else{
        document.forms[0].action = theUrl;
        document.forms[0].submit();
    }
}

//��������ʽ�Ƿ�����	
function check_input(str){
	var arrcol = str.split("\n");		
	for(i=0;i<arrcol.length;i++){
		var col = arrcol[i].split(",");
		if(col.length != 2){
			return("�����ʽ�д�������������");
		}else{
			if(getLength(col[0]) > 12){
				return("��ֵ���ܳ���12λ�ַ�������������");
			}
			if(getLength(col[1]) > 32){
				return("��ֵ���Ʋ��ܳ���32λ�ַ�������������");
			}
		}
	}		
	return("");
}
	</SCRIPT>
</HEAD>
<body>
	<div id='content'>
		<html:form method="post" action="/businessmanager/t12_programa_attachtype/t12_programa_attachtype_add_do.do">

			 <div class='awp_title'>
                <table>
                    <tr>
                        <td>
                            <span class="awp_title_td2">��Ŀ����������
									- �� ��</span>
                        </td>
                        <td align="right" nowrap>
						    <html:button property="button4" value="�� ��" styleClass="input"
							onclick="awpDoSubmit('t12_programa_attachtype_list.do','add')" />
                        </td>
                    </tr>
                </table>
            </div>
            
			<html:messages id="errors" message="true">
				<bean:write name="errors" filter="fasle" />
			</html:messages>
			<html:hidden property="programakey"/>
			<div class='awp_detail'>
				<table>
					
					<tr>
						<td>
							<font color="red">*</font>�������
						</td>
						<td>
						  <html:textarea property="attachname" cols="60" rows="30"
											styleClass="text_white"></html:textarea>
						</td>
					</tr>
				
				    <tr>
						<td>
							&nbsp;
						</td>
						<td>
							<input type="button" value="�� ��" OnClick="checkForm('t12_programa_attachtype_add_do.do')">
							<html:reset styleClass="input" value="�� ��"/>
						</td>
					</tr>
				</table>
			</div>

		</html:form>
	</div>
<div class="awp_msgtab">
	  <table>
		<tr> 
        <td ><p><strong>ϵͳ��ʾ��</strong><br>
        <ol>
				<li> �ı��������Ϣ��ʽΪ��ֵ����ֵ����֮��Ҫ��","���ŷָ�Ȼ��س��������һ��
				<li> ���� 1,����<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,����<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,ɾ��<br>
			</ol>
        </td>
        </tr>
      </table>
    </div>

</body>
</html:html>
