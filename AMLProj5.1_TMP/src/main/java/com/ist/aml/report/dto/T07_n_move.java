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
     
                                              
public class T07_n_move implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = 8481493126989773945L;
/** ��������
1���ϱ�2���˻�
3���ų� */
private String oper_type = "";
/** ����id
B+�ڵ�+��� */
private String oper_id = "";
/** ��ť��Ӧ���� */
private String oper_url = "";
/** �������
1��������ת2����;����3�����ս��� */
private String oper_category = "";
/** �ڵ�id
N+���̴���+��� */
private String node_id = "";
/** ˳�� */
private Long oper_seq = null;
/** ��ť��ʾ���� */
private String oper_desc = "";
/** �Ƿ���Ч
0:ʧЧ��1:��Ч */
private String is_use = "";

/** ͼƬ·�� */
private String image_path = "";
//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_n_move() {    
    }                     
public void setOper_type(String oper_typeStr){
this.oper_type = oper_typeStr;
}
public String getOper_type(){
return this.oper_type;
}

public void setOper_id(String oper_idStr){
this.oper_id = oper_idStr;
}
public String getOper_id(){
return this.oper_id;
}

public void setOper_url(String oper_urlStr){
this.oper_url = oper_urlStr;
}
public String getOper_url(){
return this.oper_url;
}

public void setOper_category(String oper_categoryStr){
this.oper_category = oper_categoryStr;
}
public String getOper_category(){
return this.oper_category;
}

public void setNode_id(String node_idStr){
this.node_id = node_idStr;
}
public String getNode_id(){
return this.node_id;
}

public void setOper_seq(Long oper_seqStr){
this.oper_seq = oper_seqStr;
}
public Long getOper_seq(){
return this.oper_seq;
}

public void setOper_desc(String oper_descStr){
this.oper_desc = oper_descStr;
}
public String getOper_desc(){
return this.oper_desc;
}

public void setIs_use(String is_useStr){
this.is_use = is_useStr;
}
public String getIs_use(){
return this.is_use;
}
public String getImage_path() {
	return image_path;
}
public void setImage_path(String image_path) {
	this.image_path = image_path;
}

//=======================================================
}

