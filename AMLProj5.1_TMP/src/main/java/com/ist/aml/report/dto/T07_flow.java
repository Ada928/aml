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
      
                                              
public class T07_flow implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -9094335675460657543L;
/** �������� */
private String flow_des = "";
/** �ڵ�id */
private Long flow_id =null;
/** �Ƿ���Ч
0:ʧЧ��1����Ч */
private String is_use = "";
//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_flow() {    
    }                     
public void setFlow_des(String flow_desStr){
this.flow_des = flow_desStr;
}
public String getFlow_des(){
return this.flow_des;
}

public void setFlow_id(Long flow_idStr){
this.flow_id = flow_idStr;
}
public Long getFlow_id(){
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

