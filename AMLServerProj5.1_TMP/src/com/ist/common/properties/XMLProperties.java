/**
 * Copyright 2003 (C) PANLAB ，All Rights Reserved.
 * 日期         作者 			动作
 * 2003-10-20   青蛙                     创建
 */
package com.ist.common.properties;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

/**
  * <p>Title: 基础类</p>
  * <p>Description: </p>
  * <p>Copyright: Copyright (c) 2002</p>
  * <p>Company:  </p>
  * @author
  * @version 1.0
*/

/**
 * Provides the the ability to use simple XML property files. Each property is
 * in the form X.Y.Z, which would map to an XML snippet of:
 * <pre>
 * &lt;X&gt;
 *     &lt;Y&gt;
 *         &lt;Z&gt;someValue&lt;/Z&gt;
 *     &lt;/Y&gt;
 * &lt;/X&gt;
 * </pre>
 *
 * The XML file is passed in to the constructor and must be readable and
 * writtable. Setting property values will automatically persist those value
 * to disk.
 */
public class XMLProperties {

   
    private File file;
    private Document doc;
    /**
     * Parsing the XML file every time we need a property is slow. Therefore,
     * we use a Map to cache property values that are accessed more than once.
     */
    private Map propertyCache = new HashMap();

    /**
     * Creates a new XMLProperties object.
     *
     * @param file the full path the file that properties should be read from and written to.
     */
    public XMLProperties(String file) {
        this.file = new File(file);
        try {
            SAXBuilder builder = new SAXBuilder();
            // Strip formatting
            DataUnformatFilter format = new DataUnformatFilter();
            builder.setXMLFilter(format);
            //logger.debug("file:"+file);
            doc = builder.build(new File(file));
        }
        catch (Exception e) {
            System.err.println("在XMLProperties类中建立XML剖析器失败。File="+file);
            e.printStackTrace();
        }
    }

    /**
     * Returns the value of the specified property.
     *
     * @param name the name of the property to get.
     * @return the value of the specified property.
     */
    public String getProperty(String name) {
        if (propertyCache.containsKey(name)) {
            return (String)propertyCache.get(name);
        }

        String[] propName = parsePropertyName(name);
        // Search for this property by traversing down the XML heirarchy.
        Element element = doc.getRootElement();
        for (int i = 0; i < propName.length; i++) {
            element = element.getChild(propName[i]);
            if (element == null) {
                // This node doesn't match this part of the property name which
                // indicates this property doesn't exist so return null.
                return null;
            }
        }
        // At this point, we found a matching property, so return its value.
        // Empty strings are returned as null.
        String value = element.getText();
        if ("".equals(value)) {
            return null;
        }
        else {
            // Add to cache so that getting property next time is fast.
            value = value.trim();
            propertyCache.put(name, value);
            return value;
        }
    }

    /**
     * Return all children property names of a parent property as a String array,
     * or an empty array if the if there are no children. For example, given
     * the properties <tt>X.Y.A</tt>, <tt>X.Y.B</tt>, and <tt>X.Y.C</tt>, then
     * the child properties of <tt>X.Y</tt> are <tt>A</tt>, <tt>B</tt>, and
     * <tt>C</tt>.
     *
     * @param parent the name of the parent property.
     * @return all child property values for the given parent.
     */
    public String [] getChildrenProperties(String parent) {
        String[] propName = parsePropertyName(parent);
        // Search for this property by traversing down the XML heirarchy.
        Element element = doc.getRootElement();
        for (int i = 0; i < propName.length; i++) {
            element = element.getChild(propName[i]);
            if (element == null) {
                // This node doesn't match this part of the property name which
                // indicates this property doesn't exist so return empty array.
                return new String [] { };
            }
        }
        // We found matching property, return names of children.
        List children = element.getChildren();
        int childCount = children.size();
        String [] childrenNames = new String[childCount];
        for (int i=0; i<childCount; i++) {
            childrenNames[i] = ((Element)children.get(i)).getName();
        }
        return childrenNames;
    }

