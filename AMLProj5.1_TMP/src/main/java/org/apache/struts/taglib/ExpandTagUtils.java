/* =============================================
* $Id$
* Created [2010-5-17 ����10:32:14] by admin
* =============================================
* AWP_CEB
* Description:
* =============================================
* Copyright (c) 2005-2008 by INFO SCIENCE&TECH
* All rights reserved.
* =============================================
*/
package org.apache.struts.taglib;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.jsp.PageContext;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.util.LabelValueBean;
import org.apache.struts.util.MessageResources;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.ist.common.base.MapKeyCmp;
import com.ist.common.base.MapValueCmp;
import com.ist.common.jcs.CatchManager;
import com.ist.common.util.DateUtils;



/**
 * <p>ExpandTagUtils.java</p>
 * <p>�������</p>
 * @author $Author$
 * @version $Revision$ $Date$
 */
public class ExpandTagUtils {
    /**
     * The Singleton instance.
     * @since 1.3.5 Changed to non-final so it may be overridden, use at your own risk (you've been warned!!)
     */
    private static ExpandTagUtils instance = new ExpandTagUtils();
        

    /**
     * Commons logging instance.
     */
    private static final Log log = LogFactory.getLog(ExpandTagUtils.class);
            
    
    /**
     * ����session�ķָ�����
     */
    public static final String opitons_split="_";
    
    
    private static final String year_split="3,5";
    
    /**
     * Ĭ�Ͻ�ȡ�ֶε��ַ����ȡ�
     */
    public static final String intercept_length = "50";

    /**
     * Constructor for TagUtils.
     */
    protected ExpandTagUtils() {
        super();
    }

    /**
     * Returns the Singleton instance of TagUtils.
     */
    public static ExpandTagUtils getInstance() {
        return instance;
    }

    /**
     * Set the instance.
     * This blatently violates the Singleton pattern, but then some say Singletons are an anti-pattern.
     * @since 1.3.5 Changed to non-final and added setInstance() so TagUtils may be overridden, use at your own risk (you've been warned!!)
     * @param instance The instance to set.
     */
    public static void setInstance(ExpandTagUtils instance){
        ExpandTagUtils.instance = instance;
    }
    
    
    /**
     * ȡ��CatchManager����
     * @params  pageContext ҳ�������ġ�    
     * @return   CatchManager ����
     * 
     */
    public CatchManager getCatchManagerInstance(PageContext pageContext){
        WebApplicationContext wac = WebApplicationContextUtils.getRequiredWebApplicationContext(pageContext.getServletContext());
        CatchManager cm =wac.getBean("catchManager")!=null?(CatchManager)wac.getBean("catchManager"):null;      
        return cm;
    }
    
    
    
    /**
     * ���ݱ�ǩ�����dictcode����������ת�롣
     * @param   CatchManager cm   jcs�������
     * @param   String key ��Ҫת���ֵ��
     * @param   String dictcode ���ֵ��
     * @return  String ת����ֵ��        
     */
    public String getDictDesc(CatchManager cm, String key, String dictcode){
        String dictdesc = key; 
        try {
            if (cm==null){
                return dictdesc;
            }            
            LinkedHashMap map = new LinkedHashMap();
            map = cm.getMapFromCache(dictcode);
            dictdesc = (map.get(key)==null?key:(String)map.get(key));                               
        }catch(Exception e){
           log.warn("Unable to retieve ActionMessage for paramName : cmת�����.", e);
        }
        return dictdesc;     
    }    
    
    
    /**
     * ���ݱ�ǩ�����dictcode����������ת�롣
     * @param   CatchManager cm   jcs�������
     * @param   String key ��Ҫת���ֵ��
     * @param   String dictcode ���ֵ��
     * @return  String ת����ֵ��        
     */
    public String getDictDesc(CatchManager cm, String key, String dictcode, String tag){
        String dictdesc = key; 
        try {
            if (cm==null){
                return dictdesc;
            }            
            LinkedHashMap map = new LinkedHashMap();
            if (StringUtils.indexOf(dictcode, "T")==0){
                map = cm.getMapFromCache(dictcode);
                dictdesc = (map.get(key)==null?key:(String)map.get(key));                   
            }else{
                dictdesc = key;
                log.warn("Unable to retieve ActionMessage for paramName : ��ǩֻ֧�ֶ�T00_DICT������ת��", null);                
            }
            
        }catch(Exception e){
           log.warn("Unable to retieve ActionMessage for paramName : cmת�����.", e);
        }
        return dictdesc;     
    }       
    
    
    /**
     * ��Map��ֵת������ֱ����ҳ����ʾ��options����
     * 
     * @param map
     *            Map ���������Ҫ����
     * @param notinMap
     *            Map �������򲻰�����
     * @param havaAll
     *            boolean true��������--��ѡ��--�� false��ֻ����map����
     * @return ArrayList
     */
    public ArrayList getOptionsListByMap(CatchManager cm, String dictcode, boolean haveAll) {
        
        //ȡ��dictcode��Ӧ��map
        LinkedHashMap map = new LinkedHashMap();
        map = cm.getMapFromCache(dictcode);        
                
        ArrayList list = new ArrayList();
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }        
        // ��ü�ֵ���ֵ
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {          
            Object key = iter.next();
            Object value = map.get(key);
            list.add(new LabelValueBean((String) key, (String) value));
        }        
        return list;
    }
    
    
    
    
    /**
     * ����bean��write����Ľ�ȡ�ֶ�
     * @param value
     * @param intcplength
     * @return
     */    
    public String getInterceptValue(String value, String intcplength){
        String intcpstr = value;
        if ((intcplength==null)||("".equals(intcplength))){
            intcplength = this.intercept_length;
        }
        
        if (intcpstr.length()>=org.apache.commons.lang.math.NumberUtils.toInt(intcplength)){
            intcpstr=org.apache.commons.lang.StringUtils.substring(value, 0, org.apache.commons.lang.math.NumberUtils.toInt(intcplength))+"����";
        }
        
        return intcpstr;
    }
    
    
    /**
     * ��Map��ֵת������ֱ����ҳ����ʾ��options����
     * 
     * @param map
     *            Map ���������Ҫ����
     * @param notinMap
     *            Map �������򲻰�����
     * @param havaAll
     *            boolean true��������--��ѡ��--�� false��ֻ����map����
     * @return ArrayList
     */
    public ArrayList getOptionsListByMap(LinkedHashMap map,  boolean haveAll) {                           
        ArrayList list = new ArrayList();
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }        
        // ��ü�ֵ���ֵ
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {          
            Object key = iter.next();
            Object value = map.get(key);
            list.add(new LabelValueBean((String) key, (String) value));
        }        
        return list;
    }
    
    
    public LinkedHashMap getCanSelectYear(String yearsplit){
        LinkedHashMap map = new LinkedHashMap();
        String ysplit = "";
        
        if ((yearsplit!=null)&&(!"".equals(yearsplit))){
            ysplit = yearsplit;
        }else{
            ysplit = year_split;
        }
        
        int year = org.apache.commons.lang.math.NumberUtils.toInt(DateUtils.getYear(DateUtils.getCurrDateTime()));        
        String[] ys = ysplit.split(",");
        
        for(int i=org.apache.commons.lang.math.NumberUtils.toInt(ys[0]); i>0; i--){
            map.put((year-i)+"", (year-i)+"��");
        }
        
        for(int i=0; i<org.apache.commons.lang.math.NumberUtils.toInt(ys[1]); i++){
            map.put((year+i)+"", (year+i)+"��");
        }        
        
        return map;
    }
    
    
}

