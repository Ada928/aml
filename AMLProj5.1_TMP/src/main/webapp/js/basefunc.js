/**
//================================���ܺ����б�����======================//
// �������ڣ�2006-03-10
// ������Ա��heguoqiang
���		��������    			��������			����ֵ
1		checkPrice			���۸�			boolean
2		checkPrice1			���۸�			1/0
3		checkTelephone			���绰����		1/0
4		checkNum			�������			boolean
5		time_select			�ꡢ�¡������ڵ�����ѡ������
6		checkRadio			����Ƿ�ѡ��check��	num>0�Ѿ�ѡ��
7		checkString			����ִ��Ƿ�Ϊ���ֻ���ĸ	1/0
8		checkNumLength			����ִ�����Ϊ�Ƿ�strLength	boolean
9		checkNumber			�������			1/0
10		checkEmail			�������ʼ��Ƿ���ȷ	boolean
11		CheckBoxCheckedNum		ȡ��checkboxѡ�еĸ���
12		CheckBoxCheckedSingleOne	ֻ��ѡ��һ��checkbox
13		CheckBoxMustChecked		����ѡ��һ��checkbox
14		getLength			�ж�һ���ַ�����ʵ���ȣ�����Ϊ��λ
15		checkChina
16		checkPhone			�жϵ绰�����Ƿ�Ϸ�	boolean
17		checkDouble			������֣���֤С����������λ����
18		checkFraction			����Ƿ�ΪС�������
19		checkChar			����Ƿ���ĳ���ַ�
20		Fraction			�ѷ���ת��ΪС������
21		getFloat			ת����������Ĭ��Ϊ0����JS��ҳ������ʱ�����Ҫ
22		round				�������뺯��
23		formatDate			У��������ַ��Ƿ�������ڹ淶 yyyy-mm-dd
24		formatDateAlert			У��������ַ��Ƿ�������ڹ淶 yyyy-mm-dd�����ϸ�����ʾ��Ϣ��
25		formatNum			�����ֵ�Ƿ���Ϲ涨�ĸ�ʽ
26		formatNumAlert			�����ֵ�Ƿ���Ϲ涨�ĸ�ʽ�����ϸ�����ʾ��Ϣ��
27		getCookie			����COOKIE���ƣ��õ�COOKIE��ֵ
28		space				�����ַ���������ȣ����������Կո���д�����ڶ�<select>�ؼ��и�ʽ����֮��
29		len				�����ַ����ĳ��ȣ�������2λ��ʾ
30		cut				�ַ������չ涨�ĳ��Ƚضϣ����㳤���򲻽ض�
31		justify				�ַ�����LN������ʾ������ӿո񣬶���Ľض�,�����...��β��
32		checkCharOrNum			У���ַ��Ƿ�Ϊ��ĸ��������
33		checkCharOrNumAlert		У���ַ��Ƿ�Ϊ��ĸ�������֣����ϸ�����ʾ��Ϣ��
34		checkChinese			У���ַ��Ƿ���˫�ֽڵ��ַ�
35		checkChineseAlert		У���ַ��Ƿ���˫�ֽڵ��ַ������ϸ�����ʾ��Ϣ��
36		checkNullAndLen			У���ַ��Ƿ�Ϊ�ջ��߳����Ƿ�����Ҫ��
37		checkNullAndLenAlert		У���ַ��Ƿ�Ϊ�ջ��߳����Ƿ�����Ҫ�󣨲��ϸ�����ʾ��Ϣ��
38		trim				ȥ���ַ������߿ո�ĺ���
39		ltrim				ȥ���ַ�����߿ո�ĺ���
40		rtrim				ȥ���ַ����ұ߿ո�ĺ���
41		openDlgWindow			�����Ի�����ģʽ
42		openWindow			������ͨ����ģʽ
43		getCheckedNum			ȡ��checkbox �� RADIO ѡ�еĸ���
44		getCheckedNumAlert		ȡ��checkbox �� RADIO ѡ�еĸ��������ϸ�����ʾ��Ϣ��
45		getSelectedOption		��SELECT��ѡ�е�optionֵ����
46		checkFloat  			����Ƿ�Ϊ���ֻ�С��	true/false
47              checkNull                       ����Ƿ�Ϊ��             true/false
48      DateDiff              ��������ʱ���     �ַ���
//===================================���ܺ����б�����======================//
*/

/**
//The following added by fish 20070911 for cibaml project
F00		formatDate2			У��������ַ��Ƿ�������ڹ淶 yyyy-mm-dd
F01		formatDateAlert2			У��������ַ��Ƿ�������ڹ淶 yyyy-mm-dd�����ϸ�����ʾ��Ϣ��
F02		selectRadio			click the table line to select the radio in this line
//====== end by fish
*/

//���ܣ����۸�
//����:�۸��ַ���;�۸����Ϊ��xxx.xx��ʽ
//���أ�true / false
function checkPrice(numstr){
    return formatNum(numstr,2,0,null,true);

//    var TempChar;
//    var tmp=0
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!="."){
//            i=-1;
//            break;
//        }else if(TempChar=="."){
//            tmp=1;
//            if((numstr.length-1-i) != 2){
//                i=-1;
//                break;
//            }
//        }
//    }
//    if((i==-1) || (tmp==0))
//        return false;
//    else
//        return true;

}
/**
 �۸��п��Ժ������ֺ�.
 */
function checkPrice1(numstr){
    if(formatNum(numstr,2,0)){
    	return 1;
    }
    else{
    	return  0;
    }

//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)	return 0;
//    else	return 1;
}
/**
 �绰�п��Ժ������ֺ�-
 */
