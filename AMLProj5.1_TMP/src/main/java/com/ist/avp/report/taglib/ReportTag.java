package com.ist.avp.report.taglib;

import java.io.IOException;
import java.util.Map;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;

import org.apache.commons.lang.StringUtils;
import org.apache.struts.taglib.TagUtils;

import com.ist.avp.report.model.Report;
import com.ist.avp.report.utils.ReportHTMLView;

public class ReportTag extends BodyTagSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = -915621697116046984L;
	
	private static final String CANNOT_FIND_ANY_BEAN = "���ܲ�ѯ������򱨱�����ʵ��";
	
	/**
	 * ����־û���
	 */
	private String report = null;
	
	/**
	 * ��������
	 */
	private String data = null;
	

	public int doStartTag() throws JspException {
		ReportHTMLView rhv = ReportHTMLView.getInstance();
		JspWriter writer = pageContext.getOut();

		try {
			Report reportObject = (Report) TagUtils.getInstance().lookup(pageContext, report, null);
			Map reportData = (Map) TagUtils.getInstance().lookup(pageContext, data, null);
			
			// ������ܲ�ѯ��������߱�������ʵ�����׳��쳣
			if (reportObject == null || reportData == null) {
				throw new JspException(CANNOT_FIND_ANY_BEAN);
			}
			
			writer.write(rhv.createReportView(reportObject, reportData));
		} catch (Exception e) {
            e.printStackTrace();
            StringBuffer message = new StringBuffer(128).append("������ͼչ�ֳ����쳣��");
            if (StringUtils.isBlank(e.getMessage()) || "null".equalsIgnoreCase(e.getMessage())) {
            	message.append("�������Ա��ϵ��");
            } else {
            	message.append("�쳣ԭ��[").append(e.getMessage()).append("] ���������Ա��ϵ��");
            }
            try {
				writer.write(createErrorMessageView(message.toString()));
			} catch (IOException e1) {
				e1.printStackTrace();
			}
		}
		return SKIP_BODY;
	}


	/**
	 * @param report the report to set
	 */
	public void setReport(String report) {
		this.report = report;
	}


	/**
	 * @param data the data to set
	 */
	public void setData(String data) {
		this.data = data;
	}

	/**
	 * �������������Ϣ��ʾ��ͼ
	 * @param message
	 * @return
	 */
	private String createErrorMessageView(String message) {
		StringBuffer sb = new StringBuffer(256);
		sb.append("<table border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\">")
			.append("<tr><td align=\"left\" height=\"22\" style=\"visibility:visible\" id=\"messageError\"><font color=\"red\"><b>")
			.append(message)
			.append("</b></font></td></tr></table>");
		return sb.toString();
	}
	
}
