//formid��ʾ:���form�ǵڼ���form����form���� from��ʾ:������ѡ����Ŀ��select��������
//to��ʾ:�г���ѡ����Ŀ��select�������� limit��ʾ:����ѡ��ֵ,NotremoveFrom�Ƿ�ɾ��from��
//��ֵ,NotAddTo����ֵ�ӵ�to��
//��ѡ��Ԫ�ص�textname��������
function copyToList(formid,from,to,limit,NotRemoveFrom,NotAddTo)
{

	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
//	if(toList.options.length > 0 && toList.options[0].value == '0')
//	{
//		toList.options.length = 0;
//	}
	var sel = false;
	
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if(current.selected)
		{
			sel = true;
			if(current.value == '0' || current.value == limit)
			{
				alert (current.text+"����ѡ��");
//				return;
			}
			else
			{
				txt = current.text;
				val = current.value;
        addFlag = true;
        for(m=0;m<toList.options.length;m++)
        {
          if(txt == toList.options[m].text)
          {
            addFlag = false;
            break;
          }
        }
        if(addFlag)
  				if(!NotAddTo) toList.options[toList.length] = new Option(txt,val);
  				if(!NotRemoveFrom){
  					fromList.options[i] = null;
					i--;
				}
			}
		}
	}
	if(!sel) alert ('��ѡ��Ԫ�أ�');
}
function copyToListEx(formid,from,to,limit,NotRemoveFrom,NotAddTo) {
	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
	var sel = false;
	for (i=0;i<fromList.options.length;i++)	{
		var current = fromList.options[i];
		if (current.selected) {
			sel = true;
			if (current.value == '0' || current.value == limit) {
				alert (current.text+"����ѡ��");
			} else {
				txt = current.text;
				val = current.value;
				addFlag = true;
				for (m=0;m<toList.options.length;m++) {
					if (txt == toList.options[m].text) {
						addFlag = false;
						break;
					}
				}
				if (addFlag) {
					if(!NotAddTo) {
						toList.options[toList.length] = new Option(txt,val);
					}
				}
				if (!NotRemoveFrom) {
                    fromList.options[i] = null;
                    i--;
	            }
	        }
	    }
	}
	if (!sel) {
        alert ('��ѡ������Ԫ�أ�');
    }
}
//formid��ʾ:form���ƻ�˳�� from��ʾ:��ҪɾԪ�صĶ���
//to��ʾ:ɾ������Ļ���վ limit��ʾ:ɾ��Ԫ��value���������
function deleteFromList(formid,from,to,limit)
{
	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
	for (i=0;i<fromList.options.length;i++)
	{
		if(fromList.options[i].value == limit){
			var current = fromList.options[i];
			sel = true;
			txt = current.text;
			val = current.value;
			toList.options[toList.length] = new Option(txt,val);
			fromList.options[i] = null;
			i--;
		}
	}
}
//���ǵ��û������ύ��ťʱ�����г�ѡ���select����ִ��ȫѡ�������õݽ����ĺ�̨������ȡ���������
//formid��ʾ:form����; item��ʾ:selectԪ������; pro��ʾ:���ص��ַ���ֵ����Դvalue��text;
function allSelect(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
//	if (List.length && List.options[0].value == '0') return;

	for (i=0;i<List.length;i++)
	{
		
		if(List.options[i].value!=0)
		{
			List.options[i].selected = true;
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
		else
		{
			List.options[i].selected = false;
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}
//ѡ������ѡ�е�Ԫ��
function allSelected(formid,item,pro,sign)
{
	List = eval('document.forms[' + formid + '].' + item);
	str = "";
	for (i=0;i<List.length;i++)
	{
		if(List.options[i].value != 0 & List.options[i].selected)
		{
			List.options[i].selected = true;
			str += sign + eval('List.options[i].' + pro) + sign + ',';
		}
		else
		{
			List.options[i].selected = false;
		}
	}
	if(str.length > 0)
		str = str.substring(0,str.length-1);
	return str;
}
//����ѡ�б����е�Ԫ�ؽ�������,formidΪҳ���е�id����,movenameΪ�б���������ַ���
function upmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=0;i<movelist.options.length;i++)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
		sel = true;
		//if(i==1 || movelist.options[i].value=="0")
		if(i==0 || movelist.options[i].value=="0")
		{
			alert ('���������ƶ���');
			return;
		}
		txt = current.text;
		val = current.value;
		uptxt=movelist.options[i-1].text;
		upval=movelist.options[i-1].value;
		movelist.options[i-1].value = val;
		movelist.options[i-1].text=txt;
		movelist.options[i].value=upval;
		movelist.options[i].text=uptxt;
		movelist.options[i-1].selected=true;
		movelist.options[i].selected=false;

		}
	}
	if(!sel) alert ('��ѡ��Ҫ�ƶ���Ԫ�أ�');
}
//����ѡ�б����е�Ԫ�ؽ�������,formidΪҳ���е�id����,movenameΪ�б���������ַ���
function downmove(formid,movename)
{
 movelist = eval('document.forms[' + formid + '].' + movename);
 var sel = false;
	for (i=(movelist.options.length-1);i>=0;i--)
	{
		var current = movelist.options[i];
		if(current.selected)
		{
		sel = true;
		if(i==(movelist.options.length-1) || movelist.options[i].value=="0")
		{
			alert ('���������ƶ���');
			return;
		}
		txt = current.text;
		val = current.value;
		downtxt=movelist.options[i+1].text;
		downval=movelist.options[i+1].value;
		movelist.options[i+1].value = val;
		movelist.options[i+1].text=txt;
		movelist.options[i].value=downval;
		movelist.options[i].text=downtxt;
		movelist.options[i+1].selected=true;
		movelist.options[i].selected=false;
		}
	}
	if(!sel) alert ('��ѡ��Ҫ�ƶ���Ԫ�أ�');
}
function changelocation(bigarea,smallarea,arrItem)
{
    var  fromarea=eval('document.forms[0].'+bigarea);
    var  toarea=eval('document.forms[0].'+smallarea);
    var index=fromarea.selectedIndex;
   
   var selvalue=fromarea.options[index].value;
  
 
   var j;
		for(j=toarea.length-1;j>0;j--){
			toarea.options[j]=null;
		}
	//alert(arrItem.length);
	//alert("selvalue::"+selvalue);
   for(i=0;i<arrItem.length;i++){
        var  idname=arrItem[i];
        var   upId="";
        var   modId="";
        var   modName="";
        //alert(idname);
        if(idname.indexOf("@")>-1){
           var index1=idname.indexOf("@");
            upId=idname.substring(0,index1);
           
            if(upId==selvalue){
               var index2=idname.indexOf("#");
                modId=idname.substring(index1+1,index2);
                modName=idname.substring(index2+1);
              
                var newOptionName=new Option(modName,modId);
               toarea.options[toarea.length]=newOptionName;
            }
        }
          
   }
     
} 