function checkTelephone(numstr){
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='-'){
            i=-1;
            break;
        }
    }
    if(i==-1)	return 0;
    else	return 1;
}
//���ܣ��������
//���룺�����ַ���
//���أ�true / false
function checkNum(numstr){
    return formatNum(numstr,0,0);
//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)
//        return false;
//    else
//        return true;
}
//���ܣ��ꡢ�¡������ڵ�����ѡ����������
//���룺day_se-��ǰѡ�������;time_n-ʱ���ַ���;year_n,month_n,day_n�������յ�form������
//���أ�
function time_select(year_n,month_n,day_n,time_n,day_se){
    var i;
    var len=31;
    var year=year_n.value;
    i=month_n.selectedIndex+1;
    //alert("i="+i);
    if(i==4 || i==6 || i==9 || i==11)
        len=30;
    if(i==2){
        len=28;
        if((year%4==0 && year%100==0 && year%400==0) || (year%4==0 && year%100!=0)){
            len=29;
        }
    }
    //alert(day_se);
    day_n.length = len ;
    for (j=0 ;j<len;j++){
        var va;
        if(j<9) va="0"+eval(j+1);
        else va = eval(j+1);
        day_n.options[j].text=j+1;
        day_n.options[j].value=va;
    }
    if(day_se>0)
        day_n.selectedIndex=day_se-1;
    //---
    var month = month_n.value;
    var day = day_n.value;
    time_n.value=eval(year+month+day)+"000000";
}
//���ܣ�����Ƿ�ѡ��check��
//
//���أ�num>0�Ѿ�ѡ��
function checkRadio(radioObj){
    var num=-1;
    if(radioObj!=null){
        //alert(radioObj);
        for ( var i=0; i < radioObj.length; i++ ){
            if ( ( true==radioObj[i].checked ) )
                num=i;
        }
        if(true==radioObj.checked)
            num=1000;
        //alert(num);
    }
    return num;
}

//����ִ��Ƿ�Ϊ���ֻ���ĸ
function checkString(Charstr){
	
    var Tempstr;
    for(j=0;j<=Charstr.length-1;j++){
        Tempstr=Charstr.charAt(j);
        if(!((Tempstr>="0" && Tempstr<="9") || (Tempstr>="a" && Tempstr<="z") || (Tempstr>="A" && Tempstr<="Z"))){
        	j=-1;
            break;
        }
    }
    if(j==-1)
        return 0;
    else
        return 1;
}

//����ִ�����Ϊ�Ƿ�strLength
function checkNumLength(numStr,strLength) {
    if (numStr.length==0) return true;
    else if (numStr.length==strLength)	return true;
    else	return false;
}

//����Ƿ�Ϊ����
function checkNumber(numstr){
    if(formatNum(numstr,0,0)){
     	return 1;
    }
    else{
    	return 0;
    }
//    var TempChar;
//    for(i=0;i<=numstr.length-1;i++){
//        TempChar=numstr.charAt(i);
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)	return 0;
//    else	return 1;
}

//�������ʼ��Ƿ���ȷ

function checkEmail(email){
    invalid = "";
    if (!email)
        invalid = "";
    else {
        if ( (email.indexOf("@") == -1) || (email.indexOf(".") == -1) )
            invalid += "\n\nEmail��ַ���Ϸ���Ӧ������'@'��'.'������('.com')��������ٵݽ���";
        if (email.indexOf("your email here") > -1)
            invalid += "\n\nEmail��ַ���Ϸ�����������Email��ַ����������Ӧ������'@'��'.'������('.com')��";
        if (email.indexOf("\\") > -1)
            invalid += "\n\nEmail��ַ���Ϸ������зǷ��ַ�(\\)��";
        if (email.indexOf("/") > -1)
            invalid += "\n\nEmail��ַ���Ϸ������зǷ��ַ�(/)��";
        if (email.indexOf("'") > -1)
            invalid += "\n\nEmail��ַ���Ϸ������зǷ��ַ�(')��";
        if (email.indexOf("!") > -1)
            invalid += "\n\nEmail��ַ���Ϸ������зǷ��ַ�(!)��";
        if ( (email.indexOf(",") > -1) || (email.indexOf(";") > -1) )
            invalid += "\n\nֻ����һ��Email��ַ����Ҫ���зֺźͶ��š�";
        if (email.indexOf("?subject") > -1)
            invalid += "\n\n��Ҫ����'?subject=...'��";
        if (checkChina(email) == -1)
            invalid += "\n\n��Ҫ�������ġ�";
        if (email.indexOf("@.")>-1||email.indexOf(".@")>-1)
            invalid += "\n\n��Ҫ���� @. ���ӵķǷ�Email��";

    }
    if (invalid == "") {
        return true;
    }else {
        //alert("�����Email���ܰ�������" + invalid);
        return false;
    }
}
/**
 ȡ��checkboxѡ�еĸ���
 */
function CheckBoxCheckedNum(form)
{
    var num=0;
    for ( var i=0; i < form.elements.length; i++ )
    {
        if (( true==form.elements[i].checked) && (form.elements[i].type == 'checkbox' )) num++;
    }
    //alert(num);
    return num;
};

function CheckBoxCheckedSingleOne(form){
    var num=0;
    var errMsg=""
    num=CheckBoxCheckedNum(form);
    if(num<1) errMsg="��ѡ��";
    else if(num>1) errMsg="ֻ��ѡ��һ����";
    return errMsg;
}

function CheckBoxMustChecked(form){
    var num=0;
    var errMsg=""
    num=CheckBoxCheckedNum(form);
    if(num<1) errMsg="��ѡ��";
    return errMsg;
}

//���form�����ʵ����
function getLength(formValue){
    var length=0;
    for(i=0;i<formValue.length;i++){
        if(formValue.charAt(i)>'~')
            length+=2;
        else
            length++;
    }
    return length;
}

//���form�����ʵ����
function checkChina(formValue){
    var length=0;
    for(i=0;i<formValue.length;i++){
        if(formValue.charAt(i)>'~')
            length=-1;
    }
    return length;
}

function checkPhone(obj)
{
    if(obj=="")return true;
    slen=obj.length;
    for (i=0; i<slen; i++){
        cc = obj.charAt(i);
        if ((cc <"0" || cc >"9") && cc != "-" && cc!="+" && cc!="(" && cc !=")" && cc !="/")
        {
            return false;
        }
    }
    return true;
}
/**
 ������֣���֤С����������λ����
 number-Ҫ��������
 jd-С���ľ��ȣ�����С������λ��
 */
