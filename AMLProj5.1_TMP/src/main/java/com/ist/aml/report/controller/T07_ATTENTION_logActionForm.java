/* =============================================
* $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
* Created [2014-01-21] by makecode program v2.2
* =============================================
* awp (Audit Working Platform)
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.* =============================================
*/

package com.ist.aml.report.controller;                
                                                  
/**
* <p>T07_ATTENTION_logActionForm.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import javax.servlet.http.*; 
import org.apache.struts.action.*; 
import java.io.Serializable; 
import java.math.BigDecimal; 
import java.util.ArrayList;  
import java.util.Date;       
import java.util.Iterator;   
import java.util.List;       
                                              
public class T07_ATTENTION_logActionForm extends ActionForm {
                                              
/** ������ */
private String op_person = "";
/** ��עID�������� */
private String atten_id = "";
/** ����ʱ�� */
private String op_time = "";
/** ����ԭ�� */
private String op_reason = "";
/** �������� 1 ���  2�޸�  3 ɾ��  4�ύ  5���ͨ�� 6��˲�ͨ�� 7����˻�  8����ͨ�� 9������ͨ�� 10 �����˻� 11���� 12�ų� */
private String op_name = "";

//=======================================================
    /**                   
     * ���캯��           
     */                   
    public T07_ATTENTION_logActionForm() {    
    }                     
public void setOp_person(String op_personStr){
this.op_person = op_personStr;
}
public String getOp_person(){
return this.op_person;
}

public void setAtten_id(String atten_idStr){
this.atten_id = atten_idStr;
}
public String getAtten_id(){
return this.atten_id;
}

public void setOp_time(String op_timeStr){
this.op_time = op_timeStr;
}
public String getOp_time(){
return this.op_time;
}

public void setOp_reason(String op_reasonStr){
this.op_reason = op_reasonStr;
}
public String getOp_reason(){
return this.op_reason;
}

public void setOp_name(String op_nameStr){
this.op_name = op_nameStr;
}
public String getOp_name(){
return this.op_name;
}

//=======================================================
//=======================================================
    public ActionErrors validate(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {       
        /**@todo: finish this method, this is just the skeleton.*/                                           
        return null;                                                                                         
    }                                                                                                        
                                                                                                             
    public void reset(ActionMapping actionMapping, HttpServletRequest httpServletRequest) {                  
    }                                                                                                        
}

