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

package com.ist.aml.report.dto;                
                                                  
/**
* <p>T07_ATTENTION_log.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_ATTENTION_log extends BaseDTO {
                                              
/** ������ */
private String op_person = "";
/** ��עID�������� */
private String atten_id = "";
/** ����ʱ�� */
private String op_time = "";
/** ����ԭ�� */
private String op_reason = "";
/** �������� 1 ���  2�޸�  3 ɾ��  4�ύ  5���ͨ�� 6��˲�ͨ�� 7����˻�  8����ͨ�� 9������ͨ�� 10 �����˻� 11���� 12�ų� */
private String op_type = "";
private String op_name = "";


//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_ATTENTION_log() {    
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
public String getOp_type() {
	return op_type;
}
public void setOp_type(String opType) {
	op_type = opType;
}
public String getOp_name() {
	return op_name;
}
public void setOp_name(String opName) {
	op_name = opName;
}



//=======================================================
}

