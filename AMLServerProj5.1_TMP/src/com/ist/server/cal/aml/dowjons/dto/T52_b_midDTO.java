package com.ist.server.cal.aml.dowjons.dto;

import com.ist.common.base.BaseDTO;

/**
 * ����˹�����м��DTO
 * 
 * @author liuzp
 *
 */
public class T52_b_midDTO extends BaseDTO
{
	
	private static final long serialVersionUID = -5545146367555683299L;
	
	private String id					= ""; 	// ������Ψһ��ʶ��
	private String ennamecontent		= ""; 	// Ӣ����
	private String cnnameindex			= "";	// ������
	
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getEnnamecontent()
	{
		return ennamecontent;
	}
	public void setEnnamecontent(String ennamecontent)
	{
		this.ennamecontent = ennamecontent;
	}
	public String getCnnameindex()
	{
		return cnnameindex;
	}
	public void setCnnameindex(String cnnameindex)
	{
		this.cnnameindex = cnnameindex;
	}
	@Override
	public String toString()
	{
		return "T52_b_midDTO [id=" + id + ", ennamecontent=" + ennamecontent
				+ ", cnnameindex=" + cnnameindex + "]";
	}
	
}
