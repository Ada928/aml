<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
   
   <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
   <div class="cond_c">
    <table border="0" cellpadding="0" cellspacing="0">
    <tr> <td colspan="8" align="center"><b>�ڲ���ƽ���</b></td></tr>
    <TR  >
        
         <td>�ڿ��ƶȲ�����:</td>
         <td><bean:write name="t07_recordor" property="remark4"/></td>
         <td>������ѵ����λ:</td>
         <td><bean:write name="t07_recordor" property="remark8"/></td>
         <td >�����ɽ���©����</td>
         <td ><bean:write name="t07_recordor" property="remark5"/></td>
           <td >�ͻ����ϱ��治ȫ��</td>
         <td ><bean:write name="t07_recordor" property="remark9"/></td>
       
       </TR>
       <TR>
         
       
         <td >�ͻ����ʶ�𲻵�λ��</td>
         <td  ><bean:write name="t07_recordor" property="remark6"/></td>
         <td >�������⣺</td>
         <td  ><bean:write name="t07_recordor" property="remark10"/></td>
       
         <td >δ�������⣺</td>
         <td   ><bean:write name="t07_recordor" property="remark7"/></td>
         <td ></td>
         <td  ></td>
       </TR>
	   </table>
	   </div>
	 </logic:equal>
	 
	 
	 <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      <div class="cond_c">
      <table border="0" cellpadding="0" cellspacing="0">
       <TR align=right >
         <TD nowrap><b>������п�չ���������</b></TD>
         <TD colspan="2">��ϵ��������<bean:write name="t07_recordsum" property="remark4"/></TD>
         
       </TR>
       <TR align=right  >
         <TD rowspan="2"  ><b>ִ����ʱ�����ʩ�����</b></TR>
         <TD nowrap>��������Ҵ�����<bean:write name="t07_recordsum" property="remark5"/>&nbsp; &nbsp;&nbsp;&nbsp;
                           ��������ҽ���Ԫ����<bean:write name="t07_recordsum" property="remark6"/></td>
         
       <TR align=left >
         <TD nowrap>������Ҵ�����<bean:write name="t07_recordsum" property="remark7"/> &nbsp; &nbsp;&nbsp;&nbsp;
                         ������ҽ�����Ԫ����<bean:write name="t07_recordsum" property="remark8"/></TD>
          
       </TR>
       <TR align=right  >
         <TD rowspan="2" width='30%' nowrap><b>�����б������ӷ��������</b></TD>
         <TD nowrap>��������ҷ�����<bean:write name="t07_recordsum" property="remark9"/>  &nbsp; &nbsp;&nbsp;&nbsp;
                            ��������ҽ���Ԫ����<bean:write name="t07_recordsum" property="remark10"/></TD>
         
       </TR>
       <TR align=left >
         <TD nowrap>������ҷ�����<bean:write name="t07_recordsum" property="remark11"/> &nbsp; &nbsp;&nbsp;&nbsp;
         ������ҽ�����Ԫ����<bean:write name="t07_recordsum" property="remark12"/></TD>
     
       </TR>
        </table>
        </div>
    </logic:equal>
    
    <div class="list">
   <table border="0" cellspacing="0" cellpadding="0">
	  <tr>
		<TH  nowrap height="22">ѡ��</TH>
		 <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>�ϱ�����</TH>
         <TH nowrap>��ѵʱ��</TH>
         <TH width="30%">��ѵ����</TH>
         <TH  nowrap>��ѵ����</TH>
         <TH  nowrap>�μ�����</TH>
         <TH  noWrap>��ѵ��ʽ</TH>
      </logic:equal>
       <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>�ϱ�����</TH>
         <TH nowrap>�ʱ��</TH>
         <TH width="30%" nowrap>��������</TH>
         <TH  nowrap>�μ�����</TH>
         <TH  nowrap>������ʽ</TH>
         <TH  noWrap>���Ų��Ϸ���</TH>
      </logic:equal>
      
      <!-- �ڿ��ƶ� -->
     <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
     	 <TH nowrap>�ϱ�����</TH>
         <TH nowrap>�ƶ�����</TH>
         <TH width="30%" nowrap>��Ҫ����</TH>
         <TH  nowrap>�ƶ�����</TH>
         <TH  nowrap>�ƶ�ʱ��</TH>
         <TH  noWrap>����ĺ�</TH>
      </logic:equal>
      
     <!-- �ڲ���� -->
     <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
     	 <TH nowrap>�ϱ�����</TH>
         <TH nowrap>��Ʋ�������</TH>
         <TH nowrap>�������</TH>
         <TH  width="30%" nowrap>�����Ŀ���Ƽ���Ҫ����</TH>
         <TH  nowrap>��Ʒ�����Ҫ����</TH>
         <TH  noWrap>�����������</TH>
      </logic:equal>
      
      <!-- ���ϴǮ���� -->
      <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      	 <TH nowrap>�ϱ�����</TH>
         <TH nowrap>��Э������</TH>
         <TH nowrap>Э��ʱ��</TH>
         <TH  width="30%" nowrap>Э������</TH>
         <TH  nowrap>Ч��</TH>
         <TH  noWrap>Э����λ(��������/��������)</TH>
      </logic:equal>
	  </tr>
	 <logic:iterate id="record" name="t07_recordList" type="com.ist.aml.offs_report.dto.T07_record">
	<TR align="center" onMouseOver="this.className='interval2'" onMouseOut="this.className='interval'">
      <TD height=22>
         <html:multibox property="record_id_selected">
              	<bean:write name="record" property="record_id" ignore="true"/>
          </html:multibox>
      </TD>
      <!-- 
      <TD><a href="javascript:dosubmit('t07_record_detail.do?record_id=<bean:write name="record" property="record_id" ignore="true"/>&record_type_cd=<bean:write name="record" property="record_type_cd" ignore="true"/>','add')">��ϸ��Ϣ</a></TD>
       -->
      <!-- ��ѵ��¼ -->
      <logic:equal value="1" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark2" ignore="true"/></TD>
	      <TD><bean:write name="record" property="remark3" ignore="true"/></TD>
      </logic:equal>
      
      <!-- ������¼ -->
      <logic:equal value="2" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark3" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
      <!-- �ڿ��ƶ� -->
      <logic:equal value="3" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
      <!-- �ڲ���� -->
      <logic:equal value="4" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark3" ignore="true"/></TD>
      </logic:equal>
      
      <!-- ���ϴǮ���� -->
      <logic:equal value="5" name="t07_recordActionForm" property="record_type_cd">
      	  <TD ><bean:write name="record" property="organkey" ignore="true"/></TD>
          <TD><bean:write name="record" property="record_obj" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="create_dt_disp" ignore="true"/> - <bean:write name="record" property="create_end_dt_disp" ignore="true"/></TD>
	      <TD style="white-space:normal;"><bean:write name="record" property="content" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark1" ignore="true"/></TD>
	      <TD nowrap><bean:write name="record" property="remark2" ignore="true"/></TD>
      </logic:equal>
      
    </TR>
</logic:iterate>
   </table>
  </div>
	  
    
</html>