function checkDouble(numstr,jd){
     if(formatNum(numstr,2)){
     	return 1;
    }
    else{
    	return 0;
    }

//    var TempChar;
//    var iPoint = -1;
//    var iPointNumber = 0;
//    for(i=0;i<=numstr.length-1;i++){
//        if(iPoint>-1){
//            iPoint ++;
//        }
//        TempChar=numstr.charAt(i);
//        if(i==0 && TempChar=='-'){
//            //����
//            continue;
//        }
//        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
//            i=-1;
//            break;
//        }else if(TempChar=='.'){
//            iPointNumber ++;
//            iPoint = 0;
//        }
//        if(iPoint>jd || iPointNumber>1){
//            i=-1;
//            break;
//        }
//    }
//    if(i==-1)
//        return 0;
//    else
//        return 1;
}
//����Ƿ�ΪС�������
function checkFraction(numstr){
    var TempChar;
    var hefa=0;
    var flag=-1;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(((TempChar!='0' && TempChar!='1' && TempChar!='2' && TempChar!='3'&& TempChar!='4' && TempChar!='5'&& TempChar!='6' && TempChar!='7' && TempChar!='8' && TempChar!='9'&&TempChar!='.'&&TempChar!='/'))||(TempChar==' ')){
            flag=TempChar;
            break;
        }
        if(TempChar=='.'||TempChar=='/'){
           hefa++;
        }

    }
    var Errmsg="";
    if(flag!=-1)	Errmsg="��������ֺ��зǷ��ַ�:"+flag+"��\n";
    else if(hefa>1)     Errmsg+="��������ֺ��ж��/��.,������Ϸ���С���������\n ";
    //���Ϊ���������Ϸ���
    if((Errmsg=="")&&(checkChar(numstr,"/"))){
       //1.����һλ����Ϊ0
        if(numstr.charAt(0)==0){
            Errmsg=" ���ӵ�һλ����Ϊ�㡣";
        }
        else if(numstr.charAt(0)=='/'||numstr.charAt(numstr.length-1)=='/'){
            Errmsg=" �������ò��Ϸ���";
        }
        else{
      //2.��ĸ��һλ����Ϊ0
            for(i=0;i<=numstr.length-1;i++){
                TempChar=numstr.charAt(i);
                if(TempChar=='/'){
                    beg=i+1;
                    break;
                }
            }
            if(numstr.charAt(beg)==0){
                Errmsg+=" ��ĸ��һλ����Ϊ�㡣";
            }
        }
    }
    return Errmsg;
}
//����Ƿ���ĳ���ַ�
function checkChar(numstr,Subchar){
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar==Subchar){
            i=-1;
            break;
        }
    }

    if(i==-1)	return true;
    else return false;
}
//�ѷ���ת��ΪС������
function Fraction(numstr){
    var TempChar;
    var fengzi="";
    var fengmu="";
    var beg;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar=='/'){
            beg=i+1;
            break;
        }
         fengzi+=TempChar;
        }

   for(i=beg;i<=numstr.length-1;i++){
      TempChar=numstr.charAt(i);
      fengmu+=TempChar;
        }
    var result=parseInt(fengzi)/parseInt(fengmu);
  //  alert("result:"+result);
    return result;
}




/**
 * ���ڣ�2006-03-10
 * ���ߣ�heguoqiang
 */


/**
   * ����:ת����������Ĭ��Ϊ0����JS��ҳ������ʱ�����Ҫ
   * @param s ��Ҫ���������
    * @return ����
   */
function getFloat(s) {
  if(isNaN(s) || s.length==0){
    return 0.0;
  }
  else{
    return parseFloat(s);
  }
}

/**
   * ����:�������뺯��
   * @param f ��Ҫ���������
   * @param n ��Ҫ����С����λ����Ϊ0�������Ǳ���������λ��
    * @return ����
   */
function round(f,n) { // f: float value; n:radix point
  var r=1;
  for(i=1;i<=n;i++){
      r=r*10;
  }
  f2=Math.round(f*r)/r;
  return f2;
}

/**
   * ����:У��������ַ��Ƿ�������ڹ淶 yyyy-mm-dd
   * @param str ��ҪУ�˵������ַ���
    * @return BOOLEAN
   */
function formatDate(str) {
    if(str.length!=10){
        return false;
    }
    var t=str.charAt(4);
    if(t!="-"){
        return false;
    }
    var t=str.charAt(7);
    if(t!="-"){
        return false;
    }
    var s=str.substring(0,4);
    if(!formatNum(s,0,1000,9999)){
        return false;
    }
    var y=parseInt(s);
    var s=str.substring(5,7);
    if(!formatNum(s,0,1,12)){
        return false;
    }
    var m=parseInt(s);
    var s=str.substring(8);
     if(!formatNum(s,0,1,31)){
        return false;
    }
    var d=parseInt(s);
    if((m==4 || m==6 || m==9 || m==11) && d>30){
        return false;
    }
    if(m==2 && d>29){
        return false;
    }
    if(m==2 && !((y % 4 ==0 && y % 100!=0) || y % 400==0) && d>28){
        return false;
    }
    return true;
}

/**
 * validate date, format:yyyy-mm-dd, yyyy = 2000-2099
 */
function formatDate2(oStartDate)
{
    if(oStartDate==null || oStartDate.replace(/(^\s*)|(\s*$)/g, "").length==0) return true;
    
    //var pat_hd=/^20\d{2}-((0[1-9]{1})|(1[0-2]{1}))-((0[1-9]{1})|([1-2]{1}[0-9]{1})|(3[0-1]{1}))$/;
    //var pat_hd=/^20\d{2}-([0-9]{1,2})-([0-9]{1,2})$/;
    var pat_hd=/^([1-9]{1})\d{3}-([0-9]{1,2})-([0-9]{1,2})$/;

 try{
     if(!pat_hd.test(oStartDate)){throw "Invalid Date!";}
  /*var arr_hd=oStartDate.split("-");
  var dateTmp;
  dateTmp= new Date(arr_hd[0],parseFloat(arr_hd[1])-1,parseFloat(arr_hd[2]));
  if(dateTmp.getFullYear()!=parseFloat(arr_hd[0]) || dateTmp.getMonth()!=parseFloat(arr_hd[1]) -1 || dateTmp.getDate()!=parseFloat(arr_hd[2]))
  {
   throw "Invalid Date!";
  }*/
 }
 catch(ex)
 {
  if(ex.description)
   {return false;}
   else
    {return false;}
 }
 return true;
}