    /**
     * Sets the value of the specified property. If the property doesn't
     * currently exist, it will be automatically created.
     *
     * @param name the name of the property to set.
     * @param value the new value for the property.
     */
    public void setProperty(String name, String value) {
        // Set cache correctly with prop name and value.
        propertyCache.put(name, value);

        String[] propName = parsePropertyName(name);
        // Search for this property by traversing down the XML heirarchy.
        Element element = doc.getRootElement();
        for (int i=0; i<propName.length; i++) {
            // If we don't find this part of the property in the XML heirarchy
            // we add it as a new node
            if (element.getChild(propName[i]) == null) {
                element.addContent(new Element(propName[i]));
            }
            element = element.getChild(propName[i]);
        }
        // Set the value of the property in this node.
        element.setText(value);
        // write the XML properties to disk
        saveProperties();
    }

    /**
     * Deletes the specified property.
     *
     * @param name the property to delete.
     */
    public void deleteProperty(String name) {
        String[] propName = parsePropertyName(name);
        // Search for this property by traversing down the XML heirarchy.
        Element element = doc.getRootElement();
        for (int i=0; i<propName.length-1; i++) {
            element = element.getChild(propName[i]);
            // Can't find the property so return.
            if (element == null) {
                return;
            }
        }
        // Found the correct element to remove, so remove it...
        element.removeChild(propName[propName.length-1]);
        // .. then write to disk.
        saveProperties();
    }

    /**
     * Saves the properties to disk as an XML document. A temporary file is
     * used during the writing process for maximum safety.
     */
    private synchronized void saveProperties() {
        OutputStream out = null;
        boolean error = false;
        // Write data out to a temporary file first.
        File tempFile = null;
        try {
            tempFile = new File(file.getParentFile(), file.getName() + ".tmp");
            // Use JDOM's XMLOutputter to do the writing and formatting. The
            // file should always come out pretty-printed.

            //因为换了Jdom.jar,所以改写此语句
            //XMLOutputter outputter = new XMLOutputter("    ", true);
            Format format = Format.getCompactFormat();
            format.setIndent("    "); //设置xml文件的缩进为4个空格
            XMLOutputter outputter = new XMLOutputter(format);
            out = new BufferedOutputStream(new FileOutputStream(tempFile));
            outputter.output(doc, out);
        }
        catch (Exception e) {
            e.printStackTrace();
            // There were errors so abort replacing the old property file.
            error = true;
        }
        finally {
            try {  out.close();  }
            catch (Exception e) {
                e.printStackTrace();
                error = true;
            }
        }
        // No errors occured, so we should be safe in replacing the old
        if (!error) {
            // Delete the old file so we can replace it.
            file.delete();
            // Rename the temp file. The delete and rename won't be an
            // automic operation, but we should be pretty safe in general.
            // At the very least, the temp file should remain in some form.
            tempFile.renameTo(file);
        }
    }

    /**
     * Returns an array representation of the given Jive property. Jive
     * properties are always in the format "prop.name.is.this" which would be
     * represented as an array of four Strings.
     *
     * @param name the name of the Jive property.
     * @return an array representation of the given Jive property.
     */
    private String[] parsePropertyName(String name) {
        // Figure out the number of parts of the name (this becomes the size
        // of the resulting array).
        int size = 1;
        for (int i=0; i<name.length(); i++) {
            if (name.charAt(i) == '.') {
                size++;
            }
        }
        String[] propName = new String[size];
        // Use a StringTokenizer to tokenize the property name.
        StringTokenizer tokenizer = new StringTokenizer(name, ".");
        int i = 0;
        while (tokenizer.hasMoreTokens()) {
            propName[i] = tokenizer.nextToken();
            i++;
        }
        return propName;
    }
}
