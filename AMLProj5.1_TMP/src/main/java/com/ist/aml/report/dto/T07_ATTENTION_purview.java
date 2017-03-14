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
* <p>T07_ATTENTION_purview.java</p>
* <p>Description: </p>
* @author $Author: hubaiqing $
* @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
*/

import com.ist.common.base.BaseDTO; 
                                              
public class T07_ATTENTION_purview extends BaseDTO {
  
	/** ��ע���� */
	private String   atten_type  ="";
	/** ���Ȩ�޵ĸ�λ */
	private String   add_post    ="";
	/** �����������ڰ����м�����ڹ�ע���״̬ */
	private String   add_result  ="";
	/** ��Ӻ�ʧЧ���ڵ����� */
	private Integer   add_day  =new Integer(0);
	/** �������ͣ�1�ĸ���λ���ĸ���λ����      2ĳЩ��λ������   3�������� */	
	private String   extend_type ="";
	/** ����Ȩ�޵ĸ�λ */
	private String   extend_post ="";
	/** �������� */
	private Integer extend_day = new Integer(0);
	/** ���ڴ��� */
	private Integer extend_num  =new Integer(0);
	
	/** �ų����ͣ�1�ĸ���λ���ĸ���λ�ų�      2ĳЩ��λ���ų�   3�����ų� */
	private String   remove_type ="";
	/** �ų�Ȩ�޵ĸ�λ */
	private String   remove_post ="";
	/** ���ñ�־1 ���� 0 ���� */
	private String   flag        ="";




//=======================================================
                                              
    /**                   
     * ���캯��           
     */                   
    public T07_ATTENTION_purview() {    
    }




	public String getAtten_type() {
		return atten_type;
	}




	public void setAtten_type(String attenType) {
		atten_type = attenType;
	}




	public String getAdd_post() {
		return add_post;
	}




	public void setAdd_post(String addPost) {
		add_post = addPost;
	}




	public String getAdd_result() {
		return add_result;
	}




	public void setAdd_result(String addResult) {
		add_result = addResult;
	}




	public String getExtend_type() {
		return extend_type;
	}




	public void setExtend_type(String extendType) {
		extend_type = extendType;
	}




	public String getExtend_post() {
		return extend_post;
	}




	public void setExtend_post(String extendPost) {
		extend_post = extendPost;
	}




	public Integer getExtend_day() {
		return extend_day;
	}




	public void setExtend_day(Integer extendDay) {
		extend_day = extendDay;
	}




	public Integer getExtend_num() {
		return extend_num;
	}




	public void setExtend_num(Integer extendNum) {
		extend_num = extendNum;
	}




	public String getRemove_type() {
		return remove_type;
	}




	public void setRemove_type(String removeType) {
		remove_type = removeType;
	}




	public String getRemove_post() {
		return remove_post;
	}




	public void setRemove_post(String removePost) {
		remove_post = removePost;
	}




	public String getFlag() {
		return flag;
	}




	public void setFlag(String flag) {
		this.flag = flag;
	}




	public Integer getAdd_day() {
		return add_day;
	}




	public void setAdd_day(Integer addDay) {
		add_day = addDay;
	}    
    
    
}

