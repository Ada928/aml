/**����ҳ��title**/
 document.write("<title> ::��ϴǮϵͳ:: </title>"); 
 
 




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
 * Checks to see if the current browser is compatible with the entire library
 */
function isCompatible(other) {
    // Use capability detection to check requirements
    if( other===false 
        || !Array.prototype.push
        || !Object.hasOwnProperty
        || !document.createElement
        || !document.getElementsByTagName
        ) {
        alert('TR- if you see this message isCompatible is failing incorrectly.');
        return false;
    }
    return true;
}

/**
 * document.getElementById(); replacement.
 */
function doById() {
    var elements = new Array();
    
    // Find all the elements supplied as arguments
    for (var i = 0; i < arguments.length; i++) {
        var element = arguments[i];
        
        // If the argument is a string assume it's an id
        if (typeof element == 'string') {
            element = document.getElementById(element);
        }
        
        // If only one argument was supplied, return the element immediately
        if (arguments.length == 1) {
            return element;
        }
        
        // Otherwise add it to the array
        elements.push(element);
    }
    
    // Return the array of multiple requested elements
    return elements;
}

/**
 * Retrieve an array of element base on a class name
 */
function getElementsByClassName(className, tag, parent){
    parent = parent || document;
    if(!(parent = doById(parent))) return false;
    
    // Locate all the matching tags
    var allTags = (tag == "*" && parent.all) ? parent.all : parent.getElementsByTagName(tag);
    var matchingElements = new Array();
    
    // Create a regular expression to determine if the className is correct
    className = className.replace(/\-/g, "\\-");
    var regex = new RegExp("(^|\\s)" + className + "(\\s|$)");
    
    var element;
    // Check each element
    for(var i=0; i<allTags.length; i++){
        element = allTags[i];
        if(regex.test(element.className)){
            matchingElements.push(element);            
        }
    }
    
    // Return any matching elements
    return matchingElements;
}

/**
 * Register an event listener on an element
 */
function addEvent( node, type, listener ) {
    // Check compatibility using the earlier method
    // to ensure graceful degradation
    if(!isCompatible()) { return false }
    if(!(node = doById(node))) return false;
    
    if (node.addEventListener) {
        // W3C method
        node.addEventListener( type, listener, false );
        return true;
    } else if(node.attachEvent) {
        // MSIE method
        node['e'+type+listener] = listener;
        node[type+listener] = function(){node['e'+type+listener]( window.event );}
        node.attachEvent( 'on'+type, node[type+listener] );
        return true;
    }
    
    // Didn't have either so return false
    return false;
}
/**
 * Prevents the default event in the event flow (such as following the href in an anchor).
 */
function preventDefault(eventObject) {
    eventObject = eventObject || getEventObject(eventObject);
    if(eventObject.preventDefault) {
        eventObject.preventDefault();
    } else {
        eventObject.returnValue = false;
    }
}

function setInputStyle() {  
    //�������е�INPUT��
	var inputs = document.getElementsByTagName("input");
	for (var i = 0; i < inputs.length; i++) {
		var sType = inputs[i].type;
		if (sType == "text" || sType == "file"  || sType == "password") {
			
			//IE9 ��֧�� inputs[i].getAttribute("class"); iE8������IE֧��inputs[i].getAttribute("className");
			var chk_type = inputs[i].getAttribute("className") == null ? inputs[i].getAttribute("class") : inputs[i].getAttribute("className");
			if(chk_type && chk_type != 'null'){
				if (chk_type == "awp_date" || chk_type.indexOf('awp_date') == 0) {
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
						return awpChkDate(this);
					};
				} else if (chk_type == "awp_number" || chk_type.indexOf('awp_number') == 0) {
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
				} else if (chk_type == "awp_mobile" || chk_type.indexOf('awp_mobile') == 0) {	
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
						inputs[i].onblur = function () {
							return awpChkMobile(this);
						};	
				  // �����ʼ�У��															
				} else if (chk_type == "awp_email" || chk_type.indexOf('awp_email') == 0) {						
						inputs[i].onblur = function () {
							return awpChkEmail(this);
						};		
				 //ֻ�����ֺ�Ӣ���ַ���																	
				} else if(chk_type == "awp_num_en" || chk_type.indexOf('awp_num_en') == 0){
					var regNumchar = new RegExp("^[A-Za-z0-9]+$", "i");
						//�ر���������
						inputs[i].style.imeMode = "Disabled";
						inputs[i].onkeypress = function () {
							return regInput(this, regNumchar, String.fromCharCode(event.keyCode));
						};
						inputs[i].onpaste = function () {
							return regInput(this, regNumchar, window.clipboardData.getData("Text"));
						};
						inputs[i].ondrop = function () {
							return regInput(this, regNumchar, event.dataTransfer.getData("Text"));
						};				
															
				}
				else if (chk_type == "awp_only_number") {
					var regNum = new RegExp("^[0-9]*$", "i");
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
				
			}
			replaceClass(inputs[i], "awp_input");
		}
		if (sType == "button"||sType == "reset") {
			//replaceClass(inputs[i], "botton");
			var btn_type = inputs[i].getAttribute("optType");
			
			if (btn_type == "awp_add") {//������ť
				inputs[i].onclick = function () {
					if(this.optPrompt){//�ж��Ƿ���ʾ��Ϣ
				   		if(!confirm(this.optPrompt)){
             		   		return false;
            		  	}
				   	}
				    awpSubmit(this.optAction,this.form,this.submitType,this.openWinName,this.openWinWidth,this.openWinHeight);
				    return true;
				};
			} else if (btn_type == "awp_modi") {
				inputs[i].onclick = function () {
					if(this.optPrompt){//�ж��Ƿ���ʾ��Ϣ
				   		if(!confirm(this.optPrompt)){
             		   		return false;
            		  	}
				   	}
				   	if(!this.form){//����û�û������form����ȡ��һ��
				   		this.form = document.forms[0];
				   	}
				   	if(	CheckBoxCheckedNum(this.form) != 1){
						if(this.optWaring){//�ж��Ƿ���ʾ��Ϣ
							alert(this.optWaring);
					   	}else{
							alert("��ѡ��һ����");
					   	}
           		   		return false;
				   	}
					alert(this.openWinWidth);
	
				    awpSubmit(this.optAction,this.form,this.submitType,this.openWinName,this.openWinWidth,this.openWinHeight);
				    return true;
				};
			} else if(btn_type == "awp_del"){
				inputs[i].onclick = function () {
					if(this.optPrompt){//�ж��Ƿ���ʾ��Ϣ
				   		if(!confirm(this.optPrompt)){
             		   		return false;
            		  	}
				   	}
				   	if(!this.form){//����û�û������form����ȡ��һ��
				   		this.form = document.forms[0];
				   	}
				   	if(	CheckBoxCheckedNum(this.form) < 1){
           		   		return false;
				   	}
				    awpSubmit(this.optAction,this.form,this.submitType,this.openWinName,this.openWinWidth,this.openWinHeight);
				    return true;
				};
			} else if(chk_type == "awp_qry"){
				inputs[i].onclick = function () {
					if(this.optPrompt){//�ж��Ƿ���ʾ��Ϣ
				   		if(!confirm(this.optPrompt)){
             		   		return false;
            		  	}
				   	}
				   	if(!this.form){//����û�û������form����ȡ��һ��
				   		this.form = document.forms[0];
				   	}
				    awpSubmit(this.optAction,this.form,this.submitType,this.openWinName,this.openWinWidth,this.openWinHeight);
				    return true;
				};
			}
			replaceClass(inputs[i], "awp_button");
			
		}
	} 
	
}


/**
   * ����:�����ַ����ĳ��ȣ�������2λ��ʾ
   * @param s ��������ַ���
   * @return �ַ����ĳ���
   */
