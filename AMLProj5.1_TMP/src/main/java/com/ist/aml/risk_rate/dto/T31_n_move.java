/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2006-12-27   ����		����        
 */                                             
                                                  
package com.ist.aml.risk_rate.dto;                
                                                  
/**                                               
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>          
 * <p>Description: </p>                           
 * <p>Copyright: Copyright (c) 2003 - 2006</p>    
 * <p>Company: �����������ڿƼ��������޹�˾</p>      
 * @author �з���                                 
 * @version 1.0                                   
 */                                               
                                                  
import java.io.Serializable; 
      
                                              
public class T31_n_move implements Serializable {
                                              

/**
	 * 
	 */
	private static final long serialVersionUID = 6668544438988123102L;
/** ����id
B+�ڵ�+��� */
private String oper_id = "";
/** ��ť��Ӧ���� */
private String oper_url = "";


/** �ڵ�id
N+���̴���+��� */
private String node_id = "";
/** ˳�� */
private Long oper_seq = null;
/** ��ť��ʾ���� */
private String oper_desc = "";


private String post_id="";
//=======================================================
                                              
  
	/**                   
     * ���캯��           
     */                   
    public T31_n_move() {    
    }  
    
    public String getPost_id() {
    	return post_id;
    }
    public void setPost_id(String postId) {
    	post_id = postId;
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




//=======================================================
}

