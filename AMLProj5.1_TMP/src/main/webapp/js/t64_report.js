var text_data_format_full_flag=false;//�Ƿ���Ҫ����С��λ����־
var text_data_format_partition_flag=false;//�Ƿ�ָ����ֱ�־
var text_data_format_full_n=0;//С��λ��

//���ݲ������õ���������±�

function get_text_data_fieldsIndex(s){
    var f=document.forms(0);
    var rowsLength=f.rowsLength.value;
    var colsLength=f.colsLength.value;
    var a=s.split('_');
    if(a[0]=='undefined' || a[1]=='undefined'){
      	return null;
    }
    var obj=f.colsname_hidden;
    var index=0;
    if(colsLength<=1){
    	index=parseInt(eval(a[1]-1));
    }
    else{
            for(var i=0;i<colsLength;i++){
                var obj=f.colsname_hidden[i];
                var val=obj.value;
                if(val==a[0]){
                    index=eval(parseInt(colsLength)*parseInt(eval(a[1]-1)));
                    index+=parseInt(i);
                    break;
                }
            }
        }
        return index;
}

//���ݲ������õ����е����������

function get_text_data_fields(s){

    s=strReplace(s,'��',':');
    s=strReplace(s,'��','=');

    var f=document.forms(0);
    var rowsLength=f.rowsLength.value;
    var colsLength=f.colsLength.value;
    var fieldsArray =new Array();

    //�ж��Ƿ��Ƕ�����ݶ���ҪΪֻ��ģʽ
    var length=s.indexOf(':');
    if(length>-1){
        var a=s.split(':');
        if(a[0]=='undefined' || a[1]=='undefined'){
        	return null;
        }
        var b=a[0].split('_');
        var c=a[1].split('_');
            var j=0;
            var obj=f.colsname_hidden;
            if(colsLength<=1){  //һ�е����
               if(c[1]=='n'){
            		c[1]=parseInt(rowsLength);
            	}
            	for(var i=parseInt(b[1]);i<=parseInt(c[1]);i++){
                	fieldsArray[j]=obj.value+'_'+i;
                	j++;
            	}
            }
             else{
                if(c[0]=='n'){
                	c[0]='ZZ';
                }
                if(c[1]=='n'){
                	c[1]=rowsLength;
                }
                if(b[0].length==1){
                	b[0]="0"+b[0];
                }
                 if(c[0].length==1){
                	c[0]="0"+c[0];
                }
                for(var k=parseInt(b[1]);k<=parseInt(c[1]);k++){
            		for(var i=0;i<colsLength;i++){
                		var obj=f.colsname_hidden[i];
                		var val=obj.value;
               			var temp="";
               			if(val.length==1){
                			temp="0"+val;
              			}
                		if(temp>=b[0] && temp<=c[0]){
                     			fieldsArray[j]=val+'_'+k;
                     			j++;
               			 }
            		}
                }
             }
    }
    else{
     var a=s.split(',');
     for(var i=0;i<a.length;i++){
     	if(a[i]=='undefined'){
        	break;
        }
        fieldsArray[i]=a[i];
     }
    }
    return fieldsArray;
}
//����ű�
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_cal_equal(s,n){


    s=strReplace(s,'��',':');
    s=strReplace(s,'��','=');

    var f=document.forms(0);
    var a=s.split("=");



    //�Ƿ��Ǽ��㣬�õ�һ������ֵ��־
   var cal_flag=false;



   if((a[0]==null || a[0]=='undefined') && (a[1]==null || a[1]=='undefined')){
	return;
   }

   if(a[1]==null || a[1]=='undefined'){
   	a[1]=a[0];
        cal_flag=true;
   }

   if(!cal_flag){
   //�����A_n��B_n+C_n�������ʵ�еݹ� ȡֵ
   //����ȡֵ
   if(a[0].indexOf('_n')>-1){
        var rowsLength=f.rowsLength.value;
        for(var i=1;i<=rowsLength;i++){
            var temp_s=strReplace(s,'_n','_'+i);
            text_data_cal_equal(temp_s,n);
        }
         return;
   }
   //�����n_50��n_47+n_49�������ʵ�еݹ� ȡֵ
   //��ȡֵ
   if(a[0].indexOf('n_')>-1){
        var colsLength=f.colsLength.value;
        for(var i=0;i<colsLength;i++){
            var val="";
            if(colsLength>1){
            	val=f.colsname_hidden[i].value;
            }
            else{
                val=f.colsname_hidden.value;
            }
            var temp_s=strReplace(s,'n_',val+'_');
            text_data_cal_equal(temp_s,n);
        }
        return;
   }
   }

   a[1]=strReplace(a[1],'+','|+|');
   a[1]=strReplace(a[1],'-','|-|');
   a[1]=strReplace(a[1],'*','|*|');
   a[1]=strReplace(a[1],'/','|/|');
   a[1]=strReplace(a[1],'(','|(|');
   a[1]=strReplace(a[1],')','|)|');

   var b=a[1].split('|');

   var s2="";
   for(var i=0;i<b.length;i++){
       if(b[i]==null || b[i].length==0 || b[i]=='undefined'){
       		continue;
       }
       if(b[i]=='+' || b[i]=='-' || b[i]=='*' || b[i]=='/' || b[i]=='(' || b[i] == ')'){
       		s2+=b[i];
       }
       else{
           var obj=eval('document.all["TEXT_DATA_'+b[i]+'"]');
           var vx="";
           if(typeof(obj)=='object'){
           	vx=getFloat(numPartition_cancel(obj.value));
           }
           else{
           	vx=b[i];
           }
           s2+='parseFloat('+vx+')';
       }
   }
   if(s2.indexOf("/parseFloat(0)")>0 || s2.indexOf("/0")>0){
		s2 = replaceAll(s2,"/parseFloat(0)","/parseFloat(1)");
		s2 = replaceAll(s2,"/0","/parseFloat(1)");
		//alert(s2);		
	}
   var value=eval(s2);
    value=round(value,n);

//    alert(s2+'\n'+value);

    if(cal_flag){
         if(!isNaN(value)){
    	 	return  value;
         }
         else{
         	return 0;
         }
    }
    if(!isNaN(value)){

        var objLeft=eval('document.all["TEXT_DATA_'+a[0]+'"]');

        if(text_data_format_full_flag){
             value=numFull(value,n);
        }
        if(text_data_format_partition_flag){
            value=numPartition(value);
        }
    	objLeft.value=value;


    }

}

