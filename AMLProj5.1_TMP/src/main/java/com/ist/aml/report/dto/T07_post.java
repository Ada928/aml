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
     
                                              
public class T07_post implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -914258161702044482L;
/** ��λ���� */
private String post_id = "";
/** ��λ���� */
private String post_des = "";
/** �ڵ�id */
private String flow_id = "";
/** �Ƿ���Ч
0:ʧЧ��1����Ч */
private String is_use = "";
/** ���� 
1:����, 2:���*/
private String curr_cd = "";
//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_post() {    
    }                     
public void setPost_id(String post_idStr){
this.post_id = post_idStr;
}
public String getPost_id(){
return this.post_id;
}

public void setPost_des(String post_desStr){
this.post_des = post_desStr;
}
public String getPost_des(){
return this.post_des;
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
public String getCurr_cd() {
	return curr_cd;
}
public void setCurr_cd(String curr_cd) {
	this.curr_cd = curr_cd;
}

//=======================================================
}

