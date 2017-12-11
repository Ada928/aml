/**
 * Create by makecode program v2.0
 * ����             ���� 		����
 * 2006-12-27   ����		����
 */

package com.ist.aml.report.controller;

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

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.pbcreport.dao.T07_report08DAO;
import com.ist.aml.report.bo.T07_FlowBo;
import com.ist.aml.report.dao.T07_app_movefateDAO;
import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dao.T07_flowDAO;
import com.ist.aml.report.dao.T47_transactionDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_app_movefate;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.report.dto.T07_case_transaction;
import com.ist.aml.report.dto.T07_n_move;
import com.ist.aml.report.dto.T07_n_task;
import com.ist.aml.report.dto.T07_node;
import com.ist.aml.report.dto.T07_post_operator;
import com.ist.aml.report.dto.T07_swith;
import com.ist.aml.report.dto.WorkBench;
import com.ist.bmp.hpom.bo.SetOnlineTask;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_flowAction extends BaseAction {

	/**
	 * Actionִ�����
	 * 
	 * @param mapping
	 *            ActionMapping
	 * @param form
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
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;// ��ѯ����

		// ��ѯ�����б���
		else if ("getT07_flowList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_flowList(mapping, form, request, response);
		}
		else if ("getT07_flowCheckList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_flowCheckList(mapping, form, request, response);
		}
	
		// ��ѯ����̨���
		else if ("getT07_workbenchList".equalsIgnoreCase(myaction)) {
			myforward = getT07_workbenchList(mapping, form, request, response);
		}
		// �����ύ��ť����ǰУ��
		else if ("verify_T07_operDo".equalsIgnoreCase(myaction)) {
			myforward = performVerifyT07_operDo(mapping, form, request, response);
		}
		// �����ύ��ť����
		else if ("ad_dT07_operDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_operDo(mapping, form, request, response);
		}

		// �޸İ���״̬
		else if ("modifyT07_appsatusDo".equalsIgnoreCase(myaction)) {
			myforward = modifyT07_appsatusDo(mapping, form, request, response);
		}
		// �޸İ���״̬
		else if ("bathmodifyT07_appsatusDo".equalsIgnoreCase(myaction)) {
			myforward = bathmodifyT07_appsatusDo(mapping, form, request,
					response);
		}
		else if ("bathMakeReportDo".equalsIgnoreCase(myaction)) {
			myforward = bathMakeReportDo(mapping, form, request,
					response);
		}

		//��֤���а���
		else if ("validate_all_case".equalsIgnoreCase(myaction)) {
			myforward = performValidate_all_case(mapping, form, request, response);
		}
		// ��ת����Ҫ��ɹ���ҳ��
		else if ("searchT07_taskDo".equalsIgnoreCase(myaction)) {
			myforward = searchT07_taskDo(mapping, form, request, response);
		}
		return myforward;

	}

	
	

	/**
	 * ������ 12��28 ȡ�ø�λ��Ӧ�������б�
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
	public ActionForward performGetT07_flowList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_flowList = new ArrayList();
		String pageInfo = "";
		
		T07_flowDAO t07_flowDAO =(T07_flowDAO)context.getBean("t07_flowDAO");
		T07_post_operator post_operator = new T07_post_operator();
		try {
			T07_post_operatorActionForm form = (T07_post_operatorActionForm) actionForm;
		  
			session.removeAttribute("credittask");// ���������Ϣ
			session.removeAttribute("t07_case_application");// ����������Ϣ
			session.removeAttribute("workbench");// ����̨��Ϣ
		  
		
			// ��ȡ��ѯҳ�������б���Ϣ
	
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			request.setAttribute("is_white", sysparaMap.get("303"));
			request.setAttribute("is_curr", sysparaMap.get("304"));
			request.setAttribute("is_staff", sysparaMap.get("254"));
			if("".equals(sysparaMap.get("251"))||sysparaMap.get("251")==null)request.setAttribute("is_grey", "0"); 
			else request.setAttribute("is_grey", sysparaMap.get("251"));
			
			
			
			
			
			
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");// ��������
			
			LinkedHashMap postMap = cm.getMapFromCache("post");
			request.setAttribute("postMap", this.getOptionsListByMap(postMap,null, true));
			
//			LinkedHashMap date_status_cdMap = cm.getMapFromCache("date_status");
//			request.setAttribute("date_status_cdMap", this.getOptionsListByMap(
//					date_status_cdMap,null, true)); 
			//�������ʣ��˹����� 2��ϵͳɸѡ
			String date_status_str=cm.getMapFromCacheToStr("date_status", "date_status_cd", form.getDate_status_cd(),"", true);
			request.setAttribute("date_status_str", date_status_str);
			
			 String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true); //�ͻ�����
			 request.setAttribute("party_class_str", party_class_str);
			
			 //������Դ
			 LinkedHashMap sourceMap = cm.getMapFromCache("case_source");
			 request.setAttribute("sourceMap", this.getOptionsListByMap(sourceMap,null, true));
			 request.setAttribute("experi", sysparaMap.get("800"));
			
//			LinkedHashMap validateMap = cm.getMapFromCache("caserecodestatus"); //��֤״̬
//			request.setAttribute("validateMap", this.getOptionsListByMap(validateMap,null, true)); 
			
			LinkedHashMap staffflagMap = cm.getMapFromCache("yesNo"); //�Ƿ�Ա���ͻ�
			request.setAttribute("staffflagMap", this.getOptionsListByMap(staffflagMap,null, true)); 
			/*LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");
			request.setAttribute("ssdgMap", this.getOptionsListByMap(
					ssdgMap, null, true));  //���ɳ̶�
		
			LinkedHashMap stateMap=cm.getMapFromCache("casestatus1");//����״̬
					request.setAttribute("stateMap", this.getOptionsListByMap(
							stateMap, null, true));
						*/
			
			//301�����ر��Ͳ����Ƿ��߰�������
			Map notinMap1 = new HashMap();
			Map notinMap2 = new HashMap();
			String kind_type="0";
			if("0".equals(sysparaMap.get("301"))){
				notinMap1.put("R", "�ر�");
				notinMap1.put("I", "����");
				notinMap2.put("R", "�ر�");
				notinMap2.put("I", "����");
				kind_type="1";
			} 
			
			
			String cast_type=(String)request.getParameter("cast_type");
			if("1".equals(cast_type)){
				if("0".equals(sysparaMap.get("300"))){
					notinMap1.put("N", "����");
					notinMap1.put("A", "����");
					kind_type=kind_type+"1";
				}
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap,notinMap1, true));
			}else{
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap,notinMap2, true));
			}
			
			if(form.getCase_kind() == null ||"".equals(form.getCase_kind())){
				form.setCase_kind(kind_type);
			} 
			

				if(form.getCast_type() != null && !form.getCast_type().equals("") ){
					
				}else if("1".equals((String)request.getParameter("cast_type"))){
					form.setCast_type((String)request.getParameter("cast_type"));
				}else form.setCast_type("2");

			// �Ƿ������
			LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");
			String yesNo_str = "";
			if("0".equals(sysparaMap.get("303"))){
				Map notinMap = new HashMap();
				notinMap.put("1", "��");
				request.setAttribute("is_menuMap", this.getOptionsListByMap(
						is_menuMap, notinMap, false));
			}else{
				request.setAttribute("is_menuMap", this.getOptionsListByMap(
						is_menuMap, null, true));
			}
			//�Ƿ������
//			yesNo_str=cm.getMapFromCacheToStr("yesNo", "is_menu", form.getIs_menu(),"", true);
//			request.setAttribute("yesNo_str", yesNo_str);
			 
		
			
			// ��֯�û������Ļ���ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();
			
			
            
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			
			if ("1".equals(newsearchflag)) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(post_operator, form);
				
				post_operator.setUsername(auth.getT00_user().getUsername());
				post_operator.setPost_des(auth.getPostStr());
				
