/**
 * <p>
 * avp_func.js
 * </p>
 * 
 * ��Ҫ��avp����ģ��ʹ�õ�js��������Ҫ�ṩ���¹��ܣ�δ˵���������벻��ʹ�ã�
 * 1.avp���ù��ܺ�����
 *	    function avpCondSubmit(theUrl):�൱�ڵ���ύ��ť����������������Ƿ����ָ������������������ȣ���С����
 *			�����볤�ȣ��������������ڣ�����еĻ�.��ʾ�������ڼ�����ʾ��
 *      function avpJumpSubmit(theUrl):�ڵ�ǰ�����У���ת��ָ��ҳ�棬��ʾ�������ڼ���ҳ�棬����еĻ�
 *      function avpPopUp(theUrl,sWidth,sHeight):����һ��ָ����Ⱥͳ��ȵĴ��ڣ�
 * 
 * 2.��ʽ���ù��ܣ�ֻ��������Ӧ��class���ԣ�����ҳ�������뱾�ű����ɣ�������ʾ���ñ��ű��еĺ���,����div���ʹ��
 *      �����ʽ��Ŀǰ֧��4����ʽ�����б���list_tab�����������cond_tab������ϸ���detail_tab������������title_tab������
 *      �����п�ȣ�width�������뷽ʽ��align����noWrap��Ҫ�����ֹ�����.
 *			����<table class='list_tab'>
 ��
 *		����Ԫ����ʽ����Ҫͨ��class,min_len,max_len������������ƣ�����classָ������ֵ���ͣ�avp_number���ͣ�ֻ�����û�
 *			�������ֻ�С����,֧�ָ�����avp_date���������û��Զ��ַ�ʽ��������,��1998-01-01,1998-1-1,19980101,����������Ϊ�Ϸ���
 *			�ڣ��Զ�������ת��Ϊiso��ʽ(yyyy-mm-dd),min_len��max_len���ڿ����û����볤�ȣ�����check��radio��select
 *			ָѡ��Ԫ�ظ���
 *          ����
 *			<input type="text" class="avp_number" min_len='8' max_len='8' warning='������8λ�绰����'>
 *			<input type="text" class="avp_date" warning='����������'>
 *          
 * 
 * @author $Author: gaojx $
 * @version $Revision: 1.7 $ $Date: 2008/03/17 11:44:23 $
 */

/**ÿ�µ���������*/
var daysInMonth = new Array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);

/**
 * �������ҳ�����ʱ��ִ�е�js����
 * 
 * @param func
 * @return
 */
function addLoadEvent(func) {
	var oldonload = window.onload;
	if (typeof window.onload != "function") {
		window.onload = func;
	} else {
		window.onload = function () {
			oldonload();
			func();
		};
	}
}
/**
 * ���ָ��Ԫ�ص���ʽ
 * 
 * @param oElement
 * @param value
 * @return
 */
function addClass(oElement, value) {
	if (!oElement.className) {
		oElement.className = value;
	} else {
		newClassName = oElement.className;
		newClassName += " ";
		newClassName += value;
		oElement.className = newClassName;
	}
}
/**
 * �滻ָ��Ԫ�ص���ʽ
 * 
 * @param oElement
 * @param value
 * @return
 */
function replaceClass(oElement, value) {
	oElement.className = value;
}

/**
 * ����ָ��������ʽ��Ŀǰ֧�����¼��ֱ��
 * cond ��������� detail����ϸ������ʾ��� list�������б� title-������ 
 * @return
 */
function addTableStyle() {
	if (!document.getElementsByTagName) {
		return false;
	}
	var tables = document.getElementsByTagName("table");
	for (var i = 0; i < tables.length; i++) {
		var table_type = tables[i].getAttribute("className");
		switch (table_type) {
		  case "cond_tab": //�������
			setCondTableStyle(tables[i]);
			break;
		  case "detail_tab": //��ϸ���
			setDetailTableStyle(tables[i]);
			break;
		  case "list_tab": //�����б�
			setListTableStyle(tables[i]);
			break;
		  case "title_tab"://������
			setTitleTableStyle(tables[i]);
			break;
		  case "msg_tab"://��ʾ���
			setMsgTableStyle(tables[i]);
			break;
		}
	}
}