function len(s) {
	var ln = 0, i = 0;
	for (i = 0; i < s.length; i++) {
		c = s.charAt(i);
		if (c >= " " && c <= "~") { // ���е��ֽ�ASCII
			ln += 1;
		} else {
			ln += 2;
		}
	}
	return ln;
}
/**
 * ���ò�ѯ�б���ʽ��
 * 
 * @param oTable
 * @return
 */

function setCondStyle() {
    //������ʾ��ʽ
	var oCondDiv=getElementsByClassName('awp_cond','div');

	if(oCondDiv[0]==null){
		return false;
	}

	var rows = oCondDiv[0].getElementsByTagName("tr");
	
	for (var i = 0; i < rows.length; i++) {
		var old = false;
		var cols = rows[i].getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if (old) {
				cols[j].setAttribute("align", "left");
				old = false;
			} else {
				old = true;
			}
		}
	}
	
	var imgs = oCondDiv[0].getElementsByTagName("img");
	for (var i = 0; i < imgs.length; i++) {
		addClass(imgs[i], "dateselect");
	}
		
}


/**
 * ���������б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */

/**
 * ���������б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */
function setListStyle() { 	
    // ��ȡ��Ҫ������ʽ������DIV
	var oDivs = getElementsByClassName('awp_list','div');
	if (oDivs.length == 0 || oDivs[0] == null) {
		return;
	}
	
		for (var divIterator = 0; divIterator < oDivs.length; divIterator++) {
			var oDiv = oDivs[divIterator];
			//��̬����div��height��
						
			var oDivheight = 480;
			if (oDivs.length==1){
				var oheight = setListHeight(oDiv);
				oDivheight = Math.min(oDiv.firstChild.offsetHeight+30, oheight);
			}else{
				oDivheight = Math.min(oDiv.firstChild.offsetHeight+30, 480);
			}
			oDiv.style.height = oDivheight;
			
			//------begin------
			var tabs = oDiv.getElementsByTagName("table");
			for(var i=0;i<tabs.length;i++){
				tabs[i].setAttribute("cellspacing","0");
				tabs[i].setAttribute("cellpadding","0");
				tabs[i].cellSpacing = "0";//IE9����
				tabs[i].cellpadding = "0";
			}
			var cols = oDiv.getElementsByTagName("td");
			for(var i=0;i<cols.length;i++){	
				if(cols[i].innerHTML==""){
					cols[i].innerHTML = "&nbsp;";
				}
			}
			//------end------
			
			var rows = oDiv.getElementsByTagName("tr");
			addClass(rows[0], "awp_list_title");
			
			var cells = rows[0].getElementsByTagName("td");
			for (var i = 0; i < cells.length; i++) {
				addClass(cells[i], "fixedCol");	
				if (i==0) {
					if ((cells[i].innerText=="\u53d6\u6d88")||(cells[i].innerText=="\u5168\u90e8")) {
						cells[i].style.cursor="hand";
						cells[i].onclick = function() {
							//selectAllCheckBox(this,document.forms[0]);
							selectAllCheckBox_t(this);
						}
					}
				}
			}
			
			for (var i = 1; i < rows.length; i++) {
				rows[i].setAttribute("height", "26");
				
				if ( 0 == i%2  ) {
					//rows[i].bgColor = "#FAFAFA";
					//rows[i].orgColor = "#FAFAFA";
					rows[i].className = 'listdeepbg';
					rows[i].orgColor = 'listdeepbg';
					
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FAFAFA";
						this.className = 'listdeepbg';
					};
				} else {
					//rows[i].bgColor = "#FFFFFF";
					//rows[i].orgColor = "#FFFFFF";
					rows[i].className = 'listlightbg';
					rows[i].orgColor = 'listlightbg';
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FFFFFF";
						this.className = 'listlightbg';
					};
				}
				
				//����������Ч��
				rows[i].onmouseover = function () {
					if(this.id=='sel_row'){
						return ;
					}
					//this.bgColor = "#FAE7BE";
					this.className = 'listhoverbg';
				};
				
				//��굥��Ч��
				rows[i].onclick = function () {
					var sel = document.getElementById('sel_row');
					if(sel){
						sel.className = sel.orgColor;
						sel.id='';
					}
					
					this.id ='sel_row';
					this.className = 'listclickbg';
					//this.bgColor = "#FAE7BE";
				};
			}
		}

}

/**
 * ���������б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */
function setAvpListStyle() { 	
    // ��ȡ��Ҫ������ʽ������DIV
	var oDivs = getElementsByClassName('avp_list','div');
	if (oDivs.length == 0 || oDivs[0] == null) {
		return;
	}
	
	for (var divIterator = 0; divIterator < oDivs.length; divIterator++) {
		var oDiv = oDivs[divIterator];
		//��̬����div��height��
		
		//------begin------
		var tabs = oDiv.getElementsByTagName("table");
		for(var i=0;i<tabs.length;i++){
			tabs[i].setAttribute("cellspacing","0");
			tabs[i].setAttribute("cellpadding","0");
			tabs[i].cellSpacing = "0";//IE9����
			tabs[i].cellpadding = "0";
		}
		//------end------
		
		var rows = oDiv.getElementsByTagName("tr");
		addClass(rows[0], "awp_list_title");
		
		
//		for (var i = 1; i < rows.length; i++) {
//			rows[i].setAttribute("height", "26");
//			
//			if ( 0 == i%2  ) {
//				rows[i].bgColor = "#FAFAFA";
//				rows[i].orgColor = "#FAFAFA";
//				rows[i].onmouseout = function () {
//					if(this.id=='sel_row'){
//						return ;
//					}
//					this.bgColor = "#FAFAFA";
//				};
//			} else {
//				rows[i].bgColor = "#FFFFFF";
//				rows[i].orgColor = "#FFFFFF";
//				rows[i].onmouseout = function () {
//					if(this.id=='sel_row'){
//						return ;
//					}
//					this.bgColor = "#FFFFFF";
//				};
//			}
//			
//			//����������Ч��
//			rows[i].onmouseover = function () {
//				if(this.id=='sel_row'){
//					return ;
//				}
//				this.bgColor = "#FAE7BE";
//			};
//			
//			//��굥��Ч��
//			rows[i].onclick = function () {
//				var sel = document.getElementById('sel_row');
//				if(sel){
//					sel.bgColor = sel.orgColor;
//					sel.id='';
//				}
//				
//				this.id ='sel_row';
//				this.bgColor = "#FAE7BE";
//			};
//		}
	}
}
/*****������кϲ�ʱ�б���ʽ****/
function hasClass(element, className) {
	var reg = new RegExp('(\\s|^)'+className+'(\\s|$)');
	return element.className.match(reg);
} 
function setListStyle2(){
var oDivs = getElementsByClassName('awp_list2','div');
	if (oDivs.length == 0 || oDivs[0] == null) {
		return;
	}
	
		for (var divIterator = 0; divIterator < oDivs.length; divIterator++) {
			var oDiv = oDivs[divIterator];
			//��̬����div��height��
						
			var oDivheight = 480;
			if (oDivs.length==1){
				var oheight = setListHeight(oDiv);
				oDivheight = Math.min(oDiv.firstChild.offsetHeight+30, oheight);
			}else{
				oDivheight = Math.min(oDiv.firstChild.offsetHeight+30, 480);
			}
			oDiv.style.height = oDivheight;
			
			var rows = oDiv.getElementsByTagName("tr");
			addClass(rows[0], "awp_list_title2");
			
			var cells = rows[0].getElementsByTagName("td");
			for (var i = 0; i < cells.length; i++) {
				addClass(cells[i], "fixedCol");	
				if (i==0) {
					if ((cells[i].innerText=="\u53d6\u6d88")||(cells[i].innerText=="\u5168\u90e8")) {
						cells[i].style.cursor="hand";
						cells[i].onclick = function() {
							//selectAllCheckBox(this,document.forms[0]);
							selectAllCheckBox_t(this);
						}
					}
				}
			}
			
			for (var i = 1; i < rows.length; i++) {
				rows[i].setAttribute("height", "26");
				if(hasClass(rows[i],'awp_list_title2')){}else{
				if ( 0 == i%2  ) {
					//rows[i].bgColor = "#FAFAFA";
					//rows[i].orgColor = "#FAFAFA";
					rows[i].className = 'listdeepbg';
					rows[i].orgColor = 'listdeepbg';
					
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FAFAFA";
						this.className = 'listdeepbg';
					};
				} else {
					//rows[i].bgColor = "#FFFFFF";
					//rows[i].orgColor = "#FFFFFF";
					rows[i].className = 'listlightbg';
					rows[i].orgColor = 'listlightbg';
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FFFFFF";
						this.className = 'listlightbg';
					};
				}
				
				//����������Ч��
				rows[i].onmouseover = function () {
					if(this.id=='sel_row'){
						return ;
					}
					//this.bgColor = "#FAE7BE";
					this.className = 'listhoverbg';
				};
				
				//��굥��Ч��
				rows[i].onclick = function () {
					var sel = document.getElementById('sel_row');
					if(sel){
						sel.className = sel.orgColor;
						sel.id='';
					}
					
					this.id ='sel_row';
					this.className = 'listclickbg';
					//this.bgColor = "#FAE7BE";
				};
			}}
		}
}