//				�ų��İ����Ƿ���Ҫ��ˡ������жϣ������Ҫ��ˡ�����������Ҫ�޸���ת�����ų���������һ���ڵ���Ϣ 2011.05.12
				if("1".equals(sysparaMap.get("305"))){ 
				    post_operator.setPost_flag("1");
				}

				intPage = 1;
				post_operator.setIntpage(intPage);
				session.removeAttribute("t07_flowSearchObj");

				if (form.getCase_date_start_disp() != null
						&& !"".equals(form.getCase_date_start_disp())) {
					post_operator.setCase_date_start(DateUtils
							.stringToDateShort(form.getCase_date_start_disp()));// ������ʼʱ��
				}
				if (form.getCase_date_end_disp() != null
						&& !"".equals(form.getCase_date_end_disp())) {
					post_operator.setCase_date_end(DateUtils.stringToDateShort(form
							.getCase_date_end_disp()));// ��������ʱ��
				}
				session.setAttribute("t07_flowSearchObj", post_operator);
			} else {// ��ҳ
				post_operator = (T07_post_operator) session
						.getAttribute("t07_flowSearchObj");
				if (post_operator == null) {
					post_operator = new T07_post_operator();
				}
				if (intPage != 0)
					post_operator.setIntpage(intPage);
				if ("2".equals(newsearchflag)) {
					intPage = post_operator.getIntpage();
				}
			}
			
			post_operator.setApp_org_id(org_id);// ����ID
			if ("1".equals(newsearchflag) || intPage != 0) {
				t07_flowList = t07_flowDAO.getT07_flowList(sqlMap,
						post_operator, this.getStartRec(post_operator
								.getIntpage()), this.getIntPageSize());
				int totalRow = t07_flowDAO.getT07_flowListCount(sqlMap,
						post_operator);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, post_operator
						.getIntpage(), url, "");
				MyBeanUtils.copyBean2Bean(form, post_operator);
			}
			
			 String casetype_str=cm.getMapFromCacheToStr("casetype", "cast_type", form.getCast_type(),"", false); //��������
			 request.setAttribute("casetype_str", casetype_str);
			 
			//��֤״̬
				String validate_ind_str=cm.getMapFromCacheToStr("caserecodestatus", "validate_ind", form.getValidate_ind(),"", true);
				request.setAttribute("validate_ind_str", validate_ind_str);
				// ����
				String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true); 
				request.setAttribute("curr_cd_str", curr_cd_str);
			 
			request.setAttribute("casekind", form.getCase_kind());
			
			if(auth.getPostStr() == null || auth.getPostStr().equals("")){
				request.setAttribute("post_id", form.getPost_id());
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","���û��޸�λ��Ϣ���޷����а������������������û��ĸ�λ��Ϣ���ٽ��в�����"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			//�ж��Ƿ������ʾ
			isHighlight(t07_flowList,request);		
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_flowList", t07_flowList);

		return actionMapping.findForward("success");
	}
	
	public void isHighlight(ArrayList t07_flowList,HttpServletRequest request)throws Exception{
		
		//�ж��Ƿ������ʾ
		String app_numBack = StringUtils.null2String(request.getParameter("app_numBack"));
	    String application_nums = "";
	    if(!"".equals(app_numBack) && t07_flowList.size()>0){
	    	for(int i = 0;i < t07_flowList.size();i++){
	    		CreditTask flow = (CreditTask)t07_flowList.get(i);
	    		application_nums += "," + flow.getApplication_num();
	    	}
	    }
	    if(!"".equals(application_nums)){
	    	application_nums = application_nums.substring(1);
	    }
	    request.setAttribute("app_numBack", app_numBack);
	    request.setAttribute("application_nums", application_nums);	
	}
	public ActionForward performGetT07_flowCheckList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_flowList = new ArrayList();
		String pageInfo = "";
		
		T07_flowDAO t07_flowDAO =(T07_flowDAO)context.getBean("t07_flowDAO");
		T07_post_operator post_operator = new T07_post_operator();
		try {
			T07_post_operatorActionForm form = (T07_post_operatorActionForm) actionForm;
			
			String backstr=StringUtils.null2String((String)request.getAttribute("backstr"));
			if(!backstr.equals("")){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",backstr));
		          saveErrors(request, errors);
			}
			request.setAttribute("backstr", backstr);
		
			session.removeAttribute("credittask");// ���������Ϣ
			session.removeAttribute("t07_case_application");// ����������Ϣ
			session.removeAttribute("workbench");// ����̨��Ϣ
		
			String batchtype = request.getParameter("batchtype");// �ж��Ƿ���������
			String post_id = request.getParameter("post_id");// �ж��Ƿ���������
			request.setAttribute("post_id", post_id);
			
			// ��ȡ��ѯҳ�������б���Ϣ
			 
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			request.setAttribute("is_white", sysparaMap.get("303"));
			request.setAttribute("is_curr", sysparaMap.get("304"));
			request.setAttribute("is_report", sysparaMap.get("405"));
//			if("".equals(sysparaMap.get("251"))||sysparaMap.get("251")==null)request.setAttribute("is_grey", "0"); 
//			else request.setAttribute("is_grey", sysparaMap.get("251"));
			
			//������Դ
			LinkedHashMap sourceMap = cm.getMapFromCache("case_source");
			request.setAttribute("sourceMap", this.getOptionsListByMap(sourceMap,null, false));
			request.setAttribute("experi", sysparaMap.get("800"));
			 
			LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");// ��������
			
			LinkedHashMap postMap = cm.getMapFromCache("post");
			request.setAttribute("postMap", this.getOptionsListByMap(
					postMap,null, true));
			
			LinkedHashMap date_status_cdMap = cm.getMapFromCache("date_status"); //�������ʣ��˹����� 2��ϵͳɸѡ
			request.setAttribute("date_status_cdMap", this.getOptionsListByMap(
					date_status_cdMap,null, true)); 
			
			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype"); //�ͻ����ͣ��Թ� ��˽
			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
					party_class_cdMap,null, true));
			LinkedHashMap validateMap = cm.getMapFromCache("caserecodestatus"); //��֤״̬
			request.setAttribute("validateMap", this.getOptionsListByMap(validateMap,null, true)); 
			LinkedHashMap staffflagMap = cm.getMapFromCache("yesNo"); //�Ƿ�Ա���ͻ�
			request.setAttribute("staffflagMap", this.getOptionsListByMap(staffflagMap,null, true)); 
			LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");
			request.setAttribute("ssdgMap", this.getOptionsListByMap(
					ssdgMap, null, true));  //���ɳ̶�
			
			
		
			LinkedHashMap stateMap=cm.getMapFromCache("casestatus1");//����״̬
				TreeMap fillMap=new TreeMap();
				if(post_id!=null && post_id.equals("P0104")){
					fillMap.put("3","�˻�");
					String reportflag=StringUtils.null2String((String)sysparaMap.get("405"));
				    request.setAttribute("reportflag", reportflag);
					
				}
				if("0".equals(sysparaMap.get("305"))){ //�ж��ų��İ����Ƿ���Ҫ��ˡ�����
					fillMap.put("4","�ų�");
				}
					request.setAttribute("stateMap", this.getOptionsListByMap(
							stateMap, fillMap, false));
						
			
			//301�����ر��Ͳ����Ƿ��߰�������
			Map notinMap1 = new HashMap();
			Map notinMap2 = new HashMap();
			String kind_type="0";
			if("0".equals(sysparaMap.get("301"))){
				notinMap1.put("R", "�ر�");
				notinMap1.put("I", "����");
				notinMap2.put("R", "�ر�");
				notinMap2.put("I", "����");
				kind_type="1";
			} 
			
			
			String cast_type=(String)request.getParameter("cast_type");
			if("1".equals(cast_type)){
				if("0".equals(sysparaMap.get("300"))){
					notinMap1.put("N", "����");
					notinMap1.put("A", "����");
					kind_type=kind_type+"1";
				}
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap,notinMap1, false));
			}else{
			request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
					casecagetoryMap,notinMap2, false));
			}
			
			if(form.getCase_kind() == null ||"".equals(form.getCase_kind())){
				form.setCase_kind(kind_type);
			} 
			LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");// ��������

					request.setAttribute("casetypeMap", this.getOptionsListByMap(
							casetypeMap, null, false));

				if(form.getCast_type() != null && !form.getCast_type().equals("") ){
					
				}else if("!".equals((String)request.getParameter("cast_type"))){
					form.setCast_type((String)request.getParameter("cast_type"));
				}else form.setCast_type("2");
				LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");// ����
			if ("batch".equals(batchtype) && "1".equals(sysparaMap.get("304"))) {
				request.setAttribute("curr_cdMap", this.getOptionsListByMap(
						curr_cdMap, null, false));
				if(form.getCurr_cd() != null && !form.getCurr_cd().equals("") ){
					
				}else{
					form.setCurr_cd("1");
				}
			}else{
				request.setAttribute("curr_cdMap", this.getOptionsListByMap(
						curr_cdMap, null, true));
			}
			
			LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");// �Ƿ�
			if("0".equals(sysparaMap.get("303"))){
				Map notinMap = new HashMap();
				notinMap.put("1", "��");
				request.setAttribute("is_menuMap", this.getOptionsListByMap(
						is_menuMap, notinMap, false));
			}else{
				request.setAttribute("is_menuMap", this.getOptionsListByMap(
						is_menuMap, null, true));
			}
			
			// ��֯�û������Ļ���ID
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String org_id = "";
			org_id = auth.getOrganstr();
			
			if(auth.getPostStr() == null || auth.getPostStr().equals("")){
				request.setAttribute("post_id", form.getPost_id());
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","���û��޸�λ��Ϣ���޷����а������������������û��ĸ�λ��Ϣ���ٽ��в�����"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
            
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			
			if ("1".equals(newsearchflag)) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(post_operator, form);
				
				post_operator.setUsername(auth.getT00_user().getUsername());
				post_operator.setPost_des(auth.getPostStr());
				
//				�ų��İ����Ƿ���Ҫ��ˡ������жϣ������Ҫ��ˡ�����������Ҫ�޸���ת�����ų���������һ���ڵ���Ϣ 2011.05.12
				if("1".equals(sysparaMap.get("305"))){ 
				    post_operator.setPost_flag("1");
				}

				intPage = 1;
				post_operator.setIntpage(intPage);
				session.removeAttribute("t07_flowSearchObj1");

				if (form.getCase_date_start_disp() != null
						&& !"".equals(form.getCase_date_start_disp())) {
					post_operator.setCase_date_start(DateUtils
							.stringToDateShort(form.getCase_date_start_disp()));// ������ʼʱ��
				}
				if (form.getCase_date_end_disp() != null
						&& !"".equals(form.getCase_date_end_disp())) {
					post_operator.setCase_date_end(DateUtils.stringToDateShort(form
							.getCase_date_end_disp()));// ��������ʱ��
				}
				session.setAttribute("t07_flowSearchObj1", post_operator);
			} else {// ��ҳ
				post_operator = (T07_post_operator) session
						.getAttribute("t07_flowSearchObj1");
				if (post_operator == null) {
					post_operator = new T07_post_operator();
				}
				if (intPage != 0)
					post_operator.setIntpage(intPage);
				if ("2".equals(newsearchflag)) {
					intPage = post_operator.getIntpage();
				}
			}
			
			post_operator.setApp_org_id(org_id);// ����ID
			if ("1".equals(newsearchflag) || intPage != 0) {
				t07_flowList = t07_flowDAO.getT07_flowList(sqlMap,
						post_operator, this.getStartRec(post_operator
								.getIntpage()), this.getIntPageSize());
				int totalRow = t07_flowDAO.getT07_flowListCount(sqlMap,
						post_operator);
				String url = request.getContextPath() + "/report"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, post_operator
						.getIntpage(), url, "");
				MyBeanUtils.copyBean2Bean(form, post_operator);
			}
			request.setAttribute("casekind", form.getCase_kind());
			//�ж��Ƿ������ʾ
			isHighlight(t07_flowList,request);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_flowList", t07_flowList);

		return actionMapping.findForward("success");
	}

	

	/**
	 * ������ 12��28 ȡ�������Ӧ�Ĺ���̨ҳ��
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
	public ActionForward getT07_workbenchList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		T07_flowDAO t07_flowDAO =(T07_flowDAO)context.getBean("t07_flowDAO");
		
		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
	
		try {
			T07_case_applicationActionForm form = (T07_case_applicationActionForm) actionForm;
			String rowNum=StringUtils.null2String(request.getParameter("rowNum"));
			//��ȡ��¼�û���Ϣ
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			//��ȡ��ѯҳ�������б���Ϣ
	
			LinkedHashMap postMap = cm.getMapFromCache("post");//��������
			CreditTask credittask = new CreditTask();

			String application_num = StringUtils.nullToStr(request
					.getParameter("application_num"));
			if (application_num != null && !"".equals(application_num)) {
				T07_post_operator t07_post_operator = new T07_post_operator();
				t07_post_operator.setApplication_num(application_num);
				credittask = t07_flowDAO.getT07_FlowCaseDisp(sqlMap,
						t07_post_operator);
				session.setAttribute("credittask", credittask);
			} else {
				credittask = (CreditTask) session.getAttribute("credittask");
			}
			//�жϵ�ǰ�û��Ƿ��ڵ�ǰ��λ��
		
			T07_post_operator t07_post_operator = new T07_post_operator();
			t07_post_operator.setUsername(auth.getT00_user().getUsername());
			t07_post_operator.setPost_id(credittask.getPost_id());
			ArrayList listp = t07_flowDAO.getT07_post_operatorList1(sqlMap, t07_post_operator);
			if (listp == null || listp.size() == 0) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"��ǰ�������ڸ�λ������һ�£�"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			if (credittask == null)
				credittask = new CreditTask();
			form.setPost_id(credittask.getPost_id());
			//  --2.���õ�ǰ����λ��Ϊ�����������б�
			credittask.setTask_cd("1");
			//--3.�õ�rm_switch
			T07_swith t07_swith=t07_FlowBo.getT07_swithDisp(sqlMap, credittask.getOper_id(), credittask.getFlow_id());
			credittask.setRm_switch(t07_swith);
			//  ��ʼ����������
			if (credittask.getRm_switch().getInit_url() != null
					&& credittask.getRm_switch().getInit_url().trim() != null
					&& !credittask.getRm_switch().getInit_url().trim().equals(
							"") && credittask.getInit_ind().equals("0")) {
				return actionMapping.findForward(credittask.getRm_switch()
						.getInit_url());
			}
			WorkBench workbench = new WorkBench();
			workbench.setApplication_num(credittask.getApplication_num());
			workbench.setNode_id(credittask.getNode_id());
			//���ù���̨������״̬
			workbench.setApp_status_cd(credittask.getApp_state_cd());
			//���ù���̨���������� add 2009.9.18
			workbench.setCase_type(credittask.getCast_type());
			//--1.ȡ�ù���̨��Ϣ
			workbench = t07_FlowBo.getWorkBenchDisp(workbench,sqlMap);
			
			session.setAttribute("credittask", credittask);//���������Ϣ
			session.setAttribute("workbench", workbench);//����̨��Ϣ
			request.setAttribute("currpost", postMap.get(credittask.getPost_id()));//���������Ϣ
			request.setAttribute("workbench_operlist", workbench.getOperlist());//������ť��Ϣ
			request.setAttribute("worklist", workbench.getWorklist());
			request.setAttribute("flow_id", credittask.getFlow_id());
			request.setAttribute("credittask", credittask);
			String checkbackurl=StringUtils.null2String(request.getParameter("checkbackurl"));
			request.setAttribute("checkbackurl", checkbackurl);
			request.setAttribute("rowNum", rowNum);
			request.setAttribute("application_num", application_num);
			
			LinkedHashMap<String,String> hash =cm.getMapFromCache("t87_syspara");
			String mfaFlag =hash.get("501");
			
			if(mfaFlag.equals("3")||mfaFlag.equals("13")||mfaFlag.equals("23")||mfaFlag.equals("4"))
			{
				request.setAttribute("isDispMfa", "1");
			}else
			{
				request.setAttribute("isDispMfa", "0");
			}

			request.setAttribute("isSave", hash.get("431"));

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
}

    //������������У��
	public ActionForward performVerifyT07_operDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_case_applicationDAO) context
				.getBean("t07_case_applicationDAO");
		String errors_info = "";
		try {
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");// ϵͳ���ò���
			// ��ȡ������Ϣ
			CreditTask credittask = (CreditTask) session
					.getAttribute("credittask");
			String application_num = credittask.getApplication_num();
			String post_id = credittask.getPost_id(); // session�ṩ�ĸ�λ��Ϣ
			String post_id1 = ""; // �������ṩ�ĸ�λ��Ϣ
			T07_case_application temp = t07_case_applicationDAO
					.getT07_case_applicationDisp_read(sqlMap, application_num);
			post_id1 = temp.getPost_id();

			String oper_id = request.getParameter("oper_id");

			if (oper_id.trim() != null && !"".equals(oper_id.trim())) {
				session.setAttribute("oper_id", oper_id);
			} else {
				oper_id = (String) session.getAttribute("oper_id");
			}
			if (oper_id != null && !"".equals(oper_id)) {
				credittask.setOper_id(oper_id.trim());
				/** 1. ���а�������֤���� */
				if ("1".equals(sysparaMap.get("302"))) {
					if ("B01021".equals(oper_id) || "B02021".equals(oper_id)
							|| "B03021".equals(oper_id)
							|| "B04021".equals(oper_id)
							|| "B05021".equals(oper_id)) {

						if (credittask.getCast_type() != null
								&& credittask.getCast_type().equals("2")) {
							if (credittask.getAction_descrip() == null
									|| credittask.getAction_descrip().trim()
											.equals("")) {
								errors_info = "������Ϊ��������Ϊ�գ�������ӿ��ɳ̶ȵĵط��޸ģ�";
							}
							if (credittask.getTake_action() == null
									|| credittask.getTake_action().trim()
											.equals("")) {
								errors_info = "��ȡ��ʩ����Ϊ�գ�������ӿ��ɳ̶ȵĵط��޸ģ�";
							}
							if ("1".equals(sysparaMap.get("803"))) {
								if (credittask.getAction_explain() == null
										|| credittask.getAction_explain()
												.trim().equals("")) {
									errors_info = "������Ϊ����˵������Ϊ�գ�������ӿ��ɳ̶ȵĵط��޸ģ�";
								}
							}
						}
					}
				}

				/** 3.�ж��Ƿ����㵱ǰ�����Լ��(�Ƿ���Ӱ����������) */
				if (post_id.equals(post_id1)) {
					ArrayList list;
					list = t07_case_applicationDAO.getN_mt_restrictList(sqlMap,
							credittask);
					if (list.size() > 0) {
						list = t07_case_applicationDAO.getTaskList(sqlMap,
								credittask);
						if (list.size() > 0) {
							CreditTask credittask1 = (CreditTask) list.get(0);
							if (session.getAttribute("application_advice") != null) {
								session.removeAttribute("application_advice");
							}
							session.setAttribute("application_advice",
									credittask1.getApplication_advice());
						} else {
							errors_info = "��δ��ɵ������޷��ύ������Ӱ�������������ύ��";
						}
					}
				}
			}
			//add by helong 2015/3/2 ������������н��׶��ų������������ϱ�
			if ("B01021".equals(oper_id) || "B02021".equals(oper_id)
					|| "B03021".equals(oper_id)
					|| "B04021".equals(oper_id)
					|| "B05021".equals(oper_id)) {
				int del_stcr=t07_case_applicationDAO.getCase_stcr_passCount(sqlMap, credittask);
				if(del_stcr==0){
					errors_info ="�����������ų��������ϱ���";
				}
			}
			request.setAttribute("errors_info", errors_info);
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().print(errors_info);
			response.getWriter().close();
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return null;
	}

	/**
	 * �ύ��ť���� lcy
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
	public ActionForward performAddT07_operDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		HttpSession session = request.getSession();
		try {
			session.setAttribute("reason", null);
			// ��ȡ��¼�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
	
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");//ϵͳ���ò���
			String checkbackurl=request.getParameter("checkbackurl");	
			// ��ȡ������Ϣ
			CreditTask credittask = (CreditTask) session
					.getAttribute("credittask");
			String application_num = credittask.getApplication_num();
			String post_id=credittask.getPost_id(); //session�ṩ�ĸ�λ��Ϣ
			String post_id1 = ""; //�������ṩ�ĸ�λ��Ϣ
			T07_case_application temp = t07_case_applicationDAO.getT07_case_applicationDisp_read(sqlMap, application_num);
			post_id1 = temp.getPost_id();
			
			String oper_id = request.getParameter("oper_id");
			
			if (oper_id.trim() != null && !"".equals(oper_id.trim())) {
				session.setAttribute("oper_id", oper_id);
			} else {
				oper_id = (String) session.getAttribute("oper_id");
			}
			if (oper_id != null && !"".equals(oper_id)) {
				credittask.setOper_id(oper_id.trim());
				
				
				
				/** 1. ���а�������֤����*/
				if("1".equals(sysparaMap.get("302"))){
					if ("B01021".equals(oper_id) || "B02021".equals(oper_id) || "B03021".equals(oper_id) || "B04021".equals(oper_id) || "B05021".equals(oper_id)) {
						T47_transactionDAO dao =(T47_transactionDAO)context.getBean("t47_transactionDAO");
		                //��֤������״̬��֤������Ľ��׺Ϳͻ���Ϣ�Ƿ�ȫ��ͨ����֤(ͨ�������Ϊ������֤״̬Ϊ1)
						int pass = dao.getCase_trans_party_validate_uc1(sqlMap, credittask);
						if (pass != 1) {
							errors.add(errors.GLOBAL_ERROR, new ActionError(
									"error.common", "��δ��ɵ������޷��ύ����鿴���׺Ϳͻ���Ϣ�Ƿ�����֤ͨ����"));
							saveErrors(request, errors);
							return actionMapping.findForward("failure");
						} 
					}else if("B12011".equals(oper_id)||"B15011".equals(oper_id)){
					    //�����ر�������������鱨����֤״̬
						T07_report08DAO t07_reportDAO =(T07_report08DAO)context.getBean("t07_report08DAO");
						String validate_ind= t07_reportDAO.getReportValidate_indDisp(sqlMap, credittask.getApplication_num());
						if(!"1".equals(validate_ind)){
							errors.add(errors.GLOBAL_ERROR, new ActionError("error.common", "δУ�������ȫ��������Ϣ���޷��ύ��"));
						    saveErrors(request, errors);
						    return actionMapping.findForward("failure");
						}
						else
						{
							sqlMap.update("modifyT07_case_appvalidate_uc", credittask.getApplication_num());
						}
					} 
				}
				
				
				/** 3.�ж��Ƿ����㵱ǰ�����Լ��(�Ƿ���Ӱ����������)*/
				if(post_id.equals(post_id1)) {

				/** 4.д��������*/
				T07_n_move rm_n_move = t07_FlowBo.getRM_n_move(sqlMap, credittask);
				if (rm_n_move.getOper_url() != null
						&& rm_n_move.getOper_url().trim() != null
						&& !rm_n_move.getOper_url().equals("")
						&& !rm_n_move.getOper_url().trim().equals("")
						) {
					String url = request.getContextPath()+ rm_n_move.getOper_url();
			       if(checkbackurl!=null&&!checkbackurl.equals("")){
				      url=url+"&checkbackurl="+checkbackurl;
			       }
			        System.out.println("::::::::url:::::::"+url);
			      response.sendRedirect(url);
			      return null;

				} else {
					//д������ת��¼��
					boolean bool = t07_FlowBo.updRM_appMovefact2(auth,
							credittask,sqlMap,t07_case_applicationDAO);
					if (!bool) {
						errors.add(errors.GLOBAL_ERROR, new ActionError(
								"error.common", "д������ת��¼��ʧ�ܣ�"));
						saveErrors(request, errors);
						return actionMapping.findForward("failure");
					}
				}
				
				}
				else
				{
					errors.add(errors.GLOBAL_ERROR, new ActionError(
							"error.common", "�ð��������ѱ��ύ��"));
					saveErrors(request, errors);
					String url_dead = "";
//					if(post_id.equals("P0102"))
//					{
//						url_dead = request.getContextPath() + "/report/case/t07_flow_list.do?newsearchflag=2";
//					}
//					else if (post_id.equals("P0103"))
//						url_dead = request.getContextPath() + "/report/case/getbath_case_list.do?" + "batchtype=batch&newsearchflag=2&post_id=" + post_id;
//					else if (post_id.equals("P0104"))
//						url_dead = request.getContextPath() + "/report/case/getbath_case_list.do?"+ "batchtype=batch&newsearchflag=2&post_id=" + post_id;
//					 response.sendRedirect(url_dead);
//				     return null;
					if(post_id.equals("P0102"))
					{
						return actionMapping.findForward("failure");
					}
					else if (post_id.equals("P0103"))
					{
						return actionMapping.findForward("failure2");
					}
					else if (post_id.equals("P0104"))
					{
						return actionMapping.findForward("failure3");
					}
				}
				
	
			}
			// ���session�е���Ϣ
			session.removeAttribute("credittask");// ���������Ϣ
			session.removeAttribute("workbench");// ����̨��Ϣ

		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");

		}
		return actionMapping.findForward("success");
	}

	

	/**
	 * ������������
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
	public ActionForward bathmodifyT07_appsatusDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		HttpSession session = request.getSession();
		T07_flowDAO t07_flowDAO =(T07_flowDAO)context.getBean("t07_flowDAO");
		T07_FlowBo t07_flowBo=(T07_FlowBo)context.getBean("t07_flowBo");

		try {

			// ��ȡ��¼�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String type = request.getParameter("type");
			String post_id = request.getParameter("post_id");
			request.setAttribute("post_id", post_id);
			ArrayList app_numList = new ArrayList();
	
			String org_id = "";
			org_id = auth.getOrganstr();
			T07_post_operator post_operator =new T07_post_operator();
			T07_post_operatorActionForm form = (T07_post_operatorActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(post_operator, form);
			if (form.getCase_date_start_disp() != null
					&& !"".equals(form.getCase_date_start_disp())) {
				post_operator.setCase_date_start(DateUtils
						.stringToDateShort(form.getCase_date_start_disp()));// ������ʼʱ��
			}
			if (form.getCase_date_end_disp() != null
					&& !"".equals(form.getCase_date_end_disp())) {
				post_operator.setCase_date_end(DateUtils.stringToDateShort(form
						.getCase_date_end_disp()));// ��������ʱ��
			}
			  if(form.getCase_source()==null||form.getCase_source().equals("")){
            	post_operator.setCase_source("1");
            }
			
			post_operator.setUsername(auth.getT00_user().getUsername());
			post_operator.setPost_des(auth.getPostStr());
			post_operator.setApp_org_id(org_id);// ����ID
            if(post_id!=null){
            	post_operator.setPost_id(post_id)	;
            }
			// ��Ҫ������İ�������

			if ("all".equals(type)) {
				ArrayList t07_flowList = t07_flowDAO.getT07_flowListcheckAll(sqlMap,
						post_operator);
				for (int i = 0; i < t07_flowList.size(); i++) {
					CreditTask creditTask = (CreditTask) t07_flowList.get(i);
					app_numList.add(creditTask.getApplication_num());
				}

			} else {
				String app_num[] = request.getParameterValues("selectedApp");
				for (int a = 0; a < app_num.length; a++) {
					app_numList.add(app_num[a]);
				}
			}
			
			String status = "1";
			String flow_id = "";
			String oper_id = "";
			//����Ŀ��ڵ��Ŀ���λ add & modify by lijie�������˰�����Դ�Ŀ���
			if(post_id.equals("P0104")){
				if (!post_operator.getApp_state_cd().equals("4")) {
					status = "2";
				}
				if (post_operator.getCast_type().equals("1")) {
					if (!post_operator.getCase_source().equals("1")) {
						flow_id = "06";
						oper_id = "B06041";
					} else {
						if (post_operator.getCase_kind().equals("D")) {
							flow_id = "11";
							oper_id = "B11031";
						} else {
							if (post_operator.getCurr_cd().equals("1")) {
								flow_id = "01";
								oper_id = "B01041";
							} else if (post_operator.getCurr_cd().equals("2")) {
								flow_id = "03";
								oper_id = "B03041";
							} else {
								flow_id = "01";
								oper_id = "B01041";
							}
						}
					}
				}else if(post_operator.getCast_type().equals("2")){
					if (!post_operator.getCase_source().equals("1")) {
						flow_id = "05";
						oper_id = "B05041";
					} else {
						if (post_operator.getCurr_cd().equals("1")) {
							flow_id = "02";
							oper_id = "B02041";
						} else if (post_operator.getCurr_cd().equals("2")) {
							flow_id = "04";
							oper_id = "B04041";
						} else {
							flow_id = "02";
							oper_id = "B02041";
						}
					}
				}
				if(post_operator.getCase_kind().equals("C")){
					flow_id = "10";
					oper_id = "B10021";
				}
				if(post_operator.getCase_kind().equals("R")){
					flow_id = "12";
					oper_id = "B12021";
				}
				if(post_operator.getCase_kind().equals("I")){
					flow_id = "15";
					oper_id = "B15021";
				}
			}else if(post_id.equals("P0103")){
				if(post_operator.getCast_type().equals("1")){
					if (!post_operator.getCase_source().equals("1")) {
						flow_id = "06";
						oper_id = "B06031";
					}
					else{
					if(post_operator.getCurr_cd().equals("1")){
						flow_id = "01";
						oper_id = "B01031";
					}else if(post_operator.getCurr_cd().equals("2")){
						flow_id = "03";
						oper_id = "B03031";
					}else{
						flow_id = "01";
						oper_id = "B01031";
					}
					}
				}else if(post_operator.getCast_type().equals("2")){
					if (!post_operator.getCase_source().equals("1")) {
						flow_id = "05";
						oper_id = "B05031";
					}
					else{
					if(post_operator.getCurr_cd().equals("1")){
						flow_id = "02";
						oper_id = "B02031";
					}else if(post_operator.getCurr_cd().equals("2")){
						flow_id = "04";
						oper_id = "B04031";
					}else{
						flow_id = "02";
						oper_id = "B02031";
					}
					}
				}
				if(post_operator.getApp_state_cd().equals("3"))
				 t07_case_application.setApp_state_cd("1");
			}
			
			//�õ���ǰ������
			T07_swith rm_switch = t07_flowBo.getT07_swithDisp(sqlMap,oper_id, flow_id);
			t07_case_application.setNode_id(rm_switch.getTarget_node());// Ŀ��ڵ�
			// ȡ��Ŀ��ڵ��Ӧ�ĸ�λ
			T07_node rm_node = t07_flowBo.getT07_nodeDisp(sqlMap, rm_switch.getTarget_node());
			t07_case_application.setPost_id(rm_node.getPost_id()); // Ŀ���λ
	
			// �޸İ���״̬
			t07_case_application.setApplication_numList(app_numList);
			if(status.equals("2")){
				t07_case_application.setApp_state_cd(status);
			}
//			t07_case_application.setApp_state_cd(status);
			t07_case_application.setLast_upd_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());
			
			// �޸İ�������������״̬
			if (app_numList != null && app_numList.size() > 0) {
				
				sqlMap.endTransaction();
				sqlMap.startTransaction();
				int rows = t07_case_applicationDAO
						.modifyBatchT07_case_appstatus(sqlMap,
								t07_case_application);
				if (rows <= 0) {
					throw new Exception("�޸İ�������������״̬ʧ�ܣ�");
				}
			if(post_operator.getCase_kind().equals("C")||post_operator.getCase_kind().equals("D")||post_operator.getCase_kind().equals("R")||post_operator.getCase_kind().equals("I")){
				t07_case_application.setApp_state_cd1("3");
				 rows = t07_case_applicationDAO.modifyBatchT07_reportstatus(sqlMap,
						t07_case_application);
				if (rows <= 0) {
					// sqlMap.endTransaction();
					throw new Exception("�޸ı�����Ϣ״̬ʧ�ܣ�");
				}
			}
			 	
			
				sqlMap.commitTransaction();


			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		} finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return actionMapping.findForward("success");
	}
	
	
//	public ActionForward bathMakeReportDo(ActionMapping actionMapping,
//			ActionForm actionForm, HttpServletRequest request,
//			HttpServletResponse response) {
//		ActionErrors errors = new ActionErrors();
//		
//		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
//		T07_case_application t07_case_application = new T07_case_application();
//		HttpSession session = request.getSession();
//		try {
//
//			// ��ȡ��¼�û���Ϣ
//			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
//			Authorization auth = authBean.getAuthToken();
//		
//					BMClient bmClient =new BMClient();
//					XMLProperties sysConfig=(XMLProperties)context.getBean("sysConfig");
//					String str="";
//				//��ѯ�Ƿ���δִ���������
//					ArrayList list=bmClient.getT18_OnlineServerList(sqlMap);
//					t07_case_application.setApp_state_cd("2");
//					t07_case_application.setCase_kind("'N','A'");
//					ArrayList caseList=t07_case_applicationDAO.getT07_caseApplicationList(sqlMap,t07_case_application);
//					if(list!=null && list.size()>0){
//						str="��̨�������ɱ�����ȴ�";
//					}else{
//						if(caseList!=null && caseList.size()==0){
//							str="û�������İ������ɱ���,��������";	
//					   }else{
//					String taskkey = bmClient.getTaskkey(sqlMap,sysConfig);
//					if (taskkey != null || !"".equals(taskkey)) {
//						 str = bmClient.insertT18_onlineServer(sqlMap, auth,
//								"2", taskkey,cm,sysConfig);
//						if (str.startsWith("t"))
//							str = "��̨���ڽ��д���,���Ժ���������" + taskkey + "��ѯ״̬���ж�ִ�н����";
//						else {
//							// ��̨δ���д���
//							str = "��������������������̨������,���Ժ����ԣ�";
//						}
//						
//					} else {
//						str="��ȡ�����ų���";
//					}
//			 
//					}
//					}
//					request.setAttribute("backstr", str);
//				
//	
//		} catch (Exception e) {
//			e.printStackTrace();
//			logger.error("�쳣",e);
//			errors.add(errors.GLOBAL_ERROR, new ActionError(
//					"error.pagertitle.default"));
//			saveErrors(request, errors);
//			return actionMapping.findForward("failure");
//		}
//		return actionMapping.findForward("success");
//	}
	
	public ActionForward bathMakeReportDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		HttpSession session = request.getSession();
		try {

			// ��ȡ��¼�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
		
			SetOnlineTask bmClient =new SetOnlineTask();
				
					String str="";
					
					t07_case_application.setApp_state_cd("2");
					t07_case_application.setCase_kind("'N','A'");
					ArrayList caseList=t07_case_applicationDAO.getT07_caseApplicationList(sqlMap,t07_case_application);
		
						if(caseList!=null && caseList.size()==0){
							str="û�������İ������ɱ���,��������";	
					   }else{
						   HashMap factMap=new HashMap();
						   factMap.put("businesskey", "30");
						   factMap.put("statisticdate",DateUtils.dateToStringShort(DateUtils.getCurrDateTime()));
						   factMap.put("creatuser", auth.getT00_user().getUsername());
						   factMap.put("tasktype", "30");
			
						 str = bmClient.insertOnlineTask(sqlMap, cm, factMap,null);
						
					
			 
					}
				
					request.setAttribute("backstr", str);
				
	
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("�쳣",e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	

	
	


	
	
	
	
	
	/**
	 * �޸İ�����������״̬
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
	public ActionForward modifyT07_appsatusDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		
		T07_case_application t07_case_application = new T07_case_application();
		T07_app_movefate t07_app_movefate = new T07_app_movefate();
		HttpSession session = request.getSession();
		CreditTask credittask = new CreditTask();
		T07_app_movefateDAO t07_app_movefateDAO = new T07_app_movefateDAO();

		try {

			// ��ȡ��¼�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
	
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			// ��ȡ����������Ϣ
			credittask = (CreditTask) session.getAttribute("credittask");
			
			String status = request.getParameter("status");
			String application_num=credittask.getApplication_num(); //session�ṩ�İ�����Ϣ
			t07_case_application.setApplication_num(credittask.getApplication_num());
			String curr_node_id=credittask.getNode_id();
			String post_id=credittask.getPost_id(); //session�ṩ�ĸ�λ��Ϣ
			String post_id1 = ""; //�������ṩ�ĸ�λ��Ϣ
			T07_case_application temp = t07_case_applicationDAO.getT07_case_applicationDisp_read(sqlMap, application_num);
			post_id1 = temp.getPost_id();
			
			String oper_id=credittask.getOper_id();
			String checkbackurl=request.getParameter("checkbackurl");
			if(checkbackurl!=null&&!checkbackurl.equals("")){
				checkbackurl=request.getContextPath()+"/"+checkbackurl+"?post_id="+post_id+"&batchtype=batch&newsearchflag=2";
			}
			//�ų��İ����Ƿ���Ҫ����жϣ�����ũ�̵����������Ҫ�������Ҫ�޸���ת�����ų���������һ���ڵ���Ϣ 2011.05.12
			if("1".equals(sysparaMap.get("305"))){
				
				if( null != credittask.getApp_state_cd() && credittask.getApp_state_cd().equals("4")&&!status.equals("3")){ //���ͨ���ų��İ���
					t07_case_application.setApp_state_cd("4");
				}else{
					if(status.equals("3")&&(oper_id.equals("B06032")||oper_id.equals("B05032")||oper_id.equals("B02032")||oper_id.equals("B04032")||oper_id.equals("B01032")||oper_id.equals("B03032"))&& credittask.getApp_state_cd().equals("4")){//�༭���˻�
						//�����ų��ð����ָ�
						t07_case_application.setApp_state_cd("3");
						/** 2. �޸İ�����������������Ϣ*/
						T07_case_stcr t07_case_stcr = new T07_case_stcr();
						t07_case_stcr.setApplication_num(application_num);
						t07_case_stcr.setStatus("1");
						t07_case_stcr.setCase_type("2");
						t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
						/** 4. �޸İ������ױ���������Ϣ*/
						T07_case_transaction t07_case_trans = new T07_case_transaction();
						t07_case_trans.setApplication_num(application_num);
						t07_case_trans.setCase_type("2");
						t07_case_trans.setStatus_cd("1");
						t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
						//�ָ�����
						t07_case_trans.setParty_id(credittask.getParty_id());
						t07_case_applicationDAO.modifyT07_trans_uc_status1(sqlMap, t07_case_trans);
						
						
					}else{
					if(status.equals("3")&&(oper_id.equals("B06042")||oper_id.equals("B05042")||oper_id.equals("B02042")||oper_id.equals("B04042")||oper_id.equals("B01042")||oper_id.equals("B03042"))&& credittask.getApp_state_cd().equals("4")){//�༭���˻�
						t07_case_application.setApp_state_cd("4");
					}else{
					     t07_case_application.setApp_state_cd(status);
					  }
					}
				}
			}else{
				t07_case_application.setApp_state_cd(status);
			}
			t07_case_application.setLast_upd_dt(DateUtils.stringToDateShort(DateUtils.getCurrTime()));
			t07_case_application.setLast_upd_user(auth.getT00_user().getUsername());
			t07_case_application.setCast_type(credittask.getCast_type()); //��������
			

			
			//�ų��İ����Ƿ���Ҫ����жϣ�����ũ�̵����������Ҫ�������Ҫ�޸���ת�����ų���������һ���ڵ���Ϣ 2011.05.12
			if("1".equals(sysparaMap.get("305"))){ 
				
                   //�õ���ǰ������
				T07_swith rm_switch = t07_FlowBo.getT07_swithDisp(sqlMap,credittask.getOper_id(), credittask.getFlow_id());
				t07_case_application.setNode_id(rm_switch.getTarget_node());// Ŀ��ڵ�
				//System.out.println(rm_switch.getTarget_node());
				// ȡ��Ŀ��ڵ��Ӧ�ĸ�λ
				T07_node rm_node = t07_FlowBo.getT07_nodeDisp(sqlMap, rm_switch.getTarget_node());
				String curpost=rm_node.getPost_id();
				t07_case_application.setPost_id(rm_node.getPost_id()); // Ŀ���λ
				
					if(oper_id!=null && (oper_id.equals("B06041")||oper_id.equals("B05041")||oper_id.equals("B02041")|| oper_id.equals("B04041")||oper_id.equals("B01041")|| oper_id.equals("B03041"))&& credittask.getApp_state_cd().equals("4"))
					t07_case_application.setPost_id("4");
					
					if(oper_id!=null && oper_id.equals("B01022")&&(curpost==null || curpost.equals(""))){
						t07_case_application.setPost_id("4");
					}
					
			
				
			}else{
				if(status.equals("4")){
						
				}else{
					//�õ���ǰ������
					T07_swith rm_switch = t07_FlowBo.getT07_swithDisp(sqlMap,credittask.getOper_id(), credittask.getFlow_id());
					t07_case_application.setNode_id(rm_switch.getTarget_node());// Ŀ��ڵ�
					System.out.println(rm_switch.getTarget_node());
					// ȡ��Ŀ��ڵ��Ӧ�ĸ�λ
					T07_node rm_node = t07_FlowBo.getT07_nodeDisp(sqlMap, rm_switch.getTarget_node());
					t07_case_application.setPost_id(rm_node.getPost_id()); // Ŀ���λ
				}
			}
				String operid=credittask.getOper_id();
			//���״̬Ϊ4������а���ɾ������
			if(status.equals("4")){
				String application_advice = (String) session.getAttribute("application_advice");
				if(session.getAttribute("application_advice")!=null){
					session.removeAttribute("application_advice");
				}
				t07_case_application.setApplication_advice(application_advice);
				//t07_case_application.setParty_id(credittask.getParty_id());
				boolean flag= addT07_appApproval2(actionMapping,actionForm,request,response,t07_case_application);
				if(checkbackurl!=null&&!checkbackurl.equals("")){
					response.sendRedirect(checkbackurl);
					return null;
				}else{
					if(flag){
						return actionMapping.findForward("success");
					}else{
						return actionMapping.findForward("failure");
					}
				}
			}
			/*if(status.equals("1")&& (post_id!=null && post_id.equals("P0102"))){
            //	�޸Ľ���״̬
				T07_case_transaction t07_case_trans = new T07_case_transaction();
				t07_case_trans.setApplication_num(credittask.getApplication_num());
				//t07_case_trans.setParty_id(credittask.getParty_id());
				t07_case_applicationDAO.updatet47_trans_uc(t07_case_trans, sqlMap);
				  t07_case_applicationDAO.modifyT07_trans_uc_status1(sqlMap, t07_case_trans);//�ָ�����
				
			}*/
			
			/**
			 * start ���ݿ��ɳ̶��ж��Ƿ���Ҫ�߰���������� 2011.09.19
			 */
			
			String levelkey=(String)sysparaMap.get("403");
			if(levelkey!=null&&!"".equals(levelkey)&&levelkey.length()>1){
				//���ɱ༭���ύ��ť
				if ( "B02021".equals(oper_id) || "B04021".equals(oper_id)|| "B05021".equals(oper_id)) {
					String level=credittask.getAlert_level();
					if(levelkey.indexOf(level)>-1){
						if(credittask.getApp_state_cd().equals("4")){
							t07_case_application.setApp_state_cd("4");
							t07_case_application.setPost_id("4");
						}else{
							t07_case_application.setApp_state_cd("2");
						}
					}
				}	
			}
			
			/**
			 * end ���ݿ��ɳ̶��ж��Ƿ���Ҫ�߰���������� 2011.09.19
			 */
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			
			if(post_id.equals(post_id1))
			{
				// �޸İ�������������״̬
				int rows = t07_case_applicationDAO.modifyT07_case_appstatus(
						sqlMap, t07_case_application);

				// д������ת��¼��
				boolean bool = t07_FlowBo.updRM_appMovefact2(auth, credittask,
						sqlMap, t07_case_applicationDAO);
				if (!bool) {
					errors.add(errors.GLOBAL_ERROR, new ActionError(
							"error.common", "д������ת��¼��ʧ�ܣ�"));
					saveErrors(request, errors);
					return actionMapping.findForward("failure");
				}
			}
			else
			{
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.common", "�ð��������ѱ��ύ��"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			sqlMap.commitTransaction();
			
			session.removeAttribute("credittask");
			session.removeAttribute("workbench");// ����̨��Ϣ
			
			
			if(checkbackurl!=null&&!checkbackurl.equals("")){
				response.sendRedirect(checkbackurl);
				return null;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	
		
		return actionMapping.findForward("success");
	}

	/**
	 * �����ų�����
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @param t07_case_application
	 * @return
	 */
	public boolean addT07_appApproval2(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response,T07_case_application t07_case_application){
		ActionErrors errors = new ActionErrors();
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");

		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		T07_case_transaction t07_case_trans = new T07_case_transaction();
		ArrayList t07_transList = new ArrayList();
		CreditTask credittask = new CreditTask();
		try{
			AuthBean authBean = (AuthBean) request.getSession().getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// ��ȡ����������Ϣ
			credittask = (CreditTask)request.getSession().getAttribute("credittask");
			
			t07_case_stcr.setApplication_num(t07_case_application.getApplication_num());
			t07_case_stcr.setCase_type(t07_case_application.getCast_type());
			t07_case_stcr.setStatus(t07_case_application.getApp_state_cd());
			
			t07_case_trans.setApplication_num(t07_case_application.getApplication_num());
			t07_case_trans.setCase_type(t07_case_application.getCast_type());
			t07_case_trans.setStatus_cd(t07_case_application.getApp_state_cd());
			t07_case_trans.setParty_id(t07_case_application.getParty_id());
			
			sqlMap.endTransaction();
			sqlMap.startTransaction();

			
			/** 1. �޸İ�������������״̬*/
			int rows = t07_case_applicationDAO.modifyT07_case_appstatus(sqlMap,t07_case_application);
			
			/** 2. �޸İ�����������������Ϣ*/
			t07_case_applicationDAO.modifyT07_case_stcr_status(sqlMap, t07_case_stcr);
			
			/** 4. �޸İ������ױ���������Ϣ*/
			t07_case_applicationDAO.modifyT07_stcr_trans_status(sqlMap, t07_case_trans);
			
			/** 3. �޸ĵ�ǰ���ױ��еĽ���״̬*/
			t07_case_applicationDAO.updatet47_trans_uc(t07_case_trans, sqlMap);
		
           
			/** 5. д������ת��¼��*/
			boolean bool = t07_FlowBo.updRM_appMovefact2(auth,credittask,sqlMap,t07_case_applicationDAO);
			if (!bool) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.common", "д������ת��¼��ʧ�ܣ�"));
				saveErrors(request, errors);
				return false;
			}
			
			sqlMap.commitTransaction();

		}
		catch (Exception e) {
		e.printStackTrace();logger.error(e);
		errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
		saveErrors(request, errors);
		return false;
		}finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return true;
	}
	
	
	
	/**
	 * ��֤���а���
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performValidate_all_case(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
			      
		        try{
		        	
		        	synchronized ("validating") {
						
	        		AuthBean authBean = (AuthBean) request.getSession().getAttribute("authBean");
	    			Authorization auth = authBean.getAuthToken();
	    			String organstr=auth.getOrganstr();
	    			/*	String query = "";	
//		        	// 1 ��������֤�м��
		    		query = "DELETE FROM T07_CASE_VALIDATE";
		    		 int count=sqlMap.update("updateSQL", query); 
		    		logger.debug("ɾ��T07_CASE_VALIDATE���¼��:" + count);

		    		// 2 ����Ҫ��֤�İ������д��t07_case_validate,���հ�����һ����ʱ������֤״̬Ϊ0��
		    		query = "INSERT INTO T07_CASE_VALIDATE (APPLICATION_NUM,CASE_TYPE) "
		    				+ "SELECT T.APPLICATION_NUM,T.CAST_TYPE "
		    				+ "FROM T07_CASE_APPLICATION T "
		    				+ "WHERE T.APP_STATE_CD='1' "	
		    				+ "AND T.CASE_KIND IN  ('N','A') "
		    				+ "AND (T.VALIDATE_IND = '0' OR T.VALIDATE_IND IS NULL OR "
						    + "T.VALIDATE_IND = '') "
						    + "AND T.APP_ORG_ID IN ("+organstr+")";
		    		count = sqlMap.update("updateSQL", query); 
		    	 
		    		logger.debug("����T07_CASE_VALIDATE�����֤��¼��:" + count);

		    		// 3 ���ݽ�����֤״̬����validate_ind(�ֱ���´��,���ɰ���)
		    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT CASE WHEN COUNT(B.TRANSACTIONKEY) > 0 "
		    				+ "THEN '0' ELSE '1' END FROM T07_CASE_TRANSACTION A,T47_TRANSACTION_UC B "
		    				+ "WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY AND A.APPLICATION_NUM=T.APPLICATION_NUM "
		    				+ "AND A.STATUS_CD!='4'" //���ų�Ԥ�������Ľ���
		    				+ "AND (B.VALIDATE_IND !='1' OR B.VALIDATE_IND IS NULL)) WHERE T.CASE_TYPE='1'";
		    		count = sqlMap.update("updateSQL", query); 
		    		 
		    		logger.debug("���´�����֤��־��¼��:" + count);

		    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND=(SELECT CASE WHEN COUNT(B.TRANSACTIONKEY) > 0 "
		    				+ "THEN '0' ELSE '1' END FROM T07_CASE_TRANSACTION A,T47_TRANSACTION_UC B "
		    				+ "WHERE A.TRANSACTIONKEY=B.TRANSACTIONKEY AND A.APPLICATION_NUM=T.APPLICATION_NUM "
		    				+ "AND A.STATUS_CD!='4'" //���ų�Ԥ�������Ľ���
		    				+ "AND (B.VALIDATE_IND2 !='1' OR B.VALIDATE_IND2 IS NULL)) WHERE T.CASE_TYPE='2'";
		    		count = sqlMap.update("updateSQL", query); 
		    		 
		    		logger.debug("���¿��ɽ�����֤��־��¼��:" + count);

		    		// 4 ���ݿͻ���֤״̬����validate_ind2
		    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT CASE WHEN COUNT(B.PARTY_ID) > 0 "
		    				+ "THEN '0' ELSE '1' END FROM T07_CASE_PARTY A,T47_PARTY_UC B "
		    				+ "WHERE A.PARTY_ID=B.PARTY_ID AND A.APPLICATION_NUM=T.APPLICATION_NUM "
		    				+ "AND A.STATUS_CD!='1' "//���ų�Ԥ�������Ŀͻ�
		    				+ "AND (B.VALIDATE_IND !='1' OR B.VALIDATE_IND IS NULL)) "
		    				+ "WHERE T.CASE_TYPE='1'";
		    		count = sqlMap.update("updateSQL", query); 
		        		
		    		logger.debug("���´��ͻ���֤��־��¼��:" + count);
		    	 

		    		query = "UPDATE T07_CASE_VALIDATE T SET VALIDATE_IND2=(SELECT CASE WHEN COUNT(B.PARTY_ID) > 0 "
		    				+ "THEN '0' ELSE '1' END FROM T07_CASE_PARTY A,T47_PARTY_UC B "
		    				+ "WHERE A.PARTY_ID=B.PARTY_ID AND A.APPLICATION_NUM=T.APPLICATION_NUM "
		    				+ "AND A.STATUS_CD!='1' "//���ų�Ԥ�������Ŀͻ�
		    				+ "AND (B.VALIDATE_IND2 !='1' OR B.VALIDATE_IND2 IS NULL)) "
		    				+ "WHERE T.CASE_TYPE='2'";
		    		count = sqlMap.update("updateSQL", query); 
		    		 
		    		logger.debug("���¿��ɿͻ���֤��־��¼��:" + count);

		    		// 5 ����validate_ind��validate_ind2����t07_case_application
		    		query = " UPDATE T07_CASE_APPLICATION T SET T.VALIDATE_IND=( SELECT CASE WHEN A.VALIDATE_IND='1' "
		    				+ "AND A.VALIDATE_IND2='1' THEN '1' ELSE '0' END FROM T07_CASE_VALIDATE A "
		    				+ "WHERE A.APPLICATION_NUM=T.APPLICATION_NUM ) WHERE EXISTS (SELECT 'A' "
		    				+ "FROM T07_CASE_VALIDATE B WHERE T.APPLICATION_NUM=B.APPLICATION_NUM) ";
		    		count = sqlMap.update("updateSQL", query); 
		    	 
		    		logger.debug("���°�������֤��־��¼��:" + count);*/
		        		
		        		T07_FlowBo t07_flowbo=new T07_FlowBo();
		            	ArrayList list=new ArrayList();
		            	 list=t07_flowbo.t07_caseValidate(list,organstr);
		        	    for(int i=0;i<list.size();i++){
		        	    	String query=(String)list.get(i);
		        	    	int count = sqlMap.update("updateSQL", query); 
		        	    }
		    		errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.common" ,"��֤��ϣ�"));
		    		saveErrors(request, errors);
		        }
		    			
		
		}
		catch (Exception e) {
		e.printStackTrace();logger.error(e);
		errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
		saveErrors(request, errors);
		return actionMapping.findForward("failure");
		}finally {
			try {
				sqlMap.endTransaction();
			} catch (Exception e) {
			}
		}
		return actionMapping.findForward("success");
	}
	public ActionForward searchT07_taskDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_FlowBo t07_FlowBo =(T07_FlowBo)context.getBean("t07_flowBo");
		HttpSession session = request.getSession();
		try {
			// ��ȡ��¼�û���Ϣ
			String task_id = request.getParameter("task_id");// ��ȡ����ID
			// ��ȡ������Ϣ
			CreditTask credittask = (CreditTask) session
					.getAttribute("credittask");

			WorkBench workbench = (WorkBench) session.getAttribute("workbench");// ��ȡ����̨��Ϣ
			HashMap hash = t07_FlowBo.getRM_n_taskHash(workbench.getWorklist());// ����hash
			T07_n_task t07_n_task = (T07_n_task) hash.get(task_id);// ��ȡ������ϸ��Ϣ
			credittask.setTask_id(task_id);
			credittask.setT07_n_task(t07_n_task);
			// ��ת������ҳ��
			response.sendRedirect(request.getContextPath()
					+ t07_n_task.getHref_url());
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
	}
	

}
