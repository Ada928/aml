
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
function $() {
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
    if(!(parent = $(parent))) return false;
    
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
    if(!(node = $(node))) return false;
    
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





/**
 * ���������б���ʾ��ʽ
 * 
 * @param oTable
 * @return
 */

function setListStyle() {
    //������ʾ��ʽ
	var oDiv=getElementsByClassName('awp_list','table');
	var oDiv1=getElementsByClassName('awp_head','table');
	
	addClass(oDiv1[0], "awp_head");
	var old = false;

	if(oDiv[0]==null){
		return false;
	}

	var rows = oDiv[0].getElementsByTagName("tr");
	//addClass(rows[0], "awp_list_title");
	//addClass(rows[1], "awp_list_title");
	
}

function setAwp_detailStyle() {
	var oDiv=getElementsByClassName('awp_detail_tr','tr');
	if(oDiv[0]!=null){
		var tabObj = oDiv[0].parentNode.parentNode;
		if(tabObj!=null){
			addClass(tabObj, "awp_detail");
		}else{
			return false;
		}
	}else{
		return false;
	}
}

function setAwp_bodyStyle() {
	var oDiv_body=getElementsByClassName('awp_head_tr','tr');
	if(oDiv_body[0]!=null){
		var tabObj_body = oDiv_body[0].parentNode.parentNode;
		if(tabObj_body!=null){
			addClass(tabObj_body, "awp_list");
		}else{
			return false;
		}
	}else{
		return false;
	}
	
}

function setAwp_footStyle() {
	var oDiv_foot=getElementsByClassName('awp_foot_tr','tr');
	if(oDiv_foot[0]!=null){
		var tabObj_foot = oDiv_foot[0].parentNode.parentNode;
		if(tabObj_foot!=null){
			addClass(tabObj_foot, "awp_foot");
		}else{
			return false;
		}
	}else{
		return false;
	}
	
}

function setDetailStyle() {
    //������ʾ��ʽ
	var oDiv=getElementsByClassName('awp_detail_tr','tr');
	var oDiv_body=getElementsByClassName('awp_body_tr','tr');
	var oDiv_foot=getElementsByClassName('awp_foot_tr','tr');
	
	if(oDiv[0]!=null){
		var tabObj = oDiv[0].parentNode.parentNode;
		if(tabObj!=null){
			addClass(tabObj, "awp_detail");
		}else{
			//return false;
		}
	}else{
		//return false;
	}
	
	
	
	if(oDiv_body[0]!=null){
		var tabObj_foot = oDiv_foot[0].parentNode.parentNode;
		if(tabObj_foot!=null){
			addClass(tabObj_foot, "awp_foot");
		}else{
			return false;
		}
	}else{
		return false;
	}
	
	
	if(oDiv_body[0]!=null){
		var tabObj_body = oDiv_body[0].parentNode.parentNode;
		if(tabObj_body!=null){
			addClass(tabObj_body, "awp_list");
		}else{
			return false;
		}
	}else{
		return false;
	}
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





function cancelStatusDisp(){
	var herfs = document.getElementsByTagName("a");
	
	for(var i=0;i<herfs.length;i++){
		var myherf = herfs[i].getAttribute("href");
		herfs[i].onmouseover = function(){
			window.status = "��ӭʹ�÷�ϴǮϵͳ";
			return true;
		}
	}
}

addLoadEvent(setAwp_bodyStyle);
addLoadEvent(setAwp_detailStyle);
addLoadEvent(setAwp_footStyle);


//addLoadEvent(setDetailStyle);
//addLoadEvent(setListStyle);
addLoadEvent(cancelStatusDisp);