/**
 * �趨��ʾ�����ʽ
 * @param oTable 
 * @return
 */
function setMsgTableStyle(oTable) {
	//���ñ����ʽ,ʵ�ʿ�ʹ����ʽ����н�һ���Ż�����
	//���ñ����ʽ
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "1");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "98%");

    //������ʾ��ʽ
	var cols = oTable.getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if ( j==0 ) {
				cols[j].setAttribute("align", "center");
				addClass(cols[j], "deep");
				addClass(cols[j], "msg_title");

			} else {
				addClass(cols[j], "light");
				addClass(cols[j], "msg_cont");
			}
		}
}

/**
 * �趨��������ʽ��Ϊ������������
 * @param oTable 
 * @return
 */
function setTitleTableStyle(oTable) {
	//���ñ����ʽ,ʵ�ʿ�ʹ����ʽ����н�һ���Ż�����
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "0");
	oTable.setAttribute("width", "98%");
	
	//�������е�INPUT��
	var inputs = oTable.getElementsByTagName("input");
	for (var i = 0; i < inputs.length; i++) {
		var sType = inputs[i].type;
		if (sType == "button") {
			addClass(inputs[i], "input");
		}
	}
}
/**
 * �����б�����ʾ��ʽ
 * 
 * @param oTable
 * @return
 */
function setListTableStyle(oTable) {
	//���ñ����ʽ,ʵ�ʿ�ʹ����ʽ����н�һ���Ż�����
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "100%");

    //������ʾ��ʽ
	var rows = oTable.getElementsByTagName("tr");
	
	//���ñ�������ʽ
	rows[0].setAttribute("bgColor", "#A3C0EE");
	rows[0].setAttribute("height", "22");
	rows[0].setAttribute("align", "center");
	for (var i = 1; i < rows.length; i++) {
		rows[i].setAttribute("height", "22");
		rows[i].setAttribute("bgColor", "#FFFFFF");
		
		//����������Ч��
		rows[i].onmouseover = function () {
			this.bgColor = "#CCCCCC";
		};
		//�������Ƴ�Ч��
		rows[i].onmouseout = function () {
			this.bgColor = "#FFFFFF";
		};
	}
}
/**
 * ������ϸģʽ��ʾ���
 * 
 * @param oTable
 * @return
 */
function setDetailTableStyle(oTable) {
	
	//���ñ����ʽ
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "2");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("bgColor", "#000000");
	oTable.setAttribute("width", "100%");

    //������ʾ��ʽ
	var rows = oTable.getElementsByTagName("tr");
	
	for (var i = 0; i < rows.length; i++) {
		var old = false;
		rows[i].setAttribute("height", "22");
		rows[i].setAttribute("bgColor", "#FFFFFF");

		var cols = rows[i].getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if (old) {
				addClass(cols[j], "light");
				old = false;
			} else {
				addClass(cols[j], "deep");
				old = true;
			}
		}
	}
}
/**
 * ��������������ʽ��
 * 
 * @param oTable
 * @return
 */
