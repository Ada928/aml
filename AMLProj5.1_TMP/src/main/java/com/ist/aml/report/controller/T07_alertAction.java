/**
 * Create by makecode program v2.0
 * ����             ���� 		����
 * 2006-12-28   ����		����
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
import com.ist.aml.report.dao.T07_alertDAO;
import com.ist.aml.report.dto.T07_alert;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.properties.XMLProperties;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_alertAction extends BaseAction {
	/**
	 * 
	 */
	private static final long serialVersionUID = -50168468267996581L;
	private static Logger logger = LogUtils.getLogger(
			T07_alertAction.class.getName()).getLogger(Constans.LOGGERNAMEA);

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
		String myaction = mapping.getParameter();
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		// ��ѯ����update by shichao 20110717
		if ("searchT07_alert".equalsIgnoreCase(myaction)) {
			myforward = performSearchT07_alert(mapping, form, request, response);
		}
		// ��ѯ���update by shichao 20110717
		else if ("getT07_alertList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_alertList(mapping, form, request,
					response);
		}
		else if ("t07_alerttrans_export".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_alert_transList(mapping, form, request,
					response);
		}// ��ѯ��ϸ��Ϣ
		else if ("getT07_alertAllDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_alertAllDisp(mapping, form, request,
					response);
		}
		return myforward;

	}


	/**
	 * Author Zk 2007-1-12
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
	public ActionForward performSearchT07_alert(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			T07_alertActionForm form = (T07_alertActionForm) actionForm;
			actionForm.reset(actionMapping, request);
			// ��ȡҳ������Ҫ�������˵���Ϣ
			// ��ȡ�Ƿ���Ҫ����Ĳ���
			XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
			String iscountalert = sysConfig.getProperty("alert.iscountalsert");
			request.setAttribute("iscountalert", iscountalert);
			// Ԥ����ʽ
			LinkedHashMap alertkindMap = cm.getMapFromCache("alertkind");
			request.setAttribute("alertkindMap", this.getOptionsListByMap(
					alertkindMap, null, true));
			// Ԥ������
			LinkedHashMap alerttypeMap = cm.getMapFromCache("casetype");
			request.setAttribute("alerttypeMap", this.getOptionsListByMap(
					alerttypeMap, null, false));
			
			LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
			request.setAttribute("curr_cdMap", this.getOptionsListByMap(
					curr_cdMap, null, true));
			
			
			// Ԥ��ʱ��  add by lixx 2009.7.31
			LinkedHashMap alertsearchtimeMap = cm.getMapFromCache("alertsearchtime");
			request.setAttribute("alertsearchtimeMap", this.getOptionsListByMap(
					alertsearchtimeMap, null, false));
			
			// ��������
			//TreeMap alertorderMap = cm.getColumnCatch("alertorder", true);
			LinkedHashMap alertorderMap = cm.getMapFromCache("alertorder");
			request.setAttribute("alertorderMap", this.getOptionsListByMap(
					alertorderMap, null, true));
			
			// ���й���
			LinkedHashMap pbcruleMap = cm.getMapFromCache("pbcrule");
			request.setAttribute("pbcruleMap", this.getOptionsListByMap(
					pbcruleMap, null, true));
			
			ArrayList ruleList = cm.getListFromCache("getT07_pbcrule");
			request.setAttribute("ruleList", ruleList);
			String today = DateUtils.getCurrTime();
			DateUtils dateUtils = new DateUtils();
			String tendaybefor = dateUtils.getDateChangeTime(today, "d",
					-Constans.BEFOREDAY);
			tendaybefor = tendaybefor.substring(0, 10);
			today = today.substring(0, 10);

			form.setAlert_dt_start_disp(tendaybefor);
		    form.setAlert_dt_end_disp(today);
		} catch (Exception e) {
			e.printStackTrace();
			
		}

		request.setAttribute("pageInfo", "");
		return actionMapping.findForward("success");
	}
	/**
	 * Author Zk 2007-1-5
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
	public ActionForward performGetT07_alertList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_alertList;
		String pageInfo = "";
		T07_alertDAO t07_alertDAO = (T07_alertDAO) context.getBean("t07_alertDAO");
		T07_alert t07_alert = new T07_alert();
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// Ԥ����ʽ
		LinkedHashMap alertkindMap = cm.getMapFromCache("alertkind");
		request.setAttribute("alertkindMap", this.getOptionsListByMap(
				alertkindMap, null, true));
		// Ԥ������
		LinkedHashMap alerttypeMap = cm.getMapFromCache("casetype");
		request.setAttribute("alerttypeMap", this.getOptionsListByMap(
				alerttypeMap, null, false));
		LinkedHashMap curr_cdMap = cm.getMapFromCache("curr_cd");
		request.setAttribute("curr_cdMap", this.getOptionsListByMap(curr_cdMap,
				null, true));

		
		// Ԥ��ʱ��  add by lixx 2009.7.31
		LinkedHashMap alertsearchtimeMap = cm.getMapFromCache("alertsearchtime");
		request.setAttribute("alertsearchtimeMap", this.getOptionsListByMap(
				alertsearchtimeMap, null, false));
		
		// ��������
		LinkedHashMap alertorderMap = cm.getMapFromCache("alertorder");
		request.setAttribute("alertorderMap", this.getOptionsListByMap(
				alertorderMap, null, true));
		// ���й���
		LinkedHashMap pbcruleMap = cm.getMapFromCache("pbcrule");
		request.setAttribute("pbcruleMap", this.getOptionsListByMap(pbcruleMap,
				null, true));
		ArrayList ruleList = cm.getListFromCache("getT07_pbcrule");
		request.setAttribute("ruleList", ruleList);
		try {
			T07_alertActionForm form = (T07_alertActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			String searchtype = (String) request.getParameter("searchtype");
			request.setAttribute("searchtype", searchtype);
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			// ȡ��ҳ�������еĲ�ѯ�Ĳ���
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t07_alert, form);
				String alert_dt_start = request
						.getParameter("alert_dt_start_disp");
				String alert_dt_end = request.getParameter("alert_dt_end_disp");
				String alertsearchtime = request.getParameter("alertsearchtime");
				if (t07_alert.getObjname() != null
						&& !t07_alert.getObjname().trim().equals("")) {
					t07_alert.setObjname("%"+t07_alert.getObjname()+"%");
				}
				
				if (alert_dt_start != null && !alert_dt_start.trim().equals("")) {
					t07_alert.setAlert_dt_start(DateUtils
							.stringToDateShort(alert_dt_start));
				}
				if (alert_dt_end != null && !alert_dt_end.trim().equals("")) {
					t07_alert.setAlert_dt_end(DateUtils
							.stringToDateShort(alert_dt_end));
				}
				//Ԥ��ʱ���ж� 0��ǰ 1��ʷ
				if(alertsearchtime !=null && alertsearchtime.equals("1")){
					t07_alert.setAlertsearchtime("1");
				}else{
					t07_alert.setAlertsearchtime("0");
				}
				session.setAttribute("t07_alertSearchObj", t07_alert);
			} else {// ��ҳ
				t07_alert = (T07_alert) session
						.getAttribute("t07_alertSearchObj");
				intPage = StringUtils.nullObject2int(request
						.getParameter("intPage"), 0);
				if (intPage == 0) {// ����Ǵ�����ҳ�淵�أ�������ҳ�淵��ʱ���ܴ�inpPage������
					intPage = StringUtils
							.nullObject2int(t07_alert.getIntPage());
				}
				t07_alert.setIntPage("" + intPage);
				session.setAttribute("t07_alertSearchObj", t07_alert);
			}
			// ��֯�û������Ļ���ID
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String org_id =auth.getOrganstr();
			t07_alert.setOrgankey(org_id);
			t07_alertList = t07_alertDAO.getT07_alertList(sqlMap, t07_alert,
					this.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t07_alertDAO
					.getT07_alertListCount(sqlMap, t07_alert);
			//end modify
			String url = request.getContextPath() + "/inves"
					+ actionMapping.getPath() + ".do";
			MyBeanUtils.copyBean2Bean(form, t07_alert);
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t07_alertList", t07_alertList);
		return actionMapping.findForward("success");
	}
	
	/**
	 * Author Zk 2007-1-6
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
	public ActionForward performGetT07_alert_transList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t07_alertList;
		String pageInfo = "";
		T07_alertDAO t07_alertDAO = (T07_alertDAO) context.getBean("t07_alertDAO");
		T07_alert t07_alert = new T07_alert();
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// Ԥ������
		LinkedHashMap alertkindMap = cm.getMapFromCache("alertkind");
		request.setAttribute("alertkindMap", this.getOptionsListByMap(
				alertkindMap, null, true));
		
		// ��������
		LinkedHashMap alertorderMap = cm.getMapFromCache("alertorder");
		request.setAttribute("alertorderMap", this.getOptionsListByMap(
				alertorderMap, null, true));
		try {
			T07_alertActionForm form = (T07_alertActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			
			String alert_dt_start = request.getParameter("alert_dt_start_disp");
			String alert_dt_end = request.getParameter("alert_dt_end_disp");
			MyBeanUtils.copyBean2Bean(t07_alert, form);
			// ģ��ƥ�䣬��Ҫ���⴦��һ��
			if (t07_alert.getName() != null) {
				t07_alert.setName("%" + t07_alert.getName() + "%");
			}

			if (alert_dt_start != null && !alert_dt_start.trim().equals("")) {
				t07_alert.setAlert_dt_start(DateUtils
						.stringToDateShort(alert_dt_start));
			}
			if (alert_dt_end != null && !alert_dt_end.trim().equals("")) {
				t07_alert.setAlert_dt_end(DateUtils
						.stringToDateShort(alert_dt_end));
			}
			session.setAttribute("t07_alertSearchObj", t07_alert);

			if (newsearchflag.equals("1")) {// ���ʻ��ۼ��ֽ�ҵ������׼
				t07_alert.setPbckey("PBC20061114DE01");
			}
			if (newsearchflag.equals("2")) {// �Թ��ʻ�����ת�����׼
				t07_alert.setPbckey("PBC20061114DE02");
			}
			if (newsearchflag.equals("3")) {// �����ʻ���Թ��ʻ����ת�����׼
				t07_alert.setPbckey("PBC20061114DE03");
			}
			if (newsearchflag.equals("4")) {// �羳���׽������׼
				t07_alert.setPbckey("PBC20061114DE04");
			}
			if (newsearchflag.equals("10")) {// ��ɢת�뼯��ת������ת���ɢת��
				t07_alert.setPbckey("PBC20061114KY01");
			}
			if (newsearchflag.equals("11")) {// ��������ͬ�ո�����Ƶ���ո����ӽ�����׼
				t07_alert.setPbckey("PBC20061114KY02");
			}
			if (newsearchflag.equals("12")) {// �����ʻ�ͻȻ���û�С�����û��д����ʽ��ո�
				t07_alert.setPbckey("PBC20061114KY04");
			}
			if (newsearchflag.equals("13")) {// ������ԭ���ͷ���������ҷ��������ʽ��ո�
				t07_alert.setPbckey("PBC20061114KY06");
			}
			if (newsearchflag.equals("14")) {// �ֽ𹺻��Ҵӷ�ͬ���ʻ�ת��
				t07_alert.setPbckey("PBC20061114KY08");
			}
			if (newsearchflag.equals("15")) {// ���ɵ��ڲ���
				t07_alert.setPbckey("PBC20061114KY09");
			}
			if (newsearchflag.equals("16")) {// �ʱ����ʻ������ʽ���������������
				t07_alert.setPbckey("PBC20061114KY11");
			}
			if (newsearchflag.equals("17")) {// Ƶ����ȡ�����뾭Ӫҵ�������޹�
				t07_alert.setPbckey("PBC20061114KY03");
			}
			if (newsearchflag.equals("18")) {// �ʱ����������ɵ���������ֱ����ծ
				t07_alert.setPbckey("PBC20061114KY12");
			}
			if (newsearchflag.equals("19")) {// ��������ɵ���ó��Ƶ�����ʽ��ո�Ƶ��
				t07_alert.setPbckey("PBC20061114KY05");
			}
			if (newsearchflag.equals("20")) {// ��ǰ��������������״�����Բ���
				t07_alert.setPbckey("PBC20061114KY07");
			}
			if (newsearchflag.equals("21")) {// ������������֧Ʊ������һ�Ʊ���뾭Ӫ״������
				t07_alert.setPbckey("PBC20061114KY10");
			}
			if (newsearchflag.equals("22")) {// ֤ȯ��Ӫ���������뽻�ס������޹ص��ʽ�
				t07_alert.setPbckey("PBC20061114KY13");
			}
			if (newsearchflag.equals("23")) {// ֤ȯ��Ӫ����Ƶ�������������ʽ�
				t07_alert.setPbckey("PBC20061114KY14");
			}
			if (newsearchflag.equals("24")) {// ���ջ���Ƶ��������ͬһͶ�����⸶���˱�
				t07_alert.setPbckey("PBC20061114KY15");
			}
			if (newsearchflag.equals("25")) {// ��Ȼ���ʻ�Ƶ���ֽ��ո���һ���Դ���ȡ
				t07_alert.setPbckey("PBC20061114KY16");
			}
			if (newsearchflag.equals("26")) {// �����Ǿ���Ƶ����������֧Ʊ���Ʊҵ��
				t07_alert.setPbckey("PBC20061114KY17");
			}
			if (newsearchflag.equals("27")) {// ��һ�˻������˽����밶�ʻ��ʽ�ת����ҵ��
				t07_alert.setPbckey("PBC20061114KY18");
			} else {// ��ҳ
				t07_alert = (T07_alert) session
						.getAttribute("t07_alertSearchObj");

			}

			t07_alertList = t07_alertDAO.getT07_alert_transNewList(sqlMap, t07_alert,0, 5000);
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
			        "error.pagertitle.default", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

	
		request.setAttribute("t07_alertList", t07_alertList);
	
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT07_alertAllDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
	
		ArrayList getT07_alert_indicList;
		ArrayList getT07_alert_transList;
		 String pageInfo="";
			T07_alertDAO t07_alertDAO = (T07_alertDAO) context.getBean("t07_alertDAO");
		T07_alert t07_alert = new T07_alert();
		HttpSession session = request.getSession();
		
		try {
			T07_alertActionForm form = (T07_alertActionForm) actionForm;
			String alertkey = request.getParameter("alertkey");
			String alert_type_cd = request.getParameter("alert_type_cd");
			String alertsearchtime = request.getParameter("alertsearchtime");
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);	
			if(intPage<=1){
				t07_alert.setAlertsearchtime(alertsearchtime);
				t07_alert.setAlertkey(alertkey);
				t07_alert.setAlert_type_cd(alert_type_cd);
			     session.setAttribute("t07_alertobj", t07_alert);
			}else{
				t07_alert=(T07_alert)session.getAttribute("t07_alertobj");
				if(t07_alert!=null){
					alertsearchtime=t07_alert.getAlertsearchtime();
				}
				
			}
				request.setAttribute("alertsearchtime", alertsearchtime);	
			
			t07_alert = t07_alertDAO.getT07_alertDispByHistoryCase(sqlMap, t07_alert);
			t07_alert.setAlertsearchtime(alertsearchtime);
			
			// ȡ�ø�Ԥ��������ָ����Ϣ
			getT07_alert_indicList = t07_alertDAO.getT07_alert_indicList(
					sqlMap, t07_alert, alertkey,

					this.getStartRec(intPage), this.getIntPageSize());
			// ȡ�ø�Ԥ��������������Ϣ
			t07_alert.setAlertkey(alertkey);

				getT07_alert_transList = t07_alertDAO.getT07_alert_transList(
						sqlMap, t07_alert, this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t07_alertDAO.getT07_alert_transListCount(sqlMap, t07_alert);
				String url = request.getContextPath() + "/inves"+ actionMapping.getPath() + ".do";
				MyBeanUtils.copyBean2Bean(form, t07_alert);
				  pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			
			
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_alert", t07_alert);
		request.setAttribute("getT07_alert_indicList", getT07_alert_indicList);
		request.setAttribute("getT07_alert_transList", getT07_alert_transList);
		 request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	
}