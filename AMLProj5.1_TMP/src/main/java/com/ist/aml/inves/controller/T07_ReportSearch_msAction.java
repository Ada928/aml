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
import java.util.LinkedHashMap;

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

import com.ist.aml.inves.dao.T07_ReportSearch_msDAO;
import com.ist.aml.report.controller.T07_case_applicationAction;
import com.ist.aml.report.dao.T07_alertDAO;
import com.ist.aml.report.dao.T07_case_applicationDAO;
import com.ist.aml.report.dto.T07_alert;
import com.ist.aml.report.dto.T07_case_application;
import com.ist.aml.report.dto.T07_case_stcr;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_ReportSearch_msAction extends T07_case_applicationAction {
	private static Logger logger = LogUtils.getLogger(
			T07_ReportSearch_msAction.class.getName()).getLogger(
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
		this.formFieldsTrim(form);
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;// ��ѯ����
		
		// ������Ϣ�б�ҳ��lp
		if ("searcht07_reporttrans_bs".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList_bs(mapping, form,
					request, response);
		}
		else if ("exportTransBS".equalsIgnoreCase(myaction)) {
			myforward = export_trans_bs(mapping, form, request, response);
		}
		else if ("searcht07_reporttrans_bh".equalsIgnoreCase(myaction)) {
			myforward = performGetT47_transactionList_bh(mapping, form,
					request, response);
		}
		else if ("exportTransBH".equalsIgnoreCase(myaction)) {
				myforward = export_trans_bh(mapping, form, request, response);
			}
		// ���ɽ���ɾѡ��ѯ�б�
		else if ("searcht07_reportsearch_bs".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_reportsearch_bs(mapping, form, request,
					response);
		} 
		//�������������б��ѯ��Ϣ
		else if ("getT07_stcr_trans_list_search".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_stcr_transList_search(mapping, form, request,
					response);
		}
		return myforward;

	}



	public ActionForward performGetT47_transactionList_bs(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";
		T07_ReportSearch_msDAO t07_ReportSearch_msDAO = (T07_ReportSearch_msDAO) context.getBean("t07_ReportSearch_msDAO");
		T07_case_application t07_case_application = new T07_case_application();
		// ��ȡҳ������Ҫ�������˵���Ϣ
		
		
		// ��������
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
				casecagetoryMap, null, true));
		// ��ѯ����
		LinkedHashMap casesorderMap = cm.getMapFromCache("repoetsearch_list");
		request.setAttribute("casesorderMap", this.getOptionsListByMap(
				casesorderMap, null, true));
		
		// ����Ա��
		LinkedHashMap staffMap = cm.getMapFromCache("staff");
		request.setAttribute("staffMap", this.getOptionsListByMap(staffMap,
				null, false));
		try {
			T07_ReportSearch_msActionForm form = (T07_ReportSearch_msActionForm) actionForm;
			// ����
//			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//			request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//					null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			// ����״̬
//			LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
//			request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
//					casesearchtimeMap, null, false));
			if(form.getCasesearchtime() == null || "".equals(form.getCasesearchtime()))
				form.setCasesearchtime("0");
			String casesearchtime_str=cm.getMapFromCacheToStr("repoetsearch_state", "casesearchtime", form.getCasesearchtime(),"", false);
			request.setAttribute("casesearchtime_str", casesearchtime_str);
			
			
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
			}
			if (!newsearchflag.equals("2")) {// �״ν��벻��ѯ
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					intPage = 1;
					MyBeanUtils.copyBean2Bean(t07_case_application, form);
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
				} else {// ��ҳ
					t07_case_application = (T07_case_application) session
							.getAttribute("t07_case_applicationSearchObj");
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
				t47_transactionList = t07_ReportSearch_msDAO
						.getT47_transactionList_bs(sqlMap,
								t07_case_application,
								this.getStartRec(intPage), this
										.getIntPageSize());
				int totalRow = t07_ReportSearch_msDAO
						.getT07_transacionListCount_bs(sqlMap,
								t07_case_application);
				String url = request.getContextPath() + "/inves"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("intPage", intPage + "");
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
		request.setAttribute("t47_transactionList", t47_transactionList);
		//
		return actionMapping.findForward("success");
	}
	
	/**
	 * ����excl lp
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward export_trans_bs(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		T07_ReportSearch_msDAO t07_ReportSearch_msDAO = (T07_ReportSearch_msDAO) context.getBean("t07_ReportSearch_msDAO");
		T07_case_application t07_case_application;
		try {
			// ��֯�û������Ļ���ID
			t07_case_application = (T07_case_application) session
					.getAttribute("t07_case_applicationSearchObj");
			if (t07_case_application == null)
				t47_transactionList = new ArrayList();
			else
				t47_transactionList = t07_ReportSearch_msDAO
						.getT47_transactionList_bs(sqlMap,
								t07_case_application, 0, 5000);
			
			
			if(t47_transactionList.size() > 5000){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","һ�ε������ײ��ó���5000����"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			String excelName = DateUtils.getDate10to8(DateUtils.getCurrTime())+"transbs";
			request.setAttribute("excelName", excelName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_transactionList", t47_transactionList);

		return actionMapping.findForward("success");
	}
	/**
	 * ���ײ�ѯ
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */

	public ActionForward performGetT47_transactionList_bh(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList = new ArrayList();
		String pageInfo = "";
		T07_ReportSearch_msDAO t07_ReportSearch_msDAO = (T07_ReportSearch_msDAO) context.getBean("t07_ReportSearch_msDAO");	
		T07_case_application t07_case_application = new T07_case_application();
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// ��������
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
				casecagetoryMap, null, true));
		// ��ѯ����
		LinkedHashMap casesorderMap = cm.getMapFromCache("repoetsearch_list");
		request.setAttribute("casesorderMap", this.getOptionsListByMap(
				casesorderMap, null, true));
		// ����Ա��
		LinkedHashMap staff_List = cm.getMapFromCache("staff");
		request.setAttribute("staff_List", this.getOptionsListByMap(staff_List,
				null, false));

		try {
			T07_ReportSearch_msActionForm form = (T07_ReportSearch_msActionForm) actionForm;
			// ����
//			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
//			request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
//					null, true));
			String curr_cd_str=cm.getMapFromCacheToStr("curr_cd", "curr_cd", form.getCurr_cd(),"", true);
			request.setAttribute("curr_cd_str", curr_cd_str);
			
			// ����״̬
//			LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
//			request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
//					casesearchtimeMap, null, false));
			if(form.getCasesearchtime() == null || "".equals(form.getCasesearchtime()))
				form.setCasesearchtime("0");
			String casesearchtime_str=cm.getMapFromCacheToStr("repoetsearch_state", "casesearchtime", form.getCasesearchtime(),"", false);
			request.setAttribute("casesearchtime_str", casesearchtime_str);

			
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
			}
			if (!newsearchflag.equals("2")) {// �״ν��벻��ѯ
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					MyBeanUtils.copyBean2Bean(t07_case_application, form);
					
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
				} else {// ��ҳ
					t07_case_application = (T07_case_application) session
							.getAttribute("t07_case_applicationSearchObj");
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
				t47_transactionList = t07_ReportSearch_msDAO
						.getT47_transactionList_bh(sqlMap,
								t07_case_application,
								this.getStartRec(intPage), this
										.getIntPageSize());
				int totalRow = t07_ReportSearch_msDAO
						.getT07_transacionListCount_bh(sqlMap,
								t07_case_application);
				String url = request.getContextPath() + "/inves"
						+ actionMapping.getPath() + ".do";

				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				request.setAttribute("intPage", intPage + "");
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
		request.setAttribute("t47_transactionList", t47_transactionList);
		//
		return actionMapping.findForward("success");
	}

	public ActionForward export_trans_bh(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t47_transactionList;
		T07_ReportSearch_msDAO t07_ReportSearch_msDAO = (T07_ReportSearch_msDAO) context.getBean("t07_ReportSearch_msDAO");	
		T07_case_application t07_case_application;
		try {
			// ��֯�û������Ļ���ID
			// String dt_start = "", dt_end = "";
			t07_case_application = (T07_case_application) session
					.getAttribute("t07_case_applicationSearchObj");
			if (t07_case_application == null)
				t47_transactionList = new ArrayList();
			else
				t47_transactionList = t07_ReportSearch_msDAO
						.getT47_transactionList_bh(sqlMap,
								t07_case_application, 0, 5000);
			
			if(t47_transactionList.size() > 5000){
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","һ�ε������ײ��ó���5000����"));
		        saveErrors(request, errors);
    			return actionMapping.findForward("failure");
			}
			String excelName = DateUtils.getDate10to8(DateUtils.getCurrTime())+"transbh";
			request.setAttribute("excelName", excelName);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t47_transactionList", t47_transactionList);

		return actionMapping.findForward("success");
		
	}
	
	/**
	 * ���ɽ���ɾѡ��ѯ
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
	public ActionForward performGetT07_reportsearch_bs(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList searchT07_case_applicationList = new ArrayList();
		String pageInfo = "";
		T07_ReportSearch_msDAO t07_ReportSearch_msDAO = (T07_ReportSearch_msDAO) context.getBean("t07_ReportSearch_msDAO");	
		T07_case_application t07_case_application = new T07_case_application();
		String casesearchtime=request.getParameter("casesearchtime");
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// ����״̬
		LinkedHashMap casesearchtimeMap = cm.getMapFromCache("repoetsearch_state");
		request.setAttribute("casesearchtimeMap", this.getOptionsListByMap(
				casesearchtimeMap, null, false));
		// �϶�״̬
		LinkedHashMap deal_stateMap = cm.getMapFromCache("casestatus");
		request.setAttribute("deal_stateMap", this.getOptionsListByMap(
				deal_stateMap, null, true));
		// �Ƿ������
		LinkedHashMap is_menuMap = cm.getMapFromCache("yesNo");
		request.setAttribute("is_menuMap", this.getOptionsListByMap(
				is_menuMap, null, true));
		// ��������
		LinkedHashMap casecagetoryMap = cm.getMapFromCache("casecagetory1");
		request.setAttribute("casecagetoryMap", this.getOptionsListByMap(
				casecagetoryMap, null, true));
		// ��ѯ����
		LinkedHashMap casesorderMap = cm.getMapFromCache("repoetsearch_list");
		request.setAttribute("casesorderMap", this.getOptionsListByMap(
				casesorderMap, null, true));
		// ����
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
				null, true));
		
		// ��������
		LinkedHashMap casetypeMap = cm.getMapFromCache("casetype");
		request.setAttribute("casetypeMap", this.getOptionsListByMap(casetypeMap,
				null, true));
		try {
			T07_ReportSearch_msActionForm form = (T07_ReportSearch_msActionForm) actionForm;
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
			}
			if (!newsearchflag.equals("2")) {// �״ν��벻��ѯ
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					MyBeanUtils.copyBean2Bean(t07_case_application, form);
					// �ͻ���
					intPage = 0;
					if (form.getParty_id() != null
							&& !"".equals(form.getParty_id().trim())) {
						t07_case_application.setParty_id(form.getParty_id());
					}
					// �������
					if (form.getApp_org_id() != null
							&& !"".equals(form.getApp_org_id().trim())) {
						t07_case_application
								.setApp_org_id(form.getApp_org_id());
					}
					// �ͻ�����
					if (form.getParty_name() != null
							&& !"".equals(form.getParty_name().trim())) {
						t07_case_application
								.setParty_name(form.getParty_name());
					}
					// ��������
					if (form.getKind() != null
							&& !"".equals(form.getKind().trim())) {
						t07_case_application.setKind(form.getKind());
					}
					// ����
					if (form.getCurr_cd() != null
							&& !"".equals(form.getCurr_cd().trim())) {
						t07_case_application.setCurr_cd(form.getCurr_cd());
					}
					if (form.getStcrkey() != null
							&& !"".equals(form.getStcrkey().trim())) {
						t07_case_application.setStcrkey(form.getStcrkey());
					}
					// ����״̬
					if (form.getCasesearchtime() != null
							&& !"".equals(form.getCasesearchtime().trim())) {
						t07_case_application.setCasesearchtime(form
								.getCasesearchtime());
					}
					// ����
					if (form.getOrderby() != null
							&& !"".equals(form.getOrderby().trim())) {
						t07_case_application.setOrderby(form.getOrderby());
					}
					// ������
					if (form.getOrder() != null
							&& !"".equals(form.getOrder().trim())) {
						t07_case_application.setOrder(form.getOrder());
					}
					// ���������ݵ�ת��
					if (form.getApp_dt_start_disp() != null
							&& !"".equals(form.getApp_dt_start_disp())) {
						t07_case_application
								.setApp_dt_start(DateUtils
										.stringToDateShort(form
												.getApp_dt_start_disp()));
						t07_case_application.setApp_dt_end_disp(form.getApp_dt_start_disp() );
					}
					if (form.getApp_dt_end_disp() != null
							&& !"".equals(form.getApp_dt_end_disp())) {
						t07_case_application.setApp_dt_end(DateUtils
								.stringToDateShort(form.getApp_dt_end_disp()));
						t07_case_application.setApp_dt_end_disp(form.getApp_dt_end_disp());

					}
					session.removeAttribute("t07_case_applicationSearchObj");
					session.setAttribute("t07_case_applicationSearchObj",
							t07_case_application);
					session.setAttribute("casesearchtime", casesearchtime);
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
				searchT07_case_applicationList = t07_ReportSearch_msDAO
						.search_allbsT07_case_applicationList(sqlMap,
								t07_case_application,
								this.getStartRec(intPage), this
										.getIntPageSize());
				int totalRow = t07_ReportSearch_msDAO
						.search_allbsT07_case_applicationListCount(sqlMap,
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
		return actionMapping.findForward("success");
	}
	/**
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
		T07_alertDAO t07_alertDAO = (T07_alertDAO) context.getBean("t07_alertDAO");	
		T07_alert t07_alert = new T07_alert();
		T07_case_applicationDAO t07_case_applicationDAO = (T07_ReportSearch_msDAO) context.getBean("t07_case_applicationDAO");	
		T07_case_application t07_case_application = new T07_case_application();
		T07_case_stcr t07_case_stcr = new T07_case_stcr();
		String pageInfo = "";
		HttpSession session = request.getSession();
		try {

			String stcr = request.getParameter("stcr");
			String application_num = request.getParameter("application_num");
			String party_id= request.getParameter("party_id");
			String casesearchtime= request.getParameter("casesearchtime");
			request.setAttribute("casesearchtime", casesearchtime);
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			t07_case_application = (T07_case_application) session.getAttribute("t07_case_application");
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				t07_case_stcr.setApplication_num(application_num);
				t07_case_stcr.setParty_id(party_id);
				t07_case_stcr.setStcr(stcr);
				t07_case_stcr.setCase_type(t07_case_application.getCast_type());
				t07_case_stcr.setCasesearchtime(casesearchtime);
				session.setAttribute("t07_case_stcr", t07_case_stcr);
			}else{
				t07_case_stcr = (T07_case_stcr) session.getAttribute("t07_case_stcr");
			}
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

}