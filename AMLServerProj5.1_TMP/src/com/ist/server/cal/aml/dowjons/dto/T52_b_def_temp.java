package com.ist.server.cal.aml.dowjons.dto;

import com.ist.common.base.BaseDTO;

public class T52_b_def_temp extends BaseDTO
{
	
	private static final long serialVersionUID = 6147209401981503387L;
	
	
	private String templatekey			= "";				// ģ�����
	private String templatename			= "";				// ģ������
	private String des					= "";				// ����
	private String granularity			= "";				// ����	1:�գ�4:�£�5:����6:����7����
	private String granularity_disp 	= "";
	private String flag					= "";				// �Ƿ�����(0:��  1����
	private String tag					= "";				// 0:��  1����
	private String modify_user			= "";				// �޸���
	private String modify_dt			= "";				// �޸�����
	private String create_user			= "";				// ������
	private String create_dt			= "";				// ��������
	private String create_org			= "";				// ��������
	private String is_build				= "";				// �Ƿ��ڽ�
	private String coverflag			= "";				// �Ƿ񸲸�
	private String matchcondition		= "";				// ƥ������ ���json����
	private String sqlkey				= "";				// 
	private String sqlgranularity		= "";				// sqlִ������
	private String roster_table			= "";				// ���ݱ���
	private String datagranularity		= "";				// ��������
	private String sql_str				= "";				// ִ��sql
	private String calsql				= "";				// ����˳��
	private String moduletype			= "";				// ģ������ 0������ģ��1������ģ��
	
	public String getTemplatekey()
	{
		return templatekey;
	}
	public void setTemplatekey(String templatekey)
	{
		this.templatekey = templatekey;
	}
	public String getTemplatename()
	{
		return templatename;
	}
	public void setTemplatename(String templatename)
	{
		this.templatename = templatename;
	}
	public String getDes()
	{
		return des;
	}
	public void setDes(String des)
	{
		this.des = des;
	}
	public String getGranularity()
	{
		return granularity;
	}
	public void setGranularity(String granularity)
	{
		this.granularity = granularity;
	}
	public String getFlag()
	{
		return flag;
	}
	public void setFlag(String flag)
	{
		this.flag = flag;
	}
	public String getTag()
	{
		return tag;
	}
	public void setTag(String tag)
	{
		this.tag = tag;
	}
	public String getModify_user()
	{
		return modify_user;
	}
	public void setModify_user(String modify_user)
	{
		this.modify_user = modify_user;
	}
	public String getModify_dt()
	{
		return modify_dt;
	}
	public void setModify_dt(String modify_dt)
	{
		this.modify_dt = modify_dt;
	}
	public String getCreate_user()
	{
		return create_user;
	}
	public void setCreate_user(String create_user)
	{
		this.create_user = create_user;
	}
	public String getCreate_dt()
	{
		return create_dt;
	}
	public void setCreate_dt(String create_dt)
	{
		this.create_dt = create_dt;
	}
	public String getCreate_org()
	{
		return create_org;
	}
	public void setCreate_org(String create_org)
	{
		this.create_org = create_org;
	}
	public String getIs_build()
	{
		return is_build;
	}
	public void setIs_build(String is_build)
	{
		this.is_build = is_build;
	}
	public String getCoverflag()
	{
		return coverflag;
	}
	public void setCoverflag(String coverflag)
	{
		this.coverflag = coverflag;
	}
	
	public String getSqlkey()
	{
		return sqlkey;
	}
	public void setSqlkey(String sqlkey)
	{
		this.sqlkey = sqlkey;
	}
	public String getSqlgranularity()
	{
		return sqlgranularity;
	}
	public void setSqlgranularity(String sqlgranularity)
	{
		this.sqlgranularity = sqlgranularity;
	}
	public String getRoster_table()
	{
		return roster_table;
	}
	public void setRoster_table(String roster_table)
	{
		this.roster_table = roster_table;
	}
	public String getDatagranularity()
	{
		return datagranularity;
	}
	public void setDatagranularity(String datagranularity)
	{
		this.datagranularity = datagranularity;
	}
	public String getSql_str()
	{
		return sql_str;
	}
	public void setSql_str(String sql_str)
	{
		this.sql_str = sql_str;
	}
	public String getGranularity_disp()
	{
		return granularity_disp;
	}
	public void setGranularity_disp(String granularity_disp)
	{
		this.granularity_disp = granularity_disp;
	}
	public String getMatchcondition()
	{
		return matchcondition;
	}
	public void setMatchcondition(String matchcondition)
	{
		this.matchcondition = matchcondition;
	}
	public String getCalsql()
	{
		return calsql;
	}
	public void setCalsql(String calsql)
	{
		this.calsql = calsql;
	}
	public String getModuletype()
	{
		return moduletype;
	}
	public void setModuletype(String moduletype)
	{
		this.moduletype = moduletype;
	}
	
}
