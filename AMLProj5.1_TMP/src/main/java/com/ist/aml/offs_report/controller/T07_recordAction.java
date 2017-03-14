/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2009-02-02] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */
package com.ist.aml.offs_report.controller;

/**
 * <p>T07_recordActoin.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */
import org.apache.struts.action.*;

import javax.servlet.http.*;

import java.lang.reflect.InvocationTargetException;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.beanutils.PropertyUtils;
import com.ist.aml.offs_report.dao.*;
import com.ist.aml.offs_report.dto.*;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dao.T00_organDAO;
import com.ist.platform.dto.T00_organ;
import com.ist.util.*;

public class T07_recordAction extends BaseAction {
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
		if ("getT07_recordList".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_recordList(mapping, form, request,
					response);
		} else if ("searchT07_record".equalsIgnoreCase(myaction)) {
			myforward = this.performSearchT07_record(mapping, form, request,
					response);
		}
		// ��ӽ���
		else if ("addT07_record".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_record(mapping, form, request, response);
		}
		// ��Ӷ���
		else if ("addT07_recordDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT07_recordDo(mapping, form, request, response);
		}
		// �޸Ľ���
		else if ("modifyT07_record".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_record(mapping, form, request,
					response);
		}
		// �޸Ķ���
		else if ("modifyT07_recordDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT07_recordDo(mapping, form, request,
					response);
		}
		// ɾ������
		else if ("deleteT07_recordDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT07_recordDo(mapping, form, request,
					response);
		}
		// ����xls�ļ�:Ireport
		else if ("getT07_record_xls".equalsIgnoreCase(myaction)) {
			myforward = this.getT07_record_xls(mapping, form, request, response);
		}
		//2012.7.9 modified by lijie
		//����xls�ļ�:excelת����jsp
		else if ("export_t07_recordList".equalsIgnoreCase(myaction)) {
			myforward = performExport_t07_recordList(mapping, form, request, response);
		}
		return myforward;

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
	public ActionForward performGetT07_recordList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_recordList = new ArrayList();
		HashMap map = new HashMap();
		String pageInfo = "";
		T07_recordDAO t07_recordDAO = (T07_recordDAO) context
				.getBean("t07_recordDAO");
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		T07_record t07_record = new T07_record();
		// ��ȡҳ������Ҫ�������˵���Ϣ
		// LinkedHashMap recordsortMap = cm.getMapFromCache("recordsort");
		// request.setAttribute("recordsortMap", this.getOptionsListByMap(
		// recordsortMap, null, true));
		// ��ȡҳ������Ҫ�������˵���Ϣend
		try {
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			String reset = (String) request.getAttribute("reset");
			if (reset == null)
				reset = "";
			if (reset.equals("yes")) {// ���/�޸Ķ�������ת����
				form.reset();
			}
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			String url = request.getContextPath() + "/offs_report"
					+ actionMapping.getPath() + ".do?record_type_cd="
					+ form.getRecord_type_cd();
			MyBeanUtils.copyBean2Bean(t07_record, form);

			String uporgankey = StringUtils.null2String(
					(String) request.getParameter("uporgankey")).trim();
			t07_record.setUporgankey(uporgankey);

			AuthBean authBean = (AuthBean) request.getSession().getAttribute(
					"authBean");
			String orgStr = authBean.getAuthToken().getOrganstr();
			t07_record.setOrganstr(orgStr);// �����û�����Ȩ��

			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			if (newsearchflag.equals("1")) {// �µĲ�ѯ����
				String organSelected = this.getOrganSelected(request, map);// �û�ѡ���ѯ�Ļ�����
				t07_record.setOrgankey(organSelected);
				this.setSearchObj(t07_record);
				request.getSession().setAttribute("t07_record_search_obj",
						t07_record);
			} else {// ��ҳ�򷵻����
				T07_record searchObj = (T07_record) request.getSession()
						.getAttribute("t07_record_search_obj");
				if (searchObj != null)
					t07_record = searchObj;
				MyBeanUtils.copyBean2Bean(form, t07_record);
				if (uporgankey.equals(""))
					uporgankey = t07_record.getUporgankey();// ȡ���ϴβ�ѯ���ϼ�������
				this.getOrganSelected(t07_record.getOrgankey(), map);// ��ѡ��ѯ������
			}
			// ȡ�ò�ѯ��¼�б�
			t07_recordList = t07_recordDAO.getT07_recordList(sqlMap,
					t07_record, this.getStartRec(intPage), this
							.getIntPageSize());
			if (t07_recordList == null)
				t07_recordList = new ArrayList();
			request.setAttribute("size", t07_recordList.size() + "");
			if (newsearchflag.equals("1") || reset.equals("yes")) {
				request.getSession().setAttribute("t07_recordList",
						t07_recordList);
			}
			// ȡ�ò�ѯ��¼����
			int totalRow = t07_recordDAO.getT07_recordListCount(sqlMap,
					t07_record);
			// ȡ�÷�ҳ��Ϣ
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

			String organMultiSelHTMLStr = StaticMethod.getOrganMultiSelHTML(
					request, uporgankey, map, 10, cm);
			request.setAttribute("organMultiSelHTMLStr", organMultiSelHTMLStr);

			// add lixx 2010.10.22 ������������Ϣ
			if (t07_record.getRecord_type_cd().equals("4")) {
				T07_record t07_recordor = new T07_record();
				t07_record.setRemarkflag("2");
				t07_record.setRemarkflag1("1");
				t07_recordor = t07_recordDAO
						.getT07_recordor(sqlMap, t07_record);
				request.setAttribute("t07_recordor", t07_recordor);
			}
			if (t07_record.getRecord_type_cd().equals("5")) {
				T07_record t07_recordsum = new T07_record();

				t07_recordsum = t07_recordDAO.getT07_recordsum(sqlMap,
						t07_record, sysConfig);
				request.setAttribute("t07_recordsum", t07_recordsum);
			}
			// end add

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t07_recordList", t07_recordList);
		request.setAttribute("pageInfo", pageInfo);
		//
		return actionMapping.findForward("success");
	}

	/**
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
	public ActionForward performAddT07_record(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		String record_type_cd = request.getParameter("record_type_cd");
		try {
			if (record_type_cd.equals("4")) {
				LinkedHashMap remarkMap = cm.getMapFromCache("remark");
				request.setAttribute("remarkMap", this.getOptionsListByMap(
						remarkMap, null, false));
			} else if (record_type_cd.equals("5")) {
				T07_record t07_record = new T07_record();
				T07_recordActionForm t07_recordActionForm = (T07_recordActionForm) actionForm;
				String sum = "0";
				String amt = "0.00";
				t07_record.setRemark4(sum);
				t07_record.setRemark5(sum);
				t07_record.setRemark6(amt);
				t07_record.setRemark7(sum);
				t07_record.setRemark8(amt);
				t07_record.setRemark9(sum);
				t07_record.setRemark10(amt);
				t07_record.setRemark11(sum);
				t07_record.setRemark12(amt);
				t07_record.setRecord_type_cd(record_type_cd);
				PropertyUtils.copyProperties(t07_recordActionForm, t07_record);
			}
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (NoSuchMethodException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
	public ActionForward performAddT07_recordDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
		T07_record t07_record = new T07_record();
		try {
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			PropertyUtils.copyProperties(t07_record, form);
			String record_id = this.getSequenceNextVal("t07_record_record_id");
			t07_record.setRecord_id(record_id);

			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// �����û������Ϣ
			if (auth.getT00_user().getModifydate() != null
					&& !"".equals(auth.getT00_user().getModifydate())) {
				t07_record.setLast_upd_dt(DateUtils.stringToDate(auth
						.getT00_user().getModifydate()));// ����ʱ��
			}
			t07_record.setLast_upd_user(auth.getT00_user().getModifier());// ������
			t07_record.setRecord_user(auth.getT00_user().getRealname());// ��¼��
			t07_record.setOrgankey(auth.getT00_user().getOrgankey());// ��������

			// ����������Ϣ
			if (t07_record.getCreate_dt_disp() == null
					|| t07_record.getCreate_dt_disp().trim().equals("")) {
				t07_record.setCreate_dt_disp("1900-01-01");
			}
			t07_record.setCreate_dt(DateUtils.stringToDateShort(t07_record
					.getCreate_dt_disp()));
			// �ڲ���ƽ���ʱ��
			String create_end_dt_disp = t07_record.getCreate_end_dt_disp();
			if (create_end_dt_disp == null
					|| create_end_dt_disp.trim().equals("")) {
				create_end_dt_disp = t07_record.getCreate_dt_disp();
			}

			if (t07_record.getRecord_type_cd().equals("4")) {
			}

			t07_record.setCreate_end_dt(DateUtils
					.stringToDateShort(create_end_dt_disp));
			// form.reset();
			int rows = t07_recordDAO.insertT07_record(sqlMap, t07_record);
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
	public ActionForward performModifyT07_record(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
		T07_record t07_record = new T07_record();
		try {
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			// ����������Ϣ
			String selected[] = form.getRecord_id_selected();
			if (selected == null || selected.length != 1)
				return actionMapping.findForward("failure");

			String record_id = selected[0];
			t07_record = t07_recordDAO.getT07_recordDisp(sqlMap, record_id);
			PropertyUtils.copyProperties(form, t07_record);
			form.setCreate_dt_disp(DateUtils.dateToStringShort(form
					.getCreate_dt()));
			form.setCreate_end_dt_disp(DateUtils.dateToStringShort(form
					.getCreate_end_dt()));

			String record_type_cd = request.getParameter("record_type_cd");
			if (record_type_cd.equals("4")) {
				LinkedHashMap remarkMap = cm.getMapFromCache("remark");
				request.setAttribute("remarkMap", this.getOptionsListByMap(
						remarkMap, null, false));
				String remarkflag = "2"; // ��־��
				String remarkflag1 = "1"; // ��־��
				String re = form.getRemark4();
			}

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		// request.setAttribute("t07_recordname",t07_record.getRecord_id());
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
	public ActionForward performModifyT07_recordDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
		T07_record t07_record = new T07_record();
		try {
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			PropertyUtils.copyProperties(t07_record, form);

			HttpSession session = request.getSession();
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			// �����û������Ϣ
			if (auth.getT00_user().getModifydate() != null
					&& !"".equals(auth.getT00_user().getModifydate())) {
				t07_record.setLast_upd_dt(DateUtils.stringToDate(auth
						.getT00_user().getModifydate()));// ����ʱ��
			}
			t07_record.setLast_upd_user(auth.getT00_user().getModifier());// ������
			t07_record.setRecord_user(auth.getT00_user().getRealname());// ��¼��
			t07_record.setOrgankey(auth.getT00_user().getOrgankey());// ��������

			t07_record.setCreate_dt(DateUtils.stringToDateShort(form
					.getCreate_dt_disp()));
			if (t07_record.getCreate_end_dt_disp() != null
					&& !t07_record.getCreate_end_dt_disp().trim().equals("")) {
				t07_record.setCreate_end_dt(DateUtils
						.stringToDateShort(t07_record.getCreate_end_dt_disp()));
			}

			if (t07_record.getRecord_type_cd().equals("4")) {
			}

			t07_recordDAO.modifyT07_record(sqlMap, t07_record);
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
	public ActionForward performDeleteT07_recordDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
		try {
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			// ����ɾ����¼������Ϣ
			String selectId[] = form.getRecord_id_selected();
			if (selectId != null && selectId.length > 0) {
				for (int i = 0; i < selectId.length; i++) {
					String record_id = selectId[i];
					t07_recordDAO.deleteT07_record(sqlMap, record_id);
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
	public ActionForward performSearchT07_record(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		// ActionErrors errors = new ActionErrors();
		request.setAttribute("searchPage", "yes");
		return actionMapping.findForward("success");
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
	 * @since ���ò�ѯ����
	 * @param t07_record
	 *            T07_record
	 * @return void
	 */
	public void setSearchObj(T07_record t07_record) {
		if (t07_record.getCreate_dt_disp() != null
				&& !t07_record.getCreate_dt_disp().trim().equals("")) {
			t07_record.setCreate_dt(DateUtils.stringToDateShort(t07_record
					.getCreate_dt_disp()));
		} else
			t07_record.setCreate_dt(null);

		if (t07_record.getCreate_dt_end_disp() != null
				&& !t07_record.getCreate_dt_end_disp().trim().equals("")) {
			t07_record.setCreate_dt_end(DateUtils.stringToDateShort(t07_record
					.getCreate_dt_end_disp()));
		} else
			t07_record.setCreate_dt_end(null);

		if (t07_record.getCreate_end_dt_disp() != null
				&& !t07_record.getCreate_end_dt_disp().trim().equals("")) {
			t07_record.setCreate_end_dt(DateUtils.stringToDateShort(t07_record
					.getCreate_end_dt_disp()));
		} else
			t07_record.setCreate_end_dt(null);

		if (t07_record.getCreate_dt() == null
				&& t07_record.getCreate_dt_end() == null
				&& t07_record.getCreate_end_dt() == null) {// ����û�û������ʱ������
			if (t07_record.getQuarter() != null
					&& !t07_record.getQuarter().trim().equals("")) {
				String year = DateUtils.getYear(DateUtils.getCurrDateTime());
				if (t07_record.getQuarter().equals("1")) {// ��һ����
					t07_record.setCreate_dt_disp(year + "-01-01");
					t07_record.setCreate_dt(DateUtils
							.stringToDateShort(t07_record.getCreate_dt_disp()));
					t07_record.setCreate_dt_end_disp(year + "-03" + "-31");
					t07_record.setCreate_dt_end(DateUtils
							.stringToDateShort(t07_record
									.getCreate_dt_end_disp()));
				} else if (t07_record.getQuarter().equals("2")) {// �ڶ�����
					t07_record.setCreate_dt_disp(year + "-04-01");
					t07_record.setCreate_dt(DateUtils
							.stringToDateShort(t07_record.getCreate_dt_disp()));
					t07_record.setCreate_dt_end_disp(year + "-06" + "-30");
					t07_record.setCreate_dt_end(DateUtils
							.stringToDateShort(t07_record
									.getCreate_dt_end_disp()));
				} else if (t07_record.getQuarter().equals("3")) {// ��������
					t07_record.setCreate_dt_disp(year + "-07-01");
					t07_record.setCreate_dt(DateUtils
							.stringToDateShort(t07_record.getCreate_dt_disp()));
					t07_record.setCreate_dt_end_disp(year + "-09" + "-30");
					t07_record.setCreate_dt_end(DateUtils
							.stringToDateShort(t07_record
									.getCreate_dt_end_disp()));
				} else if (t07_record.getQuarter().equals("4")) {// ���ļ���
					t07_record.setCreate_dt_disp(year + "-10-01");
					t07_record.setCreate_dt(DateUtils
							.stringToDateShort(t07_record.getCreate_dt_disp()));
					t07_record.setCreate_dt_end_disp(year + "-12" + "-31");
					t07_record.setCreate_dt_end(DateUtils
							.stringToDateShort(t07_record
									.getCreate_dt_end_disp()));
				}
			}
		}
		/*if (t07_record.getRecord_obj() != null
				&& !t07_record.getRecord_obj().trim().equals("")) {
			t07_record.setRecord_obj("%" + t07_record.getRecord_obj() + "%");
		}
		if (t07_record.getContent() != null
				&& !t07_record.getContent().trim().equals("")) {
			t07_record.setContent("%" + t07_record.getContent() + "%");
		}
		if (t07_record.getRemark1() != null
				&& !t07_record.getRemark1().trim().equals("")) {
			t07_record.setRemark1("%" + t07_record.getRemark1() + "%");
		}
		if (t07_record.getRemark2() != null
				&& !t07_record.getRemark2().trim().equals("")) {
			t07_record.setRemark2("%" + t07_record.getRemark2() + "%");
		}
		if (t07_record.getRemark3() != null
				&& !t07_record.getRemark3().trim().equals("")) {
			t07_record.setRemark3("%" + t07_record.getRemark3() + "%");
		}*/
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

	/**
	 * ����excel�����ļ�
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
	public ActionForward getT07_record_xls(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		try {
			HttpSession session = request.getSession();
			T07_recordActionForm form = (T07_recordActionForm) actionForm;
			T07_record t07_record = (T07_record) session
					.getAttribute("t07_record_search_obj");
			// �������Ƶ�ǰ׺
			request.setAttribute("filehead", this.getFileNameHead(form
					.getRecord_type_cd())
					+ "_");
			// �����ļ�·��
			String jasperpath = "/WEB-INF/reports/t07_report.jasper";

			// add lixx 2010.10.26 ������������Ϣ
			if ("4".equals(form.getRecord_type_cd())) {
				jasperpath = "/WEB-INF/reports/t07_report3.jasper";
			}
			// end add

			if ("5".equals(form.getRecord_type_cd())) {
				jasperpath = "/WEB-INF/reports/t07_report2.jasper";
			}
			request.setAttribute("jasperpath", jasperpath);
			// ���ñ������
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			request.setAttribute("excelname", this.getExcelName(form
					.getRecord_type_cd(), auth, t07_record));
			request.setAttribute("isdel", "1");
			request.setAttribute("paramList", this.getParamList(form
					.getRecord_type_cd(), auth, t07_record));
			// ��������
			request.setAttribute("dataList", this.getReportDataList(form
					.getRecord_type_cd(), request));
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
		return actionMapping.findForward("success");
	}

	/**
	 * @since ȡ�ñ����ļ���ͷ��
	 * @param record_type_cd
	 *            String ��������
	 * @return String
	 */
	public String getFileNameHead(String record_type_cd) {
		String fileNameHead = "";
		if (record_type_cd.equals("1")) {// ��ѵ��¼
			fileNameHead = "D";
		} else if (record_type_cd.equals("2")) {// ������¼
			fileNameHead = "C";
		} else if (record_type_cd.equals("3")) {// �ڿ��ƶ�
			fileNameHead = "A";
		} else if (record_type_cd.equals("4")) {// �ڲ����
			fileNameHead = "E";
		} else if (record_type_cd.equals("5")) {// ���ϴǮ����
			fileNameHead = "J";
		}
		return fileNameHead;
	}

	public String getExcelName(String record_type_cd, Authorization auth,
			T07_record t07_record) {
		LinkedHashMap report_organ_mapMap = cm
				.getMapFromCache("report_organ_map");

		String user_organkey = auth.getT00_user().getOrgankey();

		String organkey = "";
		if (report_organ_mapMap.containsKey(user_organkey)) {
			organkey = report_organ_mapMap.get(user_organkey).toString();
		}
		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// �����
		String year = "";// ���
		String quarter = "0";// ����

		if (t07_record.getCreate_dt() != null) {// �ж����
			String date = DateUtils
					.dateToStringShort(t07_record.getCreate_dt());
			year = date.substring(0, date.indexOf("-"));
		} else {
			year = reportDate.substring(0, reportDate.indexOf("-"));
		}
		if ("5".equals(record_type_cd)) {// �жϼ���
			if (t07_record.getQuarter() != null
					&& !t07_record.getQuarter().equals("")) {
				quarter = t07_record.getQuarter();
			} else {
				if (t07_record.getCreate_dt() != null) {
					quarter = this.getSearchQuarter(t07_record.getCreate_dt());
				} else {
					quarter = this.getSearchQuarter(new java.util.Date(System
							.currentTimeMillis()));
				}
			}
		}

		String level = "";
		level = "F";// ����ʹ�÷���
		String type_cd = "";
		if (record_type_cd.equals("1")) {// ��ѵ��¼
			type_cd = "D";
		} else if (record_type_cd.equals("2")) {// ������¼
			type_cd = "C";
		} else if (record_type_cd.equals("3")) {// �ڿ��ƶ�
			type_cd = "A";
		} else if (record_type_cd.equals("4")) {// �ڲ����
			type_cd = "E";
		} else if (record_type_cd.equals("5")) {// ���ϴǮ����
			type_cd = "J";
		}

		String excelName = organkey + type_cd + year + quarter + level + "000";
		return excelName;
	}

	public String getSearchQuarter(Date date) {
		String month = DateUtils.getMonth(date);
		String quarter = "";
		if ("01".equals(month) || "02".equals(month) || "03".equals(month)) {
			quarter = "1";
		} else if ("04".equals(month) || "05".equals(month)
				|| "06".equals(month)) {
			quarter = "2";
		} else if ("07".equals(month) || "08".equals(month)
				|| "09".equals(month)) {
			quarter = "3";
		} else if ("10".equals(month) || "11".equals(month)
				|| "12".equals(month)) {
			quarter = "4";
		}
		return quarter;
	}

	/**
	 * @since ����iReport��������Ĳ���
	 * @param t07_record
	 *            T07_record
	 * @return void
	 */
	public ArrayList getParamList(String record_type_cd, Authorization auth,
			T07_record t07_record) {
		ArrayList paraList = new ArrayList();
		if (record_type_cd == null)
			record_type_cd = "";
		// ���ñ������
		paraList.add(this.getTitleName(record_type_cd));
		// ���ñ���������
		this.setReportHead(record_type_cd, paraList, auth, t07_record);
		// ���ñ���������
		this.setReportColumnName(record_type_cd, paraList);
		XMLProperties sysconfig=(XMLProperties)context.getBean("sysConfig");
		// add lixx 2010.10.22 ������������Ϣ
		if (record_type_cd.equals("4")) {
			T07_record t07_recordor = new T07_record();
			T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
			try {
				t07_recordor = t07_recordDAO
						.getT07_recordor(sqlMap, t07_record);

				paraList.add(t07_recordor.getRemark4());
				paraList.add(t07_recordor.getRemark5());
				paraList.add(t07_recordor.getRemark6());
				paraList.add(t07_recordor.getRemark7());
				paraList.add(t07_recordor.getRemark8());
				paraList.add(t07_recordor.getRemark9());
				paraList.add(t07_recordor.getRemark10());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (record_type_cd.equals("5")) {
			T07_record t07_recordsum = new T07_record();
			T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
			try {
				t07_recordsum = t07_recordDAO.getT07_recordsum(sqlMap,
						t07_record, sysconfig);

				paraList.add(t07_recordsum.getRemark4());
				paraList.add(t07_recordsum.getRemark5());
				paraList.add(t07_recordsum.getRemark6());
				paraList.add(t07_recordsum.getRemark7());
				paraList.add(t07_recordsum.getRemark8());
				paraList.add(t07_recordsum.getRemark9());
				paraList.add(t07_recordsum.getRemark10());
				paraList.add(t07_recordsum.getRemark11());
				paraList.add(t07_recordsum.getRemark12());
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// end add

		return paraList;
	}

	/**
	 * @since ȡ��iReport����ı���
	 * @param record_type_cd
	 *            String �������
	 * @return String
	 */
	public String getTitleName(String record_type_cd) {
		String titleName = "";
		if (record_type_cd.equals("1")) {// ��ѵ��¼
			titleName = "���ڻ�����ϴǮ��ѵ����";
		} else if (record_type_cd.equals("2")) {// ������¼
			titleName = "���ڻ�����ϴǮ��������";
		} else if (record_type_cd.equals("3")) {// �ڿ��ƶ�
			titleName = "���ڻ�����ϴǮ�ڿ��ƶȽ������";
		} else if (record_type_cd.equals("4")) {// �ڲ����
			titleName = "���ڻ�����ϴǮ�����ڲ�������";
		} else if (record_type_cd.equals("5")) {// ���ϴǮ����
			titleName = "���ڻ���Э���������ء��������ش��ϴǮ����";
		}
		return titleName;
	}

	/**
	 * @since ����iReport�����������
	 * @param record_type_cd
	 *            String �������
	 * @param paraList
	 *            ArrayList ��������б�
	 * @return void
	 */
	public void setReportColumnName(String record_type_cd, ArrayList paraList) {
		if (record_type_cd.equals("1")) {// ��ѵ��¼
			paraList.add("��ѵʱ��");
			paraList.add("��ѵ����");
			paraList.add("��ѵ����");
			paraList.add("�μ�����");
			paraList.add("��ѵ��ʽ");
		} else if (record_type_cd.equals("2")) {// ������¼
			paraList.add("�ʱ��");
			paraList.add("��������");
			paraList.add("�μ�����");
			paraList.add("������ʽ");
			paraList.add("���Ų��Ϸ���");
		} else if (record_type_cd.equals("3")) {// �ڿ��ƶ�
			paraList.add("�ƶ�����");
			paraList.add("��Ҫ����");
			paraList.add("�ƶ�����");
			paraList.add("�ƶ�ʱ��");
			paraList.add("����ĺ�");
		} else if (record_type_cd.equals("4")) {// �ڲ����
			paraList.add("��Ʋ�������");
			paraList.add("�������");
			paraList.add("�����Ŀ���Ƽ���Ҫ����");
			paraList.add("��Ʒ�����Ҫ����");
			paraList.add("�����������");
		} else if (record_type_cd.equals("5")) {// ���ϴǮ����
			paraList.add("��Э����λ");
			paraList.add("Э��ʱ��");
			paraList.add("Э������");
			paraList.add("Ч��");
			paraList.add("��Э����λ���ͣ���������/�������أ�");
		}
	}

	/**
	 * @since ����iReport����������
	 * @param record_type_cd
	 *            String �������
	 * @param paraList
	 *            ArrayList ��������б�
	 * @return void
	 */
	public void setReportHead(String record_type_cd, ArrayList paraList,
			Authorization auth, T07_record t07_record) {
		LinkedHashMap report_organ_mapMap = cm.getMapFromCache("report_organ_map");
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
		// String organname =
		// StringUtils.null2String(xmlReader.getProperty("business_config.reportOrgan.reportOrganname"));
		// end
		String realName = auth.getT00_user().getRealname();// �Ʊ���
		String telephone = auth.getT00_user().getTelephone();// ��ϵ�绰
		String reportDate = DateUtils.dateToStringShort(new java.util.Date(
				System.currentTimeMillis()));// �����
		String year = "";// ���
		String quarter = "";// ����

		if (t07_record.getCreate_dt() != null) {// �ж����
			String date = DateUtils
					.dateToStringShort(t07_record.getCreate_dt());
			year = date.substring(0, date.indexOf("-"));
		} else {
			year = reportDate.substring(0, reportDate.indexOf("-"));
		}
		if ("5".equals(record_type_cd)) {// �жϼ���
			if (t07_record.getQuarter() != null
					&& t07_record.getQuarter() != "") {
				quarter = t07_record.getQuarter();
			} else {
				if (t07_record.getCreate_dt() != null) {
					quarter = this.getSearchQuarter(t07_record.getCreate_dt());
				} else {
					quarter = this.getSearchQuarter(new java.util.Date(System
							.currentTimeMillis()));
				}
			}
		}

		if (reportDate.indexOf("-") != -1)
			reportDate = reportDate.replaceAll("-", "");
		// ������Դ
		String level = "";
		level = "F";// ����ʹ�÷���
		if (record_type_cd.equals("1")) {// ��ѵ��¼
			paraList.add("D");// �������
		} else if (record_type_cd.equals("2")) {// ������¼
			paraList.add("C");// �������
		} else if (record_type_cd.equals("3")) {// �ڿ��ƶ�
			paraList.add("A");// �������
		} else if (record_type_cd.equals("4")) {// �ڲ����
			paraList.add("E");// �������
		} else if (record_type_cd.equals("5")) {// ���ϴǮ����
			paraList.add("J");// �������
		}

		paraList.add(organkey);// ���λ����
		paraList.add(realName);// �Ʊ���
		paraList.add(level);// ������Դ
		paraList.add(organname);// ���λ����
		paraList.add(telephone);// ��ϵ�绰
		paraList.add(year);// ���
		paraList.add(reportDate);// �����
		if (record_type_cd.equals("5")) {// ���ϴǮ����
			paraList.add(quarter);// ����
		}
	}
	
	/**
	* @since ȡ�ñ�������Դ
	* @param record_type_cd String ��������
	* @param request HttpServletRequest �������
	* @return ArrayList
	*/
	public ArrayList getReportDataList(String record_type_cd,HttpServletRequest request)throws Exception{
		ArrayList dataList=new ArrayList();
		//ArrayList t07_recordList=(ArrayList)request.getSession().getAttribute("t07_recordList");
		T07_record searchObj=(T07_record)request.getSession().getAttribute("t07_record_search_obj");
		if(searchObj==null)searchObj=new T07_record();
		T07_recordDAO t07_recordDAO = (T07_recordDAO)context.getBean("t07_recordDAO");
		ArrayList t07_recordList = t07_recordDAO.getT07_recordList(sqlMap,searchObj);
		if(t07_recordList==null)t07_recordList=new ArrayList();
		for(int i=0;i<t07_recordList.size();i++){
			T07_record record=(T07_record)t07_recordList.get(i);
			if(record==null)continue;
			ArrayList row=new ArrayList();
			if(record_type_cd.equals("1")){//��ѵ��¼
				row.add(record.getCreate_dt_disp()+" - "+record.getCreate_end_dt_disp());
				row.add(record.getContent());
				row.add(record.getRemark1());
				row.add(record.getRemark2());
				row.add(record.getRemark3());
			}
			else if(record_type_cd.equals("2")){//������¼
				row.add(record.getCreate_dt_disp()+" - "+record.getCreate_end_dt_disp());
				row.add(record.getContent());
				row.add(record.getRemark1());
				row.add(record.getRemark3());
				row.add(record.getRemark2());
			}
			else if(record_type_cd.equals("3")){//�ڿ��ƶ�
				row.add(record.getRemark1());
				row.add(record.getContent());
				row.add(record.getRecord_obj());
				row.add(record.getCreate_dt_disp());
				row.add(record.getRemark2());
			}
			else if(record_type_cd.equals("4")){//�ڲ����
				row.add(record.getRecord_obj());
				row.add(record.getCreate_dt_disp()+" - "+record.getCreate_end_dt_disp());
				row.add(record.getContent());
				row.add(record.getRemark1());
				row.add(record.getRemark3());
			}
			else if(record_type_cd.equals("5")){//���ϴǮ����
				row.add(record.getRecord_obj());
				row.add(record.getCreate_dt_disp()+" - "+record.getCreate_end_dt_disp());
				row.add(record.getContent());
				row.add(record.getRemark1());
				row.add(record.getRemark2());
			}
			dataList.add(row);
		}
		return dataList;
	}

	/**
	 * add by lijie 2012.7.9
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
	public ActionForward performExport_t07_recordList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		ArrayList t07_recordList = new ArrayList();
		HttpSession session = request.getSession();
		T07_recordDAO t07_recordDAO = (T07_recordDAO) context.getBean("t07_recordDAO");
		T07_record t07_record = new T07_record();
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		String record_type_cd = StringUtils.nullObject2String(request.getParameter("record_type_cd"));
		
		try {
			t07_record = (T07_record)session.getAttribute("t07_record_search_obj");
        	if(t07_record==null){
        		t07_recordList = new ArrayList();
        	}else{
        		t07_recordList = t07_recordDAO.getT07_recordList(sqlMap, t07_record);
        	}
        	int totalRow = t07_recordDAO.getT07_recordListCount(sqlMap,
					t07_record);
        	request.setAttribute("t07_recordList", t07_recordList);
        	
        	
			
        	AuthBean authBean = (AuthBean) session.getAttribute("authBean");
    		Authorization auth = authBean.getAuthToken();
			LinkedHashMap report_organ_mapMap = cm.getMapFromCache("report_organ_map");
			LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
			String user_organkey = auth.getT00_user().getOrgankey();
			
			
			//�������Ƶ�ǰ׺
			//1.��������
			String type_cd = this.getFileNameHead(record_type_cd);
			//2.������Դ
			String level = "F";// ����ʹ�÷���
			//3.�����
			String reportDate = DateUtils.dateToStringShort(new java.util.Date(System.currentTimeMillis()));
			//4.���
			String year = reportDate.substring(0, reportDate.indexOf("-"));
			
			if (t07_record.getCreate_dt() != null) {// �ж����
				String date = DateUtils
						.dateToStringShort(t07_record.getCreate_dt());
				year = date.substring(0, date.indexOf("-"));
			} else {
				year = reportDate.substring(0, reportDate.indexOf("-"));
			}
			//5.���λ������
			String report_organkey = user_organkey;
			//7.���ڻ���������
			String report_organcode = "";
			if (report_organ_mapMap.containsKey(report_organkey)) {
				report_organcode = report_organ_mapMap.get(report_organkey).toString();
			}
			//6.���λ����
			String report_orgname = "";
			if (report_organMap.containsKey(report_organcode)) {
				report_orgname = report_organMap.get(report_organcode).toString();
			}
			//8.�Ʊ���
			String realName = auth.getT00_user().getRealname();
			//9.��ϵ�绰
			String telephone = StringUtils.null2String(auth.getT00_user().getTelephone());
			//10.�㱨���־
			String zero_flag = "";
			if(totalRow > 0)
				zero_flag = "��";
			else
				zero_flag = "��";
			//11.����(ֵ���record_type_cd=5)
			String quarter = "0";// ����
			if ("5".equals(record_type_cd)) {// �жϼ���
				if (t07_record.getQuarter() != null
						&& !t07_record.getQuarter().equals("")) {
					quarter = t07_record.getQuarter();
				} else {
					if (t07_record.getCreate_dt() != null) {
						quarter = this.getSearchQuarter(t07_record.getCreate_dt());
					} else {
						quarter = this.getSearchQuarter(new java.util.Date(System
								.currentTimeMillis()));
					}
				}
			}


			String excelName = report_organcode + type_cd + year + quarter + level + "000";
			
			request.setAttribute("type_cd", type_cd);
			request.setAttribute("level", level);
			request.setAttribute("reportDate", reportDate);
			request.setAttribute("year", year);
			request.setAttribute("report_organkey", report_organkey);
			request.setAttribute("report_orgname", report_orgname);
			request.setAttribute("report_organcode", report_organcode);
			request.setAttribute("realName", realName);
			request.setAttribute("telephone", telephone);
			request.setAttribute("zero_flag", zero_flag);
			request.setAttribute("quarter", quarter);
			
			request.setAttribute("excelName", excelName);
			
			
			if (t07_record.getRecord_type_cd().equals("4")) {
				T07_record t07_recordor = new T07_record();
				t07_record.setRemarkflag("2");
				t07_record.setRemarkflag1("1");
				t07_recordor = t07_recordDAO
						.getT07_recordor(sqlMap, t07_record);
				request.setAttribute("t07_recordor", t07_recordor);
			}
			if (t07_record.getRecord_type_cd().equals("5")) {
				T07_record t07_recordsum = new T07_record();

				t07_recordsum = t07_recordDAO.getT07_recordsum(sqlMap,
						t07_record, sysConfig);
				request.setAttribute("t07_recordsum", t07_recordsum);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if(record_type_cd.equals("1"))
			return actionMapping.findForward("success1");
		else if(record_type_cd.equals("2"))
			return actionMapping.findForward("success2");
		else if(record_type_cd.equals("3"))
			return actionMapping.findForward("success3");
		else if(record_type_cd.equals("4"))
			return actionMapping.findForward("success4");
		else
			return actionMapping.findForward("success5");
	}
}