/****report_table_style���ñ�������ʽ****/
function report_table_style(){
var report_tableh = getElementsByClassName('awp_head','table');
	for (var i = 0; i < report_tableh.length; i++) {
		 report_tableh[i].removeAttribute("border");
		 report_tableh[i].removeAttribute("style");
	}
	var report_tablel = getElementsByClassName('awp_list','table');
	for (var i = 0; i < report_tablel.length; i++) {
		 report_tablel[i].removeAttribute("border");
		 report_tablel[i].removeAttribute("style");
	}
	var report_tablef = getElementsByClassName('awp_foot','table');
	for (var i = 0; i < report_tablef.length; i++) {
		 report_tablef[i].removeAttribute("border");
		 report_tablef[i].removeAttribute("style");
	}
    var reportr = getElementsByClassName('awp_body_tr','tr');
	for (var i = 0; i < reportr.length; i++) {
		  reportr[i].onmouseover = function () {
			this.bgColor = "#FFFDE5";
		  };
		  reportr[i].onmouseout = function () {
			this.bgColor = "";
		  };
	};	
}
/**
 * ���ö�̬�����б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */
function setdynamicListStyle() { 
    // ��ȡ��Ҫ������ʽ������DIV
	var oDivs = getElementsByClassName('awp_dynamic_list','div');
	if (oDivs.length == 0 || oDivs[0] == null) {
		return;
	}
	
		for (var divIterator = 0; divIterator < oDivs.length; divIterator++) {
			var oDiv = oDivs[divIterator];
			//��̬����div��height��
						
			
			var rows = oDiv.getElementsByTagName("tr");
			addClass(rows[0], "awp_dynamic_list_title");
			
			var cells = rows[0].getElementsByTagName("td");
			for (var i = 0; i < cells.length; i++) {
				addClass(cells[i], "fixedCol");	
				if (i==0) {
					if ((cells[i].innerText=="\u53d6\u6d88")||(cells[i].innerText=="\u5168\u90e8")) {
						cells[i].style.cursor="hand";
						cells[i].onclick = function() {
							//selectAllCheckBox(this,document.forms[0]);
							selectAllCheckBox_t(this);
						}
					}
				}
			}
			
			for (var i = 1; i < rows.length; i++) {
				rows[i].setAttribute("height", "26");
				
				if ( 0 == i%2  ) {
					//rows[i].bgColor = "#FAFAFA";
					//rows[i].orgColor = "#FAFAFA";
					rows[i].className = 'listdeepbg';
					rows[i].orgColor = 'listdeepbg';
					
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FAFAFA";
						this.className = 'listdeepbg';
					};
				} else {
					//rows[i].bgColor = "#FFFFFF";
					//rows[i].orgColor = "#FFFFFF";
					rows[i].className = 'listlightbg';
					rows[i].orgColor = 'listlightbg';
					rows[i].onmouseout = function () {
						if(this.id=='sel_row'){
							return ;
						}
						//this.bgColor = "#FFFFFF";
						this.className = 'listlightbg';
					};
				}
				
				//����������Ч��
				rows[i].onmouseover = function () {
					if(this.id=='sel_row'){
						return ;
					}
					//this.bgColor = "#FAE7BE";
					this.className = 'listhoverbg';
				};
				
				//��굥��Ч��
				rows[i].onclick = function () {
					var sel = document.getElementById('sel_row');
					if(sel){
						sel.className = sel.orgColor;
						sel.id='';
					}
					
					this.id ='sel_row';
					this.className = 'listclickbg';
					//this.bgColor = "#FAE7BE";
				};
			}
		}
}


/**
* ��ֻ��һ��awp_list����ʽ�����У���̬�޸�list��ʾ�ĳ��ȡ�
* @param oDiv ����oDivΪ��Ҫ��̬��ʾ��list��
*
*/
function setListHeight(oDiv){
	var oc = 1;
	od = oDiv;
	otheight = oDiv.offsetTop;
	while (od.nextSibling!=null){
		oc=oc+1;
		od=od.nextSibling
		if (od.tagName=="DIV"){;
			otheight = otheight+od.offsetHeight;
		}
	}		
	otheight=otheight+oc*8;
	var oheight = oDiv.offsetParent.offsetHeight - otheight; 
	if (oheight<100){
		oheight = 100;
	}
	return oheight;
}
/**
 * ����ҳǩ��ʾ��ʽ
 * 
 * @param oTable
 * @return
 */

function setTabPanelStyle() {
    //������ʾ��ʽ
	var oDiv=getElementsByClassName('awp_tabpanel','div');

	if(oDiv[0]==null){
		return false;
	}
   for(n=0;n<oDiv.length;n++){
	var rows = oDiv[n].getElementsByTagName("tr");
   
	for (var i = 0; i < rows.length; i++) {
		var old = false;
		var cols = rows[i].getElementsByTagName("td");		
		for (var j = 0; j < cols.length; j++) {
			var alink = cols[j].getElementsByTagName("a");				
			if (alink.length==1) {
				addClass(cols[j], "nsfontbold");
				addClass(alink[0], "hh");
			} else {
				addClass(cols[j], "fontbold");
			}
		}
	}				
		var cols2 = rows[0].getElementsByTagName("td");
	    for(var i = 0; i< cols2.length;i++){
		  if (0 == i%2) { 
		    rows[0].insertCell(i);//alert(i);
			addClass(cols2[i],"awp_tabspit");
		   }
		}
   }
}
/**
 * ��ʾѡ���е���ϸ��Ϣ
 * 
 * @param oTable
 * @return
 */
function openDetailWin(oTr)
	{
		var oTb = oTr.parentNode;
		var oTitleTrs = oTb.getElementsByTagName('tr');
  	    var win_name = randomChar(10);
		var oTitleTds = oTitleTrs[0].getElementsByTagName('td');
		var oDataTds = oTr.getElementsByTagName('td');

		var windowHTML = "<table >";
		for (var i = 0; i < oTitleTds.length; i++) {
			windowHTML += "<tr><td> "
				+ oTitleTds[i].innerHTML 
				+ "</td><td >"
				+ (oDataTds[i].innerHTML).replace(/&amp;/g,'&');  
				+ "</td></tr>";
		}

		windowHTML += "</table>";
		var det_win = window.open('../../platform/pub/blank.jsp',win_name,'height=400,width=600,toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no');  
		
		var myform = document.getElementById("submit_form");
		if(myform == null){
			myform = document.createElement("form");
			myform.setAttribute('id','submit_form');
			document.body.appendChild(myform);
		}
		var myinput = document.getElementById("detail_data");
		if(myinput == null){
			myinput = document.createElement("<input name='detail_data' id='detail_data' >");   
			myinput.setAttribute('type','hidden');
			myform.appendChild(myinput);
		}
    	myinput.value = windowHTML;

		myform.action = '<%=request.getContextPath()%>/avp/template/tpla_chk_detail.jsp';
		myform.method="post"
		myform.target = win_name;
		myform.submit();
		det_win.focus();
	}




