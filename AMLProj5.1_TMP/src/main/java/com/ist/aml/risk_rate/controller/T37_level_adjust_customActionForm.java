package com.ist.aml.risk_rate.controller;

import org.apache.struts.action.ActionForm;

public class T37_level_adjust_customActionForm extends ActionForm {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	//��������
	private String organ_name;
	//��������
	private String statistic_dt_disp = "";
	private String statistic_dt_disp_end = "";
	//�����ȼ�
	private String fristappralevel = "";
	//���յȼ�
	private String levelkey = "";
	//�������
	private String tempcategory = "";
	

	public String getOrgan_name() {
		return organ_name;
	}

	public void setOrgan_name(String organ_name) {
		this.organ_name = organ_name;
	}

	public String getStatistic_dt_disp() {
		return statistic_dt_disp;
	}

	public void setStatistic_dt_disp(String statistic_dt_disp) {
		this.statistic_dt_disp = statistic_dt_disp;
	}

	public String getStatistic_dt_disp_end() {
		return statistic_dt_disp_end;
	}

	public void setStatistic_dt_disp_end(String statistic_dt_disp_end) {
		this.statistic_dt_disp_end = statistic_dt_disp_end;
	}

	public String getFristappralevel() {
		return fristappralevel;
	}

	public void setFristappralevel(String fristappralevel) {
		this.fristappralevel = fristappralevel;
	}

	public String getLevelkey() {
		return levelkey;
	}

	public void setLevelkey(String levelkey) {
		this.levelkey = levelkey;
	}

	public String getTempcategory() {
		return tempcategory;
	}

	public void setTempcategory(String tempcategory) {
		this.tempcategory = tempcategory;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "T37_level_adjust_customActionForm [organ_name=" + organ_name + ", statistic_dt_disp="
				+ statistic_dt_disp + ", statistic_dt_disp_end=" + statistic_dt_disp_end + ", fristappralevel="
				+ fristappralevel + ", levelkey=" + levelkey + ", tempcategory=" + tempcategory + "]";
	}
	
}
