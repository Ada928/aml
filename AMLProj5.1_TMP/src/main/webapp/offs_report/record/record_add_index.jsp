<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

  <div class="cond_c" >
	  
     <!-- ��ѵ��¼ -->
    <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td> <font color="#FF0000">*</font>��ѵʱ�䣺</td>
		     <td >
		      <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		        
		       -
		       <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>��ѵ���ݣ�</td>
		     <td   >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5" ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>��ѵ����</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5" ></html:textarea>
		      <!-- 
		        <html:text name="t07_recordActionForm" property="remark1"  size="40" />
		       -->
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>�μ�������</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark2"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>��ѵ��ʽ��</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark3"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- ������¼ -->
    <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td > <font color="#FF0000">*</font>�ʱ�䣺</td>
		     <td  >
		      <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		       -
		        <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		
		       </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>�������ݣ�</td>
		     <td   >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr>
		     <td > <font color="#FF0000">*</font>�μ�������</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark1"  size="40" />
		     </td>
	     </tr>
	     
	     <tr >
		     <td> <font color="#FF0000">*</font>������ʽ��</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark3"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr>
		     <td > <font color="#FF0000">*</font>���Ų��Ϸ���</��</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- �ڿ��ƶ� -->
    <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
        <tr  >
		     <td> <font color="#FF0000">*</font>�ƶ����ƣ�</td>
		     <td >
		       <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5" ></html:textarea>
		     </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>��Ҫ���ݣ�</td>
		     <td >
		     <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		     </td>
	    </tr>
	     
	     <tr  >
		     <td> <font color="#FF0000">*</font>�ƶ����ţ�</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="record_obj" size="40" />
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>�ƶ�ʱ�䣺</td>
		     <td > 
		     <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        <logic:equal value="yes" name="searchPage" scope="request">
		       -
		       <html:text  name="t07_recordActionForm" property="create_dt_end_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		      </logic:equal>
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>����ĺţ�</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
    </logic:equal>
    
     <!-- �ڲ���� -->
    <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
        <tr  >
		     <td > <font color="#FF0000">*</font>��Ʋ������ƣ�</td>
		     <td  >
		       <html:text name="t07_recordActionForm" property="record_obj"  size="40" />
		       
		     </td>	
        </tr>
	    <tr >
		     <td > <font color="#FF0000">*</font>������ޣ�</td>
		     <td   >
		     <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       -
		        <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		       </td>
	    </tr>
	     
	     <tr >
		     <td> <font color="#FF0000">*</font>�����Ŀ���Ƽ���Ҫ���ݣ�</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		      <!-- 
		      <html:text name="t07_recordActionForm" property="content"  size="40" />
		       --> 
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>��Ʒ��ֵ���Ҫ���⣺</td>
		     <td > 
		       <html:textarea name="t07_recordActionForm" property="remark1" cols="40" rows="5"  ></html:textarea>
		       <!-- 
		       <html:text name="t07_recordActionForm" property="remark1"  size="5" /> 
		        -->  
		     </td>
	     </tr>
	     
	     <tr >
		     <td > <font color="#FF0000">*</font>�������������</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="remark3" cols="40" rows="5"  ></html:textarea>
		      <!-- 
		      <html:text name="t07_recordActionForm" property="remark3"  size="40" />
		       -->		      
		     </td>
	     </tr>
	     
	     <!-- add lixx 2010.10.21 ���������� �� -->
	     <tr >
	       <td colspan="2">
	        <table  border="0" cellpadding="1" cellspacing="1">
	           <tr>
	        	  <td ><font color="#FF0000">*</font>�ڿ��ƶȲ�����:</td>
		          <td> 
			   		 <html:select property="remark4" >
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select> 
			      </td>
				  <td><font color="#FF0000">*</font>�����ɽ���©����</td>
			      <td> 
			    	 <html:select property="remark5">
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select> 
		     	  </td>
	           </tr>
		       <tr>
			      <td><font color="#FF0000">*</font>�ͻ����ʶ�𲻵�λ��</td>
			      <td > 
			    	 <html:select property="remark6">
						<html:options collection="remarkMap" property="label"
							labelProperty="value"/>
					 </html:select>
			      </td> 
			      <td><font color="#FF0000">*</font>δ�������⣺</td>
			      <td > 
			    	 <html:select property="remark7">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
		       </tr>
			   <tr >
			      <td><font color="#FF0000">*</font>������ѵ����λ��</td>
			      <td > 
			     	 <html:select  property="remark8">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
			      <td><font color="#FF0000">*</font>�ͻ����ϱ��治ȫ��</td>
			      <td > 
				     <html:select property="remark9">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
		       </tr>
		       <tr >
			      <td><font color="#FF0000">*</font>�������⣺</td>
			      <td >  
					 <html:select property="remark10">
						<html:options collection="remarkMap" property="label"
							labelProperty="value" />
					 </html:select>
			      </td>
			      <td></td>
			      <td ></td>  
		       </tr>
	        </table>
	       </td>
	     </tr>
	     <!-- end  lixx 2010.10.21 ���������� �� -->
	     
    </logic:equal>
    
     <!-- ���ϴǮ���� -->
    <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
        <tr >
		     <td height="22" align="right" nowrap> <font color="#FF0000">*</font>��Э�����ţ�</td>
		     <td >
		       <html:text name="t07_recordActionForm" property="record_obj"  size="40" />	    
		     </td>	
        </tr>
	    <tr >
		     <td height="22" align="right"  nowrap> <font color="#FF0000">*</font>Э��ʱ�䣺</td>
		     <td width="90%"  >
		    <html:text  name="t07_recordActionForm" property="create_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        -
		       <html:text  name="t07_recordActionForm" property="create_end_dt_disp" size="12"onclick="calendar.show(this);" readonly="true" styleClass="calimg" />
  
		        </td>
	    </tr>
	     
	     <tr>
		     <td height="22" align="right" nowrap> <font color="#FF0000">*</font>Э�����ݣ�</td>
		     <td > 
		      <html:textarea name="t07_recordActionForm" property="content" cols="40" rows="5"  ></html:textarea>
		      <!--
		      <html:text name="t07_recordActionForm" property="content"  size="40" /> 
		       -->		      
		     </td>
	     </tr>
	     
	     <tr  >
		     <td height="22" align="right"   nowrap> <font color="#FF0000">*</font>Ч����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark1"  size="40" /> 
		     </td>
	     </tr>
	     
	     <tr  >
		     <td height="22" align="right"   nowrap> 
			<font color="#FF0000">*</font>
		     Э����λ(��������/��������)��</td>
		     <td > 
		      <html:text name="t07_recordActionForm" property="remark2"  size="40" />
		     </td>
	     </tr>
	     
	     <!-- add lixx 2010.10.21 ���������� �� -->
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>��ϵ��������</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark4"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>��������Ҵ�����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark5"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>��������ҽ���Ԫ����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark6"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>������Ҵ�����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark7"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>������ҽ�����Ԫ����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark8"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>��������ҷ�����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark9"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>��������ҽ���Ԫ����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark10"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>������ҷ�����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark11"  size="40"/> 
		     </td>
	     </tr>
	     <tr  >
		     <td height="22" align="right"   nowrap><font color="#FF0000">*</font>������ҽ�����Ԫ����</td>
		     <td > 
		    <html:text name="t07_recordActionForm" property="remark12"  size="40"/> 
		     </td>
	     </tr>
	     <!-- end  lixx 2010.10.21 ���������� �� -->
	     
    </logic:equal>
    
 
 </div>

