package com.ist.common.lucene.index.common;

public class IndexConstant {

	/**
	 * ϵͳ�ָ��
	 */
	public static final String SYSTEM_SEPARATOR = System.getProperties().getProperty("file.separator");
	/** ������Դ���ͣ���·���ļ� */
	public static final String INDEX_SOURCE_TYPE_FILE_SINGLE = "file_single";
	/** ������Դ���ͣ���·���ļ� */
	public static final String INDEX_SOURCE_TYPE_FILE_MULTIPLE = "file_multiple";
	/** ������Դ���ͣ��ļ��б� */
	public static final String INDEX_SOURCE_TYPE_FILE_LIST = "file_list";
	/** ������Դ���ͣ��洢���ݿ���������� */
	public static final String INDEX_SOURCE_TYPE_DB_CONTENT = "db_content";
	/** ������Դ���ͣ��洢���ݿ�ĸ��� */
	public static final String INDEX_SOURCE_TYPE_DB_ATTACH = "db_attach";
	/** ������Դ���ͣ��޸��ļ� */
	public static final String INDEX_SOURCE_TYPE_MODIFY_FILE = "modify_file";

	// /** ������ʽ�������� */
	// public static final String INDEX_TYPE_NO = "NO";
	// /** ������ʽ�������� */
	// public static final String INDEX_TYPE_TOKENIZED = "TOKENIZED";
	// /** ������ʽ�������� */
	// public static final String INDEX_TYPE_UN_TOKENIZED = "UN_TOKENIZED";
	//
	//
	// /** �洢��ʽ�����洢 */
	// public static final String STORE_TYPE_NO = "NO";
	// /** �洢��ʽ���洢 */
	// public static final String STORE_TYPE_YES = "YES";
	//

	/** �������ƣ�������ʶ */
	public static final String INDEX_NAME_UID = "uid";

	public static final String INDEX_NAME_PROGRAMAKEY = "programakey";
	/** �������ƣ����� */
	public static final String INDEX_NAME_CONTENT = "content";
	/** �������ƣ�·�� */
	public static final String INDEX_NAME_PATH = "path";
	/** �������ƣ����� */
	public static final String INDEX_NAME_TITLE = "title";
	/** �������ƣ����� */
	public static final String INDEX_NAME_SEQ = "seq";
	/** �������ƣ����ʵ�URL */
	public static final String INDEX_NAME_URL = "url";
	/** �������ƣ����»��ļ�����޸�ʱ�� */
	public static final String INDEX_NAME_MDATE = "mdate";
	/** �������ƣ���ȫ����(�ܼ�) */
	public static final String INDEX_NAME_SECLEVEL = "seclevel";

	/** �Ƿ��ؽ����� */
	public static final boolean IS_REBUILD_INDEX = true;

	/** Ĭ�ϰ�ȫ����(�ܼ�) */
	public static final String DEFAULT_SECLEVEL = "0";

	/** Ĭ�ϵ��ļ�����·�� */
	public static final String DEFAULT_FILE_URL = "/cmp/attachment/t01_attachment_disp.do?attachkey=#uid#";
	public static final String DEFAULT_URL = "/cms/knowledgemanager/t12_knowledge_disp.do?articlekey=#uid#&programakey=#programakey#";

}
