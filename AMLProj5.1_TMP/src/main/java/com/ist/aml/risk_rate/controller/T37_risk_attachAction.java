/**
 * Create by makecode program v2.0
 * ����             ���� 		����
 * 2007-04-03   ����		����
 */

package com.ist.aml.risk_rate.controller;

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
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.apache.struts.action.ActionError;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.upload.FormFile;


import com.ist.aml.information.controller.T00_NOTICEActionForm;
import com.ist.aml.risk_rate.dao.T37_risk_attachDAO;
import com.ist.aml.risk_rate.dto.T37_risk_attach;
import com.ist.common.AuthBean;
import com.ist.common.Authorization;
import com.ist.common.FileUpload;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.properties.XMLProperties;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;
import com.ist.util.StringUtils;

public class T37_risk_attachAction extends BaseAction {
	private static Logger logger = LogUtils
			.getLogger(T37_risk_attachAction.class.getName());

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
		myforward = this.preExecute(mapping, form, request,
		response);//��Ԥ������ǿ������
		if("false".equals(request.getAttribute("goWayFlag")))
		return myforward;//��ѯ����
		 if ("getT37_risk_attachList".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_risk_attachList(mapping, form, request,
					response);
		}
		// ��ӽ���
		else if ("addT37_risk_attach".equalsIgnoreCase(myaction)) {
			myforward = performAddT37_risk_attach(mapping, form, request,
					response);
		}
		// ��Ӷ���
		else if ("addT37_risk_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performAddT37_risk_attachDo(mapping, form, request,
					response);
		}
		
		// ɾ������
		else if ("deleteT37_risk_attachDo".equalsIgnoreCase(myaction)) {
			myforward = performDeleteT37_risk_attachDo(mapping, form, request,
					response);
		}
		// ��ѯ��ϸ��Ϣ
		else if ("getT37_risk_attachDisp".equalsIgnoreCase(myaction)) {
			myforward = performGetT37_risk_attachDisp(mapping, form, request,
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
	public ActionForward performGetT37_risk_attachList(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		HttpSession session = request.getSession();
		ArrayList t37_risk_attachList = new ArrayList();
		String pageInfo = "";
		
		T37_risk_attachDAO t37_risk_attachDAO =(T37_risk_attachDAO)context.getBean("t37_risk_attach_rateDAO");
		T37_risk_attach t37_risk_attach = new T37_risk_attach();
		try {
			T37_risk_attachActionForm form = (T37_risk_attachActionForm) actionForm;
			String newsearchflag = StringUtils.nullObject2String(request
					.getParameter("newsearchflag"));
			int intPage = StringUtils.nullObject2int(request
					.getParameter("intPage"), 0);
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t37_risk_attach, form);
				// ģ��ƥ�䣬��Ҫ���⴦��һ��
				t37_risk_attach.setInt_page(intPage);
				session.setAttribute("t37_risk_attachSearchObj",
						t37_risk_attach);
			} else {// ��ҳ
				t37_risk_attach = (T37_risk_attach) session
						.getAttribute("t37_risk_attachSearchObj");
			}

			t37_risk_attachList = t37_risk_attachDAO.getT37_risk_attachList(
					sqlMap, t37_risk_attach, this.getStartRec(intPage), this
							.getIntPageSize(),context);
			int totalRow = t37_risk_attachDAO.getT37_risk_attachListCount(
					sqlMap, t37_risk_attach);
			String url = request.getContextPath() + "/risk_rate"
					+ actionMapping.getPath() + ".do";

			pageInfo = this.getPageInfoStr(totalRow, intPage, url, "");
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("resulekey", t37_risk_attach.getResulekey());
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("t37_risk_attachList", t37_risk_attachList);

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
	public ActionForward performAddT37_risk_attach(ActionMapping actionMapping,
			ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T37_risk_attachActionForm form = (T37_risk_attachActionForm) actionForm;
		
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
	public ActionForward performAddT37_risk_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T37_risk_attachDAO t37_risk_attachDAO =(T37_risk_attachDAO)context.getBean("t37_risk_attach_rateDAO");
		
		
		boolean isSucc = false;
		HttpSession session = request.getSession();
		try {
			T37_risk_attachActionForm form = (T37_risk_attachActionForm) actionForm;
			String attachkey = DateUtils.FormatDate(DateUtils.getCurrDateTime(), "yyyymmdd")
					+ this.getSequenceNextVal("T37_RISK_TATTCH_SEQ");
			FormFile file = form.getFilename();
			XMLProperties business_config=(XMLProperties)context.getBean("busiConfig");
			String i = business_config
					.getProperty("reportXML.attachMaxSize");
			if (file.getFileSize() > Integer.parseInt(i)) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"�ļ���С���ܳ���2M!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// ��ȡ�ļ����ƺ��ļ���С
			String fname = file.getFileName();
			
			if (fname.equals("") || fname == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError(
						"error.attach.isnull"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			String newFilePathAndPath=this.uplodeFile(fname, file, attachkey);
			
			if (newFilePathAndPath.equals("") || newFilePathAndPath == null) {
				errors.add(errors.GLOBAL_ERROR, new ActionError("error.common",
						"�ϴ�ʧ��!"));
				saveErrors(request, errors);
				return actionMapping.findForward("failure");
			}
			// ��֯�û������Ļ���ID
			AuthBean authBean = new AuthBean();
			Authorization auth = new Authorization();
			authBean = (AuthBean) session.getAttribute("authBean");
			auth = authBean.getAuthToken();
			if (fname != null && !"".equals(fname)) {
				T37_risk_attach ba_aml_attach = new T37_risk_attach();
				ba_aml_attach.setAttach_name(newFilePathAndPath);
				ba_aml_attach.setAttach_realname(fname);
				ba_aml_attach.setResulekey(form.getResulekey());
				ba_aml_attach.setLoad_user(auth.getT00_user().getUsername());
				ba_aml_attach.setLoad_date(DateUtils.getCurrDateTime());
				ba_aml_attach.setAttachkey(attachkey);
				int rows = t37_risk_attachDAO.insertT37_risk_attach(sqlMap, ba_aml_attach);
				if (rows <= 0) {
					throw new Exception("");

				}
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
	
	public String  uplodeFile(String fname,FormFile file,String attachkey) throws Exception{
		InputStream streamIn = null;
		String newFilePathAndPath =""; 
		try{
			FileUpload fileUpload = (FileUpload)context.getBean("fileUpload");
			 streamIn = file.getInputStream();
			FileUtils fileUtils = new FileUtils();
			String newfname = fileUtils.makeSaveFileName("aml_",attachkey,fname);
			 newFilePathAndPath = fileUpload.uploadFile(newfname,
					streamIn, "amlattach", "month");
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			if(streamIn!=null){
				streamIn.close();
			}
		}
		return  newFilePathAndPath;
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
	public ActionForward performDeleteT37_risk_attachDo(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T37_risk_attachDAO t37_risk_attachDAO = new T37_risk_attachDAO();
		try {
			T37_risk_attachActionForm form = (T37_risk_attachActionForm) actionForm;
			String attachkey = form.getAttachkey();
			T37_risk_attach attach = t37_risk_attachDAO.getT37_risk_attachDispByAttachkey(sqlMap, attachkey);
			// ȡ�ø�·��
			XMLProperties sysConfig = (XMLProperties) context.getBean("sysConfig");
			String root = sysConfig.getProperty("data.import");
			
			String path=root+attach.getAttach_name();
			File storeFile = new File(path);
			if(storeFile.exists()){
				storeFile.delete();   //ɾ���������ϵ��ļ�
			}
			int rows = t37_risk_attachDAO.deleteT37_risk_attach(sqlMap,
					attachkey);
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
	public ActionForward performGetT37_risk_attachDisp(
			ActionMapping actionMapping, ActionForm actionForm,
			HttpServletRequest request, HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		
		T37_risk_attachDAO t37_risk_attachDAO = new T37_risk_attachDAO();
		T37_risk_attach t37_risk_attach = new T37_risk_attach();
		try {
			T37_risk_attachActionForm form = (T37_risk_attachActionForm) actionForm;
			String resulekey = form.getResulekey();
			t37_risk_attach = t37_risk_attachDAO.getT37_risk_attachDisp(sqlMap,
					resulekey);
		} catch (Exception e) {
			e.printStackTrace();
			errors.add(errors.GLOBAL_ERROR, new ActionError(
					"error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("t37_risk_attach", t37_risk_attach);
		//
		return actionMapping.findForward("success");
	}
}
