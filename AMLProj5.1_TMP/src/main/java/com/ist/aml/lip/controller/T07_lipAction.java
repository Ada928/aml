
package com.ist.aml.lip.controller;

/**
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: �����������ڿƼ��������޹�˾
 * </p>
 * 
 * @author �з���
 * @version 1.0
 */

import java.io.File;
import java.io.FileReader;
import java.io.InputStream;
import java.io.LineNumberReader;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.log4j.Logger;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.apache.struts.upload.FormFile;

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.lip.dao.T07_lipDAO;
import com.ist.aml.lip.dto.BaseDTO;
import com.ist.aml.lip.dto.T00_list_cols;
import com.ist.aml.lip.dto.T10_pr_audit;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.LipConstant;
import com.ist.util.StringUtils;
import com.ist.util.ZipUtils;
public class T07_lipAction extends lipBaseAction {
	private static Logger logger = LogUtils.getLogger(T07_lipAction.class
			.getName());

	/**
	 * Action
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
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		
		//���·�����������ҳ��
		if ("addTableData".equalsIgnoreCase(myaction)) {
			myforward = performImportListData(mapping, form, request,
					response);
		}
		 //���·����������붯��
		else if ("addTableDataDO".equalsIgnoreCase(myaction)) {
			myforward = performAddTableDataDo(mapping, form, request,
					response);
		}
		else if ("searchT20_list_all".equalsIgnoreCase(myaction)) {
			myforward = performSearchT20_list_all(mapping, form, request, response);
		}
		// �������
		else if ("searchT20_list_type".equalsIgnoreCase(myaction)) {
				myforward = performSearchT20_list_type(mapping, form, request, response);
		}
		else if ("getT20_list_details".equalsIgnoreCase(myaction)) {
			myforward = performGetT20_list_details(mapping, form, request, response);
		}
		return myforward;

	}


	
	public ActionForward performImportListData(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			LinkedHashMap tablemap = cm.getMapFromCache("t00_table_listForMap");
			request.setAttribute("tableMap",this.getOptionsListByMap(tablemap,null,false));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		
		return actionMapping.findForward("success");
	}
	
	public ActionForward performAddTableDataDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		ActionErrors errors = new ActionErrors();
		FileUpload fileUpload = new FileUpload();
		fileUpload.setSysConfig(sysConfig);
		String result = "";
        String saveflag="0";
		try {
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			T00_list_tableActionForm form = (T00_list_tableActionForm) actionForm;
			FormFile filename=form.getFilename();
			String fname=filename.getFileName();
			
			String attachDir = sysConfig.getProperty("data.import");
			
			if (fname.equals("") || fname == null) {
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "�ļ���Ϊ��"));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}else{
				if(!fname.substring(0, 5).equals(form.getTablecode())){
					errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
							"error.common", "��������ݺ�ѡ�е������ⲻ��"));
					saveMessages(request, errors);
					return actionMapping.findForward("failure");
				}
			}
			String tablecode=form.getTablecode();
			String newFilePathAndPath=this.uplodeFile(fname, filename, tablecode);
//			 ȡ�õ�ǰ�û�
			Authorization auth = this.getAuthorization(request);
			String create_user = auth.getT00_user().getUsername();
			if (fname != null && fname.toUpperCase().endsWith(".ZIP")) {
				// 1.�⿪���ݰ����������ݰ��еı��ķŵ������ݰ���ͬ��Ŀ¼��
				ZipUtils zipUtils = new ZipUtils();
				String newFilePath = newFilePathAndPath.substring(0,
						newFilePathAndPath.indexOf(fname) - 1);
				String TXTPath = attachDir + newFilePath;
				File FDfile = new File(TXTPath);
				zipUtils.unzip(attachDir + newFilePathAndPath, TXTPath);
				// 2.������Ŀ¼�����е�XML���ģ���һ������
				if (FDfile.isDirectory()){
					File[] FDXMLfiles = FDfile.listFiles();
					for (int m = 0; m < FDXMLfiles.length; m++) {
						// ȡ�ø�txt�ļ��ľ���·��
						String TXTfileName = attachDir+newFilePath + File.separator
								+ FDXMLfiles[m].getName();
						if (TXTfileName.toUpperCase().endsWith(".TXT")) {
							String fileName = FDXMLfiles[m].getName();
							this.operatorFile(fileName, TXTfileName, form.getTablecode(), create_user);
						}
					}
					
				}
			} else if (fname != null && fname.toUpperCase().endsWith(".TXT")) {
				// ����xml,���������ȷ���򷵻ػ�ִ�ţ����򣬷��ش�����
				String filepathname=attachDir+newFilePathAndPath;
				this.operatorFile(fname, filepathname, form.getTablecode(), create_user);
				
			} else {
				result = "���ļ��������ݰ������ı������ܽ�����";
			}

			// ���result�Ǹ�ֵ�����׳��쳣
			if (result.indexOf("-") == 0) {
				throw new Exception("");
			}
			saveflag="1";
			request.setAttribute("title_flag", "1");
			request.setAttribute("newsearchflag", "1");
			sqlMap.commitTransaction();
			
		} catch (Exception e) {
			saveflag="0";
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			
			return actionMapping.findForward("failure");

		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		request.setAttribute("saveflag", "1");
		return actionMapping.findForward("success");
	}
	
	public String  uplodeFile(String fname,FormFile file,String tablecode) throws Exception{
		InputStream streamIn = null;
		String newFilePathAndPath =""; 
		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			 streamIn = file.getInputStream();
			String path ="importtxt"+File.separator+ tablecode;
			// �����ļ�����Ŀ¼
			 newFilePathAndPath = fileUpload.uploadFile(fname, streamIn,
					path, "day");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
		}
		return  newFilePathAndPath;
	}
	
	public void operatorFile(String fileName,String TXTfileName,String tablecode,String create_user)throws Exception{
		T07_lipDAO t10_pr_auditDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String version=fileName.substring(0,17);//�汾��
		String up_flag=fileName.substring(24,25);//���±�־
		String list_source=fileName.substring(5,7);//��Դ
		
		//��ѯ�ð汾�������Ƿ��Ѿ�����
		T10_pr_audit t10_pr_audit=new T10_pr_audit();
		t10_pr_audit.setList_type(tablecode);
		t10_pr_audit.setList_source(String.valueOf(Integer.parseInt(list_source)));
		String maxversion=t10_pr_auditDAO.getT10_pr_auditVerson(sqlMap, t10_pr_audit);
		String flag="";
		if(maxversion==null || maxversion.equals(""))
			maxversion=tablecode+list_source+"0000000000";
		if(up_flag.equals("0")){
			if(Float.parseFloat(version.substring(7))==(Float.parseFloat(maxversion.substring(7))+1)){
				flag="1";
			}
		}else{
			if(Float.parseFloat(version.substring(7))>Float.parseFloat(maxversion.substring(7))){
				flag="1";
			}
		}
		if(flag.equals("1")){
			//����汾��Ϣ
			String plots=fileName.substring(17,24);//����
			t10_pr_audit.setVersion(version);
			t10_pr_audit.setPlots(String.valueOf(Integer.parseInt(plots)));
			t10_pr_audit.setUp_flag(up_flag);
			t10_pr_audit.setIscheck("1");
			t10_pr_audit.setApp_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
			t10_pr_audit.setApp_user(create_user);
			t10_pr_audit.setUpload_user(create_user);
			t10_pr_audit.setUpload_dt(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
			int count=t10_pr_auditDAO.insertT10_pr_audit(sqlMap, t10_pr_audit);
             //	���ļ��е����ݵ��뵽��ʱ��
			ArrayList list=this.getInsertT10_pr_auditSql(TXTfileName, tablecode, Integer.parseInt(plots), version);
			if(list.size()>0){
				this.bathExecSql(sqlMap, list,200);
			}
		}
	}
	
	public void bathExecSql(SqlMapClient sqlMap,ArrayList insertList,int length)throws Exception{
    		double totalpate=Math.ceil((double)insertList.size()/(double)length);
    		for(int i=0;i<totalpate;i++){
    			sqlMap.startBatch();
    			int n=(int)totalpate-1;
    			if(i!=n){
    			for(int j=0;j<length;j++){
    			String execsql=(String)insertList.get(i*length+j);
    			 sqlMap.update("getValueSQLInt", execsql); 
    			}}else{
    				for(int k=n*length;k<insertList.size();k++){
    					String execsql=(String)insertList.get(k);
    					System.out.println("sql:"+k+":;"+execsql);
    					 sqlMap.update("getValueSQLInt", execsql); 	
    				}
    			}
    			 sqlMap.executeBatch();
    			 sqlMap.commitTransaction();
    		}
    		
    	}
	
	public ArrayList getInsertT10_pr_auditSql(String filename,String tablecode,int recondcount,String version) throws Exception {
		ArrayList list=new ArrayList();
		 FileReader fr=null;
         LineNumberReader lr=null;
       try{
    	    fr=new FileReader(filename);
            lr=new LineNumberReader(fr,512);
         int i=0;
         String titlestr="";
         String valuestr="";
         while(i<=recondcount+1){
             String str=lr.readLine(); 
             if(str==null) break;
            	if(i==0){
            		String[] tstrs=str.split("#") ;
                	for(int j=0;j<tstrs.length;j++){
                	  if(i==0){
                		titlestr=titlestr+","+tstrs[j];
                	  }
                	}
            	}else{
            		valuestr=valuestr+str.trim();
            	}
            	if(i==0&&!titlestr.equals("")){
            		titlestr=titlestr.substring(1);
            		titlestr="insert into T20_"+tablecode+"_pr_list ("+titlestr+",party_id,version) values(";
            	   i++;
            	}else{
            	if(str.endsWith("';")){	
            		valuestr=valuestr.substring(0, valuestr.length()-1);
            	String party_id ="PR_LIST_"+ this.getSequenceNextVal("SEQ_T20_"+tablecode+ "_" + "PR_LIST");	
            	valuestr=titlestr+valuestr+",'"+party_id+"','"+version+"')";
                list.add(valuestr);
            	valuestr="";
            	 i++;
            	}
              }
            
             
         }
       }catch(Exception e){
    	   e.printStackTrace();
       }finally{
    	   if(lr!=null){
    		   lr.close();  
    	   }
    	   if(fr!=null){
    		   fr.close();
    	   }
       }
        
       
	   return list;   
	}
	
	public ActionForward performSearchT20_list_all(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String tablecode = request.getParameter("tablecode");
		String tablename = LipConstant.TABLE_PRE + tablecode + "_pr_list";
		
		List resultList = null;
		List showColList = null;

		try {
			/**ȡ����������ĸ��ֹ���t00_list_cols��list*/
			Map listMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			
			/** ȡ������ʾ�б� */
			 showColList = (List)listMap.get(tablecode+LipConstant.PAGE_SHOW);
			