/**
 * fomratdate and alert
 */
function formatDateAlert2(obj)
{
	if(!formatDate2(obj.value)){
		alert(obj.value+"\n��֤���ϸ���������ȷ�����ڣ�YYYY-MM-DD��!");
		obj.focus();
	}
}

/**
   * ����:У������Ķ��������е������Ƿ�������ڹ淶 yyyy-mm-dd
   * @param obj ��ҪУ�˵Ķ���
    * @return BOOLEAN
   */
function formatDateAlert(obj) {
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }
    if(!formatDate(s)){
        alert(s+'\n��֤���ϸ���������ȷ�����ڣ�YYYY-MM-DD��!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}


/**
   * ����:�����ֵ�Ƿ���Ϲ涨�ĸ�ʽ
   * @param str ��У�˵�����
   * @param n ��ҪУ�˵�С��λ��
   * startNum ���ֿ�ʼֵ
   * endNum ���ֽ���ֵ
   * flag С��λ�Ƿ���벹��
   * @return boolean
   */

function formatNum(str,n,startNum,endNum,flag) {
    var flag1=false; //�Ƿ�������ֹ淶
    var flag2=false; //�Ƿ����С�淶
    var flag3=false; //�Ƿ���ϴ�淶
    var flag4=true; //�Ƿ�С��λ���벹��
    if(!isNaN(str)){
        if(n==null){//ֻ����֤�Ƿ�Ϊ�������
            flag1=true;
        }
        else if(n==0){//��֤�Ƿ�Ϊ����
            if(str.indexOf(".")<0 && str.indexOf(" ")<0){
                flag1=true;
            }
        }
        else{//��֤ΪС���������ֻҪ��������Ӧ��С��λ���Ϳ�����
            if(str.indexOf(".")<0 || str.length-str.indexOf(".")<=n+1){
              	flag1=true;
            }
            if(flag){
                if(str.indexOf(".")<0 || str.length-str.indexOf(".")!=n+1){
                    flag4=false;
            	}
            }
        }
        if(startNum==null){
            flag2=true;
    	}
        else{
            if(parseFloat(str)>=parseFloat(startNum)){
                flag2=true;
            }
        }
        if(endNum==null){
            flag3=true;
    	}
        else{
            if(parseFloat(str)<=parseFloat(endNum)){
                flag3=true;
            }
        }
    }
    if(flag1 && flag2 && flag3 && flag4){
  	return true;
    }
    return false;
}


/**
   * ����:�����ֵ�Ƿ���Ϲ涨�ĸ�ʽ
   * @param obj ��У�˵Ķ���
   * @param n ��ҪУ�˵�С��λ��������Ϊ�գ�����ֻҪ�����־Ϳ���
   * startNum ���ֿ�ʼֵ������Ϊ�գ���ʾû�д�С����
   * endNum ���ֽ���ֵ������Ϊ�գ���ʾû�д�С����
   * flag С��λ�Ƿ���벹�룬true ��ʾ���벹��С��λ����false��Ϊ�գ���ʾ����Ҫ����
   * @return boolean
   */

function formatNumAlert(obj,n,startNum,endNum,flag) {
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }
    var message="";

    if(n==0){
       message+="����������!";
    }
    if(n>0 && flag){
       message+="���벹�� " + n +" λС��!";
    }
    if(startNum!=null && endNum!=null){
        if(startNum==endNum){
            message+="��ֵ������� " + startNum + " !"   ;
        }
        else{
          message+="��ֵ������ " + startNum +" �� "+ endNum +" ֮��!" ;
        }
    }
    else{
    	if(startNum!=null){
       	    message+="��ֵ������ڻ��ߵ��� " + startNum +"!";
        }
        if(endNum!=null){
   	    message+="��ֵ����С�ڻ��ߵ��� " + endNum +"!";
  	 }
    }
    if(!formatNum(s,n,startNum,endNum,flag)){
        alert(s+'\n��֤���ϸ�!'+message);
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * ����:����COOKIE���ƣ��õ�COOKIE��ֵ
   * @param name ��Ҫȡֵ��cookie����
   * @return string cookie��ֵ���޶�ӦCOOKIE�򷵻� "";
   */
function getCookie(name) {
var cookieFound=false;
var start=0;
var end=0;
var s=document.cookie;
var i=0;
// LOOK FOR name IN CookieString
  while( i <= s.length) {
    start=i;
    end=start+name.length;
    if(s.substring(start,end)==name) {
      cookieFound=true;
      break;
    }
    i++;
  }
  //CHECK IF NAME WAS FOUND
  if(cookieFound) {
    start=end+1;
      end=s.indexOf(";",start);
      if(end < start)
      end=s.length;
      return(unescape(s.substring(start,end)));
  }
  //NAME WAS NOT FOUND
  return "";
}

/**
   * ����:�����ַ���������ȣ����������Կո���д�����ڶ�<select>�ؼ��и�ʽ����֮��
   * @param n ��Ҫ����ո��λ��
   * @return string �Կո���ɵ��ַ���
   */
function space(n) {
  var i=0;
  var s="";
  for(i=0;i<n;i++){
      s+=" ";
  }
  return s;
}

/**
   * ����:�����ַ����ĳ��ȣ�������2λ��ʾ
   * @param s ��������ַ���
   * @return �ַ����ĳ���
   */
function len(s) {
  var ln=0,i=0;
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){ // ���е��ֽ�ASCII
      ln+=1;
    }
    else{
      ln+=2;
    }
  }
  return ln;
}

/**
   * ����:�ַ������չ涨�ĳ��Ƚضϣ����㳤���򲻽ض�
   * @param s ��������ַ���
   * @param xlen �ַ����ĳ���
   * @return string
   */

function cut(s,xlen) {
  var ln=0,i=0; var t="";
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){ // ���е��ֽ�ASCII
      ln+=1;
    }
    else{
      ln+=2;
    }
    if(ln==xlen) {
        i++;
        t=s.substring(0,i);
        break;
    }
    else if(ln>xlen) {
        t=s.substring(0,i)+" ";
        break;
    }
  }
  return t;
}

