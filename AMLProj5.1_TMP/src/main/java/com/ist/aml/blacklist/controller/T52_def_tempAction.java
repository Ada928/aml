/* =============================================
 * $Id: GenCode.java,v 1.1.1.1 2008/01/11 08:49:24 hubaiqing Exp $
 * Created [2012-08-30] by makecode program v2.2
 * =============================================
 * awp (Audit Working Platform)
 * Description:
 * =============================================
 * Copyright (c) 2005-2008 by INFO SCIENCE&TECH
 * All rights reserved.* =============================================
 */

package com.ist.aml.blacklist.controller;



import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import com.ist.aml.blacklist.dao.T52_def_tempDAO;
import com.ist.aml.blacklist.dto.T52_def_temp;
import com.ist.aml.newrisk.dao.T31_def_tempDAO;
import com.ist.aml.newrisk.dto.T31_def_temp;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.util.DateUtils;
import com.ist.util.StringUtils;

/**
 * ����˹ģ��Action
 * @author liuzp
 *
 */
public class T52_def_tempAction extends BaseAction
{

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
			HttpServletRequest request, HttpServletResponse response)
	{
		
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		
		
		if ("getT52_def_tempList".equalsIgnoreCase(myaction))				// ��ѯ���
		{
			myforward = performGetT52_def_tempList(mapping, form, request,
					response);
		}
		
		
		else if ("addT52_def_temp".equalsIgnoreCase(myaction))				// ��ӽ���
		{
			myforward = performAddT52_def_temp(mapping, form, request, response);
		}
		
		
		
		else if ("addT52_def_tempDo".equalsIgnoreCase(myaction))			// ������Ӷ���
		{
			myforward = performAddT52_def_tempDo(mapping, form, request,
					response, true);
		}
		
		else if ("md_addT52_def_tempDo".equalsIgnoreCase(myaction))			// ������Ӷ���
		{
			myforward = performAddT52_def_tempDo(mapping, form, request,
					response, false);
		}
		
		
		else if ("modifyT52_def_temp_main".equalsIgnoreCase(myaction))		// �޸�������
		{
			myforward = performModifyT52_def_temp_main(mapping, form, request,
					response);
		}
		
		else if ("modifyT52_def_temp".equalsIgnoreCase(myaction))			// �޸Ļ������Խ���
		{
			myforward = performModifyT52_def_temp(mapping, form, request,
					response);
		}
		
		else if ("modifyT52_def_tempDo".equalsIgnoreCase(myaction))			// �������Խ����޸Ķ���
		{
			myforward = performModifyT52_def_tempDo(mapping, form, request,
					response);
		}
		
		
		/* ģ��ִ�����ȱ���� */
		
		else if ("getT52_def_temp_granList".equalsIgnoreCase(myaction))		// ҳǩ��ģ��ִ�����ȱ�List
		{
			myforward = performGetT52_def_temp_granList(mapping, form, request,
					response);
		}
		
		else if ("addT52_def_temp_gran".equalsIgnoreCase(myaction))			// ���ģ��ִ������
		{
			myforward = performAddT52_def_temp_gran(mapping, form, request,
					response);
		} else if ("addT52_def_temp_granDo".equalsIgnoreCase(myaction))		// ���ģ��ִ�������ύ
		{
			myforward = performAddT52_def_temp_granDo(mapping, form, request,
					response);
		}
		
		else if ("modT52_def_temp_gran".equalsIgnoreCase(myaction))			// �޸�ģ��ִ������
		{
			myforward = performModT52_def_temp_gran(mapping, form, request,
					response);
		} else if ("modT52_def_temp_granDo".equalsIgnoreCase(myaction))		// �޸�ģ��ִ�������ύ
		{
			myforward = performModT52_def_temp_granDo(mapping, form, request,
					response);
		}
		
		else if ("delT52_def_temp_gran".equalsIgnoreCase(myaction))			// ɾ��ģ��ִ������
		{
			myforward = performDelT52_def_temp_gran(mapping, form, request,
					response);
		}
		
		
		else if ("getT52_def_temp_sqlList".equalsIgnoreCase(myaction))		// ��ѯģ��SQL�б�
		{
			myforward = performGetT52_def_temp_sqlList(mapping, form, request,
					response);
		}
		
		
		else if ("changeT52_def_tempFlag".equalsIgnoreCase(myaction))		// �޸�ģ��������״̬
		{
			myforward = performChangeT52_def_tempFlag(mapping, form, request,
					response);
		}
		
		
		else if ("copyT52_def_temp".equalsIgnoreCase(myaction))				// ����ģ��
		{
			myforward = performCopyT52_def_temp(mapping, form, request,
					response);
		}
		
		// ɾ������
		else if ("deleteT52_def_tempDo".equalsIgnoreCase(myaction))
		{
			myforward = performDeleteT52_def_tempDo(mapping, form, request,
					response);
		}
		
		
		
		// ��ѯ��ϸ��Ϣjf
		else if ("getT31_def_tempDisp".equalsIgnoreCase(myaction))
		{
			myforward = performGetT31_def_tempDisp(mapping, form, request,
					response);
		}
		
		// ��ѯ��ϸ��Ϣgs
		else if ("getT31_def_tempDisp_gs".equalsIgnoreCase(myaction))
		{
			myforward = performGetT31_def_tempDisp_gs(mapping, form, request,
					response);
		}
		
		
		return myforward;

	}

	/**
	 * ģ���б�ҳ��
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
	public ActionForward performGetT52_def_tempList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		ArrayList t52_def_tempList = null;
		
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO)context.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			// �ͻ�����
			LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
			request.setAttribute("clienttypeMap",
					this.getOptionsListByMap(clienttypeMap, null, true));
			// ģ��״̬
			LinkedHashMap tflagMap = cm.getMapFromCache("flag");
			request.setAttribute("tflagMap",
					this.getOptionsListByMap(tflagMap, null, true));
			// ��������
			LinkedHashMap granularityMap = cm
					.getMapFromCache("risk_granularitys");
			request.setAttribute("granularityMap",
					this.getOptionsListByMap(granularityMap, null, true));
			// ģ�����
			LinkedHashMap tcategoryMap = cm
					.getMapFromCache("template_category");
			request.setAttribute("tcategoryMap",
					this.getOptionsListByMap(tcategoryMap, null, true));
			// �Ƿ񸲸�
			LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
			request.setAttribute("coverMap",
					this.getOptionsListByMap(coverMap, null, true));
			// ��������
			// LinkedHashMap data_granularityMap =
			// cm.getMapFromCache("data_granularity");
			// request.setAttribute("data_granularityMap",
			// this.getOptionsListByMap(
			// data_granularityMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			form.setTemplatename(form.getTemplatename_s());

			String temptype = StringUtils.nullObject2String(request
					.getParameter("temptype"));
			request.setAttribute("temptype", temptype);
			// ��ȡ�û���¼��Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();

//			t52_def_temp.setOrgankeystr(auth.getOrganstr());				// ������Ϣ

			String url = request.getContextPath() + "/list"
					+ actionMapping.getPath() + ".do";
																			// ��ҳ
			t52_def_temp = (T52_def_temp) this.getSearchObject(t52_def_temp,
					request, form, "getT52_def_tempListCount", url);
			if (t52_def_temp.getNewsearchflag().equals("1"))
			{
				// ���Ի��Ĳ�ѯ����

				saveSearchObject(t52_def_temp, request);
			} else{				
				MyBeanUtils.copyBean2Bean(form, t52_def_temp);
			}
			t52_def_tempList = t52_def_tempDAO.getT52_def_tempList(sqlMap,
					t52_def_temp, this.getStartRec(t52_def_temp.getIntPage()),
					this.getIntPageSize());
			logger.info(t52_def_tempList);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("t52_def_tempList", t52_def_tempList);
		//
		return actionMapping.findForward("success");
	}

	/**
	 * ģ�����
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
	public ActionForward performAddT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();

		// �ͻ�����
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		// ģ������
		LinkedHashMap temptypeMap = cm.getMapFromCache("temptype");
		request.setAttribute("temptypeMap",
				this.getOptionsListByMap(temptypeMap, null, true));
		// �Ƿ���ʹ��
		LinkedHashMap tagMap = cm.getMapFromCache("yesNo");
		request.setAttribute("tagMap",
				this.getOptionsListByMap(tagMap, null, true));
		// ģ������
		LinkedHashMap granularityMap = cm.getMapFromCache("risk_granularitys");
		request.setAttribute("granularityMap",
				this.getOptionsListByMap(granularityMap, null, true));
		// ģ�����
		LinkedHashMap tcategoryMap = cm.getMapFromCache("template_category");
		request.setAttribute("tcategoryMap",
				this.getOptionsListByMap(tcategoryMap, null, true));
		// �Ƿ񸲸�
		LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
		request.setAttribute("coverMap",
				this.getOptionsListByMap(coverMap, null, true));
		// ��������
		// LinkedHashMap data_granularityMap =
		// cm.getMapFromCache("data_granularity");
		// request.setAttribute("data_granularityMap", this.getOptionsListByMap(
		// data_granularityMap, null, true));

		return actionMapping.findForward("success");
	}

	/**
	 * ���ģ��ȷ��
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
	public ActionForward performAddT52_def_tempDo(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response, boolean flag)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = "PKT_T52" + this.getSequenceNextVal("SEQ_T31_DEF_TEMP");
			form.setTemplatekey(key);
			// ���Ը�ֵ
			PropertyUtils.copyProperties(t52_def_temp, form);
			
			// ����ƥ������
			String card_no_str = form.getCard_no();
			String name = form.getName();
			String country_cd = form.getCountry_cd();
			if(flag)									// ��������ύ
			{				
				Map<String, String> matchconditionMap = new HashMap<String, String>();
				matchconditionMap.put("card_no", card_no_str);
				matchconditionMap.put("name", name);
				matchconditionMap.put("country_cd", country_cd);
				
				JSONObject matchconditionMapJson = JSONObject.fromObject(matchconditionMap);
				t52_def_temp.setMatchcondition(matchconditionMapJson.toString());
				t52_def_temp.setModuletype("1");
			} else 										// ��������ύ
			{
				t52_def_temp.setMatchcondition(null);
				t52_def_temp.setModuletype("0");
			}
			
			t52_def_temp.setTemplatekey(key);
			t52_def_temp.setParty_class_cd(form.getParty_class_cd());
			t52_def_temp.setFlag("0");
			t52_def_temp.setIs_build("0");
			t52_def_temp.setCreate_user(auth.getT00_user().getUsername());
			t52_def_temp.setCreate_org(auth.getT00_user().getOrgankey());
			t52_def_temp.setCreate_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			String str = form.getCalculateseq_str();
			if (str.equals("") || str == null)
				t52_def_temp.setCalculateseq(Integer.valueOf("1").intValue());
			else
				t52_def_temp.setCalculateseq(Integer.parseInt(str));
			sqlMap.endTransaction();
			sqlMap.startTransaction();

			/**** addģ��t52_b_def_temp ******/
			int rows = t52_def_tempDAO.insertT52_b_def_temp(sqlMap, t52_def_temp);
			

			sqlMap.commitTransaction();
			if (rows <= 0)
			{
				throw new Exception("ģ�����ʧ�ܣ�");
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	/**
	 * �޸�������
	 */
	public ActionForward performModifyT52_def_temp_main(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			// ��ȡ������ϸ
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);

			PropertyUtils.copyProperties(form, t52_def_temp);

		} catch (Exception e)
		{
			e.printStackTrace();
			logger.error("�쳣", e);
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * ���������޸�
	 */
	public ActionForward performModifyT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		ArrayList granList = new ArrayList();
		boolean flag = false;
		try
		{
			// �ͻ�����
			LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
			request.setAttribute("clienttypeMap",
					this.getOptionsListByMap(clienttypeMap, null, true));
			// ģ������
			LinkedHashMap temptypeMap = cm.getMapFromCache("temptype");
			request.setAttribute("temptypeMap",
					this.getOptionsListByMap(temptypeMap, null, true));
			// �Ƿ���ʹ��
			LinkedHashMap tagMap = cm.getMapFromCache("yesNo");
			request.setAttribute("tagMap",
					this.getOptionsListByMap(tagMap, null, true));
			// ģ������
			LinkedHashMap granularityMap = cm
					.getMapFromCache("risk_granularitys");
			request.setAttribute("granularityMap",
					this.getOptionsListByMap(granularityMap, null, true));
			// ģ�����
			LinkedHashMap tcategoryMap = cm
					.getMapFromCache("template_category");
			request.setAttribute("tcategoryMap",
					this.getOptionsListByMap(tcategoryMap, null, true));
			// �Ƿ񸲸�
			LinkedHashMap coverMap = cm.getMapFromCache("yesNo");
			request.setAttribute("coverMap",
					this.getOptionsListByMap(coverMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			// ���ò�ѯ����
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);
			if("1".equalsIgnoreCase(t52_def_temp.getModuletype()))		// ����ģ��
			{
				String matchconditionStr = t52_def_temp.getMatchcondition();
				JSONObject mdJson = JSONObject.fromObject(matchconditionStr);
				
				form.setCard_no(StringUtils.null2String(mdJson.getString("card_no")));				
				form.setName(StringUtils.null2String(mdJson.getString("name")));
				form.setCountry_cd(StringUtils.null2String(mdJson.getString("country_cd")));
				flag = true;
			} 
			
			
			PropertyUtils.copyProperties(form, t52_def_temp);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		request.setAttribute("t52_def_tempname", t52_def_temp.getTemplatekey());
		if(flag){
			return actionMapping.findForward("success");			
		} else {
			return actionMapping.findForward("namelist");
		}
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
	public ActionForward performModifyT52_def_tempDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		// �ͻ�����
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			PropertyUtils.copyProperties(t52_def_temp, form);
			String key = form.getTemplatekey();

			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			// ����ƥ������
			String card_no_str = form.getCard_no();
			String name = form.getName();
			String country_cd = form.getCountry_cd();
			Map<String, String> matchconditionMap = new HashMap<String, String>();
			matchconditionMap.put("card_no", card_no_str);
			matchconditionMap.put("name", name);
			matchconditionMap.put("country_cd", country_cd);
			JSONObject matchconditionMapJson = JSONObject.fromObject(matchconditionMap);
			t52_def_temp.setMatchcondition(matchconditionMapJson.toString());
			
			t52_def_tempDAO.modifyT52_def_temp(sqlMap, t52_def_temp);
			
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/** ҳǩ��ģ��ִ�����ȱ�List */
	public ActionForward performGetT52_def_temp_granList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		ArrayList granList = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String key = form.getTemplatekey();
			granList = t52_def_tempDAO.getT52_def_temp_granList(sqlMap, key);
//			// ��ȡ������ϸ
//			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, key);
			
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("granList", granList);
		
			return actionMapping.findForward("success");
	}

	/** ���ģ��ִ������ */
	public ActionForward performAddT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		boolean flag = false;
		
		// �ͻ�����
		LinkedHashMap clienttypeMap = cm.getMapFromCache("temp_clienttype");
		request.setAttribute("clienttypeMap",
				this.getOptionsListByMap(clienttypeMap, null, true));
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			// �������ȣ�SQLִ������
			LinkedHashMap data_granularityMap = cm
					.getMapFromCache("data_granularity");
			request.setAttribute("data_granularityMap",
					this.getOptionsListByMap(data_granularityMap, null, true));

			String templatekey = StringUtils.null2String(request
					.getParameter("templatekey"));
			request.setAttribute("templatekey", templatekey);
			
			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp.getModuletype()))
			{
				flag = true;
			}
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		if(flag){			
			return actionMapping.findForward("success_hs");
		} else {
			return actionMapping.findForward("success_md");
		}
	}

	
	/** ���ģ��ִ�������ύ */
	public ActionForward performAddT52_def_temp_granDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		boolean flag = false;
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;

			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/**** 1. addģ��ִ�����ȱ�T31_DEF_TEMP_GRAN ******/
			String sqlkey = this.getSequenceNextVal("SEQ_T31_DEF_TEMP_SQL");
			t52_def_temp.setSqlkey(sqlkey);
			t52_def_temp.setTemplatekey(form.getTemplatekey());
			t52_def_temp.setDatagranularity(form.getDatagranularity());
			t52_def_temp.setSqlgranularity(form.getSqlgranularity());
			
			int row1 = t52_def_tempDAO.insertT52_b_def_temp_gran(sqlMap, t52_def_temp);
			
			T52_def_temp t52_def_temp2 = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp2.getModuletype()))
			{
				flag = true;
			}

			/**** 2. addģ������sql��T52_B_DEF_TEMP_SQL ******/
			String totalSize = request.getParameter("totalSize");
			int length = Integer.parseInt(totalSize);

			String message = "";
			
			//int row2 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			for (int i = 1; i <= length; i++)
			{
				String gsSql = request.getParameter("selsql" + i);
				if (gsSql != null && !gsSql.equals(""))
				{
					
					// �ؼ�����Ϣ
					if(gsSql.toLowerCase().contains("delete")||gsSql.toLowerCase().contains("insert")||gsSql.toLowerCase().contains("update"))
					{
						message = "��"+i+"��sql  ���ܴ���delete��insert�� update�ؼ���";
					} else if (!sqlHasAs(gsSql))
					{
						message = "��"+i+"��sql ������as������";
					} 
					/*else if(!t52_def_tempDAO.validateSql(sqlMap, gsSql))
					{
						message = "��"+i+"��sql �﷨����ȷ";
					}*/
					
					
					if (!"".equalsIgnoreCase(message)){
						ArrayList sqlList = new ArrayList();
						sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
						request.setAttribute("sqlList", sqlList);
						request.setAttribute("err", message);
						if(flag){
							return actionMapping.findForward("failure_hs");
						} else {
							return actionMapping.findForward("failure_md");
						}
					}
					
					String gsSqlNum = request.getParameter("exeseq" + i);
					logger.info(t52_def_temp.getSqlkey());
					logger.info(t52_def_temp.getTemplatekey());
					t52_def_temp.setSql_str(gsSql.trim());
					t52_def_temp.setCalsql(gsSqlNum);
					t52_def_tempDAO.t52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}
			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	/** �޸�ģ��ִ������ */
	public ActionForward performModT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp_gran = new T52_def_temp();
		ArrayList sqlList = new ArrayList();
		boolean flag = false;
		try
		{
			// �������ȣ�SQLִ������
			LinkedHashMap data_granularityMap = cm
					.getMapFromCache("data_granularity");
			request.setAttribute("data_granularityMap",
					this.getOptionsListByMap(data_granularityMap, null, true));

			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = form.getSqlkeys()[0];

			t52_def_temp_gran = t52_def_tempDAO.getT52_def_temp_granDisp(
					sqlMap, sqlkey);
			sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
			
			T52_def_temp t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp.getModuletype()))
			{
				flag = true;
			}
			
			PropertyUtils.copyProperties(form, t52_def_temp_gran);

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("sqlList", sqlList);
		if(flag)
		{
			return actionMapping.findForward("success_hs");
		} else {			
			return actionMapping.findForward("success_md");
		}
	}

	public ActionForward performModT52_def_temp_granDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		boolean flag = false;
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = form.getSqlkey();

			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/**** 1. modģ��ִ�����ȱ�T52_B_DEF_TEMP_GRAN ******/
			t52_def_temp.setSqlkey(sqlkey);
			t52_def_temp.setTemplatekey(form.getTemplatekey());
			t52_def_temp.setDatagranularity(form.getDatagranularity());
			t52_def_temp.setSqlgranularity(form.getSqlgranularity());
			
			T52_def_temp t52_def_temp2 = t52_def_tempDAO.getT52_def_tempDisp(sqlMap, form.getTemplatekey());
			if ("1".equals(t52_def_temp2.getModuletype()))
			{
				flag = true;
			}
			
			
			// �޸�ģ��ִ�����ȱ�
			int row1 = t52_def_tempDAO.modifyT52_def_temp_gran(sqlMap, t52_def_temp);

			/**** 2. addģ������sql��T52_B_DEF_TEMP_SQL ******/
			String totalSize = request.getParameter("totalSize");
			int length = Integer.parseInt(totalSize);
			
			int row2 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			for(int i=1;i<=length;i++){
				String gsSql=request.getParameter("selsql"+i);
				if(gsSql!=null && !gsSql.equals("")){
				String gsSqlNum=request.getParameter("exeseq"+i);
				
				t52_def_temp.setSql_str(gsSql.trim());
				t52_def_temp.setCalsql(gsSqlNum);
				t52_def_tempDAO.t52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}
			
			/*String message = "";
			for (int i = 1; i <= length; i++)
			{
				String gsSql = request.getParameter("selsql" + i);
				
				
				if (gsSql != null && !gsSql.equals(""))
				{
					// �ؼ�����Ϣ
					if(gsSql.toLowerCase().contains("delete")||gsSql.toLowerCase().contains("insert")||gsSql.toLowerCase().contains("update"))
					{
						message = "��"+i+"��sql  ���ܴ���delete��insert�� update�ؼ���";
					} else if (!sqlHasAs(gsSql))
					{
						message = "��"+i+"��sql ������as������";
					} 
					else if(!t52_def_tempDAO.validateSql(sqlMap, gsSql))
					{
						message = "��"+i+"��sql �﷨����ȷ";
					}
					
					
					if (!"".equalsIgnoreCase(message)){
						ArrayList sqlList = new ArrayList();
						sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);
						request.setAttribute("sqlList", sqlList);
						request.setAttribute("err", message);
						if(flag){
							return actionMapping.findForward("failure_hs");
						} else {
							return actionMapping.findForward("failure_md");
						}
					}
					String gsSqlNum = request.getParameter("exeseq" + i);

					t52_def_temp.setSql_str(gsSql.trim());
					t52_def_temp.setCalsql(gsSqlNum);
					t52_def_tempDAO.updateT52_b_def_temp_sql(sqlMap, t52_def_temp);
				}
			}*/
			
			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			
			saveMessages(request, errors);
			
			return actionMapping.findForward("failure");
			
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}

	
	public ActionForward performDelT52_def_temp_gran(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String[] sqlkey_array = form.getSqlkeys();
			for (int i = 0; i < sqlkey_array.length; i++)
			{
				String sqlkey = sqlkey_array[i];
				int row = t52_def_tempDAO.deleteT52_b_def_temp_gran(sqlMap,
						sqlkey);
				int row1 = t52_def_tempDAO.delT52_b_def_temp_sql(sqlMap, sqlkey);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	
	/** �鿴sql */
	public ActionForward performGetT52_def_temp_sqlList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		ArrayList sqlList = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String sqlkey = StringUtils.null2String(request
					.getParameter("sqlkey"));

			sqlList = t52_def_tempDAO.getT52_def_temp_sqlList(sqlMap, sqlkey);

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}

		request.setAttribute("sqlList", sqlList);
		return actionMapping.findForward("success");
	}

	/**
	 * ɾ��
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
	public ActionForward performDeleteT52_def_tempDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t52_def_tempDAO.deleteT52_def_temp(sqlMap, calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
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
	public ActionForward performGetT31_def_tempDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO) context
				.getBean("t31_def_tempDAO");
		T31_def_temp t31_def_temp = new T31_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(sqlMap,
					calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t31_def_temp", t31_def_temp);
		//
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
	public ActionForward performGetT31_def_tempDisp_gs(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T31_def_tempDAO t31_def_tempDAO = (T31_def_tempDAO) context
				.getBean("t31_def_tempDAO");
		T31_def_temp t31_def_temp = new T31_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String calculateseq = form.getTemplatekey();
			t31_def_temp = t31_def_tempDAO.getT31_def_tempDisp(sqlMap,
					calculateseq);
		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t31_def_temp", t31_def_temp);
		//
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
	public ActionForward performChangeT52_def_tempFlag(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
			String flag = request.getParameter("flag");
			String[] key_array = form.getTemplatekeys();

			for (int i = 0; i < key_array.length; i++)
			{
				t52_def_temp.setFlag(flag);
				t52_def_temp.setTemplatekey(key_array[i]);
				t52_def_tempDAO.modifyT52_def_temp_flag(sqlMap, t52_def_temp);
			}

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}

	/**
	 * ����ģ��
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
	public ActionForward performCopyT52_def_temp(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response)
	{
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth = authBean.getAuthToken();

		T52_def_tempDAO t52_def_tempDAO = (T52_def_tempDAO) context
				.getBean("t52_def_tempDAO");
		T52_def_temp t52_def_temp = new T52_def_temp();

		ArrayList list = new ArrayList();
		ArrayList list1 = new ArrayList();
		try
		{
			T52_def_tempActionForm form = (T52_def_tempActionForm) actionForm;
//			String temptype = form.getTemptype();
			String templatekey = form.getTemplatekeys()[0];

			String templatekey1 = "PKT"
					+ this.getSequenceNextVal("SEQ_T31_DEF_TEMP");
			sqlMap.endTransaction();
			sqlMap.startTransaction();
			/***** ����T31_DEF_TEMP��¼ ****/
			t52_def_temp = t52_def_tempDAO.getT52_def_tempDisp(sqlMap,
					templatekey);
			t52_def_temp.setCreate_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setCreate_user(auth.getT00_user().getUsername());
			t52_def_temp.setCreate_org(auth.getT00_user().getOrgankey());
			t52_def_temp.setModify_dt(DateUtils.dateToStringShort(DateUtils
					.getCurrDateTime()));
			t52_def_temp.setModify_user(auth.getT00_user().getUsername());
			t52_def_temp.setTemplatekey(templatekey1);
			t52_def_temp.setTemplatename(t52_def_temp.getTemplatename()
					+ "(����)");
			t52_def_temp.setTag("0");
			int row1 = t52_def_tempDAO.insertT52_b_def_temp(sqlMap, t52_def_temp);

			/***** ����T52_B_DEF_TEMP_GRAN��¼ ****/
			T52_def_temp temp1 = new T52_def_temp();
			temp1.setTemplatekey(templatekey1);
			temp1.setTemplatekey_temp(templatekey);

			int row2 = t52_def_tempDAO.copyT52_b_def_temp_gran(sqlMap, temp1);

			/***** ����T31_B_DEF_TEMP_SQL��¼ ****/
			T52_def_temp temp = new T52_def_temp();
			temp.setTemplatekey(templatekey1);
			temp.setTemplatekey_temp(templatekey);
			int row3 = t52_def_tempDAO.copyT52_b_def_temp_sql(sqlMap, temp);


			sqlMap.commitTransaction();

		} catch (Exception e)
		{
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		} finally
		{
			try
			{
				sqlMap.endTransaction();
			} catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		return actionMapping.findForward("success");
	}
	
	/** У��sql�Ƿ����as�ؼ��� */
	private boolean sqlHasAs(String sql)
	{
		sql = sql.toLowerCase();
		
		try {
			
			String rowStr = sql.substring(sql.indexOf("select")+6, sql.indexOf("from"));
			String icols = "";
			String[] colsArr = rowStr.split(",");
			for (String colsStr : colsArr)
			{
				String [] colArr = colsStr.split("as");
				
				for (int i=0;i<colArr.length; i++)
				{
					if(i%2!=0)
					{
						
						icols+=colArr[i]+",";
					}
				}
			}
		} catch(Exception e)
		{
			return false;			
		}
		return true;
	}
	
}