function setCondTableStyle(oTable) {
    
	//���ñ����ʽ
	oTable.setAttribute("width", "100%");
	oTable.setAttribute("border", "0");
	oTable.setAttribute("cellPadding", "1");
	oTable.setAttribute("cellSpacing", "1");
	oTable.setAttribute("align", "center");

    //������ʾ��ʽ
	var rows = oTable.getElementsByTagName("tr");
	for (var j = 0; j < rows.length; j++) {
		var old = false;
		rows[j].setAttribute("height", "22");

		var cols = rows[j].getElementsByTagName("td");
		for (var i = 0; i < cols.length; i++) {
			if (old ) {
				addClass(cols[i], "light");
				old = false;
			} else {
				addClass(cols[i], "deep");
				old = true;
			}
		}
	}
    //�������е�INPUT��
	var inputs = oTable.getElementsByTagName("input");
	for (var i = 0; i < inputs.length; i++) {
		var sType = inputs[i].type;
		if (sType == "text" || sType == "file" || sType == "textarea" || sType == "password") {
			var chk_type = inputs[i].getAttribute("className");
			if (chk_type == "avp_date") {
				var regDate = new RegExp("^\\d{1,4}([-]?(\\d{1,2}([-]?(\\d{1,2})?)?)?)?$", "i");
				//�ر���������
				inputs[i].style.imeMode = "Disabled";
				inputs[i].onkeypress = function () {
					return regInput(this, regDate, String.fromCharCode(event.keyCode));
				};
				inputs[i].onpaste = function () {
					return regInput(this, regDate, window.clipboardData.getData("Text"));
				};
				inputs[i].ondrop = function () {
					return regInput(this, regDate, event.dataTransfer.getData("Text"));
				};
				inputs[i].onblur = function () {
					return avpChkDate(this);
				};
			} else if (chk_type == "avp_number") {
					var regNum = new RegExp("^[-]?\\d*\\.?\\d*$", "i");
					//�ر���������
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regNum, String.fromCharCode(event.keyCode));
					};
					inputs[i].onpaste = function () {
						return regInput(this, regNum, window.clipboardData.getData("Text"));
					};
					inputs[i].ondrop = function () {
						return regInput(this, regNum, event.dataTransfer.getData("Text"));
					};
					
			}
			replaceClass(inputs[i], "text_white");
		}
		if (sType == "button"||sType == "reset") {
			replaceClass(inputs[i], "input");
		}
	}
}

/**
 * input��������֤��������
 * 
 * @param oElement
 * @param reg
 * @param inputStr
 * @return
 */
function regInput(oElement, reg, inputStr) {
	var docSel = document.selection.createRange();
	oSel = docSel.duplicate();
	oSel.text = "";
	var srcRange = oElement.createTextRange();
	oSel.setEndPoint("StartToStart", srcRange);
	var str = oSel.text + inputStr + srcRange.text.substr(oSel.text.length);
	return reg.test(str);
}

/**
 * �ַ������ڼ�麯��
 * 
 * @param dateStr
 * @return ���ڸ�ʽ��ȷ�������ع��ʱ�׼��ʽ���ַ��������򷵻� false
 */
function chkDateStr(dateStr) {
	var year = "";
	var month = "";
	var day = "";
	var firstPos = dateStr.indexOf("-");
	if (firstPos == -1) {
		year = dateStr.substr(0, 4);
		month = dateStr.substr(4, 2);
		day = dateStr.substr(6, 2);
	} else {
		var secPos = dateStr.indexOf("-", firstPos + 1);
		if (secPos == -1) {
			return false;
		}
		
		year = dateStr.substring(0, firstPos);
		month = dateStr.substring(firstPos+1 , secPos);
		day = dateStr.substring(secPos+1 , 10);
	}

	//��ֵ
	if (isNaN(year) || isNaN(month) || isNaN(day)) {
		return false;
	}
	//�ж���ĺϷ���,����parseInt��ǰ׺Ϊ '0' ���ַ����������˽��ƣ���ʹ��parseFloat
	var yearInt = parseFloat(year);
	if (yearInt > 3001 || yearInt < 1900) {
		return false;
	}
	//�ж��ºϷ���
	var monthInt = parseFloat(month);
	if (monthInt < 1 || monthInt > 12) {
		return false;
	} else {
		if (monthInt < 10) {
			month = "0" + monthInt;
		}
	}

	//�ж��յĺϷ���
	var dayInt = parseFloat(day);
	var maxdays = daysInMonth[monthInt - 1]; 
	//���´���
	if (2 == monthInt) {
		maxdays = ((0 == year % 4) && (0 != (year % 100))) || (0 == year % 400) ? 29 : 28;
	}
	if (dayInt < 1 || dayInt > maxdays) {
		return false;
	} else {
		if (dayInt < 10) {
			day = "0" + dayInt;
		}
	}
	return year + "-" + month + "-" + day;
}