			/** ȡ�������б� */
			StringBuffer sql = new StringBuffer();
			//sql select ������� 
			String colkeys = t00_list_colsDAO.getT00_list_cols_colkeys_t1(showColList);
			// ��ѯ����
			//String cond = t00_list_colsDAO.getWhereCondition(request);
			StringBuffer cond=new StringBuffer();
			cond.append(" and (");
			if("2".equals(request.getParameter("newsearchflag")))
			{
				cond.append(" 1<0) ");
			}else
			{
			String value=(StringUtils.null2String(request.getParameter("search_all"))).toUpperCase();
			value = URLDecoder.decode(value, "utf-8");

			Map colkeyMap= (Map)listMap.get(request.getParameter("tablecode")+LipConstant.KEY_NAME);
			
			Iterator iter= colkeyMap.keySet().iterator();
			while(iter.hasNext())
			{
				String colkey=(String)iter.next();
				
				cond.append(" upper(t1."+colkey+") like '%"+value+"%' or");
				
			}
			if(cond.toString().endsWith("or"))
			{
				cond.delete(cond.length()-2,cond.length());
			}
			cond.append(")");
			} 
			
			sql.append("SELECT PARTY_ID,"+colkeys);
			sql.append( " FROM " + tablename+" t1 ");
			sql.append(" WHERE  1>0 " + cond);
			
