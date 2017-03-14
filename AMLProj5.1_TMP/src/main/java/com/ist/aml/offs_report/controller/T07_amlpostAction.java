package com.ist.aml.offs_report.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.ist.aml.offs_report.dao.T07_amlpostDAO;
import com.ist.aml.offs_report.dto.T07_amlpost;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

public class T07_amlpostAction extends BaseAction {

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
		// ��ѯ���
		if ("getT07_amlpostList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_amlpostList(mapping, form, request,
					response);
		}
		// ��ӽ���
		else if ("addT07_amlpost".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_amlpost(mapping, form, request, response);
		}
		// ��Ӷ���
		else if ("addT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_amlpostDo(mapping, form, request,
					response);
		}
		// �޸Ľ���
		else if ("modifyT07_amlpost".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_amlpost(mapping, form, request,
					response);
		} else if ("modifyT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_amlpostDo(mapping, form, request,
					response);
		}
		// ɾ������
		else if ("deleteT07_amlpostDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_amlpostDo(mapping, form, request,
					response);
		}
		// ����xls�ļ�:Ireport
		else if ("getT07_amlpost_xls".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_amlpost_xls(mapping, form, request,
					response);
		}
		//from 2012.7.6 modified by lijie
		// ����xls�ļ�:excelת����jsp
		else if ("export_t07_amlpostList".equalsIgnoreCase(myaction)) {
			myforward = performExport_t07_amlpostList(mapping, form, request,
					response);
		}
		return myforward;

	}

	public ActionForward performGetT07_amlpostList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_amlpostList = new ArrayList();
		HttpSession session = request.getSession();
		LinkedHashMap map = new LinkedHashMap();
		String pageInfo = "";
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO) context
				.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();

		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;

			String url = request.getContextPath() + "/offs_report"
					+ actionMapping.getPath() + ".do";
			String reset = (String) request.getAttribute("reset");
			if (reset == null)
				reset = "";
			if (reset.equals("yes")) {// �������ӻ��޸Ķ�����ת��������Ҫ���г�ʼ������
				form.reset();
			}
			// ��ѯ��������
			MyBeanUtils.copyBean2Bean(t07_amlpost, form);
			String uporgankey = StringUtils.null2String(
					(String) request.getParameter("uporgankey")).trim();
			t07_amlpost.setUporgankey(uporgankey);

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			AuthBean authBean = (AuthBean) request.getSession().getAttribute(
					"authBean");
			String orgStr = authBean.getAuthToken().getOrganstr();
			String os = orgStr.substring(orgStr.length() - 5,
					orgStr.length() - 1);
			session.setAttribute("os", os);
			t07_amlpost.setOrganstr(orgStr);// �����û�����Ȩ��
			if (!newsearchflag.equals("2")) {
				if (newsearchflag.equals("1")) {// �µĲ�ѯ
					String organSelected = this.getOrganSelected(request, map);// �û�ѡ���ѯ�Ļ�����
					t07_amlpost.setOrgankey(organSelected);
//					this.setSearchObj(t07_amlpost);
//					this.setSearchObj(t07_amlpost);
					request.getSession().setAttribute("t07_amlpostSearch",
							t07_amlpost);
				} else {// ���ػ�ҳ
					T07_amlpost temp = (T07_amlpost) request.getSession()
							.getAttribute("t07_amlpostSearch");
					if (temp != null)
						t07_amlpost = temp;
					MyBeanUtils.copyBean2Bean(form, t07_amlpost);
					if (uporgankey.equals(""))
						uporgankey = t07_amlpost.getUporgankey();// ȡ���ϴβ�ѯ���ϼ�������
					this.getOrganSelected(t07_amlpost.getOrgankey(), map);// ��ѡ��ѯ������
				}
				t07_amlpostList = t07_amlpostDAO.getT07_amlpostList(sqlMap,
						t07_amlpost, this.getStartRec(intPage), this
								.getIntPageSize());
				if (t07_amlpostList == null)
					t07_amlpostList = new ArrayList();
				if (newsearchflag.equals("1") || reset.equals("yes")) {
					request.getSession().setAttribute("t07_amlpostList",
							t07_amlpostList);
				}
				request.setAttribute("size", t07_amlpostList.size() + "");

				int totalRow = t07_amlpostDAO.getT07_amlpostListCount(sqlMap,
						t07_amlpost);
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			}
			String organMultiSelHTMLStr = StaticMethod.getOrganMultiSelHTML(
					request, uporgankey, map, 10, cm);
			request.setAttribute("organMultiSelHTMLStr", organMultiSelHTMLStr);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t07_amlpostList", t07_amlpostList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}

	/**
	 *��ӽ���
	 * 
	 * @param mpping
	 *            ActionMapping
	 * @param form
	 *            ActionForm
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return ActionForward
	 */
	public ActionForward performAddT07_amlpost(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			T07_amlpost t07_amlpost = new T07_amlpost();
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(form, t07_amlpost);
			// ְλ������ѡ��
			LinkedHashMap postitlemap = cm.getMapFromCache("postitle");
			request.setAttribute("postitlemap", this.getOptionsListByMap(
					postitlemap, null, true));
			// ְλ״��������ѡ��
			LinkedHashMap us_statusmap = cm.getMapFromCache("us_status");
			request.setAttribute("us_statusmap", this.getOptionsListByMap(
					us_statusmap, null, true));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * ��Ӷ���
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
	public ActionForward performAddT07_amlpostDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			//
			PropertyUtils.copyProperties(t07_amlpost, form);
			String user_id = this.getSequenceNextVal("t07_amlpost_user_id");
			t07_amlpost.setUser_id(user_id);

			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// �����û������Ϣ
			t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());// ������DateUtils.getCurrDateTime()
			t07_amlpost.setLast_upd_dt(DateUtils.getCurrDateTime());// ����ʱ��
			t07_amlpost.setLast_upd_dt_disp(DateUtils
					.dateToStringShort(t07_amlpost.getLast_upd_dt()));
			// t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());//������
			t07_amlpost.setOrgankey(auth.getT00_user().getOrgankey());// ����

			if (t07_amlpost.getFull_time_num() == null
					|| t07_amlpost.getFull_time_num().trim().equals("")) {
				t07_amlpost.setFull_time_num("0");
			}
			if (t07_amlpost.getPart_time_num() == null
					|| t07_amlpost.getPart_time_num().trim().equals("")) {
				t07_amlpost.setPart_time_num("0");
			}

			int rows = t07_amlpostDAO.insertT07_amlpost(sqlMap, t07_amlpost);
			if (rows <= 0) {
				throw new Exception("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}

	/**
	 * �޸Ľ���
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
	public ActionForward performModifyT07_amlpost(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			String user_id_selected[] = form.getUser_id_selected();
			if (user_id_selected == null || user_id_selected.length != 1) {
				return actionMapping.findForward("failure");
			}
			String user_id = user_id_selected[0];
			t07_amlpost = t07_amlpostDAO.getT07_amlpostDisp(sqlMap, user_id);

			LinkedHashMap organ = cm.getMapFromCache("organ");

			t07_amlpost.setOrgankey_disp((String) organ.get(t07_amlpost
					.getOrgankey()));
			PropertyUtils.copyProperties(form, t07_amlpost);
			String ork = (String) session.getAttribute("os");
			session.setAttribute("os", ork);
			if (form.getOrgankey() != null || !form.getOrgankey().equals("")) {
				if (!ork.equals(form.getOrgankey())) {
					session.setAttribute("ork", "0");
				} else {
					session.setAttribute("ork", "1");
				}
			}

			request.setAttribute("t07_amlpostname", t07_amlpost.getUser_id());
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * �޸Ķ���
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
	public ActionForward performModifyT07_amlpostDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			PropertyUtils.copyProperties(t07_amlpost, form);
			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// �����û������Ϣ
			t07_amlpost.setLast_upd_dt(DateUtils.getCurrDateTime());// ����ʱ��
			t07_amlpost.setLast_upd_dt_disp(DateUtils
					.dateToStringShort(t07_amlpost.getLast_upd_dt()));
			t07_amlpost.setLast_upd_user(auth.getT00_user().getModifier());// ������
			t07_amlpost.setOrgankey(auth.getT00_user().getOrgankey());// ����
			t07_amlpostDAO.modifyT07_amlpost(sqlMap, t07_amlpost);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_amlpostname", t07_amlpost.getUser_id());
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}

	/**
	 * ɾ������
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
	public ActionForward performDeleteT07_amlpostDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		HttpSession session = request.getSession();
		String os = (String) session.getAttribute("os");
		int l = 0;
		try {
			T07_amlpostActionForm form = (T07_amlpostActionForm) actionForm;
			String selectId[] = form.getUser_id_selected();
			if (selectId != null && selectId.length > 0) {
				for (int i = 0; i < selectId.length; i++) {
					String user_id = selectId[i];
					T07_amlpost t07_amlpost = t07_amlpostDAO
							.getT07_amlpostDisp(sqlMap, user_id);
					if (!os.equals(t07_amlpost.getOrgankey())) {
						l++;
					}
				}
				if (1 < 0) {
					request.setAttribute("tishi", "L");
				} else {
					for (int i = 0; i < selectId.length; i++) {
						String user_id = selectId[i];
						t07_amlpostDAO.deleteT07_amlpost(sqlMap, user_id);
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("reset", "yes");
		return actionMapping.findForward("success");
	}
	
	/**
	 * add by lijie 2012.7.6
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
	public ActionForward performExport_t07_amlpostList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_amlpostList = new ArrayList();
		HttpSession session = request.getSession();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO) context.getBean("t07_amlpostDAO");
		T07_amlpost t07_amlpost = new T07_amlpost();

		try {
			t07_amlpost = (T07_amlpost)session.getAttribute("t07_amlpostSearch");
        	if(t07_amlpost==null){
        		t07_amlpostList=new ArrayList();
        	}else{
        		t07_amlpostList=t07_amlpostDAO.getT07_amlpostList(sqlMap, t07_amlpost, 0, 5000);
        	}
//        	request.setAttribute("t07_amlpost", t07_amlpost);
        	request.setAttribute("t07_amlpostList", t07_amlpostList);
        	
        	
        	
        	
        	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
    		Authorization auth = authBean.getAuthToken();
			LinkedHashMap report_organ_mapMap = cm.getMapFromCache("report_organ_map");
			LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
			String user_organkey = auth.getT00_user().getOrgankey();

			//���λ������
			String report_organkey = "";
			if (report_organ_mapMap.containsKey(user_organkey)) {
				report_organkey = report_organ_mapMap.get(user_organkey).toString();
			}
			//���λ����
			String report_orgname = "";
			if (report_organMap.containsKey(report_organkey)) {
				report_orgname = report_organMap.get(report_organkey).toString();
			}
			// �����
			String reportDate = DateUtils.dateToStringShort(new java.util.Date(System.currentTimeMillis()));
			//���
			String year = reportDate.substring(0, reportDate.indexOf("-"));
			//�Ʊ���
			String realName = auth.getT00_user().getRealname();
			//��ϵ�绰
			String telephone = StringUtils.null2String(auth.getT00_user().getTelephone());
			request.setAttribute("year", year);
			request.setAttribute("reportDate", reportDate);
			request.setAttribute("report_organkey", report_organkey);
			request.setAttribute("report_orgname", report_orgname);
			request.setAttribute("realName", realName);
			request.setAttribute("telephone", telephone);
			
			
			String level = "F";// ����ʹ�÷���
			String type_cd = "B";
			
			String downloadname = report_organkey + type_cd + year + "0" + level + "000";
			request.setAttribute("downloadname", downloadname);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {

		}
		return actionMapping.findForward("success");
	}
	
	/**
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
	public ActionForward performGetT07_amlpost_xls(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		try {
			// �������Ƶ�ǰ׺
			request.setAttribute("filehead", "amlpost_");
			// �����ļ�·��
			String jasperpath = "/WEB-INF/reports/t07_amlpost.jasper";
			request.setAttribute("jasperpath", jasperpath);
			// ���ñ������
			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			request.setAttribute("paramList", this.getParamList(auth));
			request.setAttribute("excelname", this.getExcelName(auth));
			request.setAttribute("isdel", "1");
			// ��������
			request.setAttribute("dataList", this.getReportDataList(request));
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally {

		}
		return actionMapping.findForward("success");
	}

	/**
	 * @since ����iReport��������Ĳ���
	 * @param t07_record
	 *            T07_record
	 * @return void
	 */
	public ArrayList getParamList(Authorization auth) {
		ArrayList paraList = new ArrayList();
		// ���ñ������
		paraList.add("���ڻ�����ϴǮ�����͸�λ�������");
		// ���ñ���������
		this.setReportHead(paraList, auth);
		return paraList;
	}

	/**
	 * @since ����iReport����������
	 * @param record_type_cd
	 *            String �������
	 * @param paraList
	 *            ArrayList ��������б�
	 * @return void
	 */
	public void setReportHead(ArrayList paraList, Authorization auth) {
		LinkedHashMap report_organ_mapMap = cm
				.getMapFromCache("report_organ_map");
		LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
		String user_organkey = auth.getT00_user().getOrgankey();

		String organkey = "";
		if (report_organ_mapMap.containsKey(user_organkey)) {
			organkey = report_organ_mapMap.get(user_organkey).toString();
		}
		String organname = "";
		if (report_organMap.containsKey(organkey)) {
			organname = report_organMap.get(organkey).toString();
		}
		// end by qiuyun

		String realName = auth.getT00_user().getRealname();// �Ʊ���
		String telephone = auth.getT00_user().getTelephone();// ��ϵ�绰
		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// �����
		String year = reportDate.substring(0, reportDate.indexOf("-"));// ���
		if (reportDate.indexOf("-") != -1)
			reportDate = reportDate.replaceAll("-", "");
		// ������Դ
		String level = "";
		level = "F";// ����ʹ�÷���
		paraList.add("B");// �������
		paraList.add(organkey);// ���λ����
		paraList.add(realName);// �Ʊ���
		paraList.add(level);// ������Դ
		paraList.add(organname);// ���λ����
		paraList.add(telephone);// ��ϵ�绰
		paraList.add(year);// ���
		paraList.add(reportDate);// �����
	}

	public String getExcelName(Authorization auth) {

		LinkedHashMap report_organ_mapMap = cm
				.getMapFromCache("report_organ_map");
		String user_organkey = auth.getT00_user().getOrgankey();

		String organkey = "";
		if (report_organ_mapMap.containsKey(user_organkey)) {
			organkey = report_organ_mapMap.get(user_organkey).toString();
		}

		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// �����
		String year = reportDate.substring(0, reportDate.indexOf("-"));

		String level = "";
		level = "F";// ����ʹ�÷���
		String type_cd = "B";
		String excelName = organkey + type_cd + year + "0" + level + "000";
		return excelName;
	}

	/**
	 * @since ȡ�ñ�������Դ
	 * @param record_type_cd
	 *            String ��������
	 * @param request
	 *            HttpServletRequest �������
	 * @return ArrayList
	 */
	public ArrayList getReportDataList(HttpServletRequest request)
			throws Exception {
		ArrayList dataList = new ArrayList();
		// ArrayList
		// t07_amlpostList=(ArrayList)request.getSession().getAttribute("t07_amlpostList");
		T07_amlpost searchObj = (T07_amlpost) request.getSession()
				.getAttribute("t07_amlpostSearch");
		if (searchObj == null)
			searchObj = new T07_amlpost();
		T07_amlpostDAO t07_amlpostDAO = (T07_amlpostDAO)context.getBean("t07_amlpostDAO");
		ArrayList t07_amlpostList = t07_amlpostDAO.getT07_amlpostList(sqlMap,
				searchObj);
		if (t07_amlpostList == null)
			t07_amlpostList = new ArrayList();

		for (int i = 0; i < t07_amlpostList.size(); i++) {
			T07_amlpost amlpost = (T07_amlpost) t07_amlpostList.get(i);
			if (amlpost == null)
				continue;
			ArrayList row = new ArrayList();
			row.add(amlpost.getDepartment());
			row.add(amlpost.getOrgan_username());
			row.add(amlpost.getOrgan_position());
			row.add(amlpost.getOrgan_telephone());
			row.add(amlpost.getDepart_username());
			row.add(amlpost.getDepart_telephone());
			row.add(amlpost.getFull_time_num());
			row.add(amlpost.getPart_time_num());
			dataList.add(row);
		}
		return dataList;
	}

	/**
	 * @since ȡ���û�ѡ��Ĳ�ѯ����
	 * @param request
	 *            HttpServletRequest �������
	 * @param map
	 *            HashMap ��Ż���
	 * @return String
	 */
	public String getOrganSelected(HttpServletRequest request, HashMap map) {
		StringBuffer organSelected = new StringBuffer("");
		String organ[] = request.getParameterValues("list2");
		if (organ == null || organ.length < 1)
			return "";
		if (map == null)
			map = new HashMap();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if (organMap == null)
			organMap = new LinkedHashMap();
		for (int i = 0; i < organ.length; i++) {
			String oneOrgan = organ[i];
			if (oneOrgan == null || oneOrgan.trim().equals(""))
				continue;
			organSelected.append("'" + oneOrgan + "',");
			map.put(oneOrgan, organMap.get(oneOrgan));
		}
		if (organSelected.length() > 1)
			organSelected.deleteCharAt(organSelected.length() - 1);
		return organSelected.toString();
	}

	/**
	 *���ò�ѯ��������
	 * 
	 * @param mapping
	 *            ActionMapping
	 * @return void
	 */
	public void setSearchObj(T07_amlpost t07_amlpost) {
		if (t07_amlpost.getOrgan_username() != null
				&& !t07_amlpost.getOrgan_username().trim().equals("")) {// ��λ����������
			t07_amlpost.setOrgan_username("%" + t07_amlpost.getOrgan_username()
					+ "%");
		}
		if (t07_amlpost.getOrgan_position() != null
				&& !t07_amlpost.getOrgan_position().trim().equals("")) {// ��λ������ְ������
			t07_amlpost.setOrgan_position("%" + t07_amlpost.getOrgan_position()
					+ "%");
		}
		if (t07_amlpost.getDepartment() != null
				&& !t07_amlpost.getDepartment().trim().equals("")) {// ��������
			t07_amlpost.setDepartment("%" + t07_amlpost.getDepartment() + "%");
		}
		if (t07_amlpost.getOrgan_telephone() != null
				&& !t07_amlpost.getOrgan_telephone().trim().equals("")) {// ��ϵ�绰
			t07_amlpost.setOrgan_telephone("%"
					+ t07_amlpost.getOrgan_telephone() + "%");
		}
		if (t07_amlpost.getDepart_username() != null
				&& !t07_amlpost.getDepart_username().trim().equals("")) {// ��ϴǮ���Ÿ�����
			t07_amlpost.setDepart_username("%"
					+ t07_amlpost.getDepart_username() + "%");
		}
		if (t07_amlpost.getDepart_telephone() != null
				&& !t07_amlpost.getDepart_telephone().trim().equals("")) {// ϴǮ������ϵ�绰
			t07_amlpost.setDepart_telephone("%"
					+ t07_amlpost.getDepart_telephone() + "%");
		}
	}

	/**
	 * @since ��ҳ����ת���ȡ���û��ϴβ�ѯѡ��Ĳ�ѯ����
	 * @param organSelected
	 *            String ��ѡ��ѯ������
	 * @param map
	 *            HashMap ��Ż���
	 * @return String
	 */
	public void getOrganSelected(String organSelected, HashMap map) {
		if (organSelected == null || organSelected.trim().equals(""))
			return;
		if (map == null)
			map = new HashMap();
		LinkedHashMap organMap = cm.getMapFromCache("organ");
		if (organMap == null)
			organMap = new LinkedHashMap();
		String organ[] = organSelected.split(",");
		for (int i = 0; i < organ.length; i++) {
			String oneOrgan = organ[i];
			if (oneOrgan == null || oneOrgan.trim().equals(""))
				continue;
			oneOrgan = oneOrgan.replaceAll("'", "");
			oneOrgan = oneOrgan.trim();
			map.put(oneOrgan, organMap.get(oneOrgan));
		}
	}
}
