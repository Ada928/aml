<%@ page contentType="text/html; charset=GBK"%>
<jsp:directive.page import="com.ist.avp.search.Constants"/>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean"%>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic"%>
<%
String contextPath = request.getContextPath();
%>
<html:html>
<head>
	<meta http-equiv=Content-Type content="text/html; charset=gbk">
	<meta content="MSHTML 6.00.2600.0" name=GENERATOR>
	<%@ include file="../../bmp/platform/common/style_include.jsp" %>
	<link rel="stylesheet" href="<%=contextPath%>/skin/<%=style %>/css/awp_base.css" type="text/css">
	<link rel="stylesheet" href="<%=request.getContextPath() %>/skin/<%=style %>/css/jquery-ui.css" type="text/css">
	
	<script src="<%=request.getContextPath()%>/js/jquery-1.6.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery-ui-1.8.14.custom.min.js"></script>
	<script language="JavaScript" src="<%=contextPath%>/js/awp_base.js"></script>
	<script language="JavaScript" src="<%=contextPath%>/js/avpfunc.js"></script>
	<script src="<%=contextPath%>/js/load_window.js"></script>
	<script src="<%=contextPath%>/js/Calendar.js"></script>
</head>
<style>
	.hiddenRow{
		display:none;
	}

	.displayRow{
		display:block;
	}