//����ű�,�ݼ����
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_cal_plus(s,n){

     s=strReplace(s,'��',':');
     s=strReplace(s,'��','=');

     var f=document.forms(0);

     var a=s.split("=");

   //�Ƿ��Ǽ��㣬�õ�һ������ֵ��־
   var cal_flag=false;



    if((a[0]==null || a[0]=='undefined') && (a[1]==null || a[1]=='undefined')){
	return;
   }

   if(a[1]==null || a[1]=='undefined'){
   	a[1]=a[0];
        cal_flag=true;
   }

   if(!cal_flag){
  //�����A_n��B_n+C_n�������ʵ�еݹ� ȡֵ
   //����ȡֵ
   if(a[0].indexOf('_n')>-1){
        var rowsLength=f.rowsLength.value;
        for(var i=1;i<=rowsLength;i++){
            var temp_s=strReplace(s,'_n','_'+i);
            text_data_cal_plus(temp_s,n);
        }
         return;
   }
   //�����n_50��n_47+n_49�������ʵ�еݹ� ȡֵ
   //��ȡֵ
   if(a[0].indexOf('n_')>-1){
        var colsLength=f.colsLength.value;
        for(var i=0;i<colsLength;i++){
            var val="";
            if(colsLength>1){
            	val=f.colsname_hidden[i].value;
            }
            else{
                val=f.colsname_hidden.value;
            }
            var temp_s=strReplace(s,'n_',val+'_');

            text_data_cal_plus(temp_s,n);
        }
         return;
   }
   }


   var b=get_text_data_fields(a[1]);

   var value=0;
   for(var i=0;i<b.length;i++){
      if(b[i]=='undefined'){
        	break;
        }
        var obj=eval('document.all["TEXT_DATA_'+b[i]+'"]');
    	value=eval(getFloat(numPartition_cancel(obj.value))+getFloat(value));
   }

   value=round(value,n);


   if(cal_flag){
      return value;
   }
   else{

      if(text_data_format_full_flag){
             value=numFull(value,n);
        }
        if(text_data_format_partition_flag){
            value=numPartition(value);
        }

     var objLeft=eval('document.all["TEXT_DATA_'+a[0]+'"]');
     objLeft.value=value;
   }

}
//����ű����ݼ����
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_cal_minus(s,n){

     s=strReplace(s,'��',':');
    s=strReplace(s,'��','=');

     var f=document.forms(0);

   var a=s.split("=");


   //�Ƿ��Ǽ��㣬�õ�һ������ֵ��־
   var cal_flag=false;



   if((a[0]==null || a[0]=='undefined') && (a[1]==null || a[1]=='undefined')){
	return;
   }
   if(a[1]==null || a[1]=='undefined'){
   	a[1]=a[0];
        cal_flag=true;
   }

   if(!cal_flag){
  //�����A_n��B_n+C_n�������ʵ�еݹ� ȡֵ
   //����ȡֵ
   if(a[0].indexOf('_n')>-1){
        var rowsLength=f.rowsLength.value;
        for(var i=1;i<=rowsLength;i++){
            var temp_s=strReplace(s,'_n','_'+i);
            text_data_cal_minus(temp_s,n);
        }
         return;
   }
   //�����n_50��n_47+n_49�������ʵ�еݹ� ȡֵ
   //��ȡֵ
   if(a[0].indexOf('n_')>-1){
        var colsLength=f.colsLength.value;
        for(var i=0;i<colsLength;i++){
            var val="";
            if(colsLength>1){
            	val=f.colsname_hidden[i].value;
            }
            else{
                val=f.colsname_hidden.value;
            }
            var temp_s=strReplace(s,'n_',val+'_');
            text_data_cal_minus(temp_s,n);
        }
         return;
   }
   }



   var b=get_text_data_fields(a[1]);
   var value=0;
   for(var i=0;i<b.length;i++){
      if(b[i]=='undefined'){
        	break;
        }
        var obj=eval('document.all["TEXT_DATA_'+b[i]+'"]');
        if(i==0){
           value=getFloat(numPartition_cancel(obj.value));
        }
        else{
            value=eval(getFloat(value)-getFloat(numPartition_cancel(obj.value)));
        }
   }

   value=round(value,n);

   if(cal_flag){
      return value;
   }
   else{
     if(text_data_format_full_flag){
             value=numFull(value,n);
        }
        if(text_data_format_partition_flag){
            value=numPartition(value);
        }
     var objLeft=eval('document.all["TEXT_DATA_'+a[0]+'"]');
     objLeft.value=value;
   }



}
//TEXT�� �������ýű���Ϊֻ��ģʽ (���ܼ���)
function text_data_cal_view(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);



    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');

        text_data_viewstyle_td(obj_td,'#6699FF',null,'');