			//��ҳ�еļ�¼����
			String sql_count = "SELECT COUNT(*) FROM " + tablename+" t1 WHERE 1>0 " + cond;
			
			String url="";
			
			if("main".equals(request.getParameter("type")))
			{
				url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do?type=main&tablecode="+ form.getTablecode();
			}else
			{
				url = request.getContextPath() + "/list"
				+ actionMapping.getPath() + ".do?tablecode="+ form.getTablecode();
			}
			T00_list_cols t00_list_cols = new T00_list_cols();
			
			t00_list_cols.setSql(sql.toString());
			t00_list_cols.setSql_count(sql_count);
			t00_list_cols = (T00_list_cols) this.getSearchObjectForDSQL(t00_list_cols, request, form, sql_count, url);
			t00_list_cols.setSearch_all(form.getSearch_all());
			
			// ���Ի��Ĳ�ѯ����
			if (t00_list_cols.getNewsearchflag().equals("1")) {
				saveSearchObject(t00_list_cols, request);
				
			Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
			//��ҳȡ���б� ���� ת��
			resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
					sql.toString(), this.getStartRec(t00_list_cols.getIntPage()),
					this.getIntPageSize(),keyCateMap);
			}else
			{
				form.setSearch_all(t00_list_cols.getSearch_all());
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				//��ҳȡ���б� ���� ת��
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						t00_list_cols.getSql(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		if (resultList == null)
			resultList = new ArrayList();	
		if (showColList == null)
			showColList = new ArrayList();
		request.setAttribute("resultList", resultList);		
		request.setAttribute("showColList", showColList);	
		request.setAttribute("tablecode", form.getTablecode());	
		LinkedHashMap tableMap = cm.getMapFromCache("t00_table_listForMap");
		if(tableMap.containsKey(tablecode)){
			request.setAttribute("title", (String)tableMap.get(tablecode));
			}
		
		
		if("main".equals(request.getParameter("type")))
		{
			return actionMapping.findForward("success2");
		}
		return actionMapping.findForward("success");
	}
	
	public BaseDTO getSearchObjectForDSQL(BaseDTO searchObj,
			HttpServletRequest request, ActionForm form, String sql_count,
			String url) throws Exception {
		HttpSession session = request.getSession();
		String newsearchflag = StringUtils
				.null2String(request.getParameter("newsearchflag"));
		searchObj.setNewsearchflag(newsearchflag);
		//
		int intPage = 1;
		// ��������
		String sessionID = searchObj.getClass().getName() + "_searchObj";

		String wherefrom = StringUtils.null2String(request
				.getParameter("wherefrom"));

		if (newsearchflag.equals("1")) {// �µĲ�ѯ
			// if(!wherefrom.equals("trunpage")){//�µĲ�ѯ
			PropertyUtils.copyProperties(searchObj, form);
			// ���β�ѯ��ҳ��
			Integer iCount = (Integer) sqlMap.queryForObject("getValueSQLInt",
					sql_count);
			int totalRow = iCount.intValue();
			searchObj.setTotalRow(totalRow);
			// =====

			// =====
			//����ѯ
			} else if (newsearchflag.equals("2")){
			
			}
			
			else {// ��ҳ
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
				Integer iCount = (Integer) sqlMap.queryForObject("getValueSQLInt",
						((T00_list_cols)searchObj).getSql_count());
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
	 *  �������
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
	public ActionForward performSearchT20_list_type(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		
		ActionErrors errors = new ActionErrors();
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		String tablecode = form.getTablecode();
		String tablename = "T20_" + tablecode + "_pr_list";
		
		List condList = null;
		List orderList = null;
		
		List showColList = null;
		List condTabKeyList = null;
		Map condTabKeyMap =new LinkedHashMap();
		Map condValueMap = new LinkedHashMap();	
		List resultList = null;

		try {
			/**ȡ����������ĸ��ֹ���t00_list_cols��list*/
			Map listMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			
			/** ȡ�ò�ѯ�����б� */			
			condList = (List)listMap.get(tablecode+LipConstant.PAGE_COND);
			if (condList == null)condList = new ArrayList();
			// ��������
			T00_list_cols order = new T00_list_cols();
			order.setColkey("ORDER_BY");
			order.setColname("����");
			condList.add(order);
			
			/** �������ò�ѯ����ֵ */
			condValueMap = t00_list_colsDAO.getWhereConditionMap(request);

			/** ȡ�ò�ѯ����Ϊ�������λ��������Ӧ�����ֵ */
			condTabKeyList = (List)listMap.get(tablecode+LipConstant.PAGE_CONDDISP);			
			condTabKeyMap = this.getCondMap(condTabKeyList);

			/** ȡ���������б� */
			orderList =(List)listMap.get(tablecode+LipConstant.PAGE_SORT); 
			Map sortColumnMap = new LinkedHashMap();
			if (orderList == null)
				orderList = new ArrayList();
			for (int i = 0; i < orderList.size(); i++) {
				T00_list_cols temp = (T00_list_cols) orderList.get(i);
				if (temp == null)
					continue;
				sortColumnMap.put(temp.getColkey(), temp.getColname());
			}
			orderList = this.getOptionsListByMap(sortColumnMap, null, true);

			/** ȡ������ʾ�б� */
			showColList = (List)listMap.get(tablecode+LipConstant.PAGE_SHOW);
			
			
			
			/** ȡ�������б� */
			
			StringBuffer sql = new StringBuffer();
			//sql select ������� 
			String colkeys = t00_list_colsDAO.getT00_list_cols_colkeys(showColList);
			// ��ѯ����
			
			String cond = t00_list_colsDAO.getWhereCondition(request);
			
			//�����µĲ�ѯ 
			if("2".equals(request.getParameter("newsearchflag"))){
				cond=" and 1<0 ";
			}
			
			// ��������� 
			String order_by = "";
			if (!StringUtils.null2String(form.getSort_type()).equals("")) {// �������Ͳ�Ϊ��
				if (!StringUtils.null2String(form.getSort_column()).equals("")) {// �����в�Ϊ��
					order_by = " order by " + form.getSort_column() + " "+ form.getSort_type();
				}
			}
			sql.append("SELECT PARTY_ID,"+colkeys);
			sql.append( " FROM " + tablename);
			sql.append(" WHERE  1>0 " + cond);	
			sql.append(order_by);
			//��ҳ�еļ�¼����
			String sql_count = "SELECT COUNT(*) FROM " + tablename+ " WHERE 1>0 " + cond;
			String url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do?tablecode="+ form.getTablecode();
			
			T00_list_cols t00_list_cols = new T00_list_cols();
			t00_list_cols.setSql(sql.toString());
			t00_list_cols.setSql_count(sql_count);
			t00_list_cols.setCondValueMap(condValueMap);
			t00_list_cols = (T00_list_cols) this.getSearchObjectForDSQL(t00_list_cols, request, form, sql_count, url);
			
			// ���Ի��Ĳ�ѯ����
			if (t00_list_cols.getNewsearchflag().equals("1")) {
				saveSearchObject(t00_list_cols, request);
			
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				//��ҳȡ���б� ���� ת��
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						sql.toString(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			else
			{
				Map keyCateMap=(Map)listMap.get(tablecode+LipConstant.KEY_CATE);
				condValueMap=t00_list_cols.getCondValueMap();
				//��ҳȡ���б� ���� ת��
				resultList = t00_list_colsDAO.getT00_list_cols_resultList(sqlMap,
						t00_list_cols.getSql(), this.getStartRec(t00_list_cols.getIntPage()),
						this.getIntPageSize(),keyCateMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if (showColList == null)
			showColList = new ArrayList();
		if (resultList == null)
			resultList = new ArrayList();
		if (orderList == null)
			orderList = new ArrayList();
		if (condList == null)
			condList = new ArrayList();
		
		request.setAttribute("sortColumnList", orderList);
		request.setAttribute("showColList", showColList);
		request.setAttribute("condList", condList);
		request.setAttribute("resultList", resultList);
		request.setAttribute("condValueMap", condValueMap);
		request.setAttribute("condTabKeyMap", condTabKeyMap);
		request.setAttribute("tablecode", form.getTablecode());
		LinkedHashMap tableMap = cm.getMapFromCache("t00_table_listForMap");
		if(tableMap.containsKey(tablecode)){
			request.setAttribute("title", (String)tableMap.get(tablecode));
			}
		
		return actionMapping.findForward("success");
	}
	
	/**
	 * ȡ�ò�ѯ����Ϊ�������λ��������Ӧ�����ֵ-����ҳ��
	 * 
	 * @param t00_list_cols_list
	 * @return
	 */
	public Map getCondMap(List t00_list_cols_list) {
		Map map = new LinkedHashMap();
		if (t00_list_cols_list == null)
			t00_list_cols_list = new ArrayList();
		for (int i = 0; i < t00_list_cols_list.size(); i++) {
			Object obj = null;
			T00_list_cols temp = (T00_list_cols) t00_list_cols_list.get(i);
			if (temp == null)
				continue;
			if (temp.getConddisp().equals(LipConstant.ADD_DISP2)) {
				try {
					
					obj = cm.getMapFromCache(temp.getCondtabkey());
				} catch (Exception e) {
					continue;
				}
			} else 
				if (temp.getConddisp().equals(LipConstant.ADD_DISP3)) {
				obj = "CATEGORYTYPE=\\'" + temp.getCondtabkey() + "\\'";
			}

			map.put(temp.getColkey(), obj);

		}
		return map;
	}
	
	/**
	 * �鿴��ϸ��Ϣ-�������������������⣩
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
	public ActionForward performGetT20_list_details(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_lipDAO t00_list_colsDAO =(T07_lipDAO)context.getBean("t10_pr_auditDAO");
		T00_list_colsActionForm form = (T00_list_colsActionForm) actionForm;
		String tablecode = form.getTablecode();
		HashMap dispMap=new LinkedHashMap();
		try {
			//���������ĸ���List��MAP
			Map auditMap=(Map)this.getT00_list_colsMap(LipConstant.TABLE_EDN_LSE);
			//���ֶ���������map			
			Map keyMap=(Map)auditMap.get(tablecode+LipConstant.KEY_NAME);
			//ȡ����ϸ��Ϣ����ʾ�е�List
			List addCol=(List)auditMap.get(tablecode+LipConstant.PAGE_ADD);
			String cols=t00_list_colsDAO.getT00_list_cols_colkeys(addCol);//ת�����ַ���
			String party_id = form.getParty_id();
			String tablename = LipConstant.TABLE_PRE + tablecode + "_"+LipConstant.TABLE_EDN_PRL ;
			StringBuffer sql_data =new StringBuffer("select "+cols +" from "+tablename+" where party_id='"+party_id +"'");
			List temp=(List)sqlMap.queryForList("getT00_list_cols_resultList", sql_data.toString());
			Map dataMap=null;
			//���ֶ������ݵ�Map
			if(temp.size()>0){
				dataMap=(Map)temp.get(0);
			}else
			{
				errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
						"error.common", "��ѯ��ϸ��Ϣʧ�ܣ�"));
				saveMessages(request, errors);
				return actionMapping.findForward("failure");
			}
			
			//ȡ��������Ҫת����ֶ�
			Map valMap=(Map)auditMap.get(tablecode+LipConstant.KEY_CATE);
			
			
			Iterator iter=dataMap.keySet().iterator();
			while(iter.hasNext())
			{
				String key=(String)iter.next();
				String value=(String)dataMap.get(key)==null?"":(String)dataMap.get(key);
				//������MAP��VALUEת��
				if(valMap.containsKey(key))					
				{
					String dicttype=(String)valMap.get(key);
					LinkedHashMap categoryMap = cm.getMapFromCache(dicttype);
					value=(String)categoryMap.get(value)==null?value:(String)categoryMap.get(value);
					
				}
				//������MAP��keyת�������������ģ�
				if(keyMap.containsKey(key))
				{
					key=(String)keyMap.get(key);
				}
				
				
				dispMap.put(key, value);
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("dispMap", dispMap);
		return actionMapping.findForward("success");
	}
}