function changelocation1(bigarea,smallarea,arrItem,toselect)
{
    var  fromarea=eval('document.forms[0].'+bigarea);
    var  toarea=eval('document.forms[0].'+smallarea);
    var index=fromarea.selectedIndex;  
   var selvalue=fromarea.options[index].value;

 
   var j;
		for(j=toarea.length-1;j>=0;j--){
			toarea.options[j]=null;
		}
	//alert(arrItem.length);
	//alert("selvalue::"+selvalue);
   for(i=0;i<arrItem.length;i++){
        var  idname=arrItem[i];
        var   upId="";
        var   modId="";
        var   modName="";
        //alert(idname);
        if(idname.indexOf("@")>-1){
           var index1=idname.indexOf("@");
            upId=idname.substring(0,index1);
           
            if(upId==selvalue){
            	var index2=idname.indexOf("#");
                modId=idname.substring(index1+1,index2);
                modName=idname.substring(index2+1);
            	
                var newOptionName=new Option(modName,modId);
                toarea.options[toarea.length]=newOptionName; 
            }
        }
          
   }
     
} 
function changelocation2(bigarea,smallarea,arrItem,smallarea1)
{
    var  fromarea=eval('document.forms[0].'+bigarea);
    var  toarea=eval('document.forms[0].'+smallarea);
    var  toarea1=eval('document.forms[0].'+smallarea1);
    var index=fromarea.selectedIndex;
   
   var selvalue=fromarea.options[index].value;
  
 
   var j;
		for(j=toarea.length-1;j>=0;j--){
			toarea.options[j]=null;
		}
		for(j=toarea1.length-1;j>=0;j--){
			toarea1.options[j]=null;
		}
	//alert(arrItem.length);
	//alert("selvalue::"+selvalue);
   for(i=0;i<arrItem.length;i++){
        var  idname=arrItem[i];
        var   upId="";
        var   modId="";
        var   modName="";
        //alert(idname);
        if(idname.indexOf("@")>-1){
           var index1=idname.indexOf("@");
            upId=idname.substring(0,index1);
           
            if(upId==selvalue){
               var index2=idname.indexOf("#");
                modId=idname.substring(index1+1,index2);
                modName=idname.substring(index2+1);
              
                var newOptionName=new Option(modName,modId);
               toarea.options[toarea.length]=newOptionName;
            }
        }
          
   }
   //toarea1.options[toarea1.length]=new Option("",""); 
   changeType();
} 

