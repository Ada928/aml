/**                                             
 * Create by makecode program v2.0              
 * ����             ���� 		����        
 * 2007-12-05   ����		����        
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
 
import java.util.Date;       
      
                                              
public class T07_pbcrule implements Serializable {
                                              
/**
	 * 
	 */
	private static final long serialVersionUID = -587388969240418085L;
/** ��������:1:���2:����3:���ϱ� */
private String pbc_type_cd = "";
private String pbc_cd = "";
/** ������� */
private String pbckey = "";
/** �Ƿ�����:1:��0:�� */
private String flag = "";
/** ������� */
private String pbc_des = "";
/** �ӿ����� */
private String interfacekey = "";
/** ������ */
private String create_usr = "";
/** �������� */
private Date create_dt = new Date();
/** �������� */
private String pbc_con = "";
//=======================================================
/** �������� */
private String create_dt_disp = "";

/** ���������޸� */
private String stcrkey="";
private int intpage=0;
                                              



	/**                   
     * ���캯��           
     */                   
    public T07_pbcrule() {    
    } 
    
public void setPbc_type_cd(String pbc_type_cdStr){
this.pbc_type_cd = pbc_type_cdStr;
}
public String getPbc_type_cd(){
return this.pbc_type_cd;
}

public void setPbckey(String pbckeyStr){
this.pbckey = pbckeyStr;
}
public String getPbckey(){
return this.pbckey;
}

public void setFlag(String flagStr){
this.flag = flagStr;
}
public String getFlag(){
return this.flag;
}

public void setPbc_des(String pbc_desStr){
this.pbc_des = pbc_desStr;
}
public String getPbc_des(){
return this.pbc_des;
}

public void setInterfacekey(String interfacekeyStr){
this.interfacekey = interfacekeyStr;
}
public String getInterfacekey(){
return this.interfacekey;
}

public void setCreate_usr(String create_usrStr){
this.create_usr = create_usrStr;
}
public String getCreate_usr(){
return this.create_usr;
}

public void setCreate_dt(Date create_dtStr){
this.create_dt = create_dtStr;
}
public Date getCreate_dt(){
return this.create_dt;
}

public void setPbc_con(String pbc_conStr){
this.pbc_con = pbc_conStr;
}
public String getPbc_con(){
return this.pbc_con;
}

//=======================================================
public void setCreate_dt_disp(String create_dt_dispStr){
this.create_dt_disp = create_dt_dispStr;
}
public String getCreate_dt_disp(){
return this.create_dt_disp;
}
public String getPbc_cd() {
	return pbc_cd;
}
public void setPbc_cd(String pbc_cd) {
	this.pbc_cd = pbc_cd;
}



public String getStcrkey() {
	return stcrkey;
}
public void setStcrkey(String stcrkey) {
	this.stcrkey = stcrkey;
}

public int getIntpage() {
	return intpage;
}

public void setIntpage(int intpage) {
	this.intpage = intpage;
}

}