//        var stylex='BORDER-BOTTOM:#000000 0px solid;BORDER-LEFT:#000000 0px solid;BORDER-RIGHT:#000000 0px solid;BORDER-TOP: #000000 0px solid;BACKGROUND:#ffffff;COLOR:#000000;font-size:12px;text-align:right;display:none';

//        text_data_viewstyle(obj,'true',stylex);

    }

}


//TEXT�� �������ýű� (ϵͳ����)
function text_data_cal_view_sys(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);

    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');

        text_data_viewstyle_td(obj_td,'#FFFFFF',null,'');

    }

}


//TEXT�� �ֹ�����ű�
function text_data_hands_view(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);



    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');

        text_data_viewstyle_td(obj_td,'#FFFF99',null,'');

    }

}

//TEXT�� �����ݽű���Ϊֻ��ģʽ�����ݽ������(������)
function text_data_nodata_view(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }

        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');

	obj.value='';

        var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');
    	var obj_div=eval('document.all["TD_ROWS_DATA_DIV_'+a[i]+'"]');
        text_data_viewstyle_td(obj_td,'#999999',null,'');
        text_data_viewstyle_div(obj_div,'none');

    }
}

//��ʾͼ��
function text_data_viewstyle(obj,read,stylex){

    if(typeof(obj)!='object'){
    	return;
    }
    if(read!=null){
    	obj.readOnly=read;
    }

//    if(stylex!=null){
//    	obj.style=stylex;
//    }

}
//��ʾͼ�� TD
function text_data_viewstyle_td(obj,bgcolorx,backgroundX,dispx,stylex){

    if(typeof(obj)!='object'){
    	return;
    }

     if(stylex!=null){
    	obj.style.borderBottom ='0px';
        obj.style.borderLeft ='0px';
        obj.style.borderRight ='0px';
        obj.style.borderTop ='0px';
    }

    if(bgcolorx!=null){
    	obj.bgColor=bgcolorx;
    }

    if(backgroundX!=null){
 	obj.background=backgroundX;
    }

    if(dispx!=null){
    	obj.style.display=dispx;
    }


}

