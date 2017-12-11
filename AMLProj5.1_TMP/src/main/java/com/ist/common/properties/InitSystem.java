/**
 * Copyright 2003 (C) PANLAB ��All Rights Reserved.
 * ����         ���� 			����
 * 2003-10-20   ����                     ����
 */
package com.ist.common.properties;

import java.io.File;
import java.net.URL;
import java.net.URLDecoder;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;



/**
 * <p>Title: ������:ϵͳ������ʼ����������</p>
 * <p>Description: ����ϵͳ�����ļ���Ŀ¼,ͨ����Ŀ¼���Բ鿴ȫ��ϵͳ�����ļ�</p>
 * <p>Copyright: Copyright (c) 2003</p>
 * <p>Company: </p>
 * @author unascribed
 * @version 1.0
 */

public class InitSystem extends HttpServlet {
    
    /** ϵͳ�����ļ���Ŀ¼ */
    private static String SysHomeDir = "";
    
    public String getSysHomeDirFromProperties() {
    	
    	try{
    		String   strClasspath=this.getClass().getClassLoader().getResource("/").getPath();
			System.out.println("strClasspath11::::"+strClasspath);
			strClasspath = this.getClass().getResource("").getPath();
    		System.out.println("strClasspath::::"+strClasspath) ;
    		//System.out.println("path::::"+classpath);
    		//getServletContext().getResourceAsStream("/WEB-INF/config/db.config");
    		
    		String SysHomeDir = URLDecoder.decode(strClasspath,"UTF-8");  //new String((strClasspath).getBytes("ISO-8859-1"),"GBK");
	    	SysHomeDir=SysHomeDir.substring(0,SysHomeDir.indexOf("/classes"));
	    	System.out.println("SysHomeDir::::"+SysHomeDir);
	    	
	    	// URL classUrl=Thread.currentThread().getContextClassLoader().getResource("");
	    	//	 classpath=classUrl.toString();
//	    		
//	    		System.out.println("classpath::::"+classpath);
//	    		for(int i=0;i<2;i++){
//	    			if(classpath.lastIndexOf("/")!=-1){
//	    				classpath=classpath.substring(0,classpath.lastIndexOf("/"));
//	    			}
//	    		}
//	    		SysHomeDir=classpath.substring(classpath.indexOf("/")+1);
    	
    		return SysHomeDir;	    	
    	}
    	catch(Exception ex){
    		ex.printStackTrace();
    	}
    	return "";
    	
    }
    
    /**
     * ȡ��ϵͳ�����ļ���Ŀ¼
     * @return ϵͳעĿ¼
     */
    public  String getSysHomeDir1(){
        if(SysHomeDir.equals("")){
            SysHomeDir = null;
        }
        if(SysHomeDir==null){
            //InitSystem init = new InitSystem();
            //SysHomeDir = init.getSysHomeDirFromProperties();
    		URL classUrl=Thread.currentThread().getContextClassLoader().getResource("");
    		String classpath=classUrl.toString();
    		for(int i=0;i<2;i++){
    			if(classpath.lastIndexOf("/")!=-1){
    				classpath=classpath.substring(0,classpath.lastIndexOf("/"));
    			}
    		}
    		SysHomeDir=classpath.substring(classpath.indexOf("/")+1);
             
        }
        return SysHomeDir;
    }


    /**
     * ��ʼ��
     * @throws ServletException
     */
    public void init() throws ServletException {
        ServletConfig conf = this.getServletConfig();
        SysHomeDir = conf.getInitParameter("SysHomeDir");
        if (SysHomeDir != null && !SysHomeDir.equals("")) {
            SysHomeDir = SysHomeDir.trim();
            while (SysHomeDir.endsWith("/") || SysHomeDir.endsWith("\\")) {
                SysHomeDir = SysHomeDir.substring(0, SysHomeDir.length()-1);
            }
        }
    }

    /**
     * ȡ��ϵͳ�����ļ���Ŀ¼
     * @return ϵͳעĿ¼
     */
    public static String getSysHomeDir(){
        if(SysHomeDir.equals("")){
            SysHomeDir = null;
        }
        if(SysHomeDir==null){
            InitSystem init = new InitSystem();
            SysHomeDir = init.getSysHomeDirFromProperties();
           
        }
        return SysHomeDir;
    }

   
}