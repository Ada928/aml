
var g_changed = false; // �Ƿ��޸�
		//var g_appid = "2";
var G_VALIDATING = "VALIDATING";
var G_VALIDATE = "VALIDATE";
var G_INVALIDATE = "INVALIDATE";
var G_UNVALIDATE = "UNVALIDATE";
var g_ArrMsg = new Array(); // ��ʾ��֤�׶ε�html�����б�
/*
		 * ����name��ȡҳ���е�i+1��html����
		 * @param name html����name
		 * @param i ���ȡ��html������ҳ���е�����
		 */
function $$(name, i) {
	return document.getElementsByName(name)[i];
}
/*
		 * ������ʾ��֤�׶�html�����ps�ж��Ƿ�������֤�ֶζ���֤ͨ��
		 */
function checkAllValidate() {
	for (var i = 0; i < g_ArrMsg.length; i++) {
		var msg = g_ArrMsg[i].ps;
		if (msg == G_INVALIDATE) {
			alert("����δУ�������ݣ�����ʧ�ܣ�");
			return false;
		} else {
			if (msg == G_VALIDATING) {
				alert("������֤���ݣ����Ժ򱣴棡");
				return false;
			}
		}
	}
	return true;
}
/*
		 * ������֤����id����һ��html����������ʾ��֤�׶�
		 * @param obj ҳ������֤�ֶε��������󣬻���idΪ����֤����id��"_disp"��"_flag"��"_value"��html����
		 */
function createMsgArea(obj) {
	var id = obj.name;
	id = id + "_vmsg";
	//var o = document.createElement("<span class='tipstyle' id='" + id + "' ps=''></span>");
	var o = document.createElement("span"); 
	o.className="tipstyle";
	o.setAttribute("id", id);
	o.setAttribute("ps", "");
	g_ArrMsg.push(o);
	return o;
}
function insertAdjacentElement(obj,where,parsedNode){
  switch(where){
  case "beforeBegin":
  obj.parentNode.insertBefore(parsedNode,obj);
  break;
  case "afterBegin":
  obj.insertBefore(parsedNode,obj.firstChild);
  break;
  case "beforeEnd":
  obj.appendChild(parsedNode);
  break;
  case "afterEnd": 
  if(obj.nextSibling){
  obj.parentNode.insertBefore(parsedNode,obj.nextSibling); 
  }
  else{
  obj.parentNode.appendChild(parsedNode);
  }
  break;
  }
  }

/*
		 * ��ȡ��ʾ��֤�׶ε�html���������һ����֤������֤�ֶ������������ʾ��֤�׶ε�html����
		 * @param obj ҳ������֤�ֶε��������󣬻���idΪ����֤����id��"_disp"��"_flag"��"_value"��html����		 
		 */
function getMsgArea(obj) {
	var id = obj.name;
	id = id + "_vmsg";
	var msgarea;
	if ($(id) == null) {
		msgarea = createMsgArea(obj);
		//obj.insertAdjacentElement("afterEnd", msgarea);alert("5::"+msgarea);
		insertAdjacentElement(obj,"afterEnd", msgarea);
		return msgarea;
	} else {
		return $(id);
	}
}

/*
		 * ��ʾ�������֤�׶�
		 * 
		 * @param obj ҳ������֤�ֶε��������󣬻���idΪ����֤����id��"_disp"��"_flag"��"_value"��html����		 
		 * @param flag ��֤�׶α�־ 0 ��֤�� 1 ��ȷ 2 ���� 3 δ��֤
		 * @param msg ��ʾ����
		 */
function showValidateMsg(obj, flag, msg) {

	var msgarea = getMsgArea(obj);
	msgarea.innerHTML = "";
	if (flag == 0) { // ��֤��
		msgarea.innerHTML = "��֤��...";
		msgarea.ps = G_VALIDATING;
	} else {
		if (flag == 1) { // ��ȷ
			msgarea.innerHTML = "<img src='../../images/validate.jpg'/>";
			msgarea.ps = G_VALIDATE;
		} else {
			if (flag == 2) { // ����
				msgarea.innerHTML = msg;
				msgarea.ps = G_INVALIDATE;
			} else {
				if (flag == 3) { // δ��֤
					msgarea.innerHTML = "<img src='../../images/validate.jpg'/>";
					msgarea.ps = G_UNVALIDATE;
				} else {
					if (flag == 4) {
						msgarea.ps = G_VALIDATE;
					}
				}
			}
		}
	}
}
		// �����ֶ��޸ı�־
function change() {
	g_changed = true;
}
function setRoot(url) {
	root = url;
}
/*
		 * ��ȡ����֤�ֶ�ֵ��������ο�
		 * ����ֶ�ֵ�޸ģ�����ʾ��֤״̬��������֤����
		 * 
		 * @param obj ҳ������֤�ֶε��������󣬻���idΪ����֤����id��"_disp"��"_flag"��"_value"��html����		 
		 * @param ref1name ��֤��Ҫ�ĵ�һ�ο��������Ϊ�ղ�����nameΪ��ֵ��html������ȡ�ö����valueΪ��һ�ο��������Դ����ֵΪ��һ�ο�
		 * @param ref2name ��֤��Ҫ�ĵڶ��ο��������Ϊ�ղ�����nameΪ��ֵ��html������ȡ�ö����valueΪ�ڶ��ο��������Դ����ֵΪ�ڶ��ο�
		 */