/**
   * ����:�ַ�����LN������ʾ������ӿո񣬶���Ľض�,�����...��β��
   * @param s ��������ַ���
   * @param ln �ַ����ĳ���
   * @return string
   */
function justify(s,ln) {
  var sLen=len(s);
  var t="";
  var i=0;
  if(sLen<=ln){
    t=s+space(ln-sLen);
  }
  else{
    t=cut(s,ln-3)+"...";
  }
  return t;
}

 /**
   * У���ַ��Ƿ�Ϊ��ĸ��������
   * @param s
   * @return boolean
   */
function checkCharOrNum(s){
  var ln=0,i=0;
  var t="";
  if(s.length!=len(s)){
    return false;
  }
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>='0' && c<='9') continue;
    if(c>='A' && c<='Z') continue;
    if(c>='a' && c<='z') continue;
    if(c=='_') continue;
    return false;
  }
  return true;
}

/**
   * У���ַ��Ƿ�Ϊ��ĸ��������
   * @param obj ��Ҫ��֤�Ķ���
   * @return boolean
   */
function checkCharOrNumAlert(obj){
    var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    if(!checkCharOrNum(s)){
        alert(  s+' \n��֤���ϸ񣬺��з���ĸ�����ֵ���ֵ!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * У���ַ��Ƿ���˫�ֽڵ��ַ�
   * @param s
   * @return boolean
   */
function checkChinese(s) {
  var i=0;
  for(i=0;i<s.length;i++) {
    c=s.charAt(i);
    if(c>=' ' && c<='~'){
        continue;
    }
    return true;
  }
  return false;
}

/**
   * У���ַ��Ƿ���˫�ֽڵ��ַ�
   * @param obj����֤�Ķ���
   * @return boolean
   */
function checkChineseAlert(obj) {
 var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    if(!checkChinese(s)){
        alert(  s+' \n��֤���ϸ�û�к�����!');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
}

/**
   * У���ַ��Ƿ�Ϊ�ջ��߳����Ƿ�����Ҫ��
   * @param s ��У�˵��ַ���
   * @param minLen ��������ĳ��ȣ�����Ϊ��
   * @param maxLen ���ܳ����ĳ��ȣ�����Ϊ��
   * @return boolean
   */
function checkNullAndLen(s,minLen,maxLen) {
  if(s==null || trim(s).length==0){
  	return false;
  }
  if(minLen!=null){
   if(parseInt(minLen)>parseInt(len(s))){
       return false;
   }
  }
  if(maxLen!=null){
   if(parseInt(maxLen)<parseInt(len(s))){
       return false;
   }
  }
  return true;
}


/**
   * У���ַ��Ƿ�Ϊ�ջ��߳����Ƿ�����Ҫ��
   * @param obj ��У�˵Ķ���
   * @param minLen ��������ĳ��ȣ�����Ϊ��
   * @param maxLen ���ܳ����ĳ��ȣ�����Ϊ��
   * @return boolean
   */

function checkNullAndLenAlert(obj,minLen,maxLen) {
 var s="";
    var objFlag=false;
    if(typeof(obj)=='object'){
    	var s=obj.value;
        objFlag=true;
    }
    else{
    	s=obj;
    }

    var message="";

    if(minLen!=null && maxLen!=null){
        if(minLen==maxLen){
            message+="��ֵ���ȱ������ " + minLen +" !" ;
        }
        else{
            message+="��ֵ���ȱ����� " + minLen +" �� "+ maxLen +" ֮��!";
        }
    }
    else{
    	if(minLen!=null){
       	    message+="��ֵ���ȱ�����ڻ��ߵ��� " + minLen +"!";
        }
        else if(maxLen!=null){
   	    message+="��ֵ���ȱ���С�ڻ��ߵ��� " + maxLen +"!";
  	 }
         else{
             message+="��ֵ����Ϊ�պ�ȫ��Ϊ�ո�";
         }
    }

    if(!checkNullAndLen(s,minLen,maxLen)){
        alert(  s+' \n��֤���ϸ�!'+message+'һ�������������ַ���');
        if(objFlag){
            obj.focus();
        }
        return false;
    }
    return true;
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
    if(s==null || s.length==0){
    	return "";
    }
    while(s.length>0 && s.charAt(0)==' '){ //ȥ����߿ո�
    	 s=s.substring(1);
    }
    return s;
}
/**
   * ȥ���ַ����ұ߿ո�ĺ���
   * @param s ��������ַ���
   * @return ������Ϻ���ַ���
   */

function rtrim(s) {
    if(s==null || s.length==0){
    	return "";
    }
    while(s.length>0 && s.charAt(s.length-1)==' '){//ȥ���ұ߿ո�
    	 s=s.substring(0,s.length-1);
    }
    return s;
}

/**
   * �����Ի�����ģʽ
   * @param ctrlobj ���������ݵĿؼ�����
   * @param url �������������õ�URL��ַ������http://ip:8080/web/
   * @param width,height �������ڵĿ�͸�
   * @return boolean(��������ֵ����Ϊtrue)
   */

function openDlgWindow(ctrlobj,url,width,height){
   	var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
        var d=new Date();
        url=url+"&temp_seq="+d.getTime();
       retval = window.showModalDialog(codebase+"/"+url, "", "dialogWidth:"+width+"px; dialogHeight:"+height+"px; status:no; directories:yes;scrollbars:auto;Resizable=yes; ");
        if( retval != null ){
		ctrlobj.value = retval;
                return true;
	}else{
          return false;
	}
}

/**
   * ������ͨ����ģʽ
   * @param url �������������õ�URL��ַ������http://ip:8080/web/
   * @param width,height �������ڵĿ�͸�
   * @return boolean(��������ֵ����Ϊtrue)
   */
function openWindow(url,width,height){
        var secondSlash=0;
	var path= '';
	var codebase = '';
	if ((secondSlash = (path = window.location.pathname).indexOf('/',1)) != -1){
		codebase = path.substring(0,secondSlash);
	}
        var para="Resizable=yes,scrollbars=yes,width="+width+"px,height="+height+"px";
	window.open(codebase+"/"+url,"", para);
}

/**
 ȡ��checkbox �� RADIO ѡ�еĸ���
  * @param obj checkbox����
   * @return num ����
 */
function getCheckedNum(obj){
    var num=0;
    if(obj.length>1){//�����������
    	for ( var i=0; i < obj.length; i++ ){
        	if (true==obj[i].checked){
        	   num++;
      	 	 }
    	}
    }
    else{//�����������
        if (true==obj.checked){
        	num++;
        }
    }
    return num;
}

/**
 ȡ��checkbox �� RADIO ѡ�еĸ���
  * @param obj checkbox����
   * @return num ����
 */
function getCheckedNumAlert(obj,num){
    if(typeof(obj)!='object'){//������ʹ��
        alert('�޼�¼���߶������');
        return false;
    }
    var num2=getCheckedNum(obj);
    var flag=false;//�ж��Ƿ�������
    var flag2=false;//�ж��Ƿ��д���
    if(obj.length>1){//�����������
	flag=true;
    }
    if(num2<1){
    	    alert('��ѡ��');
            flag2=true;
    }
    else if(num!=null && num2!=num){
    	    alert('����ѡ�� '+ num +' ����');
            flag2=true;
    }
    if(flag2){
    	if(flag){
        	obj[0].focus();
                return false;
        }
        else{
            obj.focus();
            return false;
        }
    }
    return true;
}

/**
   * ����:�ַ����滻����
   * @param s
   * @return
   */
function strReplace(s,sourceStr,replaceStr) {
    if(s==null || s.length==0 || sourceStr==null || sourceStr.length==0 || replaceStr==null){
      	return s;
    }

    var index=0,startIndex=0;
    var length=sourceStr.length;
    var length1=replaceStr.length;
    while(!((index=s.indexOf(sourceStr,startIndex))<0)){
      startIndex=index-length+length1;
      s=s.substring(0,index)+replaceStr+s.substring(index+length);
    }
    return s;

  }


/**
   * ����:��SELECT ������ѡ�ѡ��
   * @param s
   * @return
   */
function selectAllOptions(obj) {
    if(typeof(obj)!='object'){//������ʹ��
        return false;
    }
    for(var i=0;i<obj.length;i++){
    	obj[i].selected=true;
    }
    return true;
  }

  /**
   * ����:��SELECT��ѡ�е�optionֵ����
   * @param s
   * @return string
   */
function getSelectedOption(obj) {
    for(var i=0;i<obj.length;i++){
    	if(obj[i].selected==true)
            return obj[i].value;
    }
    return "";
  }

    /**
   * ����:  ����Ƿ�Ϊ���ֻ�С��
   * @param s
   * @return  true/false
   */
function checkFloat(numstr) {
    var TempChar;
    for(i=0;i<=numstr.length-1;i++){
        TempChar=numstr.charAt(i);
        if(TempChar!=0 && TempChar!=1 && TempChar!=2 && TempChar!=3 && TempChar!=4 && TempChar!=5 && TempChar!=6 && TempChar!=7 && TempChar!=8 && TempChar!=9 && TempChar!='.'){
            i=-1;
            break;
        }
    }
    if(i==-1)	return false;
    else	return true;
  }


    /**
   * ����:  ����Ƿ�Ϊ��
   * @param s
   * @return  true/false
   */
  function checkNull(obj) {
    if(obj.value==null || obj.value==""){
       alert("������ֵ��");
       return false;
    }
    else
       return true;
  }

//select ѡ����������ʱ��ʾѡ������� 
  function selMouseOver(obj,divobj){
  	   	divobj.innerText = obj.options[obj.selectedIndex].text;
  		if (divobj.innerText.length > 0){
  			if(divobj.style.display != "block"){
  				divobj.innerHTML = " " + divobj.innerText + " ";
  				divobj.style.display = "block";
  			}
  			divobj.style.left = obj.getBoundingClientRect().left+getScroll().left+obj.offsetWidth+'px';
  			divobj.style.top = obj.getBoundingClientRect().top+getScroll().top+'px';
  		}
  } 
  function getScroll(){
  				var t, l, dde=document.documentElement, db=document.body;
  				if (dde && (dde.scrollTop || dde.scrollLeft)) {
  					t = dde.scrollTop;
  					l = dde.scrollLeft;
  				} else if (db) {
  					t = db.scrollTop;
  					l = db.scrollLeft;
  				}
  				return { top: t, left: l };
  }
/**
   * @param ������ 2009-07-28
   * ����:����������
   * sDate1, sDate2 ʱ��
   * number �������
   * @return true/flase
   */
function DateDiff(sDate1, sDate2, number){  //sDate1��sDate2��2002-12-18��ʽ
        var aDate, oDate1, oDate2, iDays;
        aDate = sDate1.split("-");
        oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //ת��Ϊ12-18-2002��ʽ
        aDate = sDate2.split("-");
        oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
        iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 /24);  //�����ĺ�����ת��Ϊ����
        if(iDays > number){
            return "��ѯʱ�����ܳ���"+number+"�죡";  
            }
        else return '';
}
//�������ڽ��жԱ� 
   function _compareTwoDateForString(_Date1, _Date2) {
     vDate1 = _Date1.split("-")
	 vDate2 = _Date2.split("-")
	 _Year1 = parseInt(vDate1[0]-0)
	 _Month1 = parseInt(vDate1[1]-0)
	 _Day1 = parseInt(vDate1[2]-0)

	 _Year2 = parseInt(vDate2[0]-0)
	 _Month2 = parseInt(vDate2[1]-0)
	 _Day2 = parseInt(vDate2[2]-0)

     if (_Year1 > _Year2) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 > _Month2)) {
	    return false
	 }

	 if ((_Year1 == _Year2) && (_Month1 == _Month2) && (_Day1 > _Day2)) {
	    return false
	 }

	 return true
}
//select ѡ�������ƿ�ʱ��ʧ 
function selMouseOut(obj,divobj) {
		divobj.style.display = "none"
} 

function $(id) {
	return document.getElementById(id);
}
//�ж���ʼʱ�䲻Ϊ��
function _isDateSpaceComplete(_Date1, _Date2) {
	if( (_Date1=='' && _Date2!='') || (_Date1!='' && _Date2=='') )
	   return false;
	else
	   return true;
} 
//������֤�� ---15λ��18λ 
function IdCardRegCheck(obj){
  var str = obj.value;
  var reg = /^([0-9]{15}|[0-9Xx]{18})$/;
  var flag = reg.test(str);
  if(!flag){
  	  alert("���֤����λ���������зǷ��ַ�!");
 			flag = false;
 			return flag; 
  }
  var idcard_array = new Array();
  idcard_array = str.split(""); 
 var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"}
  //��������
  if(area[parseInt(str.substr(0,2))]==null){
     alert("���֤�����Ƿ�!");
     flag = false;
     return flag; 
  } 
   
  //��ݺ���λ������ʽ����
  switch(str.length){
  		case 15:
			if ( (parseInt(str.substr(6,2))+1900) % 4 == 0 || ((parseInt(str.substr(6,2))+1900) % 100 == 0 && (parseInt(str.substr(6,2))+1900) % 4 == 0 )){
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}$/;//????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[0-9]{2}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}$/;//????????????????????
			}
			if(ereg.test(str)){ 
     			flag = true;
			}else{
				alert("���֤����������ڳ�����Χ���зǷ��ַ�!");
     			flag = false;
     			return flag; 
			}
			break;
		case 18:
			if ( parseInt(str.substr(6,4)) % 4 == 0 || (parseInt(str.substr(6,4)) % 100 == 0 && parseInt(str.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			}
			if(ereg.test(str)){//���Գ������ڵĺϷ���
				//����У��λ
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
				+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
				+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
				+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
				+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
				+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
				+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
				+ parseInt(idcard_array[7]) * 1 
				+ parseInt(idcard_array[8]) * 6
				+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				JYN = "10x98765432";
				M = JYM.substr(Y,1);//�ж�У��λ
				if(M == idcard_array[17] ){
					flag = true;
				}else {
				    M = JYN.substr(Y,1);//�ж�У��λ
				    if(M == idcard_array[17]){
				        flag = true;
				    }else{
						alert("���֤����У�����!");
		     			flag = false;
		     			return flag; 
	     			}
				}
				 
			}else {
				alert("���֤����������ڳ�����Χ���зǷ��ַ�!");
     			flag = false;
     			return flag; 
			}
			break;
	    default:
		   flag = true;
		   break;
  }
  return flag; 
}
//������֤�� ---18λ  
function IdCardCheck(str){ 
  var reg = /^([0-9Xx]{18})$/;
  var flag = reg.test(str);
  if(!flag){
  	   alert("���֤����λ���������зǷ��ַ�!");
 			flag = false;
 			return flag; 
  }
  var idcard_array = new Array();
  idcard_array = str.split(""); 
  var area={11:"����",12:"���",13:"�ӱ�",14:"ɽ��",15:"���ɹ�",21:"����",22:"����",23:"������",31:"�Ϻ�",32:"����",33:"�㽭",34:"����",35:"����",36:"����",37:"ɽ��",41:"����",42:"����",43:"����",44:"�㶫",45:"����",46:"����",50:"����",51:"�Ĵ�",52:"����",53:"����",54:"����",61:"����",62:"����",63:"�ຣ",64:"����",65:"�½�",71:"̨��",81:"���",82:"����",91:"����"}
  //��������
  if(area[parseInt(str.substr(0,2))]==null){
     alert("���֤�����Ƿ�!");
     flag = false;
     return flag; 
  } 
   
  //��ݺ���λ������ʽ����
  switch(str.length){ 
		case 18:
			if ( parseInt(str.substr(6,4)) % 4 == 0 || (parseInt(str.substr(6,4)) % 100 == 0 && parseInt(str.substr(6,4))%4 == 0 )){
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|[1-2][0-9]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			} else {
				ereg=/^[1-9][0-9]{5}[1-2][0-9]{3}((01|03|05|07|08|10|12)(0[1-9]|[1-2][0-9]|3[0-1])|(04|06|09|11)(0[1-9]|[1-2][0-9]|30)|02(0[1-9]|1[0-9]|2[0-8]))[0-9]{3}[0-9Xx]$/;//??????????????????????????????
			}
			if(ereg.test(str)){//���Գ������ڵĺϷ���
				//����У��λ
				S = (parseInt(idcard_array[0]) + parseInt(idcard_array[10])) * 7
				+ (parseInt(idcard_array[1]) + parseInt(idcard_array[11])) * 9
				+ (parseInt(idcard_array[2]) + parseInt(idcard_array[12])) * 10
				+ (parseInt(idcard_array[3]) + parseInt(idcard_array[13])) * 5
				+ (parseInt(idcard_array[4]) + parseInt(idcard_array[14])) * 8
				+ (parseInt(idcard_array[5]) + parseInt(idcard_array[15])) * 4
				+ (parseInt(idcard_array[6]) + parseInt(idcard_array[16])) * 2
				+ parseInt(idcard_array[7]) * 1 
				+ parseInt(idcard_array[8]) * 6
				+ parseInt(idcard_array[9]) * 3 ;
				Y = S % 11;
				M = "F";
				JYM = "10X98765432";
				JYN = "10x98765432";
				M = JYM.substr(Y,1);//�ж�У��λ
				if(M == idcard_array[17] ){
					flag = true;
				}else {
				    M = JYN.substr(Y,1);//�ж�У��λ
				    if(M == idcard_array[17]){
				        flag = true;
				    }else{
						alert("���֤����У�����!");
		     			flag = false;
		     			return flag; 
	     			}
				}
				 
			}else {
				alert("���֤����������ڳ�����Χ���зǷ��ַ�!");
     			flag = false;
     			return flag; 
			}
			break;
	    default:
		   flag = true;
		   break;
  }
  return flag; 
} 

function OutPutValue(name,value){
	
	var object=eval("document.forms[0]."+name);
	//alert("1"+object);
	object.value=value;
}

/**
 * click the table line to select the radio in this line
 * radioObj:the radio array obj in the table
 * selectvalue: the value will be selected radio
 */
function selectRadio(radioObj,selectvalue){
	var changed=true;
	if(radioObj!=null){
		//only one radio
       	if(radioObj.value==selectvalue && changed) {
       		radioObj.click();
        	//radioObj.checked=true;
       		changed=false;
       		return;
       	}
		//more than one radio
        for ( var i=0; i < radioObj.length; i++ ){
        	if(radioObj[i].value==selectvalue && changed) {
        		radioObj[i].click();
	        	//radioObj[i].checked=true;
        		changed=false;
        		return;
        	}
        }
    }
	
	
}
//ip��ַ
function testRegx(obj)
{		
	 var regex ='^(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|[1-9])\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)\\.(1\\d{2}|2[0-4]\\d|25[0-5]|[1-9]\\d|\\d)$'; 

	var regx=new RegExp(regex);
	var isMatch=regx.test(obj.value);	
	if(isMatch)
	{ 
		showValidateMsg($$('ipaddr',0),'1','');			
	}else
	{
		//document.getElementById('ipError').style.display='';	
		//obj.focus();
		showValidateMsg($$('ipaddr',0),'2','���׷�ʽΪ����֧��ʱ��������д��ȷIP��ַ');
	}
}
function CheckStcrLeng(obj,maxlength){
	 var inputNum = obj.value.replace(/[^\x00-\xff]/g, "**").length; 
	    if (inputNum>maxlength) {
	       return false;
	    }
	    return true;
}

var Wi = [ 7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2, 1 ];    // ��Ȩ����  
var ValideCode = [ 1, 0, 10, 9, 8, 7, 6, 5, 4, 3, 2 ];            // ���֤��֤λֵ.10����X   
function IdCardValidate(idCard) {  //alert( idCard); 
 idCard = trim(idCard.replace(/ /g, ""));               //ȥ���ַ���ͷβ�ո�    
 var flag=true;                    
if (idCard.length == 15) {          
   if(!isValidityBrithBy15IdCard(idCard))
   {   flag= false;
   };       //����15λ���֤����֤      
  } else if (idCard.length == 18) {          
   var a_idCard = idCard.split("");                // �õ����֤����       
      if(isValidityBrithBy18IdCard(idCard)&&isTrueValidateCodeBy18IdCard(a_idCard)){   //����18λ���֤�Ļ�����֤�͵�18λ����֤            
     flag=true;           }
      else {              
       flag= false;           }      
       } else {          
        flag=false;       }  
   if(!flag){   
     alert("���֤��ʽ����");
     return flag;
   }
   return flag;
 }   /**   * �ж����֤����Ϊ18λʱ������֤λ�Ƿ���ȷ   * @param a_idCard ���֤��������   * @return   */  
function isTrueValidateCodeBy18IdCard(a_idCard) {       var sum = 0;                             // ������Ȩ��ͱ���     
 if (a_idCard[17].toLowerCase() == 'x') {           a_idCard[17] = 10;                    // �����λΪx����֤���滻Ϊ10�����������    
    }       
    for ( var i = 0; i < 17; i++) {          
     sum += Wi[i] * a_idCard[i];            // ��Ȩ���      
     }      
      valCodePosition = sum % 11;                // �õ���֤����λ��    
   if (a_idCard[17] == ValideCode[valCodePosition]) {           
             return true;       
    } else {           return false;       }   }   /**    * ��֤18λ�����֤�����е������Ƿ�����Ч����    * @param idCard 18λ�����֤�ַ���    * @return    */  
    function isValidityBrithBy18IdCard(idCard18){      
     var year =  idCard18.substring(6,10);      
     var month = idCard18.substring(10,12);     
      var day = idCard18.substring(12,14);      
       var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));       // ������getFullYear()��ȡ��ݣ�����ǧ�������     
         if(temp_date.getFullYear()!=parseFloat(year)             ||temp_date.getMonth()!=parseFloat(month)-1             ||temp_date.getDate()!=parseFloat(day)){               
         return false;       }
         else{           return true;       }   }     /**     * ��֤15λ�����֤�����е������Ƿ�����Ч����     * @param idCard15 15λ�����֤�ַ���     * @return     */    
  function isValidityBrithBy15IdCard(idCard15){         
         var year =  idCard15.substring(6,8);        
          var month = idCard15.substring(8,10);        
           var day = idCard15.substring(10,12);        
            var temp_date = new Date(year,parseFloat(month)-1,parseFloat(day));         // ���������֤�е����������迼��ǧ��������ʹ��getYear()����         
            if(temp_date.getYear()!=parseFloat(year)                 ||temp_date.getMonth()!=parseFloat(month)-1                 ||temp_date.getDate()!=parseFloat(day)){                   return false;           }
            else{               return true;           }     }   //ȥ���ַ���ͷβ�ո� 
function trim(str) {       return str.replace(/(^\s*)|(\s*$)/g, "");   }  
function maleOrFemalByIdCard(idCard){      
 idCard = trim(idCard.replace(/ /g, ""));        // �����֤���������������ַ����пո�       
 if(idCard.length==15){           
 if(idCard.substring(14,15)%2==0){               
 return 'female';           }else{               return 'male';           }       }
 else if(idCard.length ==18){           if(idCard.substring(14,17)%2==0){               return 'female';           }
 else{               return 'male';           }       }else{           return null;       } 
   }  
