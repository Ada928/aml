/**
 * Copyright 2003 (C) PANLAB ，All Rights Reserved.
 * 日期         作者 			动作
 * 2003-10-20   青蛙                     创建
 */
package com.ist.common.properties;

import java.util.Stack;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.XMLReader;

/**
  * <p>Title: 基础类</p>
  * <p>Description: </p>
  * <p>Copyright: Copyright (c) 2002</p>
  * <p>Company:  </p>
  * @author
  * @version 1.0
*/
/**
 * Filter for removing formatting from data- or field-oriented XML.
 *
 * <i>Code and comments adapted from DataWriter-0.2, written
 * by David Megginson and released into the public domain,
 * without warranty.</i>
 *
 * <p>This filter removes leading and trailing whitespace from
 * field-oriented XML without mixed content. Note that this class will
 * likely not yield appropriate results for document-oriented XML like
 * XHTML pages, which mix character data and elements together.</p>
 *
 * @see DataFormatFilter
 */
public class DataUnformatFilter extends XMLFilterBase
{

    ////////////////////////////////////////////////////////////////////
    // Constructors.
    ////////////////////////////////////////////////////////////////////

    /**
     * Create a new filter.
     */
    public DataUnformatFilter()
    {
    }

    /**
     * Create a new filter.
     *
     * <p>Use the XMLReader provided as the source of events.</p>
     *
     * @param xmlreader The parent in the filter chain.
     */
    public DataUnformatFilter(XMLReader xmlreader)
    {
        super(xmlreader);
    }

    ////////////////////////////////////////////////////////////////////
    // Public methods.
    ////////////////////////////////////////////////////////////////////

    /**
     * Reset the filter so that it can be reused.
     *
     * <p>This method is especially useful if the filter failed
     * with an exception the last time through.</p>
     */
    public void reset ()
    {
        state = SEEN_NOTHING;
        stateStack = new Stack();
        whitespace = new StringBuffer();
    }

    ////////////////////////////////////////////////////////////////////
    // Methods from com.jivesoftware.sax.ContentHandler.
    ////////////////////////////////////////////////////////////////////

    /**
     * Filter a start document event.
     *
     * <p>Reset state and pass the event on for further processing.</p>
     *
     * @exception com.jivesoftware.sax.SAXException If a filter
     *            further down the chain raises an exception.
     * @see com.jivesoftware.sax.ContentHandler#startDocument
     */
    public void startDocument ()
    throws SAXException
    {
        reset();
        super.startDocument();
    }

    /**
     * Filter a start element event.
     *
     * @param uri The element's Namespace URI.
     * @param localName The element's local name.
     * @param qName The element's qualified (prefixed) name.
     * @param atts The element's attribute list.
     * @exception com.jivesoftware.sax.SAXException If a filter
     *            further down the chain raises an exception.
     * @see com.jivesoftware.sax.ContentHandler#startElement
     */
    public void startElement (String uri, String localName,
                              String qName, Attributes atts)
    throws SAXException
    {
        clearWhitespace();
        stateStack.push(SEEN_ELEMENT);
        state = SEEN_NOTHING;
        super.startElement(uri, localName, qName, atts);
    }

    /**
     * Filter an end element event.
     *
     * @param uri The element's Namespace URI.
     * @param localName The element's local name.
     * @param qName The element's qualified (prefixed) name.
     * @exception com.jivesoftware.sax.SAXException If a filter
     *            further down the chain raises an exception.
     * @see com.jivesoftware.sax.ContentHandler#endElement
     */
    public void endElement (String uri, String localName, String qName)
    throws SAXException
    {
        if (state == SEEN_ELEMENT) {
            clearWhitespace();
        } else {
            emitWhitespace();
        }
        state = stateStack.pop();
        super.endElement(uri, localName, qName);
    }

    /**
     * Filter a character data event.
     *
     * @param ch The characters to write.
     * @param start The starting position in the array.
     * @param length The number of characters to use.
     * @exception com.jivesoftware.sax.SAXException If a filter
     *            further down the chain raises an exception.
     * @see com.jivesoftware.sax.ContentHandler#characters
     */
    public void characters (char ch[], int start, int length)
    throws SAXException
    {
        if (state != SEEN_DATA) {

            /* Look for non-whitespace. */
            int end = start + length;
            while (end-- > start) {
                if (!isXMLWhitespace(ch[end]))
                    break;
            }

            /*
             * If all the characters are whitespace, save them for later.
             * If we've got some data, emit any saved whitespace and update
             * our state to show we've seen data.
             */
            if (end < start) {
                saveWhitespace(ch, start, length);
            } else {
                state = SEEN_DATA;
                emitWhitespace();
            }
        }

        /* Pass on everything inside a data field. */
        if (state == SEEN_DATA) {
            super.characters(ch, start, length);
        }
    }

     /**
      * Filter an ignorable whitespace event.
      *
      * @param ch The array of characters to write.
      * @param start The starting position in the array.
      * @param length The number of characters to write.
      * @exception com.jivesoftware.sax.SAXException If a filter
      *            further down the chain raises an exception.
      * @see com.jivesoftware.sax.ContentHandler#ignorableWhitespace
      */
    public void ignorableWhitespace (char ch[], int start, int length)
    throws SAXException
    {
        emitWhitespace();
        // ignore
    }

    /**
     * Filter a processing instruction event.
     *
     * @param target The PI target.
     * @param data The PI data.
     * @exception com.jivesoftware.sax.SAXException If a filter
     *            further down the chain raises an exception.
     * @see com.jivesoftware.sax.ContentHandler#processingInstruction
     */
    public void processingInstruction (String target, String data)
    throws SAXException
    {
        emitWhitespace();
        super.processingInstruction(target, data);
    }

    ////////////////////////////////////////////////////////////////////
    // Internal methods.
    ////////////////////////////////////////////////////////////////////

    /**
     * Saves trailing whitespace.
     * @param ch ch
     * @param start start
     * @param length length
     */
    protected void saveWhitespace (char[] ch, int start, int length) {
        whitespace.append(ch, start, length);
    }

    /**
     * Passes saved whitespace down the filter chain.
     * @throws SAXException ex
     */
    protected void emitWhitespace ()
    throws SAXException
    {
        char[] data = new char[whitespace.length()];
        if (whitespace.length() > 0) {
            whitespace.getChars(0, data.length, data, 0);
            whitespace.setLength(0);
            super.characters(data, 0, data.length);
        }
    }

    /**
     * Discards saved whitespace.
     */
    protected void clearWhitespace () {
        whitespace.setLength(0);
    }

    /**
     * @param c c
     * @return  <var>true</var> if character is XML whitespace.
     */
    private boolean isXMLWhitespace (char c)
    {
        return c == ' ' || c == '\t' || c == '\r' || c == '\n';
    }

    ////////////////////////////////////////////////////////////////////
    // Constants.
    ////////////////////////////////////////////////////////////////////

    private static final Object SEEN_NOTHING = new Object();
    private static final Object SEEN_ELEMENT = new Object();
    private static final Object SEEN_DATA = new Object();


    ////////////////////////////////////////////////////////////////////
    // Internal state.
    ////////////////////////////////////////////////////////////////////

    private Object state = SEEN_NOTHING;
    private Stack stateStack = new Stack();

    private StringBuffer whitespace = new StringBuffer();
}