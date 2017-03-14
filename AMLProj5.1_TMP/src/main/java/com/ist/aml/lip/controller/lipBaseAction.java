package com.ist.aml.lip.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.ist.aml.lip.dto.BaseDTO;
import com.ist.aml.lip.dto.T00_list_cols;
import com.ist.aml.lip.dto.T00_list_table;
import com.ist.common.base.BaseAction;

import com.ist.common.jcs.CatchManager;
import com.ist.util.LipConstant;

public class lipBaseAction extends BaseAction {

	public lipBaseAction() {
		// TODO Auto-generated constructor stub
	}
    /**
     * ȡ�Ŀ��Ӧ���ֶε�MAP
     * @param dbtype ����ϵͳ�Ŀ����ͣ���������LIST�����Զ��壨PR_LIST��������ADUIT����
     * @return ��������ӦMAP ��KEY Ϊtablecode+���ͣ�SHOW,COND,SORT,ADD,MOD��CONDDISP��SYN��KEY_NAME��KEY_CATE����
     */
    public Map getT00_list_colsMap(String dbtype)
    {
    	
    	Map map=new LinkedHashMap();
    	if(dbtype==null)
    	{
    		return map;
    	}
    	
    	List colList=new ArrayList();
    	if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_CUL)){
    		 colList = cm.getListFromCache("t00_list_cols_listForPr_audit");
    	}else if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_LSE)){
    		 colList = cm.getListFromCache("t00_list_cols_listForList");
    	}else if(dbtype.equalsIgnoreCase(LipConstant.TABLE_EDN_SEL)){
    		colList = cm.getListFromCache("t00_list_cols_listForAudit");
    	}else{
    		return map;
    	}
    	List  tabList = cm.getListFromCache("t00_list_table_list");
    	Iterator tabIter=tabList.iterator();
    	
    	while(tabIter.hasNext())
    	{
    		T00_list_table table=(T00_list_table)tabIter.next();
    		String tablecode_tab=table.getTablecode();
    		Iterator colIter=colList.iterator();
    		List condList=new ArrayList();//��ѯ����
    		List showList=new ArrayList();//�б���ʾ
    		List sortList=new ArrayList();//����
    		List addList=new ArrayList();//���
    		List adddispList=new ArrayList();//��ӽ�����ʾ��ʽ��������Ͷ�λ������ı���)
    		List modList=new ArrayList();//�޸�
    		List synList=new ArrayList();//ͬ��
    		List conddispList=new ArrayList();//��ѯ������ʾ��ʽ��������Ͷ�λ)   		
    		Map keyNameMap=new LinkedHashMap();//colkey �� colname ��MAP
    		Map keyCateMap=new LinkedHashMap();//colkey �� ������ ��map ����ת��
    		while(colIter.hasNext())
    		{
    			T00_list_cols col=(T00_list_cols)colIter.next();
    			String tablecode_col=col.getTablecode();//����
    			String cond=col.getIscond();//��ѯ����
    			String show=col.getIsshow();//�б���ʾ
    			String sort=col.getIssort();//����
    			String add=col.getIsaddinfo();//���
    			String adddisp=col.getAdddisp();//��ӽ�����ʾ��ʽ
    			String mod=col.getIsupdinfo();//�޸�
    			String conddisp=col.getConddisp();//��ѯ��������ʾ��ʽ 
    			String condtabkey=col.getCondtabkey();//����keyֵ
    			String serverdb=col.getIsserverdb();//�ڷ������⣬����ͬ��
    			if(tablecode_tab.equals(tablecode_col)){
    			
					if(cond.equals(LipConstant.STAUTS_YES)){
						condList.add(col);
					}
					if(show.equals(LipConstant.STAUTS_YES)){
						showList.add(col);
					}
					if(sort.equals(LipConstant.STAUTS_YES)){
						sortList.add(col);
					}
					if(add.equals(LipConstant.STAUTS_YES)){
						addList.add(col);
					}
					if(adddisp.equalsIgnoreCase(LipConstant.ADD_DISP2)||adddisp.equalsIgnoreCase(LipConstant.ADD_DISP3)||adddisp.equalsIgnoreCase(LipConstant.ADD_DISP5)){
						adddispList.add(col);
					}
					//�޸�ʱ��ʾ���ֶ� �ǽ�����������ֶεĻ�����
					if(add.equals(LipConstant.STAUTS_YES)&&mod.equals(LipConstant.STAUTS_YES)){
						modList.add(col);
					}
					if(serverdb.equals(LipConstant.STAUTS_YES)){
						synList.add(col);
					}
					//��ѯ��������ʾ��ʽΪ�������λ
					if(conddisp.equalsIgnoreCase(LipConstant.ADD_DISP2)||conddisp.equalsIgnoreCase(LipConstant.ADD_DISP3)){
						conddispList.add(col);
					}
					if(condtabkey!=null&&!"".equals(condtabkey)){
						keyCateMap.put(col.getColkey().toUpperCase(), condtabkey.trim());
					}
					
					keyNameMap.put(col.getColkey().toUpperCase(), col.getColname());
					
					
    			}
    			
    			
    		}
    		map.put(tablecode_tab+LipConstant.PAGE_COND, condList);
    		map.put(tablecode_tab+LipConstant.PAGE_SHOW, showList);
    		map.put(tablecode_tab+LipConstant.PAGE_SORT, sortList);
    		map.put(tablecode_tab+LipConstant.PAGE_ADD, addList);
    		map.put(tablecode_tab+LipConstant.PAGE_ADDDISP, adddispList);
    		map.put(tablecode_tab+LipConstant.PAGE_MOD, modList);
    		map.put(tablecode_tab+LipConstant.PAGE_SYN, synList);
    		map.put(tablecode_tab+LipConstant.PAGE_CONDDISP, conddispList);
    		map.put(tablecode_tab+LipConstant.KEY_NAME, keyNameMap);
    		map.put(tablecode_tab+LipConstant.KEY_CATE, keyCateMap);
    	}
    	return map;
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
        String sessionID = searchObj.getClass().getName() + "_searchObj";
        session.setAttribute(sessionID, searchObj);
    }
}