/**
 * ָ��Ԫ�����ڼ�麯��
 * 
 * @param oElement
 * @return 
 */
function avpChkDate(oElement) {
	var dateStr = oElement.value;
	if (dateStr.length == 0) {
		return true;
	}
	var fmtDate = chkDateStr(dateStr);
	if (fmtDate) {
		oElement.value = fmtDate;
		return true;
	} else {
		alert("\u8bf7\u8f93\u5165\u6b63\u786e\u7684\u65e5\u671f\uff01");
		//oElement.focus();
		//oElement.select();
		return false;
	}
}
/**
 * ���ؼ�����Ϣ
 * 
 * @return 
 */
function hidLoadInfo(){
	var divLoad = document.getElementById("loading");
	if(divLoad){
		divLoad.style.visibility = "hidden";
	}
}


addLoadEvent(addTableStyle);
addLoadEvent(hidLoadInfo);

//----------------------------------------------------------------------------

/**
 *����һ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function avpPopUp(theUrl,sWidth,sHeight){
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   window.open(theUrl,'',parm);   
}

/**
 *����ַ���
 *
 */
function  randomChar(len)  {
  var  x="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
  var  tmp="";
  for(var  i=0;i<len;i++)  {
  	tmp  +=  x.charAt(Math.ceil(Math.random()*100000000)%x.length);
  }
  return  tmp;
}

/**
 *���ύ��ʽ����һ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function avpSubmitPopUp(formName,theUrl,sWidth,sHeight){
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var win_name = randomChar(10);
   var form;
   if(formName == ""){
   		form= document.forms[0];
   }else{
   		form= document.getElementById();
   } 
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   window.open('',win_name,parm);   
   
   var old_target = form.target;

   form.action=theUrl;
   form.target=win_name;
   form.submit();  
   form.target = old_target;
}

/**�ύ*/
function avpDoSubmit(theUrl){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
}

/**
 * ��ת��ť����
 * 
 * @return 
 */
function avpJumpSubmit(theUrl){
	dispLoadInfo();
	avpDoSubmit(theUrl);
	event.srcElement.disabled = true; 
}


/**
 * ������ת��ť����
 * 
 * @return 
 */
function avpHerfJumpSubmit(theUrl){
	dispLoadInfo();
	location.herf = theUrl;
	event.srcElement.disabled = true; 
}
/**
 * ��ʾ������Ϣ
 * 
 * @return 
 */
function dispLoadInfo1(){
	var divLoad = document.getElementById("loading");
	if(divLoad){
		divLoad.style.visibility = "visible";
	}
	var divData = document.getElementById("data_area");
	
	if(divData){
		divData.style.height = "10";
		divData.style.visibility = "hidden";
	}
}

/**
 * �ṩ��λ��ť����
 * 
 * @return 
 */
function avpReset(){
	oForm = document.forms[0];
	var els = oForm.elements;

	for(var i=0;i<els.length;i++){
		var sType = els[i].type;
		switch(sType){
			case "hidden":
					if((els[i].name).substring(0,2) == "p_"){
						if((els[i].name) != "p_reportkey"){
							els[i].value="";
						}
					}
				break;
			case "text":
			case "password":
			case "file":
			case "textarea":
					els[i].value="";
				break;
			case "checkbox":
			case "radio":
				var oElememts = document.getElementsByName(els[i].name);
				for(var j=0 ;j<oElememts.length;j++){
					oElememts[j].checked = false;
				}
				break;
			case "select-one":
			case "select-multiple":
				var oElememts = els[i].getElementsByTagName("option");
				for(var j=0 ;j<oElememts.length;j++){
					oElememts[j].selected = false;
				}
				els[i].selectedIndex = 0;
				break;  
		}
	}

}
/**
 * ����ҳ���ύ
 * 
 * @param theUrl
 * @return 
 */