//��ʾͼ�� DIV
function text_data_viewstyle_div(obj,dispx){

    if(typeof(obj)!='object'){
    	return;
    }
    if(dispx!=null){
    	obj.style.display=dispx;
    }

}


//TEXT�� �������ݽű���Ϊֻ��ģʽ�����ݽ������
function text_data_hiddendata_view(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');

	obj.value='';

        var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');
    	var obj_div=eval('document.all["TD_ROWS_DATA_DIV_'+a[i]+'"]');
    	 var stylex='BORDER-BOTTOM:#000000 0px solid;BORDER-LEFT:#000000 0px solid;BORDER-RIGHT:#000000 0px solid;BORDER-TOP: #000000 0px solid;BACKGROUND:#ffffff;COLOR:#000000;font-size:12px;text-align:right;display:none';

        text_data_viewstyle_td(obj_td,'#6699FF',null,'',stylex);
        text_data_viewstyle_div(obj_div,'none');

    }
}
//TEXT�� ���ݿ�Ԥ���ű���Ϊֻ��ģʽ�����ݽ������
function text_data_remaindata_view(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        obj.value=0;

       var obj_td=eval('document.all["TD_ROWS_DATA_'+a[i]+'"]');
    	var obj_div=eval('document.all["TD_ROWS_DATA_DIV_'+a[i]+'"]');
        text_data_viewstyle_td(obj_td,'#FFFFFF',null,'');
        text_data_viewstyle_div(obj_div,'none');
    }
}

//У�˺���
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format(s,n){
    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');

        var temp_s=obj.value;
        obj.value=numPartition_cancel(temp_s);
        if(!formatNumAlert(obj,n)){
            obj.value=temp_s;
            return false;
        }
        else{
        	obj.value=temp_s;
        }
    }
    return true;
}

//У�˺���,�������˵�ֵ�������
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format_equal(s,n){

     s=strReplace(s,'��',':');
    s=strReplace(s,'��','=');

     var equal_type="";
     if(s.indexOf(">=")>-1){
         equal_type=">=";
     }
     else if(s.indexOf("<=")>-1){
         equal_type="<=";
     }
     else if(s.indexOf(">")>-1){
         equal_type=">";
     }
     else if(s.indexOf("<")>-1){
         equal_type="<";
     }
     else if(s.indexOf("=")>-1){
         equal_type="=";
     }
     else{
     	return false;
     }


   var f=document.forms(0);
   var a=s.split(equal_type);


  if((a[0]==null || a[0]=='undefined') || (a[1]==null || a[1]=='undefined')){
      return false;
   }

   //�����A_n��B_n+C_n�������ʵ�еݹ� ȡֵ
   //����ȡֵ
   if(a[0].indexOf('_n')>-1){
        var rowsLength=f.rowsLength.value;
        for(var i=1;i<=rowsLength;i++){
            var temp_s=strReplace(s,'_n','_'+i);
            if(!text_data_format_equal(temp_s,n)){
            	return false;
            }
        }
        return true;
   }

   //�����n_50��n_47+n_49�������ʵ�еݹ� ȡֵ
   //��ȡֵ
   if(a[0].indexOf('n_')>-1){
        var colsLength=f.colsLength.value;
        for(var i=0;i<colsLength;i++){
            var val="";
            if(colsLength>1){
            	val=f.colsname_hidden[i].value;
            }
            else{
                val=f.colsname_hidden.value;
            }
            var temp_s=strReplace(s,'n_',val+'_');
            if(!text_data_format_equal(temp_s,n)){
            	return false;
            }
        }
        return true;
   }

    var valueLeft=text_data_cal_equal(a[0],n);
    var valueRight=text_data_cal_equal(a[1],n);

    var temp_flag=false;

    if(equal_type==">="){
    	if(valueLeft>=valueRight){
                temp_flag=true;
        }
    }
    else if(equal_type==">"){
    	if(valueLeft>valueRight){
                temp_flag=true;
        }
    }
    else if(equal_type=="<="){
    	if(valueLeft<=valueRight){
                temp_flag=true;
        }
    }
    else if(equal_type=="<"){
    	if(valueLeft<valueRight){
                temp_flag=true;
        }
    }
     else if(equal_type=="="){
    	if(valueLeft==valueRight){
                temp_flag=true;
        }
    }


    if(temp_flag>0){
       	return true;
    }
    else{
           alert('����У�鲻��ȷ����֤��ʽΪ��\n'+s+'\n���='+valueLeft+'\n�ұ�='+valueRight);
           return false;
    }
}

