/**
 * Copyright 2003 (C) PANLAB ��All Rights Reserved.
 * ����         ���� 			����
 * 2003-10-20   ����                     ����
 */
package com.ist.aml.lip.dto;

/**
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2002
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author
 * @version 2.0
 */


/**
 * 
 * <p>
 * Title:
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author
 * @version 1.0
 */

public class BaseDTO implements java.io.Serializable {
    
    /**
	 * 
	 */
	private static final long serialVersionUID = 9203574624192243200L;
	/** ������־��1����������0���������������� */
    public String newsearchflag = "";
    /** ҵ�������룺����ҵ�����չ�ֶ�̬�˵�ʱ��ҵ���� */
    public String busstypecd = ""; 
    public String shortstring = "";
    
    /** ��ǰ��ҳ�� **/
    public int intPage = 1;
    
    public int totalRow = 0;
        
    /**
     * ˵�������캯��
     */
    public BaseDTO() {
    }

    /**
     * @return the intPage
     */
    public int getIntPage() {
        return intPage;
    }

    /**
     * @param intPage the intPage to set
     */
    public void setIntPage(int intPage) {
        if(intPage==0) intPage = 1;
        this.intPage = intPage;
    }

    /**
     * @return the newsearchflag
     */
    public String getNewsearchflag() {
        return newsearchflag;
    }
    
    /**
     * @param newsearchflag the newsearchflag to set
     */
    public void setNewsearchflag(String newsearchflag) {
        this.newsearchflag = newsearchflag;
    }

    /**
     * @return the totalRow
     */
    public int getTotalRow() {
        return totalRow;
    }

    /**
     * @param totalRow the totalRow to set
     */
    public void setTotalRow(int totalRow) {
        this.totalRow = totalRow;
    }

    /**
     * @return the busstypecd
     */
    public String getBusstypecd() {
        return busstypecd;
    }

    /**
     * @param busstypecd the busstypecd to set
     */
    public void setBusstypecd(String busstypecd) {
        this.busstypecd = busstypecd;
    }

	public String getShortstring() {
		return shortstring;
	}

	public void setShortstring(String shortstring) {
		this.shortstring = shortstring;
	}
    
    
    
}
