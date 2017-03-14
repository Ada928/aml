package com.ist.aml.report.bo;

import java.util.List;

import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;

/**
 * ��ϴǮ�ϱ������ɰ�����xml�ĵ�
 * <p>
 * Title: INFO SENCE AUDIT SYSTEM
 * </p>
 * <p>
 * Description:
 * </p>
 * <p>
 * Copyright: Copyright (c) 2003 - 2006
 * </p>
 * <p>
 * Company: �����������ڿƼ��������޹�˾
 * </p>
 * 
 * @author �з���
 * @version 1.0
 */
public class ReadXmlBO {
	// �������Ե�ֵ��system_config.xml�ļ���ȡ
	//String reportxmlns = "";

	//String reportxmlnsxsi = "";

	//String feedbackStorepath = "";

	//String version = "";

	//XmlReader xmlReader = null;

	public ReadXmlBO() {
		// �������ļ����xml�ϱ���Ϣ
		// �������ļ����xml�ϱ���Ϣ
		//xmlReader = new XmlReader();
		/*reportxmlns = xmlReader
				.getProperty("business_config.reportXML.reportxmlns");*/
		/*reportxmlnsxsi = xmlReader
				.getProperty("business_config.reportXML.reportxmlnsxsi");*/
		/*feedbackStorepath = xmlReader
				.getProperty("business_config.reportXML.feedbackStorepath");*/
		/*version = xmlReader.getProperty("business_config.reportXML.version");*/

	}

	// �����ļ�������ȡ��ִ�ļ��е�����
	public String readFeedbackBOTest(String xmlFileName) throws Exception {
		SAXBuilder builder = new SAXBuilder();
		Document read_doc = builder.build(xmlFileName);
		Element FDBK = read_doc.getRootElement();

		Element SFID = FDBK.getChild("SFID");
		Element FSNM = FDBK.getChild("FSNM");
		System.out.println(SFID.getName() + ":" + SFID.getText());
		System.out.println(FSNM.getName() + ":" + FSNM.getText());

		return "";
	}

