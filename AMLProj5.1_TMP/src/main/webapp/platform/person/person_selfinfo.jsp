<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<html:html>
  <HEAD>
   <link id="skincss" href="../../css/aml_<%=session.getAttribute("style") %>.css" rel="stylesheet" type="text/css" />
       <script src="../../js/title.js"></script>
<script type="text/javascript" src="../../js/jquery.js"></script>
<script type="text/javascript" src="../../js/aml.js"></script>
<!--[if lte IE 6]>

<script type="text/javascript" src="../../js/unitpngfix.js"></script>
<![endif]--> 
   

    <SCRIPT LANGUAGE="JavaScript">
    function load0()
    {
    }
   
    function dosubmit(theUrl){
      document.forms[0].action=theUrl;
      document.forms[0].submit();
    }
    function _Open(url){
  
         window.open(url,'','height=500, width=700,left=100,top=100,scrollbars=yes,resizable=yes');
    }
    
    </SCRIPT>
    </HEAD>
    <BODY leftmargin="0" topmargin="0">
   
      <html:form action="/person/person_selfinfo.do" method="post">
       <div id="main">
        <div class="conditions">
		  <div class="cond_t">
		          <span>   ���� 
              </span>
              <span class="buttons">  <a
							href="javascript:window.close();"><img
									src="../../images/<%=session.getAttribute("style") %>/b_edit.png" />�� ��</a> </span>
              
		 </div>
		 <!-- ��ѡ���ʼ -->
				<div id="bigTab">
					<!-- ��ѡ��˵� -->
					<dl class="tabm">
						<dd class="tabcur">
							<span>������Ϣ</span>
						</dd>
						<dd>
							<span>�޸�����</span>
						</dd>
						<!-- start add lixx 2011.10.09 ��ӻ�������  -->
						<!--<logic:equal name="colorflag" value="1">
							<dd>
								<span>�������</span>
							</dd>
						</logic:equal>-->
						<!-- start add lixx 2011.10.09 ��ӻ�������  -->
					</dl>
					
					<!-- ��ѡ����ݿ�ʼ -->
					<dl class="tabc">
						<!-- ��ѡ���1��****������Ϣ****ѡ�<dd>��Ӧ�˵�<dd> ֻ�е�һ��ѡ�dd��class -->
						<dd class="tabshow">
						<div class="cond_c2">
	  <table border="0" cellpadding="0" cellspacing="0">
				<tr >
					<td >
						�û�����
					</td>
					<td>
						<bean:write name="t00_user" property="username" scope="request"/>
					</td>
					<td>
						��ʵ������
					</td>
					<td>
						<bean:write name="t00_user" property="realname" scope="request"/>
					</td>
				</tr>
				<tr>
					<td>
						����������
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="organkey_disp" scope="request"/>
					</td>
					<td>
						״̬��
					</td>
					<td bgcolor="F6F9FF">
						<bean:write name="t00_user" property="flag_disp" scope="request"/>
					</td>
				</tr>
				
	 <tr>
      <td>
     ��ɫ��</td>
      <td  colspan="3">
           <logic:iterate id="role" name="t00_user" property="roleList" type="com.ist.platform.dto.T00_com_auth">
			      	<bean:write name="role" property="rolekey_disp" scope="page"/>
			      </logic:iterate>
      </td>
    </tr>
				 <tr>
         <td>��ַ��</td>
         <td colspan="3">
         <bean:write name="t00_user" property="address" scope="request"/>
         </td>
        </tr>
		<tr>
         <td>�绰���룺</td>
         <td> <bean:write name="t00_user" property="telephone" scope="request"/>
        </td>
         <td>�ƶ��绰��</td>
         <td> <bean:write name="t00_user" property="mobilephone" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>�������룺</td>
         <td> <bean:write name="t00_user" property="postalcode" scope="request"/>
       </td>
         <td>Email��</td>
         <td> <bean:write name="t00_user" property="emailaddress" scope="request"/>
         </td>
       </tr>
       <tr>
         <td>�����ˣ�</td>
         <td> <bean:write name="t00_user" property="creator" scope="request"/>
        </td>
         <td>����ʱ�䣺</td>
         <td> <bean:write name="t00_user" property="createdate" scope="request"/>
        </td>
       </tr>
		<tr>
         <td>����޸��ˣ�</td>
         <td> <bean:write name="t00_user" property="modifier" scope="request"/>
       </td>
         <td>����޸�ʱ�䣺</td>
         <td> <bean:write name="t00_user" property="modifydate" scope="request"/>
         </td>
       </tr>
	  
	    <tr>
         <td>������</td>
         <td colspan="3">  <bean:write name="t00_user" property="remark" scope="request"/>
       
         </td>
       </tr>
       </table>
	</div>
						</dd>
						 <dd>
								<iframe src="<%=request.getContextPath()%>/platform/person/person_selfinfo_pass.do?username=<bean:write name="t00_user" property="username" />"
									width="100%" scrolling="no" height="1200" name="test"
									frameborder="0"></iframe>
						</dd>
						<!-- start add lixx 2011.10.09 ��ӻ�������  -->
						<!--<logic:equal name="colorflag" value="1">
							<dd>
							   <iframe src="<%=request.getContextPath()%>/platform/person/person_selfinfo_color.do?username=<bean:write name="t00_user" property="username" />"
										width="100%" scrolling="no" height="800" name="test" frameborder="0">
						       </iframe>
							</dd>
						</logic:equal>-->
						<!-- start add lixx 2011.10.09 ��ӻ�������  -->
				   </dl>
				</div>
                 
           </div>
           </div>
    </html:form>
    </body>
</html:html>
