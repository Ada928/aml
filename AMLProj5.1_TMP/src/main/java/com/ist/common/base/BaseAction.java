package com.ist.common.base;

/**
 * <p>Title: INFO SENCE AUDIT SYSTEM</p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: �����������ڿƼ��������޹�˾</p>
 * @author not attributable
 * @version 1.0
 */

import java.io.File;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Comparator;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Vector;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionServlet;
import org.apache.struts.util.LabelValueBean;
import org.springframework.context.ApplicationContext;
import org.springframework.web.struts.ActionSupport;

import com.google.gson.Gson;
import com.ibatis.sqlmap.client.SqlMapClient;

import com.ist.impfile.bmp.platform.dto.Statistic;
import com.ist.impfile.bmp.platform.dao.T00_operate_logDAO;
import com.ist.impfile.bmp.platform.dto.T00_operate_log;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.StaticVariable;
import com.ist.common.attachment.bo.AttachmentManage;
import com.ist.common.attachment.dao.T01_attachmentDAO;
import com.ist.common.attachment.dto.T01_attachment;
import com.ist.common.data.importing.ConstantImporting;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.common.util.DateUtils;
import com.ist.common.sequence.SeqMgr;

public class BaseAction extends ActionSupport implements java.io.Serializable {

    public Logger logger = LogUtils.getLogger(this.getClass().getName());

    public ApplicationContext context = null;

    public SqlMapClient sqlMap = null;

    public CatchManager cm = null;
    
    private XMLProperties  sysConfig;

    /* ÿҳ�ļ�¼�� */
    public int intPageSize = 15;

    /* ��ҳ�� */
    public int intPageCount = 1;

    /* �ܼ�¼�� */
    public int intRowCount = 0;

    /* ��ǰ��ҳ�� */
    public int intPage = 1;

    public BaseAction() {
        super();
    }

    /*
     * ��дSpring ActionSupport �ķ��� �������Ĺ�ϵ���룬���ܻ�ȡApplicationContext (non-Javadoc)
     *
     * @see org.springframework.web.struts.ActionSupport#setServlet(org.apache.struts.action.ActionServlet)
     */
    public void setServlet(ActionServlet actionServlet) {
        // TODO Auto-generated method stub
        super.setServlet(actionServlet);
        context = getWebApplicationContext();
        sqlMap = (SqlMapClient) context.getBean("sqlMapClient");
        cm = (CatchManager) context.getBean("catchManager");
        sysConfig =  (XMLProperties) context.getBean("sysConfig");
    }

