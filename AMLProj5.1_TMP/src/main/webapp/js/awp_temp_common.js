
 var	page_size=15;//ÿҳ��ʾ����
 var	total_num=null;//�ܼ�¼�� 
 var	total_page=null;//��ҳ��
 var	page_num=1;//ҳ��,Ĭ����ʾ��һҳ���� 
function accDiv(arg1,arg2){ 
	  var t1=0,t2=0,r1,r2; 
	   try{
	   		t1=arg1.toString().split(".")[1].length
	   }catch(e){}
	   try{
	   		t2=arg2.toString().split(".")[1].length
	   	}catch(e){
	   	} 
	    with(Math){ 
	     	r1=Number(arg1.toString().replace(".","")); 
	     	r2=Number(arg2.toString().replace(".","")); 
	      	return (r1/r2)*pow(10,t2-t1); 
	     	}  
	   } 

//���ָ��ҳ��ʼ������
function	getStartAndEndIndex(intpage,page_size,total_page,total_num){
	var	start_index=(intpage-1)*page_size;//��ʾҳ��ʼ�� 
		var	end_index=null;
		if(intpage==1){//��һҳ����
			if(total_page==1){//ֻ��һҳ���� 
				if((total_num%page_size)!=0)
				{
					end_index=start_index+(total_num%page_size)-1;
				}else{
					end_index=start_index+page_size-1;
				}
			}else{//��ֹһҳ���� 
				end_index=start_index+page_size-1;
			}
		}
		if(1<intpage&&intpage<total_page){//�м�ҳ����
			end_index=start_index+page_size-1;//��ҳ���� 
		}else if(intpage==total_page){//���һҳ����1.���һҳ���ݲ���page_size,2.���һҳ���ݸպ���page_size
			if((total_num%page_size)!=0){
				end_index=start_index+(total_num%page_size)-1;
			}else{
				end_index=start_index+page_size-1;
			}
		}
	return  start_index+"-"+end_index;
}
//objΪ���϶���
function	init_page_param(obj){
 	var	total_num=obj.length;
 	var	total_page=null;
 	var	temp_page=accDiv(total_num,page_size);
 	var	point_index=temp_page.toString().indexOf(".");
 	if(point_index<0){//�պ����� 
 		total_page=temp_page;	
 	}else{//��ҳ������temp_page�������ּ�1
 		total_page=Number(temp_page.toString().split(".")[0])+1;
 	}
 	return	total_num+"-"+total_page;
 }
