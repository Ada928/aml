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
     
                                              
public class T07_node implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -7632161569682931199L;
/** ��λid */
private String post_id = "";
/** ҳ������
���ڵ��ʼ����ҳ�� */
private String title = "";
/** �����ڵ� */
private String next_node_id = "";
/** �ڵ�������������
0:���� 1:֧�� */
private String node_org = "";
/** �ڵ�˳��� */
private Long node_seq = null;
/** �Ƿ�������ɵĹ��� */
private String task_ind = "";
/** ǰ�ݽڵ� */
private String pre_node_id = "";
/** �Ƿ�����Ϣ��ѯ */
private String info_ind = "";
/** �ڵ����� */
private String node_des = "";
/** �ڵ�id
N+���̴���+��� */
private String node_id = "";
/** �ڵ�id */
private String flow_id = "";
/** �Ƿ���Ч
0:ʧЧ��1����Ч */
private String is_use = "";
//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_node() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setTitle(String titleStr){
this.title = titleStr;
}
public String getTitle(){
return this.title;
}

public void setNext_node_id(String next_node_idStr){
this.next_node_id = next_node_idStr;
}
public String getNext_node_id(){
return this.next_node_id;
}

public void setNode_org(String node_orgStr){
this.node_org = node_orgStr;
}
public String getNode_org(){
return this.node_org;
}

public void setNode_seq(Long node_seqStr){
this.node_seq = node_seqStr;
}
public Long getNode_seq(){
return this.node_seq;
}

public void setTask_ind(String task_indStr){
this.task_ind = task_indStr;
}
public String getTask_ind(){
return this.task_ind;
}

public void setPre_node_id(String pre_node_idStr){
this.pre_node_id = pre_node_idStr;
}
public String getPre_node_id(){
return this.pre_node_id;
}

public void setInfo_ind(String info_indStr){
this.info_ind = info_indStr;
}
public String getInfo_ind(){
return this.info_ind;
}

public void setNode_des(String node_desStr){
this.node_des = node_desStr;
}
public String getNode_des(){
return this.node_des;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setFlow_id(String flow_idStr){
this.flow_id = flow_idStr;
}
public String getFlow_id(){
return this.flow_id;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}

//=======================================================
}

