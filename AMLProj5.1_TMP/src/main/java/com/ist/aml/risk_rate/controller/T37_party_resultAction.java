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

package com.ist.aml.risk_rate.controller;

/**
 * <p>T37_party_resultActoin.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.struts.action.*;
import org.apache.struts.upload.FormFile;

import javax.servlet.http.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.sql.SQLException;
import java.util.*;

import org.apache.commons.beanutils.PropertyUtils;

import com.ist.aml.newrisk.dto.T31_def_element;
import com.ist.aml.risk_rate.dao.*;
import com.ist.aml.risk_rate.dto.*;
import com.ist.aml.report.dao.T10_check_custDAO;

import com.ist.aml.report.dto.T10_survey_cust;
import com.ist.common.*;
import com.ist.common.base.*;
import com.ist.common.properties.XMLProperties;
import com.ist.impfile.aml.report.dto.Report_SearchObj;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;
import com.ist.util.ZipUtils;

public class T37_party_resultAction extends BaseAction {

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
		// �¿���������飬��������
		if ("getT37_party_resultList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_resultList(mapping, form, request,
					response);
		}
		// ��ˡ�������ѯ����������ٵ���
		else if ("getT37_party_result_checkList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_result_checkList(mapping, form, request,
					response);
		}
		// ������¼�б�
		else if ("getT37_level_auditList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_level_auditList(mapping, form, request,
					response);
		}
		// Э����Ϣ�б�
		else if ("getT37_helpcheckList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_helpcheckList(mapping, form, request,
					response);
		}
		//����������
		else if ("t37_party_resultMain".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_resultMain(mapping, form, request,
					response);
		}
		//�ͻ���ͼ������
		else if ("t37_party_viewMain".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_viewMain(mapping, form, request,
					response);
		}
		//���ֵ���
		else if ("t37_party_jf_result".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_jf_result(mapping, form, request,
					response);
		}
		//��ʽ����
		else if ("t37_party_gs_result".equalsIgnoreCase(myaction)) {
			myforward = performT37_party_gs_result(mapping, form, request,
					response);
		}
		
		// ����ҳ������б�
		if ("getT37_appr_bas_rsltList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_appr_bas_rsltList(mapping, form, request,
					response);
		}
		
		//��ʽ��������
		else if ("modifyT37_party_gs_result".equalsIgnoreCase(myaction)) {
			myforward = performModifyT37_party_gs_result(mapping, form, request,
					response);
		}
		
		
		//�״�ͼ����鿴
		else if ("getT37_appr_elem_rslt_dispList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_appr_elem_rslt_dispList(mapping, form, request,
					response);
		}
		//�״�ͼ���չʾ�²���Ϣ
		else if ("getT37_appr_elem_rslt_dispList2".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_appr_elem_rslt_dispList2(mapping, form, request,
					response);
		}
		//��������
		else if ("modifyT37_party_resultDo".equalsIgnoreCase(myaction)) {
			myforward = performModifyT37_party_resultDo(mapping, form, request,
					response);
		}
		//�ͻ�ʶ����ϸ��Ϣ
		else if ("getT10_checkparty_main".equalsIgnoreCase(myaction)) {
			myforward = performGetT10_checkparty_main(mapping, form, request,
					response);
		}
		//��ǰ������Ϣ
		else if ("getCurrentT37_party_result".equalsIgnoreCase(myaction)) {
			myforward = performGetCurrentT37_party_result(mapping, form, request,
					response);
		}
		//��ǰ��ʽ������Ϣ
		else if ("getT37_party_gs_resultDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_gs_resultDisp(mapping, form, request,
					response);
		}
		//��ǰ����������Ϣ
		else if ("getT37_party_jf_resultDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_jf_resultDisp(mapping, form, request,
					response);
		}
		// ���������ͻ���ͼ������������Ϣ
		else if ("getT37_party_gsjf_resultDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_gsjf_resultDisp(mapping, form, request,
					response);
		}
		//���¼���
		else if ("recountT37_party_result".equalsIgnoreCase(myaction)) {
			myforward = performRecountT37_party_result(mapping, form, request,
					response);
		}
		//��������
		else if ("flow_workbench_oper".equalsIgnoreCase(myaction)) {
			myforward = performAddT37_operDo(mapping, form, request, response);
		}
		//��������
		else if ("flow_batch_oper".equalsIgnoreCase(myaction)) {
			myforward = performBatchT37_operDo(mapping, form, request, response);
		}
		//��������ٵ���&�����������:��ѯ���
		else if ("getT37_party_resultList1".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_party_resultList1(mapping, form, request,
					response);
		}
		//�������������������Batch
		else if ("getT31_party_result_BExcel".equalsIgnoreCase(myaction)) {
			myforward = performGetT31_party_result_BExcel(mapping, form, request,
					response);
		}
		//����������浥������Single
		else if ("getT31_party_result_SExcel".equalsIgnoreCase(myaction)) {
			myforward = performGetT31_party_result_SExcel(mapping, form, request,
					response);
		}
		//�˻�ҳ��
		else if ("returnT37_party_result".equalsIgnoreCase(myaction)) {
			myforward = performReturnT37_party_result(mapping, form, request,
					response);
		}
		//�˻ض���
		else if ("returnT37_party_resultDo".equalsIgnoreCase(myaction)) {
			myforward = performReturnT37_party_resultDo(mapping, form, request,
					response);
		}
		//���ݵ÷ֶ�̬�����ȼ�
		else if ("changeLevelByLastscore".equalsIgnoreCase(myaction)) {
			myforward = performChangeLevelByLastscore(mapping, form, request,
					response);
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
	public ActionForward performGetT37_party_resultList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_resultList = null;
		ArrayList operlist = new ArrayList();
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//ȡ�ĵ�ǰ�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			
			/**rate_status_cdMap��ʾ����**/
			String post_id = form.getPost_id();
			String tempcategory = form.getTempcategory();
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			LinkedHashMap temp_map = new LinkedHashMap();
			//1.�¿��ʹ����ı༭��:�¿����������״̬�ܺ���⣬��������Ҫȥ�ж�"707"
			//��������ߵ������̣�������ı༭���ܿ��������˻صĿͻ���ͬʱҲ�Ϳ���������˻صĿͻ�
			//����������ߵ������̣���ͬ�¿�һ��
			if(post_id.equals("P2001"))
			{
				if(tempcategory.equals("1"))
				{
					temp_map.put("1", "ϵͳ����");
					temp_map.put("4", "����˻�");
				}
				else
				{
					if(t87_sysparaMap.get("707").equals("0"))
					{
						temp_map.put("1", "ϵͳ����");
						temp_map.put("4", "����˻�");
					}
					else
					{
						temp_map.put("1", "ϵͳ����");
						temp_map.put("7", "���������˻�");
					}
				}
				
			}
			
			//2.�����ĵ����
			if(post_id.equals("P2004"))
			{
				temp_map.put("9", "����������");
				temp_map.put("4", "����˻�");
			}
			
			request.setAttribute("rate_status_cdMap", this.getOptionsListByMap(temp_map, null, true));
			LinkedHashMap hcheck_statusMap = cm.getMapFromCache("helpcheckstatus");//Э��״̬
			request.setAttribute("hcheck_statusMap", this.getOptionsListByMap(hcheck_statusMap, null, true));
			LinkedHashMap resultsortMap = cm.getMapFromCache("risk_ratesort");//����
			request.setAttribute("resultsortMap", this.getOptionsListByMap(resultsortMap, null, true));
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("riskLevelMap", this.getOptionsListByMap(levelMap, null, true));
			
			request.setAttribute("is_showSurvey", t87_sysparaMap.get(Constans.IS_SHOW_SURVEY)); //�����Ƿ����б���ʾ
			request.setAttribute("is_flowSurvey", t87_sysparaMap.get(Constans.IS_FLOW_SURVEY)); //�����Ƿ�������
			request.setAttribute("is_showCheck", t87_sysparaMap.get(Constans.IS_SHOW_CHECK));   //Э���Ƿ����б���ʾ
			request.setAttribute("is_flowCheck", t87_sysparaMap.get(Constans.IS_FLOW_CHECK));   //Э���Ƿ�������
			if ("0".equals(newsearchflag)) {
				if(form.getOrgankey().equals("")){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t37_party_result_rateSearchObj");
			}
			else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				String statistic_dt_disp=form.getStatistic_dt_disp();
				String statistic_dt_disp_end=form.getStatistic_dt_disp_end();
				if (statistic_dt_disp != null && !"".equals(statistic_dt_disp)) {
					t37_party_result.setStatistic_dt(DateUtils
							.stringToDateShort(statistic_dt_disp));
				}
				if (statistic_dt_disp_end != null
						&& !"".equals(statistic_dt_disp_end)) {
					t37_party_result.setStatistic_dt_end(DateUtils
							.stringToDateShort(statistic_dt_disp_end));
				}
				
				if(t37_party_result.getTempcategory()!=null&&!"".equals(t37_party_result.getTempcategory())){
					t37_party_result.setTempcategory_c(surroundSymbol(t37_party_result.getTempcategory(),",","'"));
				}
				session.setAttribute("t37_party_result_rateSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_party_result_rateSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
			LinkedHashMap node_postMap = cm.getMapFromCache("t31_node_postid"); // ��λ��Ϣ
			String node_id = (String)node_postMap.get(t37_party_result.getPost_id());
			t37_party_result.setNode_id(node_id);
			operlist = t37_party_resultDAO.getT31_n_moveopRiskList(sqlMap, node_id);
			if (!"0".equals(newsearchflag) ) {
				t37_party_resultList = t37_party_resultDAO
						.getT37_party_resultList(sqlMap, t37_party_result, this
								.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO
						.getT37_party_resultListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/risk_rate"
						+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("workbench_operlist", operlist);// ������ť��Ϣ
		request.setAttribute("t37_party_resultList", t37_party_resultList);
		request.setAttribute("pageInfo", pageInfo);
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
	public ActionForward performGetT37_party_result_checkList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_resultList = null;
		ArrayList operlist = new ArrayList();
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//ȡ�ĵ�ǰ�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			
			/**rate_status_cdMap��ʾ����**/
			String post_id = form.getPost_id();
			LinkedHashMap temp_map = new LinkedHashMap();
			
			//1.��˸�
			if(post_id.equals("P2002"))
			{
				temp_map.put("2", "�����");
				temp_map.put("5", "�����˻�");
			}
			//2.������
			if(post_id.equals("P2003"))
			{
				temp_map.put("3", "������");
			}
			//3.�ٵ���
			if(form.getRate_source().equals("2"))
			{
				temp_map.put("1", "ϵͳ����");
				temp_map.put("4", "����˻�");
			}
			
			
			
			request.setAttribute("rate_status_cdMap", this.getOptionsListByMap(temp_map, null, true));
			
			
			
			LinkedHashMap hcheck_statusMap = cm.getMapFromCache("helpcheckstatus");//Э��״̬
			request.setAttribute("hcheck_statusMap", this.getOptionsListByMap(hcheck_statusMap, null, true));
			LinkedHashMap resultsortMap = cm.getMapFromCache("risk_ratesort");//����
			request.setAttribute("resultsortMap", this.getOptionsListByMap(resultsortMap, null, true));
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("riskLevelMap", this.getOptionsListByMap(levelMap, null, true));
			LinkedHashMap opera_statusMap = cm.getMapFromCache("opera_status"); // ��ˡ�����״̬
			request.setAttribute("opera_statusMap", this.getOptionsListByMap(opera_statusMap, null, false));
			LinkedHashMap rate_sourceMap = cm.getMapFromCache("rate_source"); // ��Դ
			request.setAttribute("rate_sourceMap", this.getOptionsListByMap(rate_sourceMap, null, true));
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			request.setAttribute("is_showCheck", t87_sysparaMap.get(Constans.IS_SHOW_CHECK));   //Э���Ƿ����б���ʾ

			if ("0".equals(newsearchflag)) {
//				if(form.getOrgankey().equals("")){
//					form.setOrgankey(auth.getT00_user().getOrgankey());
//				}
				session.removeAttribute("t37_party_result_checkRateSearchObj");
			}
			else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				String statistic_dt_disp=form.getStatistic_dt_disp();
				String statistic_dt_disp_end=form.getStatistic_dt_disp_end();
				String modifydate_disp = form.getModifydate_disp();
				String modifydate_disp_end = form.getModifydate_disp_end();
				String create_dt_disp = form.getCreate_dt_disp();
				String create_dt_disp_end = form.getCreate_dt_disp_end();
				if (statistic_dt_disp != null && !"".equals(statistic_dt_disp)) {
					t37_party_result.setStatistic_dt(DateUtils
							.stringToDateShort(statistic_dt_disp));
				}
				if (statistic_dt_disp_end != null
						&& !"".equals(statistic_dt_disp_end)) {
					t37_party_result.setStatistic_dt_end(DateUtils
							.stringToDateShort(statistic_dt_disp_end));
				}
				if(modifydate_disp !=null && !"".equals(modifydate_disp)){
					t37_party_result.setModifydate(DateUtils
							.stringToSqlDateShort(modifydate_disp));
				}
				if(modifydate_disp_end != null && !"".equals(modifydate_disp_end)){
					t37_party_result.setModifydate_end(DateUtils
							.stringToDateShort(modifydate_disp_end));
				}
				if(create_dt_disp != null && !"".equals(create_dt_disp)){
					t37_party_result.setCreate_dt(DateUtils
							.stringToDateShort(create_dt_disp));
				}
				if(create_dt_disp_end != null && !"".equals(create_dt_disp_end)){
					t37_party_result.setCreate_dt_end(DateUtils
							.stringToDateShort(create_dt_disp_end));
				}
				if(t37_party_result.getTempcategory()!=null&&!"".equals(t37_party_result.getTempcategory())){
					t37_party_result.setTempcategory_c(surroundSymbol(t37_party_result.getTempcategory(),",","'"));
				}
				session.setAttribute("t37_party_result_checkRateSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_party_result_checkRateSearchObj");
		
			}
			LinkedHashMap node_postMap = cm.getMapFromCache("t31_node_postid"); // ��λ��Ϣ
			String node_id = (String)node_postMap.get(t37_party_result.getPost_id());
			t37_party_result.setNode_id(node_id);
			operlist = t37_party_resultDAO.getT31_n_moveopRiskList(sqlMap, node_id);
			if (!"0".equals(newsearchflag) ) {
				t37_party_resultList = t37_party_resultDAO
						.getT37_party_result_checkList(sqlMap, t37_party_result, this
								.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO
						.getT37_party_result_checkListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/risk_rate"
						+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
				//���������ɺ�������Ĭ�ϻ�����
				form.setOrgankey("");
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("workbench_operlist", operlist);// ������ť��Ϣ
		request.setAttribute("t37_party_resultList", t37_party_resultList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	/**
	 * ������¼
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT37_level_auditList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request.getParameter("intPage"), 0);
			
		    if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				session.setAttribute("t37_level_auditRateSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_level_auditRateSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
		    String table_name="T37_LEVEL_AUDIT"; //ϵͳ��
		    if(form.getRate_source().equals("2")){ //�ٵ�����
		    	table_name="T37_LEVEL_AUDIT_RE";
		    }
		    if(form.getRate_source().equals("uh")){ //��ʷ��
		    	table_name="T37_LEVEL_AUDIT_UH";
		    }
		    if(form.getRate_source().equals("curr")){ //��ǰ��
		    	table_name="T37_LEVEL_AUDIT_CURR";
		    }
			t37_party_result.setTable_name(table_name);
		    t37_level_auditList = t37_party_resultDAO
					.getT37_level_auditList(sqlMap, t37_party_result, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t37_party_resultDAO
					.getT37_level_auditListCount(sqlMap, t37_party_result);
			String url = request.getContextPath() + "/risk_rate"
					+ actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form, t37_party_result);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_level_auditList", t37_level_auditList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	/**
	 * Э����Ϣ�б�
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performGetT37_helpcheckList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		String pageInfo="";
		T37_help_checkDAO t37_help_checkDAO = (T37_help_checkDAO) context.getBean("t37_help_checkDAO");
		T37_help_check t37_help_check = new T37_help_check();
		ArrayList  t37_help_checkList = new ArrayList();
		try {
			T37_help_checkActionForm form = (T37_help_checkActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			
		    if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_help_check, form);
				session.setAttribute("t37_help_checkRateSearchObj",t37_help_check);
				
			}else{
				t37_help_check=(T37_help_check)session.getAttribute("t37_help_checkRateSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_help_check);
			}
		    t37_help_checkList = t37_help_checkDAO
					.getT37_help_check_dispList(sqlMap, t37_help_check, this
							.getStartRec(intPage), this.getIntPageSize());
			int totalRow = t37_help_checkDAO.getT37_help_check_dispListCount(sqlMap, t37_help_check);
			String url = request.getContextPath() + "/risk_rate"
					+ actionMapping.getPath() + ".do";
			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
			MyBeanUtils.copyBean2Bean(form, t37_help_check);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_help_checkList", t37_help_checkList);
		request.setAttribute("pageInfo", pageInfo);
		return actionMapping.findForward("success");
	}
	 /**
     * ���Ż���
     * ������string=a,b,c regex=��symbol=��  ������ʽΪ'a','b','c'
     * @param string  Ҫ�������ַ���
     * @param regex   �ָ���
     * @param symbol  ��Ҫ���Ƶķ���
     * @return
     */
    public static String surroundSymbol(String string ,String regex,String symbol){
        String[] array = string.split(regex);
        StringBuilder stringBuilder = new StringBuilder();
        for(String s:array){
            stringBuilder.append(symbol).append(s).append(symbol).append(regex);
        }
        if(stringBuilder.indexOf(",")!=-1)
            stringBuilder.deleteCharAt(stringBuilder.length()-1);
        return stringBuilder.toString();
    }
	public ActionForward performGetT37_appr_bas_rsltList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
        ArrayList t37_appr_bas_rsltList=new ArrayList();
        ArrayList t37_appr_elem_rsltList1=new ArrayList();
        T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
        T37_party_result t37_party_result = new T37_party_result();
        T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
        Integer maxTreeLaye;
        Map<String,List<T37_appr_bas_rslt>> map=new LinkedHashMap<String,List<T37_appr_bas_rslt>>();
        try {
        	String backurl=StringUtils.null2String(request.getParameter("backurl"));
        	String tempcategory=StringUtils.null2String(request.getParameter("tempcategory"));
			request.setAttribute("backurl", backurl+"&tempcategory="+tempcategory);
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
			t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
			t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
			if(t37_party_result.getStatistic_dt_disp()!=null && !"".equals(t37_party_result.getStatistic_dt_disp())){
				t37_appr_bas_rslt.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
			}
			String result_table="T37_PARTY_RESULT"; //���������
			String appr_table="T37_APPR_BAS_RSLT";  //Ҫ���ֵ��
			if(t37_party_result.getRate_source().equals("2")){ //�ٵ�����ر�
				result_table="T37_PRESULT_AUDIT";
				appr_table="T37_APPR_BAS_RSLT_AUDIT";
			}
			t37_party_result.setTable_name(result_table);
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			t37_party_result.setRate_source(form.getRate_source());
			MyBeanUtils.copyBean2Bean(form,t37_party_result);
			
			maxTreeLaye=t37_party_resultDAO.getMaxTreeLaye(sqlMap, t37_appr_bas_rslt);
			
			if(t37_party_result.getScoremodi_flag()!=null&&t37_party_result.getScoremodi_flag().equals("1")){
				appr_table="T37_APPR_BAS_RSLT_MODI";
			}
			t37_appr_bas_rslt.setTable_name(appr_table);
			//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
			t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
			//�ͻ������б�
			t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(sqlMap, t37_appr_bas_rslt);
			
			
			
			for(int i=0;i<t37_appr_elem_rsltList1.size();i++){
				T37_appr_bas_rslt t37_appr_elem=(T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
				String upElementkey=t37_appr_elem.getUpelementkey();
				
				if(map.get(upElementkey)==null){
					List list=new ArrayList();
					list.add(t37_appr_elem);
					map.put(upElementkey, list);
				}else{
					List list=(ArrayList)map.get(upElementkey);
					
					list.add(t37_appr_elem);
					map.put(upElementkey, list);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");

		}
		
		request.setAttribute("map", map);
		request.setAttribute("maxTreeLaye", maxTreeLaye);
		request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT10_checkparty_main(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_result t37_party_result = new T37_party_result();
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		String dispatcher=StringUtils.null2String(request.getParameter("dispatcher"));
		request.setAttribute("backurl", backurl);
		request.setAttribute("url", backurl);
		String  forward="";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
             String rate_source=request.getParameter("rate_source");
             request.setAttribute("rate_source", rate_source);
			String party_id=form.getParty_id();
			String viewRegulUrl="t37_party_gs_result_rateDisp";
			String currviewRegulUrl="t37_party_gs_result_rateDisp";
			if(form.getTemptype().equals("1")){
				viewRegulUrl="t37_party_jf_result_rateDisp";
			}
		
			if(dispatcher.equals("_view")){
				/**T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
				request.setAttribute("party_id", party_id);
				t37_party_result.setTable_name("T37_PARTY_RESULT_CURR");
				t37_party_result.setParty_id(form.getParty_id());
				t37_party_result=t37_party_resultDAO.getT37_party_resultDisp1(sqlMap, t37_party_result);
				if(t37_party_result!=null){
					form.setCurrresulekey(t37_party_result.getResulekey());
					form.setOrgankey(t37_party_result.getOrgankey());
					form.setCurrtemplatekey(t37_party_result.getCurrtemplatekey());
					if(t37_party_result.getTemptype().equals("1")){
						currviewRegulUrl="t37_party_jf_result_rateDisp";
					}
				}**/
				forward="success1";
			}else{
				/**  ����ģ�����Ͳ����ͻ�ʶ���*/
				if(form.getTempcategory().equals("1")){
					form.setCheck_type("1");
				}
				else{
					form.setCheck_type("5");
				}
				
				forward="success0";
				if(form.getTempcategory().equals("2")){
					forward="success";
				}
			}
			request.setAttribute("party_id", party_id);
			request.setAttribute("resulekey", form.getResulekey());
			request.setAttribute("currresulekey", form.getCurrresulekey());
			request.setAttribute("viewRegulUrl", viewRegulUrl);
			request.setAttribute("currviewRegulUrl",currviewRegulUrl);
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward(forward);
	}
	public ActionForward performRecountT37_party_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_result t37_party_result = new T37_party_result();
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
		.getBean("t37_party_result_rateDAO");
		request.setAttribute("backurl", backurl);
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			String[] elementkeys=request.getParameterValues("elementkey");
			String[] scores=request.getParameterValues("score");
			StringBuilder builder=new StringBuilder();
			sqlMap.startTransaction();
			String appr_table="T37_APPR_BAS_RSLT";  //�ͻ�Ҫ���ֵ��
			String result_table="T37_PARTY_RESULT";  //�������ֵ��
			if(form.getRate_source().equals("2")){   //�ٵ�����ر�
				appr_table="T37_APPR_BAS_RSLT_AUDIT";
				result_table="T37_PRESULT_AUDIT";
			}
			if(form.getScoremodi_flag().equals("0")){
				T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
				t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
				t37_appr_bas_rslt.setParty_id(t37_party_result.getParty_id());
				t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
				t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
				t37_appr_bas_rslt.setStatistic_dt(DateUtils.stringToDate(form.getStatistic_dt_disp()));
				t37_appr_bas_rslt.setGranularity(t37_party_result.getGranularity());
				t37_appr_bas_rslt.setTable_name(appr_table);
				t37_party_resultDAO.insertT37_appr_bas_rslt_modi(sqlMap, t37_appr_bas_rslt);
			}
			builder.append("UPDATE T37_APPR_BAS_RSLT_MODI t SET t.SCORE=CASE t.ELEMENTKEY");
			if(elementkeys.length>0){
				for(int i=0;i<elementkeys.length;i++){
					builder.append(" WHEN ");
					builder.append("'");
					builder.append(elementkeys[i]);
					builder.append("'");
					builder.append(" THEN ");
					builder.append("'");
					builder.append(scores[i]);
					builder.append("'");
				}
			}	
			builder.append(" END WHERE t.RESULEKEY='"+t37_party_result.getResulekey()+"'");
			if(t37_party_result.getOrgankey()!=null && !"".equals(t37_party_result.getOrgankey())){
				builder.append(" AND t.ORGANKEY='"+t37_party_result.getOrgankey()+"'");
			}
			t37_party_resultDAO.modifyT37_appr_bas_rslt(sqlMap, builder.toString());    //���¿ͻ�Ҫ���ָ��

			List<T37_appr_bas_rslt> reCalList= t37_party_resultDAO.getReCalList(sqlMap,t37_party_result);
			String root="";
			String js_type="";
			for(int i=0;i<reCalList.size();i++){
				T37_appr_bas_rslt t37_appr_bas=reCalList.get(i);
				if(t37_appr_bas.getUpelementkey().equals("-1")){
					 root=t37_appr_bas.getElementkey();
					 js_type=t37_appr_bas.getJs_type();
				}
			}
			double lastscore=this.reCal(root,js_type,reCalList)*20;
			
			t37_party_result.setLastscore(lastscore+"");
			t37_party_result.setScoremodi_flag("1"); //��ֵ�Ƿ����
			t37_party_result.setTable_name(result_table);
			t37_party_resultDAO.modifyT37_party_resultLastScore(sqlMap, t37_party_result);
			sqlMap.commitTransaction();
			
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}finally{
			try {
				sqlMap.endTransaction();
			} catch (SQLException e) {
				e.printStackTrace();
			}
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
	public ActionForward performModifyT37_party_gs_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		String forward="";
		try {
			String backurl=StringUtils.null2String(request.getParameter("backurl"));
			request.setAttribute("backurl", backurl);
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("levelMap", this.getOptionsListByMap(levelMap,null, false));
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			if(t37_party_result.getTemptype().equals("1")){
				forward="main";
			}
			else if(t37_party_result.getTemptype().equals("2")){
				t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
				t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
				
				//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
				PropertyUtils.copyProperties(form, t37_party_result);
				request.setAttribute("curr_post",t37_party_result.getCurr_post());
				
				forward="success";
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("resulekey", t37_party_result.getResulekey());
		//request.setAttribute("t37_level_auditList",t37_level_auditList);
		return actionMapping.findForward(forward);
	}
	/**
	 * ��������
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performT37_party_resultMain(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		String forward="";
		try {
			String backurl=StringUtils.null2String(request.getParameter("backurl"));
			request.setAttribute("backurl", backurl);
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("levelMap", this.getOptionsListByMap(levelMap,null, false));
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String regulUrl="t37_party_gs_result";
			if(form.getTemptype().equals("1")){
				regulUrl="t37_party_jf_result";
			}
			request.setAttribute("resulekey", form.getResulekey());
			request.setAttribute("party_id", form.getParty_id());
			request.setAttribute("regulUrl", regulUrl);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		
		return actionMapping.findForward("success");
	}
	public ActionForward performT37_party_viewMain(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_result t37_party_result = new T37_party_result();
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		request.setAttribute("backurl", backurl);
		String check_type = StringUtils.null2String(request.getParameter("check_type"));
		request.setAttribute("check_type", check_type);
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
			.getBean("t37_party_result_rateDAO");
			String party_id=form.getParty_id();
			String resulekey=form.getResulekey();
			String viewRegulUrl="t37_party_gs_result_rateDisp";
		if(resulekey!=null && !resulekey.equals("")){
			String temptype=form.getTemptype();
			if(temptype!=null && temptype.equals("1")){
				viewRegulUrl="t37_party_jf_result_rateDisp";
			}
		}else{
			
			t37_party_result.setTable_name("T37_PARTY_RESULT_CURR");
			t37_party_result.setParty_id(form.getParty_id());
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp1(sqlMap, t37_party_result);
			if(t37_party_result!=null){
				form.setResulekey(t37_party_result.getResulekey());
				form.setOrgankey(t37_party_result.getOrgankey());
				form.setTemplatekey(t37_party_result.getTemplatekey());
				if(t37_party_result.getTemptype().equals("1")){
				viewRegulUrl="t37_party_jf_result_rateDisp";
				}
			}
		}
			request.setAttribute("party_id", party_id);
			request.setAttribute("viewRegulUrl", viewRegulUrl); //���ֻ�ʽ��ת·��
		}  catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	public ActionForward performGetCurrentT37_party_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_resultDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			PropertyUtils.copyProperties(form, t37_party_result);

			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("resulekey", t37_party_result.getResulekey());
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT37_party_gs_resultDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		ArrayList  t37_gs_indicValList = new ArrayList();
		
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
		    if(t37_party_result.getStatistic_dt_disp()!=null && !"".equals(t37_party_result.getStatistic_dt_disp())){
		    	t37_party_result.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
		    }
			t37_gs_indicValList=t37_party_resultDAO.getT37_gs_indicValList(sqlMap, t37_party_result);
			//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);

			
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_gs_indicValList",t37_gs_indicValList);
		//request.setAttribute("t37_level_auditList",t37_level_auditList);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT37_party_jf_resultDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		ArrayList t37_appr_bas_rsltList=new ArrayList();
        ArrayList t37_appr_elem_rsltList1=new ArrayList();
		T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
		Integer maxTreeLaye;
		Map<String,List<T37_appr_bas_rslt>> map=new LinkedHashMap<String,List<T37_appr_bas_rslt>>();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			
			    t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
			    t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
			    t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
			    t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
			    maxTreeLaye=t37_party_resultDAO.getMaxTreeLaye(sqlMap, t37_appr_bas_rslt);
				t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
				t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(sqlMap, t37_appr_bas_rslt);
				//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
				MyBeanUtils.copyBean2Bean(form,t37_party_result);
				
				for(int i=0;i<t37_appr_elem_rsltList1.size();i++){
					T37_appr_bas_rslt t37_appr_elem=(T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
					String upElementkey=t37_appr_elem.getUpelementkey();
					
					if(map.get(upElementkey)==null){
						List list=new ArrayList();
						list.add(t37_appr_elem);
						map.put(upElementkey, list);
					}else{
						
						List list=(ArrayList)map.get(upElementkey);
						
						list.add(t37_appr_elem);
						map.put(upElementkey, list);
					}
				}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("map", map);
		request.setAttribute("maxTreeLaye", maxTreeLaye);
		request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
		//request.setAttribute("t37_level_auditList", t37_level_auditList);
		return actionMapping.findForward("success");
	}
	
	public ActionForward performGetT37_party_gsjf_resultDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		ArrayList  t37_level_auditList = new ArrayList();
		ArrayList t37_appr_bas_rsltList=new ArrayList();
        ArrayList t37_appr_elem_rsltList1=new ArrayList();
		T37_appr_bas_rslt t37_appr_bas_rslt=new T37_appr_bas_rslt();
		Integer maxTreeLaye;
		String forward="success";
		Map<String,List<T37_appr_bas_rslt>> map=new LinkedHashMap<String,List<T37_appr_bas_rslt>>();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			    if(form.getResulekey()!=null && !"".equals(form.getResulekey())){
			    	 if(t37_party_result.getTemptype().equals("1")){
			    		 
			    		    t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
						    t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
						    t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
						    t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
						    maxTreeLaye=t37_party_resultDAO.getMaxTreeLaye(sqlMap, t37_appr_bas_rslt);
							t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
							t37_appr_elem_rsltList1 = t37_party_resultDAO.getT37_appr_elem_rsltList1(sqlMap, t37_appr_bas_rslt);
							//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
							
							for(int i=0;i<t37_appr_elem_rsltList1.size();i++){
								T37_appr_bas_rslt t37_appr_elem=(T37_appr_bas_rslt)t37_appr_elem_rsltList1.get(i);
								String upElementkey=t37_appr_elem.getUpelementkey();
								
								if(map.get(upElementkey)==null){
									List list=new ArrayList();
									list.add(t37_appr_elem);
									map.put(upElementkey, list);
								}else{
									
									List list=(ArrayList)map.get(upElementkey);
									
									list.add(t37_appr_elem);
									map.put(upElementkey, list);
								}
							}
							
							request.setAttribute("map", map);
							request.setAttribute("maxTreeLaye", maxTreeLaye);
							request.setAttribute("t37_appr_bas_rsltList", t37_appr_bas_rsltList);
							request.setAttribute("t37_level_auditList", t37_level_auditList);
					    }
					    else if(t37_party_result.getTemptype().equals("2")){
							ArrayList  t37_gs_indicValList = new ArrayList();
							
					    	t37_gs_indicValList=t37_party_resultDAO.getT37_gs_indicValList(sqlMap, t37_party_result);
							//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
							request.setAttribute("t37_gs_indicValList",t37_gs_indicValList);
							request.setAttribute("t37_level_auditList",t37_level_auditList);
							forward="success1";
					    }
			    }else{
			    	errors.add(errors.GLOBAL_ERROR, new ActionError("error.common","�ÿͻ���û���з���������"));
			        saveErrors(request, errors);
			        forward="failure";
			    }
			    MyBeanUtils.copyBean2Bean(form,t37_party_result);
			    
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("resulekey", t37_party_result.getResulekey());
		return actionMapping.findForward(forward);
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
	public ActionForward performModifyT37_party_resultDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth =authBean.getAuthToken();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		request.setAttribute("url",backurl);
		T37_party_result t37_party_result = new T37_party_result();
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		String forward="success";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			String dispatcher=StringUtils.null2String(request.getParameter("dispatcher"));
			ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_level_rateList");
			if(t37_party_result.getResulekey()==null||"".equals(t37_party_result.getResulekey()))
			{
				return actionMapping.findForward("failure");
			}
			String curr_post=form.getCurr_post();
			String node_id=form.getNode_id();
			String oper_id=form.getOper_id();
			String flow_id=form.getFlow_id();
			String levelkey="";
			String emendationlevel=form.getEmendationlevel();
			String fristappralevel=form.getFristappralevel();
			if(t87_sysparaMap.get("705").equals("1")){
				double e=0.0;
				double f=0.0;
				if(t31_risk_levelList != null && t31_risk_levelList.size() > 0){
					for(int i=0;i<t31_risk_levelList.size();i++){
						T31_risk_level t31_risk_level=(T31_risk_level)t31_risk_levelList.get(i);
						if(t31_risk_level.getLevelkey().equals(emendationlevel)){
							 e=t31_risk_level.getLevelmin_d();
						}else if(t31_risk_level.getLevelkey().equals(fristappralevel)){
							 f=t31_risk_level.getLevelmin_d();
						}
					}
				}
				
				//�жϳ���������ȼ��ߵ�
				if(f > e){
					levelkey=fristappralevel;
				}else{
					levelkey=emendationlevel;
				}
			}else{
				levelkey=emendationlevel;
			}
			
			String status="";
			String is_report="";
			String next_post="";
			T31_swith t31_switch_n= new T31_swith();
			t31_switch_n.setOper_id(oper_id);
			t31_switch_n.setOrig_node(node_id);
			t31_switch_n.setFlow_id(flow_id);
			ArrayList t31_switchList=(ArrayList)sqlMap.queryForList("getT31_switchList", t31_switch_n);
			//������ת���ȡ�����Ϣ
			for(int i=0;i<t31_switchList.size();i++){
				T31_swith t31_switch=(T31_swith)t31_switchList.get(i);
				if(node_id.equals(t31_switch.getOrig_node())&&oper_id.equals(t31_switch.getOper_id())&&levelkey.equals(t31_switch.getLevelkey())){
					 status=t31_switch.getStatus();
					 is_report=t31_switch.getIs_report();
					 String next_node=t31_switch.getTarget_node();
					 LinkedHashMap nodeMap=cm.getMapFromCache("t31_nodeid");
					 next_post=StringUtils.null2String((String)nodeMap.get(next_node)) ;
					 break;
				}
			}
			String resulekey=t37_party_result.getResulekey();
			t37_party_result.setCurr_post(next_post);
			t37_party_result.setStatus_cd(status);
		    if(next_post.equals("")){
		    	t37_party_result.setCurr_post("N9999");	
		    	t37_party_result.setLevelkey(levelkey);
		    	t37_party_result.setStatus_cd("8");
		    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
		    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
		    	is_report="1";
		    }
		    if(!emendationlevel.equals(fristappralevel)){
		    	t37_party_result.setModify_cd("1");
		    }
		    t37_party_result.setModifier(authBean.getAuthToken().getT00_user().getUsername());
		    t37_party_result.setModifydate(DateUtils.getCurrDateTime());
		    t37_party_result.setResulekey("'"+resulekey+"'");
		    String table_name="T37_PARTY_RESULT";
		    String levaltable="T37_LEVEL_AUDIT";
			if(t37_party_result.getRate_source().equals("2")){ //�ٵ�����
				table_name="T37_PRESULT_AUDIT";
				levaltable="T37_LEVEL_AUDIT_RE";
			}
			t37_party_result.setTable_name(table_name);
		    //���ݸ�λ�ж��Ƿ����ĳЩ�ֶ�
		    isModify_fields(oper_id,curr_post,t37_party_result,authBean);
		    
		    //�޸����������
		    
		    int row =t37_party_resultDAO.modifyT37_party_resultStatusForReport(sqlMap, t37_party_result);
		    if(row>0){
				T37_level_audit t37_level_audit=new T37_level_audit();
				String audit_no=DateUtils.getDate10to8(DateUtils.getCurrTime())
				+this.getSequenceNextVal("T37_LEVEL_AUDIT_SEQ");
				t37_level_audit.setAudit_no(audit_no);
				t37_level_audit.setRsltkey(resulekey);
				t37_level_audit.setParty_id(t37_party_result.getParty_id());
				t37_level_audit.setOrgankey(t37_party_result.getOrgankey());
				t37_level_audit.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
				t37_level_audit.setLast_upd_dt(DateUtils.getCurrDateTime());
				t37_level_audit.setLast_upd_user(authBean.getAuthToken().getT00_user().getUsername());
				t37_level_audit.setLevel_before_adjust(t37_party_result.getLevel_before_adjust());
				t37_level_audit.setLevel_after_adjust(t37_party_result.getEmendationlevel());
				t37_level_audit.setAdjust_reason(t37_party_result.getReason());
				t37_level_audit.setGranularity(t37_party_result.getGranularity());
				t37_level_audit.setRes_post_id(next_post);
				t37_level_audit.setPost_id(curr_post);
				t37_level_audit.setTablename(levaltable);
				t37_party_resultDAO.insertT37_level_audit(sqlMap, t37_level_audit);   //���������¼
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward(forward);
	}
	
	public ActionForward performReturnT37_party_resultDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		Authorization auth =authBean.getAuthToken();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		String backurl=StringUtils.null2String(request.getParameter("backurl"));
		request.setAttribute("url",backurl);
		T37_party_result t37_party_result = new T37_party_result();
		LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
		String forward="success";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			String dispatcher=StringUtils.null2String(request.getParameter("dispatcher"));
			ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_level_rateList");
			if(t37_party_result.getResulekey()==null||"".equals(t37_party_result.getResulekey()))
			{
				return actionMapping.findForward("failure");
			}
			String curr_post=form.getCurr_post();
			String node_id=form.getNode_id();
			String oper_id=form.getOper_id();
			String flow_id=form.getFlow_id();
			String levelkey="";
			String emendationlevel=form.getEmendationlevel();
			String fristappralevel=form.getFristappralevel();
			if(t87_sysparaMap.get("705").equals("1")){
				double e=0.0;
				double f=0.0;
				if(t31_risk_levelList != null && t31_risk_levelList.size() > 0){
					for(int i=0;i<t31_risk_levelList.size();i++){
						T31_risk_level t31_risk_level=(T31_risk_level)t31_risk_levelList.get(i);
						if(t31_risk_level.getLevelkey().equals(emendationlevel)){
							 e=t31_risk_level.getLevelmin_d();
						}else if(t31_risk_level.getLevelkey().equals(fristappralevel)){
							 f=t31_risk_level.getLevelmin_d();
						}
					}
				}
				
				//�жϳ���������ȼ��ߵ�
				if(f > e){
					levelkey=fristappralevel;
				}else{
					levelkey=emendationlevel;
				}
			}else{
				levelkey=emendationlevel;
			}
			
			String status="";
			String is_report="";
			String next_post="";
			T31_swith t31_switch_n= new T31_swith();
			t31_switch_n.setOper_id(oper_id);
			t31_switch_n.setOrig_node(node_id);
			t31_switch_n.setFlow_id(flow_id);
			ArrayList t31_switchList=(ArrayList)sqlMap.queryForList("getT31_switchList", t31_switch_n);
			//������ת���ȡ�����Ϣ
			for(int i=0;i<t31_switchList.size();i++){
				T31_swith t31_switch=(T31_swith)t31_switchList.get(i);
				if(node_id.equals(t31_switch.getOrig_node())&&oper_id.equals(t31_switch.getOper_id())&&levelkey.equals(t31_switch.getLevelkey())){
					 status=t31_switch.getStatus();
					 String next_node=t31_switch.getTarget_node();
					 LinkedHashMap nodeMap=cm.getMapFromCache("t31_nodeid");
					 next_post=StringUtils.null2String((String)nodeMap.get(next_node)) ;
					 break;
				}
			}
			String resulekey=t37_party_result.getResulekey();
			t37_party_result.setCurr_post(next_post);
			t37_party_result.setStatus_cd(status);
		    if(next_post.equals("")){
		    	t37_party_result.setCurr_post("N9999");
		    	t37_party_result.setStatus_cd("8");
		    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
		    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
		    	is_report="1";
		    }
		  
		    t37_party_result.setResulekey("'"+resulekey+"'");
		    t37_party_result.setReturn_user(authBean.getAuthToken().getT00_user().getUsername());
	    	t37_party_result.setReturn_dt(DateUtils.getCurrDateTime());
		    String table_name="T37_PARTY_RESULT";
		    String levaltable="T37_LEVEL_AUDIT";
			if(t37_party_result.getRate_source().equals("2")){ //�ٵ�����
				table_name="T37_PRESULT_AUDIT";
				levaltable="T37_LEVEL_AUDIT_RE";
			}
			t37_party_result.setTable_name(table_name);
		    //�޸����������
		    int row =t37_party_resultDAO.modifyT37_party_resultStatusForReport(sqlMap, t37_party_result);
		    if(row>0){
				T37_level_audit t37_level_audit=new T37_level_audit();
				String audit_no=DateUtils.getDate10to8(DateUtils.getCurrTime())
				+this.getSequenceNextVal("T37_LEVEL_AUDIT_SEQ");
				t37_level_audit.setAudit_no(audit_no);
				t37_level_audit.setRsltkey(resulekey);
				t37_level_audit.setParty_id(t37_party_result.getParty_id());
				t37_level_audit.setOrgankey(t37_party_result.getOrgankey());
				t37_level_audit.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
				t37_level_audit.setLast_upd_dt(DateUtils.getCurrDateTime());
				t37_level_audit.setLast_upd_user(authBean.getAuthToken().getT00_user().getUsername());
				t37_level_audit.setLevel_before_adjust(t37_party_result.getFristappralevel());
				t37_level_audit.setLevel_after_adjust(t37_party_result.getEmendationlevel());
				t37_level_audit.setAdjust_reason(t37_party_result.getReturn_reason());
				t37_level_audit.setGranularity(t37_party_result.getGranularity());
				t37_level_audit.setRes_post_id(next_post);
				t37_level_audit.setPost_id(curr_post);
				t37_level_audit.setTablename(levaltable);
				t37_party_resultDAO.insertT37_level_audit(sqlMap, t37_level_audit);   //���������¼
			}
			String return_url="t37_party_result_checkList.do?post_id="+curr_post;
			if(curr_post.equals("P2004")){
				return_url="t37_party_result_list?post_id="+curr_post+"&tempcategory=2";
			}
			request.setAttribute("return_url",return_url);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward(forward);
	}
	
	private void isModify_fields(String oper_id,String curr_post,T37_party_result t37_party_result,AuthBean authBean){
		
		 if(oper_id.equals("B20011")||oper_id.equals("B20021")||oper_id.equals("B20031")){
		    	if(curr_post.equals("P2001")){
			    	t37_party_result.setAudit_user(authBean.getAuthToken().getT00_user().getUsername());
			    	t37_party_result.setAudit_dt(DateUtils.getCurrDateTime());
			    }else if(curr_post.equals("P2002")){
			    	t37_party_result.setCheck_user(authBean.getAuthToken().getT00_user().getUsername());
			    	t37_party_result.setCheck_dt(DateUtils.getCurrDateTime());
			    }else if(curr_post.equals("P2003")){
			    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
			    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
			    }
		    }
	}
	/**
	 * ��ʽ����
	 * @param actionMapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 */
	public ActionForward performT37_party_gs_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		String forward="";
		try {
			String backurl=StringUtils.null2String(request.getParameter("backurl"));
			String rate_source=StringUtils.null2String(request.getParameter("rate_source"));
			request.setAttribute("backurl", backurl);
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("levelMap", this.getOptionsListByMap(levelMap,null, false));
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			String table_name="T37_PARTY_RESULT";
			if(t37_party_result.getRate_source().equals("2")){
				table_name="T37_PRESULT_AUDIT";
			}
			t37_party_result.setTable_name(table_name);
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
			
			PropertyUtils.copyProperties(form, t37_party_result);
			request.setAttribute("curr_post",t37_party_result.getCurr_post());
			form.setRate_source(rate_source);

		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("resulekey", t37_party_result.getResulekey());
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
	public ActionForward performT37_party_jf_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
		request.setAttribute("levelMap", this.getOptionsListByMap(levelMap,null, false));
		T37_party_result t37_party_result = new T37_party_result();
		T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
		List t37_appr_bas_rsltList=new ArrayList();
		String jsonStr="";
		String jsonFlag = "";
		try {
			String backurl=StringUtils.null2String(request.getParameter("backurl"));
			String post_id=StringUtils.null2String(request.getParameter("post_id"));
			String tempcategory=StringUtils.null2String(request.getParameter("tempcategory"));
			request.setAttribute("backurl", backurl+"&tempcategory="+tempcategory);
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String rate_source=form.getRate_source();
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
				String table_name="T37_PARTY_RESULT";
				String appr_table="T37_APPR_BAS_RSLT";  //Ҫ���ֵ��
				if(t37_party_result.getRate_source().equals("2")){
					table_name="T37_PRESULT_AUDIT";
					appr_table="T37_APPR_BAS_RSLT_AUDIT";
				}
				t37_party_result.setTable_name(table_name);
				t37_party_result=t37_party_resultDAO.getT37_party_result_jfDisp_new(sqlMap, t37_party_result,post_id);
				/*edit by helong 2014/11/20 �����д���ŵ�dao�������ּ���ǰ*/
				//t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
				/*edit end*/
				t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
				t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
				t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
				t37_appr_bas_rslt.setStatistic_dt(t37_party_result.getStatistic_dt());
				//t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_elem_rsltList(sqlMap, t37_appr_bas_rslt);
				
				//��ѯ���һ��÷�
			
				if(t37_party_result.getScoremodi_flag()!=null&&t37_party_result.getScoremodi_flag().equals("1")){
					appr_table="T37_APPR_BAS_RSLT_MODI";
				}
				t37_appr_bas_rslt.setTable_name(appr_table);
				t37_appr_bas_rslt.setTreelaye("0");
				//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
				ArrayList  list= t37_party_resultDAO.getT37_appr_bas_rsltList1(sqlMap, t37_appr_bas_rslt);
				//�ͻ������б�
				T31_def_element t31_def_element=new T31_def_element();
				t31_def_element.setTemplatekey(t37_party_result.getTemplatekey());
				t31_def_element.setTreelaye("1");
				ArrayList eleList = t37_party_resultDAO.getT31_def_elem_List(sqlMap, t31_def_element);
				JSONArray jsonArray=new JSONArray();
				for(int i=0;i<eleList.size();i++){
					T31_def_element t31_def_element1=(T31_def_element)eleList.get(i);
					String elementkey=t31_def_element1.getElementkey();
					String js_type=t31_def_element1.getJs_type();
					com.ist.aml.newrisk.dto.T37_appr_bas_rslt t37_appr_bas=new com.ist.aml.newrisk.dto.T37_appr_bas_rslt();
					//PropertyUtils.copyProperties(t37_appr_bas, t31_def_element1);
					double score=this.reCal(elementkey, js_type, list);
					t37_appr_bas.setElement_score(score);
					t37_appr_bas.setTemplatekey(t31_def_element1.getTemplatekey());
					t37_appr_bas.setElementkey(t31_def_element1.getElementkey());
					t37_appr_bas.setElementname(t31_def_element1.getElementname());
					t37_appr_bas.setTreelaye(t31_def_element1.getTreelaye());
					t37_appr_bas.setIs_last(t31_def_element1.getIs_last());
					t37_appr_bas.setResulekey(t37_party_result.getResulekey());
					//t37_appr_bas.setElement_score(String.valueOf(score));
					JSONObject json = JSONObject.fromObject(t37_appr_bas);
					jsonArray.add(json);
					
				}
				
				
				
				
				
				PropertyUtils.copyProperties(form, t37_party_result);
				form.setRate_source(rate_source);
				request.setAttribute("curr_post",t37_party_result.getCurr_post());
			
//				JSONArray jsonArray=new JSONArray();
//				for(int i=0;i<t37_appr_bas_rsltList.size();i++){
//					
//					T37_appr_bas_rslt t37_appr_bas=(T37_appr_bas_rslt)t37_appr_bas_rsltList.get(i);
//					JSONObject json = JSONObject.fromObject(t37_appr_bas);
//					jsonArray.add(json);
//
//				}
				jsonStr=jsonArray.toString();
				jsonFlag = "0";
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("jsonStr",jsonStr);
		request.setAttribute("jsonFlag",jsonFlag);
		request.setAttribute("t37_appr_bas_rsltList",t37_appr_bas_rsltList);
		return actionMapping.findForward("success");
	}
//	public static String upLayer;
	
	public ActionForward performGetT37_appr_elem_rslt_dispList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
		request.setAttribute("levelMap", this.getOptionsListByMap(levelMap,null, false));
		T37_party_result t37_party_result = new T37_party_result();
		T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
		ArrayList  t37_level_auditList = new ArrayList();
		List t37_appr_bas_rslt_dispList=new ArrayList();
		String jsonStr="";
		String jsonFlag = "0";
		try {
			String backurl=StringUtils.null2String(request.getParameter("backurl"));
			request.setAttribute("backurl", backurl);
			LinkedHashMap radarMap = cm.getMapFromCache("radar_name"); 
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			    String elementkey=StringUtils.nullObject2String(request.getParameter("elementkey"));
			    String resulekey=StringUtils.nullObject2String(request.getParameter("resulekey"));
			    String treelaye=StringUtils.nullObject2String(request.getParameter("treelaye"));
			    String is_last=StringUtils.nullObject2String(request.getParameter("is_last"));
			    
			    t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
				if(t37_party_result.getStatistic_dt_disp()!=null && !"".equals(t37_party_result.getStatistic_dt_disp())){
					t37_appr_bas_rslt.setStatistic_dt(DateUtils.stringToDateShort(t37_party_result.getStatistic_dt_disp()));
				}
				String appr_table="T37_APPR_BAS_RSLT";  //Ҫ���ֵ��
				String table_name="T37_PARTY_RESULT";
				if(t37_party_result.getRate_source().equals("2")){
					table_name="T37_PRESULT_AUDIT";
					appr_table="T37_APPR_BAS_RSLT_AUDIT";
				}
				t37_party_result.setTable_name(table_name);
				if(t37_party_result.getScoremodi_flag()!=null&&t37_party_result.getScoremodi_flag().equals("1")){
					appr_table="T37_APPR_BAS_RSLT_MODI";
				}
		    	t37_appr_bas_rslt.setTable_name(appr_table);
		    	JSONArray jsonArray=new JSONArray();
			    if(elementkey.equals("fristList")){

					t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
					t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
//					
//					t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_elem_rsltList(sqlMap, t37_appr_bas_rslt)

					t37_appr_bas_rslt.setTreelaye("1");
					//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
					ArrayList  list= t37_party_resultDAO.getT37_appr_bas_rsltList1(sqlMap, t37_appr_bas_rslt);
					//�ͻ������б�
					T31_def_element t31_def_element=new T31_def_element();
					t31_def_element.setTemplatekey(t37_party_result.getTemplatekey());
					t31_def_element.setTreelaye("1");
					ArrayList eleList = t37_party_resultDAO.getT31_def_elem_List(sqlMap, t31_def_element);
				
					for(int i=0;i<eleList.size();i++){
						T31_def_element t31_def_element1=(T31_def_element)eleList.get(i);
						String elementkey1=t31_def_element1.getElementkey();
						String js_type=t31_def_element1.getJs_type();
						com.ist.aml.newrisk.dto.T37_appr_bas_rslt t37_appr_bas=new com.ist.aml.newrisk.dto.T37_appr_bas_rslt();
						//PropertyUtils.copyProperties(t37_appr_bas, t31_def_element1);
						double score=this.reCal(elementkey1, js_type, list);
						t37_appr_bas.setElement_score(score);
						t37_appr_bas.setTemplatekey(t31_def_element1.getTemplatekey());
						t37_appr_bas.setElementkey(t31_def_element1.getElementkey());
						t37_appr_bas.setElementname(t31_def_element1.getElementname());
						t37_appr_bas.setTreelaye(t31_def_element1.getTreelaye());
						t37_appr_bas.setIs_last(t31_def_element1.getIs_last());
						t37_appr_bas.setResulekey(t37_party_result.getResulekey());
						//t37_appr_bas.setElement_score(String.valueOf(score));
						JSONObject json = JSONObject.fromObject(t37_appr_bas);
						jsonArray.add(json);
						
					}
			    	
			    }else{
			    	
//				    t37_appr_bas_rslt.setElementkey(elementkey);
//				    t37_appr_bas_rslt.setResulekey(resulekey);
//					t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_elem_rslt_dispList(sqlMap, t37_appr_bas_rslt);
//					if(t37_appr_bas_rslt_dispList.size()==0){
//						t37_appr_bas_rslt_dispList = t37_party_resultDAO.getT37_appr_bas_rslt_dispList(sqlMap, t37_appr_bas_rslt);
//						jsonFlag = "1";
//					}
			    	t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
			    	t37_appr_bas_rslt.setResulekey(resulekey);
			  
                     if(is_last.equals("1")){
                    	 ArrayList t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
                    	 jsonFlag = "1";
			    	}else{
					t37_appr_bas_rslt.setTreelaye(treelaye);
					//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
					ArrayList  list= t37_party_resultDAO.getT37_appr_bas_rsltList1(sqlMap, t37_appr_bas_rslt);
			    	
			    	T31_def_element t31_def_element=new T31_def_element();
					t31_def_element.setUpelementkey(elementkey);
					t31_def_element.setTreelaye(String.valueOf(Integer.parseInt(treelaye)+1));
					ArrayList eleList = t37_party_resultDAO.getT31_def_elem_List(sqlMap, t31_def_element);
				
					for(int i=0;i<eleList.size();i++){
						T31_def_element t31_def_element1=(T31_def_element)eleList.get(i);
						String elementkey1=t31_def_element1.getElementkey();
						String js_type=t31_def_element1.getJs_type();
						com.ist.aml.newrisk.dto.T37_appr_bas_rslt t37_appr_bas=new com.ist.aml.newrisk.dto.T37_appr_bas_rslt();
						//PropertyUtils.copyProperties(t37_appr_bas, t31_def_element1);
						double score=this.reCal(elementkey1, js_type, list);
						t37_appr_bas.setElement_score(score);
						t37_appr_bas.setTemplatekey(t31_def_element1.getTemplatekey());
						t37_appr_bas.setElementkey(t31_def_element1.getElementkey());
						t37_appr_bas.setElementname(t31_def_element1.getElementname());
						t37_appr_bas.setTreelaye(t31_def_element1.getTreelaye());
						t37_appr_bas.setIs_last(t31_def_element1.getIs_last());
						t37_appr_bas.setResulekey(t37_party_result.getResulekey());
						//t37_appr_bas.setElement_score(String.valueOf(score));
						JSONObject json = JSONObject.fromObject(t37_appr_bas);
						jsonArray.add(json);
						
					}
			    	}
	
			    }
			    t37_party_result=t37_party_resultDAO.getT37_party_result_jfDisp(sqlMap, t37_party_result);
				t37_party_result.setLevel_before_adjust(StringUtils.null2String(t37_party_result.getEmendationlevel()));
				
			    //t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
			    PropertyUtils.copyProperties(form, t37_party_result);
				request.setAttribute("curr_post",t37_party_result.getCurr_post());
				

				jsonStr=jsonArray.toString();
				
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("jsonStr",jsonStr);
		request.setAttribute("t37_level_auditList",t37_level_auditList);
		request.setAttribute("jsonFlag",jsonFlag);
		return actionMapping.findForward("success");
	}
	public ActionForward performGetT37_appr_elem_rslt_dispList2(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		T37_appr_bas_rslt t37_appr_bas_rslt = new T37_appr_bas_rslt();
		List t37_appr_bas_rslt_dispList=new ArrayList();
		String jsonStr="";
		String jsonFlag = "0";
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			    String elementkey=StringUtils.nullObject2String(request.getParameter("elementkey"));
			    String resulekey=StringUtils.nullObject2String(request.getParameter("resulekey"));
			    String treelaye=StringUtils.nullObject2String(request.getParameter("treelaye"));
			    String is_last=StringUtils.nullObject2String(request.getParameter("is_last"));
			    
			    t37_appr_bas_rslt.setOrgankey(t37_party_result.getOrgankey());
				
				String appr_table="T37_APPR_BAS_RSLT";  //Ҫ���ֵ��
				String table_name="T37_PARTY_RESULT";
				if(t37_party_result.getRate_source().equals("2")){
					table_name="T37_PRESULT_AUDIT";
					appr_table="T37_APPR_BAS_RSLT_AUDIT";
				}
				t37_party_result.setTable_name(table_name);
				if(form.getScoremodi_flag()!=null&&form.getScoremodi_flag().equals("1")){
					appr_table="T37_APPR_BAS_RSLT_MODI";
				}
		    	t37_appr_bas_rslt.setTable_name(appr_table);
		    	JSONArray jsonArray=new JSONArray();
			    if(elementkey.equals("fristList")){

					t37_appr_bas_rslt.setResulekey(t37_party_result.getResulekey());
					t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());

					t37_appr_bas_rslt.setTreelaye("1");
					//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
					ArrayList  list= t37_party_resultDAO.getT37_appr_bas_rsltList1(sqlMap, t37_appr_bas_rslt);
					//�ͻ������б�
					T31_def_element t31_def_element=new T31_def_element();
					t31_def_element.setTemplatekey(t37_party_result.getTemplatekey());
					t31_def_element.setTreelaye("1");
					ArrayList eleList = t37_party_resultDAO.getT31_def_elem_List(sqlMap, t31_def_element);
				
					for(int i=0;i<eleList.size();i++){
						T31_def_element t31_def_element1=(T31_def_element)eleList.get(i);
						String elementkey1=t31_def_element1.getElementkey();
						String js_type=t31_def_element1.getJs_type();
						com.ist.aml.newrisk.dto.T37_appr_bas_rslt t37_appr_bas=new com.ist.aml.newrisk.dto.T37_appr_bas_rslt();
						//PropertyUtils.copyProperties(t37_appr_bas, t31_def_element1);
						double score=this.reCal(elementkey1, js_type, list);
						t37_appr_bas.setElement_score(score);
						t37_appr_bas.setTemplatekey(t31_def_element1.getTemplatekey());
						t37_appr_bas.setElementkey(t31_def_element1.getElementkey());
						t37_appr_bas.setElementname(t31_def_element1.getElementname());
						t37_appr_bas.setTreelaye(t31_def_element1.getTreelaye());
						t37_appr_bas.setIs_last(t31_def_element1.getIs_last());
						t37_appr_bas.setResulekey(t37_party_result.getResulekey());
						//t37_appr_bas.setElement_score(String.valueOf(score));
						JSONObject json = JSONObject.fromObject(t37_appr_bas);
						jsonArray.add(json);
						
					}
			    	
			    }else{
			    	
			    	t37_appr_bas_rslt.setTemplatekey(t37_party_result.getTemplatekey());
			    	t37_appr_bas_rslt.setResulekey(resulekey);
			  
                     if(is_last.equals("1")){
                    	 ArrayList t37_appr_bas_rsltList = t37_party_resultDAO.getT37_appr_bas_rsltList(sqlMap, t37_appr_bas_rslt);
                    	 jsonFlag = "1";
			    	}else{
					t37_appr_bas_rslt.setTreelaye(treelaye);
					//�ͻ�Ҫ���ֵ�б��б�����һ�����ݣ�
					ArrayList  list= t37_party_resultDAO.getT37_appr_bas_rsltList1(sqlMap, t37_appr_bas_rslt);
			    	
			    	T31_def_element t31_def_element=new T31_def_element();
					t31_def_element.setUpelementkey(elementkey);
					t31_def_element.setTreelaye(String.valueOf(Integer.parseInt(treelaye)+1));
					ArrayList eleList = t37_party_resultDAO.getT31_def_elem_List(sqlMap, t31_def_element);
				
					for(int i=0;i<eleList.size();i++){
						T31_def_element t31_def_element1=(T31_def_element)eleList.get(i);
						String elementkey1=t31_def_element1.getElementkey();
						String js_type=t31_def_element1.getJs_type();
						com.ist.aml.newrisk.dto.T37_appr_bas_rslt t37_appr_bas=new com.ist.aml.newrisk.dto.T37_appr_bas_rslt();
						//PropertyUtils.copyProperties(t37_appr_bas, t31_def_element1);
						double score=this.reCal(elementkey1, js_type, list);
						t37_appr_bas.setElement_score(score);
						t37_appr_bas.setTemplatekey(t31_def_element1.getTemplatekey());
						t37_appr_bas.setElementkey(t31_def_element1.getElementkey());
						t37_appr_bas.setElementname(t31_def_element1.getElementname());
						t37_appr_bas.setTreelaye(t31_def_element1.getTreelaye());
						t37_appr_bas.setIs_last(t31_def_element1.getIs_last());
						t37_appr_bas.setResulekey(t37_party_result.getResulekey());
						//t37_appr_bas.setElement_score(String.valueOf(score));
						JSONObject json = JSONObject.fromObject(t37_appr_bas);
						jsonArray.add(json);
						
					}
			    	}
	
			    }
			    PropertyUtils.copyProperties(form, t37_party_result);
				request.setAttribute("curr_post",t37_party_result.getCurr_post());
			
				jsonStr=jsonArray.toString();
				response.setContentType("text/html; charset=UTF-8");
				response.getWriter().print(jsonStr); 
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
	public ActionForward performAddT37_operDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_levelList");
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			String post_id=form.getPost_id(); 
			String node_id = form.getNode_id();
			String oper_id = StringUtils.null2String(form.getOper_id());
	        String[] resultKeys = form.getRkeys();
	        String keys="";
	        String organkeys="";
	        String key_temps="";
	        String flow_ids="";
			if (resultKeys != null && resultKeys.length > 0){
				for (int i = 0; i < resultKeys.length; i++) {
					String str=resultKeys[i];
					String[] strs=str.split(",");
					keys=keys+",'"+strs[0]+"'";
					flow_ids=flow_ids+";"+"'"+strs[0]+"'"+","+strs[1]+","+strs[2];
				}
			}
			String status="";
			String is_report="";
			String next_post="";
			if(!keys.equals("")){
				ArrayList t31_switchList = new ArrayList();
				ArrayList t31_flowList = new ArrayList();
				T31_swith t31_switch_n= new T31_swith();
					String[] flow_id=flow_ids.substring(1).split(";");
			    	String[] flows;
			    	Map<String,Set<String>> map=new LinkedHashMap<String,Set<String>>();
			    	String table_name="T37_PARTY_RESULT";
					if(t37_party_result.getRate_source().equals("2")){ //�ٵ�����
						table_name="T37_PRESULT_AUDIT";
					}
					t37_party_result.setTable_name(table_name);
			    	for(int i=0;i<flow_id.length;i++){
			    		flows=flow_id[i].split(",");
			    		t31_switch_n.setFlow_id(flows[1]);
			    		t31_switch_n.setLevelkey(flows[2]);
			    		t31_switch_n.setOper_id(oper_id);
			    		t31_switch_n.setOrig_node(node_id);
			    		ArrayList t31_switch_searchList=(ArrayList)sqlMap.queryForList("getT31_switchList", t31_switch_n);
			    		for(int j=0;j<t31_switch_searchList.size();j++){
			    			T31_swith t31_switch=(T31_swith)t31_switch_searchList.get(j);
			    			String target_node=t31_switch.getTarget_node();
			    			if(!"".equals(flows[0]) && !"".equals(target_node)){
			    				if(map.get(target_node)==null){
				    				Set<String> sSet = new HashSet<String>();
									List list=new ArrayList();
									sSet.add(flows[0]+";"+t31_switch.getStatus());
									map.put(target_node, sSet);
								}else{
									Set<String> sSet=(Set<String>)map.get(target_node);
									sSet.add(flows[0]+";"+t31_switch.getStatus());
									map.put(target_node, sSet);
								}
				    		}
			    		}	
			    	}
			    	Iterator it = map.keySet().iterator();
			    	String key;   
			    	Set<String> valueSet; 
			    	while(it.hasNext()){
			    	    key=it.next().toString();   
			    	    valueSet=  map.get(key);
			    	    LinkedHashMap nodeMap=cm.getMapFromCache("t31_nodeid");
						next_post=StringUtils.null2String((String)nodeMap.get(key)) ;
						String[]  valueSets=valueSet.toString().split(",");
						String resultkeys="";
						for(int i=0;i<valueSets.length;i++){
							String[] valueSetl=valueSets[i].split(";");
							resultkeys=resultkeys+","+valueSetl[0];
							if(i==0){
							  status=valueSetl[1].substring(0,1); 
							}
						}
			    	    t37_party_result.setResulekey(resultkeys.substring(2));
						t37_party_result.setCurr_post(next_post);
						t37_party_result.setStatus_cd(status);
						if(next_post.equals("")){
						    	t37_party_result.setCurr_post("N9999");	
						    	t37_party_result.setStatus_cd("8");
						    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
						    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
						   }
						
						//���ݸ�λ�ж��޸ľ����ֶ�
						modifyT37_operDo(t37_party_result,request);	
						
						t37_party_resultDAO.modifyT37_party_resultStatusForReport(sqlMap, t37_party_result);
					}
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	public ActionForward performBatchT37_operDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context
				.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			
			MyBeanUtils.copyBean2Bean(t37_party_result, form);
			LinkedHashMap t87_sysparaMap = cm.getMapFromCache("t87_syspara");
			String post_id=form.getPost_id(); 
			String node_id = form.getNode_id();
			String oper_id = StringUtils.null2String(form.getOper_id());
			T31_swith t31_switch_n= new T31_swith();
    		t31_switch_n.setOper_id(oper_id);
    		t31_switch_n.setOrig_node(node_id);
    		String table_name="T37_PARTY_RESULT";
			if(t37_party_result.getRate_source().equals("2")){ //�ٵ�����
				table_name="T37_PRESULT_AUDIT";
			}
			t37_party_result.setTable_name(table_name);
    		ArrayList t31_switch_searchList=(ArrayList)sqlMap.queryForList("getT31_switchList", t31_switch_n);
    		Map<String,Set<String>> map=new LinkedHashMap<String,Set<String>>();
    		for(int j=0;j<t31_switch_searchList.size();j++){
    			T31_swith t31_switch=(T31_swith)t31_switch_searchList.get(j);
    			String target_node=t31_switch.getTarget_node();
    			if(!"".equals(target_node)){
    				if(map.get(target_node)==null){
	    				Set<String> sSet = new HashSet<String>();
						sSet.add(t31_switch.getLevelkey()+";"+t31_switch.getFlow_id()+";"+t31_switch.getStatus());
						map.put(target_node, sSet);
					}else{
						Set<String> sSet=(Set<String>)map.get(target_node);
						sSet.add(t31_switch.getLevelkey()+";"+t31_switch.getFlow_id()+";"+t31_switch.getStatus());
						map.put(target_node, sSet);
					}
	    		}
    		}
    		String status="";
			String is_report="";
			String next_post="";
			String levelkey="";
    		Iterator it = map.keySet().iterator();
	    	String key;   
	    	Set<String> valueSet; 
    	    String resultkeys="";
	    	while(it.hasNext()){
	    	    key=it.next().toString();   
	    	    valueSet=  map.get(key);
	    	    LinkedHashMap nodeMap=cm.getMapFromCache("t31_nodeid");
				next_post=StringUtils.null2String((String)nodeMap.get(key)) ;
				int len=valueSet.toString().length()-1;
				String[]  valueSets=valueSet.toString().substring(1,len).split(",");
				Map<String,List<String>> map0=new LinkedHashMap<String,List<String>>();
				for(int i=0;i<valueSets.length;i++){
					String[] valueSetl=valueSets[i].split(";");
					if(i==0){
						status=valueSetl[2];
					}
					if(map0.get(valueSetl[1])==null){
						List list=new ArrayList();
						list.add(valueSetl[0]);
						map0.put(valueSetl[1], list);
					}else{
						List list=(ArrayList)map0.get(valueSetl[1]);
						list.add(valueSetl[0]);
						map0.put(valueSetl[1], list);
					}
				}
				Iterator it0 = map0.keySet().iterator();
				List valueList0; 
				String cond_sql="";
				String ley0;
				while(it0.hasNext()){
					ley0=it0.next().toString();
					valueList0=map0.get(ley0);
					String levkey="";
					for(int j=0;j<valueList0.size();j++){
						levkey=levkey+","+"'"+valueList0.get(j).toString().trim()+"'";
					}	
					cond_sql=cond_sql+" OR ("+"T.FLOW_ID IN ('"+ley0+"') AND T.EMENDATIONLEVEL IN ("+levkey.substring(1)+")"+")";
				}
				cond_sql=cond_sql.substring(3);
				t37_party_result.setCond_sql("("+cond_sql+")");
				t37_party_result.setBatch_curr_post(next_post);
				t37_party_result.setBatch_status_cd(status);
				if(next_post.equals("")){
				    	t37_party_result.setBatch_curr_post("N9999");	
				    	t37_party_result.setBatch_status_cd("8");
				    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
				    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
				   }
				//���ò�ֵķ���
				modifyT37_operDo(t37_party_result,request);
				Authorization auth = authBean.getAuthToken();
				String organStr = auth.getOrganstr();
				t37_party_result.setOrganStr(organStr);
				t37_party_resultDAO.batchT37_party_resultStatusForReport(sqlMap, t37_party_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	private void modifyT37_operDo(T37_party_result t37_party_result,HttpServletRequest request){
		HttpSession session = request.getSession();
		AuthBean authBean = (AuthBean) session.getAttribute("authBean");
		try {
		String post_id=t37_party_result.getPost_id();
		//���ݸ�λ���뼰���������ж��Ƿ����ĳЩ�ֶ�
		if(post_id.equals("P2001")){    //�༭��
	    	t37_party_result.setAudit_user(authBean.getAuthToken().getT00_user().getUsername());
	    	t37_party_result.setAudit_dt(DateUtils.getCurrDateTime());
	    }else if(post_id.equals("P2002")){     //��˸�
	    	t37_party_result.setCheck_user(authBean.getAuthToken().getT00_user().getUsername());
	    	t37_party_result.setCheck_dt(DateUtils.getCurrDateTime());
	    }else if(post_id.equals("P2003")){    //������
	    	t37_party_result.setRcheck_user(authBean.getAuthToken().getT00_user().getUsername());
	    	t37_party_result.setRcheck_dt(DateUtils.getCurrDateTime());
	    }
		}catch (Exception e) {
			e.printStackTrace();
			
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
	public ActionForward performGetT37_party_resultList1(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		List t37_party_resultList = null;
		ArrayList operlist = new ArrayList();
		String pageInfo="";
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_resultDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
			int intPage = PageUtils.intPage(request, newsearchflag);
			//ȡ�ĵ�ǰ�û���Ϣ
			AuthBean authBean = (AuthBean) session.getAttribute("authBean");
			Authorization auth = authBean.getAuthToken();
			String organStr = auth.getOrganstr();
			
			String marked = StringUtils.nullObject2String(request.getParameter("marked"));
			request.setAttribute("marked",marked);
			String status = "6";
			
			LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype"); // �ͻ�����
			request.setAttribute("clienttypeMap", this.getOptionsListByMap(clienttypeMap, null, true));
			LinkedHashMap resultsortMap = cm.getMapFromCache("risk_resultsort");
			request.setAttribute("resultsortMap", this.getOptionsListByMap(resultsortMap, null, true));
			LinkedHashMap levelMap = cm.getMapFromCache("t31_risk_level"); // ���յȼ�
			request.setAttribute("riskLevelMap", this.getOptionsListByMap(levelMap, null, true));
			LinkedHashMap temp_type_map =cm.getMapFromCache("temp_type");//ģ������
			request.setAttribute("temp_type_map", this.getOptionsListByMap(temp_type_map, null, true));
			LinkedHashMap tempcategory_map =cm.getMapFromCache("tempcategory");//��������
			request.setAttribute("tempcategory_map", this.getOptionsListByMap(tempcategory_map, null, true));
			
			if ("0".equals(newsearchflag)) {
				if(form.getOrgankey().equals("")){
					form.setOrgankey(auth.getT00_user().getOrgankey());
				}
				session.removeAttribute("t37_party_result_nextSearchObj");
			}
			else if ("1".equals(newsearchflag)) {
				MyBeanUtils.copyBean2Bean(t37_party_result, form);
				t37_party_result.setOrganStr(organStr);
				String statistic_dt_disp=form.getStatistic_dt_disp();
				String statistic_dt_disp_end=form.getStatistic_dt_disp_end();
				String modifydate_disp=form.getModifydate_disp();
				String modifydate_disp_end=form.getModifydate_disp_end();
				String create_dt_disp=form.getCreate_dt_disp();
				String create_dt_disp_end=form.getCreate_dt_disp_end();
				if (statistic_dt_disp != null && !"".equals(statistic_dt_disp)) {
					t37_party_result.setStatistic_dt(DateUtils
							.stringToDateShort(statistic_dt_disp));
				}
				if (statistic_dt_disp_end != null
						&& !"".equals(statistic_dt_disp_end)) {
					t37_party_result.setStatistic_dt_end(DateUtils
							.stringToDateShort(statistic_dt_disp_end));
				}
				if (modifydate_disp != null && !"".equals(modifydate_disp)) {
					t37_party_result.setModifydate(DateUtils
							.stringToDateShort(modifydate_disp));
				}
				if (modifydate_disp_end != null
						&& !"".equals(modifydate_disp_end)) {
					t37_party_result.setModifydate_end(DateUtils
							.stringToDateShort(modifydate_disp_end));
				}
				if (create_dt_disp != null && !"".equals(create_dt_disp)) {
					t37_party_result.setCreate_dt(DateUtils
							.stringToDateShort(create_dt_disp));
				}
				if (create_dt_disp_end != null
						&& !"".equals(create_dt_disp_end)) {
					t37_party_result.setCreate_dt_end(DateUtils
							.stringToDateShort(create_dt_disp_end));
				}
				session.setAttribute("t37_party_result_nextSearchObj",t37_party_result);
				
			}else{
				t37_party_result=(T37_party_result)session.getAttribute("t37_party_result_nextSearchObj");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
			if (!"0".equals(newsearchflag) ) {
				t37_party_resultList = t37_party_resultDAO .getT37_party_resultList(sqlMap, t37_party_result, this.getStartRec(intPage), this.getIntPageSize());
				int totalRow = t37_party_resultDAO.getT37_party_resultListCount(sqlMap, t37_party_result);
				String url = request.getContextPath() + "/newrisk"
						+ actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
				MyBeanUtils.copyBean2Bean(form, t37_party_result);
			}
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_party_resultList", t37_party_resultList);
		request.setAttribute("pageInfo", pageInfo);
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
	public ActionForward performGetT31_party_result_BExcel(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
		ArrayList t37_party_resultList = new ArrayList();
		ArrayList t37_level_auditList = new ArrayList();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_resultDAO");
		T37_party_result t37_party_result = new T37_party_result();
		T10_check_custDAO t10_check_custdao =(T10_check_custDAO)context.getBean("t10_check_custDAO");
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		T10_survey_cust t10_survey_cust = new T10_survey_cust();
		ArrayList exportlist = new ArrayList();
		Report_SearchObj export_SearchObj = new Report_SearchObj();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String[] results = form.getRkeys();
			String resultKeys = "";
			for(int i=0;i<results.length;i++){
				String str=results[i];
				String[] strs=str.split(",");
				String party_class_cd=strs[2];
				String party_id =strs[1];
				String resulekey =strs[0];
				String organkey = strs[3];
				t10_survey_cust.setParty_id(party_id);
				t10_survey_cust.setParty_class_cd(party_class_cd);
				t37_party_result.setResulekey(resulekey);
				t37_party_result.setOrgankey(organkey);
				
				
				//�ͻ���Ϣ
				t10_survey_cust = t10_check_custdao.getT10_survey_cust_info(sqlMap, t10_survey_cust);
				t10_survey_cust.setParty_class_cd(party_class_cd);
				//������¼
				//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
				//�������
				t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
				
				HashMap rpdihash = new HashMap();
				StringBuffer sb_c=new StringBuffer();
				StringBuffer sb_I=new StringBuffer();
				rpdihash.put("<#a1#>", t10_survey_cust.getOrgankey());// ������
				rpdihash.put("<#a2#>", t10_survey_cust.getOrganname());// ��������
				rpdihash.put("<#a3#>", t37_party_result.getResulekey());// ���
				rpdihash.put("<#a4#>", party_id);// �ͻ���
				rpdihash.put("<#a5#>", t10_survey_cust.getParty_chn_name());// �ͻ�����
				rpdihash.put("<#a6#>", (String)clienttypeMap.get(party_class_cd)); // �ͻ�����

				if(party_class_cd.equals("C"))
				{   
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("Ӫҵִ�պ�");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getBusiness_licence());
					sb_c.append("</td>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("Ӫҵִ�յ�����");
					sb_c.append("</td>");
					sb_c.append("<td  class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getLicence_end_dt_disp());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("��֯��������");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getOrgan_code());
					sb_c.append("</td>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("��֯�������뵽������");
					sb_c.append("</td>");
					sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getOrgan_code_end_dt_disp());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("���û�������");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getOrg_credit_no());
					sb_c.append("</td>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("���û������뵽������");
					sb_c.append("<</td>>");
					sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getOrg_credit_vt_disp());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("ͨѶ��ַ");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getAddr1());
					sb_c.append("<</td>>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("��ϵ�绰");
					sb_c.append("</td>");
					sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getTel_no());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("���˴���֤������");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getLegal_card_type());
					sb_c.append("</td>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("���˴���֤������");
					sb_c.append("</td>");
					sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getLegal_card_no());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
					sb_c.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_c.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_c.append("���˾�ס��");
					sb_c.append("</td>");
					sb_c.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_c.append(t10_survey_cust.getLegal_addr());
					sb_c.append("</td>");
					sb_c.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_c.append("������ϵ��ʽ");
					sb_c.append("</td>");
					sb_c.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_c.append(t10_survey_cust.getLegal_tel());
					sb_c.append("</td>");
					sb_c.append("</tr>");
					
				 }else{   
                    sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
                    sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
                    sb_I.append("�ͻ�֤������");
                    sb_I.append("</td>");
                    sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\"> ");
                    sb_I.append(t10_survey_cust.getCard_type());
                    sb_I.append("</td>");
                    sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
                    sb_I.append("֤��������");
                    sb_I.append("</td>");
                    sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\"> ");
                    sb_I.append(t10_survey_cust.getCard_end_dt_disp());
                    sb_I.append("</td>");
                    sb_I.append("</tr>");
					
                    sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
                    sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
                    sb_I.append("�ͻ�֤����");
                    sb_I.append("</td>");
                    sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
                    sb_I.append(t10_survey_cust.getCard_no());
                    sb_I.append("</td>");
                    sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
                    sb_I.append("�ͻ�״̬");
                    sb_I.append("</td>");
                    sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
                    sb_I.append(t10_survey_cust.getParty_status_cd_disp());
                    sb_I.append("</td>");
                    sb_I.append("</tr>");
					
                    sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
                    sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
                    sb_I.append("�ͻ�ְҵ");
                    sb_I.append("</td>");
                    sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
                    sb_I.append(t10_survey_cust.getOccupation());
                    sb_I.append("</td>");
                    sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
                    sb_I.append("�ͻ�����");
                    sb_I.append("</td>");
                    sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
                    sb_I.append(t10_survey_cust.getCountry_cd());
                    sb_I.append("</td>");
                    sb_I.append("</tr>");
					
                    sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\" >");
					sb_I.append("ͨѶ��ַ");
					sb_I.append("</td>");
					sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_I.append(t10_survey_cust.getAddr1()==null?"":t10_survey_cust.getAddr1());
					sb_I.append("</td>");
					sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_I.append("��ϵ�绰");
					sb_I.append("</td>");
					sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					sb_I.append(t10_survey_cust.getTel_no());
					sb_I.append("</td>");
					sb_I.append("</tr>");
					
					sb_I.append("<tr height=\"19\" style=\"height:14.25pt\">");
					sb_I.append("<td height=\"19\" class=\"xl26\" width=\"155\" style=\"height:14.25pt;width:116pt\"> ");
					sb_I.append("������λ");
					sb_I.append("</td>");
					sb_I.append("<td  colspan=\"6\" class=\"xl32\" width=\"316\" style=\"border-right:.5pt solid black;border-left:none;width:237pt\" >");
					sb_I.append(t10_survey_cust.getCompany());
					sb_I.append("</td>");
					sb_I.append("<td colspan=\"2\" class=\"xl35\" width=\"220\" style=\"border-right:.5pt solid black;border-left:none;width:165pt\" >");
					sb_I.append("����¼");
					sb_I.append("</td>");
					sb_I.append("<td class=\"xl27\" width=\"142\" style=\"width:107pt\" >");
					
					sb_I.append("</td>");
					sb_I.append("</tr>");
					}
				rpdihash.put("<#sb_C_Info#>", sb_c.toString());
				rpdihash.put("<#sb_I_Info#>", sb_I.toString());
				rpdihash.put("<#a17#>", t37_party_result.getFristappralevel_disp());
				rpdihash.put("<#a18#>", t37_party_result.getEmendationlevel_disp());
				rpdihash.put("<#a19#>", t37_party_result.getLevelkey_disp());
				rpdihash.put("<#a20#>", DateUtils.getCurrTime().substring(0, 10));
				rpdihash.put("<#a21#>", DateUtils.getCurrTime().substring(0, 10));
				//�����ļ������ƣ�ͬʱҲ�Ǹ��ĵ��ı��
				String downloadname = "";
				ArrayList list = new ArrayList();
				StringBuffer sb=new StringBuffer();
				for(int j=0;j<t37_level_auditList.size();j++){
					T37_level_audit t37_level_audit=(T37_level_audit)t37_level_auditList.get(j);
					
					sb.append("<tr>");
					sb.append("<td class=\"xl29\" style=\"height:14.25pt\">");
					sb.append(t37_level_audit.getLast_upd_dt_disp());
					sb.append("</td>");
					
					sb.append("<td colspan=\"6\" class=\"xl56\" style=\"border-right:.5pt solid black;border-left:none\">");
					sb.append(t37_level_audit.getLevel_after_adjust());
					sb.append("</td>");
					
					sb.append("<td colspan=\"3\" class=\"xl59\" style=\"border-right:.5pt solid black;border-left:none\">");
					sb.append(t37_level_audit.getAdjust_reason());
					sb.append("</td>");
					sb.append("</tr>");
					
				}
				rpdihash.put("<#level_auditList#>", sb.toString());
				
				downloadname = t37_party_result.getResulekey();
				request.setAttribute("downloadname", downloadname);
				
				export_SearchObj.setHash(rpdihash);
				export_SearchObj.setTargetFileName(downloadname);
				// �����ļ�
				Template template = (Template) context.getBean("template");
				export_SearchObj.setTemplateFileName("t37_party_result_Excel.htm");
				export_SearchObj.setTempPath(party_id);

				String[] tempPath = template.export_risk_snx(export_SearchObj);
				for (int l = 0; l < tempPath.length; l++) {
					exportlist.add(tempPath[l]);
				}
			}
			ZipUtils zipUtils = new ZipUtils(); // ��������zip���Ĺ�����
			// �����ļ���ŵ���ʱĿ¼
			String targetRootPath = sysConfig.getProperty("data.import");
			String zipName = File.separator
					+ "template"
					+ File.separator
					+ DateUtils.getDate10to8(DateUtils
							.dateToStringShort(DateUtils.getCurrDateTime()))
					+ ".zip";
			String zipTempPathName = targetRootPath + zipName; // ���ɵ����ݰ�����ʱȫ·��
			zipUtils.zip(zipTempPathName, exportlist, "");
			File zipFile = new File(zipTempPathName);
			logger.debug("���ݰ��Ĵ�С��" + zipFile.length());
			logger.debug("���ݰ��Ĵ�С��" + zipTempPathName);
			request.setAttribute("zipTempPathName", zipTempPathName);
		    this.writeFile(zipTempPathName, response);
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
		}
		return actionMapping.findForward("success");
	}
	
	public void  writeFile(String zipTempPathName,HttpServletResponse response) throws Exception{
		FileInputStream fileIn = null;
		OutputStream out =null;

		try{
			 fileIn = new FileInputStream(zipTempPathName);
			byte b[] = new byte[1024];
			String m_contentDisposition = "attachment;";
			response.setHeader("Content-Disposition", String
					.valueOf((new StringBuffer(String
							.valueOf(m_contentDisposition))).append(
							" filename=").append(
							DateUtils.dateToStringShort(DateUtils
									.getCurrDateTime())).append(".zip")));
			 out = response.getOutputStream();
			while (fileIn.read(b, 0, 1024) > 0) {
				out.write(b);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(fileIn!=null){
				fileIn.close();
			}
			if(out!=null){
				out.close();
			}
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
	public ActionForward performGetT31_party_result_SExcel(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		ArrayList t37_party_resultList = new ArrayList();
		ArrayList t37_level_auditList = new ArrayList();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_resultDAO");
		T37_party_result t37_party_result = new T37_party_result();
		T10_check_custDAO t10_check_custdao =(T10_check_custDAO)context.getBean("t10_check_custDAO");
		T10_survey_cust t10_survey_cust = new T10_survey_cust();
		LinkedHashMap clienttypeMap = cm.getMapFromCache("clienttype");
		
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			
			String party_class_cd=(String)request.getParameter("party_class_cd");
			String party_id =(String)request.getParameter("party_id");
			String resulekey =(String)request.getParameter("resulekey");
			t10_survey_cust.setParty_id(party_id);
			t10_survey_cust.setParty_class_cd(party_class_cd);
			t37_party_result.setResulekey(resulekey);
			t37_party_result.setOrgankey(form.getOrgankey());
			
			//�ͻ���Ϣ
			t10_survey_cust = t10_check_custdao.getT10_survey_cust_info(sqlMap, t10_survey_cust);
			t10_survey_cust.setParty_class_cd(party_class_cd);
			t10_survey_cust.setParty_class_cd_disp((String)clienttypeMap.get(party_class_cd));
			//������¼
			//t37_level_auditList=t37_party_resultDAO.getT37_level_auditList(sqlMap, t37_party_result);
			//�������
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			
			
			//�����ļ������ƣ�ͬʱҲ�Ǹ��ĵ��ı��
			String downloadname = "";
			
			downloadname = t37_party_result.getResulekey();
			request.setAttribute("downloadname", downloadname);
			
			String curr_time = DateUtils.getCurrTime().substring(0, 10);
			request.setAttribute("curr_time", curr_time);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t10_survey_cust",t10_survey_cust);
		request.setAttribute("t37_level_auditList",t37_level_auditList);
		request.setAttribute("t37_party_result",t37_party_result);
		return actionMapping.findForward("success");
	}
	
	
	public ActionForward performReturnT37_party_result(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		T37_party_resultDAO t37_party_resultDAO = (T37_party_resultDAO) context.getBean("t37_party_result_rateDAO");
		T37_party_result t37_party_result = new T37_party_result();
		try {
			T37_party_resultActionForm form = (T37_party_resultActionForm) actionForm;
			String node_id=StringUtils.null2String(request.getParameter("node_id"));
			String oper_id=StringUtils.null2String(request.getParameter("oper_id"));
			String resultKey=StringUtils.null2String(request.getParameter("rkeys"));
			String organkey=StringUtils.null2String(request.getParameter("organkeys"));
			String rate_source=StringUtils.null2String(request.getParameter("rate_source"));
			t37_party_result.setResulekey(resultKey);
			t37_party_result.setOrgankey(organkey);
			String table_name="T37_PARTY_RESULT";
			if(rate_source.equals("2")){ //�ٵ���
				table_name="T37_PRESULT_AUDIT";
			}
			t37_party_result.setTable_name(table_name);
			t37_party_result=t37_party_resultDAO.getT37_party_resultDisp(sqlMap, t37_party_result);
			MyBeanUtils.copyBean2Bean(form,t37_party_result);
			form.setOper_id(oper_id);
			form.setNode_id(node_id);
			form.setRate_source(rate_source);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage(
					"error.common", e.getMessage()));
			saveMessages(request, errors);
			return actionMapping.findForward("failure");
		}
		return actionMapping.findForward("success");
	}
	public ActionForward performChangeLevelByLastscore(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionMessages errors = new ActionMessages();
		HttpSession session = request.getSession();
		
		String lastscore = StringUtils.nullObject2String(request.getParameter("lastscore"));
		double score=Double.parseDouble(String.valueOf(lastscore));
		String emendationlevel="";
		try {
			ArrayList t31_risk_levelList=(ArrayList)sqlMap.queryForList("t31_risk_level_rateList");
			for(int i=0;i<t31_risk_levelList.size();i++){
				T31_risk_level t31_risk_level=(T31_risk_level)t31_risk_levelList.get(i);
				double min=t31_risk_level.getLevelmin_d();
				double max=t31_risk_level.getLevelmax_d();
				
				if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("0")){
					if(min < score && score < max){
						emendationlevel=t31_risk_level.getLevelkey();
					}
				}
				if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("1")){
					if(min <= score && score <= max){
						emendationlevel=t31_risk_level.getLevelkey();					}
				}
				if(t31_risk_level.getMinisclosed().equals("0")&&t31_risk_level.getMaxisclosed().equals("1")){
					if(min < score && score <= max){
						emendationlevel=t31_risk_level.getLevelkey();					}
				}
				if(t31_risk_level.getMinisclosed().equals("1")&&t31_risk_level.getMaxisclosed().equals("0")){
					if(min <= score && score < max){
						emendationlevel=t31_risk_level.getLevelkey();					}
				}
			}
			
			request.setAttribute("emendationlevel",emendationlevel);
			response.getWriter().print(emendationlevel); 
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
	
	
	
	private double reCal(String root,String js_type, List<T37_appr_bas_rslt> reCalList)
	{
		double sumscore=0,sumbase_occ=0,max=0,min=5;
		
		for(T37_appr_bas_rslt rslt:reCalList)
		{
			
			if(root.equals(rslt.getElementkey())&&
					"1".equals(rslt.getIs_last()))
			{
				return rslt.getScore_d();
			}
			
			
			if (root.equals(rslt.getUpelementkey()))
			{
				String elementkey=rslt.getElementkey();
				
				double score=0;
				double base_occ=rslt.getBase_occ_d();
				

				score=reCal(elementkey,rslt.getJs_type(),reCalList);
				
				
				if(js_type.equals("1")){

					
					if(score==0)
					{
						score=rslt.getScore_d();
					}				
					if(score!=0)
					{	
						sumscore+=score*base_occ;
						
						sumbase_occ+=base_occ;
						
						
					}
					
				}
				else if(js_type.equals("2")){
					
					max= score>max?score:max;
				}
				else if(js_type.equals("3")){
					
					min= score<min?score:min;
					
				}
				
			}
			
			
		}

		if (js_type.equals("1")) {
			if (sumbase_occ != 0) {
				return sumscore / sumbase_occ;
			} else {
				return 0;
			}
		} else if (js_type.equals("2")) {
			return max;
		} else if (js_type.equals("3")) {
			return min;
		} else {
			return 0;
		}
		
		
		
	
	}
	
	
}