function changeArea(bigarea,smallarea,arrItem,millarea,toselvalue,flag)
{

    var  fromarea=eval('document.forms[0].'+bigarea);
    var  toarea=eval('document.forms[0].'+smallarea);
    var index=fromarea.selectedIndex;
 
   var selvalue=fromarea.options[index].value;
   var j;
		for(j=toarea.length-1;j>0;j--){
			toarea.options[j]=null;
		}
		if(flag=="1"){
			var  millarea=eval('document.forms[0].'+millarea);
				for(j=millarea.length-1;j>0;j--){
			millarea.options[j]=null;
		   }
		}

   for(i=0;i<arrItem.length;i++){
        var  idname=arrItem[i];
        var   upId="";
        var   modId="";
        var   modName="";
        //alert(idname);
        if(idname.indexOf("@")>-1){
           var index1=idname.indexOf("@");
            upId=idname.substring(0,index1);
           
            if(upId==selvalue){
               var index2=idname.indexOf("#");
                modId=idname.substring(index1+1,index2);
                modName=idname.substring(index2+1);
              
                var newOptionName=new Option(modName,modId);
               toarea.options[toarea.length]=newOptionName;
             
            }
        }
      
   }

        for(j=0;j<toarea.length;j++){
        	// alert(toarea.options[j].value);
        if(toarea.options[j].value==toselvalue){
         toarea.options[j].selected="true";
           break;
         }
      }
     
} 
function copyToList1(formid,from,to,limit,NotRemoveFrom,NotAddTo)
{

	fromList = eval('document.forms[' + formid + '].' + from);
	toList = eval('document.forms[' + formid + '].' + to);
//	if(toList.options.length > 0 && toList.options[0].value == '0')
//	{
//		toList.options.length = 0;
//	}
	var sel = false;
	
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if(current.selected)
		{
			sel = true;
			if(current.value == '0' || current.value == limit)
			{
				alert (current.text+"����ѡ��");
//				return;
			}
			else
			{
				txt = current.text;
				val = current.value;
        addFlag = true;
        for(m=0;m<toList.options.length;m++)
        {
          if(val == toList.options[m].value)
          {
            addFlag = false;
            break;
          }
        }
        if(addFlag)
  				if(!NotAddTo) toList.options[toList.length] = new Option(txt,val);
  				if(!NotRemoveFrom){
  					fromList.options[i] = null;
					i--;
				}
			}
		}
	}
	if(!sel) alert ('��ѡ��Ԫ�أ�');
}