function validate(obj, ref1name, ref2name) {
	var id = obj.name;
	var vObj = obj;
	var ref1 = "", ref2 = "";
	var idx = id.indexOf("_disp");
	if (idx == -1) {
		idx = id.indexOf("_flag");
	}
	if (idx == -1) {
		idx = id.indexOf("_value");
	}
	if (idx != -1) {
		id = id.substr(0, idx);
		vObj = $$(id, 0);
	}
	if (ref1name != "") {
		var ref1obj = $$(ref1name, 0);
		if (ref1obj != null) {
			ref1 = ref1obj.value;
		} else {
			ref1 = ref1name;
		}
	}
	if (ref2name != "") {
		var ref2obj = $$(ref2name, 0);
		if (ref2obj != null) {
			ref2 = ref2obj.value;
		} else {
			ref2 = ref2name;
		}
	}

			//g_validateObj = obj;
	if (g_changed) { 
		showValidateMsg(vObj, 0, ""); // ��ʾ��֤״̬
				//g_validating = true;
				// ������֤����������������֤�������Ӧ����
		BasicReport.validateOneItem(g_appid, vObj.name, vObj.value, ref1, ref2, updateValidateRes);//appid, obj.name, obj.value
				//var para = { "app_id":g_appid, "field_id":vObj.name, "value":vObj.value, "ref1":ref1, "ref2":ref2 };
				//BasicReport.validateItem(para, updateValidateRes);
		g_changed = false;
	}
}
function validate1(obj, ref1name, ref2name, alertType, tsdr, cfrc, tdrc, tstp) {
	var id = obj.name;
	var vObj = obj;
	var ref1 = "", ref2 = "", ref3 = "", ref4 = "", ref5 = "", ref6 = "", ref7 = "";
	var idx = id.indexOf("_disp");
	if (idx == -1) {
		idx = id.indexOf("_flag");
	}
	if (idx == -1) {
		idx = id.indexOf("_value");
	}
	if (idx != -1) {
		id = id.substr(0, idx);
		vObj = $$(id, 0);
	}
	if (ref1name != "") {
		var ref1obj = $$(ref1name, 0);
		if (ref1obj != null) {
			ref1 = ref1obj.value;
		} else {
			ref1 = ref1name;
		}
	}
	if (ref2name != "") {
		var ref2obj = $$(ref2name, 0);
		if (ref2obj != null) {
			ref2 = ref2obj.value;
		} else {
			ref2 = ref2name;
		}
	}

	//alert(alertType+' tsdr'+tsdr+' cfrc'+cfrc+' tdrc'+tdrc+' tstp'+tstp);
			//g_validateObj = obj;
	if (g_changed) {
		showValidateMsg(vObj, 0, ""); // ��ʾ��֤״̬
		
		BasicReport.validateOneItem1(g_appid, vObj.name, vObj.value, ref1, ref2, alertType, tsdr, cfrc, tdrc, tstp, updateValidateRes);//appid, obj.name, obj.value
				//var para = { "app_id":g_appid, "field_id":vObj.name, "value":vObj.value, "ref1":ref1, "ref2":ref2 };
				//BasicReport.validateItem(para, updateValidateRes);
		g_changed = false;
	}
}
/*
		 * ��ʾ��֤���
		 * @param res ��֤��������������������ļ���dwr.xml��������
		 */
function updateValidateRes(res) {
	if (res.validate == "VALIDATE" || res.validate == "true") { // ��ȷ
		showValidateMsg($$(res.name, 0), 1, ""); // ͨ��
	} else {
		if (res.validate == "INVALIDATE" || res.validate == "false") {
			showValidateMsg($$(res.name, 0), 2, res.msg); // ��ͨ��		
		} else {
			if (res.validate == "END") { // δ��֤
				showValidateMsg($$(res.name, 0), 3, "");
			}
		}
	}
			//g_validating = false;
}
		//���ض���ֵ
function get_obj_value(refname) {
	var refvalue = "";
	var refobj = $$(refname, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	return refvalue;
}
//���ؽ��׷�ʽ		
function get_tstp_value(refname, refname1, refname2) {
	var res = "";
	var refvalue = "";
	var refobj = $$(refname, 0);
	var refvalue1 = "";
	var refobj1 = $$(refname1, 0);
	var refvalue2 = "";
	var refobj2 = $$(refname2, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	if (refobj1 != null) {
		refvalue1 = refobj1.value;
	}
	if (refobj2 != null) {
		refvalue2 = refobj2.value;
	}
	if (refvalue == "00" || refvalue=="CNY") {
		res = "00" + refvalue1 + refvalue2;
	} else {
		res = "01" + refvalue2;
	}
	return res;
}
function get_opp_country(refname, refname1, refname2,refname3) {
	var res = "";
	var refvalue = "";
	var refobj = $$(refname, 0);
	var refvalue1 = "";
	var refobj1 = $$(refname1, 0);
	var refvalue2 = "";
	var refobj2 = $$(refname2, 0);
	var refvalue3 = "";
	var refobj3 = $$(refname3, 0);
	if (refobj != null) {
		refvalue = refobj.value;
	}
	if (refobj1 != null) {
		refvalue1 = refobj1.value;
	}
	if (refobj2 != null) {
		refvalue2 = refobj2.value;
	}
	if (refobj3 != null) {
		refvalue3 = refobj3.value;
	}
	
	if (refvalue == "CHN"||refvalue == "Z01"||refvalue == "Z02"||refvalue == "Z03"||refvalue == "") {
	     res = refvalue;
		if (getLength(refvalue1) == 6) {
			res = refvalue + refvalue1;
		} 
		if (getLength(refvalue2) == 6) {
				res = refvalue + refvalue2;
		}
		if (getLength(refvalue3) == 6) {
				res = refvalue + refvalue3;
		}
		if (getLength(res) == 6) {
			res = "NULL" + res;
	}
		
	} else {
		if (refvalue != null && getLength(refvalue) == 3) {
			res = refvalue + "000000";
		}
	}
	return res;
}