//ҳ���ʼ������������С��λ��
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format_full(s,n){

    text_data_format_full_flag=true;
    text_data_format_full_n=n;

    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        if(typeof(obj)=='object'){
            	if(formatNum(obj.value,n)){
                    var value=numFull(obj.value,n);
                	if(!isNaN(value)){
                    	obj.value=value;
                    }
            	}
        }
    }
}

//���ŷָ�
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format_partition(s,n){

    text_data_format_partition_flag=true;
    text_data_format_full_n=n;

    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        if(typeof(obj)=='object'){
            var value=numPartition_cancel(obj.value);
            if(formatNum(value,n)){
                obj.value=numPartition(value);
            }
        }
    }
}


//���ŷָ�ȡ��
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format_partition_cancel(s){
    var f=document.forms(0);
    var a=get_text_data_fields(s);
    for(var i=0;i<a.length;i++){
        if(a[i]=='undefined'){
        	return;
        }
        var obj=eval('document.all["TEXT_DATA_'+a[i]+'"]');
        if(typeof(obj)=='object'){
         	obj.value=numPartition_cancel(obj.value);
        }
    }
}

/**
     * ����:�ַ�����".00"����
     * @param s,�������Ҫ�����ַ���
     * @param n����Ҫ�����λ��
     * @return
     */
function numFull(s2,n){
	 var s="";
        if(s2==null){
        	s="0";
        }

        s=s2+'';

	var index2=s.indexOf(".") ;
	var s1="";
	if(index2>0){
	    s1=s.substring(index2+1);
	}
        else if(n>0){
            s=s+".";
        }
        for(var i=parseInt(n-s1.length);i>0;i--){
             s=s+"0";
        }


	return s;
}
/**
     * ����:������ݣ�ÿ��3λ�������ַ�������
     * @param s,�������Ҫ����
     * @return
     */
function numPartition(s2){

        var s="";
        if(s2==null){
        	return "";
        }

        s=s2+'';
        var s=numPartition_cancel(s);
        var index2=s.indexOf(".") ;
	var s1="";
        var s2="";
	if(index2>0){
        	s1=s.substring(index2);
        	s2=s.substring(0,index2)
	}
        else{
            s2=s;
        }
        var flag="";
        if(s2.indexOf("-")>-1){
            flag="-";
        }

        s2=Math.abs(parseFloat(s2))+"";

        var len=s2.length;
        var k=parseInt(len/3);
        if(len % 3 ==0 && len>0){
        	k=k-1;
        }
        for(var i=0;i<k;i++){
         	  s2=s2.substring(0,s2.length-i*3-3-i)+','+s2.substring(s2.length-i*3-3-i);
        }
	return flag+s2+s1;

}
/**
     * ����:������ݣ�ȥ��������
     * @param s
     * @return
     */
function numPartition_cancel(s){
    return strReplace(s,',','');
}


/**
     * ����:����ҳ������� ONBLUR �¼�
     * @param obj
     * @return
     */
function onBlurData(obj){
    var value=numPartition_cancel(obj.value);
    if(isNaN(value)){
        return false;
    }
    if(text_data_format_full_flag){
        value=numFull(value,text_data_format_full_n);
        value=round(value,text_data_format_full_n);
      	 obj.value=value;
    }
    if(text_data_format_partition_flag){
    	obj.value=numPartition(value);
    }

}

/**
     * ����:ɾ��ָ������
     * @param i,���±꣬��0��ʼ
     * @return
     */
function delTableRows(i){
    var tb=document.all["TB_BODY"];
    var rowsLength=tb.rows.length;
    if(parseInt(i)<rowsLength){
        tb.deleteRow(parseInt(i));
    }
}