    /**
     * ��Action��Ԥ��������Ŀǰִ�ж�add�������������á��жϣ���ֹ�ظ�����
     * Ԥ������Ҫ������Ķ������ٽ��У�����request�е�attribute�����á�goWayFlag��Ϊfalse
     * ע�⣺���action��parameter������׼Ϊ��"add****"��"add****Do"
     *
     * @param mapping
     *            ActionMapping
     * @param form
     *            ActionForm
     * @param request
     *            HttpServletRequest
     * @param response
     *            HttpServletResponse
     * @return ActionForward
     */
    public ActionForward preExecute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response) {
        String preaction = mapping.getParameter();
        request.setAttribute("goWayFlag", "true");
        if (preaction == null)
            preaction = "";

        // �����(����)��������Ԥ����
        if (preaction.indexOf("add") == 0) {

            // ���(����)ҳ��Ĵ�����
            if (preaction.lastIndexOf("Do") == (preaction.length() - 2)) {
                // �ظ��ύ��Ӷ�����������
                if (!isTokenValid(request)) {
                    request.setAttribute("goWayFlag", "false");// ���ٽ���Action�еĶ�������
                    return mapping.findForward("success");
                } else {
                    // �����ύ��Ӷ��������д�������������
                    resetToken(request);
                    saveToken(request);
                }
            } else {
                // ���(����)ҳ��Ĳ�ѯ����
                // Ϊaddҳ���������Ʊ�ʶ
                saveToken(request);
            }
        }

        return null;// Action�м���ִ�У����践�ؾ���ֵ
    }

    /**
     * ȡ���û���֤��Ϣ
     *
     * @param request
     *            HttpServletRequest
     * @return Authorization
     */
    public Authorization getAuthorization(HttpServletRequest request) {
        HttpSession session = request.getSession();
        AuthBean authBean = (AuthBean) session.getAttribute("authBean");
        return authBean.getAuthToken();
    }

    /**
     * ��Map��ֵת����������󣬿���ֱ����ҳ����ʾ��options����.
     *
     * @param map
     *            Map ���������Ҫ����
     * @param notinMap
     *            Map �������򲻰�����
     * @param haveAll
     *            boolean true��������--��ѡ��--�� false��ֻ����map����
     * @param sortType
     *            ��key ��keyֵ����value ����ʾ��������
     * @return
     */
    public ArrayList getOptionsListByMap(Map map, Map notinMap, boolean haveAll, String sortType) {
        int len;
        String key = "";
        Comparator cmp = null;

        if (StringUtils.equals("value", sortType)) {
            cmp = new MapValueCmp();
        } else {
            cmp = new MapKeyCmp();
        }

        if (map == null || (len = map.size()) < 0) {
            return new ArrayList();
        }

        ArrayList list = new ArrayList(len + 1);
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }

        Object[] sets = map.entrySet().toArray();
        Arrays.sort(sets, cmp);

        for (int i = 0; i < sets.length; i++) {
            Entry entry = (Entry) sets[i];
            key = (String) entry.getKey();
            if (notinMap == null || !notinMap.containsKey(key)) {
                list.add(new LabelValueBean(key, (String) entry.getValue()));
            }
        }

        return list;
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
    public ArrayList getOptionsListByMap(Map map, Map notinMap, boolean haveAll) {
        ArrayList list = new ArrayList();
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }
        //
        if (notinMap == null) {
            notinMap = new HashMap();
        }
        // ��ü�ֵ���ֵ
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {
            // ���keyֵ
            Object key = iter.next();
            // ���valueֵ
            Object value = map.get(key);
            // ���������ĳһ��keyֵ,�Ͳ������ŵ�ArrayList��
            if (notinMap.containsKey(key)) {
                continue;
            }
            list.add(new LabelValueBean(String.valueOf(key), String
                    .valueOf(value)));
        }
        return list;
    }

    /**
     * ��Map��ֵת������ֱ����ҳ����ʾ��options���󣨰�ͷβ�ֶδ�ţ�
     *
     * @param map
     *            Map ���������Ҫ����
     * @param notinMap
     *            Map �����������β����
     * @param havaAll
     *            boolean true��������--��ѡ��--�� false��ֻ����map����
     * @return ArrayList
     */
    public ArrayList getOptionsListByMapForHand(Map map, Map notinMap,
            boolean haveAll) {
        ArrayList list = new ArrayList();
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }
        //
        if (notinMap == null) {
            notinMap = new HashMap();
        }
        // ��ü�ֵ���ֵ
        Iterator iter = map.keySet().iterator();
        while (iter.hasNext()) {
            // ���keyֵ
            Object key = iter.next();
            // ���valueֵ
            Object value = map.get(key);
            // ���������ĳһ��keyֵ,�Ͳ������ŵ�ArrayList��
            if (notinMap.containsKey(key)) {
                continue;
            }
            list.add(new LabelValueBean((String) key, (String) value));
        }
        // ��ü�ֵ���ֵ
        Iterator iter_tail = notinMap.keySet().iterator();
        while (iter_tail.hasNext()) {
            // ���keyֵ
            Object key = iter_tail.next();
            // ���valueֵ
            Object value = notinMap.get(key);
            // ���������ĳһ��keyֵ,�Ͳ������ŵ�ArrayList��

            list.add(new LabelValueBean((String) key, (String) value));
        }
        return list;
    }

    /**
     * ����ҳ����ʾʱ��Ҫ�ֶ�����ʾ�������Ҫ��Action����֯������Ҫ����Ϣ�� ����list��ÿ����ʾ�����������Ϊ�µ�LIST
     *
     * @param list
     *            ArrayList
     * @param colspans
     *            int
     * @return ArrayList add by heguoqiang 2006-03-16
     */
    public ArrayList getSubListByList(ArrayList list, int colspans) {
        ArrayList new_list = new ArrayList();
        ArrayList subList = new ArrayList();
        Iterator iter = list.iterator();
        int i = 0;
        while (iter.hasNext()) {
            i++;
            subList.add(iter.next());
            if (i % colspans == 0) {
                new_list.add(subList.clone());
                subList = new ArrayList();
            }
        }

        if (i > 0 && i % colspans != 0) {
            new_list.add(subList.clone());
        }
        return new_list;
    }

    /**
     * ���ݴ����keyList��valueList��װΪOptions��list
     *
     * @param keyList
     *            ArrayList key��
     * @param valueList
     *            ArrayList value��
     * @param haveAll
     *            boolean �Ƿ��ȫѡ��
     * @return ArrayList
     */
    public ArrayList getOptionsByList(ArrayList keyList, ArrayList valueList,
            boolean haveAll) {
        ArrayList list = new ArrayList();
        // ȫ��
        if (haveAll) {
            list.add(new LabelValueBean("", "--��ѡ��--"));
        }
        if (keyList == null || valueList == null
                || keyList.size() != valueList.size()) {
            keyList = new ArrayList();
            valueList = new ArrayList();
        }
        for (int i = 0; i < keyList.size(); i++) {
            list.add(new LabelValueBean((String) keyList.get(i),
                    (String) valueList.get(i)));
        }
        return list;
    }

    /**
     * �Դ����list����������
     *
     * @param list
     *            ArrayList key��
     * @return ArrayList
     */
    public ArrayList getConverseList(ArrayList list) {
        ArrayList retList = new ArrayList();

        for (int i = list.size() - 1; i >= 0; i--) {
            retList.add(list.get(i));
        }
        return retList;
    }

    /**
     * ȡ��Sequence��ֵ
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getSequenceNextVal(String seqname) throws Exception {
        String key = "";
        String sql = "";
        if(cm.isDbType("oracle")){
            sql = "select " + seqname.toUpperCase() + ".Nextval  from dual";
        }
        else if(cm.isDbType("db2")){
            sql = " select NEXTVAL FOR " + seqname + " from sysibm.sysdummy1 ";
        }else{
            throw new Exception("��֧�ִ����ݿ⣡");
        }
        Long seqNextV = (Long) sqlMap.queryForObject("getValueLong", sql);
        key = String.valueOf(seqNextV);
        if (key.equals("")) {
            throw new Exception("��ȡ����ʧ�ܣ�");
        }
        return key;
    }



    /**
     * ��ҳ�洫��10λ��Startdate����ת19λ��datetime
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getStartDateTime(String startdate) throws Exception {
    	if(startdate == null)return startdate;
    	if(startdate.indexOf(":") > -1)return startdate;
        String time = " 00:00:00";
        String startdatetime = startdate+time;
        Date d = DateUtils.stringToDate(startdatetime);
        if(d==null) startdatetime = "";
        if (startdate.equals("")) {
            startdatetime = startdate;
        }
        return startdatetime;
    }

    /**
     * ��ҳ�洫��10λ��enddate����ת19λ��datetime
     *
     * @param seqname
     *            String tablename@pkcolumn
     * @return String
     */
    public String getEndDateTime(String enddate) throws Exception {
    	if(enddate == null)return enddate;
    	if(enddate.indexOf(":") > -1)return enddate;
        String time = " 23:59:59";
        String enddatetime = enddate+time;
        Date d = DateUtils.stringToDate(enddatetime);
        if(d==null) enddatetime = "";
        if (enddate.equals("")) {
            enddatetime = enddate;
        }
        return enddatetime;
    }

    /**
     * ȡ��Sequence��ֵ
     *
     * @param seqname
     *            String
     * @return String
     */
    // public String getNextVal(String tableName, String colName) {
    // try {
    // IDBean idBean = IDBean.getInstance();
    // return idBean.getID(tableName, colName);
    // } catch (Exception ex) {
    // return null;
    // }
    // }
    // ==== ��ҳ��ط���
    // ==============================================================================
    /**
     * ˵����ÿҳ�ļ�¼������
     *
     * @param intPageSize
     *            ÿҳ�ļ�¼��
     */
    public void setIntPageSize(int intPageSize) {
        this.intPageSize = intPageSize;
    }

    /**
     * ˵����ÿҳ�ļ�¼������
     *
     * @return int ÿҳ�ļ�¼��
     */
    public int getIntPageSize() {
        return intPageSize;
    }

    /**
     * ˵������ҳ������
     *
     * @param intPageCount
     *            ��ҳ��
     */
    public void setIntPageCount(int intPageCount) {
        this.intPageCount = intPageCount;
    }

    /**
     * ˵������ҳ������
     *
     * @return int ��ҳ��
     */
    public int getIntPageCount() {
        return intPageCount;
    }

    /**
     * ˵�����ܼ�¼������
     *
     * @param intRowCount
     *            �ܼ�¼��
     */
    public void setIntRowCount(int intRowCount) {
        this.intRowCount = intRowCount;
    }

    /**
     * ˵�����ܼ�¼������
     *
     * @return int �ܼ�¼��
     */
    public int getIntRowCount() {
        return intRowCount;
    }

    /**
     * ˵������ǰ��ҳ��
     *
     * @param intPage
     *            ��ǰ��ҳ��
     */
    public void setIntPage(int intPage) {
        this.intPage = intPage;
    }

    /**
     * ˵������ǰ��ҳ��
     *
     * @return int ��ǰ��ҳ��
     */
    public int getIntPage() {
        return intPage;
    }

    public int getStartRec(int intPage) {
        int iStartRec = 0;
        iStartRec = (intPage - 1) * intPageSize;
        return iStartRec;
    }

    /**
     * ˵����ȡ�÷�ҳ��Ϣ��������ͨ�ã�
     *
     * @param totalRow
     *            �ܵļ�¼��
     * @param intPage
     *            ��ǰҳ��
     * @return Vector ��ҳ��Ϣ
     */
    public Vector getPageInfo(int totalRow, int intPage) {
        Vector pageInfo = new Vector();
        // �ܼ�¼��
        intRowCount = totalRow;
        // ��ҳ��
        intPageCount = (intRowCount + intPageSize - 1) / intPageSize;
        // ������ǰҳ���Ϸ�
        if (intPage > intPageCount)
            intPage = intPageCount;
        if (intPage < 1)
            intPage = 1;
        // �����ϡ���ҳ��
        int prePage = 1;
        int nextPage = intPageCount;
        if (intPage > 1)
            prePage = intPage - 1;
        if (intPage < intPageCount)
            nextPage = intPage + 1;
        // ��ҳ��Ϣ����������
        pageInfo.add(new Integer(intRowCount));
        pageInfo.add(new Integer(intPageCount));
        pageInfo.add(new Integer(intPage));
        pageInfo.add(new Integer(prePage));
        pageInfo.add(new Integer(nextPage));
        return pageInfo;
    }

    /**
     * ȡ�÷�ҳ�ַ���
     *
     * @param totalRow
     *            ��ҳ��
     * @param intPage
     *            ��ǰҳ��
     * @param url
     *            �ύ����·��
     * @param param
     *            ������Ϣ
     * @return ȡ�÷�ҳ��Ϣ
     */
    public String getPageInfoStr(int totalRow, int intPage, String url,
            String param) {
        // ȡ�÷�ҳ��Ϣ
        Vector pageInfo = this.getPageInfo(totalRow, intPage);
        // ȡ�÷�ҳ�ַ���
        return this.getPageInfoStr(pageInfo, intPage, url, param);
    }

    /**
     * ȡ�÷�ҳ�ַ���
     * ************************************************************************
     * ��ҳ��Ϣ����������Ϊ��form1����form��
     * �����ʱִ��checkForm(command)����(command=turnPage),ִ�б�Ҫ��ҳ�洦�� ҳ�ű���Ϊ��intPage
     * ************************************************************************
     *
     * @param pageInfo
     *            ��ҳ����
     * @param intPage
     *            ҳ��
     * @return ȡ�÷�ҳ��Ϣ
     */

    public String getPageInfoStr(Vector pageInfo, int intPage, String url,
            String param) {
        if (param == null || param.equals("")) {
            param = "p=1";
        }
        String pref1 = "&";
        String pref;
        // ����-1�Ǳ�ʾû�г��ֹ�"?"
        if (url.indexOf("?") > -1) { // ��ǰurl���в���
            pref = "&";
        } else {
            pref = "?";
        }
        if (intPage == 0) {
            intPage = 1;
        }
        // pageStr��ŷ�ҳ��Ϣ
        StringBuffer pageStr = new StringBuffer();//��pageheadStr��pagemidStr��pageendStrƴ������
        StringBuffer pageheadStr = new StringBuffer();//�洢����һҳ������һҳ��ͼ��λ��
        StringBuffer pagemidStr = new StringBuffer();//�洢���� xx ����¼ �� xx ҳ ��ǰ�� xx ҳ��ͼ��λ��
        StringBuffer pageendStr = new StringBuffer();//�洢����һҳ�������һҳ��ͼ��λ��
        // ������Ϣȫ������
        if (pageInfo.size() == 5) {
        	pagemidStr.append("<span></span>");
        	pagemidStr.append("�� " + pageInfo.elementAt(0).toString() + " ����¼");
        	pagemidStr.append(" �� " + pageInfo.elementAt(1).toString() + " ҳ");
        	pagemidStr.append(" ��ǰ�� " + (intPage) + " ҳ");
        	pagemidStr.append("<span></span>");
            int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
            int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
            int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
            int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
            // �������Ȳ�������ʱ����Ϊ�ڶ�ҳ���һ����¼��ʧ���޷����ص�һҳ��
            // ������������"��һҳ",����������Ƚ�����,����ɾ����һ����¼�󷵻صڶ�ҳ,���ǵڶ�ҳ�Ѿ�û��������,��ʱҲҪ��ʾ��һҳ������,����ͷ��ز�����һҳ��
            if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
                    * this.intPageSize + 1 <= tal))
                    || pageInfo.elementAt(0).toString().equals("0")) {
            	pageheadStr.append(" <span class=\"p_first01\"></span>");//����һҳ�����ɵ�
            	pageheadStr.append(" <span class=\"p_prev01\"></span>");//����һҳ�����ɵ�
            } else {
            	pageheadStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + 1 + "';goPage()\"><span class=\"p_first\"></span></a>");//����һҳ���ɵ�
            	
            	pageheadStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pre + "';goPage()\"><span class=\"p_prev\"></span></a>");//����һҳ���ɵ�
            }

            if (nex == 0 || (cur >= nex)) {
            	pageendStr.append(" <span class=\"p_last01\"></span>");//����һҳ�����ɵ�
            	pageendStr.append(" <span class=\"p_next01\"></span>");//�����һҳ�����ɵ�
            } else {
            	pageendStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + nex + "';goPage()\"><span class=\"p_next\"></span></a>");//����һҳ���ɵ�
            	
            	pageendStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pageInfo.elementAt(1) + "';goPage()\"><span class=\"p_last\"></span></a>");//�����һҳ���ɵ�
            }

            int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

            // ����1000ҳ,����ʾΪ������ֵ
            if (totalPage < 1000) {
            	pageendStr
                        .append(" <span class=\"p_select\">����<select name='intPage' onChange=\"goPage()\">");

                for (int i = 1; i <= totalPage; i++) {
                    String se = (intPage == i) ? " selected " : "";
                    pageendStr.append("<option value='" + i + "'" + se + ">" + i
                            + "</option>");
                }
                if (totalPage == 0) {
                	pageendStr.append("<option value='1'>1</option>");
                }
                pageendStr.append("</select></span>");
            } else {
            	pageendStr
                        .append(" ����<input type=\"text\" size=4 class='text_white' name='intPage'>");
            	pageendStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
            }

            //
            pageendStr.append("<script language=\"javascript\">\n");
            pageendStr.append("function goPage()\n{");
            pageendStr.append(" var obj=document.all.intPage.value;");
            pageendStr
                    .append("if(isNaN(obj) || parseInt(obj)<1){ alert('��������ȷ��ҳ��,����Ϊ������!');document.all.intPage.focus();return;}");
            pageendStr.append(" if(parseInt(obj)>parseInt(" + totalPage
                    + ")){document.all.intPage.value=" + totalPage + ";}");

            pageendStr.append("document.forms[0].action=\"" + url + pref
                    + "wherefrom=trunpage&" + param + pref1 + "intPage="
                    + "\" + document.all.intPage.value;"
                    + "document.forms[0].submit();}\n");
            pageendStr.append("</script>");
            
            pageStr.append(pageheadStr);
            pageStr.append(pagemidStr);
            pageStr.append(pageendStr);
            
        } else {
            pageStr.append("&nbsp;");
        }
        return pageStr.toString();
    }

    /**
     * ��ȡ��������
     *
     * @param searchObj
     *            ���β�ѯ���������󣬾���DTO
     * @param countSqlMapID
     *            ȡ�ñ��β�ѯ�ܼ�¼����SQLMAP��ID
     * @param request
     *            HttpServletRequest
     * @param form
     *            ActionForm ���뾭�����ͺ��
     * @param url
     *            ҳ����ת��URL
     * @return searchObj
     * @throws Exception
     */
    public BaseDTO getSearchObject(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form, String countSqlMapID,
            String url) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        //
        int intPage = 1;
        // ��������
        String sessionID = searchObj.getClass().getName() + "_" + url;
        // logger.debug("=="+sessionID);
        //

        String wherefrom = StringUtils.trimToEmpty(request
                .getParameter("wherefrom"));

        if (newsearchflag.equals("1")) {// �µĲ�ѯ
            // if(!wherefrom.equals("trunpage")){//�µĲ�ѯ
            PropertyUtils.copyProperties(searchObj, form);
            // ���β�ѯ��ҳ��
            BaseDAO baseDAO = new BaseDAO();
            int totalRow = baseDAO.getListCount(sqlMap, countSqlMapID,
                    searchObj);
            searchObj.setTotalRow(totalRow);
            // =====

            // =====
        } else {// ��ҳ
            searchObj = (BaseDTO) session.getAttribute(sessionID);
            String intPageStr = request.getParameter("intPage");
            //
            if (intPageStr == null)
                intPage = searchObj.getIntPage();
            else {
                try {
                    intPage = Integer.parseInt(intPageStr);
                } catch (Exception e) {
                }
                searchObj.setIntPage(intPage);
            }

            if (!wherefrom.equals("trunpage")) {
                BaseDAO baseDAO = new BaseDAO();
                int totalRow = baseDAO.getListCount(sqlMap, countSqlMapID,
                        searchObj);
                searchObj.setTotalRow(totalRow);
            }

        }

        searchObj.setNewsearchflag(newsearchflag);
        session.setAttribute(sessionID, searchObj);

        String pageInfo = this.getPageInfoStr(searchObj.getTotalRow(), intPage,
                url, "");

        request.setAttribute("pageInfo", pageInfo);
        
        /*
         * Ϊ�˽���б�ҳ�����ŵ����⣬�˴���Ҫ�ഫ����������ҳ�档������
         * begin...
         */
        request.setAttribute("cebbank_intpagesize",new Integer(this.intPageSize));
        request.setAttribute("cebbank_intpage",new Integer(intPage));
        request.setAttribute("currRecordNum",new Integer(this.getStartRec(intPage)));
        
        /*
         * end...
         */
        return searchObj;
    }

    /**
     * ��ȡ��������
     *
     * @param searchObj
     *            ���β�ѯ���������󣬾���DTO
     * @param request
     *            HttpServletRequest
     * @param form
     *            ActionForm ���뾭�����ͺ��
     * @return searchObj
     * @throws Exception
     */
    public BaseDTO getSearchObject(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        // ��������
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        //
        if (newsearchflag.equals("1")) {// �µĲ�ѯ
            PropertyUtils.copyProperties(searchObj, form);
            // =====

            // =====
            // session.setAttribute( sessionID,searchObj );
        } else {// ��ҳ
            searchObj = (BaseDTO) session.getAttribute(sessionID);
        }
        session.setAttribute(sessionID, searchObj);

			  /*
         * Ϊ�˽���б�ҳ�����ŵ����⣬�˴���Ҫ�ഫ����������ҳ�档������
         * begin...
         */
        request.setAttribute("cebbank_intpagesize",new Integer(this.intPageSize));
        request.setAttribute("cebbank_intpage",new Integer(intPage));
        request.setAttribute("currRecordNum",new Integer(this.getStartRec(intPage)));
        
        /*
         * end...
         */	 
        return searchObj;
    }

    /**
     * ������Ի���ѯ����
     *
     * @param searchObj
     *            ��������
     * @param request
     *            HttpServletRequest
     * @throws Exception
     */
    public void saveSearchObject(BaseDTO searchObj, HttpServletRequest request)
	    throws Exception {
		HttpSession session = request.getSession();
		// ��������
		String  url = request.getRequestURI();
		String sessionID = searchObj.getClass().getName() + "_" + url;
		session.setAttribute(sessionID, searchObj);
	}

    /**
     * ������ת��Ϊָ���ָ������ӵ��ַ���
     *
     * @param sourArray
     *            ��ת������
     * @param splitter
     *            �ָ���
     * @param invertedComma
     *            ��������
     * @return String
     */
    public String formatStr(String[] sourArray, String splitter,
            String invertedComma) {
        String midSpl = invertedComma + splitter + invertedComma;
        String result = invertedComma + StringUtils.join(sourArray, midSpl)
                + invertedComma;
        return result;
    }

    public ArrayList getAttachmentList(HttpServletRequest request,
            String businesskey, String mode, String attachtype, String systemkey)
            throws Exception {
        return this.getAttachmentList(request, businesskey, mode, attachtype,
                systemkey, "", "");
    }

    
    
    /**
     * ��ʾ�����б� �г�ͬһ��ҵ������µ����и����� �½�ʱ������һ�ν��룩��ҵ��������Ϊ�ջ���ַ������ĵ����ͺ�������ϵͳ����Ϊ�ա�
     * ��mode��ֵΪeditʱ�������ϴ��ͱ༭��������mode��ֵΪnull��""��view�Ȳ���editʱ����������ʾ��
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            ҵ�����
     * @param mode
     *            �Ƿ���Ա༭���ϴ�
     * @param businesskey
     *            �����ĵ�����
     * @param mode
     *            ������ϵͳ
     * @param title
     *            Ĭ����������
     * @param template
     *            ����ģ��
     * @return ArrayList
     * @throws SQLException
     * @throws SQLException
     * @throws Exception
     */
    public ArrayList getAttachmentList(HttpServletRequest request,
            String businesskey, String mode, String attachtype,
            String systemkey, String title, String template) throws SQLException {
        ArrayList t01_attachmentList = new ArrayList();
        ArrayList t01_attachment_docList = new ArrayList();
        String keyStr = "";
        String docKeyStr = "";
        if (businesskey == null) {
            businesskey = "";
        }

        // ȡ�õ�ǰ�û�
        Authorization auth = this.getAuthorization(request);
        String currUserName = auth.getT00_user().getUsername();

        if (!businesskey.equals("")) {
            T01_attachmentDAO t01_attachmentDAO = (T01_attachmentDAO) context
                    .getBean("t01_attachmentDAO");
            T01_attachment t01_attachment = new T01_attachment();

            // ����ҵ����벢�����ݿ�ȡ������
            t01_attachment.setBusinesskey(businesskey);

            /**
             * �ĵ����ͣ�01-�ĵ�
             */
            t01_attachment.setAttachtype("01");
            t01_attachment_docList = t01_attachmentDAO.getT01_attachmentList(
                    sqlMap, t01_attachment);
            if (t01_attachment_docList.size() > 0) {
                // �Ѹ��������б�ת���ַ������á�,���ָ�
                for (int i = 0; i < t01_attachment_docList.size(); i++) {
                    docKeyStr = docKeyStr
                            + ((T01_attachment) t01_attachment_docList.get(i))
                                    .getAttachkey() + ",";
                }
                docKeyStr = docKeyStr.substring(0, docKeyStr.lastIndexOf(","));
            }

            /**
             * �ĵ����ͣ�02-����
             */
            t01_attachment.setAttachtype("02");
            t01_attachmentList = t01_attachmentDAO.getT01_attachmentList(
                    sqlMap, t01_attachment);

            if (t01_attachmentList.size() > 0) {
                // �Ѹ��������б�ת���ַ������á�,���ָ�
                for (int i = 0; i < t01_attachmentList.size(); i++) {
                    keyStr = keyStr
                            + ((T01_attachment) t01_attachmentList.get(i))
                                    .getAttachkey() + ",";
                }
                keyStr = keyStr.substring(0, keyStr.lastIndexOf(","));
            }
        }

        request.setAttribute("t01_attachment_docList", t01_attachment_docList);
        request.setAttribute("t01_attachmentList", t01_attachmentList);
        request.setAttribute("docKeyString", docKeyStr);
        request.setAttribute("attachkeyString", keyStr);
        request.setAttribute("currentUser", currUserName);
        request.setAttribute("realUser", auth.getT00_user().getRealname());


        if (mode.equalsIgnoreCase("new")) {
            request.setAttribute("showMode", "new");
        } else if (mode.equalsIgnoreCase("edit")) {
            request.setAttribute("showMode", "edit");
        } else {
            request.setAttribute("showMode", "view");
        }

        request.setAttribute("systemkey", systemkey); // ������ϵͳ
        request.setAttribute("title", title); // Ĭ����������
        request.setAttribute("template", template); // ����ģ��

        return t01_attachmentList;
    }
    
    /**
     * ���渽�� 1�������ݿ���ҵ������ֶ�ֵ��businesskey������ͬ�ļ�¼�ҳ����� 2������Щ��¼��ҵ������ֶ���Ϊ���ַ�����
     * 3������ҳ�����ύ�ĸ������룬�����������Ӧ��ҵ���������Ϊbusinesskey������ֵ����������Ϊ�˴���ҳ����ɾ���ĸ�����
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            ҵ�����
     * @return boolean
     * @throws Exception
     */
    public boolean saveAttachment(SqlMapClient sqlMap,
            HttpServletRequest request, String businesskey) throws Exception {
        AttachmentManage am = (AttachmentManage) context
                .getBean("attachmentManage");
        return am.saveAttachment(sqlMap, request, businesskey);
    }

    /**
     * �������� 1���µ�ҵ�������Ϊ����������
     * 2������ҳ���ϵõ��ĸ������룬����Щ�����������ݼ�¼����һ�ݣ��������µĸ������������У���Ӧ��ҵ�����Ϊbusinesskey����
     *
     * @param request
     *            HttpServletRequest
     * @param businesskey
     *            ҵ�����
     * @return boolean
     * @throws Exception*/
     
    public boolean copyAttachment(SqlMapClient sqlMap,
            HttpServletRequest request, String businesskey) throws Exception {
        AttachmentManage am = (AttachmentManage) context
                .getBean("attachmentManage");
        return am.copyAttachment(sqlMap, request, businesskey);
    }


    public ArrayList chg(ArrayList statList,Statistic statistic) throws Exception{
        HashMap titleMap =statistic.getTitleMap();

        //ͳ�����ֶ�����
        String rowStr = statistic.getRowStr();
        //ͳ�����ֶ�����
        String colStr = statistic.getColStr();
        //ͳ�������ֶ�����
        String valsStr =statistic.getValsStr();

        //�Ƿ���ͳ��
        boolean isCntRow = statistic.isCntRow();
        boolean isCntCol = statistic.isCntCol();


        ArrayList tmpDataList = new ArrayList();
        ArrayList tmpList = null;
        ArrayList rsltList = new ArrayList(128);
        HashMap tmpRowMap = null;
        HashMap tmpDataMap = null;
        Set colSet = new HashSet();
        StringBuffer rowSb = null;
        String tmpRowStr = null;

        String[] rows = StringUtils.split(rowStr,',');
        String[] rowVal = new String[rows.length];

        BigDecimal tmpRow = new BigDecimal(0);
        BigDecimal[] tmpCol = null;

        Iterator iter = statList.iterator();
        while (iter.hasNext()) {
            Object bean = iter.next();

            // ȡ�еĵ�ǰֵ
            rowSb = new StringBuffer();
            tmpRowMap = new HashMap();
            for (int i = 0; i < rows.length; i++) {
                rowVal[i] = BeanUtils.getProperty(bean, rows[i]);
                rowSb.append("^").append(rowVal[i]);
                tmpRowMap.put(rows[i], rowVal[i]);
            }

            // �з����仯������һ���µ�map
            if (!StringUtils.equals(tmpRowStr, rowSb.toString())) {
                tmpDataMap = new HashMap();
                tmpRowStr = rowSb.toString();
                tmpDataMap.putAll(tmpRowMap);
                tmpDataList.add(tmpDataMap);

                if(isCntRow){
                    tmpRow = new BigDecimal(0);
                }
            }

            //ȡ����Ϣ
            String col_key = BeanUtils.getProperty(bean, colStr);
            if (!colSet.contains(col_key)) {
                colSet.add(col_key);
            }

            //ȡֵ
            String col_val = BeanUtils.getProperty(bean, valsStr);
            tmpDataMap.put(col_key, col_val);
            //�Ƿ�������С��
            if(isCntRow){
                tmpRow = addBigDec(tmpRow,col_val);
                tmpDataMap.put("COL_CNT", tmpRow);
            }
        }

        Object[] colkeys = colSet.toArray();
        Arrays.sort(colkeys);

        //��������С��
        if(isCntCol){
            if(isCntRow){
                tmpCol = new BigDecimal[colkeys.length+1];
            }else{
                tmpCol = new BigDecimal[colkeys.length];
            }

        }

        //���ɱ����
        tmpList = new ArrayList(colkeys.length+rows.length);
        //����б���
        for (int i = 0; i < rows.length; i++) {
            tmpList.add(getVal(titleMap,rows[i]));
        }
        //����б���
        for (int i = 0; i < colkeys.length; i++) {
            tmpList.add(colkeys[i]);
        }
        if(isCntRow){
            tmpList.add("�ϼ�");
        }
        rsltList.add(tmpList);

        //�����µ�����list
        iter = tmpDataList.iterator();
        while(iter.hasNext()){
            tmpDataMap = (HashMap) iter.next();
            tmpList = new ArrayList(colkeys.length+rows.length);
            //д������
            for (int i = 0; i < rows.length; i++) {
                tmpList.add(getVal(tmpDataMap,rows[i]));
            }

            //д������
            for (int i = 0; i < colkeys.length; i++) {
                String tmpVal = getVal(tmpDataMap, (String) colkeys[i]);
                tmpList.add(tmpVal);
                if (isCntCol) {
                    tmpCol[i] = addBigDec(tmpCol[i],tmpVal);
                }
            }
            // д���ܼ�
            if(isCntRow){
                tmpList.add(tmpDataMap.get("COL_CNT"));
                if(isCntCol){
                    tmpCol[colkeys.length]=addBigDec(tmpCol[colkeys.length],(BigDecimal) tmpDataMap.get("COL_CNT"));
                }
            }
            rsltList.add(tmpList);
        }

        //д���ܼ�
        if(isCntCol){
            tmpList = new ArrayList(colkeys.length+rows.length+1);
            //д������
            for (int i = 0; i < rows.length; i++) {
                if(i==0){
                    tmpList.add("�ܼ�");

                }else{
                    tmpList.add("");
                }
            }
            //д������
            for (int i = 0; i < tmpCol.length; i++) {
                tmpList.add(tmpCol[i]);
            }
            rsltList.add(tmpList);
        }

        return rsltList;
    }

    private BigDecimal addBigDec(BigDecimal bigDec,String str2){
        BigDecimal tmpDec ;
        try {
            tmpDec = new BigDecimal(str2);
        } catch (Exception e) {
           tmpDec = new BigDecimal(0);
        }

        if(bigDec == null){
            bigDec = new BigDecimal(0);
        }
        return bigDec.add(tmpDec);
    }
    private BigDecimal addBigDec(BigDecimal bigDec1,BigDecimal bigDec2){
        if(bigDec1 == null){
            bigDec1 = new BigDecimal(0);
        }
        if(bigDec2 == null){
            bigDec2 = new BigDecimal(0);
        }
        return bigDec1.add(bigDec2);
    }

    private String getVal(Map map,String key){
        if(map ==null||!map.containsKey(key)){
            return "";
        }else{
            return (String) map.get(key);
        }
    }
    
    public BaseDTO getSearchObjectForDSQL(BaseDTO searchObj,
            HttpServletRequest request, ActionForm form, String sql_count,
            String url) throws Exception {
        HttpSession session = request.getSession();
        String newsearchflag = StringUtils.trimToEmpty(request
                .getParameter("newsearchflag"));
        String busstypecd = StringUtils.trimToEmpty(request
                .getParameter("busstypecd"));
        searchObj.setNewsearchflag(newsearchflag);
        searchObj.setBusstypecd(busstypecd);
        //
        int intPage = 1;
        // ��������
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        // logger.debug("=="+sessionID);
        //

        String wherefrom = StringUtils.trimToEmpty(request
                .getParameter("wherefrom"));

        if (newsearchflag.equals("1")) {// �µĲ�ѯ
            // if(!wherefrom.equals("trunpage")){//�µĲ�ѯ
            PropertyUtils.copyProperties(searchObj, form);
            // ���β�ѯ��ҳ��
        	Integer iCount = (Integer) sqlMap.queryForObject( "getIntValue", sql_count);
        	int totalRow = iCount.intValue();
            searchObj.setTotalRow(totalRow);
            // =====

            // =====
        } else {// ��ҳ
        	if (session.getAttribute(sessionID) != null){
        		 searchObj = (BaseDTO) session.getAttribute(sessionID);
        	}
           
            String intPageStr = request.getParameter("intPage");
            //
            if (intPageStr == null)
                intPage = searchObj.getIntPage();
            else {
                try {
                    intPage = Integer.parseInt(intPageStr);
                } catch (Exception e) {
                }
                searchObj.setIntPage(intPage);
            }

            if (!wherefrom.equals("trunpage")) {
            	Integer iCount = (Integer) sqlMap.queryForObject( "getIntValue", sql_count);
            	int totalRow = iCount.intValue();
                searchObj.setTotalRow(totalRow);
            }

        }

        searchObj.setNewsearchflag(newsearchflag);
        session.setAttribute(sessionID, searchObj);

        String pageInfo = this.getPageInfoStr(searchObj.getTotalRow(), intPage,
                url, "");

        request.setAttribute("pageInfo", pageInfo);

        return searchObj;
    }    
    
    /**
     * �����ļ�
     * @param response
     * @param fileName
     * @param bytes
     * @throws IOException
     */
    public void downloadFile(HttpServletResponse response, String fileName,
      byte[] bytes) throws IOException {
     // ����Ϊ����application/x-download
     response.reset();
     response.setContentType("application/x-download");
     fileName = URLEncoder.encode(fileName, "UTF-8");
     response.addHeader("Content-Disposition", "attachment;filename=" + fileName);
     OutputStream output = null;
		try {
			output = response.getOutputStream();
			output.write(bytes);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if(output != null)try {output.flush();} catch (Exception e2) {e2.printStackTrace();}
			if(output != null)try {output.close();} catch (Exception e2) {e2.printStackTrace();}
		} 
    
    }
    
   
    
    /**
     * ȡ�õ�ǰϵͳ���ݿ����ӷ�ʽ
     * @return String
     * @throws Exception
     */
    public String getCurrentDbLinkKey() throws Exception {
    	LinkedHashMap t00_system_param=cm.getMapFromCache("t00_system_param");
		String dblinkkey = (String) t00_system_param.get("hpom-dm"); 
		if(StringUtils.isEmpty(dblinkkey)) {
			throw new Exception("δ��DM�����������ݿ����ӷ�ʽ�������ã�");
		}
		return dblinkkey;
    }    
    
    /**
     * ��ȡ�嵥�б�����е�SQL���(�Զ������ݡ���֤�����̽������ȵ����嵥��Ҫʹ��)
     * @param tableCode
     * @return String
     */
    public String getCheckListColumnSql(String tableCode) {
    	StringBuffer sql = new StringBuffer();
    	sql.append("select ");
    	sql.append("colkey as column_name,");
    	sql.append("colname as column_comment,");
    	sql.append("'string' as column_type,");
    	sql.append("collength as column_length,");
    	sql.append("'0' as column_point ");
    	sql.append("from T12_programa_cols t1 ");
    	sql.append("where t1.tablecode = '"+tableCode+"'  ");
    	sql.append("and t1.flag = '1' ");
    	sql.append("order by t1.isdefaultfield desc,t1.isapply asc,t1.dispseq ");
    	
    	return sql.toString();
    }
    
    /**
     * �����嵥����룬��ȡ���Ӧ���е�map��Ϣ
     * @param tableCode �����
     * @return List
     * @throws Exception
     */
    public List getCheckListColumnListOfMap(String tableCode) throws Exception {
    	List columnList = null;
    	String sql = this.getCheckListColumnSql(tableCode);
    	columnList = sqlMap.queryForList("getCommonListMap", sql);
    	return columnList;
    }
    
    /**
     * ��Ĭ���У�����Ĭ����Ϣ���е�map��Ϣ
     * @param tableCode �����
     * @param target ���Ŀ����
     * @return List
     * @throws Exception
     */
    public List addDefault2CheckListColumnListOfMap(String tableCode,String target) throws Exception {
    	List columnListOfMap = null;
    	columnListOfMap = this.getCheckListColumnListOfMap(tableCode);
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String columnName = (String)columnMap.get(ConstantImporting.COLUMN_NAME);//��Ӣ����
    		if(StaticVariable.CHECK_LIST_D_L_SEQ.equalsIgnoreCase(columnName)) {//�嵥����(����)
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_AUTO_SEQUENCE);
    			columnMap.put(ConstantImporting.COLUMN_SEQUENCE_NAME, StaticVariable.CHECK_LIST_SEQUENCE_NAME);
    		}
    		else if(StaticVariable.CHECK_LIST_D_L_TARGET.equalsIgnoreCase(columnName)) {//��Ʒ��ֱ��
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_DEFAULT);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE, target);
    		}
    		else if(StaticVariable.CHECK_LIST_D_L_FLAG.equalsIgnoreCase(columnName)) {//�嵥��ʶ
    			columnMap.put(ConstantImporting.COLUMN_IS_DEFAULT, ConstantImporting.COLUMN_IS_DEFAULT_YES);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE_TYPE, ConstantImporting.VALUE_TYPE_DEFAULT);
    			columnMap.put(ConstantImporting.COLUMN_DEFAULT_VALUE, "1");
    		}
		}
    	return columnListOfMap;
    }
    
    /**
     * ��ȡ�嵥���Ĭ�����뱻ѡ���е��е�map��Ϣ
     * @param tableCode
     * @param target
     * @param selectedList
     * @return
     * @throws Exception
     */
    public List getDefaultAndSelectedCheckListColumnListOfMap(String tableCode,String target,List selectedList) throws Exception {
    	List defaultAndSelectedList = new ArrayList();
    	List columnListOfMap = this.addDefault2CheckListColumnListOfMap(tableCode, target);
    	//û��ѡ����У�����ȫ������
    	if(selectedList == null || selectedList.size() < 1)return columnListOfMap;   	
    	
    	//Ĭ����
    	defaultAndSelectedList.addAll(this.getDefaultCheckListColumnListOfMap(columnListOfMap));
    	//��ѡ����
    	defaultAndSelectedList.addAll(this.getSelectedCheckListColumnListOfMap(columnListOfMap, selectedList));
    	
    	return defaultAndSelectedList;
    }
    
    
    /**
     * ��ȡ�嵥��ı�ѡ���е��е�map��Ϣ
     * @param columnListOfMap
     * @param selectedList
     * @return
     * @throws Exception
     */
    public List getSelectedCheckListColumnListOfMap(List columnListOfMap, List selectedList) throws Exception {
    	List selectedListOfMap = new ArrayList();
    	if(selectedList == null || selectedList.size() < 1)return null;
    	
    	//���ѡ����
    	for (int i = 0; i < selectedList.size(); i++) {
    		String columnName = (String)selectedList.get(i);
    		if(StringUtils.isEmpty(columnName))continue;
    		
    		for (int j = 0; j < columnListOfMap.size(); j++) {
    			Map columnMap = (Map)columnListOfMap.get(j);
        		if(columnMap == null)continue;
        		String colName = (String)columnMap.get(ConstantImporting.COLUMN_NAME);//��Ӣ����
        		if(columnName.equalsIgnoreCase(colName)) {//��Ӣ����ƥ��
        			selectedListOfMap.add(columnMap);
        			break;
        		}
			}
		}
    	
    	return selectedListOfMap;
    }
    
    /**
     * ��ȡ�嵥���Ĭ���е��е�map��Ϣ
     * @param columnListOfMap
     * @return List
     */
    public List getDefaultCheckListColumnListOfMap(List columnListOfMap) {
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	List defaultList = new ArrayList();
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String isDefault = (String)columnMap.get(ConstantImporting.COLUMN_IS_DEFAULT);//�Ƿ�Ĭ��ֵ
    		if(ConstantImporting.COLUMN_IS_DEFAULT_YES.equalsIgnoreCase(isDefault)) {
    			defaultList.add(columnMap);
    		}
		}   	
    	return defaultList;
    }
    
    /**
     * ��ȡ�嵥��ķ�Ĭ���е��е�map��Ϣ
     * @param columnListOfMap
     * @return List
     */
    public List getNotDefaultCheckListColumnListOfMap(List columnListOfMap) {
    	if(columnListOfMap == null || columnListOfMap.size() < 1)return columnListOfMap;
    	
    	List defaultList = new ArrayList();
    	for (int i = 0; i < columnListOfMap.size(); i++) {
    		Map columnMap = (Map)columnListOfMap.get(i);
    		if(columnMap == null)continue;
    		String isDefault = (String)columnMap.get(ConstantImporting.COLUMN_IS_DEFAULT);//�Ƿ�Ĭ��ֵ
    		if(!ConstantImporting.COLUMN_IS_DEFAULT_YES.equalsIgnoreCase(isDefault)) {
    			defaultList.add(columnMap);
    		}
		}   	
    	return defaultList;
    }
    
    /**
     * ȡ����һ�����ֵ
     * @param parakey ��������
     * @param seqkey ���б���
     * @return String
     * @throws Exception
     */
    public String getNextSeq(String parakey, String seqkey) throws Exception {
    	SeqMgr seqMgr = (SeqMgr)context.getBean("seqMgr");
    	return seqMgr.getNextSeq(parakey, seqkey);
    }
    
    /**
     * ��ȡ��ʱ�ļ�·��
     * ����������򴴽�
     * @return
     * @throws Exception 
     */
    protected String getTempPath() throws Exception {
    	 // �ж������ļ��Ƿ���ȷ
		String rootPath = sysConfig.getProperty("data.dir_root");
		String tempPath = sysConfig.getProperty("data.dir_temp");
		
        if (StringUtils.isEmpty(rootPath) ||
        		StringUtils.isEmpty(tempPath)) {
            throw new Exception("�����ļ���ȱʧ��");
        }
        String tempFilePath = rootPath + File.separator + tempPath + File.separator
                + DateUtils.FormatDate(new Date(), "yyyyMM") + File.separator;
        File path = new File(tempFilePath);
        if (!path.exists()) {
        	path.mkdirs();
        }        
    	return tempFilePath;
    }
    
    /**
     * ��ȡ��¼�û�����Ϣ
     * @param request
     * @return
     * @throws Exception
     */
    protected AuthBean getAuthBean(HttpServletRequest request) throws Exception {
    	if (request == null || request.getSession() == null || request.getSession().getAttribute("authBean") == null) {
    		throw new Exception("�����µ�¼��");
    	}
    	return (AuthBean) request.getSession().getAttribute("authBean");
    }
    
    
    /**aml
     * ��ϴǮ
     * @param request
     * @return
     * @throws Exception
     */
    public String getOperatedTableName(String organkey,String baseTableName,HttpServletRequest request,XMLProperties SysConfig){
	   	 if(organkey==null){
	   		 throw new IllegalArgumentException("������Ϊ�գ�");
	   	 }
	   	 if(baseTableName==null){
	   		 throw new IllegalArgumentException("��������Ϊ�գ�");
	   	 }
	   	 //��ϵͳ����Ա ֱ�ӷ�������
	   	 Authorization auth = this.getAuthorization(request);
	   	 if("1".equals(auth.getT00_user().getIsadmin())){
	   		 return baseTableName;
	   	 }
	   	 String operTableName = baseTableName;
	   	 if(isSplitTable(baseTableName,SysConfig)){
	   		LinkedHashMap organkey2serverkey = cm.getMapFromCache("organkey_2_serverkey");
	       	 String serverkey = (String)organkey2serverkey.get(organkey);
	   		 if(serverkey!=null && !"".equals(serverkey)){
	   			 operTableName = baseTableName+"_"+serverkey;
	   		 }
	   	 }
	   	 return operTableName.toUpperCase();
	    }
    
    /**aml
     * �ж��Ƿ��ǲ�ֱ�
     * 	1.ϵͳ���ò��  ��ֱ����ò�� �򷵻� true
     * 	2.������ ���� false
     * @param tablename
     * @return
     */
    public boolean isSplitTable(String tablename,XMLProperties SysConfig){
   	 String split_ind = SysConfig.getProperty("split_table.split_ind");
   	 if(!"1".equals(split_ind)){
   		 return false;
   	 }
   	 LinkedHashMap table2IsSplit = cm.getMapFromCache("tablename_2_issplit");
   	 if(table2IsSplit!=null&&table2IsSplit.size()>0){
	    	 Iterator iterator = table2IsSplit.keySet().iterator();
	    	 while(iterator.hasNext()){
	    		 String keyEentry = (String)iterator.next();
	    		 if(tablename.equalsIgnoreCase(keyEentry)){
	    			 return true;
	    		 }
	    	 }
   	 }
   	 return false;
    }
    
    /**
	 * ȥ��form����ֵ����β�ո�
	 * @param obj
	 * @return
	 */
	public Object formFieldsTrim(Object obj) {
		try {
			Class c = obj.getClass();
	        Field[] fields = c.getDeclaredFields();//�õ��������е��ֶ�
	        for (int i = 0; i < fields.length; i++) {
	        	String tempField = fields[i].getName();
	        	String setMethod = "set" + tempField.substring(0, 1).toUpperCase() +
                tempField.substring(1);//�����ֶ���ƴ����set������
	        	String getMethod = "get" + tempField.substring(0, 1).toUpperCase() +
                tempField.substring(1);//�����ֶ���ƴ����get������
	        	String fil = fields[i].getType().
                        getName();//�õ�ÿ���ֶε��������ͣ�Ҳ����set�����Ĳ�������
	        	if (fil.equals("java.lang.String")) {
	        		Method getMothod=c.getMethod(getMethod, new Class[]{}); 
	        		Object value=getMothod.invoke(obj, new Object[]{});   
	        		//��ȡ������Ϊ set,���ͺ��ֶε�����
	        	    Method setMothod = c.getMethod(setMethod, new Class[]{fields[i].getType()}); 
	        		if( value!=null && !"".equals(value.toString()) ) {
	        			//����set������ֵ
		        	    setMothod.invoke(obj,new Object[] {  value.toString().trim() });
	        		}
	        	}
	        }

		} catch (Exception e) {
			e.printStackTrace();
		}
		return obj;
	}
	
	/**aml
	 * ȡ�÷�ҳ�ַ���
	 * @param totalRow ��ҳ��
	 * @param intPage ��ǰҳ��
	 * @param url �ύ����·��
	 * @param param ������Ϣ
	 * @return ȡ�÷�ҳ��Ϣ
	 */
	public String getPageInfoStr1(int totalRow, int intPage, String url,
			String param,int intPageSize1) {
		//ȡ�÷�ҳ��Ϣ
		Vector pageInfo = this.getPageInfo1(totalRow, intPage,intPageSize1);
		//ȡ�÷�ҳ�ַ���
		return this.getPageInfoStr1(pageInfo, intPage, url, param,intPageSize1);
	}
	
	/**aml
	 * ȡ�÷�ҳ�ַ���
	 * ************************************************************************
	 * ��ҳ��Ϣ����������Ϊ��form1����form��
	 * �����ʱִ��checkForm(command)����(command=turnPage),ִ�б�Ҫ��ҳ�洦��
	 * ҳ�ű���Ϊ��intPage
	 * ************************************************************************
	 * @param pageInfo ��ҳ����
	 * @param intPage ҳ��
	 * @return ȡ�÷�ҳ��Ϣ
	 */

	/*public String getPageInfoStr1(Vector pageInfo, int intPage, String url,
			String param,int intPageSize1) {
		String pref1 = "&";
		String pref;
		//����-1�Ǳ�ʾû�г��ֹ�"?"
		if (url.indexOf("?") > -1) { //��ǰurl���в���
			pref = "&";
		} else {
			pref = "?";
		}
		if (intPage == 0) {
			intPage = 1;
		}
		//pageStr��ŷ�ҳ��Ϣ
		StringBuffer pageStr = new StringBuffer();
		//������Ϣȫ������
		if (pageInfo.size() == 5) {
			pageStr.append("�� " + pageInfo.elementAt(0).toString() + " ����¼");
			pageStr.append(" �� " + pageInfo.elementAt(1).toString() + " ҳ");
			pageStr.append(" ��ǰ�� " + (intPage) + " ҳ");
			int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
			int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
			int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
			int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
			//�������Ȳ�������ʱ����Ϊ�ڶ�ҳ���һ����¼��ʧ���޷����ص�һҳ��
			//������������"��һҳ",����������Ƚ�����,����ɾ����һ����¼�󷵻صڶ�ҳ,���ǵڶ�ҳ�Ѿ�û��������,��ʱҲҪ��ʾ��һҳ������,����ͷ��ز�����һҳ��
			if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
					* intPageSize1 + 1 <= tal))
					|| pageInfo.elementAt(0).toString().equals("0")) {
				pageStr.append(" ��һҳ");
			} else {
				pageStr
						.append(" <a href=\"javaScript:document.all.intPage.value='"
								+ pre + "';goPage()\">��һҳ</a>");
			}

			if (nex == 0 || (cur >= nex)) {
				pageStr.append(" ��һҳ");
			} else {
				pageStr
						.append(" <a href=\"javaScript:document.all.intPage.value='"
								+ nex + "';goPage()\">��һҳ</a>");
			}

			int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

			//����1000ҳ,����ʾΪ������ֵ
			if (totalPage < 1000) {
				pageStr
						.append(" ����<select name='intPage' onChange=\"goPage()\">");

				for (int i = 1; i <= totalPage; i++) {
					String se = (intPage == i) ? " selected " : "";
					pageStr.append("<option value='" + i + "'" + se + ">" + i
							+ "</option>");
				}
				if (totalPage == 0) {
					pageStr.append("<option value='1'>1</option>");
				}
				pageStr.append("</select>");
			} else {
				pageStr
						.append(" ����<input type=\"text\" size=4 class='text_white' name='intPage'>");
				pageStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
			}

			//
			pageStr.append("<script language=\"javascript\">\n");
			pageStr.append("function goPage()\n{");
			pageStr.append(" var obj=document.all.intPage.value;");
			pageStr
					.append("if(isNaN(obj) || parseInt(obj)<1){ alert('��������ȷ��ҳ��,����Ϊ������!');document.all.intPage.focus();return;}");
			pageStr.append(" if(parseInt(obj)>parseInt(" + totalPage
					+ ")){document.all.intPage.value=" + totalPage + ";}");

			pageStr.append("document.forms[0].action=\"" + url + pref + param
					+ pref1 + "intPage=" + "\" + document.all.intPage.value;"
					+ "document.forms[0].submit();}\n");
			pageStr.append("</script>");
		} else {
			pageStr.append("&nbsp;");
		}
		return pageStr.toString();
	}*/
	

    public String getPageInfoStr1(Vector pageInfo, int intPage, String url,
            String param,int intPageSize1) {
        if (param == null || param.equals("")) {
            param = "p=1";
        }
        String pref1 = "&";
        String pref;
        // ����-1�Ǳ�ʾû�г��ֹ�"?"
        if (url.indexOf("?") > -1) { // ��ǰurl���в���
            pref = "&";
        } else {
            pref = "?";
        }
        if (intPage == 0) {
            intPage = 1;
        }
        // pageStr��ŷ�ҳ��Ϣ
        StringBuffer pageStr = new StringBuffer();//��pageheadStr��pagemidStr��pageendStrƴ������
        StringBuffer pageheadStr = new StringBuffer();//�洢����һҳ������һҳ��ͼ��λ��
        StringBuffer pagemidStr = new StringBuffer();//�洢���� xx ����¼ �� xx ҳ ��ǰ�� xx ҳ��ͼ��λ��
        StringBuffer pageendStr = new StringBuffer();//�洢����һҳ�������һҳ��ͼ��λ��
        // ������Ϣȫ������
        if (pageInfo.size() == 5) {
        	pagemidStr.append("<span></span>");
        	pagemidStr.append("�� " + pageInfo.elementAt(0).toString() + " ����¼");
        	pagemidStr.append(" �� " + pageInfo.elementAt(1).toString() + " ҳ");
        	pagemidStr.append(" ��ǰ�� " + (intPage) + " ҳ");
        	pagemidStr.append("<span></span>");
            int tal = Integer.parseInt(pageInfo.elementAt(0).toString());
            int cur = Integer.parseInt(pageInfo.elementAt(2).toString());
            int pre = Integer.parseInt(pageInfo.elementAt(3).toString());
            int nex = Integer.parseInt(pageInfo.elementAt(4).toString());
            // �������Ȳ�������ʱ����Ϊ�ڶ�ҳ���һ����¼��ʧ���޷����ص�һҳ��
            // ������������"��һҳ",����������Ƚ�����,����ɾ����һ����¼�󷵻صڶ�ҳ,���ǵڶ�ҳ�Ѿ�û��������,��ʱҲҪ��ʾ��һҳ������,����ͷ��ز�����һҳ��
            if (((pre == 0 || (pre >= cur)) && ((intPage - 1)
                    * intPageSize1 + 1 <= tal))
                    || pageInfo.elementAt(0).toString().equals("0")) {
            	pageheadStr.append(" <span class=\"p_first01\"></span>");//����һҳ�����ɵ�
            	pageheadStr.append(" <span class=\"p_prev01\"></span>");//����һҳ�����ɵ�
            } else {
            	pageheadStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + 1 + "';goPage()\"><span class=\"p_first\"></span></a>");//����һҳ���ɵ�
            	
            	pageheadStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pre + "';goPage()\"><span class=\"p_prev\"></span></a>");//����һҳ���ɵ�
            }

            if (nex == 0 || (cur >= nex)) {
            	pageendStr.append(" <span class=\"p_last01\"></span>");//����һҳ�����ɵ�
            	pageendStr.append(" <span class=\"p_next01\"></span>");//�����һҳ�����ɵ�
            } else {
            	pageendStr
                		.append(" <a href=\"javaScript:document.all.intPage.value='"
                        + nex + "';goPage()\"><span class=\"p_next\"></span></a>");//����һҳ���ɵ�
            	
            	pageendStr
                        .append(" <a href=\"javaScript:document.all.intPage.value='"
                                + pageInfo.elementAt(1) + "';goPage()\"><span class=\"p_last\"></span></a>");//�����һҳ���ɵ�
            }

            int totalPage = Integer.parseInt(pageInfo.elementAt(1).toString());

            // ����1000ҳ,����ʾΪ������ֵ
            if (totalPage < 1000) {
            	pageendStr
                        .append(" <span class=\"p_select\">����<select name='intPage' onChange=\"goPage()\">");

                for (int i = 1; i <= totalPage; i++) {
                    String se = (intPage == i) ? " selected " : "";
                    pageendStr.append("<option value='" + i + "'" + se + ">" + i
                            + "</option>");
                }
                if (totalPage == 0) {
                	pageendStr.append("<option value='1'>1</option>");
                }
                pageendStr.append("</select></span>");
            } else {
            	pageendStr
                        .append(" ����<input type=\"text\" size=4 class='text_white' name='intPage'>");
            	pageendStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
            }

            //
            pageendStr.append("<script language=\"javascript\">\n");
            pageendStr.append("function goPage()\n{");
            pageendStr.append(" var obj=document.all.intPage.value;");
            pageendStr
                    .append("if(isNaN(obj) || parseInt(obj)<1){ alert('��������ȷ��ҳ��,����Ϊ������!');document.all.intPage.focus();return;}");
            pageendStr.append(" if(parseInt(obj)>parseInt(" + totalPage
                    + ")){document.all.intPage.value=" + totalPage + ";}");

            pageendStr.append("document.forms[0].action=\"" + url + pref
                    + "wherefrom=trunpage&" + param + pref1 + "intPage="
                    + "\" + document.all.intPage.value;"
                    + "document.forms[0].submit();}\n");
            pageendStr.append("</script>");
            
            pageStr.append(pageheadStr);
            pageStr.append(pagemidStr);
            pageStr.append(pageendStr);
            
        } else {
            pageStr.append("&nbsp;");
        }
        return pageStr.toString();
    }
	/**aml
	 *
	 */
	public Vector getPageInfo1(int totalRow, int intPage,int intPageSize1) {
		Vector pageInfo = new Vector();
		//�ܼ�¼��
		intRowCount = totalRow;
		//��ҳ��
		intPageCount = (intRowCount + intPageSize1 - 1) / intPageSize1;
		//������ǰҳ���Ϸ�
		if (intPage > intPageCount)
			intPage = intPageCount;
		if (intPage < 1)
			intPage = 1;
		//�����ϡ���ҳ��
		int prePage = 1;
		int nextPage = intPageCount;
		if (intPage > 1)
			prePage = intPage - 1;
		if (intPage < intPageCount)
			nextPage = intPage + 1;
		//��ҳ��Ϣ����������
		pageInfo.add(new Integer(intRowCount));
		pageInfo.add(new Integer(intPageCount));
		pageInfo.add(new Integer(intPage));
		pageInfo.add(new Integer(prePage));
		pageInfo.add(new Integer(nextPage));
		return pageInfo;
	}
	//aml
	public int getStartRec1(int intPage,int intPageSize) {
		int iStartRec = 0;
		iStartRec = (intPage - 1) * intPageSize;
		return iStartRec;
	}
	
	//aml
	public boolean writeOperLog(Authorization authorization,
			SqlMapClient sqlMap, T00_operate_log t00_operate_log)
			throws Exception {
		
		LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
		String isLog = (String) sysparaMap.get("408"); 
		if("1".equals(isLog)){
		T00_operate_logDAO t00_operate_logDao =(T00_operate_logDAO)context.getBean("t00_operate_logDAO");
		this.writeOperLogEntity(authorization, t00_operate_log);
		int num = 0;
		try {
			num = t00_operate_logDao.insertT00_operate_log(sqlMap,
					t00_operate_log);

		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}

		return num > 0;
		}else		return true;
	}

	 private T00_operate_log writeOperLogEntity(Authorization authorization,
				T00_operate_log rm_operate_log)throws Exception {

			//�����û�
			rm_operate_log.setUsername(authorization.getT00_user().getUsername());
			//�����û���ʵ����
			rm_operate_log.setRealname(authorization.getT00_user().getRealname());
			//��ϵͳ����
		/*	rm_operate_log
					.setSystemkey(authorization.getT00_group().getSystemkey());*/
			Date today = DateUtils.getCurrDateTime();
			String day = DateUtils.dateToStringShort(today);
			if (day.indexOf('-') > 0) {
				day = day.substring(0, day.indexOf('-'))
						+ day.substring(day.indexOf('-') + 1);
				day = day.substring(0, day.indexOf('-'))
						+ day.substring(day.indexOf('-') + 1);
			}
			rm_operate_log.setLog_key(day
					+ this.getSequenceNextVal("T00_OPERATOR_LOGKEY"));
			//ģ�����
			//     	rm_operate_log.setModulekey(authorization.getUserRoleKeys());    	
			//ģ������
			//     	rm_operate_log.setModulename(authorization.getUserRoleNames());

			return rm_operate_log;
		}
	 
	 public String getPageInfoStr2(int listsize,int intPage, String url,
				String param) {
			String pref1 = "&";
			if(param.equals("")){
				pref1="";	
			}
			String pref;
			//����-1�Ǳ�ʾû�г��ֹ�"?"
			if (url.indexOf("?") > -1) { //��ǰurl���в���
				pref = "&";
			} else {
				pref = "?";
			}
			if (intPage <= 0) {
				intPage = 1;
			}
			//�����ϡ���ҳ��
			int pre = 1;
			int nex = intPage;
			if (intPage > 1)
				pre = intPage - 1;
			    nex = intPage + 1;
			//pageStr��ŷ�ҳ��Ϣ
			StringBuffer pageStr = new StringBuffer();
				pageStr.append(" ��ǰ�� " + (intPage) + " ҳ");
				int cur = intPage;
				//�������Ȳ�������ʱ����Ϊ�ڶ�ҳ���һ����¼��ʧ���޷����ص�һҳ��
				//������������"��һҳ",����������Ƚ�����,����ɾ����һ����¼�󷵻صڶ�ҳ,���ǵڶ�ҳ�Ѿ�û��������,��ʱҲҪ��ʾ��һҳ������,����ͷ��ز�����һҳ��
				if (cur<=1) {
					pageStr.append(" ��һҳ");
				} else {
					pageStr
							.append(" <a href=\"javaScript:document.all.intPage.value='"
									+ pre + "';goPage()\">��һҳ</a>");
				}

				if (nex == 0 || (cur >= nex)||listsize==0) {
					pageStr.append(" ��һҳ");
				} else {
					pageStr
							.append(" <a href=\"javaScript:document.all.intPage.value='"
									+ nex + "';goPage()\">��һҳ</a>");
				}

				
					pageStr
							.append(" ����<input type=\"text\" size=4 class='text_white' name='intPage'>");
					pageStr.append(" <a href=\"javaScript:goPage()\"> GO </a>");
				

				//
				pageStr.append("<script language=\"javascript\">\n");
				String alertstr="if("+listsize+"==0 && "+intPage+">0) alert(\"û�м�¼��\")";
				pageStr.append(alertstr+"\n");
				pageStr.append("function goPage()\n{");
				pageStr.append(" var obj=document.all.intPage.value;");
				pageStr
						.append("if(isNaN(obj) || parseInt(obj)<1){ alert('��������ȷ��ҳ��,����Ϊ������!');document.all.intPage.focus();return;}");
				
				pageStr.append("document.forms[0].action=\"" + url + pref + param
						+ pref1 + "intPage=" + "\" + document.all.intPage.value;"
						+ "document.forms[0].submit();}\n");
				pageStr.append("</script>");
			
			return pageStr.toString();
		}
	 
	 	/**
		 * ��Map����ת����Json��ʽ�ַ���
		 * 
		 * @return
		 */
		protected String convertMapToJson(Map<String, String> map) {

			if (map == null || map.isEmpty()) {
				return StringUtils.EMPTY;
			}
			List<Map<String, String>> codeList = new ArrayList<Map<String, String>>();
			for (String key : map.keySet()) {
				Map<String, String> convertMap = new HashMap<String, String>();
				convertMap.put("key", key);
				convertMap.put("value", key + "-" + map.get(key));
				codeList.add(convertMap);
			}
			return new Gson().toJson(codeList);
		}
}