/**
 * ����������ϸ�б�����޸��б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */

function setDetailStyle() {
    //������ʾ��ʽ
	var oDiv=getElementsByClassName('awp_detail','div');

	if(oDiv[0]==null){
		return false;
	}
for(n=0;n<oDiv.length;n++){//newadd
	var rows = oDiv[n].getElementsByTagName("tr");
	
	for (var i = 0; i < rows.length; i++) {
		var old = false;
		var cols = rows[i].getElementsByTagName("td");
		for (var j = 0; j < cols.length; j++) {
			if (old) {
				addClass(cols[j], "light");
				cols[j].setAttribute("align", "left");
				old = false;
			} else {
				addClass(cols[j], "deep");
				cols[j].setAttribute("width", "20%");
				old = true;
			}
		}
	}
	
	var imgs = oDiv[n].getElementsByTagName("img");
	for (var i = 0; i < imgs.length; i++) {
		addClass(imgs[i], "dateselect");
		if(imgs[i].previousSibling.name)
		if(imgs[i].previousSibling.getAttribute("name")=="arrangemode"){replaceClass(imgs[i],"");}
	}	
	var browser=navigator.appName;
	var b_version=navigator.appVersion;
	var version=b_version.split(";");
	if(browser=="Microsoft Internet Explorer"){
		var trim_Version=version[1].replace(/[ ]/g,"");
	}
	if(browser=="Microsoft Internet Explorer" && trim_Version<"MSIE9.0"){
		if(oDiv[n].scrollHeight>oDiv[n].clientHeight||oDiv[n].offsetHeight>oDiv[n].clientHeight){
			oDiv[n].style.paddingBottom = 12+'px';
		}else{
			oDiv[n].style.paddingBottom = 0+'px';
		}
	}
	/**��ʱ���� by jinlq 2011-07-21*/
	/**
	var textareas = oDiv[n].getElementsByTagName("textarea");
	for (var i = 0; i < textareas.length; i++) {
		textareas[i].ondblclick = function() {
			openEditWin(this);
		}
	}
	*/
}//newadd
}