/**
     * ����:ɾ��ָ������
     * @param i,���±꣬��0��ʼ
     * @return
     */
function delTableCols(i){
    var tb=document.all["TB_BODY"];
    var rowsLength=tb.rows.length;
    for(var j=0;j<rowsLength;j++){
        var tr=tb.rows(j);
        var colsLength=tr.cells.length;
        if(parseInt(i)<colsLength){
            tr.deleteCell(parseInt(i));
    	}
    }
}






//==============================���´���Ϊ���б����˹����� �ٶ��� �¼ӽű�========//


//TEXT�� �������ýű� (ϵͳ����)
function text_data_cal_view_sys_bank(s){
//        var obj_td=eval('document.all["TD_ROWS_DATA_'+s+'"]');
//        text_data_viewstyle_td(obj_td,'#FFFFFF',null,'');
}



//TEXT�� �ֹ�����ű�
function text_data_hands_view_bank(s){
        var obj_td=eval('document.all["TD_ROWS_DATA_'+s+'"]');
        text_data_viewstyle_td(obj_td,'#FFFF99',null,'');
}


//TEXT�� �������ýű���Ϊֻ��ģʽ (���ܼ���)
function text_data_cal_view_bank(s){
        var obj_td=eval('document.all["TD_ROWS_DATA_'+s+'"]');
        text_data_viewstyle_td(obj_td,'#6699FF',null,'');
}


//TEXT�� �����ݽű���Ϊֻ��ģʽ�����ݽ������(������)
function text_data_nodata_view_bank(s){
        var obj=eval('document.all["TEXT_DATA_'+s+'"]');
	obj.value='';
        var obj_td=eval('document.all["TD_ROWS_DATA_'+s+'"]');
    	var obj_div=eval('document.all["TD_ROWS_DATA_DIV_'+s+'"]');
        text_data_viewstyle_td(obj_td,'#999999',null,'');
        text_data_viewstyle_div(obj_div,'none');
}


//У�˺���
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_format_bank(s,n){
        var obj=eval('document.all["TEXT_DATA_'+s+'"]');
        var temp_s=obj.value;
        obj.value=numPartition_cancel(temp_s);
        if(!formatNumAlert(obj,n)){
            obj.value=temp_s;
            return false;
        }
        else{
        	obj.value=temp_s;
        }
    return true;
}


//����ű�
//����N��ʾ��Ҫ���ص�С��λ��
function text_data_cal_equal_bank(s,n){
    var a=s.split("=");
   a[1]=strReplace(a[1],'+','|+|');
   a[1]=strReplace(a[1],'-','|-|');
   a[1]=strReplace(a[1],'*','|*|');
   a[1]=strReplace(a[1],'/','|/|');
   a[1]=strReplace(a[1],'(','|(|');
   a[1]=strReplace(a[1],')','|)|');
   var b=a[1].split('|');
   var s2="";


   for(var i=0;i<b.length;i++){
       if(b[i]==null || b[i].length==0 || b[i]=='undefined'){
       		continue;
       }
       if(b[i]=='+' || b[i]=='-' || b[i]=='*' || b[i]=='/' || b[i]=='(' || b[i] == ')'){
       		s2+=b[i];
       }
       else{
           var obj=eval('document.all["TEXT_DATA_'+b[i]+'"]');
           var vx="";
           if(typeof(obj)=='object'){
           	vx=getFloat(numPartition_cancel(obj.value));
           }
           else{
           	vx=b[i];
           }
           s2+='parseFloat('+vx+')';
       }
   }



   var value=eval(s2);
    value=round(value,parseInt(n));

    if(!isNaN(value)){

        var objLeft=eval('document.all["TEXT_DATA_'+a[0]+'"]');

        if(text_data_format_full_flag){
             value=numFull(value,n);
        }
        if(text_data_format_partition_flag){
            value=numPartition(value);
        }
    	objLeft.value=value;

    }


}

//==============================���ϴ���Ϊ���б����˹����� �ٶ��� �¼ӽű�========//

function replaceAll (streng, soeg, erstat)
    {
     var st = streng;
     if (soeg.length == 0)
      return st;
     var idx = st.indexOf(soeg);
     while (idx >= 0)        
     {  
      st = st.substring(0,idx) + erstat + st.substr(idx+soeg.length);
      idx = st.indexOf(soeg);
     }
     return st;
    }

