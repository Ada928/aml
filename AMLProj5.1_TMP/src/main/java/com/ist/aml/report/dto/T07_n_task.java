/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2006-12-27   ����		����        
 */                                             
                                                  
package com.ist.aml.report.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 
      
                                              
public class T07_n_task implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 2384320785238485742L;
/** �������
1������ɹ�������2����Ϣ���� */
private String href_type_cd = "";
/** �Ƿ񵯳�����
1:����0:������ */
private String open_ind = "";
/** ��������
T+�ڵ����+���  */
private String task_id = "";
/** �������� */
private String href_des = "";
/** �ڵ�id
N+���̴���+��� */
private String node_id = "";
/** �Ƿ���Ч0:ʧЧ��1����Ч */
private String is_use = "";
/** Href_seq */
private Long href_seq =null;
/** ����URL */
private String href_url = "";
//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_n_task() {    
    }                     
public void setHref_type_cd(String href_type_cdStr){
this.href_type_cd = href_type_cdStr;
}
public String getHref_type_cd(){
return this.href_type_cd;
}

public void setOpen_ind(String open_indStr){
this.open_ind = open_indStr;
}
public String getOpen_ind(){
return this.open_ind;
}

public void setTask_id(String task_idStr){
this.task_id = task_idStr;
}
public String getTask_id(){
return this.task_id;
}

public void setHref_des(String href_desStr){
this.href_des = href_desStr;
}
public String getHref_des(){
return this.href_des;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

public void setHref_seq(Long href_seqStr){
this.href_seq = href_seqStr;
}
public Long getHref_seq(){
return this.href_seq;
}

public void setHref_url(String href_urlStr){
this.href_url = href_urlStr;
}
public String getHref_url(){
return this.href_url;
}

//=======================================================
}