/**
 * �趨��ʾ�����ʽ
 * @param oTable 
 * @return

function setMsgTableStyle() {
	var oDiv = getElementsByClassName('awp_msgtab','div');
						
	if(oDiv[0] == null ){
		return ;
	}	
	var rows = oDiv[0].getElementsByTagName("tr");			
	for (var i = 0; i < rows.length; i++) {
		//������ʾ��ʽ
		var cols = rows[i].getElementsByTagName("td");	
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
}
 */
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
function awpChkDate(oElement) {
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
		oElement.value = "";
		oElement.focus();
//		oElement.select();
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




addLoadEvent(setInputStyle);
addLoadEvent(setTabPanelStyle);
addLoadEvent(setCondStyle);
addLoadEvent(setListStyle);
addLoadEvent(setListStyle2);
addLoadEvent(setDetailStyle);
addLoadEvent(hidLoadInfo);
//addLoadEvent(setMsgTableStyle);
addLoadEvent(setdynamicListStyle);
addLoadEvent(report_table_style);
addLoadEvent(setAvpListStyle);


/**
 *����һ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function avpPopUp(strUrl,sWidth,sHeight){
   window.status = "��ӭʹ�ñ��������ܱ���ƽ̨";
   var name,value,i,actUrl;
   var tmphtml = '';
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var win_name = randomChar(10);

   var myform = document.getElementById("submit_form");
   if(myform == null){
	   myform = document.createElement("form");
	   myform.setAttribute('id','submit_form');
	   document.body.appendChild(myform);
   }
   
   var num= strUrl.indexOf("?");
	if(num > 0){
		actUrl = strUrl.substring(0,num);
		var arrtmp=strUrl.substr(num+1).split("&");
		for(i=0;i < arrtmp.length;i++){
			num=arrtmp[i].indexOf("=");
			if(num>0){
				name=arrtmp[i].substring(0,num);
				value=arrtmp[i].substr(num+1);
				tmphtml = tmphtml + ' <input type="hidden" name="'+name+'" value="'+value+'"> ';
	    	}
     	}
	}else{
		actUrl = strUrl;
	}
	myform.innerHTML = tmphtml;
	myform.action = actUrl;
	myform.method="post"
	myform.target = win_name;
	window.open('../../platform/pub/blank.jsp',win_name,parm);   
	myform.submit();	
}
/*
 *���ύ��ʽ����ͬһ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function avpSubmitPopUpSameNameWindow(formName,windowsName,theUrl,sWidth,sHeight){
   var form;
   if(formName == ""){
   		form = document.forms[0];
   }else{
   		form = document.getElementsByName(formName)[0];
   } 
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var oOpener = window.open('../../platform/pub/blank.jsp',windowsName,parm);   
   
   var old_target = form.target;

   form.action=theUrl;
   form.target=windowsName;
   form.submit();  
   form.target = old_target;
   if (oOpener) {
   		oOpener.focus();
   }
}


/**
 *���ύ��ʽ����ͬһ��ָ��ȫ���Ĵ���
 *
 */
function avpSubmitPopUpFullScreenAndSameWindow(formName,windowName,theUrl){
   var form;
   if(formName == ""){
   		form = document.forms[0];
   }else{
   		form = document.getElementsByName(formName)[0];
   } 
   
   var openwin = openFullWin('../../avp/template/blank.jsp', windowName);
   
   var old_target = form.target;

   form.action=theUrl;
   form.target=windowName;
   form.submit();  
   form.target = old_target;
   if (openwin) {
 		openwin.focus();
   }
}


/**�ύ*/
function awpDoSubmit(theUrl){
	document.forms[0].action=theUrl;
	document.forms[0].submit();
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
function searchReset(){
	oForm = document.forms[0];
	var els = oForm.elements;

	for(var i=0;i<els.length;i++){
		var sType = els[i].type;
		switch(sType){
			case "hidden":
					if((els[i].name).substring(0,2) == "p_"){
						els[i].value="";
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
 * ����ҳǩ�л����
 * 
 * @return 
 */
function fdpReset(){
	oForm = document.forms[0];
	var els = oForm.elements;

	for(var i=0;i<els.length;i++){
		var sType = els[i].type;
		switch(sType){
			case "hidden":
					if(els[i].name== "creator" || els[i].name== "respet" || els[i].name== "procid" || els[i].name== "prodid" ){
						els[i].value="";
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
	oForm.method="post";
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
//			alert(els[i].getAttribute("className"));
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
				  //alert("<<<<<<<"+num+"  left=="+left_value+"   ===right==="+right_value);
				  if(num.indexOf('-')!=-1){//���� 
				  	  left1=parseFloat(left1)+1;
				  } 
				  
				  if(len(left_value) > left1){
				  	  // els[i].warning='�����������'+left1+'�����֣�';  
						   isNotChkOk = true;
			         break;
				 	}
				 	
				 	if(len(right_value) > right1){  
				 		  // els[i].warning='С���������'+right1+'�����֣�';  
						   isNotChkOk = true;
			         break;
				 	}
				  
			}
			 
		}
		//end  
	}
  
	//��֤��ͨ��,������ʾwarning,ͬʱ�ñ�Ԫ��ȡ�ý���
	if (isNotChkOk) {
	  if (els[i].warning) {
        alert(els[i].warning);
    }else{
        alert("��������ȷ�Ĳ���ֵ");
    }
		goBack(els[i]);
		return false;
	}else{
		
		// ���ģ�ͽű�ִ�д���
		var avpMethodResult = true;
		try {
			avpMethodResult = eval("avpMethod()");
		} catch (err) {
			// do nothing
		}
		if (!avpMethodResult) {
			return;
		}
		
		
		dispLoadInfo();
		oForm.action=theUrl;
		submitWithPost(oForm, theUrl);
		event.srcElement.disabled = true; 
	}
}

/**
 * ��POST��ʽ�ύ
 * 
 * @param {Object} form
 * @param {Object} url
 * @return {TypeName} 
 */
function submitWithPost(form, url) {
	if (form == null || url == null || url.length == 0) {
		return;
	}
	var name, value, i, actUrl, tmphtml = "";
	var num= url.indexOf("?");
	actUrl = url;
	if(num > 0){
		actUrl = url.substring(0,num);
		var arrtmp=url.substr(num+1).split("&");
		for(i=0;i < arrtmp.length;i++){
			num=arrtmp[i].indexOf("=");
			if(num>0){
				name=arrtmp[i].substring(0,num);
				value=arrtmp[i].substr(num+1);
				tmphtml = tmphtml + ' <input type="hidden" name="'+name+'" value="'+value+'"> ';
	    	}
     	}
	}
	form.innerHTML = form.innerHTML + tmphtml;
	form.action = actUrl;
	form.method="post";
	form.submit();
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
* ������󣬽�����������Ϣ����ʾ��Ϣ��
*/
function getwarninginfo(oElememt, isNotChkOk){	
    //ȡ�ñ�Ԫ�ص�����
    var ctd = oElememt.parentElement;
	var ptd = ctd.previousSibling;	
	var altinfo = ptd.innerText;
	var warning = oElememt.warning;
	
	//���warning������ֵ��������warning������ȥԪ��td��ǰһ��td��innertext��ֵ��
	if (warning==""){
		warning = altinfo.substring(0,altinfo.indexOf("��"));
	}
	
	var varninginfo = "";
	
	var min = oElememt.minlength;
	var max = oElememt.maxlength;	
	
	if (!max){
		max = oElememt.maxLength;
	}	
	
	if (isNotChkOk=="1"){
		if (min==1) {
			varninginfo="��"+warning+"������Ϊ��!";
		}
		else if (min>1){
			varninginfo="��"+warning+"�����ٱ���Ϊ"+min+"���ַ�";
		}		
	}
	else if (isNotChkOk=="2"){
	    varninginfo="��"+warning+"����󳤶�Ϊ"+max/2+"�����֣�";
	}
	else if (isNotChkOk=="3"){
	    varninginfo="��"+warning+"��������ѡ��"+min+"�";
	}
	else if (isNotChkOk=="4"){
	    varninginfo="��"+warning+"�����ֻ��ѡ��"+max+"�";
	}	
    alert(varninginfo);
}

/**
* �������ʹ����Ԫ�صõ�����
*/
function goBack(oElememt) {
    //ȡ�ñ�Ԫ�ص�����
	var sType = oElememt.type;
	switch (sType) {
	  case "text":
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

/**
*����ˢ�´���
*
*/
function closeRefresh_agilecheck(){
    if(!window.parent.opener.closed){
        //var theUrl='/awp/avp/agilecheck/baseinfo/t02_sc_mod/pub_result_dataList.do?modekey='+document.forms[0].modekey.value;
        //opener.location.replace(theUrl);
         opener.location="javascript:doRefesh()";
         //window.opener.document.forms[0].action=theUrl; 
        // window.opener.document.forms[0].submit(); 
    }
    window.close();
}
//document.onkeydown=ShortcutKey
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
		msgTxt.innerHTML="<font color='#FF0000'>���ڼ������ݣ���ִ��"+int_minute+"��"+int_second+"�룬���Ժ�......</font>";
	}

	try{
		var test_time = window.opener.document.getElementById("test_time");
		if(test_time){
			test_time.value= +int_minute+":"+int_second;
		}
	}catch(err) {
	}

	setTimeout("show_time()",1000);
}

function dispLoadInfo(){
	time_begin = (new Date()).getTime();
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
	bgObj.style.background="#ebf7ff";
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
		  
	document.body.appendChild(msgObj);
	document.getElementById("msgDiv").appendChild(title);
	var txt=document.createElement("p");
	txt.style.margin="1em 0"
	txt.setAttribute("id","msgTxt");
	txt.innerHTML="<font color='#FF0000'>���ڼ������ݣ���ִ��0��0�룬���Ժ�......</font>";
    document.getElementById("msgDiv").appendChild(txt);
    setTimeout("show_time()",1000);
}



/**
 * checkbox duble click only one selected
 * 
 * @param func
 * @return
 */
function addCheckboxSelect(){
	if (!document.getElementsByTagName) {
		return false;
	}
	var inputs = document.getElementsByTagName("INPUT");	
	for (var i = 0; i < inputs.length; i++) {
		if (inputs[i].type=="checkbox"){
			inputs[i].ondblclick = function(){
				var els = document.getElementsByTagName("input");				
				if (this.checked ==true){
					for (var i = 0; i < els.length; i++) {
						var sType = els[i].type;			
							if ((this.name==els[i].name)&&(els[i]!=this)&&(sType=="checkbox" )) {
								els[i].checked = false;	
							}			
					}		
				}				
			}
		}
	}
	
	
}




function ondisplay(){
        var st = document.getElementById("awp_cond_div");
        if (st.style.display==""){
           st.style.display = "none";
           document.forms[0].btsearch.value="\u67e5\20\u627e";   
        }else{
           st.style.display = "";        
           document.forms[0].btsearch.value="\u9690\20\u85cf";            
        }
}


function cancelStatusDisp(){
	var herfs = document.getElementsByTagName("a");
	
	for(var i=0;i<herfs.length;i++){
		var myherf = herfs[i].getAttribute("href");
		herfs[i].onmouseover = function(){
			window.status = "��ӭʹ�ñ������ᷴϴǮ����ƽ̨";
			return true;
		}
	}
}
addLoadEvent(addCheckboxSelect);
addLoadEvent(cancelStatusDisp);

function exportExecl_avp(tableId,titleName) //��ȡ�����ÿ����Ԫ��EXCEL�У�ֻ�ڲ�֤ģ�ͽ������ʹ��
{
    var curTbl  = document.getElementById(tableId);
    if(!curTbl){
		curTbl  = window.opener.document.getElementById(tableId);
    }
    try{
    	var oXL = new ActiveXObject("Excel.Application");
    }catch(e){
	   	alert('�����������ȫ����ϸߣ��뽫��վ�����Ϊ����վ�㣬�򽫡�Internetѡ��->��ȫ->�Զ��弶��->��û�б��Ϊ��ȫ��activex�ؼ����г�ʼ���ͽű����С�����Ϊ�����á�');
    	return ;
    }
    //����AX����excel
    var oWB = oXL.Workbooks.Add();
    //��ȡworkbook����
    var oSheet = oWB.ActiveSheet;
    
    //�ϲ���һ��
    var sheetR = oSheet.Range(oSheet.Cells(1,1),oSheet.Cells(1,curTbl.rows(0).cells.length));
    sheetR.mergecells = true;
    sheetR.value = titleName;
    sheetR.HorizontalAlignment =-4108;//����
    sheetR.Font.Size = 12;
    
    //���ǰsheet
    var lenr = curTbl.rows.length;
    for (i = 0; i < lenr; i++)
    {
    	var lenc = curTbl.rows(i).cells.length;
		
		//ȡ��ÿ�е�����
        for (j = 0; j < lenc; j++)
        {
        	oSheet.Cells(i+2, j+1).NumberFormat='\@';
            oSheet.Cells(i+2, j+1).value = curTbl.rows(i).cells(j).innerText ;
            oSheet.Cells(i+2, j+1).Font.Size = 9;									//�����С
            oSheet.Cells(i+2, j+1).Borders.LineStyle = 1;   						//���ñ߿�
            if(i == 0){        	   
         	   oSheet.Cells(2, j+1).Interior.ColorIndex = 33;						//���õ�ɫ
         	   oSheet.Cells(2, j+1).HorizontalAlignment =-4108;						//����
         	   oSheet.Cells(2, j+1).Font.Size = 10;
            }
        }
    }
    
    oSheet.Columns.AutoFit();
    oSheet.Rows.AutoFit();
    oXL.Visible = true;
    //����excel�ɼ�����
//    oXL.Quit();
//    oXL = null;
    idTmr = window.setInterval("cleanupExecl();",1);//ǿ���ͷ���Դ
}
function cleanupExecl()//���Excel��Դ
{
    window.clearInterval(idTmr);
    CollectGarbage();
}

//����Cookie
function setCookie(name,value)
{
    var Days = 30; //�� cookie �������� 30 ��
    var exp  = new Date();    //new Date("December 31, 9998");
    exp.setTime(exp.getTime() + Days*24*60*60*1000);
    document.cookie = name + "="+ escape (value) + ";expires=" + exp.toGMTString();
}
//ȡCookie,�����ڷ���null
function getCookie(name)       
{
    var arr = document.cookie.match(new RegExp("(^| )"+name+"=([^;]*)(;|$)"));
    if(arr != null) {
    	return unescape(arr[2]); 
    }else{
	    return null;
    }
}



/**
 * �ر�ȫ������
 *
 * @param isrefresh �ر�ҳ��ʱ���Ƿ�ˢ�¸�ҳ�棬 trueΪˢ�£� falseΪ��ˢ�¡�
 * @return
 */
function closeFullWin(isrefresh) {
	try{
		if (isrefresh){
			var frm =  window.parent.opener.document.forms[0];
			frm.action = window.parent.opener.location.href;
			frm.submit();
		}		
	}catch(err){
		alert('\u5173\u95ed\u7a97\u53e3\u51fa\u9519')
	}finally{
		window.close();		
	}
}




function openWin(theUrl,win_name,height,width){	
	
    var top =  (window.screen.availHeight-30-400)/2;
    var left = (window.screen.availWidth-10-750)/2;
    var h,w;
    if(height==undefined){ h = 500 }else{ h = height; }
    if(width==undefined){ w = 600 }else{ w = width; }
   
	var	property = 'height='+h+', width='+w+',left='+left+',top='+top+',scrollbars=yes,resizable=yes';
	
    window.open(theUrl,'',property);     
}

/**
 * ����ȫ������
 * @param url      �������ڵ�URL��ַ
 * @param win_name ������������
 * @return
 */
function openFullWin(url, win_name) {
//	window.open(url, win_name, "fullscreen=yes"); 
	var iwidth = screen.availWidth  ;
	var iheight = screen.availHeight - 30;
	
	var myherf ;
	var addStr = "awprnd=" + parseInt(Math.random()*100000);

	if(url.indexOf('?')==-1){
		myherf = url + '?' + addStr;
	} else{
		myherf = url + '&' + addStr;
	}
	var openwin = window.open(myherf, win_name, "scrollbars=no,toolbar=no,status=yes,resizable=yes,MenuBar=no,location=no,top=0,left=0,width=" + iwidth + " ,height=" + iheight);
	if (openwin) {
 		openwin.focus();
  }
  return openwin;
}

/**
 * ����ȫ������  �й�����
 * @param url      �������ڵ�URL��ַ
 * @param win_name ������������
 * @return
 */
function openFullWinIsScroll(url, win_name) {
//	window.open(url, win_name, "fullscreen=yes"); 
	var iwidth = screen.availWidth  ;
	var iheight = screen.availHeight - 30;
	
	var myherf ;
	var addStr = "awprnd=" + parseInt(Math.random()*100000);

	if(url.indexOf('?')==-1){
		myherf = url + '?' + addStr;
	} else{
		myherf = url + '&' + addStr;
	}
	var openwin = window.open(myherf, win_name, "scrollbars=yes,toolbar=no,status=yes,resizable=yes,MenuBar=no,location=no,top=0,left=0,width=" + iwidth + " ,height=" + iheight);
	if (openwin) {
 		openwin.focus();
  }
  return openwin;
}
	
//���Ұ�ť����ʾ����	
function btnDisplayHidden(object, tableid){
	var eleid = tableid;
	var btn = object;
	var st = document.getElementById(eleid);	
	try{
		if (st.style.display==""){
			btn.value = "\u67e5\ \u627e";	   
		    st.style.display = "none";	    
		}else{
		    btn.value = "\u9690\ \u85cf";			
		    st.style.display = "";	   	   
		}	
	}catch(ex){
	  alert(err);
	}
}	

/**�б���"ѡ��"/"ȫ��"���л�**/
function selectAllCheckBox(objElement,currentForm){
	var strInnerText = "";
	var isSelectAll = false;
	if(currentForm){
		for(var i=0;i<currentForm.elements.length;i++){
			var formElement = currentForm.elements[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}
/**�б���"ѡ��"/"ȫ��"���л�
 * ����this�õ�table�ڵ�������input�ڵ㴦��
 * **/  
function selectAllCheckBox_t(objElement){
	var strInnerText = "";
	var isSelectAll = false;
	var currentForm = objElement.parentNode.parentNode.parentNode;
	var inputs = currentForm.getElementsByTagName('input');
	if(inputs){
		for(var i=0;i<inputs.length;i++){
			var formElement = inputs[i];
			if(formElement.type=="checkbox" && !formElement.disabled){
				formElement.checked = objElement.innerText=="\u5168\u90e8" ? true : false;
				isSelectAll = formElement.checked;
			}						
		}
		strInnerText = isSelectAll == true ? "\u53d6\u6d88" : "\u5168\u90e8";
		objElement.innerText = strInnerText;
	}
}


/**��һ����ı༭����*/
function openEditWin(oE){
	var text_name = oE.name;
	var readflag = '';	
	if(oE.readOnly){
		readflag = 'readOnly';
	}	
	var theUrl = '<%=request.getContextPath()%>/platform/pub/text_area.jsp?input_id='+text_name+"&readflag="+readflag;
	window.open(theUrl,'text_area','height=600, width=800,left=1,top=1,toolbar=no,scrollbars=no, resizable=yes, location=no, status=no');
}



/**ҳǩ��ת����
theUrl: ��ת����url��
frm   ��ҳ��form����
**/
function jumpTabPanel(theUrl, frm){    
	frm.action=theUrl;
	frm.submit();
	return true;    
}

function g(o){return document.getElementById(o);}
function HoverLi(n){
//�����N����ǩ,�ͽ�i<=N;
for(var i=1;i<=5;i++){g('tb_'+i).className='normaltab';g('tbc_0'+i).className='undis';}g('tbc_0'+n).className='dis';g('tb_'+n).className='hovertab';
}

/**
 ȡ��checkboxѡ�еĸ���
 */
function CheckBoxCheckedNum(form) {
	var num = 0;
	for (var i = 0; i < form.elements.length; i++) {
		if ((true == form.elements[i].checked) && (form.elements[i].type == "checkbox")) {
			num++;
		}
	}
    //alert(num);
	return num;
}

function checkRadio(radioObj) {
	var num = -1;
	if (radioObj != null) {
        //alert(radioObj);
		for (var i = 0; i < radioObj.length; i++) {
			if ((true == radioObj[i].checked)) {
				num = i;
			}
		}
		if (true == radioObj.checked) {
			num = 1000;
		}
        //alert(num);
	}
	return num;
}
/**
 ȡ��radioѡ�еĸ���
 */
function RadioCheckedNum(form) {
	var num = 0;
	for (var i = 0; i < form.elements.length; i++) {
		if ((true == form.elements[i].checked) && (form.elements[i].type == "radio")) {
			num++;
		}
	}
    //alert(num);
	return num;
}

function RadioCheckedSingleOne(form) {
	var num = 0;
	var errMsg = "";
	num = RadioCheckedNum(form);
	if (num < 1) {
		errMsg = "\u8bf7\u9009\u62e9\uff01";
	} else {
		if (num > 1) {
			errMsg = "\u53ea\u80fd\u9009\u62e9\u4e00\u4e2a\uff01";
		}
	}
	return errMsg;
}
function CheckBoxCheckedSingleOne(form) {
	var num = 0;
	var errMsg = "";
	num = CheckBoxCheckedNum(form);
	if (num < 1) {
		errMsg = "\u8bf7\u9009\u62e9\uff01";
	} else {
		if (num > 1) {
			errMsg = "\u53ea\u80fd\u9009\u62e9\u4e00\u4e2a\uff01";
		}
	}
	return errMsg;
}
function CheckBoxMustChecked(form) {
	var num = 0;
	var errMsg = "";
	num = CheckBoxCheckedNum(form);
	if (num < 1) {
		errMsg = "\u8bf7\u9009\u62e9\uff01";
	}
	return errMsg;
}
function RadioMustChecked(form) {
	var num = 0;
	var errMsg = "";
	num = RadioCheckedNum(form);
	if (num < 1) {
		errMsg = "\u8bf7\u9009\u62e9\uff01";
	}
	return errMsg;
}

function awpDoSubmit(theUrl,type){
		var errMsg = "";
		var isSub = false;
		if(type=='modi'){
			errMsg = CheckBoxCheckedSingleOne(document.forms[0]);
			isSub = true;
		 }
		 else if(type=='del'){
			errMsg = CheckBoxMustChecked(document.forms[0]);
			if(errMsg==''){
				if(confirm('�����Ҫɾ����')){
				isSub = true;
			}
			}
		}
		else if(type=='search' || type=='add' || type=='save' || type =='' || type == null){
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


/**
 * begin......
 * ҳ��У�麯����Ŀǰֻ�ܶ�input��textarea����У�顣  
 * 
 * @param theUrl
 * @return 
 */
function checkform() {
	
	oForm = document.forms[0];	
	var els = oForm.elements;
	var isNotChkOk = "0";
	var i = 0;
	
    //�������б�Ԫ��
	for (var i = 0; i < els.length; i++) {	
		var sType = els[i].type;
		var isjudge = "0";
		
		//����У���û��Զ��壬��Ϊcheckfunc���Դ��룬����fun();�����Զ���У��ͨ������true��û��ͨ������false;
		try{
			var funcarray = els[i].checkfunc;
			if ((funcarray!=null)&&(funcarray!=undefined)&&(funcarray!="")){
				var func = funcarray.split(";");
				for (var j=0;j<func.length ;j++ )
				{	
					if(func[j]=="")
						continue;	
					if (!eval(func[j])){
						return false;
					}
				}			
			}
		}catch(err){
			alert("ʹ���û��Զ�����֤����������:"+err.description);
			return false;
		}
		
		//�û��Զ���У��û��ͨ������ִ���´��룬����Զ���ͨ���ˣ���ִ���·����롣
		switch (sType) {
	  		case "text": isjudge="1"; break;
	  		case "hidden": isjudge="1";  break;
	  		case "password": isjudge="1"; break;
	  		case "textarea": isjudge="1"; break;
	  		case "checbox": isjudge="2"; break;	  		
			default: isjudge="0"; break;
		}
					
		if (isjudge=="0"){
			continue;
		}else if (isjudge=="1"){
			var min = els[i].minlength;
			var max = els[i].maxlength;

	    	//��֤��Сֵ	    	
			if ( min && (len(trim(els[i].value)) < min)) {
				isNotChkOk = "1";
				break;
			}
	       
	        //��֤�������ֵ
			if (!max){
				max = els[i].maxLength;
			}	       
			if (max && (len(trim(els[i].value)) > max)) {			
				isNotChkOk = "2";
				break;
			}							
		}else if (isjudge=="2"){	
	    	//��֤ѡ��������
			if (els[i].minlength && (getValLenChoose(els[i]) < els[i].minlength)) {
				isNotChkOk = "3";
				break;
			}
	       
	        //��֤ѡ�������
			if (els[i].maxlength && (getValLenChoose(els[i]) > els[i].maxlength)) {			
				isNotChkOk = "4";
				break;
			}		
		}
	}	
  
	//��֤��ͨ��,������ʾwarning,ͬʱ�ñ�Ԫ��ȡ�ý���
	if (isNotChkOk!="0") {
		getwarninginfo(els[i], isNotChkOk);
		goBack(els[i]);
		return false;
	}else{
		return true;
	}
}
/**
 *����һ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function awpOpenwindow(theUrl,sWidth,sHeight){
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var win_name = randomChar(10);
  
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   window.open(theUrl,win_name,parm);   
  
 
}


/**
 * ����������ϸ����
 */
function pop_loader_cms(URL){	
	openWin(URL,'','600','1024');
}

/**
 * ����Ԥ����ϸ����
 */
function fdp_alert_detail(URL){	
	openWin(URL,'','600','1124');
}


/*
 *���ύ��ʽ����ͬһ��ָ����Ⱥͳ��ȵĴ���
 *
 */
function avpSubmitPopUpSameNameWindow(formName,windowsName,theUrl,sWidth,sHeight){
   var form;
   if(formName == ""){
   		form = document.forms[0];
   }else{
   		form = document.getElementsByName(formName)[0];
   } 
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var oOpener = window.open('../../platform/pub/blank.jsp',windowsName,parm);   
   
   var old_target = form.target;

   form.action=theUrl;
   form.target=windowsName;
   form.submit();  
   form.target = old_target;
   if (oOpener) {
   		oOpener.focus();
   }
}


/**
 * ȥ���ַ������߿ո�ĺ���
 * @param s ��������ַ���
 * @return ������Ϻ���ַ���
 */
function trim(s) {
	return rtrim(ltrim(s));
}
/**
 * ȥ���ַ�����߿ո�ĺ���
 * @param s ��������ַ���
 * @return ������Ϻ���ַ���
 */
function ltrim(s) {
	if (s == null || s.length == 0) {
		return "";
	}
	while (s.length > 0 && s.charAt(0) == " ") { //ȥ����߿ո�
		s = s.substring(1);
	}
	return s;
}
/**
 * ȥ���ַ����ұ߿ո�ĺ���
 * @param s ��������ַ���
 * @return ������Ϻ���ַ���
 */
function rtrim(s) {
	if (s == null || s.length == 0) {
		return "";
	}
	while (s.length > 0 && s.charAt(s.length - 1) == " ") {//ȥ���ұ߿ո�
		s = s.substring(0, s.length - 1);
	}
	return s;
}
/**
 * ����ҳǩ�л����
 * 
 * @return 
 */
function searchtableReset(){
	var els= document.getElementById("searchtable").all;
	
	for(var i=0;i<els.length;i++){
		var sType = els[i].type;
		switch(sType){
			case "hidden":
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
 * ��URL��post�ķ�ʽ�ύ��ָ������
 * 
 * @param strUrl ���ύ�ĵ�url
 * @param form �ύ��form
 * @param submitType �ύ��ʽ 1��ת 2����
 * @param openWinName ������������
 * @param sWidth �ύ��ʽ �������ڿ�� �գ�ȫ����
 * @param sWidth �ύ��ʽ �������ڸ߶� Ϊ�գ�ȫ����
 * @return
 */
function awpSubmit(strUrl,form,submitType,openWinName,openWinWidth,openWinHeight){
   	var name,value,i,actUrl;
   	var tmphtml = getHidInputVal();
   	var myform = document.getElementById(form);
   	if(myform == null){
	   	myform = document.createElement("form");
	   	myform.setAttribute('id','submit_form');
	   	document.body.appendChild(myform);
   	}
   	var num= strUrl.indexOf("?");
	if(num > 0){
		actUrl = strUrl.substring(0,num);
		var arrtmp=strUrl.substr(num+1).split("&");
		for(i=0;i < arrtmp.length;i++){
			num=arrtmp[i].indexOf("=");
			if(num>0){
				name=arrtmp[i].substring(0,num);
				value=arrtmp[i].substr(num+1);
				tmphtml = tmphtml + ' <input type="hidden" name="'+name+'" value="'+value+'"> ';
	    	}
     	}
	}else{
		actUrl = strUrl;
	}
	myform.innerHTML = tmphtml;
	myform.action = actUrl;
	myform.method="post";
	if(submitType == "2"){
		if(!openWinWidth){
			openWinWidth = screen.availWidth 
		}
		if(!openWinHeight){
			openWinHeight = screen.availHeight - 30;
		}
		var parm = 'height='+openWinHeight+',width='+openWinWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
		if(!openWinName){
   			openWinName = randomChar(10);
		}
		window.open('../../platform/pub/blank.jsp',openWinName,parm);   
		myform.target = openWinName;
	}else{
		myform.target = "_self";
	}
	
	myform.submit();	
}

/**
 * �����ʾ��ťʱ����ʾ���������صĲ�����Ŀ��������ʾ��ť�趨Ϊ���ذ�ť��
 * ������ذ�ťʱ�����ػ�����ĳЩ������Ŀ�������ذ�ť�趨Ϊ��ʾ��ť
 * @param viewcondid      	button��ť��id
 * @param tbl     			��Ӧ��table��id 
 * @return
*/
function viewCond(viewcondid, tbl) {
    var buttonId = document.getElementById(viewcondid).value;
	var table = document.getElementById(tbl);
	if(buttonId == '�߼�>>') {
	    document.getElementById(viewcondid).value="�߼�<<";
		for (var row in table.rows) {
		    if(table.rows[row].className == "hiddenRow") {
			    table.rows[row].className = "displayRow";
		    }
	    }
	} else {
	    document.getElementById(viewcondid).value="�߼�>>";
	    for (var row in table.rows) {
		    if(table.rows[row].className == "displayRow") {
			    table.rows[row].className = "hiddenRow";
		    }
	    }
	}
}
function exportExecl(tableId) //��ȡ�����ÿ����Ԫ��EXCEL��
{
    var curTbl  = document.getElementById(tableId);
    if(!curTbl){
		curTbl  = window.opener.document.getElementById(tableId);
    }
    try{
    	var oXL = new ActiveXObject("Excel.Application");
    }catch(e){
	   	alert('�����������ȫ����ϸߣ��뽫��վ�����Ϊ����վ�㣬�򽫡�Internetѡ��->��ȫ->�Զ��弶��->��û�б��Ϊ��ȫ��activex�ؼ����г�ʼ���ͽű����С�����Ϊ�����á�');
    	return ;
    }
    //����AX����excel
    var oWB = oXL.Workbooks.Add();
    //��ȡworkbook����
    var oSheet = oWB.ActiveSheet;
    //���ǰsheet
    var lenr = curTbl.rows.length;
    for (i = 0; i < lenr; i++)
    {
    	var lenc = curTbl.rows(i).cells.length;
		
		//ȡ��ÿ�е�����
        for (j = 0; j < lenc; j++)
        {
           oSheet.Cells(i+1, j+1).NumberFormat='\@';
           oSheet.Cells(i+1, j+1).value = curTbl.rows(i).cells(j).innerText ;
        }
    }
    
    oSheet.Columns.AutoFit();
    oSheet.Rows.AutoFit();
    oXL.Visible = true;
    //����excel�ɼ�����
//    oXL.Quit();
//    oXL = null;
    idTmr = window.setInterval("cleanupExecl();",1);//ǿ���ͷ���Դ
}

/**
 * �ѱ�����ݸ��Ƶ�Excel��
 * @param tableId
 * @return
 */
function copyTableToExcel(tableId) {
	// Ҫ�����ı�����
	var oTable = document.getElementById(tableId);
	if (oTable == null) {
		alert("��ȡ����������ݣ��������Ա��ϵ��");
	}
	// ����Excel ActiveXObject ����
	var oExcel;
	try {
		oExcel = new ActiveXObject("Excel.Application");
	} catch (err) {
		alert('�����������ȫ����ϸߣ��뽫��վ�����Ϊ����վ�㣬�򽫡�Internetѡ��->��ȫ->�Զ��弶��->��û�б��Ϊ��ȫ��activex�ؼ����г�ʼ���ͽű����С�����Ϊ�����á�');
    	return ;
	}
	// ����workbook����
	var oWorkbook = oExcel.Workbooks.add();
	// ����sheet����
	var oSheet = oWorkbook.ActiveSheet;
	// �ѱ���е������Ƶ�TextRange��
	var oTextRange = document.body.createTextRange();
	oTextRange.moveToElementText(oTable);
	// ȫѡTextRange������ 
	oTextRange.select();
	// ����TextRange������ 
	oTextRange.execCommand("Copy");
	// ճ�������EXCEL��
	oSheet.Paste();
	// ����excel�ɼ�����
	oExcel.Visible = true;
}

function cleanupExecl()//���Excel��Դ
{
    window.clearInterval(idTmr);
    CollectGarbage();
}

/**
 * disable  checkbox according to checkbox_names
 */
function disableCheckbox(names){	
	var nameArray = document.getElementsByName(names);		
	if(nameArray.length>0){
		for(var i=0,j=nameArray.length;i<j;i++){
			nameArray[i].disabled="true";			
		}
	}
}

/**
 *����һ���̶���Ⱥ͸߶ȵĴ���
 *
 */
function avpOpenWindow(strUrl){
	
   var 	sWidth = "800";
   var  sHeight = "600";
   window.status = "��ӭʹ�ñ������ᷴϴǮ����ƽ̨";
   var name,value,i,actUrl;
   var tmphtml = '';
   var parm = 'height='+sHeight+',width='+sWidth+',toolbar=no,scrollbars=yes, resizable=yes, location=no, status=no' ;
   var win_name = randomChar(10);

   var myform = document.getElementById("submit_form");
   if(myform == null){
	   myform = document.createElement("form");
	   myform.setAttribute('id','submit_form');
	   document.body.appendChild(myform);
   }
   
   var num= strUrl.indexOf("?");
	if(num > 0){
		actUrl = strUrl.substring(0,num);
		var arrtmp=strUrl.substr(num+1).split("&");
		for(i=0;i < arrtmp.length;i++){
			num=arrtmp[i].indexOf("=");
			if(num>0){
				name=arrtmp[i].substring(0,num);
				value=arrtmp[i].substr(num+1);
				tmphtml = tmphtml + ' <input type="hidden" name="'+name+'" value="'+value+'"> ';
	    	}
     	}
	}else{
		actUrl = strUrl;
	}
	myform.innerHTML = tmphtml;
	myform.action = actUrl;
	myform.method="post"
	myform.target = win_name;
	
	window.open('../../platform/pub/blank.jsp',win_name,parm);   
	myform.submit();	
}

function autocomplete(parameter_key,parameter_name,parameter_source){
					jQuery(parameter_name).autocomplete({
				 		minLength:0,
				 		source:parameter_source,
				 		focus:function(event, ui){
				 			jQuery(parameter_name).val(ui.item.value);
				 			return false;
				 		},
				 		select:function(event, ui){
				 			jQuery(parameter_name).val(ui.item.value);
				 			jQuery(parameter_key).val( ui.item.key);
				 			return false;
				 		}
				 	});
				 	jQuery(parameter_name).data("autocomplete")._renderItem=function(ul,item){
				 		return jQuery("<li></li>").data("item.autocomplete", item)
				 			.append("<a>"+item.value+"</a>")
				 			.appendTo(ul);
				 	}; 
}

/**
 *�õ����е���������Ԫ�أ�Ȼ�����ύ
 *
 */

function avpHelp(url){
	var inputs = document.getElementsByTagName("input");
	var num= url.indexOf("?");
	if(num <= 0){
		url = url + "?";
	}
	for(var i=0; i <= inputs.length; i++){
		if(inputs[i]){
			var sType = inputs[i].type;
			switch (sType) {
			  case "hidden":
			  if(i != 0){
					url = url + "&"; 
			  }
			  url = url + inputs[i].name + "=" + inputs[i].value;  
			  break; 
			}
		}
	}
	avpOpenWindow(url);
}
