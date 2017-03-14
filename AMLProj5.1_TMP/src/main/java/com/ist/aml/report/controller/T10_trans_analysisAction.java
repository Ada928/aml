package com.ist.aml.report.controller;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.Map;
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
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ist.aml.report.dao.T10_trans_analysisDAO;
import com.ist.aml.report.dto.CreditTask;
import com.ist.aml.report.dto.T07_post_operator;
import com.ist.aml.report.dto.T10_capital_chain;
import com.ist.aml.report.dto.T10_trans_analysis;
import com.ist.aml.report.dto.T10_trans_analysis_case;
import com.ist.aml.rule.dto.T21_rule;
import com.ist.common.LogUtils;
import com.ist.common.MyBeanUtils;
import com.ist.common.PageUtils;
import com.ist.common.base.BaseAction;
import com.ist.common.fusioncharts.ChartFactory;
import com.ist.common.fusioncharts.ChartPainter;
import com.ist.common.fusioncharts.Charts;
import com.ist.common.fusioncharts.MultiChartDataset;
import com.ist.common.fusioncharts.SingleChartDataset;
import com.ist.common.jcs.CatchManager;
import com.ist.util.*;

public class T10_trans_analysisAction extends BaseAction {
	private static final long serialVersionUID = -1149982059234005907L;
	private static Logger logger = LogUtils.getLogger(T10_trans_analysisAction.class.getName()).getLogger(Constans.LOGGERNAMEA);
	
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) {
		ActionForward myforward = null;
		String myaction = mapping.getParameter();
		// Ԥ����
		myforward = this.preExecute(mapping, form, request, response);
		// ��Ԥ������ǿ������
		if ("false".equals(request.getAttribute("goWayFlag")))
			return myforward;
		//����һ���ͻ��Ľ������
		if ("t10_cust_trans_analysislist".equalsIgnoreCase(myaction)) {
			myforward = performGet_cust_trans_analysislist(mapping, form, request,
					response);
		}
		//��ѯһ���ͻ����ʽ�����������Ϣ 
		else if("t10_cust_capital_chainlist".equalsIgnoreCase(myaction)){
			myforward = performGet_cust_capital_chainlist(mapping, form, request,
					response);	
		}
		else if("t10_cust_capital_chain_outlist".equalsIgnoreCase(myaction)){
			myforward = performGet_cust_capital_chain_outlist(mapping, form, request,
					response);	
		}
		return myforward;
	}
	
	//����һ���ͻ��Ľ������
	private ActionForward performGet_cust_trans_analysislist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_trans_analysis t10_trans_analysis = new T10_trans_analysis();
		ArrayList analysis_list = new ArrayList();
		HttpSession session = request.getSession();
		try{

			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String party_id= (String)request.getParameter("party_id");//�ͻ�ID
				
			t10_trans_analysis.setParty_id(party_id);
			//��������һ���ͻ�ʱ �Ÿ���session  �����ͬһ�ͻ���β�ѯ���ݿ�ͳ�ƽ���
			String searchflag = request.getParameter("newsearchflag");
			if("1".equals(searchflag)){
				int rows = transdao.getCustTransCountById(sqlMap,t10_trans_analysis);
				double sum_amt = transdao.getCustTransSumAmtById(sqlMap,t10_trans_analysis);
				//�ŵ�session�����ҳ���� 
				session.setAttribute("trans_count1", String.valueOf(rows));
				session.setAttribute("total_amt1",MoneyUtils.formatToMoney(sum_amt));
				
				request.setAttribute("trans_count", String.valueOf(rows));
				request.setAttribute("total_amt",MoneyUtils.formatToMoney(sum_amt));
			}else{
				String trans_count = (String) session.getAttribute("trans_count1");
				String total_amt = (String) session.getAttribute("total_amt1");
				
				request.setAttribute("trans_count", trans_count);
				request.setAttribute("total_amt",total_amt);
			}
			
			//ȡ�ý���ͳ�Ʒ�����ʽ
			String analy_type_flag = request.getParameter("analy_type_flag");
			if(analy_type_flag==null&&"".equals(analy_type_flag)){
				throw new Exception("��֧�ָ÷�����ʽ");
			}
			LinkedHashMap analy_type_map = cm.getMapFromCache("trans_analysis_type");//���׷�����ʽ
			request.setAttribute("analy_type", analy_type_map.get(analy_type_flag));
			if("0".equals(analy_type_flag)){//����������
				analysis_list = transdao.getCustTransGroupByChannel(sqlMap,t10_trans_analysis);
			}else if("1".equals(analy_type_flag)){//�����׻���
				analysis_list = transdao.getCustTransGroupByOrgankey(sqlMap,t10_trans_analysis);
			}else if("2".equals(analy_type_flag)){//������ȥ��
				analysis_list = transdao.getCustTransGroupByTxgoarea(sqlMap,t10_trans_analysis);
			}else if("3".equals(analy_type_flag)){//�����㷽ʽ
				analysis_list = transdao.getCustTransGroupBySettletype(sqlMap,t10_trans_analysis);
			}else if("4".equals(analy_type_flag)){//�����׶���
				analysis_list = transdao.getCustTransGroupByOppname(sqlMap,t10_trans_analysis);
			}
			
//			String dataxml1 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" baseFontSize=\"14\" caption=";
//			String dataxml2 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" caption=";
//			String dataxml2_category = "<categories>";
//			String dataxml2_set = "<dataset seriesName=\"����\" renderAs=\"Column\" parentYAxis=\"X\">";
//			
//			String dataxml3 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" baseFontSize=\"14\" caption=";
//			String dataxml4 = "<chart palette=\"2\" showValues=\"0\" formatNumberScale=\"0\" useRoundEdges=\"1\" caption=";
//			String dataxml4_category = "<categories>";
//			String dataxml4_set = "<dataset seriesName=\"���\" renderAs=\"Column\" parentYAxis=\"X\">";

			Charts mychart = null;
			Charts mychart2 = null;
			Charts mychart3 = null;
			Charts mychart4 = null;
			Iterator iterator = null;
			Iterator iterator2 = null;
			LinkedHashMap spplementMap = new LinkedHashMap();
			LinkedHashMap spplementMap2 = new LinkedHashMap();
			ChartPainter painter = new ChartPainter("0");
			painter.setShowNames("1");
			painter.setLabelDisplay("1");
			
			if("0".equals(analy_type_flag)){//����������
				painter.setCaption("��������");
				
//				dataxml1 += "\"��������\" >";
//				dataxml2 += "\"��������\" >";
//				dataxml3 += "\"��������\" >";
//				dataxml4 += "\"��������\" >";
			}else if("1".equals(analy_type_flag)){//�����׻���
				painter.setCaption("���׻���");
				
//				dataxml1 += "\"���׻���\" >";
//				dataxml2 += "\"���׻���\" >";
//				dataxml3 += "\"���׻���\" >";
//				dataxml4 += "\"���׻���\" >";
			}else if("2".equals(analy_type_flag)){//������ȥ��
				painter.setCaption("����ȥ��");
				
//				dataxml1 += "\"����ȥ��\" >";
//				dataxml2 += "\"����ȥ��\" >";
//				dataxml3 += "\"����ȥ��\" >";
//				dataxml4 += "\"����ȥ��\" >";
			}else if("3".equals(analy_type_flag)){//�����㷽ʽ
				painter.setCaption("���㷽ʽ");
				
//				dataxml1 += "\"���㷽ʽ\" >";
//				dataxml2 += "\"���㷽ʽ\" >";
//				dataxml3 += "\"���㷽ʽ\" >";
//				dataxml4 += "\"���㷽ʽ\" >";
			}else if("4".equals(analy_type_flag)){//�����׶���
				painter.setCaption("��������");
				
//				dataxml1 += "\"���׶���\" >";
//				dataxml2 += "\"���׶���\" >";
//				dataxml3 += "\"���׶���\" >";
//				dataxml4 += "\"���׶���\" >";
			}
			
			painter.setBaseFontSize("14");
			SingleChartDataset cd = new SingleChartDataset(painter);
			MultiChartDataset cd2 = new MultiChartDataset(painter);
			SingleChartDataset cd3 = new SingleChartDataset(painter);
			MultiChartDataset cd4 = new MultiChartDataset(painter);
			
			iterator = analysis_list.iterator();
			while(iterator.hasNext()){
				T10_trans_analysis t10_temp = (T10_trans_analysis)iterator.next();
				String dataLabel =  t10_temp.getPattern();
				if("".equals(t10_temp.getPattern())||t10_temp.getPattern()==null){
					dataLabel = "δ֪";
				}
				if(dataLabel.length()>5&&dataLabel.length()<13){
					painter.setBaseFontSize("10");
					dataLabel = dataLabel.substring(0,6)+"<br>"+dataLabel.substring(6);
					
				}else if(dataLabel.length()>12){
					painter.setBaseFontSize("10");
					dataLabel = dataLabel.substring(0,6)+"<br>"+dataLabel.substring(6,12)+"<br>"+dataLabel.substring(12,dataLabel.length());
				}
				
				spplementMap.put(dataLabel, t10_temp.getCount_percent());
				spplementMap2.put(dataLabel, t10_temp.getAmt_percent());
			}  
			 iterator = spplementMap.entrySet().iterator();
			 iterator2 = spplementMap2.entrySet().iterator();
             while (iterator.hasNext()) {
                 Map.Entry entry = (Map.Entry) iterator.next();
                 cd.addValue((String) entry.getKey(), (String) entry.getValue());
                 cd2.addValue((String) entry.getKey(),"����", (String) entry.getValue());
             } 
             while (iterator2.hasNext()) {
                 Map.Entry entry = (Map.Entry) iterator2.next();
                 cd3.addValue((String) entry.getKey(), (String) entry.getValue());
                 cd4.addValue((String) entry.getKey(),"���", (String) entry.getValue());
             } 
			mychart = ChartFactory.createPie3D(cd);
			request.setAttribute("dataxml1", mychart.getChartData());
			mychart2 = ChartFactory.createMSCombiDY2D(cd2);
			request.setAttribute("dataxml2", mychart2.getChartData());
			mychart3 = ChartFactory.createPie3D(cd3);
			request.setAttribute("dataxml3", mychart3.getChartData());
			mychart4 = ChartFactory.createMSCombiDY2D(cd4);
			request.setAttribute("dataxml4", mychart4.getChartData());
			
//			Iterator iter = analysis_list.iterator();
//			while(iter.hasNext()){
//				T10_trans_analysis t10_temp = (T10_trans_analysis)iter.next();
//				String dataLabel =  t10_temp.getPattern();
//				if("".equals(t10_temp.getPattern())||t10_temp.getPattern()==null){
//					dataLabel = "δ֪";
//				}
//				dataxml1 += "<set label=\"" + dataLabel + "\" value=\"" + t10_temp.getCount_percent() + "\" />";
//                dataxml2_category += "<category label=\"" + dataLabel + "\" />";
//                dataxml2_set += "<set value=\"" + t10_temp.getCount_percent() + "\" />";
//                
//                dataxml3 += "<set label=\"" + dataLabel + "\" value=\"" + t10_temp.getAmt_percent() + "\" />";
//                dataxml4_category += "<category label=\"" + dataLabel + "\" />";
//                dataxml4_set += "<set value=\"" + t10_temp.getAmt_percent() + "\" />";
//			}  
//			
//			dataxml1 += "</chart>";
//			dataxml2_category += "</categories>";
//			dataxml2_set += "</dataset>";
//			dataxml2 += dataxml2_category + dataxml2_set + "</chart>";
//			
//			dataxml3 += "</chart>";
//			dataxml4_category += "</categories>";
//			dataxml4_set += "</dataset>";
//			dataxml4 += dataxml4_category + dataxml4_set + "</chart>";
//			
//			request.setAttribute("dataxml1", dataxml1);
//			request.setAttribute("dataxml2", dataxml2);
//			request.setAttribute("dataxml3", dataxml3);
//			request.setAttribute("dataxml4", dataxml4);
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("analysis_list",analysis_list);
		return actionMapping.findForward("success");
	}
	//��ѯһ���ͻ����ʽ������
	private ActionForward performGet_cust_capital_chainlist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_capital_chain t10_capital_chain = new T10_capital_chain(); 
		ArrayList in_result = new ArrayList();
		Integer in_trans=Integer.valueOf("0");
		Double in_amt=Double.valueOf("0");
		String in_amt_str = "";
		ArrayList out_result = new ArrayList();
		Integer out_trans=Integer.valueOf("0");
		Double out_amt=Double.valueOf("0");
		String out_amt_str = "";
		HttpSession session = request.getSession();
		T10_capital_chainActionForm form = (T10_capital_chainActionForm) actionForm;
		
		String pageInfo = "";
		try{
			//�ȴ�session����ȡ�������ͻ���Ϣ
			String party_id = StringUtils.null2String(request.getParameter("party_id"));//�ͻ�ID

			String analy_from = StringUtils.null2String(request.getParameter("analy_from"));
			request.setAttribute("analy_from", analy_from);
			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String application_num=""; String cast_type="";
			if("2".equals(analy_from)){
				CreditTask credittask = (CreditTask)session.getAttribute("credittask");
				application_num=StringUtils.null2String(credittask.getApplication_num());
				cast_type=StringUtils.null2String(credittask.getCast_type());
			} 
//			else if (party_id == null || "".equals(party_id)) {
//				throw new Exception("�������ͻ��Ŀͻ��Ų���Ϊ��");
//			}
			request.setAttribute("party_id", party_id);
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);
			int intPage_out = PageUtils.intPage(request, newsearchflag);

			LinkedHashMap order_type_map = cm.getMapFromCache("chain_order");
			request.setAttribute("order_type_map", this.getOptionsListByMap(order_type_map, null, true));
			
			
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				MyBeanUtils.copyBean2Bean(t10_capital_chain, form);
				t10_capital_chain.setParty_id(party_id);
				t10_capital_chain.setApplication_num(application_num);
				t10_capital_chain.setCast_type(cast_type);
				if(form.getStart_dt_display()!=null&&!"".equals(form.getStart_dt_display())){
					t10_capital_chain.setStart_dt(DateUtils.stringToDateShort(form.getStart_dt_display()));
				}
				if(form.getEnd_dt_display()!=null&&!"".equals(form.getEnd_dt_display())){
					t10_capital_chain.setEnd_dt(DateUtils.stringToDateShort(form.getEnd_dt_display()));
				}
				session.setAttribute("t10_capital_chain_SearchObj", t10_capital_chain);
			}else {// ��ҳ
				t10_capital_chain = (T10_capital_chain) session.getAttribute("t10_capital_chain_SearchObj");
			}
			
			if (!newsearchflag.equals("2")) {
				if (t10_capital_chain == null)
					t10_capital_chain = new T10_capital_chain();
				in_result = transdao.getInCustCapitalChain(sqlMap,t10_capital_chain,analy_from, this.getStartRec(intPage), this.getIntPageSize());
				in_trans = transdao.getInCustCapitalChainTransCount(sqlMap,t10_capital_chain,analy_from);
				String url_in = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(in_trans, intPage, url_in, "");
			}
			
			if(newsearchflag!=null && !newsearchflag.equals("2")){
				in_amt = transdao.getInCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //�ʽ����뽻���ܽ��
				in_amt_str = MoneyUtils.formatToMoney(in_amt);
				
				out_amt = transdao.getOutCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //�ʽ������ܽ��
				out_amt_str = MoneyUtils.formatToMoney(out_amt);
				}
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("in_trans", in_trans);
		request.setAttribute("in_amt_str", in_amt_str);
		request.setAttribute("out_trans", out_trans);
		request.setAttribute("out_amt_str", out_amt_str);
		request.setAttribute("t10_in_result",in_result);
		request.setAttribute("t10_out_result",out_result);
		return actionMapping.findForward("success");
	}
	
	private ActionForward performGet_cust_capital_chain_outlist(
			ActionMapping actionMapping, ActionForm actionForm, HttpServletRequest request,
			HttpServletResponse response) {
		ActionErrors errors = new ActionErrors();
		T10_trans_analysisDAO transdao = (T10_trans_analysisDAO)context.getBean("t10_trans_analysisDAO");
		T10_capital_chain t10_capital_chain = new T10_capital_chain(); 
		ArrayList out_result = new ArrayList();
		Integer out_trans=Integer.valueOf("0");
		Double out_amt=Double.valueOf("0");
		String out_amt_str = "";
		HttpSession session = request.getSession();
		T10_capital_chainActionForm form = (T10_capital_chainActionForm) actionForm;
		
		String pageInfo = "";
		try{
			//�ȴ�session����ȡ�������ͻ���Ϣ
			String party_id = StringUtils.null2String(request.getParameter("party_id"));//�ͻ�ID

			String analy_from = StringUtils.null2String(request.getParameter("analy_from"));
			request.setAttribute("analy_from", analy_from);
			String flag =StringUtils.null2String(request.getParameter("flag"));
			request.setAttribute("flag", flag);
			String application_num=""; String cast_type="";
			if("2".equals(analy_from)){
				CreditTask credittask = (CreditTask)session.getAttribute("credittask");
				application_num=StringUtils.null2String(credittask.getApplication_num());
				cast_type=StringUtils.null2String(credittask.getCast_type());
			}
//			else if(party_id==null||"".equals(party_id)){
//				throw new Exception("�������ͻ��Ŀͻ��Ų���Ϊ��");
//			}
			request.setAttribute("party_id", party_id);
		
			String newsearchflag = StringUtils.nullObject2String(request.getParameter("newsearchflag"));
		
			int intPage = PageUtils.intPage(request, newsearchflag);
			
			if (newsearchflag.equals("1")) {// �µĲ�ѯ
				//MyBeanUtils.copyBean2Bean(t10_capital_chain, form);
				t10_capital_chain=(T10_capital_chain) session.getAttribute("t10_capital_chain_SearchObj");
				t10_capital_chain.setParty_id(party_id);
				t10_capital_chain.setApplication_num(application_num);
				t10_capital_chain.setCast_type(cast_type);
				
				session.setAttribute("t10_capital_chain_outSearchObj", t10_capital_chain);
			}else {// ��ҳ
				t10_capital_chain = (T10_capital_chain) session.getAttribute("t10_capital_chain_outSearchObj");
			}
			
			if (!newsearchflag.equals("2")) {
				if (t10_capital_chain == null)
					t10_capital_chain = new T10_capital_chain();
				
				out_result = transdao.getOutCustCapitalChain(sqlMap,t10_capital_chain,analy_from, this.getStartRec(intPage), this.getIntPageSize());//�ʽ���������
				out_trans = transdao.getOutCustCapitalChainTransCount(sqlMap,t10_capital_chain,analy_from);
				String url_out = request.getContextPath() + "/report" + actionMapping.getPath() + ".do";
				pageInfo = this.getPageInfoStr(out_trans, intPage, url_out, "");
			}
			
			if(newsearchflag!=null && !newsearchflag.equals("2")){
				out_amt = transdao.getOutCustCapitalChainAmt(sqlMap,t10_capital_chain,analy_from); //�ʽ������ܽ��
				out_amt_str = MoneyUtils.formatToMoney(out_amt);
				}
			
		}catch (Exception e) {
			e.printStackTrace();
			logger.error(e);
			errors.add(errors.GLOBAL_ERROR, new ActionError("error.pagertitle.default"));
			saveErrors(request, errors);
			return actionMapping.findForward("failure");
		}
		request.setAttribute("pageInfo", pageInfo);
		
		request.setAttribute("out_trans", out_trans);
		request.setAttribute("out_amt_str", out_amt_str);
		request.setAttribute("t10_out_result",out_result);
		return actionMapping.findForward("success");
	}
}