	// �����ļ�������ȡ��ִ�ļ��е�����
	public String readFeedbackBO(String xmlFileName) throws Exception {

		String totel = "+++++++++++";
		//������������׼����xml�ļ����н���
		SAXBuilder builder = new SAXBuilder();
		Document read_doc = builder.build(xmlFileName);
		Element stu = read_doc.getRootElement();

		// �õ��ļ�������ʼλ��
		int lateIndex = xmlFileName.lastIndexOf("/");

		// ���ݻ�ִ�ļ����õ���ִ���ͺͻ�ִ��Ӧ�����ݰ���
		String feedbackType = xmlFileName.substring(lateIndex + 1,
				lateIndex + 5);
		/*		String packetName = xmlFileName.substring(lateIndex + 5);
		*/

		//��ִ�ļ��ĸ��ڵ�
		List list1 = stu.getChildren();
		Element FDBKElement = (Element) list1.get(0);
		System.out.println(FDBKElement.getName() + ":" + FDBKElement.getText());
		List FDBKChildlist = FDBKElement.getChildren();

		//���ݲ�ͬ�Ļ�ִ�ļ����Ͷ����в�ͬ�Ľ���
		if (feedbackType.equalsIgnoreCase("FDSC")) { // ������ȷ���͵Ļ�ִ�ļ�		
			//������ȷ������ʶ
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			/*			String SFID = SFIDElement.getText();*/
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//�ɹ����͵��ļ���
			Element FSNMElement = (Element) FDBKChildlist.get(1);
			System.out.println(FSNMElement.getName() + ""
					+ FSNMElement.getText());

		} else if (feedbackType.equalsIgnoreCase("FDNF")) {// �����ļ�������Ļ�ִ�ļ�			
			//������ȷ������ʶ
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//��������
			Element ERTNElement = (Element) FDBKChildlist.get(1);
			System.out.println(ERTNElement.getName() + ":"
					+ ERTNElement.getText());

			//�ļ����ƴ�������
			Element NMERsElement = (Element) FDBKChildlist.get(2);
			System.out.println(NMERsElement.getName() + ":"
					+ NMERsElement.getText());

			//�ļ����ƴ�����Ϣ			
			List NMERList = NMERsElement.getChildren();
			for (int i = 0; i < NMERList.size(); i++) //ѭ����λÿ�������ļ���Ϣ
			{
				Element NMERElement = (Element) NMERList.get(i);

				//�����ļ����
				String NMERSeq = NMERElement.getAttributeValue("seqno");
				System.out.println("�����ļ����:" + NMERSeq);

				//�����ļ�����
				List NMERChildList = NMERElement.getChildren();
				Element EFNMElement = (Element) NMERChildList.get(0);
				System.out.println(EFNMElement.getName() + ":"
						+ EFNMElement.getText());

				//����ԭ��
				Element ERRSElement = (Element) NMERChildList.get(1);
				System.out.println(ERRSElement.getName() + ":"
						+ ERRSElement.getText());

			}

		} else if (feedbackType.equalsIgnoreCase("FDCF")) {// �����ļ����ݴ���Ļ�ִ�ļ�
			//������ȷ������ʶ
			Element SFIDElement = (Element) FDBKChildlist.get(0);
			System.out.println(SFIDElement.getName() + ":"
					+ SFIDElement.getText());

			//��������
			Element EFTNElement = (Element) FDBKChildlist.get(1);
			System.out.println(EFTNElement.getName() + ":"
					+ EFTNElement.getText());

			//�����ļ�����
			Element ERFLsElement = (Element) FDBKChildlist.get(2);
			System.out.println(ERFLsElement.getName() + ":"
					+ ERFLsElement.getText());

			//�ļ����ƴ�����Ϣ			
			List ERFLList = ERFLsElement.getChildren();
			for (int i = 0; i < ERFLList.size(); i++) //ѭ����λÿ�������ļ���Ϣ
			{
				Element ERFLElement = (Element) ERFLList.get(i);

				//�����ļ����
				String ERFLSeq = ERFLElement.getAttributeValue("seqno");
				System.out.println("�����ļ����:" + ERFLSeq);

				List ERFLChildList = ERFLElement.getChildren();

				//�����ļ�����
				Element EFNMElement = (Element) ERFLChildList.get(0);
				System.out.println(EFNMElement.getName() + ":"
						+ EFNMElement.getText());

				//���ļ���������
				Element ERTNElement = (Element) ERFLChildList.get(1);
				System.out.println(ERTNElement.getName() + ":"
						+ ERTNElement.getText());

				//�ļ����ݴ�������
				Element FCERsList = (Element) ERFLChildList.get(2);
				System.out.println(FCERsList.getName() + ":"
						+ FCERsList.getText());

				List FCERList = FCERsList.getChildren();
				for (int j = 0; j < FCERList.size(); j++) //ѭ����λ���ļ���ÿ��������Ϣ
				{
					Element FCERElement = (Element) FCERList.get(j);

					//���ļ��д����������
					String FCERSeq = FCERElement.getAttributeValue("seqno");
					System.out.println("�����ļ����:" + FCERSeq);

					List FCERChildList = FCERElement.getChildren();
					//����λ
					Element ERLCElement = (Element) FCERChildList.get(0);
					System.out.println(ERLCElement.getName() + ":"
							+ ERLCElement.getText());

					//����ԭ��
					Element ERRSElement = (Element) FCERChildList.get(1);
					System.out.println(ERRSElement.getName() + ":"
							+ ERRSElement.getText());
				}
			}
		} else {
			//����������͵Ļ�ִ���ߴ�����
		}
		return totel;
	}

	public static void main(String args[]) throws Exception {
		ReadXmlBO readXmlBO = new ReadXmlBO();
		readXmlBO
				.readFeedbackBOTest("D:/report/feedbackXML/20070322/FDSCNBH999999999999999-20070411-0002.xml");
	}
}