</style>
<script language="JavaScript">

	var firstSearchFlag = true;
	var modueFlag = "";
	function requestSearchEngine() {
		var srchEngRunningUrl = "search_engine_running.do";
		var oForm = document.forms[0];
		oForm.action = srchEngRunningUrl;
	    oForm.target = "searchEngineMiddle";
	    oForm.submit();
	    
	   	    var crltSrchUrl = "user_crlt_srch_link.do";
		oForm.action = crltSrchUrl;
	    oForm.target = "searchEngineBottom";
	    oForm.submit();
	    
	}
	/** ��� ���������������*/
	function setDefaultParamValue(value) {

        var array_value = value.split("&");
        for(var i = 1; i < array_value.length; i++) {
           var array_parm = array_value[i].split("=");

           if (array_parm[0] == "") {
               continue;
           }
           if (document.getElementsByName(array_parm[0]).length != 0) {
           		document.getElementsByName(array_parm[0])[0].value = array_parm[1];
           }
        }
		search();
	}
 	/** ��ѯ����*/
	function search(){
		if (!validateData()) {
			return;
		}
		
		setNomalFrame();//����frame Ϊ������ʽ
		requestSearchEngine();
	}
	/** ���ģ�� Ҫ��ģ���û� ����һ���ûҵĻ�ԭ����*/
	function initSearchValue(srchcatekey, tplakey ,tdid,a) {
		 var oForm = document.forms[0];
		 oForm.srchcatekey.value = srchcatekey;
	     oForm.tplakey.value = tplakey;
	     //firstSearchFlag = false;
	     setstyle(tdid,a);
	     search();
	}
	
		/** �����ѡ��ť ��������*/
	function initRadio(srchcatekey){
		var oForm = document.forms[0];
		var oTables = document.getElementsByTagName("table");
		for(var i = 0; i < oTables.length; i++){
			if (oTables[i].id.substr(0, 8) == "srchinfo" ) {
			    if(modueFlag != ""){
			    	document.getElementById(modueFlag).className = "nsfontbold";//��ѡ�е�ģ�� ״̬��ɫ��ԭ
			    }
				if (oTables[i].id == ("srchinfo" + srchcatekey)) {
					oTables[i].className = "displayRow";
				} else {
					oTables[i].className = "hiddenRow";
				}
			}
		}
		setTplakey();
		search();
	}
	//�õ�ģ�����
	function setTplakey(){
		
		var oForm = document.forms[0];
		var oTables = document.getElementsByTagName("table");
		
		for(var i = 0; i < oTables.length; i++){
			if(oTables[i].className == "displayRow"){//���table�Ǳ�ѡ�е�table
				for (var j = 0; j < oTables[i].rows[0].cells.length; j++) {
					var oTd = oTables[i].rows[0].cells[j];
					if (oTd.id) {
						modueFlag = oTd.id.split(",")[0];
						oForm.tplakey.value = oTd.id.split(",")[1];
						document.getElementById(modueFlag).className = "fontbold";
						oForm.srchcatekey.value = modueFlag;

						//td �µ�һ��a��ǩĬ����ʽ
						var as = oTd.getElementsByTagName("a");	
						for(var i=0; i<as.length; i++){
							if(i == 0){
								as[i].className = 'hh';
							}else{
								as[i].className = 'a';
							}
						 }				
						
						return;
					}
				}
			}
		}
		oForm.tplakey.value = "";
	}
	
	/** ��ѡ�е���ʽ�û�*/
	function setstyle( tdid,a ){
	   
	   if(modueFlag != ""){
			//document.getElementById(tdid).className = "fontbold";	//��ѡ�е�ģ�� �û�
			modueFlag = tdid.split(",")[0];
		}	
		//a ��ǩ��ʽ
	     var as = a.parentNode.getElementsByTagName('a');
	     for(var i=0; i<as.length; i++){
			as[i].className = 'a';
		 }
	     a.className = 'hh';	
	}
	
	var conditionMinSize = "5%, *, 0";
	var conditionMaxSize = "100%, *, 0";
	var conditionNomalSize = "30%, *, 0";
	
	function setFrameMin() {
	   // parent.searchEngineTop.scrolling = "no";
		//parent.searchFrameSet.rows = conditionMinSize;
	}
	
	function setNomalFrame() {	
		//setConditionSize();
		//parent.searchFrameSet.rows = conditionNomalSize;
	}
	
	function setFrameMax() {
		//parent.searchFrameSet.rows = conditionMaxSize;
	}

	function setConditionSize(){
		//�õ���ѯ������ table �ж�tr���������÷����С
		var tbl = document.getElementById("tbl");
		var tblrows = tbl.rows.length;
		var len = tblrows - 1;
		for(var i=0; i<tblrows; i++){
			if(tbl.rows[i].className == 'hiddenRow'){
				len = len - 1;
			}
		}
		if(len >= 2){
			conditionNomalSize = "35%, *, 12%";
		}else{
			conditionNomalSize = "28%, *, 12%";
		}

		document.getElementById('crlt').className = 'div_4';
		
	}
	
	function validateData() {
		oForm = document.forms[0];
		var els = oForm.elements;
		var isNotChkOk = false;
		var i = 0;
	    
	    //�������б�Ԫ��
		for (; i < els.length; i++) {
	    	//��֤��Сֵ
			if (els[i].min_len && (getElementValLen(els[i]) < els[i].min_len)) {
				isNotChkOk = true;
				break;
			}
	       
	       //��֤�������ֵ
			if (els[i].max_len ) {
				if (els[i].left_len||els[i].right_len) {
					var i_value = Math.abs(parseFloat(els[i].value));
					if(len(i_value) > els[i].max_len){
						isNotChkOk = true;
						break;
					}
				}else if(getElementValLen(els[i]) > els[i].max_len){
					isNotChkOk = true;
					break;
				}
				
			}
			
			//start �ж����ֵ��������ֺ�С�����ֵĳ����Ƿ�ϸ�
			if (els[i].left_len) { 
				var num=els[i].value;       //�ı�ֵ
				var left1=els[i].left_len;  //��������
				var right1=els[i].right_len;  //С������
				var jj = num.indexOf('.'); 
				var text_len=len(num); //�����ı�����9
				
				
				//����
				if(jj==-1){
					 if(text_len > left1){  
							   isNotChkOk = true;
				         break;
					 	}
					
				}
				//С��
				if(jj!=-1){
					  var left_value=num.substring(0, jj);
					  var right_value=num.substring(jj+1,text_len);
					  if(num.indexOf('-')!=-1){//���� 
					  	  left1=parseFloat(left1)+1;
					  } 
					  
					  if(len(left_value) > left1){
							   isNotChkOk = true;
				         break;
					 	}
					 	
					 	if(len(right_value) > right1){  
							   isNotChkOk = true;
				         break;
					 	}
				}
			}
		}
	  
		//��֤��ͨ��,������ʾwarning,ͬʱ�ñ�Ԫ��ȡ�ý���
		if (isNotChkOk) {
		  	if (els[i].warning) {
	        	alert(els[i].warning);
	    	}else{
	        	alert("��������ȷ�Ĳ���ֵ");
	    	}
	    	var sType = els[i].type;
	    	if (sType != 'hidden') {
	    		goBack(els[i]);
	    	}
			return false;
		}else{
			dispLoadInfo();
			return true;
		}
	}
	function initFrame(){
		setTplakey();
		setFrameMax();
	}
	
	function dispLoadInfo(){
		var msgw,msgh,bordercolor;
		msgw=400;//��ʾ���ڵĿ��
		msgh=100;//��ʾ���ڵĸ߶�
		titleheight=25 //��ʾ���ڱ���߶�
		bordercolor="#336699";//��ʾ���ڵı߿���ɫ
		titlecolor="#bad3fc";//��ʾ���ڵı�����ɫ
				
		var sWidth,sHeight;
		sWidth=document.body.offsetWidth;
		sHeight=screen.height;
	
		var bgObj = parent.searchEngineMiddle.document.createElement("div");
		bgObj.setAttribute('id','bgDiv');
		bgObj.style.position="absolute";
		bgObj.style.top="0";
		bgObj.style.background="#ECF3FF";
		bgObj.style.filter="progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=25,finishOpacity=75";
		bgObj.style.opacity="0.6";
		bgObj.style.left="0";
		bgObj.style.width=sWidth + "px";
		bgObj.style.height=sHeight + "px";
		bgObj.style.zIndex = "10000";
		parent.searchEngineMiddle.document.body.appendChild(bgObj);
		
		var msgObj=parent.searchEngineMiddle.document.createElement("div")
		msgObj.setAttribute("id","msgDiv");
		msgObj.setAttribute("align","center");
		msgObj.style.background="white";
		msgObj.style.border="1px solid " + bordercolor;
		msgObj.style.position = "absolute";
	    msgObj.style.left = "50%";
	    msgObj.style.top = "50%";
	    msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
	    msgObj.style.marginLeft = "-225px" ;
	    msgObj.style.marginTop = -75+parent.searchEngineMiddle.document.documentElement.scrollTop+"px";
	    msgObj.style.width = msgw + "px";
	    msgObj.style.height =msgh + "px";
	    msgObj.style.textAlign = "center";
	    msgObj.style.lineHeight ="25px";
	    msgObj.style.zIndex = "10001";
	   
		var title=parent.searchEngineMiddle.document.createElement("h4");
		title.setAttribute("id","msgTitle");
		title.setAttribute("align","right");
		title.style.margin="0";
		title.style.padding="3px";
		title.style.background=bordercolor;
		title.style.filter="progid:DXImageTransform.Microsoft.Alpha(startX=20, startY=20, finishX=100, finishY=100,style=1,opacity=75,finishOpacity=100);";
		title.style.opacity="0.75";
		title.style.border="1px solid " + bordercolor;
		title.style.height="18px";
		title.style.font="12px Verdana, Geneva, Arial, Helvetica, sans-serif";
		title.style.color="white";
		
		time_begin = (new Date()).getTime();	  
		parent.searchEngineMiddle.document.body.appendChild(msgObj);
		parent.searchEngineMiddle.document.getElementById("msgDiv").appendChild(title);
		var txt=parent.searchEngineMiddle.document.createElement("p");
		txt.style.margin="1em 0"
		txt.setAttribute("id","msgTxt");
	    txt.innerHTML="<font color='#FF0000'>���ڼ������ݣ��Ѳ�ѯ[0:0]�룬���Ժ�...</font>";
	    parent.searchEngineMiddle.document.getElementById("msgDiv").appendChild(txt);
	    setTimeout("show_time()",1000);
	}

	function show_time() {
		var time_now=(new Date()).getTime();
	
		var time_distance=time_now-time_begin;
		var int_minute=Math.floor(time_distance/60000)
		time_distance-=int_minute*60000;
		var int_second=Math.floor(time_distance/1000)
	
		var msgTxt = parent.searchEngineMiddle.document.getElementById("msgTxt");
		
		if(msgTxt){
			msgTxt.innerHTML="<font color='#FF0000'>���ڼ������ݣ��Ѳ�ѯ["+int_minute+":"+int_second+"]�룬���Ժ�...</font>";
		}
		setTimeout("show_time()",1000);
	}

	addLoadEvent(initFrame);

	function changeStyle(){
		var div5 = document.getElementById('div5');
		var up = document.getElementById('up');
		if(div5.style.display == ''){
			parent.searchFrameSet.rows = "6%,*,12%";
			up.className = 'slipbtn slipDown';
			div5.style.display = "none";
		}else{
			setNomalFrame();
			up.className = 'slipbtn slipUp';
			div5.style.display = "";
		}
	
	}
	
	jQuery.noConflict();
		(function($){ 
		  $(function(){
			$(document).ready(function(){	
				//�趨iframe�߶�  add by guoqy
				function setiframeheight() {
					var div5height = $("#div5").css("height");
					var div5heightNum = new Number(div5height.substr(0,div5height.indexOf('px'))) + 67 +"px";
					var rows = div5heightNum + ",*,0";
					parent.searchFrameSet.rows = rows;
				}
				$("input[name='avp_query']").click(function(){
					setiframeheight();
					var div1 = $(".div_1");
					if(div1.css("display")!= 'none'){
						div1.css("display","none") ;
						$("input[name='hiddenbutton']").attr("value","��ʾ");
						
						setiframeheight()
					} else {
						div1.css("display","") ;
						$("input[name='hiddenbutton']").attr("value","����");
						
						setiframeheight();
					}
				});

				$("input[name='hiddenbutton']").click(function(){

					var div1 = $(".div_1");
					if(div1.css("display")!= 'none'){
						div1.css("display","none") ;
						$("input[name='hiddenbutton']").attr("value","�� ʾ");
						
						setiframeheight()
					} else {
						div1.css("display","") ;
						$("input[name='hiddenbutton']").attr("value","�� ��");
						
						setiframeheight();
					}
				});

				
			});
			
		// All End
		  });
		})(jQuery);
 </script>
