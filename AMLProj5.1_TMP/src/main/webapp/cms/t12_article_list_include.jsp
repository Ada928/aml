<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%@ taglib uri="http://java.sun.com/jstl/core" prefix="c"%>

    <%@ include file="../bmp/platform/common/style_include.jsp" %>
	<link  href="<%=request.getContextPath()%>/skin/<%=style %>/css/awp_base.css" rel="stylesheet" type="text/css">
	<script src="<%=request.getContextPath()%>/js/basefunc.js"></script>
	<script src="<%=request.getContextPath()%>/js/load_window.js"></script>
	
	<script type="text/javascript">
	
	function commitReply() {
	    var content = document.getElementById("replycontent").value;
	    if(trim(content) == '') {
	        alert("�ظ����ݲ���Ϊ�գ�");
	        document.getElementById("replycontent").focus();
	        return ;
	    }
	    
	    document.forms[0].action="../knowledgemanager/release_writeback.do";
		document.forms[0].submit();	    
	}

    </script>
			
<table width="100" border="0" cellspacing="0" cellpadding="0">
	<tr>
		<td height="8">
		
		</td>
	</tr>
</table>

<table class="split" width="98%">
			<tr>
				<td height="8">
					<html:messages id="errors" message="true">
						<bean:write name="errors" filter="fasle" />
					</html:messages>
				</td>
			</tr>
		</table>
		
		<logic:notEmpty name="t12_article">		   			
		
		

<div id="popall">

  <div id="popNav">
   <span>֪ʶ���� > �������� 
  </div>
	<div class="Ar_title" align="right">
	   <span>
		 <a href="/awp/cms/knowledgemanager/t12_knowledge_collect.do?articlekey=<bean:write name="t12_articleActionForm" property="articlekey" />&programakey=<bean:write name="t12_articleActionForm" property="programakey" />" ><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_favorite.gif" />[�ղ�]</a>
		 
		 <a href="javascript:void(0);" onclick="window.close();"><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_close.gif" />[�ر�]</a>
	   </span>
	 </div>
	  <!--��������-->
	  	   <%
						    Map map = (Map)request.getAttribute("resultMap");
						    if(map == null) {
						        map = new HashMap();
						    }
						    %>
	<div id="popCont">
	   <!--����-->
	    <div class="Article">
			 <!--�����б�-->
              <div class="Ar_other2" id="damo">
				 <span class="one"><h1>���������</h1><%=request.getAttribute("categorystr") %></span>
					<logic:iterate id="col" name="t12_programa_colsList"
						type="com.ist.cms.dto.T12_programa_cols">
						<%
				                  String colkey = col.getColkey();
				                  String value = (String)map.get(colkey);
				                  if(value == null) value = "";
				               %>

						<logic:notMatch value="ARTICLEKEY" name="col" property="colkey">
							<span>
								<h1>��<bean:write property="colname" name="col" />��</h1><%=value %>
							</span>
						</logic:notMatch>

					</logic:iterate>
				</div>



				<logic:equal value="1" name="t12_programa_power" property="isdownload">	
				  <!--����-->
				  <div class="pop_cl"></div>
			 		<div class="Ar_other" style="width:99%;">
						<h1><img src="<%=request.getContextPath()%>/skin/<%=style %>/images/pop_annex.gif" />����</h1>
			   					<jsp:include page="../cmp/attachment/attach_include_show_n.jsp" />
		   			</div>
	 	</logic:equal>
	</div>
	
<script type="text/javascript">
<!--
function popwindow(){
   var bodyWidth=document.body.clientWidth;
   var divWidth=document.getElementById('popall'); 
   if(bodyWidth>988){
      divWidth.style.width=988+'px';
      divWidth.style.position="relative";
   } else {
      divWidth.style.width=bodyWidth+'px';
   }
}
popwindow();
window.onresize=popwindow; 
//-->
</script>
<script type="text/javascript">
	<!--
	var text = document.getElementById("damo").getElementsByTagName("span"); 	 
	String.prototype.lenB = function () {
		return this.replace(/[^\x00-\xff]/g, "**").length;
	};
	var minnum=0;//������,2������Ϊһ����    
	for (var i = 0; i < text.length; i++) {
		var str = text[i].innerHTML;
		var m;
		var browser = navigator.appName;
		var b_version = navigator.appVersion;
		var version = b_version.split(";");
		var trim_Version = version[1].replace(/[ ]/g, "");
		if (browser == "Microsoft Internet Explorer" && trim_Version == "MSIE6.0") {
			m = 67;
		} else {
			m = 70;
		}
		if (str.lenB() > m) {
			if(minnum==1){//��ǰһ��ֻ��һ������ʱ,����һ������,���һ����
				var object = text[i-1];
				object.className = "one";
			}
			var object = text[i];
			object.className = "one";
			minnum=0;//��ǰ��һ���У��Ѱ�����Ϊ0
		}else{
			if(i+1==text.length && minnum==0){//�����һ��ֻ��һ������ʱ�����һ������
				var object = text[i];
				object.className = "one";
			}
			minnum++;//��������1
		}
		if(minnum==2)//2������,����һ����
			minnum=0
	}
	//-->
	</script>
		
		</logic:notEmpty>
		