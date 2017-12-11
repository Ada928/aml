package com.ist.server.cal.aml.mfa;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.HashMap;

import org.apache.log4j.Logger;

import com.ist.common.LogUtils;
import com.ist.server.cal.BaseCalTask;
import com.ist.server.cal.aml.Case.bo.CaseBeforeBO;
import com.ist.server.dto.T18_task_fact;

public class CalMfaNew extends BaseCalTask {

	private static Logger logger = LogUtils.getLogger(CalMfaNew.class.getName());
	private String statisticdate = "";
	private MfaDaoNew mfaDaoNew = new MfaDaoNew();

	public CalMfaNew(T18_task_fact t18TaskFact) {
		super(t18TaskFact);
	}

	@Override
	public boolean preTask(Connection conn) throws Exception {
		boolean isSucc = true;
		
		statisticdate = this.t18_task_fact.getStatisticdate();

		return isSucc;
	}

	@Override
	public boolean calTask(Connection conn) throws Exception {
		boolean isSucc = true;

		try {
			isSucc = createFundNetwork(conn);
		}
		catch (Exception e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSucc = false;
			throw e;
		}

		return isSucc;
	}

	/**
	 * �����ʽ�����
	 *
	 * 2015-07-29 �Ż��ʽ������㷨
	 */
	private boolean createFundNetwork(Connection conn) throws Exception {
		boolean isSucc = false;

		logger.info("��ʼ�����ʽ����� ");

		// ��ȡ���ݿ����ã��Ƿ�ϲ�֮ǰ����������
		String alertDay = "0";
		CaseBeforeBO beforeBo = new CaseBeforeBO();
		HashMap paraMap = beforeBo.getNetPara(conn);
		if (paraMap.get("1003") != null) {
			alertDay = (String) paraMap.get("1003");
		}

		logger.info("�����м����Ľ��� ");
		mfaDaoNew.insertT47_transaction_mfa_d(conn, statisticdate);
		conn.commit();

		// ����ȥ��:
		// 1.�� A->B �� B->A ����һ����¼
		// 2.����� A->B ����һ����¼
		logger.info("����ת�˽�������ȥ�� ");
		mfaDaoNew.insertM47_transaction_d_acct(conn);
		conn.commit();

		// ������ʼ����:
		// 1.���巽���ֶ��
		// 2.���ַ����ֶ��
		// 3.�����������֮��
		logger.info("������ʼ���� ");
		mfaDaoNew.insertTmp_net_acct_muti(conn);
		conn.commit();

		// ������������ϵ
		logger.info("������������ϵ ");
		mfaDaoNew.insertTmp_net_acct(conn);
		conn.commit();

		// �ϲ�֮ǰ����������
		if (!"0".equals(alertDay)) {
			logger.info("д��֮ǰ��������������ϵ ");
			mfaDaoNew.insertTmp_net_acctKeep(conn);
			conn.commit();
		}

		// �ϲ�����
		logger.info("�ϲ����� ");
		mfaDaoNew.mergeNet(conn, statisticdate);
		conn.commit();

		logger.info("���뵱��ϲ������� ");
		mfaDaoNew.insertM13_net_acct_day(conn, statisticdate);
		conn.commit();

		logger.info("���뵱�������еĽ��� ");
		mfaDaoNew.insertM13_net_trans_day(conn);
		conn.commit();

		logger.info("------------------�ʽ�����������------------------");

		// ��������Ԥ���ͻ�
		mfaDaoNew.insertT27_alert_party_temp_new(conn, statisticdate); // --------����Ԥ��������ɸѡ
		conn.commit();

		isSucc = true;

		return isSucc;
	}

	@Override
	public boolean delTask(Connection conn) throws Exception {
		boolean isSucc = true;
		try {
			mfaDaoNew.reCal(conn, this.t18_task_fact.getStatisticdate());

		}
		catch (SQLException e) {
			e.printStackTrace();
			logger.error(e.getMessage());
			isSucc = false;
			throw e;
		}
		return isSucc;
	}

	@Override
	public boolean finalTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean finalSubTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean isCanExec(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public boolean preSubTask(Connection arg0) throws Exception {
		return true;
	}

	@Override
	public void init() {

	}

}
