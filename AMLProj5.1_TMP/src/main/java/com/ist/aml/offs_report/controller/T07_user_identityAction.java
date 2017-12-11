/**
 * 
 */
package com.ist.aml.offs_report.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;

import java.util.TreeMap;

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

import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.offs_report.dao.T07_amlpostDAO;
import com.ist.aml.offs_report.dao.T07_recordDAO;
import com.ist.aml.offs_report.dao.T07_user_identityDAO;
import com.ist.aml.offs_report.dto.T07_amlpost;
import com.ist.aml.offs_report.dto.T07_record;
import com.ist.aml.offs_report.dto.T07_user_identity;
import com.ist.aml.offs_report.dto.T09_new_party_statistics;
import com.ist.aml.report.controller.T47_partyActionForm;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.StaticMethod;
import com.ist.common.base.BaseAction;
import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.platform.dao.T00_organDAO;
import com.ist.platform.dto.T00_operate_log;
import com.ist.platform.dto.T00_organ;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

/**
 * @author Administrator
 * 
 */
public class T07_user_identityAction extends BaseAction {

	private static Logger logger = LogUtils
			.getLogger(T07_user_identityAction.class.getName());

	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {

		ActionForward myforward = null;
		String myaction = mapping.getParameter();

		if ("getT07_user_identitylist".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_user_identitylist(mapping, form, request,
					response);
		}
		if ("getT07_user_identityDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_user_identityDisp(mapping, form, request,
					response);
		}
		if ("toaddT07_user_identity".equalsIgnoreCase(myaction)) {
			myforward = performToT07_user_identityadd(mapping, form, request,
					response);
		}
		if ("addT07_user_identity".equalsIgnoreCase(myaction)) {
			myforward = performT07_user_identityadd(mapping, form, request,
					response);
		}
		if ("addT07_user_identityDo".equalsIgnoreCase(myaction)) {
			myforward = performT07_user_identitylistaddDo(mapping, form, request,
					response);
		}
		if ("delT07_user_identityDo".equalsIgnoreCase(myaction)) {
			myforward = performDelT07_user_identityDo(mapping, form, request,
					response);
		}
		if ("t07_user_identityUpdateStatus".equalsIgnoreCase(myaction)) {
			myforward = performT07_user_identityUpdateStatus(mapping, form, request,
					response);
		}
		//����xls�ļ�:Ireport
		if ("getT07_user_identityExcel".equalsIgnoreCase(myaction)) {
			myforward = performGetT07_user_identityExcel(mapping, form, request,
					response);
		}
		//modified by lijie 2012.7.11
		//����xls�ļ�:excelת����jsp
		if ("exportT07_user_identitylist".equalsIgnoreCase(myaction)) {
			myforward = performExport_t07_user_identitytList(mapping, form, request,
					response);
		}
		return myforward;
	}

	/**
	 * ǰ̨�б��ѯ -- ͳ�Ʋ�ѯ
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_user_identitylist(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		HashMap hash = new HashMap();
		T07_user_identityActionForm form = (T07_user_identityActionForm) actionForm;
		int intPage = StringUtils.nullObject2int(request
				.getParameter("intPage"), 0);
		T07_user_identityDAO t07_user_identityDAO = (T07_user_identityDAO)context.getBean("t07_user_identityDAO");
		// ȡ������ʱ�������б�
		LinkedHashMap ymMap = new LinkedHashMap();
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		int curryear = Integer.parseInt(DateUtils.getYear(DateUtils
				.getCurrDateTime()));
		int currmonth = Integer.parseInt(DateUtils.getMonth(DateUtils
				.getCurrDateTime()));
		int startyear = Integer.parseInt(sysConfig
				.getProperty("sysparam.datastartyear"));
		while (curryear >= startyear) {
			ymMap.put("" + startyear, "" + startyear);
			startyear++;
		}
		request.setAttribute("dataYmMap", this.getOptionsListByMap(ymMap, null,
				false));
		// ��ȡҳ������Ҫ�������˵���Ϣ
		LinkedHashMap seasonMap = cm.getMapFromCache("seasonlist");
		LinkedHashMap identitytypeMap = cm.getMapFromCache("identitytype");

		// �ж����Ǹ��û���������ʾ�Ĳ˵���һ��===========begin
		String status_cdFlag = null;
		LinkedHashMap status_cdMap = null;
		status_cdFlag = (String) request.getParameter("status_cdFlagR");
		if (status_cdFlag == null) {
			status_cdFlag = (String) request.getSession().getAttribute(
					"status_cdFlagS");
			if (status_cdFlag.equals("f")) {
				status_cdMap = cm.getMapFromCache("status_cdFillMap");
			} else if (status_cdFlag.equals("c")) {
				status_cdMap = cm.getMapFromCache("status_cdCollMap");
			}
		} else if (status_cdFlag.equals("f")) {
			status_cdMap = cm.getMapFromCache("status_cdFillMap");
		} else if (status_cdFlag.equals("c")) {
			status_cdMap = cm.getMapFromCache("status_cdCollMap");
		}
		request.getSession().setAttribute("status_cdFlagS", status_cdFlag);
		// end=========================end

		request.setAttribute("seasonMap", this.getOptionsListByMap(seasonMap,
				null, false));
		request.setAttribute("identitytypeMap", this.getOptionsListByMap(
				identitytypeMap, null, false));
		request.setAttribute("status_cdMap", this.getOptionsListByMap(
				status_cdMap, null, true));
		LinkedHashMap organMap = cm.getMapFromCache("organ");

		T07_user_identity t07_user_identity = new T07_user_identity();

		try {
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			if (newsearchflag.equals("0")) {
				// ��ʼ��ҳ���
				int iseason = currmonth / 3;
				form.setStartyear("" + curryear);
				form.setStartseason("01");
				form.setEndseason("0" + iseason);
				form.setEndyear("" + curryear);
				session.setAttribute("t07_user_identitySearchObj", null);
				String organMultiSelHTMLStr = StaticMethod
						.getOrganMultiSelHTML(request, "", new HashMap(), 10,
								cm);
				request.setAttribute("organMultiSelHTMLStr",
						organMultiSelHTMLStr);
				return actionMapping.findForward("success");
			} else if (newsearchflag.equals("1")) {
				MyBeanUtils.copyBean2Bean(t07_user_identity, form);
				t07_user_identity.setStartdate(Integer.parseInt(form
						.getStartyear()
						+ form.getStartseason()));
				t07_user_identity.setEnddate(Integer.parseInt(form.getEndyear()
						+ form.getEndseason()));

				String[] orgs = request.getParameterValues("list2");
				if (orgs != null) {
					ArrayList list = new ArrayList();
					for (int i = 0; i < orgs.length; i++) {
						hash.put(orgs[i], organMap.get(orgs[i]));
						list.add(orgs[i]);
					}
					t07_user_identity.setOrganList(list);
				} else {
					// ��֯�û������Ļ���ID
					AuthBean authBean = new AuthBean();
					Authorization auth = new Authorization();
					authBean = (AuthBean) session.getAttribute("authBean");
					auth = authBean.getAuthToken();
					t07_user_identity.setOrgankey(auth.getOrganstr());
				}
				// �жϲ�ѯ�����״̬status_cd���Ϊ�գ�������û�Ȩ�޲�ѯ��Ȩ�������еı���====begin
				if (t07_user_identity.getStatus_cd() == null
						|| (t07_user_identity.getStatus_cd()).equals("")) {
					if (status_cdFlag.equals("c")) {// ����
						ArrayList status_arrayList = new ArrayList();
						status_arrayList.add("1");
						status_arrayList.add("2");
						status_arrayList.add("3");
						t07_user_identity.setStatus_arrayList(status_arrayList);
					} else if (status_cdFlag.equals("f")) {// �
						ArrayList status_arrayList = new ArrayList();
						status_arrayList.add("0");
						status_arrayList.add("1");
						status_arrayList.add("2");
						status_arrayList.add("4");
						t07_user_identity.setStatus_arrayList(status_arrayList);
					}
				}// end==============end

			} else {// ��ҳ�򷵻�
				t07_user_identity = (T07_user_identity) session
						.getAttribute("t07_user_identitySearchObj");
				if (t07_user_identity == null) {
					// ��ʼ��ҳ���
					int iseason = currmonth / 3;
					form.setStartyear("" + curryear);
					form.setStartseason("01");
					form.setEndseason("0" + iseason);
					form.setEndyear("" + curryear);
					String organMultiSelHTMLStr = StaticMethod
							.getOrganMultiSelHTML(request, "", new HashMap(),
									10, cm);
					request.setAttribute("organMultiSelHTMLStr",
							organMultiSelHTMLStr);
					return actionMapping.findForward("success");
				}
				if (intPage == 0) {
					intPage = StringUtils.nullObject2int(t07_user_identity
							.getIntPage());
				}
				t07_user_identity.setIntPage("" + intPage);
				MyBeanUtils.copyBean2Bean(form, t07_user_identity);
			}
			session.setAttribute("t07_user_identitySearchObj",
					t07_user_identity);

			ArrayList t07_user_identityList = t07_user_identityDAO
					.getT07_user_identityList(sqlMap, t07_user_identity, this
							.getStartRec(intPage), this.getIntPageSize());

			int totalRow = t07_user_identityDAO.getT07_user_identityCount(
					sqlMap, t07_user_identity);

			String uporgankey = StringUtils.null2String(
					(String) request.getParameter("uporgankey")).trim();
			String organMultiSelHTMLStr = StaticMethod.getOrganMultiSelHTML(
					request, uporgankey, hash, 10, cm);
			request.setAttribute("organMultiSelHTMLStr", organMultiSelHTMLStr);

			String url = request.getContextPath() + "/offs_report"
					+ actionMapping.getPath() + ".do";
			String pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");

			request
					.setAttribute("t07_user_identityList",
							t07_user_identityList);
			request.setAttribute("pageInfo", pageInfo);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * ��������¼��ѯ����ܲ�ѯ
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_user_identityDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_user_identityActionForm form = (T07_user_identityActionForm) actionForm;
		T07_user_identityDAO t07_user_identityDao = (T07_user_identityDAO)context.getBean("t07_user_identityDAO");
		T07_user_identity t07_user_identity = new T07_user_identity();
		String searchtype = StringUtils.nullObject2String(request
				.getParameter("searchtype"));
		String identitytype = StringUtils.nullObject2String(request
				.getParameter("identitytype"));
		ArrayList t07_user_identityList = new ArrayList();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		// ȡ������ʱ�������б�
		try {
			if (searchtype.equals("1")) {// ������¼��ѯ ���� ���+���� -> ��������ת����Ӧ��ʾҳ��
				String identitykey = request.getParameter("identitykey");
				t07_user_identity.setIdentitykey(identitykey);
				t07_user_identity.setIdentitytype(identitytype);
				t07_user_identityList = t07_user_identityDao
						.getT07_user_identityDisp(sqlMap, t07_user_identity);
			} else if (searchtype.equals("2")) {// ���ܲ�ѯ ���� ҳ���
				MyBeanUtils.copyBean2Bean(t07_user_identity, form);
				String type = StringUtils.null2String(request
						.getParameter("type"));
				if ("1".equals(type)) {// ѡ�����
					String[] identitykeys = request
							.getParameterValues("identitykeys");
					ArrayList identitykeyList = new ArrayList();
					if(identitykeys!=null && identitykeys.length>0)
					{
						for (int i = 0; i < identitykeys.length; i++) {
							String identitykey = identitykeys[i];
							identitytype = identitykey.substring(identitykey
									.length() - 1);
							identitykey = identitykey.substring(0, identitykey
									.length() - 1);
							identitykeyList.add(identitykey);
							t07_user_identity.setIdentitykeyList(identitykeyList);
						}
						t07_user_identity.setIdentitytype(identitytype);
						t07_user_identity.setStatus_cd("2");
						t07_user_identityList = t07_user_identityDao
								.getT07_user_identityCollect(sqlMap,
										t07_user_identity);
						t07_user_identityDao.updateT07_user_identityStatus2(sqlMap,
								t07_user_identity);
					}
					
					
				} else if ("2".equals(type)) {// ȫ������
					// MyBeanUtils.copyBean2Bean(t07_user_identity,form);
					if(form.getIdentitytype()!=null && !"".equals(form.getIdentitytype()))
					{ //
					if(form.getStartseason()!= null && !"".equals(form.getStartseason()) && form.getStartyear()!=null && !"".equals(form.getStartyear()))
						t07_user_identity.setStartdate(Integer.parseInt(form
							.getStartyear()
							+ form.getStartseason()));
					if(form.getEndseason()!= null && !"".equals(form.getEndseason()) && form.getEndyear()!=null && !"".equals(form.getEndyear()))
						t07_user_identity.setEnddate(Integer.parseInt(form
							.getEndyear()
							+ form.getEndseason()));

					String[] orgs = request.getParameterValues("list2");
					if (orgs != null) {
						ArrayList list = new ArrayList();
						for (int i = 0; i < orgs.length; i++) {
							list.add(orgs[i]);
						}
						t07_user_identity.setOrganList(list);
					} else {// �������Ϊ�� Ĭ��Ϊ�û�Ȩ�������л���
						ArrayList org_list = auth.getOrganList();
						ArrayList list1 = new ArrayList();
						for (int i = 0; i < org_list.size(); i++) {
							T00_organ t00_organ = (T00_organ) org_list.get(i);
							String key = t00_organ.getOrgankey();
							list1.add(key);
						}
						t07_user_identity.setOrganList(list1);
					}
					t07_user_identity.setStatus_cd("2");
					ArrayList status_arrayList = new ArrayList();
					status_arrayList.add("1");
					status_arrayList.add("2");
					status_arrayList.add("3");
					t07_user_identity.setStatus_arrayList(status_arrayList);
					t07_user_identityList = t07_user_identityDao
							.getT07_user_identityCollect(sqlMap,
									t07_user_identity);
					t07_user_identityDao.updateT07_user_identityStatus2(sqlMap,
							t07_user_identity);
				}
			}//
			}

			if (identitytype.equals("1")) {
				for (int i = 0; i < t07_user_identityList.size(); i++) {
					T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
							.get(i);
					String flag = t07_user_identity1.getIdentityflag();
					MyBeanUtils.copyBean2Bean(form, "" + flag,
							t07_user_identity1, "");
				}
			} else if (identitytype.equals("2")) {
				for (int i = 0; i < t07_user_identityList.size(); i++) {
					T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
							.get(i);
					String flag = t07_user_identity1.getReidentityflag();
					MyBeanUtils.copyBean2Bean(form, "" + flag,
							t07_user_identity1, "");
				}
			} else if (identitytype.equals("3")) {
				T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
						.get(0);
				MyBeanUtils.copyBean2Bean(form, t07_user_identity1);
			} else if (identitytype.equals("4")) {
				for (int i = 0; i < t07_user_identityList.size(); i++) {
					T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
							.get(i);
					String flag = t07_user_identity1.getCurrflag();
					//modify by qiuyun 2012,8,9 �޸�ʱδ��������ĸ�ֵ����ȥ
					if("3".equals(flag))
					{
						form.setCp_reportAmt3(t07_user_identity1.getCp_reportAmt());
						form.setCp_reportNum3(t07_user_identity1.getCp_reportNum());
						form.setId_reportAmt3(t07_user_identity1.getId_reportAmt());
						form.setId_reportNum3(t07_user_identity1.getId_reportNum());
					
					}
					//end by qiuyun

					MyBeanUtils.copyBean2Bean(form, "" + flag,
							t07_user_identity1, "");
					
				}
				if (t07_user_identityList.size() > 0) {
					T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
							.get(0);
					form.setUpdatetime_disp(DateUtils
							.dateToStringShort(t07_user_identity1
									.getUpdatetime()));
				}
				if (searchtype.equals("2")) {
					// modify by qiuyun 2011-08-19 ע�͵�����2�� ����ֱ�Ӵ�t07�л��ܼ���
					// ArrayList
					// reportList=t07_user_identityDao.getT07_reportCount(sqlMap,t07_user_identity);
					// this.fillForm2(reportList,form);
					// end
					form.setUpdateUser(auth.getT00_user().getRealname());
					form.setPhone(auth.getT00_user().getTelephone());
					form.setUpdatetime_disp(DateUtils.dateToStringShort(
							DateUtils.getCurrDateTime()).replaceAll("-", ""));
				}
			}
			// ����ʱ�� ��ͳ��ʱ���ֳ���ͼ���
			if (form.getStatisticdate() > 0) {
				String datestr = String.valueOf(form.getStatisticdate());
				form.setStartyear(datestr.substring(0, datestr.length() - 2));
				form.setStartseason(datestr.substring(datestr.length() - 2));
			}
			if (searchtype.equals("2")) {
				String organkey = auth.getT00_user().getOrgankey();
				LinkedHashMap organMap = cm.getMapFromCache("organ");
				String organName = (String) organMap.get(organkey);
				// ���ܲ�ѯ������ʾΪ������
				form.setOrgankey(organkey);
				form.setOrganName(organName);
				if (t07_user_identity.getStartyear().equals(
						t07_user_identity.getEndyear())) {
					form.setStartyear(t07_user_identity.getStartyear());
					if (t07_user_identity.getStartseason().equals(
							t07_user_identity.getEndseason()))
						form.setStartseason(t07_user_identity.getStartseason());
					else
						form.setStartseason(t07_user_identity.getStartseason()
								+ "-" + t07_user_identity.getEndseason());
				} else {
					form.setStartyear(t07_user_identity.getStartyear() + "-"
							+ t07_user_identity.getEndyear());
					form.setStartseason(t07_user_identity.getStartseason()
							+ "-" + t07_user_identity.getEndseason());
				}

			}
			request.setAttribute("t07_user_identity", t07_user_identity);
			request.setAttribute("editflag", "search");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		if (identitytype.equals("1")) {
			return actionMapping.findForward("success1");
		} else if (identitytype.equals("2")) {
			return actionMapping.findForward("success2");
		} else if (identitytype.equals("3")) {
			return actionMapping.findForward("success3");
		} else {
			return actionMapping.findForward("success4");
		}
	}

	/**
	 * ת�����ҳ��
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performToT07_user_identityadd(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T07_user_identityActionForm form = (T07_user_identityActionForm) actionForm;

		try {
			// ȡ������ʱ�������б�
			TreeMap ymMap = new TreeMap();
			XMLProperties sysConfig = (XMLProperties) context
					.getBean("sysConfig");
			int curryear = Integer.parseInt(DateUtils.getYear(DateUtils
					.getCurrDateTime()));
			int currmonth = Integer.parseInt(DateUtils.getMonth(DateUtils
					.getCurrDateTime()));
			int startyear = Integer.parseInt(sysConfig
					.getProperty("sysparam.datastartyear"));
			while (curryear >= startyear) {
				ymMap.put("" + startyear, "" + startyear);
				startyear++;
			}
			request.setAttribute("dataYmMap", this.getOptionsListByMap(ymMap,
					null, false));
			// ��ȡҳ������Ҫ�������˵���Ϣ
			LinkedHashMap seasonMap = cm.getMapFromCache("seasonlist");
			LinkedHashMap identitytypeMap = cm.getMapFromCache("identitytype");
			LinkedHashMap organMap = cm.getMapFromCache("organ");
			request.setAttribute("seasonMap", this.getOptionsListByMap(
					seasonMap, null, false));
			request.setAttribute("identitytypeMap", this.getOptionsListByMap(
					identitytypeMap, null, false));

			// ��ǰ��������
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			String organkey = auth.getT00_user().getOrgankey();
			String organName = (String) organMap.get(organkey);

			// ��ʼ��ҳ���
			int iseason = currmonth / 3;
			form.setStartyear("" + curryear);
			form.setStartseason("0" + iseason);
			form.setOrgankey(organkey);
			form.setOrganName(organName);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * ת��������ӻ��޸�ҳ��
	 * 
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performT07_user_identityadd(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {

		ActionErrors errors = new ActionErrors();
		T07_user_identityDAO t07_user_identityDao = (T07_user_identityDAO)context.getBean("t07_user_identityDAO");
		T07_user_identityActionForm form = (T07_user_identityActionForm) actionForm;
		String editflag = StringUtils.null2String(request
				.getParameter("editflag"));
		String identitytype = "";
		HttpSession session = request.getSession();
		T07_user_identity t07_user_identity = new T07_user_identity();
		try {
			if (editflag.equals("add")) {
				// ����������ӵ� �жϸñ����Ƿ��Ѿ�����
				MyBeanUtils.copyBean2Bean(t07_user_identity, form);
				// ��֯�û������Ļ���ID
				AuthBean authBean = new AuthBean();
				Authorization auth = new Authorization();
				authBean = (AuthBean) session.getAttribute("authBean");
				auth = authBean.getAuthToken();
				t07_user_identity.setOrgankey(auth.getOrganstr());
				t07_user_identity.setStartdate(Integer.parseInt(form
						.getStartyear()
						+ form.getStartseason()));
				t07_user_identity.setEnddate(t07_user_identity.getStartdate());// ȡͬһ���ѯ

				int row = t07_user_identityDao.getT07_user_identityCount(
						sqlMap, t07_user_identity);
				if (row > 0) {
					request.setAttribute("existerror", "�ü�����Ӧ�����Ѿ�����!");
					return actionMapping.findForward("failure1");
				} else {
					identitytype = form.getIdentitytype();
					DateUtils du = new DateUtils();
					String dateStr = "";
					dateStr = getDateFromSeason(t07_user_identity.getStartyear(),
							t07_user_identity.getStartseason());
					t07_user_identity.setStartdate_str(du.getSeasonBegin(DateUtils
							.stringToDateShort(dateStr)));
					t07_user_identity.setEnddate_str(du.getSeasonEnd(DateUtils
							.stringToDateShort(dateStr)));
					if (identitytype.equals("4")) {
						// ----��ѯ���ݿ�ͳ�Ƴ����ɱ����ϱ����---����������� --��ѯ��������
						ArrayList reportList = t07_user_identityDao
								.getT07_REPORT_STATISTIC_MIDList(sqlMap, t07_user_identity,context);
						this.fillForm2(reportList, form);
                       //��ѯ�ص���ɱ�������������
						
						form.setUpdateUser(auth.getT00_user().getRealname());
						form.setPhone(auth.getT00_user().getTelephone());
						form.setUpdatetime_disp(DateUtils.dateToStringShort(
								DateUtils.getCurrDateTime())
								.replaceAll("-", ""));
					}
					if (identitytype.equals("1")) {
						//��ѯ�¿��ͻ�ͳ��
						ArrayList newPartyList = t07_user_identityDao.getT07_USER_IDENTITY_MList(sqlMap, t07_user_identity,context);
						for (int i = 0; i < newPartyList.size(); i++) {
							T07_user_identity t07_user_identity1 = (T07_user_identity) newPartyList.get(i);
							String flag = t07_user_identity1.getIdentityflag();
							MyBeanUtils.copyBean2Bean(form, "" + flag,
									t07_user_identity1, "");
						}
						
					}
					if (identitytype.equals("2")) {
						//��ѯ���¿ͻ�ͳ��
						ArrayList rePartyList = t07_user_identityDao.getT07_USER_REIDENTITY_MList(sqlMap, t07_user_identity,context);
						for (int i = 0; i < rePartyList.size(); i++) {
							T07_user_identity t07_user_identity1 = (T07_user_identity) rePartyList
									.get(i);
							String flag = t07_user_identity1.getReidentityflag();
							MyBeanUtils.copyBean2Bean(form, "" + flag,
									t07_user_identity1, "");
						}
						
					}
					form.setStartyear(t07_user_identity.getStartyear());
					form.setStartseason(t07_user_identity.getStartseason());
					form.setOrganName(t07_user_identity.getOrganName());
					form.setOrgankey(auth.getT00_user().getOrgankey());
					
				}
			} else if (editflag.equals("edit")) {
				// ������޸� ��ѯ���ñ�����Ϣ
				String[] identitykeys = request
						.getParameterValues("identitykeys");
				String identitykey = identitykeys[0];
				identitytype = identitykey.substring(identitykey.length() - 1);
				identitykey = identitykey
						.substring(0, identitykey.length() - 1);
				t07_user_identity.setIdentitykey(identitykey);
				t07_user_identity.setIdentitytype(identitytype);
				request.setAttribute("identitykey", identitykey);
				ArrayList t07_user_identityList = t07_user_identityDao
						.getT07_user_identityDisp(sqlMap, t07_user_identity);

				// �ж�Ҫ�޸ĵı����Ƿ�Ϊ���Ի���2���͡������˻�3��״̬�Ĳ����޸�=====begin
				for (int i = 0; i < t07_user_identityList.size(); i++) {
					String flag = ((T07_user_identity) t07_user_identityList
							.get(i)).getStatus_cd();
					if (flag.equals("2") || flag.equals("3")) {
						request.setAttribute("existerror", "�޷��޸��ѻ��ܱ���!");
						return actionMapping.findForward("success");
					}
				}// end==========end

				if (identitytype.equals("1")) {
					for (int i = 0; i < t07_user_identityList.size(); i++) {
						T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
								.get(i);
						String flag = t07_user_identity1.getIdentityflag();
						MyBeanUtils.copyBean2Bean(form, "" + flag,
								t07_user_identity1, "");
					}
				} else if (identitytype.equals("2")) {
					for (int i = 0; i < t07_user_identityList.size(); i++) {
						T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
								.get(i);
						String flag = t07_user_identity1.getReidentityflag();
						MyBeanUtils.copyBean2Bean(form, "" + flag,
								t07_user_identity1, "");
					}
				} else if (identitytype.equals("3")) {
					T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
							.get(0);
					MyBeanUtils.copyBean2Bean(form, t07_user_identity1);
				} else if (identitytype.equals("4")) {
					for (int i = 0; i < t07_user_identityList.size(); i++) {
						T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
								.get(i);
						String flag = t07_user_identity1.getCurrflag();
						// t07_user_identity1.initform();
						//modify by qiuyun 2012,8,9 �޸�ʱδ��������ĸ�ֵ����ȥ
						if("3".equals(flag))
						{
							form.setCp_reportAmt3(t07_user_identity1.getCp_reportAmt());
							form.setCp_reportNum3(t07_user_identity1.getCp_reportNum());
							form.setId_reportAmt3(t07_user_identity1.getId_reportAmt());
							form.setId_reportNum3(t07_user_identity1.getId_reportNum());
						}
						//end by qiuyun
						
						MyBeanUtils.copyBean2Bean(form, "" + flag,
								t07_user_identity1, "");
					}
					if (t07_user_identityList.size() > 0) {
						T07_user_identity t07_user_identity1 = (T07_user_identity) t07_user_identityList
								.get(0);
						form.setUpdatetime_disp(DateUtils
								.dateToStringShort(t07_user_identity1
										.getUpdatetime()));
					}
				}
				// ����ʱ�� ��ͳ��ʱ���ֳ���ͼ���
				if (form.getStatisticdate() > 0) {
					String datestr = String.valueOf(form.getStatisticdate());
					form.setStartyear(datestr
							.substring(0, datestr.length() - 2));
					form
							.setStartseason(datestr
									.substring(datestr.length() - 2));
				}
			}
			request.setAttribute("editflag", editflag);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
//		if (identitytype.equals("1") && editflag.equals("add")) {
//			// ��ǰ��������
//			AuthBean authBean = new AuthBean();
//			Authorization auth = new Authorization();
//			authBean = (AuthBean) request.getSession().getAttribute("authBean");
//			auth = authBean.getAuthToken();
//			String organkey = auth.getT00_user().getOrgankey();
//
//			T09_new_party_statistics tnps = new T09_new_party_statistics();
//			String year = form.getStartyear();
//			String season = form.getStartseason();
//			String begindate = "";
//			String enddate = "";
//			if (season.equals("01")) {
//				begindate = year + "-01-01";
//				enddate = year + "-03-31";
//			}
//			if (season.equals("02")) {
//				begindate = year + "-04-01";
//				enddate = year + "-06-30";
//			}
//			if (season.equals("03")) {
//				begindate = year + "-07-01";
//				enddate = year + "-09-30";
//			}
//			if (season.equals("04")) {
//				begindate = year + "-10-01";
//				enddate = year + "-12-31";
//			}
//			tnps.setBeginDate(DateUtils.stringToDateShort(begindate));
//			tnps.setEndDate(DateUtils.stringToDateShort(enddate));
//			tnps.setOrgankey(organkey);
//			try {
//				tnps = t07_user_identityDao.getT09_new_party_statistics(sqlMap,
//						tnps);
//				System.out.println(tnps.getCnew() + tnps.getImnew()
//						+ tnps.getInew() + tnps.getInmnew());
//			} catch (SQLException e) {
//				e.printStackTrace();
//				errors.add(errors.GLOBAL_ERROR, new ActionError(
//						"error.pagertitle.default"));
//				saveErrors(request, errors);
//				return actionMapping.findForward("failure");
//			}
//			if (tnps.getCnew() == null || tnps.getCnew().equals("")) {
//				tnps.setCnew("0");
//			}
//			if (tnps.getInew() == null || tnps.getInew().equals("")) {
//				tnps.setInew("0");
//			}
//			if (tnps.getImnew() == null || tnps.getImnew().equals("")) {
//				tnps.setImnew("0");
//			}
//			if (tnps.getInmnew() == null || tnps.getInmnew().equals("")) {
//				tnps.setInmnew("0");
//			}
//			form.setCp_total1(tnps.getCnew());
//			form.setId_total1(tnps.getInew());
//			form.setId_residents1(tnps.getImnew());
//			form.setId_nonresidents1(tnps.getInmnew());
//		}
		if (identitytype.equals("1")) {
			return actionMapping.findForward("success1");
		} else if (identitytype.equals("2")) {
			return actionMapping.findForward("success2");
		} else if (identitytype.equals("3")) {
			return actionMapping.findForward("success3");
		} else {
			return actionMapping.findForward("success4");
		}
	}
	
	/**
	 * ��ӻ��޸Ķ���
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performT07_user_identitylistaddDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_user_identityActionForm form=(T07_user_identityActionForm)actionForm;
		T07_user_identityDAO t07_user_identityDAO=(T07_user_identityDAO)context.getBean("t07_user_identityDAO");
		int row=0;
		try{
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			String editflag=StringUtils.null2String(request.getParameter("editflag")); 
			String identitytype=StringUtils.null2String(request.getParameter("identitytype"));
			ArrayList t07_user_identitylist=new ArrayList();
			form.setStatisticdate(Integer.parseInt(form.getStartyear()+form.getStartseason()));
			//װ������
			if(identitytype.equals("1")){
				for(int i=1;i<=4;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					t07_user_identity.setIdentityflag(""+i);
					
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					t07_user_identitylist.add(t07_user_identity);
				}
			}else if(identitytype.equals("2")){
				for(int i=1;i<=5;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					t07_user_identity.setReidentityflag(""+i);
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					t07_user_identitylist.add(t07_user_identity);
				}
			}else if(identitytype.equals("3")){
				T07_user_identity t07_user_identity=new T07_user_identity();
				MyBeanUtils.copyBean2Bean(t07_user_identity,form);
				t07_user_identitylist.add(t07_user_identity);
			}else if(identitytype.equals("4")){

				for(int i=1;i<=3;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					if(t07_user_identity.getCp_reportNum()==null||"".equals(t07_user_identity.getCp_reportNum())){
						t07_user_identity.setCp_reportNum("0");
					}
					if(t07_user_identity.getCp_reportAmt()==null||"".equals(t07_user_identity.getCp_reportAmt())){
						t07_user_identity.setCp_reportAmt("0.00");
					}
					if(t07_user_identity.getId_reportNum()==null||"".equals(t07_user_identity.getId_reportNum())){
						t07_user_identity.setId_reportNum("0");
					}
					if(t07_user_identity.getId_reportAmt()==null||"".equals(t07_user_identity.getId_reportAmt())){
						t07_user_identity.setId_reportAmt("0.00");
					}
					if(t07_user_identity.getCpl_reportNum()==null||"".equals(t07_user_identity.getCpl_reportNum())){
						t07_user_identity.setCpl_reportNum("0");
					}
					if(t07_user_identity.getCpl_reportAmt()==null||"".equals(t07_user_identity.getCpl_reportAmt())){
						t07_user_identity.setCpl_reportAmt("0.00");
					}
					if(t07_user_identity.getIdl_reportNum()==null||"".equals(t07_user_identity.getIdl_reportNum())){
						t07_user_identity.setIdl_reportNum("0");
					}
					if(t07_user_identity.getIdl_reportAmt()==null||"".equals(t07_user_identity.getIdl_reportAmt())){
						t07_user_identity.setIdl_reportAmt("0.00");
					}
					t07_user_identity.setCurrflag(""+i);

					t07_user_identitylist.add(t07_user_identity);
				}
				
			}
			
			
			if(editflag.equals("add")){
				//���������
				row=t07_user_identityDAO.insertT07_user_identity(sqlMap,t07_user_identitylist);
			}else if(editflag.equals("edit")){
				//������޸�
				row=t07_user_identityDAO.modifyT07_user_identity(sqlMap,t07_user_identitylist);
			}
			if(row==0){
				throw new Exception("�������޸ĳ��� û�м�¼������!");
			}
			
			
			// 1.��ʼ����־����
			AuthBean authBean = (AuthBean)request.getSession().getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			
			T00_operate_log t00_operate_log=new T00_operate_log();
			t00_operate_log.setModule_key_sub2("");//�ӹ��ܵ�2��
			t00_operate_log.setOperate_obj1(form.getIdentitykey());//��������1��
			t00_operate_log.setOperate_obj2("");//��������2��
			t00_operate_log.setIs_succ(String.valueOf(row));//������� 1���ɹ�0��ʧ��
			t00_operate_log.setOperate_desc("T07_USER_IDENTITY");//��������(�����ı�������"��"�ָ�)
			if(editflag.equals("add")){
				t00_operate_log.setModule_key_sub1("���ֳ�����±������");//�ӹ��ܵ�1��
				t00_operate_log.setOperate_type("1");//�������� 1:���2:�޸�3:ɾ��4:��ѯ���ݲ��ǣ�
			}else if(editflag.equals("edit")){
				t00_operate_log.setModule_key_sub1("���ֳ�����±����޸�");//�ӹ��ܵ�1��
				t00_operate_log.setOperate_type("2");//�������� 1:���2:�޸�3:ɾ��4:��ѯ���ݲ��ǣ�
			}
			// 2.д������־
			this.writeOperLog(auth, sqlMap, t00_operate_log);
			
			sqlMap.commitTransaction();
						
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try{
				sqlMap.endTransaction();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return actionMapping.findForward("success");
	}
	
	/**
	 * ɾ������
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performDelT07_user_identityDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_user_identityDAO t07_user_identityDAO =  (T07_user_identityDAO)context.getBean("t07_user_identityDAO");
        int row=0;
		try{
			String[] identitykeys = request.getParameterValues("identitykeys");
			String identitykey="";
			String identitytype="";
			for(int i=0;i<identitykeys.length;i++){
				identitykey=identitykeys[i];
				identitytype=identitykey.substring(identitykey.length()-1);
				identitykey=identitykey.substring(0, identitykey.length()-1);
				//�ж�---Ϊ���ѻ���2��״̬�͡������˻�3��״̬������ɾ��=====begin
				List list = (ArrayList)t07_user_identityDAO.getT07_user_identityDisp(sqlMap, identitykey, identitytype);
				for(int j = 0; j < list.size(); j++){
					String flag = ((T07_user_identity)list.get(j)).getStatus_cd();
					if(flag.equals("2") || flag.equals("3")){
						request.setAttribute("existerror", "�޷�ɾ���ѻ��ܱ���!");
						return actionMapping.findForward("success");
					}
				}//end==========end
				row=t07_user_identityDAO.delT07_user_identity(sqlMap,identitykey,identitytype);
			}
			if(row==0){
				throw new Exception("ɾ������ û�м�¼������!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	/**
	 * ״̬����
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */	
	private ActionForward performT07_user_identityUpdateStatus(ActionMapping mapping, 
				ActionForm form, HttpServletRequest request, 
				HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_user_identityDAO t07_user_identityDAO=(T07_user_identityDAO)context.getBean("t07_user_identityDAO");
		String changeStatus = request.getParameter("changeStatus");
		int count = 0;
		try{
        	//�ж��Ƿ�Ҫ���ĳɡ����1��״̬,Ϊ���ݸ�0��״̬�͡��˻�4��״̬�Ĳ��ܸ���
	        if(changeStatus.equals("1")){
	        	int count0 = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "0");
	        	int count4 = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "4");
	        	count = count0 + count4;
	        	if(count == 0){
	        		request.setAttribute("existerror", "ֻ�вݸ���˻صĲſ������");
	        		return mapping.findForward("success");
	        	}
	        }
        	//�ж��Ƿ�Ҫ���ĳɡ�����2��״̬,Ϊ�����1��״̬�͡������˻�3��״̬�Ĳ��ܸ���
	        if(changeStatus.equals("2")){
	        	int count1 = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "1");
	        	int count3 = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "3");
	        	count = count1 + count3;
	        	if(count == 0){
	        		request.setAttribute("existerror", "ֻ����ɺ������˻صĲſ��Ի���");
	        		return mapping.findForward("success");
	        	}
	        }
	        //�ж��Ƿ������ĳɡ������˻�3��״̬��Ϊ������2��״̬�Ĳ��ܸ���
	        if(changeStatus.equals("3")){
	        	count = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "2");
	        	if(count == 0){
	        		request.setAttribute("existerror", "ֻ���ѻ��ܵĲſ��������˻�");
	        		return mapping.findForward("success");
	        	}
	        }
	        //�ж��Ƿ���ĳɡ��˻�4��״̬��Ϊ�������˻�3��״̬�Ĳ��ܸ���
	        if(changeStatus.equals("4")){
	        	count = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "3");
	        	if(count == 0){
	        		request.setAttribute("existerror", "ֻ�������˻صĲſ����˻�");
	        		return mapping.findForward("success");
	        	}
	        }
	        //���ܾ��˻ء���ť����(���������˻�3��״̬�ĸĳɡ�����2��״̬)
	        if(changeStatus.equals("5")){
	        	changeStatus = "2";
	        	count = t07_user_identityChangeStatus(request, t07_user_identityDAO, changeStatus, "3");
	        	if(count == 0){
	        		request.setAttribute("existerror", "ֻ�������˻صĲſ��Ծܾ��˻�");
	        		return mapping.findForward("success");
	        	}
	        }
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return mapping.findForward("failure");
		}
		return mapping.findForward("success");
	}
	
	/**
	 * �жϱ������״̬(�ṩ��performT07_user_identityUpdateStatus����)
	 * @param request
	 * @param t07_user_identityDAO
	 * @param changeStatus    ���³�changStatus״̬
	 * @param status_cd       status_cd״̬�Ĳ��ܸ���
	 * @return ��������
	 * @throws Exception
	 */
	private int t07_user_identityChangeStatus(HttpServletRequest request,
			T07_user_identityDAO t07_user_identityDAO, String changeStatus, 
			String status_cd)throws Exception{
		int count = 0;
		String[] identitykeys = request.getParameterValues("identitykeys");
		String identitykey="";
		String identitytype="";
		for(int i=0;i<identitykeys.length;i++){
			identitykey=identitykeys[i];
			identitytype=identitykey.substring(identitykey.length()-1);
			identitykey=identitykey.substring(0, identitykey.length()-1);
			List list = (ArrayList)t07_user_identityDAO.getT07_user_identityDisp(sqlMap, identitykey, identitytype);
			for(int j = 0; j < list.size(); j++){
				String flag = ((T07_user_identity)list.get(j)).getStatus_cd();
				if(flag.equals(status_cd)){
					int row = t07_user_identityDAO.updateT07_user_identityStatus(sqlMap, identitykey, identitytype, changeStatus);
					count = count + row;
				}
			}
		}
		return count;
    }
	
	/**
	 * ����Excel ֱ��ʹ��formbean�е����� ����ѯ���ݿ�
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT07_user_identityExcel(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_user_identityActionForm form=(T07_user_identityActionForm)actionForm;
		String identitytype=StringUtils.nullObject2String(request.getParameter("identitytype"));
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		try{
			
			String organKey=form.getOrgankey();
			
			LinkedHashMap report_organ_mapMap=cm.getMapFromCache("report_organ_map");
			LinkedHashMap report_organMap=cm.getMapFromCache("report_organ");
			
			String organkey=auth.getT00_user().getOrgankey();
			String organkey_rh="";
			String organName="";
			if(report_organ_mapMap.containsKey(organkey))
			{
				organkey_rh =(String)report_organ_mapMap.get(organkey);
			}
			if(report_organMap.containsKey(organkey_rh))
			{
				organName=(String)report_organMap.get(organkey_rh);
			}
			
			String data_type="";//�������
			String organ_type="";//�������
			String filehead=StringUtils.getRandomString(10);
			String jasperpath = "";
			List paramList = new ArrayList();
			List list = new ArrayList();
			//װ������
			paramList.add(organName);
			paramList.add(form.getStartyear());
			paramList.add(form.getStartseason().replaceAll("0", ""));
			if(identitytype.equals("1")){
				data_type="F";
				jasperpath = "/WEB-INF/reports/t09_cust_report.jasper";
				for(int i=1;i<=4;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					//���뱨��ģ������
					paramList.add(t07_user_identity.getCp_total());
					paramList.add(t07_user_identity.getCp_proxy());
					paramList.add(t07_user_identity.getCp_thparty());
					paramList.add(t07_user_identity.getCp_disembark());
					paramList.add(t07_user_identity.getCp_benefit());
					paramList.add(t07_user_identity.getCp_questotal());
					paramList.add(t07_user_identity.getCp_anonymous());
					paramList.add(t07_user_identity.getCp_falsecard());
					paramList.add(t07_user_identity.getCp_failurecard());
					paramList.add(t07_user_identity.getCp_otherscard());
					paramList.add(t07_user_identity.getCp_suspects());
					paramList.add(t07_user_identity.getCp_othercase());
					paramList.add(t07_user_identity.getId_total());
					paramList.add(t07_user_identity.getId_proxy());
					paramList.add(t07_user_identity.getId_thparty());
					paramList.add(t07_user_identity.getId_residents());
					paramList.add(t07_user_identity.getId_resiproxy());
					paramList.add(t07_user_identity.getId_nonresidents());
					paramList.add(t07_user_identity.getId_nonresiproxy());
					paramList.add(t07_user_identity.getId_questotal());
					paramList.add(t07_user_identity.getId_anonymous());
					paramList.add(t07_user_identity.getId_falsecard());
					paramList.add(t07_user_identity.getId_failurecard());
					paramList.add(t07_user_identity.getId_otherscard());
					paramList.add(t07_user_identity.getId_suspects());
					paramList.add(t07_user_identity.getId_othercase());
					paramList.add(t07_user_identity.getAll_total());
				}
				paramList.add(data_type);
			}else if(identitytype.equals("2")){
				data_type="G";
				jasperpath = "/WEB-INF/reports/t09_c_cust_report.jasper";
				for(int i=1;i<=5;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					paramList.add(t07_user_identity.getChangeinfo());
					paramList.add(t07_user_identity.getInfo_verified());
					paramList.add(t07_user_identity.getBehavior());
					paramList.add(t07_user_identity.getBeha_verified());
					paramList.add(t07_user_identity.getSuspects());
					paramList.add(t07_user_identity.getSuspe_verified());
					paramList.add(t07_user_identity.getSuspicious());
					paramList.add(t07_user_identity.getSuspi_verified());
					paramList.add(t07_user_identity.getOthercase());
					paramList.add(t07_user_identity.getOther_verified());
					paramList.add(t07_user_identity.getTotal());
					paramList.add(t07_user_identity.getTotal_verified());
					paramList.add(t07_user_identity.getFailurecard());
					paramList.add(t07_user_identity.getUpdatecard());
				}
				paramList.add(data_type);
			}else if(identitytype.equals("3")){
				data_type="H";
				jasperpath = "/WEB-INF/reports/t09_trans_report.jasper";
				paramList.add(form.getBusiness_alert());
				paramList.add(form.getService_alert());
				paramList.add(form.getDegree_alert());
				paramList.add(form.getTrade_alert());
				paramList.add(data_type);
			}else if(identitytype.equals("4")){
				data_type="I";
				jasperpath = "/WEB-INF/reports/t09_c_trans_report.jasper";
				paramList.add(form.getCp_reportNum1());
				paramList.add(form.getCp_reportAmt1());
				paramList.add(form.getId_reportNum1());
				paramList.add(form.getId_reportAmt1());
				paramList.add(form.getCpl_reportNum1());
				paramList.add(form.getCpl_reportAmt1());
				paramList.add(form.getIdl_reportNum1());
				paramList.add(form.getIdl_reportAmt1());
				paramList.add(form.getDes1());
				paramList.add(form.getCp_reportNum2());
				paramList.add(form.getCp_reportAmt2());
				paramList.add(form.getId_reportNum2());
				paramList.add(form.getId_reportAmt2());
				paramList.add(form.getCpl_reportNum2());
				paramList.add(form.getCpl_reportAmt2());
				paramList.add(form.getIdl_reportNum2());
				paramList.add(form.getIdl_reportAmt2());
				organ_type="F";
				paramList.add("F");//�����������ʹ�÷���
				paramList.add(organkey_rh);
				paramList.add(form.getUpdateUser());
				paramList.add(form.getPhone());
				paramList.add(form.getUpdatetime_disp().replaceAll("-", ""));
				
				paramList.add(form.getCp_reportNum3());
				paramList.add(form.getCp_reportAmt3());
				paramList.add(form.getId_reportNum3());
				paramList.add(form.getId_reportAmt3());
				
			}
			
			if(!identitytype.equals("4")){
				organ_type="F";
				paramList.add("F");
				paramList.add(organkey_rh);
				paramList.add(auth.getT00_user().getRealname());
				paramList.add(auth.getT00_user().getTelephone());
				paramList.add(DateUtils.dateToStringShort(DateUtils.getCurrDateTime()).replaceAll("-", ""));
			}
			List dataList = new ArrayList();
			list.add(dataList);
			
			request.setAttribute("filehead", filehead);
			request.setAttribute("jasperpath", jasperpath);
			request.setAttribute("paramList", paramList);
			request.setAttribute("dataList", list);
			request.setAttribute("isdel", "1");
			String quarter="1";
			if(form.getStartseason()!=null && form.getStartseason().length()==2){
				quarter=form.getStartseason().substring(1, 2);
			}
			String excelname=organkey_rh+data_type+
							form.getStartyear()+quarter+organ_type+"000";
			request.setAttribute("excelname", excelname);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	
	private void fillForm2(ArrayList reportList, T07_user_identityActionForm form) {
		for(int i=0;i<reportList.size();i++){
			T07_user_identity t07_user_identity1=(T07_user_identity) reportList.get(i);
			if(t07_user_identity1.getCurrflag().equals("1")){
				form.setCp_reportNum1(t07_user_identity1.getCp_reportNum());
				form.setCp_reportAmt1(t07_user_identity1.getCp_reportAmt());
				form.setId_reportNum1(t07_user_identity1.getId_reportNum());
				form.setId_reportAmt1(t07_user_identity1.getId_reportAmt());
				form.setCpl_reportNum1(t07_user_identity1.getCpl_reportNum());
				form.setCpl_reportAmt1(t07_user_identity1.getCpl_reportAmt());
				form.setIdl_reportNum1(t07_user_identity1.getIdl_reportNum());
				form.setIdl_reportAmt1(t07_user_identity1.getIdl_reportAmt());
			}else{
				form.setCp_reportNum2(t07_user_identity1.getCp_reportNum());
				form.setCp_reportAmt2(t07_user_identity1.getCp_reportAmt());
				form.setId_reportNum2(t07_user_identity1.getId_reportNum());
				form.setId_reportAmt2(t07_user_identity1.getId_reportAmt());
				form.setCpl_reportNum2(t07_user_identity1.getCpl_reportNum());
				form.setCpl_reportAmt2(t07_user_identity1.getCpl_reportAmt());
				form.setIdl_reportNum2(t07_user_identity1.getIdl_reportNum());
				form.setIdl_reportAmt2(t07_user_identity1.getIdl_reportAmt());
			}
		}
	}
	
	private String getDateFromSeason(String year, String season) {
		String date = "";
		if (season.equals("01")) {
			date = year + "-01-01";
		} else if (season.equals("02")) {
			date = year + "-04-01";
		} else if (season.equals("03")) {
			date = year + "-07-01";
		} else if (season.equals("04")) {
			date = year + "-10-01";
		}
		return date;
	}
	
	
	/**
	 * add by lijie 2012.7.11
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
	public ActionForward performExport_t07_user_identitytList(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T07_user_identityActionForm form=(T07_user_identityActionForm)actionForm;
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();
		String identitytype = StringUtils.nullObject2String(request.getParameter("identitytype"));
		
		try {
			//�����ж������־λ��
			boolean totalRow = false;
			
			if(identitytype.equals("1")){
				for(int i=1;i<=4;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					request.setAttribute("cp_total" + i, t07_user_identity.getCp_total());
					request.setAttribute("cp_proxy" + i, t07_user_identity.getCp_proxy());
					request.setAttribute("cp_thparty" + i, t07_user_identity.getCp_thparty());
					request.setAttribute("cp_disembark" + i, t07_user_identity.getCp_disembark());
					request.setAttribute("cp_benefit" + i, t07_user_identity.getCp_benefit());
					request.setAttribute("cp_questotal" + i, t07_user_identity.getCp_questotal());
					request.setAttribute("cp_anonymous" + i, t07_user_identity.getCp_anonymous());
					request.setAttribute("cp_falsecard" + i, t07_user_identity.getCp_falsecard());
					request.setAttribute("cp_failurecard" + i, t07_user_identity.getCp_failurecard());
					request.setAttribute("cp_otherscard" + i, t07_user_identity.getCp_otherscard());
					request.setAttribute("cp_suspects" + i, t07_user_identity.getCp_suspects());
					request.setAttribute("cp_othercase" + i, t07_user_identity.getCp_othercase());
					request.setAttribute("id_total" + i, t07_user_identity.getId_total());
					request.setAttribute("id_proxy" + i, t07_user_identity.getId_proxy());
					request.setAttribute("id_thparty" + i, t07_user_identity.getId_thparty());
					request.setAttribute("id_residents" + i, t07_user_identity.getId_residents());
					request.setAttribute("id_resiproxy" + i, t07_user_identity.getId_resiproxy());
					request.setAttribute("id_nonresidents" + i, t07_user_identity.getId_nonresidents());
					request.setAttribute("id_nonresiproxy" + i, t07_user_identity.getId_nonresiproxy());
					request.setAttribute("id_questotal" + i, t07_user_identity.getId_questotal());
					request.setAttribute("id_anonymous" + i, t07_user_identity.getId_anonymous());
					request.setAttribute("id_falsecard" + i, t07_user_identity.getId_falsecard());
					request.setAttribute("id_failurecard" + i, t07_user_identity.getId_failurecard());
					request.setAttribute("id_otherscard" + i, t07_user_identity.getId_otherscard());
					request.setAttribute("id_suspects" + i, t07_user_identity.getId_suspects());
					request.setAttribute("id_othercase" + i, t07_user_identity.getId_othercase());
					request.setAttribute("all_total" + i, t07_user_identity.getAll_total());
					
				}
				int j = 1;
				while(j<=4)
				{
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+j);
					if(!t07_user_identity.getAll_total().equals("0") && !totalRow)
					{
						totalRow = true;
						break;
					}
					j++;
				}
			}
			else if(identitytype.equals("2"))
			{
				for(int i=1;i<=5;i++){
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+i);
					request.setAttribute("changeinfo" + i,t07_user_identity.getChangeinfo());
					request.setAttribute("info_verified" + i,t07_user_identity.getInfo_verified());
					request.setAttribute("behavior" + i,t07_user_identity.getBehavior());
					request.setAttribute("beha_verified" + i,t07_user_identity.getBeha_verified());
					request.setAttribute("suspects" + i,t07_user_identity.getSuspects());
					request.setAttribute("suspe_verified" + i,t07_user_identity.getSuspe_verified());
					request.setAttribute("suspicious" + i,t07_user_identity.getSuspicious());
					request.setAttribute("suspi_verified" + i,t07_user_identity.getSuspi_verified());
					request.setAttribute("othercase" + i,t07_user_identity.getOthercase());
					request.setAttribute("other_verified" + i,t07_user_identity.getOther_verified());
					request.setAttribute("total" + i,t07_user_identity.getTotal());
					request.setAttribute("total_verified" + i,t07_user_identity.getTotal_verified());
					request.setAttribute("failurecard" + i,t07_user_identity.getFailurecard());
					request.setAttribute("updatecard" + i,t07_user_identity.getUpdatecard());
				}
				int j = 1;
				while(j<=5)
				{
					T07_user_identity t07_user_identity=new T07_user_identity();
					MyBeanUtils.copyBean2Bean(t07_user_identity,"",form,""+j);
					if(!t07_user_identity.getTotal().equals("0") && !totalRow)
					{
						totalRow = true;
						break;
					}
					j++;
				}
			}
			else if(identitytype.equals("3"))
			{
				request.setAttribute("business_alert",form.getBusiness_alert());
				request.setAttribute("service_alert",form.getService_alert());
				request.setAttribute("degree_alert",form.getDegree_alert());
				request.setAttribute("trade_alert",form.getTrade_alert());
				if(!totalRow)
				{
					if(!"0".equals(form.getBusiness_alert()))
						totalRow = true;
					else if(!"0".equals(form.getService_alert()))
							totalRow = true;
					else if(!"0".equals(form.getDegree_alert()))
							totalRow = true;
					else if(!"0".equals(form.getTrade_alert()))
							totalRow = true;
					else
						totalRow = false;
				}
				if( form.getBusiness_alert().equals("") && form.getService_alert().equals("") && form.getDegree_alert().equals("") && form.getTrade_alert().equals(""))
					totalRow = false;
				
			}
			else if(identitytype.equals("4"))
			{
				request.setAttribute("cp_reportNum1",form.getCp_reportNum1());
				request.setAttribute("cp_reportAmt1",form.getCp_reportAmt1());
				request.setAttribute("id_reportNum1",form.getId_reportNum1());
				request.setAttribute("id_reportAmt1",form.getId_reportAmt1());
				request.setAttribute("cpl_reportNum1",form.getCpl_reportNum1());
				request.setAttribute("cpl_reportAmt1",form.getCpl_reportAmt1());
				request.setAttribute("idl_reportNum1",form.getIdl_reportNum1());
				request.setAttribute("idl_reportAmt1",form.getIdl_reportAmt1());
				request.setAttribute("des1",form.getDes1());
				request.setAttribute("cp_reportNum2",form.getCp_reportNum2());
				request.setAttribute("cp_reportAmt2",form.getCp_reportAmt2());
				request.setAttribute("id_reportNum2",form.getId_reportNum2());
				request.setAttribute("id_reportAmt2",form.getId_reportAmt2());
				request.setAttribute("cpl_reportNum2",form.getCpl_reportNum2());
				request.setAttribute("cpl_reportAmt2",form.getCpl_reportAmt2());
				request.setAttribute("idl_reportNum2",form.getIdl_reportNum2());
				request.setAttribute("idl_reportAmt2",form.getIdl_reportAmt2());
				request.setAttribute("des2",form.getDes2());
				request.setAttribute("cp_reportNum3",form.getCp_reportNum3());
				request.setAttribute("cp_reportAmt3",form.getCp_reportAmt3());
				request.setAttribute("id_reportNum3",form.getId_reportNum3());
				request.setAttribute("id_reportAmt3",form.getId_reportAmt3());
				
				if(!totalRow)
				{
					if(!"0".equals(form.getCp_reportNum1()))
						totalRow = true;
					else if(!"0".equals(form.getId_reportNum1()))
						totalRow = true;
					else if(!"0".equals(form.getCpl_reportNum1()))
						totalRow = true;
					else if(!"0".equals(form.getIdl_reportNum1()))
						totalRow = true;
					else if(!"0".equals(form.getCp_reportNum2()))
						totalRow = true;
					else if(!"0".equals(form.getId_reportNum2()))
						totalRow = true;
					else if(!"0".equals(form.getCpl_reportNum2()))
						totalRow = true;
					else if(!"0".equals(form.getIdl_reportNum2()))
						totalRow = true;
					else
						totalRow = false;
				}
				if( form.getCp_reportNum1().equals("") && form.getId_reportNum1().equals("") 
					&& form.getCpl_reportNum1().equals("") && form.getIdl_reportNum1().equals("")
					&& form.getCp_reportNum2().equals("") && form.getId_reportNum2().equals("")
					&& form.getCpl_reportNum2().equals("") && form.getIdl_reportNum2().equals(""))
					totalRow = false;
			}
			LinkedHashMap report_organ_mapMap = cm.getMapFromCache("report_organ_map");
			LinkedHashMap report_organMap = cm.getMapFromCache("report_organ");
			String user_organkey = auth.getT00_user().getOrgankey();
			
			
			//�������Ƶ�ǰ׺
			//1.�������
			String type_cd = this.getFileNameHead(identitytype);
			//2.������Դ
			String level = "F";// ����ʹ�÷���
			//3.�����
			String reportDate = DateUtils.dateToStringShort(new java.util.Date(System.currentTimeMillis()));
			//4.���
			String year = reportDate.substring(0, reportDate.indexOf("-"));
			
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
			if(totalRow)
				zero_flag = "��";
			else
				zero_flag = "��";
			//11.����
			String quarter = "1";
			if(form.getStartseason()!=null && form.getStartseason().length()==2){
				quarter=form.getStartseason().substring(1, 2);
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
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if(identitytype.equals("1"))
			return actionMapping.findForward("success1");
		else if(identitytype.equals("2"))
			return actionMapping.findForward("success2");
		else if(identitytype.equals("3"))
			return actionMapping.findForward("success3");
		else
			return actionMapping.findForward("success4");
	}
	
	/**
	 * @since ȡ�ñ����ļ���ͷ�����������
	 * @param identitytype
	 *            String ��������
	 * @return String
	 */
	public String getFileNameHead(String identitytype) {
		String type = "";
		if (identitytype.equals("1")) {// ʶ��ͻ�
			type = "F";
		} else if (identitytype.equals("2")) {// ����ʶ��
			type = "G";
		} else if (identitytype.equals("3")) {// ���ɽ���ʶ��
			type = "H";
		} else if (identitytype.equals("4")) {// ���ɽ��ױ���
			type = "I";
		} 
		return type;
	}
}
