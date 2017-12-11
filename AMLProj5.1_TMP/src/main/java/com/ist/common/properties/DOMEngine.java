package com.ist.common.properties;

//JAVA������
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.List;

import org.apache.xerces.parsers.DOMParser;
import org.apache.xml.serialize.OutputFormat;
import org.apache.xml.serialize.XMLSerializer;
import org.springframework.core.io.Resource;
import org.w3c.dom.Attr;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Entity;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;
import org.xml.sax.SAXException;

/**
 * <p>
 * Title: �ṩXML DOM�����Ĺ�����̬����
 * </p>
 * <p>
 * Description: ����APACHE XERCES������
 * </p>
 * <p>
 * Copyright: Copyright (c) 2001
 * </p>
 * <p>
 * Company:
 * </p>
 * 
 * @author
 * @version 1.0
 */
public class DOMEngine {
    private Resource configLocation     = null;
    private Resource[] configLocations     = null;
    private List     configLocationList = null;

    /**
     * ����һ���ĵ���Document��
     * 
     * @return Document
     */
    public static Document createDocument() {
        Document commonRoot = null;
        try {
            commonRoot = (Document) Class.forName(
                    "org.apache.xerces.dom.DocumentImpl").newInstance();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return commonRoot;
    }

    /**
     * �ڽڵ㣨Node���´���һ��Ԫ�أ�Element��
     * 
     * @param node
     *            ��ǰ�ڵ�
     * @param elemName
     *            Ԫ����
     * @param elemValue
     *            Ԫ��ֵ
     * @return Element
     */
    public static Element createElement(Node node, String elemName,
            String elemValue) {
        Document doc = node.getOwnerDocument();
        Element elem = doc.createElement(elemName);
        Node textnode = doc.createTextNode(elemName);
        textnode.setNodeValue(elemValue);
        elem.appendChild(textnode);
        node.appendChild(elem);
        return elem;
    }

    /**
     * �ڽڵ㣨Node���´���һ����Ԫ�أ�Element��
     * 
     * @param node
     *            ��ǰ�ڵ�
     * @param elemName
     *            Ԫ����
     * @return Element
     */
    public static Element createElement(Node node, String elemName) {
        Document doc = node.getOwnerDocument();
        Element elem = doc.createElement(elemName);
        node.appendChild(elem);
        return elem;
    }

    /**
     * ���ĵ���Document���´���һ���յĸ�Ԫ�أ�Element��
     * 
     * @param doc
     *            �ĵ����
     * @param rootName
     *            ��Ԫ����
     * @return Element
     */
    public static Element createRootElement(Document doc, String rootName) {
        Element elem = doc.createElement(rootName);
        doc.appendChild(elem);
        return elem;
    }

    /**
     * ͨ�����ڵ�ȡ��Ԫ��ֵ
     * 
     * @param parent
     *            ���ڵ�
     * @param tagname
     *            Ԫ������
     * @return Ԫ��ֵ
     */
    public static String getTextByTagName(Element parent, String tagname) {
        try {
            NodeList list = parent.getElementsByTagName(tagname);
            if (list == null)
                return null;
            Element element = (Element) list.item(0);
            Node textnode = element.getFirstChild();
            return textnode.getNodeValue();
        } catch (Exception e) {
            return "";
        }
    }

    /**
     * ���ĵ���Document���´���һ����Ԫ�أ�Element��
     * 
     * @param doc
     *            �ĵ����
     * @param rootName
     *            ��Ԫ����
     * @param rootValue
     *            ��Ԫ��ֵ
     * @return Element
     */
    public static Element createRootElement(Document doc, String rootName,
            String rootValue) {
        Element elem = doc.createElement(rootName);
        Node textnode = doc.createTextNode(rootName);
        textnode.setNodeValue(rootValue);
        elem.appendChild(textnode);
        doc.appendChild(elem);
        return elem;
    }

    /**
     * ��ĳԪ�أ�Element���´���һ�����ԣ�Attribute��
     * 
     * @param elem
     *            Ԫ��
     * @param attrName
     *            ������
     * @param attrValue
     *            ����ֵ
     */
    public static void createAttribute(Element elem, String attrName,
            String attrValue) {
        Document doc = elem.getOwnerDocument();
        Attr attr = doc.createAttribute(attrName);
        attr.setNodeValue(attrValue);
        elem.setAttribute(attr.getNodeName(), attr.getNodeValue());
    }

    /**
     * ��XML�ļ�������DOM����
     * 
     * @param sDocName
     *            xml�ļ��ľ���·��
     * @return Document
     */
    public static Document parseDoc(String sDocName) {
        Document theDocument = null;
        DOMParser parser = new DOMParser();
        try {
            parser.setFeature("http://xml.org/sax/features/validation", false);
            parser.parse(sDocName.trim());
        } catch (SAXException se) {
            se.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        theDocument = parser.getDocument();
        return (theDocument);
    }

    /**
     * ��XML������ļ�
     * 
     * @param doc
     *            DOM����
     * @param fileName
     *            xml�ļ��ľ���·��
     */
    public static void dispDoc(Document doc, String fileName)throws Exception {
        PrintWriter xmlout = null;
        try {
             xmlout = new PrintWriter(new FileWriter(fileName));
            XMLSerializer xl = new XMLSerializer(xmlout, new OutputFormat(doc,
                    "UTF-8", true));
            xl.serialize(doc);
          

        } catch (Exception e) {
            e.printStackTrace();
        }finally{
        	if(xmlout!=null){
        		  xmlout.close();
        	}
        }
    }

    /**
     * ��XML�������׼��������ڵ���
     * 
     * @param doc
     *            DOM����
     */
    public static void dispDoc(Document doc) {
        try {
            XMLSerializer xl1 = new XMLSerializer(System.out, new OutputFormat(
                    doc, "GBK", true));
            xl1.serialize(doc);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * ��ȡNode�ڵ��µ�һ����ǩΪtagName������ڵ��Ԫ��ֵ
     * 
     * @param node
     *            ��ǰ�ڵ�
     * @param name
     *            Ҫ����Ԫ�صı�ǩ��
     * @return String Ԫ��ֵ
     */
    public static String getTextFromNodeChild(Node node, String name) { // 1+
        String retStr = null;
        if (node != null) { // 2+
            NodeList nodeList = node.getChildNodes();
            if (nodeList != null) { // 3+
                for (int i = 0; i < nodeList.getLength(); i++) { // 4+
                    Node childNode = nodeList.item(i);
                    if (childNode.getNodeName().equals(name)) { // 5+
                        retStr = getTextFromNode(childNode);
                        return retStr;
                    } // 5-
                    else {
                        retStr = getTextFromNodeChild(childNode, name);
                    }
                } // 4-
            } // 3-
        } // 2-
        return retStr;
    } // 1-

    /**
     * ��ȡ��ǰ�ڵ㣨node����Ԫ��ֵ�������ǵ�Entity�������
     * 
     * @param node
     *            ��ǰ�ڵ�
     * @return String Ԫ��ֵ
     */
    public static String getTextFromNode(Node node) { // 1+
        StringBuffer returnStr = new StringBuffer();
        NodeList nodeList = node.getChildNodes();
        if (nodeList != null) { // 2+
            for (int i = 0; i < nodeList.getLength(); i++) { // 3+
                Node childNode = nodeList.item(i);
                switch (childNode.getNodeType()) { // 4+
                    case Node.TEXT_NODE:
                        returnStr.append(childNode.getNodeValue());
                        break;
                    case Node.ENTITY_NODE:
                        returnStr.append(getTextFromEntity((Entity) childNode));
                        break;
                } // 4-
            } // 3-
        } // 2-
        else { // 2+
            returnStr.setLength(0);
        } // 2-
        return returnStr.toString().trim();
    } // 1-

    /**
     * ��ȡEntity�е�Ԫ��ֵ
     * 
     * @param entity
     *            ��ǰʵ��
     * @return String Ԫ��ֵ
     */
    public static String getTextFromEntity(Entity entity) { // 1+
        StringBuffer returnStr = new StringBuffer();
        if (entity.getNodeType() == Node.ENTITY_NODE) { // 2+
            NodeList entityList = entity.getChildNodes();
            if (entityList != null) { // 3+
                for (int i = 0; i < entityList.getLength(); i++) { // 4+
                    Node childNode = entityList.item(i);
                    switch (childNode.getNodeType()) { // 5+
                        case Node.TEXT_NODE:
                            returnStr.append(childNode.getNodeValue());
                            break;
                        case Node.ENTITY_NODE:
                            returnStr
                                    .append(getTextFromEntity((Entity) childNode));
                            break;
                    } // 5-
                } // 4-
            } // 3-
            else
                returnStr.setLength(0);
        } // 2-
        return returnStr.toString().trim();
    } // 1-

    /**
     * ȡ��root�±�ǩΪname��Ԫ��ֵΪvalue�Ľڵ�
     * 
     * @param root
     *            ���ڵ�
     * @param name
     *            ��ǩ��
     * @param value
     *            Ԫ��ֵ
     * @return Node
     */
    public static Node getNodeByValue(Node root, String name, String value) {
        Node rtNode = null;
        // root.getOwnerDocument().getDocumentElement().normalize();
        String tmp = DOMEngine.getTextFromNodeChild(root, name);
        if (tmp != null && tmp.equals(value))
            return root;
        if (root.hasChildNodes()) {
            rtNode = getNodeByValue(root.getFirstChild(), name, value);
            if (rtNode != null)
                return rtNode;
        }
        if (root.getNextSibling() != null) {
            rtNode = getNodeByValue(root.getNextSibling(), name, value);
            if (rtNode != null)
                return rtNode;
        }
        return null;
    }

    /**
     * ��DOCUMENT��ȡ�ñ�ǩΪtagname�����нڵ�
     * 
     * @param doc
     *            �ĵ�����
     * @param tagname
     *            ��ǩ����
     * @return NodeList
     */
    public static NodeList getNodesByTagname(Document doc, String tagname) {
        return (doc.getElementsByTagName(tagname));
    }

    /**
     * ��DOCUMENT��ȡ�ñ�ǩΪtagname�Ľڵ���Ŀ
     * 
     * @param doc
     *            �ĵ�����
     * @param tagname
     *            ��ǩ����
     * @return int �ڵ���Ŀ
     */
    public static int getAmountByTagname(Document doc, String tagname) {
        return (doc.getElementsByTagName(tagname).getLength());
    }

    /**
     * ��DOCUMENT��ȡ�ñ�ǩΪtagname�ĵ�N���ڵ�
     * 
     * @param doc
     *            �ĵ�����
     * @param tagname
     *            ��ǩ����
     * @param number
     *            ˳���
     * @return Node
     */
    public static Node getNodeByTagname(Document doc, String tagname, int number) {
        NodeList nl = doc.getElementsByTagName(tagname);
        if ((nl.getLength() >= number) && (number > 0)) {
            return (nl.item(--number));
        } else {
            return null;
        }
    }

    /**
     * ��DOCUMENT��ȡ�ñ�ǩΪtagname�ĵ�һ���ڵ�
     * 
     * @param doc
     *            �ĵ�����
     * @param tagname
     *            ��ǩ����
     * @return Node
     */
    public static Node getFirstNodeByTagname(Document doc, String tagname) {
        NodeList nl = doc.getElementsByTagName(tagname);
        if (nl.getLength() > 0) {
            return (nl.item(0));
        } else {
            return null;
        }
    }

    /**
     * ��DOCUMENT��ȡ�ñ�ǩΪtagname�����һ���ڵ�
     * 
     * @param doc
     *            �ĵ�����
     * @param tagname
     *            ��ǩ����
     * @return Node
     */
    public static Node getLastNodeByTagname(Document doc, String tagname) {
        NodeList nl = doc.getElementsByTagName(tagname);
        int iIndex = 0;
        if ((iIndex = nl.getLength()) > 0) {
            return (nl.item(--iIndex));
        } else {
            return null;
        }
    }

    /**
     * ��ELEMENT��ȡ�ñ�ǩΪtagname�ĵ�һ���ڵ�
     * 
     * @param elem
     * @param tagname
     * @return Node
     */
    public static Node getFirstNodeByTagname(Element elem, String tagname) {
        NodeList nl = elem.getElementsByTagName(tagname);
        int iIndex = 0;
        if ((iIndex = nl.getLength()) > 0) {
            return (nl.item(--iIndex));
        } else {
            return null;
        }
    }

    /**
     * ȡ�ýڵ��ָ������ֵ�����ҽ����ýڵ���һ��Ԫ��
     * 
     * @param node
     * @param attributeName
     * @return String
     */
    public static String getAttributeValue(Node node, String attributeName) {
        if (node != null && node.getNodeType() == Node.ELEMENT_NODE) {
            Element elem = (Element) node;
            return elem.getAttribute(attributeName);
        } else {
            return null;
        }
    }

    /**
     * ��xmlת�����ַ���
     * 
     * @param doc
     * @return
     */
    public static String XML2String(Document doc) {
        StringWriter sw = new StringWriter();
        try {
            // XMLSerializer xl= new XMLSerializer(sw,new
            // OutputFormat(doc,"UTF-8",true));
            XMLSerializer xl = new XMLSerializer(sw, new OutputFormat(doc,
                    "GBK", true));
            xl.serialize(doc);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sw.toString();
    }

    /**
     * ���ַ���������DOM����
     * 
     * @param str
     * @return DOM����
     */
    /*
     * public static Document String2XML(String str){ Document theDocument =
     * null; DOMParser parser = new DOMParser(); try{
     * parser.setFeature("http://xml.org/sax/features/validation",false);
     * parser.parse(new InputSource(str)); }catch (SAXException se){
     * se.printStackTrace(); }catch (IOException ioe){ ioe.printStackTrace(); }
     * theDocument = parser.getDocument(); return(theDocument); }
     */
    public static Document strToXML(String s) throws Exception {
        // String str_tmp=null;
        // str_tmp=s.toString().trim();
        String str_tmp = s.trim();
        /*
         * try { byte[] byte_str_tmp=new byte[str_tmp.getBytes("GBK").length];
         * System.arraycopy(str_tmp.getBytes("GBK"),0,byte_str_tmp,0,str_tmp.getBytes("GBK").length);
         * str_tmp=new String(byte_str_tmp,"GBK"); } catch(Exception e) { }
         */
        Document theDocument = null;
        StringReader sr = new StringReader(s);
        DOMParser parser = new DOMParser();
        try {
            InputSource is = new InputSource(sr);
            parser.parse(is);
        } catch (SAXException se) {
            se.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        theDocument = parser.getDocument();
        return (theDocument);
    }

    /**
     * 2008-12-28���,����Springע��
     * 
     * @param inputStream
     * @return
     * @throws Exception
     */
    public Document StreamToXML() throws Exception {

        InputStream inputStream = this.configLocation.getInputStream();
        InputSource inputSource = new InputSource();
        // May be a null parameter
        inputSource.setByteStream(inputStream);
        // this.configLocation.getInputStream().
        Document theDocument = null;
        DOMParser parser = new DOMParser();
        try {
            parser.parse(inputSource);
        } catch (SAXException se) {
            se.printStackTrace();
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        theDocument = parser.getDocument();
        return (theDocument);
    }
      

    /**
     * @return the configLocation
     */
    public Resource getConfigLocation() {
        return configLocation;
    }

    /**
     * @param configLocation
     *            the configLocation to set
     */
    public void setConfigLocation(Resource configLocation) {
        this.configLocation = configLocation;
    }

    /**
     * @return the configLocationList
     */
    public List getConfigLocationList() {
        return configLocationList;
    }

    /**
     * @param configLocationList
     *            the configLocationList to set
     */
    public void setConfigLocationList(List configLocationList) {
        this.configLocationList = configLocationList;
    }

    /**
     * @return the configLocations
     */
    public Resource[] getConfigLocations() {
        return configLocations;
    }

    /**
     * @param configLocations the configLocations to set
     */
    public void setConfigLocations(Resource[] configLocations) {
        this.configLocations = configLocations;
    }

}