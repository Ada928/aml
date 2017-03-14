/**
 * Create by makecode program v2.0
 * ����             ���� 		����
 * 2006-12-27   ����		����
 */

package com.ist.aml.inves.controller;

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

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.inves.dao.T07_reportSearchDAO;
import com.ist.aml.inves.dto.T47_transaction_ms;
import com.ist.aml.pbcreport.dao.T07_receiptDAO;
import com.ist.aml.pbcreport.dao.T07_report08DAO;
import com.ist.aml.pbcreport.dto.T07_msg;
import com.ist.aml.pbcreport.dto.T07_packet;
import com.ist.aml.pbcreport.dto.T07_receipt;
import com.ist.aml.report.controller.T07_case_applicationActionForm;
import com.ist.aml.report.dao.T07_alertDAO;
import com.ist.aml.report.dao.T07_alert_attachDAO;
import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_alert;
import com.ist.aml.report.dto.T07_alert_attach;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_module;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.aml.rule.dao.T03_entity_kindDAO;
import com.ist.aml.rule.dto.T03_entity_kind;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_reportSearchAction extends BaseAction {
	private static Logger logger = LogUtils.getLogger(
			T07_reportSearchAction.class.getName()).getLogger(
			Constans.LOGGERNAMEA);

	/**
	 * Actionִ�����
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
		this.formFieldsTrim(form);
		String myaction = mapping.getParameter();
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;// ��ѯ����

        else
		 //��ѯ�ϱ��İ���
		if ("getT07_case_report_list".equalsIgnoreCase(myaction)) {
			myforward = getT07_case_report_list(mapping, form, request, response);
		} 
		// ������ѯ�б�
		else if ("searcht07_reportsearch".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_reportsearch(mapping, form, request,
					response);
		}
		// ��ѯ����ʱ����ϸ��Ϣ
		else if ("getT07_case_applicationDetailDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_applicationDetailDisp(mapping, form,
					request, response);
		}
		
		//��ѯ��������������ʱ��mainҳǩ
		else if ("getT07_case_applicationDetailMain".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_applicationDetailMain(mapping, form,
					request, response);
		}
		else if ("getT07_case_info".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_info(mapping, form,
					request, response);
		}
		else if ("getT07_case_stcrInfo".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_case_stcrInfo(mapping, form,
					request, response);
		}
		
		//���ɰ�����ѯ(����������Ӧ�Ŀͻ����ʺš�������ҳ��)
		else if ("getT07_stcr_main".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_main(mapping, form, request, response);
		}
		//���������ͻ��б��ѯ��Ϣ
		else if ("getT07_stcr_party_search".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_party_search(mapping, form, request,
					response);
		}
		//���������˺��б��ѯ��Ϣ
		else if ("getT07_stcr_acct_search".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_acct_search(mapping, form, request,
					response);
		}
		//�������������б��ѯ��Ϣ
		else if ("getT07_stcr_trans_list_search".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_transList_search(mapping, form, request,
					response);
		}
		else if ("exportBaseCase".equalsIgnoreCase(myaction)) {
			myforward = export_base_case(mapping, form, request, response);
		} 
		//������������
		else if ("exportbathCase".equalsIgnoreCase(myaction)) {
			myforward = export_bath_case(mapping, form, request, response);
		} 
		else if ("getT07_workbenchList08".equalsIgnoreCase(myaction)) {
			myforward = getT07_workbenchList08(mapping, form, request, response);
		}
		else if("getT07_case_receipt_info".equalsIgnoreCase(myaction))  {
			myforward = getT07_case_receipt_info(mapping, form, request, response);
		}
		return myforward;

	}


	public ActionForward getT07_case_report_list(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList searchT07_case_applicationList = new ArrayList();
		String pageInfo = "";
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_application t07_case_application = new T07_case_application();
		String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
		request.setAttribute("cast_type", cast_type);
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// ��������
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
				casecagetoryMap, null, true));
		//���ɳ̶�
		LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");
		request.setAttribute("ssdgMap", this.getOptionsListByMap(
				ssdgMap, null, true));  //���ɳ̶�
		
		T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
		
		
		
		if(cast_type != null && cast_type.equals("1")){
	         form.setAlert_level("");
			//�������
			LinkedHashMap stcrMap = cm.getMapFromCache("bh_tezheng");
			request.setAttribute("stcrMap", this.getOptionsListByMap(
					stcrMap,null, true)); 
			//�������
			LinkedHashMap validateindMap = cm.getMapFromCache("caserecodestatus");
			request.setAttribute("validateindMap", this.getOptionsListByMap(
					validateindMap,null, true)); 
			
		}else{
			//��������
			LinkedHashMap stcrMap = cm.getMapFromCache("bs_tezheng1");
			request.setAttribute("stcrMap", this.getOptionsListByMap(
					stcrMap,null, true)); 
		}
		

		try {
			
			//�ͻ����ͣ��Թ� ��˽
//			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
//					party_class_cdMap,null, true));
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_str", party_class_str);
			
			// ����
//			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//			request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//					null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			// �Ƿ������
//			LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");
//			request.setAttribute("is_menuMap", this.getOptionsListByMap(
//					is_menuMap, null, true));
			String is_menu_str=cm.getMapFromCacheToStr("yesNo", "is_menu", form.getIs_menu(),"", true);
			request.setAttribute("is_menu_str", is_menu_str);
			
			//�������ʣ��˹����� 2��ϵͳɸѡ
//			LinkedHashMap date_status_cdMap = cm.getMapFromCache("date_status");
//			request.setAttribute("date_status_cdMap", this.getOptionsListByMap(
//					date_status_cdMap,null, true)); 
			String date_status_cd_str=cm.getMapFromCacheToStr("date_status", "date_status_cd", form.getDate_status_cd(),"", true);
			request.setAttribute("date_status_cd_str", date_status_cd_str);
			
			// ����״̬
//			LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
//			request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
//					casesearchtimeMap, null, false));
			if(form.getCasesearchtime() == null || "".equals(form.getCasesearchtime()))
				form.setCasesearchtime("0");
			String casesearchtime_str=cm.getMapFromCacheToStr("repoetsearch_state", "casesearchtime", form.getCasesearchtime(),"", false);
			request.setAttribute("casesearchtime_str", casesearchtime_str);
			
			
			
			
			form.setCast_type(cast_type);
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("2")) {
				String today = DateUtils.getCurrTime();
				DateUtils dateUtils = new DateUtils();
				String tendaybefor = dateUtils.getDateChangeTime(today, "d",
						-30);
				tendaybefor = tendaybefor.substring(0, 10);
				today = today.substring(0, 10);
				form.setCase_tran_mindate_disp(tendaybefor);
				form.setCase_tran_maxdate_disp(today);
			
				session.removeAttribute("t07_case_applicationSearchObj");
				form.setAlert_level("");
			}
			if (!newsearchflag.equals("2")) {// �״ν��벻��ѯ
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					MyBeanUtils.copyBean2Bean(t07_case_application, form);
					// �ͻ���
					intPage = 0;

					// ���������ݵ�ת��
					if (form.getApp_dt_start_disp() != null
							&& !"".equals(form.getApp_dt_start_disp())) {
						t07_case_application
								.setApp_dt_start(DateUtils
										.stringToDateShort(form
												.getApp_dt_start_disp()));
					}
					if (form.getApp_dt_end_disp() != null
							&& !"".equals(form.getApp_dt_end_disp())) {
						t07_case_application.setApp_dt_end(DateUtils
								.stringToDateShort(form.getApp_dt_end_disp()));

					}
					if (form.getCase_tran_maxdate_disp() != null
							&& !"".equals(form.getCase_tran_maxdate_disp())) {
						t07_case_application.setLast_upd_dt_end_disp(form.getCase_tran_maxdate_disp().replaceAll("-", ""));
					}
					if (form.getCase_tran_mindate_disp() != null
							&& !"".equals(form.getCase_tran_mindate_disp())) {
						t07_case_application.setLast_upd_dt_start_disp(form.getCase_tran_mindate_disp().replaceAll("-", ""));
					}
				
					
					session.setAttribute("t07_case_reportSearchObj",
							t07_case_application);
					
				} else {// ��ҳ
					t07_case_application = (T07_case_application) session
							.getAttribute("t07_case_reportSearchObj");
					MyBeanUtils.copyBean2Bean(form, t07_case_application);
				}
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String org_id = "";
				if (!authBean.getAuthToken().getOrganstr().equals("")
						&& authBean.getAuthToken().getOrganstr() != null) {
					org_id = "(" + authBean.getAuthToken().getOrganstr() + ")";
				}
				if (t07_case_application == null) {
					T07_case_application t07_case_application1 = new T07_case_application();
					t07_case_application = t07_case_application1;
				}
				t07_case_application.setOrgankey(org_id);
				/*add by helong 2014/4/23 ���ӱ������Ʋ�ѯ����ȡ�����*/
				String reportkeys="";
				if(t07_case_application.getAddtional()!=null && !t07_case_application.getAddtional().equals("")){
					reportkeys=t07_ReportSearchDAO.getReportKeyByMsg(sqlMap,t07_case_application);
					if("".equals(reportkeys)){
						reportkeys="''";
					}
				}
				t07_case_application.setReportkey(reportkeys);
				/*add end*/
				searchT07_case_applicationList = t07_ReportSearchDAO
						.search_t07_case_reportList(sqlMap,
								t07_case_application,
								this.getStartRec(intPage), this
										.getIntPageSize());
				int totalRow = t07_ReportSearchDAO
						.search_t07_case_reportListCount(sqlMap,
								t07_case_application);
				String url = request.getContextPath() + "/inves"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("intPage", intPage + "");
		        request.setAttribute("casesearchtime", form.getCasesearchtime());
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("searchT07_case_applicationList",
				searchT07_case_applicationList);
		request.setAttribute("cast_type", cast_type);
		//
		return actionMapping.findForward("success");
	}
	/**
	 * ���ɰ�����ѯ
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
	public ActionForward performGetT07_reportsearch(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList searchT07_case_applicationList = new ArrayList();
		String pageInfo = "";
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_application t07_case_application = new T07_case_application();
		String cast_type = request.getParameter("cast_type");
		// ��ȡҳ������Ҫ�������˵���Ϣ
		LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
		request.setAttribute("is_white", sysparaMap.get("303"));
		request.setAttribute("is_curr", sysparaMap.get("304"));
		request.setAttribute("is_staff", sysparaMap.get("254"));
		request.setAttribute("is_grey", sysparaMap.get("251"));
		
				
		// ����״̬
		LinkedHashMap deal_stateMap = cm.getMapFromCache("casestatus");
		request.setAttribute("deal_stateMap", this.getOptionsListByMap(
				deal_stateMap, null, true));
		
		
		// ��������
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
				casecagetoryMap, null, true));
		LinkedHashMap ssdgMap = cm.getMapFromCache("ssdg");
		request.setAttribute("ssdgMap", this.getOptionsListByMap(
				ssdgMap, null, true));  //���ɳ̶�
		// ��ѯ����
		LinkedHashMap casesorderMap = cm.getMapFromCache("repoetsearch_list");
		request.setAttribute("casesorderMap", this.getOptionsListByMap(
				casesorderMap, null, true));
		
		
		LinkedHashMap staffflagMap = cm.getMapFromCache("yesNo");
		request.setAttribute("staffflagMap", this.getOptionsListByMap(staffflagMap,null, true)); 
		
		
		
		
		
		T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
		if(cast_type != null && cast_type.equals("1")){
	         form.setAlert_level("");
			//�������
			LinkedHashMap stcrMap = cm.getMapFromCache("bh_tezheng");
			request.setAttribute("stcrMap", this.getOptionsListByMap(
					stcrMap,null, true)); 
			//����״̬
			LinkedHashMap validateindMap = cm.getMapFromCache("caserecodestatus");
			request.setAttribute("validateindMap", this.getOptionsListByMap(
					validateindMap,null, true)); 
			
		}else{
			//��������
			LinkedHashMap stcrMap = cm.getMapFromCache("bs_tezheng1");
			request.setAttribute("stcrMap", this.getOptionsListByMap(
					stcrMap,null, true)); 
		}
		

		try {
			
			form.setCast_type(cast_type);
			
			
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("2")) {
				String today = DateUtils.getCurrTime();
				DateUtils dateUtils = new DateUtils();
				String tendaybefor = dateUtils.getDateChangeTime(today, "d",
						-30);
				tendaybefor = tendaybefor.substring(0, 10);
				today = today.substring(0, 10);
				form.setApp_dt_start_disp(tendaybefor);
				form.setApp_dt_end_disp(today);
				session.removeAttribute("t07_case_applicationSearchObj");
				form.setAlert_level("");
			}
			if (!newsearchflag.equals("2")) {// �״ν��벻��ѯ
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					MyBeanUtils.copyBean2Bean(t07_case_application, form);
					// �ͻ���
					intPage = 0;

					// ���������ݵ�ת��
					if (form.getApp_dt_start_disp() != null
							&& !"".equals(form.getApp_dt_start_disp())) {
						t07_case_application
								.setApp_dt_start(DateUtils
										.stringToDateShort(form
												.getApp_dt_start_disp()));
					}
					if (form.getApp_dt_end_disp() != null
							&& !"".equals(form.getApp_dt_end_disp())) {
						t07_case_application.setApp_dt_end(DateUtils
								.stringToDateShort(form.getApp_dt_end_disp()));

					}
				
					session.removeAttribute("t07_case_applicationSearchObj");
					session.setAttribute("t07_case_applicationSearchObj",
							t07_case_application);
					//session.setAttribute("casesearchtime", casesearchtime);
				} else {// ��ҳ
					t07_case_application = (T07_case_application) session
							.getAttribute("t07_case_applicationSearchObj");
					MyBeanUtils.copyBean2Bean(form, t07_case_application);
				}
				
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String org_id = "";
				if (!authBean.getAuthToken().getOrganstr().equals("")
						&& authBean.getAuthToken().getOrganstr() != null) {
					org_id = "(" + authBean.getAuthToken().getOrganstr() + ")";
				}
				if (t07_case_application == null) {
					T07_case_application t07_case_application1 = new T07_case_application();
					t07_case_application = t07_case_application1;
				}
				t07_case_application.setOrgankey(org_id);
				searchT07_case_applicationList = t07_ReportSearchDAO.search_t07_case_applicationList(sqlMap,t07_case_application,
								this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t07_ReportSearchDAO.search_t07_case_applicationListCount(sqlMap,t07_case_application);
				String url = request.getContextPath() + "/inves" + actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("intPage", intPage + "");
		        request.setAttribute("casesearchtime", form.getCasesearchtime());
			}
			
			//�ͻ����ͣ��Թ� ��˽
//			LinkedHashMap party_class_cdMap = cm.getMapFromCache("clienttype");
//			request.setAttribute("party_class_cdMap", this.getOptionsListByMap(
//					party_class_cdMap,null, true));
			String party_class_str=cm.getMapFromCacheToStr("clienttype", "party_class_cd", form.getParty_class_cd(),"", true);
			request.setAttribute("party_class_str", party_class_str);
			
			 //������Դ
			 LinkedHashMap sourceMap = cm.getMapFromCache("case_source");
			 request.setAttribute("sourceMap", this.getOptionsListByMap(sourceMap,null, true));
			 request.setAttribute("experi", sysparaMap.get("800"));
			 
			// ����
//			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//			request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//					null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			// �Ƿ������
//			LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");
//			request.setAttribute("is_menuMap", this.getOptionsListByMap(
//					is_menuMap, null, true));
			String is_menu_str=cm.getMapFromCacheToStr("yesNo", "is_menu", form.getIs_menu(),"", true);
			request.setAttribute("is_menu_str", is_menu_str);
			
			//�������ʣ��˹����� 2��ϵͳɸѡ
//			LinkedHashMap date_status_cdMap = cm.getMapFromCache("date_status");
//			request.setAttribute("date_status_cdMap", this.getOptionsListByMap(
//					date_status_cdMap,null, true)); 
			String date_status_cd_str=cm.getMapFromCacheToStr("date_status", "date_status_cd", form.getDate_status_cd(),"", true);
			request.setAttribute("date_status_cd_str", date_status_cd_str);
			
			// ����״̬
//			LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
//			request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
//					casesearchtimeMap, null, false));
			if(form.getCasesearchtime() == null || "".equals(form.getCasesearchtime()))
				form.setCasesearchtime("0");
			String casesearchtime_str=cm.getMapFromCacheToStr("repoetsearch_state", "casesearchtime", form.getCasesearchtime(),"", false);
			request.setAttribute("casesearchtime_str", casesearchtime_str);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("searchT07_case_applicationList",
				searchT07_case_applicationList);
		request.setAttribute("cast_type", cast_type);
		//
		return actionMapping.findForward("success");
	}
	/**
	 * lp
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_case_applicationDetailDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		ArrayList stcrList = new ArrayList();
		ArrayList t07_stcrList = new ArrayList();
		String pageInfo = "";
		String case_kind = "";
		try {
			
		   Map sysMap= cm.getMapFromCache("t87_syspara");
			    request.setAttribute("isSave", (String)sysMap.get("431"));
			
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			case_kind = form.getCase_kind();
			String caseFlag = request.getParameter("caseFlag");
			if (caseFlag != null && "0".equals(caseFlag)) {// ���ų���������
				request.setAttribute("title", "���ų�����");
				request.setAttribute(
						"backUrl",
						"/report/case/t07_case_application_search_removed.do?intPage="
								+ request.getParameter("intPage"));
			} else if (caseFlag != null && "1".equals(caseFlag)) {// ���а�������
				request.setAttribute("title", "���а���");
				request.setAttribute(
						"backUrl",
						"/inves/reportsearch/t07_reportsearch.do?intPage="
								+ request.getParameter("intPage") + "&cast_type=" + request.getParameter("cast_type"));
			}else if (caseFlag != null && "2".equals(caseFlag)) {// ���а�������
				request.setAttribute("title", "���б���");
				request.setAttribute(
						"backUrl",StringUtils.null2String((String)request.getParameter("backurl")));
			} else {
				String title="";
				if(request.getParameter("title")!=null){
					title=request.getParameter("title");
				}
				request.setAttribute("title", title);
				String backurl="/pubmodule/main.jsp";
				if(request.getParameter("backurl")!=null){
					backurl=StringUtils.null2String((String)request.getParameter("backurl"));
				}
				request.setAttribute(
						"backUrl",backurl);
				
			}
			if (form.getCase_kind().equals("R")
					|| form.getCase_kind().equals("I")
					|| form.getCase_kind().equals("D")
					|| form.getCase_kind().equals("C")) {
              
				return actionMapping.findForward("success08");
			}
			String application_num = StringUtils.null2String(request
					.getParameter("application_num"));
			String casesearchtime = StringUtils.null2String(request
					.getParameter("casesearchtime"));
			request.setAttribute("casesearchtime", casesearchtime);
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setCasesearchtime(casesearchtime);

			t07_case_application = t07_ReportSearchDAO
					.getT07_case_applicationDisp(sqlMap, t07_case_application);
		

			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_stcr.setApplication_num(t07_case_application.getApplication_num());
			t07_case_stcr.setCase_type(t07_case_application.getCast_type());
			t07_case_stcr.setCasesearchtime(casesearchtime);
			
			// ȡ�øð����µ������������б���Ϣ
			int intPageSize1 = 6;
			int totalRow = t07_case_applicationDAO.getT07_stcrListCount(sqlMap,
					t07_case_stcr);
			t07_stcrList = t07_case_applicationDAO.getT07_stcrList1(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr1(totalRow, intPage, url, "",intPageSize1);
		    
			
            //����������Ϣ	LinkedHashMap stcrMap = cm.getMapFromCache("pbcrulerh_ky");
		    LinkedHashMap pbcruleMap=null;
			if("1".equals(t07_case_stcr.getCase_type())){
			  pbcruleMap = cm.getMapFromCache("pbcrulerh_de");// ����������
			}else{
				 pbcruleMap = cm.getMapFromCache("pbcrulerh_ky");// ����������
			}
			Iterator iter = t07_stcrList.iterator();
			while (iter.hasNext()) {
				T07_case_stcr stcr = (T07_case_stcr) iter.next();
				if("1".equals(t07_case_stcr.getCase_type())){
					stcrList.add("�ͻ��ţ�"+stcr.getParty_id()+"  �������:"+stcr.getStcr() + "(" + (String) pbcruleMap.get(stcr.getStcr())+")");
				}else{
					stcrList.add(stcr.getStcr() + "    " + stcr.getStcr_disp());
				}
			}
			
			 /***** 2.ģ��ƥ���**/
		    String model_flag = "0";	//����ǰ̨����ģ��ƥ�����ʾ����
		    Map<String,LinkedHashMap<String,String>> t07_case_model_strMap=new LinkedHashMap<String,LinkedHashMap<String,String>>();
		    ArrayList t07_case_model_strList = new ArrayList();
		    ArrayList modelList = new ArrayList();
		    
		    T07_case_stcr temp = new T07_case_stcr();
		    temp.setApplication_num(application_num);
		    modelList = t07_case_applicationDAO.getModel_list(sqlMap, temp);
		    t07_case_model_strList = t07_case_applicationDAO.getT07_case_modelList(sqlMap, temp);
		    
		    
		    if(t07_case_model_strList.size() > 0 && t07_stcrList.size() > 0)
		    {
		    	model_flag = "1";
		    	Iterator iter1 = t07_stcrList.iterator();
				while (iter1.hasNext())
				{
					T07_case_stcr stcr1 = (T07_case_stcr) iter1.next();
					String key = stcr1.getStcr();
					LinkedHashMap modelMap = new LinkedHashMap();
					
					Iterator iter2 = t07_case_model_strList.iterator();
					while (iter2.hasNext())
					{
						T07_case_stcr stcr2 = (T07_case_stcr) iter2.next();
						if(key.equals(stcr2.getStcr()))
							modelMap.put(stcr2.getModel_no(), stcr2.getModel_no());
					}
					t07_case_model_strMap.put(key, modelMap);
				}
		    }
		   request.setAttribute("t07_case_model_strList", t07_case_model_strList);
		   request.setAttribute("modelList", modelList);
		   request.setAttribute("t07_case_model_strMap", t07_case_model_strMap);
		   request.setAttribute("model_flag", model_flag);
		   
		   
		    
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("case_type", t07_case_application.getCast_type());
		request.setAttribute("stcrList", stcrList);
		request.setAttribute("t07_stcrList", t07_stcrList);
		request.setAttribute("pageInfo", pageInfo);
		if(case_kind.equals("N") || case_kind.equals("A")){
			request.setAttribute("msgkey", StringUtils.null2String(request.getParameter("msgkey")));
			request.setAttribute("msg_file",StringUtils.null2String(request.getParameter("msg_file")));
			request.setAttribute("packetkey",StringUtils.null2String(request.getParameter("packetkey")));
			return actionMapping.findForward("success1");
			
		}
		else	return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_applicationDetailMain(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_application t07_case_application = new T07_case_application();
		try {
			
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
			String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
			String casesearchtime = StringUtils.null2String(request.getParameter("casesearchtime"));
			request.setAttribute("casesearchtime", casesearchtime);
			request.setAttribute("application_num", application_num);
			request.setAttribute("cast_type", cast_type);
			request.setAttribute("backUrl",
					"/inves/reportsearch/t07_reportsearch.do?cast_type=" + cast_type +"&intPage="
							+ request.getParameter("intPage"));
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	public ActionForward performGetT07_case_info(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
			String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
			String casesearchtime = StringUtils.null2String(request.getParameter("casesearchtime"));
			request.setAttribute("casesearchtime", casesearchtime);
			request.setAttribute("application_num", application_num);
			request.setAttribute("cast_type", cast_type);
			
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setCasesearchtime(casesearchtime);

			t07_case_application = t07_ReportSearchDAO.getT07_case_applicationDisp(sqlMap, t07_case_application);
			//add by zhanjin 2013-7-30 ���Ӱ�������������ѯ���� begin
			T07_case_module t07CaseModule=new T07_case_module();
			t07CaseModule.setApplication_num(application_num);
			ArrayList caseModuleList=t07_case_applicationDAO.getMODULESCORE_list(sqlMap, t07CaseModule);
			request.setAttribute("caseModuleList", caseModuleList);
			//add by zhanjin 2013-7-30 ���Ӱ�������������ѯ���� end
			
			ArrayList t07_alert_attachList;
			String pageInfo = "";
			T07_alert_attach t07_alert_attach = new T07_alert_attach();
			t07_alert_attach.setApplication_num(application_num);
			T07_alert_attachDAO t07_alert_attachDAO =(T07_alert_attachDAO)context.getBean("t07_alert_attachDAO");
			t07_alert_attachList = t07_alert_attachDAO.getT07_alert_attachList(
					sqlMap, t07_alert_attach, this.getStartRec(intPage), this
							.getIntPageSize(),context);
			int totalRow = t07_alert_attachDAO.getT07_alert_attachListCount(
					sqlMap, t07_alert_attach);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			
			request.setAttribute("pageInfo", pageInfo);
			request.setAttribute("t07_alert_attachList", t07_alert_attachList);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("case_type", t07_case_application.getCast_type());
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_case_stcrInfo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		ArrayList stcrList = new ArrayList();
		ArrayList t07_stcrList = new ArrayList();
		String pageInfo = "";
		try {
			
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
			String application_num = StringUtils.null2String(request.getParameter("application_num"));
			String cast_type = StringUtils.null2String(request.getParameter("cast_type"));
			String casesearchtime = StringUtils.null2String(request.getParameter("casesearchtime"));
			request.setAttribute("casesearchtime", casesearchtime);
			request.setAttribute("application_num", application_num);
			request.setAttribute("cast_type", cast_type);
		

			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_stcr.setApplication_num(application_num);
			t07_case_stcr.setCase_type(cast_type);
			t07_case_stcr.setCasesearchtime(casesearchtime);
			
			// ȡ�øð����µ������������б���Ϣ
			int intPageSize1 = 6;
			int totalRow = t07_case_applicationDAO.getT07_stcrListCount(sqlMap,
					t07_case_stcr);
			t07_stcrList = t07_case_applicationDAO.getT07_stcrList1(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr1(totalRow, intPage, url, "",intPageSize1);
		    
			
            //����������Ϣ	LinkedHashMap stcrMap = cm.getMapFromCache("pbcrulerh_ky");
		    LinkedHashMap pbcruleMap=null;
			if("1".equals(t07_case_stcr.getCase_type())){
			  pbcruleMap = cm.getMapFromCache("pbcrulerh_de");// ����������
			}else{
				 pbcruleMap = cm.getMapFromCache("pbcrulerh_ky");// ����������
			}
			Iterator iter = t07_stcrList.iterator();
			while (iter.hasNext()) {
				T07_case_stcr stcr = (T07_case_stcr) iter.next();
				if("1".equals(t07_case_stcr.getCase_type())){
					stcrList.add("�ͻ��ţ�"+stcr.getParty_id()+"  �������:"+stcr.getStcr() + "(" + (String) pbcruleMap.get(stcr.getStcr())+")");
				}else{
					stcrList.add(stcr.getStcr() + "    " + stcr.getStcr_disp());
				}
			}
			
			 /***** 2.ģ��ƥ���**/
		    String model_flag = "0";	//����ǰ̨����ģ��ƥ�����ʾ����
		    Map<String,LinkedHashMap<String,String>> t07_case_model_strMap=new LinkedHashMap<String,LinkedHashMap<String,String>>();
		    ArrayList t07_case_model_strList = new ArrayList();
		    ArrayList modelList = new ArrayList();
		    
		    T07_case_stcr temp = new T07_case_stcr();
		    temp.setApplication_num(application_num);
		    modelList = t07_case_applicationDAO.getModel_list(sqlMap, temp);
		    t07_case_model_strList = t07_case_applicationDAO.getT07_case_modelList(sqlMap, temp);
		    
		    
		    if(t07_case_model_strList.size() > 0 && t07_stcrList.size() > 0)
		    {
		    	model_flag = "1";
		    	Iterator iter1 = t07_stcrList.iterator();
				while (iter1.hasNext())
				{
					T07_case_stcr stcr1 = (T07_case_stcr) iter1.next();
					String key = stcr1.getStcr();
					LinkedHashMap modelMap = new LinkedHashMap();
					
					Iterator iter2 = t07_case_model_strList.iterator();
					while (iter2.hasNext())
					{
						T07_case_stcr stcr2 = (T07_case_stcr) iter2.next();
						if(key.equals(stcr2.getStcr()))
							modelMap.put(stcr2.getModel_no(), stcr2.getModel_no());
					}
					t07_case_model_strMap.put(key, modelMap);
				}
		    }
		   request.setAttribute("t07_case_model_strList", t07_case_model_strList);
		   request.setAttribute("modelList", modelList);
		   request.setAttribute("t07_case_model_strMap", t07_case_model_strMap);
		   request.setAttribute("model_flag", model_flag);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("case_type", t07_case_application.getCast_type());
		request.setAttribute("stcrList", stcrList);
		request.setAttribute("t07_stcrList", t07_stcrList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	
	
	/**lp
	 * ȡ����Ӧ�����½�����Ϣ
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_stcr_transList_search(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_stcr_transList;
		
		T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {

			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String party_id= request.getParameter("party_id");
			String casesearchtime= request.getParameter("casesearchtime");
		
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			String case_type= request.getParameter("case_type");
		
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setParty_id(party_id);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCase_type(case_type);
				t07_case_stcr.setCasesearchtime(casesearchtime);
				session.setAttribute("t07_case_stcr", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_stcr");
			}
			request.setAttribute("casesearchtime", t07_case_stcr.getCasesearchtime());
			t07_stcr_transList = t07_case_applicationDAO.getT07_stcr_transList(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_case_applicationDAO.getT07_stcr_transListCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_stcr_transList", t07_stcr_transList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	public ActionForward export_bath_case(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
     	HttpSession session = request.getSession();
		
		
		T07_case_application t07_case_application=new T07_case_application();

		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		ArrayList t07_case_stcrList = new ArrayList();
	
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
			  String casesearchtime=(String) request.getParameter("casesearchtime");
			  String cast_type=(String) request.getParameter("cast_type");
			  request.setAttribute("cast_type", cast_type);
			  String[] applications = request.getParameterValues("selectedReportname");
				int intPage = StringUtils.nullObject2int(request
						.getParameter("intPage"), 0);
				String application_num = "";
	        MyBeanUtils.copyBean2Bean(t07_case_application, form);
	        t07_case_application.setCast_type(cast_type);
	        String alert_level=StringUtils.null2String(request.getParameter("alert_level"));
	        t07_case_application.setAlert_level(alert_level);
			// ���������ݵ�ת��
			if (form.getApp_dt_start_disp() != null
					&& !"".equals(form.getApp_dt_start_disp())) {
				t07_case_application
						.setApp_dt_start(DateUtils
								.stringToDateShort(form
										.getApp_dt_start_disp()));
			}
			if (form.getApp_dt_end_disp() != null
					&& !"".equals(form.getApp_dt_end_disp())) {
				t07_case_application.setApp_dt_end(DateUtils
						.stringToDateShort(form.getApp_dt_end_disp()));

			}
			
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String org_id  = "(" + auth.getOrganstr() + ")";
				t07_case_application.setOrgankey(org_id);
			
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setCasesearchtime(casesearchtime);
			ArrayList  list= t07_ReportSearchDAO.getT07_case_transList(sqlMap, t07_case_application,this.getStartRec1(intPage,5000), 5000);
			
			if(list.size() > 5000){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","һ�ε����������ó���5000����"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_case_application", t07_case_application);
		request.setAttribute("t07_case_stcrList", t07_case_stcrList);
		
		return actionMapping.findForward("success");
	}
	public ActionForward export_base_case(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		
		
		T07_case_application t07_case_application=new T07_case_application();

		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		
	
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
          String[] applications = request.getParameterValues("selectedReportname");
			
			String application_num = "";
	/*		for (int i=0;i<applications.length;i++) {
				application_num =application_num+",'"+ applications[i]+"'";
			}
			if(!application_num.equals("")){
				application_num=application_num.substring(1);
			}*/
			
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			  String casesearchtime=(String) request.getParameter("casesearchtime");
			  String cast_type=(String) request.getParameter("cast_type");
			  request.setAttribute("cast_type", cast_type);
	        MyBeanUtils.copyBean2Bean(t07_case_application, form);
	        t07_case_application.setCast_type(cast_type);
	        String alert_level=StringUtils.null2String(request.getParameter("alert_level"));
	        t07_case_application.setAlert_level(alert_level);
			// ���������ݵ�ת��
			if (form.getApp_dt_start_disp() != null
					&& !"".equals(form.getApp_dt_start_disp())) {
				t07_case_application
						.setApp_dt_start(DateUtils
								.stringToDateShort(form
										.getApp_dt_start_disp()));
			}
			if (form.getApp_dt_end_disp() != null
					&& !"".equals(form.getApp_dt_end_disp())) {
				t07_case_application.setApp_dt_end(DateUtils
						.stringToDateShort(form.getApp_dt_end_disp()));

			}
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				String org_id  = "(" + auth.getOrganstr() + ")";
				t07_case_application.setOrgankey(org_id);
			
	       
			t07_case_application.setApplication_num(application_num);
			t07_case_application.setCasesearchtime(casesearchtime);   
			//this.setIntPageSize(1000);
				ArrayList list= t07_ReportSearchDAO.getT07_case_application_exportList(sqlMap,t07_case_application,this.getStartRec1(intPage,5000), 5000);
				if(list.size() > 5000){
					errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","һ�ε����������ó���5000����"));
			        saveErrors(request, errors);
	    			return actionMapping.findForward("failure");
				}
			logger.info("baselist::::"+intPage+"::"+list.size())	;
			request.setAttribute("list", list);
			
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
	public ActionForward getT07_workbenchList08(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_case_application t07_case_application = new T07_case_application();
		try {
			String application_num = StringUtils.nullToStr(request
					.getParameter("application_num"));
			T07_case_applicationDAO t07_case_applicationDAO =(T07_case_applicationDAO)context.getBean("t07_case_applicationDAO");
			t07_case_application.setApplication_num(application_num);
			int count = t07_case_applicationDAO.searchT07_case_applicationListCount(sqlMap, t07_case_application);
			if(count == 0) {
				t07_case_application.setCasesearchtime("1");//����ʷ����
			} else {
				t07_case_application.setCasesearchtime("0");//�ڵ�ǰ����
			}
			//����ʷ���в�ѯ���ð���
			t07_case_application = t07_case_applicationDAO
					.getT07_case_applicationDisp(sqlMap, t07_case_application);
		
			request.setAttribute("t07_case_application", t07_case_application);
			ArrayList getT07_case_adviList;
			getT07_case_adviList = t07_case_applicationDAO
					.getT07_case_adviList(sqlMap, t07_case_application,
							application_num);
			request.setAttribute("getT07_case_adviList", getT07_case_adviList);
			CreditTask credittask = (CreditTask) session.getAttribute("credittask");
			if(credittask!=null){
				session.removeAttribute("credittask");
			}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure1");
		}
		//
		return actionMapping.findForward("success");
	}
	/**
	 * ���ɰ�����ѯ(����������Ӧ�Ŀͻ����ʺš�������ҳ��)
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_stcr_main(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T03_entity_kindDAO t03_entity_kindDAO = (T03_entity_kindDAO) context.getBean("t03_entity_kindDAO");
		T03_entity_kind t03_entity_kind = new T03_entity_kind();
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			
			LinkedHashMap sysparaMap = cm.getMapFromCache("t87_syspara");
			String tag = (String)sysparaMap.get("801");
			
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
	        String casesearchtime=request.getParameter("casesearchtime");//0.��ǰ 1��ʷ
	        String case_type = request.getParameter("case_type");
	        
	        /** ͨ��T21_PBCRULE��T21_RULE��T03_RULE_ENTITY_R���ʵ��key*/
			ArrayList rtettypekey_list = new ArrayList();
			/** ʵ��key��ʵ�����ơ�ʵ���Ӧ�Ĳ�֤key*/
			ArrayList t03_entity_kindList = new ArrayList();
			/** ��֤key��Ӧ�Ĳ���ֵ�Ͳ���Ӣ������(һ�Զ�)*/
			Map<String,LinkedHashMap<String,String>> t02_page_in_parmMap = new LinkedHashMap<String,LinkedHashMap<String,String>>();
			if (tag.equals("1")) 
			{
				rtettypekey_list = t03_entity_kindDAO.getRtettypekey_list(sqlMap, stcr);
				if(rtettypekey_list.size()>0)
				{
					String key_str = "";
					Iterator iter = rtettypekey_list.iterator();
					while (iter.hasNext()) 
					{
						T03_entity_kind temp = (T03_entity_kind) iter.next();
						key_str += "'" + temp.getRtettypekey() + "',";
					}
					key_str = key_str.substring(0, key_str.length()-1);;
					t03_entity_kind.setRtettypekey_str(key_str);
					t03_entity_kindList = t03_entity_kindDAO.getT03_entity_kindList2(sqlMap, t03_entity_kind);
					Iterator iter2 = t03_entity_kindList.iterator();
					while (iter2.hasNext()) 
					{
						T03_entity_kind temp2 = (T03_entity_kind) iter2.next();
						String key = temp2.getTplakey();
						LinkedHashMap parmMap = new LinkedHashMap();
						/** �������ǽ�����Ϣ501ʱ����Ҫ�����ѡ�����Ӧ�Ĳ��ԣ��ֱ��ǣ����ɷǱ༭����ʷ�������ʷ,���ɷǱ༭�ڣ����*/
						if(key.equals(Constans.TRANS_KY_1)||key.equals(Constans.TRANS_KY_UH) ||key.equals(Constans.TRANS_DE_UH) || key.equals(Constans.TRANS_KY_2) ||key.equals(Constans.TRANS_DE))
						{
							if(case_type.equals("1"))
							{
								if(casesearchtime.equals("0"))
									key = Constans.TRANS_DE; //��ǰ
								else
									key = Constans.TRANS_DE_UH; //�����ʷ
							}
							else
							{
								if(casesearchtime.equals("0"))
									key = Constans.TRANS_KY_2; //���ɵ�ǰ
								else
									key = Constans.TRANS_KY_UH; //������ʷ
							}
							temp2.setTplakey(key);
						}
						/** �ͻ���ϢҲ��Ҫ��:������ʷ�������ʷ,���ɵ�ǰ����ǰ**/
						else if(key.equals(Constans.PARTY_KY_UH) || key.equals(Constans.PARTY_DE_UH) || key.equals(Constans.PARTY_KY) || key.equals(Constans.PARTY_DE))
						{
							if(case_type.equals("1"))
							{
								if(casesearchtime.equals("0"))
									key = Constans.PARTY_DE; //��ǰ
								else
									key = Constans.PARTY_DE_UH; //�����ʷ
							}
							else
							{
								if(casesearchtime.equals("0"))
									key = Constans.PARTY_KY; //���ɵ�ǰ
								else
									key = Constans.PARTY_KY_UH; //������ʷ
							}
							temp2.setTplakey(key);
						}
						/** �˻���ϢҲ��Ҫ��:������ʷ�������ʷ,���ɵ�ǰ����ǰ**/
						else if(key.equals(Constans.ACCT_KY_UH) ||key.equals(Constans.ACCT_DE_UH) || key.equals(Constans.ACCT_KY) ||key.equals(Constans.ACCT_DE))
						{
							if(case_type.equals("1"))
							{
								if(casesearchtime.equals("0"))
									key = Constans.ACCT_DE; //��ǰ
								else
									key = Constans.ACCT_DE_UH; //�����ʷ
							}
							else
								if(casesearchtime.equals("0"))
									key = Constans.ACCT_KY; //���ɵ�ǰ
								else
									key = Constans.ACCT_KY_UH; //������ʷ
							temp2.setTplakey(key);
							
						}
						ArrayList parmList = t03_entity_kindDAO.getT02_page_in_parmList(sqlMap, key);
						Iterator iter3 = parmList.iterator();
						while (iter3.hasNext()) 
						{
							T03_entity_kind temp3 = (T03_entity_kind) iter3.next();
							parmMap.put(temp3.getSysinparmcd(), temp3.getDispname());
						}
						
						t02_page_in_parmMap.put(key, parmMap);
						
					}
				}
				else
				{
					String root = request.getContextPath() + "/avp/template/tpla_chk_t07_case_list.do?newsearchflag=1&new_qry_flag=1&jump_rslt_flag=1&tplakey=";
					//������ʷ"2406" �������ʷ"2407" ,���ɵ�ǰ"2422" ����ǰ"2474"
					String root5 = root +  Constans.PARTY_KY + "&" + Constans.PARTY_KY_CASE + "=" + application_num + "&" + Constans.PARTY_KY_STCR + "=" + stcr; //���ɵ�ǰ
					if(case_type.equals("1"))
					{
						if(casesearchtime.equals("0"))
							root5 = root + Constans.PARTY_DE + "&" + Constans.PARTY_DE_CASE + "=" + application_num + "&" + Constans.PARTY_DE_STCR + "=" + stcr; //��ǰ
						else
							root5 = root + Constans.PARTY_DE_UH + "&" + Constans.PARTY_DE_UH_CASE + "=" + application_num + "&" + Constans.PARTY_DE_UH_STCR + "=" + stcr; //�����ʷ
						
					}
					else
					{
						if(casesearchtime.equals("1"))
							root5 = root + Constans.PARTY_KY_UH + "&" + Constans.PARTY_KY_UH_CASE + "=" + application_num + "&" + Constans.PARTY_KY_UH_STCR + "=" + stcr;  //������ʷ
					}
					
					
					//������ʷ"2409" �������ʷ "2408" ,���ɵ�ǰ"2423" ����ǰ"2475"
					String root6 = root + Constans.ACCT_KY + "&" + Constans.ACCT_KY_CASE + "=" + application_num + "&" + Constans.ACCT_KY_STCR + "=" + stcr;  //���ɵ�ǰ
					if(case_type.equals("1"))
					{
						if(casesearchtime.equals("0"))
							root6 = root + Constans.ACCT_DE + "&" + Constans.ACCT_DE_CASE + "=" + application_num + "&" + Constans.ACCT_DE_STCR + "=" + stcr; //��ǰ
						else
							root6 = root + Constans.ACCT_DE_UH + "&" + Constans.ACCT_DE_UH_CASE + "=" + application_num + "&" + Constans.ACCT_DE_UH_STCR + "=" + stcr; //�����ʷ
					}
					else
					{
						if(casesearchtime.equals("1"))
							root6 = root + Constans.ACCT_KY_UH + "&" + Constans.ACCT_KY_UH_CASE + "=" + application_num + "&" + Constans.ACCT_KY_UH_STCR + "=" + stcr;  //������ʷ
					}
					
					
					//���ɷǱ༭����ʷ"2410" �������ʷ"2411" ,���ɷǱ༭�ڵ�ǰ"2428" ����ǰ"2429"
					String root7 = "";
					if(case_type.equals("1"))
					{
						if(casesearchtime.equals("0"))
							root7 = root + Constans.TRANS_DE + "&" + Constans.TRANS_DE_CASE + "=" + application_num + "&" + Constans.TRANS_DE_STCR + "=" + stcr; //��ǰ
						else
							root7 = root + Constans.TRANS_DE_UH + "&" + Constans.TRANS_DE_UH_CASE + "=" + application_num + "&" +  Constans.TRANS_DE_UH_STCR + "=" + stcr; //�����ʷ
					}
					else
						if(casesearchtime.equals("0"))
							root7 = root + Constans.TRANS_KY_2 + "&" + Constans.TRANS_KY_2_CASE + "=" + application_num + "&" + Constans.TRANS_KY_2_STCR + "=" + stcr; //���ɷǱ༭�ڵ�ǰ
						else
							root7 = root + Constans.TRANS_KY_UH + "&" + Constans.TRANS_KY_UH_CASE + "=" + application_num + "&" + Constans.TRANS_KY_UH_STCR + "=" + stcr; //���ɷǱ༭����ʷ
					
					
					
					
					request.setAttribute("root5", root5);
					request.setAttribute("root6", root6);
					request.setAttribute("root7", root7);
				}
			}
			request.setAttribute("tag", tag);
			request.setAttribute("t03_entity_kindList", t03_entity_kindList);
			request.setAttribute("t02_page_in_parmMap", t02_page_in_parmMap);
	        
	        
	        
	        
	        
	        
	        
			request.setAttribute("stcr", stcr);
			request.setAttribute("application_num", application_num);
			request.setAttribute("case_type",case_type);
			request.setAttribute("casesearchtime",casesearchtime);
		}catch (Exception e) {
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
	 * ���������ͻ��б��ѯ��Ϣ
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_stcr_party_search(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_partyList;
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String casesearchtime = request.getParameter("casesearchtime");
			String case_type = request.getParameter("case_type");
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCasesearchtime(casesearchtime);
				t07_case_stcr.setCase_type(case_type);
				session.setAttribute("t07_case_stcr", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_stcr");
			}
			t07_stcr_partyList = t07_ReportSearchDAO.getT07_stcr_partySearch(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_ReportSearchDAO.getT07_stcr_partyCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_stcr_partyList", t07_stcr_partyList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	/**
	 * ���������˺��б��ѯ��Ϣ
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_stcr_acct_search(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		ArrayList t07_stcr_acctList;
		T07_reportSearchDAO t07_ReportSearchDAO =(T07_reportSearchDAO)context.getBean("t07_ReportSearchDAO");
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {
			T07_reportSearchActionForm form = (T07_reportSearchActionForm) actionForm;
			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String casesearchtime = request.getParameter("casesearchtime");
			String case_type = request.getParameter("case_type");
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCasesearchtime(casesearchtime);
				t07_case_stcr.setCase_type(case_type);
				session.setAttribute("t07_case_stcr", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_stcr");
			}
			t07_stcr_acctList = t07_ReportSearchDAO.getT07_stcr_acctSearch(sqlMap,
					t07_case_stcr,this.getStartRec(intPage),this.getIntPageSize());
			int totalRow = t07_ReportSearchDAO.getT07_stcr_acctCount(sqlMap,
					t07_case_stcr);
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
		    pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_stcr_acctList", t07_stcr_acctList);
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_case_stcr", t07_case_stcr);
		return actionMapping.findForward("success");
	}
	
	public ActionForward getT07_case_receipt_info(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_receiptDAO t07_receiptDAO =(T07_receiptDAO)context.getBean("t07_receiptDAO");
		T07_report08DAO t07_packetDAO =(T07_report08DAO)context.getBean("t07_report08DAO");
		String casesearchtime=StringUtils.null2String(request.getParameter("casesearchtime"));
		String msgkey=StringUtils.null2String(request.getParameter("msgkey"));
		String msg_file=StringUtils.null2String(request.getParameter("msg_file"));
		String packetkey=StringUtils.null2String(request.getParameter("packetkey"));
		String cast_type=StringUtils.null2String(request.getParameter("cast_type"));
		T07_receipt t07_receipt=new T07_receipt();
		ArrayList receiptList=new ArrayList();
		try{
			if(!msgkey.equals("")){
				t07_receipt=t07_receiptDAO.getT07_receiptByMsgkey(sqlMap,msgkey);
				if(t07_receipt!=null){
					t07_receipt.setMsgkey(msgkey);
					t07_receipt.setMsg_file(msg_file);
					T07_packet packet=t07_packetDAO.getT07_packetByKey(sqlMap,packetkey, context);
					if(packet!=null){
						t07_receipt.setPacket_filename(packet.getPacket_filename());
						t07_receipt.setPacket_filepath(packet.getPacket_filepath());
					}
					receiptList = t07_receiptDAO.getT07_receiptDisp1(sqlMap,
							t07_receipt,cast_type);
				}else{
					t07_receipt=new T07_receipt();
				}
				
			}
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_receipt", t07_receipt);
		request.setAttribute("t07_receiptList", receiptList);
		return actionMapping.findForward("success");
	}
}