<style type="text/css">
.div_1{left:0;margin-top: 5px}
.div_2{left:0;margin-bottom: 0}
.div_3{position:absolute;margin-top: 0;left:0;}
.div_4{bottom:0;left:0;}
.awp_title{
	text-align:center;
	margin-top:0px;
	margin-button:0px;
	width: 100%;
}
</style>

<body>
	<div>
		<html:form action="/search/performEng_chk_main.do" method="post">
	   		<html:hidden property="srchcatekey"/>
	   		<html:hidden property="tplakey"/>
	   		<input type="hidden" name="newsearchflag" value="0" />
	   		<!-- �������� -->
			<!----><div class='awp_title'>
			    <table>
			        <tr>
				  		<td width="23%"><span class="awp_title_td2"><%=request.getAttribute("engName")%></span></td>
				  		<td align="right">
			        		<input type="button" name='hiddenbutton' value="�� ��" />
		          		</td>
			        </tr>
		      	</table>
			</div>
	   	<!-- ������Ϣ��ʾ�� -->
		<html:messages id="errors" message="true">
			<bean:write name="errors" filter="fasle" />
		</html:messages>
			<div id='div5'>
				<div class='div_1'>
			 		<%=request.getAttribute("condHtmlStr")%>
			 	</div>
			 	<div class='div_2'>
			 		<%=request.getAttribute("caltHtml")%>
			 	</div>
			 	<div class='div_3' id="crlt">
			 		<%=request.getAttribute("crltHtml")%>
			 	</div>
			 </div>
		</html:form>
	</div>
</body>
</html:html>