function avpCondSubmit(theUrl) {
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
		if (els[i].max_len && (getElementValLen(els[i]) > els[i].max_len)) {
			isNotChkOk = true;
			break;
		}
	}
	//��֤��ͨ��,������ʾwarning,ͬʱ�ñ�Ԫ��ȡ�ý���
	if (isNotChkOk) {
		alert(els[i].warning);
		goBack(els[i]);
		return false;
	}else{
		dispLoadInfo();
		oForm.action=theUrl;
		oForm.submit();
		event.srcElement.disabled = true; 
	}
}

/**
 * ȡָ��Ԫ��ֵ�ĳ��ȣ�����ѡ��򣬷���ѡ��ֵ�ĸ���
 * 
 * @param oElememt
 * @return 
 */
function getElementValLen(oElememt) {
    //ȡ�ñ�Ԫ�ص�����
	var sType = oElememt.type;
	switch (sType) {
	  case "text":
	  case "hidden":
	  case "password":
	  case "file":
	  case "textarea":
		return len(oElememt.value);
	  case "checkbox":
	  case "radio":
		return getValLenChoose(oElememt);
	  case "select-one":
	  case "select-multiple":
		return getValLenSel(oElememt);
	}
}

/**
 * ȡָ��Ԫ��ֵ�ĳ��ȣ�����ѡ��򣬷���ѡ��ֵ�ĸ���
 * 
 * @param oForm
 * @return 
 */
function getValLenChoose(oElememt) {
	var sLen = 0;
    //ȡ�õ�һ��Ԫ�ص�name,�������Ԫ����
	var tmpels = document.getElementsByName(oElememt.name);
	for (var i = 0; i < tmpels.length; i++) {
		if (tmpels[i].checked) {
			sLen += 1;
		}
	}
	return sLen;
}
/**
* ȡselectԪ�أ�ѡ��ֵ�ĸ���
*/
function getValLenSel(oElememt) {
	var sLen = 0;
	for (var i = 0; i < oElememt.options.length; i++) {                                                        
        //��ѡ��������ʾѡ������Ϊvalue=""                   
		if (oElememt.options[i].selected && oElememt.options[i].value != "") {
			sLen += 1;
		}
	}
	return sLen;
}
/**
* �������ʹ����Ԫ�صõ�����
*/
function goBack(oElememt) {
    //ȡ�ñ�Ԫ�ص�����
	var sType = oElememt.type;
	switch (sType) {
	  case "text":
	  case "hidden":
	  case "password":
	  case "file":
	  case "textarea":
		oElememt.focus();
		var rng = oElememt.createTextRange();
		rng.collapse(false);
		rng.select();
	  case "checkbox":
	  case "radio":
		var oElememts = document.getElementsByName(oElememt.name);
		oElememts[0].focus();
	  case "select-one":
	  case "select-multiple":
		oElememt.focus();
	}
}

/**
*��ѡ����select��Ϣ��copy��textarea��
*
*/
function cpSelToText(objList,textId,appendChar){
	    var objText = document.getElementById(textId);
		var len = objList.value.length;
		var addStr = appendChar + objList.value + appendChar;
 
		if(objText.value == ""){
			objText.value = addStr;
			
        }else{
			objText.focus();
			var range = document.selection.createRange();
            range.moveStart("character", -1);
            range.select();
            if(range.text.length == 0){
				objText.value = objText.value + addStr;
            }else{
                 range.text = range.text + addStr;
				 len = range.text.length;
             }
			range.select();
			range.moveStart("character", len);
         }
		
		objText.focus();
		
	}
	
	
