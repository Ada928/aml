package com.ist.server.cal.aml.dowjons;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.common.util.DateUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.dowjons.bo.RunCustRemount;
import com.ist.server.cal.aml.dowjons.dao.T52_B_DefTempDAO;
import com.ist.server.cal.aml.dowjons.dto.T52_b_midDTO;
import com.ist.server.dto.T18_task_fact;

/**
 * ����˹��������
 * @author liuzp
 *
 */
public class CreateCustRemountListUpdate extends BaseCalTask
{
	private static Logger logger = LogUtils.getLogger(CalT52_B_DJ_Sql.class.getName());		// ��¼��־
	
	private ExecutorService threadPool;														// ���߳��̳߳�
	private static final int validate_thread_number	= 50;									// ÿ���̴߳����������
	public T18_task_fact t18_task_fact = new T18_task_fact();
	
	
	public CreateCustRemountListUpdate(T18_task_fact t18_task_fact)
	{
		super(t18_task_fact);
		this.t18_task_fact = t18_task_fact;
	}

	@Override
	public void init()
	{
		
		
	}

	@Override
	public boolean isCanExec(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean delTask(Connection conn) throws Exception
	{
		T52_B_DefTempDAO t52_b_defTempDAO = new T52_B_DefTempDAO();
		t52_b_defTempDAO.deleteT52_b_remount(conn);
		return false;
	}

	@Override
	public boolean preTask(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean calTask(Connection conn) throws Exception
	{
		//  ��ѯ�ͻ������̳߳ش�С, ��t00_system_param���л�ȡ
		String size = "20";
		
		/* 1. �������߳� */ 
		threadPool = Executors.newFixedThreadPool(Integer.parseInt(size));
		
		String statisticdate = this.t18_task_fact.getStatisticdate();
		String granularity = this.t18_task_fact.getGranularity();
		
		int pageSize = 2000;
		int intPage = 1;
		T52_B_DefTempDAO t52_b_deftempdao = new T52_B_DefTempDAO();
		
		// ��ʼʱ��
//		String beginDate = DateUtils.getBeginDate(granularity, statisticdate);
		
		List<T52_b_midDTO> list = new ArrayList<T52_b_midDTO>();
		HashMap<String, String> matchConditionMap = new HashMap<String, String>();
		matchConditionMap = t52_b_deftempdao.getT52_b_def_tempMatchCondition(conn);
		Date startDate = new Date();
		/* 2. ѭ����ʼ���� */
		while(true)
		{
			logger.info("��ѯ��������");
			
			
			// 2.1 ��ѯ����t52_b_mid ����Ϣ
			list = t52_b_deftempdao.getT52_b_midList(conn, pageSize, intPage);
			
			
			if (list.size()==0)							// ����ѯ��������Ϣ�������
			{
				Date endDate = new Date();
				threadPool.shutdown();
				long num = DateUtils.diffTwoDate(endDate, startDate);
				logger.info("ִ����������ʱ��"+num);
				break;
				
			} else
			{
				custThread(conn, list, statisticdate, matchConditionMap);
				list.clear();
				intPage++;
			}
		}
		
		
		return true;
	}

	private boolean custThread(Connection conn, List<T52_b_midDTO> detailList,
			String endDate, HashMap<String, String> matchConditionMap) throws Exception
	{
		boolean rs = false;
		
		// ����ÿ�δ�������
		int validate_batch_sum = (int)(Math.ceil(detailList.size() / validate_thread_number));
		
		if (validate_batch_sum == 0)
		{
			validate_batch_sum = 1;
		}
		
		RunCustRemount[] runCustRemount = new RunCustRemount[validate_batch_sum];		// �������߳�
		for (int i = 0; i < validate_batch_sum; i++)
		{
			List<T52_b_midDTO> subDetailList = new ArrayList<T52_b_midDTO>();
			if (i == validate_batch_sum - 1)
			{
				subDetailList = detailList.subList(i * validate_thread_number, detailList.size());
			} else
			{
				subDetailList = detailList.subList(
						(int) (i * validate_thread_number), (i + 1) * validate_thread_number);
			}
			if (subDetailList.size() > 0)
			{
				runCustRemount[i] = new RunCustRemount(detailList, matchConditionMap);
				threadPool.execute(runCustRemount[i]);
			}
		}
		boolean allfinishflag = false;
		boolean flag = false;
		while (!allfinishflag)
		{
			Thread.sleep(5000);
//			logger.info("���ڵȴ������߳����У��...");
			int n = 0;
			for (int i = 0; i < runCustRemount.length; i++)
			{
				flag = runCustRemount[i].isEnd_flag();
//				logger.info("runCustRemount[" + i + "]" + flag);
				if (flag)
				{
					n++;
				}
			}
			if (flag && (n == validate_batch_sum))
			{
				allfinishflag = true;
				rs = true;
			}
		}
		Date threadStartDate = new Date();
		for (int i = 0; i < validate_batch_sum; i++)
		{
			T52_B_DefTempDAO t52_b_defTempDAO = new T52_B_DefTempDAO();
			t52_b_defTempDAO.saveT52_b_remount(conn, runCustRemount[i].getDataMap());
		}
		Date threadEndDate = new Date();
		long num = DateUtils.diffTwoDate(threadEndDate, threadStartDate);
		logger.info("�������ݿ�����ʱ��"+num);
		conn.commit();
		return rs;
		
	}

	@Override
	public boolean finalTask(Connection conn) throws Exception
	{
		
		return true;
	}

	@Override
	public boolean preSubTask(Connection conn) throws Exception
	{
		
		return false;
	}

	@Override
	public boolean finalSubTask(Connection conn) throws Exception
	{
		
		return false;
	}

}
