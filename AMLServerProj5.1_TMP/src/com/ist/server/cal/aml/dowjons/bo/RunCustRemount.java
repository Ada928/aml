package com.ist.server.cal.aml.dowjons.bo;

import ibp.common.search.utils.page.PageInfo;
import ibp.ioc.service.EsSearchService;
import ibp.ioc.service.QueryBuilderImpl;
import ibp.ioc.service.search.SearchParameter;
import ibp.ioc.service.search.es.AnalyzerFields;
import ibp.ioc.service.search.es.QueryFields;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.aml.dowjons.dto.T52_b_midDTO;

public class RunCustRemount implements Runnable
{
	private static Logger logger = LogUtils.getLogger(RunCustRemount.class.getName());
	
	private List<T52_b_midDTO> detailList;
	private HashMap<String, String> matchConditionMap;
	private Map<String, List<Map<String, String>>> dataMap;
	private boolean end_flag = false;
	
	public RunCustRemount(List<T52_b_midDTO> detailList,  HashMap<String, String> matchConditionMap)
	{
		this.detailList = detailList;
		this.matchConditionMap = matchConditionMap;
	}
	
	
	public void run()
	{
		dataMap = new HashMap<String, List<Map<String, String>>>(); // ��ʼ����������
		// ���������������ݽ���ƥ��
		logger.info("��ʼƥ��");
		// ���ò�ѯ����
		SearchParameter searchParameter = new SearchParameter();
		// ��������
		searchParameter.setIndex("aml2");
		// ��������
		searchParameter.setType("test2");
//		// ��ǰҳ
//		searchParameter.setPageNow(1);
		// ҳ��С
		searchParameter.setPageSize(100);
		
		List<String> queryFields = new ArrayList<String>();
		// ������ȫƥ��
		for (Entry<String, String> entry : matchConditionMap.entrySet()) 
		{
			logger.info("Key = " + entry.getKey() + ", Value = " + entry.getValue()); 
			if (entry.getValue().equalsIgnoreCase("true"))
			{
				queryFields.addAll(QueryFields.getFields(entry.getKey().toUpperCase(),
						AnalyzerFields.PROTOTYPE));
			}
		}
		searchParameter.setQueryFields(queryFields);
		for (T52_b_midDTO t52_b_midDTO : detailList)
		{
			
			
			// ���ö���ֶβ�ѯ����
			Map<String, Object> multiFieldValueMap = new HashMap<String, Object>();
			multiFieldValueMap.put("ENNAMECONTENT", t52_b_midDTO.getEnnamecontent());
			multiFieldValueMap.put("CNNAMEINDEX", t52_b_midDTO.getCnnameindex());
			multiFieldValueMap.put("ID", t52_b_midDTO.getId());
			searchParameter.setMultiFieldValueMap(multiFieldValueMap);
			
			EsSearchService esSearchService = new EsSearchService();
			try
			{
				// ��ѯ���
				PageInfo<Map<String, String>> documentSearch = esSearchService.documentSearch(searchParameter, new QueryBuilderImpl());
				 
				logger.info("ƥ������"+documentSearch.getRows());
				 dataMap.put(t52_b_midDTO.getId(), documentSearch.getRows());
				
			
			} catch (Exception e)
			{
				e.printStackTrace();
				logger.error(e);
				end_flag = true;
			}
		}
			
		end_flag = true;
		
		
	}



	public List<T52_b_midDTO> getDetailList()
	{
		return detailList;
	}


	public void setDetailList(List<T52_b_midDTO> detailList)
	{
		this.detailList = detailList;
	}


	public HashMap<String, String> getMatchConditionMap()
	{
		return matchConditionMap;
	}


	public void setMatchConditionMap(HashMap<String, String> matchConditionMap)
	{
		this.matchConditionMap = matchConditionMap;
	}




	public boolean isEnd_flag()
	{
		return end_flag;
	}


	public void setEnd_flag(boolean end_flag)
	{
		this.end_flag = end_flag;
	}


	public Map<String, List<Map<String, String>>> getDataMap()
	{
		return dataMap;
	}


	public void setDataMap(Map<String, List<Map<String, String>>> dataMap)
	{
		this.dataMap = dataMap;
	}


	


	


	



}