/**
 *�������е�������ʽ
 */
	function setCebDate(){
   	//�������е�INPUT��
		var inputs = document.getElementsByTagName("input");
		for (var i = 0; i < inputs.length; i++) {
			var sType = inputs[i].type;
			if (sType == "text" ){
				if(inputs[i].getAttribute("className") == "ist_date") {
					var regDate = new RegExp("^\\d{1,4}([-]?(\\d{1,2}([-]?(\\d{1,2})?)?)?)?$", "i");
					//�ر���������
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regDate, String.fromCharCode(event.keyCode));
					}
					inputs[i].onpaste = function () {
						return regInput(this, regDate, window.clipboardData.getData("Text"));
					}
					inputs[i].onblur = function () {
						return avpChkDate(this);
					}
				}else if(inputs[i].getAttribute("className") == "ceb_number") {
					var regNum = new RegExp("^[-]?\\d*\\.?\\d*$", "i");
					//�ر���������
					inputs[i].style.imeMode = "Disabled";
					inputs[i].onkeypress = function () {
						return regInput(this, regNum, String.fromCharCode(event.keyCode));
					};
					inputs[i].onpaste = function () {
						return regInput(this, regNum, window.clipboardData.getData("Text"));
					};
					inputs[i].ondrop = function () {
						return regInput(this, regNum, event.dataTransfer.getData("Text"));
					};
					
				}
				replaceClass(inputs[i], "text_white");
			}		
		}
	}
	
	 
function ShortcutKey(){ 
		if(window.event.keyCode==13) {
			var qry = document.getElementById('avp_query'); 
			if(qry){
				qry.onclick();
			}else{
			    var turnPage = document.getElementById('intPage');
			    if(turnPage){
			        goPage();
			    }
			} 
	}
}

var time_begin = (new Date()).getTime();
function show_time()
{

	var time_now=(new Date()).getTime();

	var time_distance=time_now-time_begin;
	var int_minute=Math.floor(time_distance/60000)
	time_distance-=int_minute*60000;
	var int_second=Math.floor(time_distance/1000)

	var msgTxt = document.getElementById("msgTxt");
	if(msgTxt){
		msgTxt.innerHTML="<font color='#FF0000'>���ڼ������ݣ��Ѳ�ѯ["+int_minute+":"+int_second+"]�룬���Ժ�...</font>";
	}
	setTimeout("show_time()",1000);
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

	var bgObj=document.createElement("div");
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
	document.body.appendChild(bgObj);
	
	var msgObj=document.createElement("div")
	msgObj.setAttribute("id","msgDiv");
	msgObj.setAttribute("align","center");
	msgObj.style.background="white";
	msgObj.style.border="1px solid " + bordercolor;
	msgObj.style.position = "absolute";
    msgObj.style.left = "50%";
    msgObj.style.top = "50%";
    msgObj.style.font="12px/1.6em Verdana, Geneva, Arial, Helvetica, sans-serif";
    msgObj.style.marginLeft = "-225px" ;
    msgObj.style.marginTop = -75+document.documentElement.scrollTop+"px";
    msgObj.style.width = msgw + "px";
    msgObj.style.height =msgh + "px";
    msgObj.style.textAlign = "center";
    msgObj.style.lineHeight ="25px";
    msgObj.style.zIndex = "10001";
   
	var title=document.createElement("h4");
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
	document.body.appendChild(msgObj);
	document.getElementById("msgDiv").appendChild(title);
	var txt=document.createElement("p");
	txt.style.margin="1em 0"
	txt.setAttribute("id","msgTxt");
    txt.innerHTML="<font color='#FF0000'>���ڼ������ݣ��Ѳ�ѯ[0:0]�룬���Ժ�...</font>";
    document.getElementById("msgDiv").appendChild(txt);
    setTimeout("show_time()",1000);
}
document.onkeydown=ShortcutKey