<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/struts-nested.tld" prefix="nested" %>
<%@ taglib uri="/WEB-INF/struts-tiles.tld" prefix="tiles" %>

<div class="cond_c" >
	  <table border="0" cellpadding="0" cellspacing="0" id="searchtable">
       <tr>
         <td>
            <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    ��ѵʱ�䣺
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    �ʱ�䣺
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    �ƶ����ƣ�
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    ��Ʋ������ƣ�
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    ��Э�����ţ�
		 </logic:equal>
         </td>
         <td>
         <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
          <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
	       </logic:equal>
	    
	    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
	       
	    <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
	    </logic:equal>
	    
	    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
	         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
	    </logic:equal>
	    
	    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
	         <html:text name="t07_recordActionForm" property="record_obj" maxlength="256" styleClass="text_white" size="30" />
	    </logic:equal>
	    
	    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
	         <html:text name="t07_recordActionForm" property="record_obj" maxlength="256" styleClass="text_white" size="30" />
	    </logic:equal>
			</td>
        <td align="right" >
        <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
		    ��ѵ���ݣ�
		    </logic:equal>
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		    �������ݣ�
		    </logic:equal>
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		    ��Ҫ���ݣ�
		    </logic:equal>
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		    ������ޣ�
		    </logic:equal>
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		    Э��ʱ�䣺
		    </logic:equal>
        </td>
          <td width="40%">
          <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
	          
		    <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		          <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
              </logic:equal>	
          </td>
        </tr>
	    <tr>
			<td>
			<logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    ��ѵ����
			    </logic:equal>
			    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
			    �μ�������
			    </logic:equal>
			    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
			    �ƶ����ţ�
			    </logic:equal>
			    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
			    �����Ŀ���Ƽ���Ҫ���ݣ�
			    </logic:equal>
			    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
			    Э�����ݣ�
			    </logic:equal>
			</td>
			<td><logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="record_obj" maxlength="256" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="content" size="30"></html:text>
		    </logic:equal>
		    </td>

		    <td ><logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    �μ�������
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    ������ʽ��
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    �ƶ�ʱ�䣺
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    ��Ʒ��ֵ���Ҫ���⣺
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    Ч����
				    </logic:equal>
			</td>
		    <td>
		    <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
			    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			</logic:equal>
		    
		    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
		        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
		    </logic:equal>
		    
		    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
		     <html:text name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		     -
		    <html:text name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
   
		    </logic:equal>
		    
		    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		   </logic:equal>
		    
		    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
		         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark1" size="30" maxlength="256"></html:text>
		    </logic:equal>
		    </td>
			</tr>
            <tr >
				<td >
                 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    ��ѵ��ʽ��
				    </logic:equal>
				    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
				    ���Ų��Ϸ�����
				    </logic:equal>
				    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
				    ����ĺţ�
				    </logic:equal>
				    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
				    �������������
				    </logic:equal>
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				    Э����λ(��������/��������)��
				    </logic:equal>
                 </td>
				<td >
				 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
				    <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
				</logic:equal>
			    
			    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
			        <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
			    
			    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
			    
			    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark3" maxlength="256" size="30"></html:text>
			   </logic:equal>
			    
			    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
			         <html:text  name="t07_recordActionForm" styleClass="text_white" property="remark2" maxlength="256" size="30"></html:text>
			    </logic:equal>
				</td>

				<td >  &nbsp;
				    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				         ���ȣ�
				    </logic:equal>
				</td>
				<td>
				<logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
				       <html:select name="t07_recordActionForm" property="quarter">
					       <html:option value="">ѡ�񼾶�</html:option>
					       <html:option value="1">��һ����</html:option>
					       <html:option value="2">�ڶ�����</html:option>
					       <html:option value="3">��������</html:option>
					       <html:option value="4">���ļ���</html:option>
				    </html:select>
				    </logic:equal>
				    &nbsp;
										
					                  
					</td>

				</tr>
				<tr >
	          <td height="22" align="right" >�������ƣ�</td>
	          <td hight="40" colspan="3">
		          <bean:define id="organMultiSelHTMLStr" name="organMultiSelHTMLStr"></bean:define>
				  <%=organMultiSelHTMLStr%>
	          </td>
							          
			 </tr>
			 <tr bgcolor="ECF3FF">
			<td height="" align="right" colspan="4"  class="in_button">
				<input type=button value="��  ѯ" name=sub  onClick="dosubmit('gett07_record_list.do?newsearchflag=1&record_type_cd=<bean:write name="t07_recordActionForm" property="record_type_cd" ignore="true"/>','search')">
				<html:button property="clear"  value="�� ��" onclick="clearText()"></html:button>
			</td>
			</tr>
								
	  </table>
	</div>
  </div>

