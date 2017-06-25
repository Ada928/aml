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

/**
 * <p>T31_def_tempActionForm.java</p>
 * <p>Description: </p>
 * @author $Author: hubaiqing $
 * @version $Revision: 1.1.1.1 $ $Date: 2008/01/11 08:49:24 $
 */

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

public class T52_def_tempActionForm extends ActionForm
{

	private String templatekey			= "";				// ģ�����
	private String templatename			= "";				// ģ������
	private String des					= "";				// ����
	private String granularity			= "";				// ����	1:�գ�4:�£�5:����6:����7����
	private String flag					= "";				// �Ƿ�����(0:��  1����
	private String tag					= "";				// 0:��  1����
	private String modify_user			= "";				// �޸���
	private String modify_dt			= "";				// �޸�����
	private String create_user			= "";				// ������
	private String create_dt			= "";				// ��������
	private String create_org			= "";				// ��������
	private String is_build				= "";				// �Ƿ��ڽ�
	private String coverflag			= "";				// �Ƿ񸲸�
	private Integer calculateseq		= new Integer(0);	// ģ��ļ���˳��
	private String calculateseq_str		= "";
	private String matchcondition		= "";				// ƥ������ ���json����
	private String sqlkey				= "";				// ����
	private String[] sqlkeys				;
	private String sqlgranularity		= "";				// sqlִ������
	private String sqlgranularity_disp 	= "";
	private String roster_table			= "";				// ���ݱ���
	private String datagranularity		= "";				// ��������
	private String sql_str				= "";				// ִ��sql
	private String calsql				= "";				// ����˳��
	private String party_class_cd		= "";				// 'C:�Թ� I:��˽'
	private String moduletype			= "";				// ģ������ 0������ģ��1������ģ��
	private String moduletype_disp		= "";
	
	
	
	
	
	/** ģ��������� */
	
	private String card_no				= "";				// ֤����
	private String name					= "";				// ����
	private String country_cd			= "";				// ����
	
	/** ģ�����ƣ���ѯר�� */
	private String templatename_s 		= "";
	private String create_dt_start 		= "";
	private String create_dt_end 		= "";
	private String datagranularity_disp	= "";

	/** ��ѡ */
	private String[] templatekeys;

	// =======================================================
	/**
	 * ���캯��
	 */
	public T52_def_tempActionForm()
	{
	}

	public Integer getCalculateseq()
	{
		return calculateseq;
	}

	public void setCalculateseq(Integer calculateseq)
	{
		this.calculateseq = calculateseq;
	}

	public String getCalculateseq_str()
	{
		return calculateseq_str;
	}

	public void setCalculateseq_str(String calculateseqStr)
	{
		calculateseq_str = calculateseqStr;
	}

	public void setCreate_org(String create_orgStr)
	{
		this.create_org = create_orgStr;
	}

	public String getCreate_org()
	{
		return this.create_org;
	}

	public void setTemplatekey(String templatekeyStr)
	{
		this.templatekey = templatekeyStr;
	}

	public String getTemplatekey()
	{
		return this.templatekey;
	}

	public void setSqlgranularity(String sqlgranularityStr)
	{
		this.sqlgranularity = sqlgranularityStr;
	}

	public String getSqlgranularity()
	{
		return this.sqlgranularity;
	}

	public String getSqlgranularity_disp()
	{
		return sqlgranularity_disp;
	}

	public void setSqlgranularity_disp(String sqlgranularityDisp)
	{
		sqlgranularity_disp = sqlgranularityDisp;
	}

	

	public void setGranularity(String granularityStr)
	{
		this.granularity = granularityStr;
	}

	public String getGranularity()
	{
		return this.granularity;
	}

	public void setFlag(String flagStr)
	{
		this.flag = flagStr;
	}

	public String getFlag()
	{
		return this.flag;
	}

	public void setIs_build(String is_buildStr)
	{
		this.is_build = is_buildStr;
	}

	public String getIs_build()
	{
		return this.is_build;
	}

	public String getCoverflag()
	{
		return coverflag;
	}

	public void setCoverflag(String coverflag)
	{
		this.coverflag = coverflag;
	}

	public void setTag(String tagStr)
	{
		this.tag = tagStr;
	}

	public String getTag()
	{
		return this.tag;
	}

	public void setModify_user(String modify_userStr)
	{
		this.modify_user = modify_userStr;
	}

	public String getModify_user()
	{
		return this.modify_user;
	}

	public void setCreate_user(String create_userStr)
	{
		this.create_user = create_userStr;
	}

	public String getCreate_user()
	{
		return this.create_user;
	}

	public void setTemplatename(String templatenameStr)
	{
		this.templatename = templatenameStr;
	}

	public String getTemplatename()
	{
		return this.templatename;
	}

	public String getTemplatename_s()
	{
		return templatename_s;
	}

	public void setTemplatename_s(String templatenameS)
	{
		templatename_s = templatenameS;
	}

	public void setCreate_dt(String create_dtStr)
	{
		this.create_dt = create_dtStr;
	}

	public String getCreate_dt()
	{
		return this.create_dt;
	}

	public String getCreate_dt_start()
	{
		return create_dt_start;
	}

	public void setCreate_dt_start(String createDtStart)
	{
		create_dt_start = createDtStart;
	}

	public String getCreate_dt_end()
	{
		return create_dt_end;
	}

	public void setCreate_dt_end(String createDtEnd)
	{
		create_dt_end = createDtEnd;
	}

	public void setModify_dt(String modify_dtStr)
	{
		this.modify_dt = modify_dtStr;
	}

	public String getModify_dt()
	{
		return this.modify_dt;
	}

	public String getDatagranularity()
	{
		return datagranularity;
	}

	public void setDatagranularity(String datagranularity)
	{
		this.datagranularity = datagranularity;
	}

	public void setDes(String desStr)
	{
		this.des = desStr;
	}

	public String getDes()
	{
		return this.des;
	}

	public String[] getTemplatekeys()
	{
		return templatekeys;
	}

	public void setTemplatekeys(String[] templatekeys)
	{
		this.templatekeys = templatekeys;
	}

	public String getSqlkey()
	{
		return sqlkey;
	}

	public void setSqlkey(String sqlkey)
	{
		this.sqlkey = sqlkey;
	}

	public String[] getSqlkeys()
	{
		return sqlkeys;
	}

	public void setSqlkeys(String[] sqlkeys)
	{
		this.sqlkeys = sqlkeys;
	}

	// =======================================================
	// =======================================================
	public ActionErrors validate(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest)
	{
		/** @todo: finish this method, this is just the skeleton. */
		return null;
	}

	public void reset(ActionMapping actionMapping,
			HttpServletRequest httpServletRequest)
	{
	}



	public String getMatchcondition()
	{
		return matchcondition;
	}



	public void setMatchcondition(String matchcondition)
	{
		this.matchcondition = matchcondition;
	}



	public String getRoster_table()
	{
		return roster_table;
	}



	public void setRoster_table(String roster_table)
	{
		this.roster_table = roster_table;
	}



	public String getSql_str()
	{
		return sql_str;
	}



	public void setSql_str(String sql_str)
	{
		this.sql_str = sql_str;
	}

	public String getCard_no()
	{
		return card_no;
	}

	public void setCard_no(String card_no)
	{
		this.card_no = card_no;
	}


	public String getCalsql()
	{
		return calsql;
	}

	public void setCalsql(String calsql)
	{
		this.calsql = calsql;
	}

	public String getParty_class_cd()
	{
		return party_class_cd;
	}

	public void setParty_class_cd(String party_class_cd)
	{
		this.party_class_cd = party_class_cd;
	}

	public String getDatagranularity_disp()
	{
		return datagranularity_disp;
	}

	public void setDatagranularity_disp(String datagranularity_disp)
	{
		this.datagranularity_disp = datagranularity_disp;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getCountry_cd()
	{
		return country_cd;
	}

	public void setCountry_cd(String country_cd)
	{
		this.country_cd = country_cd;
	}

	public String getModuletype()
	{
		return moduletype;
	}

	public void setModuletype(String moduletype)
	{
		this.moduletype = moduletype;
	}

	public String getModuletype_disp()
	{
		if("0".equals(moduletype))
		{
			return "����ģ��";
		} else if ("1".equals(moduletype))
		{
			return "����ģ��";
		}
		return moduletype_disp;
	}

	public void setModuletype_disp(String moduletype_disp)
	{
		this.moduletype_disp = moduletype_disp;
	}

	
}
