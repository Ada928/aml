package com.ist.common;

/**
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.core.io.FileSystemResource;

import com.ist.common.jcs.CatchManager;
import com.ist.common.properties.XMLProperties;
import com.ist.util.Constans;
import com.ist.util.DateUtils;
import com.ist.util.FileUtils;

/**
 * <p>Filter that sets the character encoding to be used in parsing the
 * incoming request, either unconditionally or only if the client did not
 * specify a character encoding. Configuration of this filter is based on
 * the following initialization parameters:</p>
 * <ul>
 * <li><strong>encoding</strong> - The character encoding to be configured
 * for this request, either conditionally or unconditionally based on
 * the <code>ignore</code> initialization parameter. This parameter
 * is required, so there is no default.</li>
 * <li><strong>ignore</strong> - If set to "true", any character encoding
 * specified by the client is ignored, and the value returned by the
 * <code>selectEncoding()</code> method is set. If set to "false,
 * <code>selectEncoding()</code> is called <strong>only</strong> if the
 * client has not already specified an encoding. By default, this
 * parameter is set to "true".</li>
 * </ul>
 *
 * <p>Although this filter can be used unchanged, it is also easy to
 * subclass it and make the <code>selectEncoding()</code> method more
 * intelligent about what encoding to choose, based on characteristics of
 * the incoming request (such as the values of the <code>Accept-Language</code>
 * and <code>User-Agent</code> headers, or a value stashed in the current
 * user's session.</p>
 *
 * @author <a href="mailto:jwtronics@yahoo.com">John Wong</a>
 *
 * @version $Id: SetCharacterEncodingFilter.java,v 1.3 2008/02/01 05:36:12 hubaiqing Exp $
 */
public class SetCharacterEncodingFilter
    implements Filter {
    /**
     * The default character encoding to set for requests that pass through
     * this filter.
     */
    protected String encoding = null;

    /**
     * The filter configuration object we are associated with. If this value
     * is null, this filter instance is not currently configured.
     */
    protected FilterConfig filterConfig = null;

    /**
     * Should a character encoding specified by the client be ignored?
     */
    protected boolean ignore = true;

    //û��Ȩ��ʱ����ת��ҳ��
    protected String privpage = "";

    //session��ʱʱ����ת��ҳ��
    protected String timeoutpage = "";
    // ���û��ٴε�¼����ת��ҳ��
	protected String otherlogin = "";
	// �ļ��洢·��
	protected String authtextstorepath = "";
	// �Ƿ���Ƶ����½
	protected String use_sinuserctrl = "0";

	//system-config�����ļ�
	protected XMLProperties sysConfig=null;
	
	//����Դ
	protected DataSource ds=null;
	
	//����
	protected CatchManager cm=null;
	
	
    /**
     * Take this filter out of service.
     */
    public void destroy() {
        this.encoding = null;
        this.filterConfig = null;
    }
    
    /**
    * Request.java �� HttpServletRequestWrapper ��������, ��Ӱ��ԭ���Ĺ��ܲ����ṩ���е�
    * HttpServletRequest �ӿ��еĹ���. ������ͳһ�Ķ� Tomcat Ĭ�������µ�����������н����ֻ��Ҫ���µ� Request
    * �����滻ҳ���е� request ���󼴿�.
    */

    class Request extends HttpServletRequestWrapper {
      
       private String encoding = null;

       public Request(HttpServletRequest request) {
        super(request);
        encoding = SetCharacterEncodingFilter.this.encoding;
       }

       /**
       * ת���ɱ���ȡ�����ݵ�����. �� ISO �ַ�ת�� ��web.xml�����õ�encoding.
       */
       public String toChi(String input) {
        if(input == null) {
         return null;
        } else {
         try {
          byte[] bytes = input.getBytes("ISO8859-1");
          return new String(bytes, encoding);
         } catch (Exception ex) {

         }
         return null;
        }      
       }

       /**
       * Return the HttpServletRequest holded by this object.
       */
       private HttpServletRequest getHttpServletRequest() {
        return (HttpServletRequest) super.getRequest();
       }

       /**
       * ��ȡ���� -- ��������������.
       */
       public String getParameter(String name) {
        return  toChi(super.getParameter(name));
       }

       /**
       * ��ȡ�����б� - ��������������.
       */
       public String[] getParameterValues(String name) {
        String values[] = super.getParameterValues(name);
        if (values != null) {
         for (int i = 0; i < values.length; i++) {
          values[i] = toChi(values[i]);
         }
        }
        return values;
       }
    }

   

    /**
     * Select and set (if specified) the character encoding to be used to
     * interpret request parameters for this request.
     *
     * @param request The servlet request we are processing
     * @param result The servlet response we are creating
     * @param chain The filter chain we are processing
     *
     * @exception IOException if an input/output error occurs
     * @exception ServletException if a servlet error occurs
     */
    public void doFilter(ServletRequest request, ServletResponse response,
        FilterChain chain) throws IOException, ServletException {

        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse res = (HttpServletResponse) response;

 //       HttpSession hs = req.getSession();
//        System.out.println(req.getPathInfo());
//        System.out.println(req.getRequestURI());
//        System.out.println(req.getQueryString());
        
        String contextPath= req.getContextPath();
        String path = req.getServletPath();
        path = path.substring(0, path.lastIndexOf("."));
        
        Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
        //��̨������ʱ�Ƿ�����û���¼        
        String isContrl=paraMap.get(Constans.PARA_SERVER_CAL_IS_CONTRL);
        if(isContrl==null)
        {
        	isContrl="0";
        }
        
        try {
          
//            if (!ignore) {
//                String encoding = this.selectEncoding(request);
//                HttpServletRequest httpreq = (HttpServletRequest) request; 
//               if (httpreq.getMethod().equals("POST")) { 
//                 request.setCharacterEncoding(encoding); 
//              } else { 
//                request = new Request(httpreq); 
//                } 
//               
//            }
        	
        	 if (!ignore) {
	                String encoding = this.selectEncoding(request);
	                if (encoding != null)
	                    request.setCharacterEncoding(encoding);
	            }
            
         


            
            //System.out.println("path==="+path);
            
            //�û���һ�ε�½
            if (path.equalsIgnoreCase("/login")
                    || path.equalsIgnoreCase("/authuser")
                    || path.equalsIgnoreCase("/modify_passwd")
                    || path.equalsIgnoreCase("/modify_passwd_do")
                    || path.equalsIgnoreCase("/authgroup")
                    || path.equalsIgnoreCase("/logout")) 
            {
                //����Ȩ�޺�session��֤
                chain.doFilter(request, response);
            }
            //�û������ķ���
            else {
                //session��֤
                HttpSession session = req.getSession();
                AuthBean authBean = (AuthBean) session.getAttribute("authBean");
                
                String msg="";
                if(authBean == null){
                    System.out.println("authBean û�д�session��ȡ��������");
                    res.sendRedirect(contextPath+this.timeoutpage);
                }else if(!authBean.isInitialized()){
                    System.out.println("authBean Ȩ��δ��ʼ��������");
                    res.sendRedirect(contextPath+this.timeoutpage);
                }
                //modify by qiuyun 2013-12-25
                //�ں�̨����ʱ�䷶Χ�ڣ����ǰ̨�ѵ�¼��ǿ���˳�ϵͳ
                
                else if("1".equals(isContrl)&&!isExceptUser(authBean)&&this.isCaling())
                {
                	 msg="��̨�����ڼ��������ǿ���˳�ϵͳ��";
                	 session.setAttribute("msg", msg);
                     res.sendRedirect(contextPath+this.otherlogin);
                }
                else{
                	LinkedHashMap sysparaMap = new LinkedHashMap();
                	sysparaMap.put(Constans.USE_SINUSERCTRL,use_sinuserctrl);
                	sysparaMap.put(Constans.AUTHTXT, authtextstorepath);
                	Authorization auth = authBean.getAuthToken();
                	 String sinUserCtrl = (String)sysparaMap.get(Constans.USE_SINUSERCTRL); // �Ƿ���Ҫ����һ���û���ͬʱֻ�ܵ�¼һ��
		                
		                if("1".equals(sinUserCtrl)) {
		                	String loginPwd = auth.getLoginPwd()+"\n";
		                	String authTextStorepath = (String)sysparaMap.get(Constans.AUTHTXT);  
		                	String name=authTextStorepath+auth.getT00_user().getUsername()+".txt";
		                	String newLoginPwd= FileUtils.readFile(name);
		                    if(!"".equals(loginPwd) && !"".equals(newLoginPwd) && !loginPwd.equalsIgnoreCase(newLoginPwd)) {
		                    	msg="��ǰ�û����������ط���¼��";
		                   	    session.setAttribute("msg", msg);
		                    	res.sendRedirect(contextPath+this.otherlogin);
		                    }
		                }
                    chain.doFilter(request, response);
                }
                
//                //����Ȩ����֤������Ȩ�ޣ�
//                /**
//                 * ϵͳ������ÿ��modulekey����Ӧ��ActionPath
//                 * �û���¼���֪���û����Է���ϵͳ����ҳ��
//                 * �ڱ��������жϵ�ǰ�û����ʵ�ҳ���Ƿ���Ȩ�޷�Χ�ڵġ�
//                 */
//                Authorization auth = authBean.getAuthToken();
//                if(!auth.havePagerAccessPower(path)){
//                    //path = req.getContextPath() + File.separator + this.privpage;
//                    //res.sendRedirect(path);
//                    res.sendRedirect(this.privpage);
//                }


            }

            // Pass control on to the next filter
            //chain.doFilter(request, response);

        }
        catch (Exception ee) {
            ee.printStackTrace();
        }

    }

    /**
     * Place this filter into service.
     *
     * @param filterConfig The filter configuration object
     */
    public void init(FilterConfig filterConfig) throws ServletException {

        this.filterConfig = filterConfig;
        this.privpage = filterConfig.getInitParameter("privpage");
        this.timeoutpage = filterConfig.getInitParameter("timeoutpage");
        this.otherlogin = filterConfig.getInitParameter("otherlogin");
        this.authtextstorepath = filterConfig.getInitParameter("authTextStorepath");
        this.use_sinuserctrl = filterConfig.getInitParameter("use_sinUserValue");
        this.encoding = filterConfig.getInitParameter("encoding");
        String value = filterConfig.getInitParameter("ignore");

        if (value == null)
            this.ignore = true;
        else if (value.equalsIgnoreCase("true"))
            this.ignore = true;
        else if (value.equalsIgnoreCase("yes"))
            this.ignore = true;
        else
            this.ignore = false;
        
       //modify by qiuyun ������������ĳ�ʼ��
        this.initOther();

    }

    /**
     * Select an appropriate character encoding to be used, based on the
     * characteristics of the current request and/or filter initialization
     * parameters. If no character encoding should be set, return
     * <code>null</code>.
     * <p>
     * The default implementation unconditionally returns the value configured
     * by the <strong>encoding</strong> initialization parameter for this
     * filter.
     *
     * @param request The servlet request we are processing
     */
    protected String selectEncoding(ServletRequest request) {

        return (this.encoding);

    }
    /**
     * ��ʼ����������
     * @return
     */
	protected void initOther() {
		
		String strClasspath = this.getClass().getResource("").getPath();
		String SysHomeDir = "";
		try {
			SysHomeDir = URLDecoder.decode(strClasspath, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//ȡ����ʵ��ϵͳĿ¼
		SysHomeDir = SysHomeDir.substring(0, SysHomeDir.indexOf("/WEB-INF/"));

		FileSystemResource resource = new FileSystemResource(SysHomeDir
				+ "/WEB-INF/system-config.xml");
		
		//��ʼ��system_config.xml����
		sysConfig = new XMLProperties(resource);
		
		//�������ļ��ж�ȡJDNI����		
		String jndiName=sysConfig.getProperty("jndi_name");		
		if(jndiName==null||"".equals(jndiName))
		{
			System.out.println("*********ע��system_config.xml�����ļ��д�������jndi_name�ڵ������**************");
		}
		
		try {
			Context ctx = new InitialContext();
			//����JDNI���ֳ�ʼ������Դ	
			
			ds = (DataSource) ctx.lookup(jndiName);

		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        //��ʼ������
		cm = new CatchManager(sysConfig, ds, new HashMap());
		

	}
	
	 /**
     * ��̨�Ƿ��ڼ�����
     * @return
     */
	protected boolean isCaling()
	{		
		boolean isQuery=false;//�Ƿ�ȥ��ѯt18_task_fact��������ִ�е�����
		//��̨���㿪ʼ��ʱ��ͽ���ʱ��
		Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
		String startTime_str=paraMap.get(Constans.PARA_SERVER_CAL_BEGIN);
		String endTime_str=paraMap.get(Constans.PARA_SERVER_CAL_END);
		if(startTime_str==null||"".equals(startTime_str))
		{
			startTime_str=Constans.SERVER_CAL_BEGIN_TIME;//Ĭ��ֵ��˵�20:00
		}
		if(endTime_str==null||"".equals(endTime_str))
		{
			endTime_str=Constans.SERVER_CAL_END_TIME;//Ĭ��ֵ��˵�08:00
		}
		
		Date currTime=new Date();//��ǰʱ��
		String currDate=DateUtils.dateToStringShort(currTime);//��ǰ����
		
		Date startTime_date=DateUtils.stringToDate(currDate+" "+startTime_str+":00");//��̨���㿪ʼʱ��
		Date endTime_date=DateUtils.stringToDate(currDate+" "+endTime_str+":00");//��̨�������ʱ��
		
		//��ʼʱ���ڽ���ʱ��֮ǰ˵�����ǿ����ʱ�䷶Χ
		if(startTime_date.before(endTime_date))
		{   
			//��ǰʱ���ڿ�ʼʱ��ͽ���ʱ����м�
			if(currTime.after(startTime_date)&&currTime.before(endTime_date))
			{
				isQuery=true;
			}
		}else{//����
			
			//��ǰʱ���ڿ�ʼʱ��֮������ʱ��֮ǰ
			if(currTime.after(startTime_date)||currTime.before(endTime_date))
			{
				isQuery=true;
			}
			
		}
		
		boolean isCaling=false;
		
		if(isQuery)
		{
			Connection conn=null;
			Statement stmt=null;
			ResultSet result=null;
			try {
				conn=ds.getConnection();
				stmt=conn.createStatement();
				String sql="select count(*) from t18_task_fact t where  t.calstatus="+Constans.SERVER_CAL_STATUS;
				result=stmt.executeQuery(sql);
				while(result.next())
				{
					int count=result.getInt(1);
					if(count>0)
					{
						isCaling=true;
						
					}
				}
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally
			{
				try {
					if(result!=null)
					{
						result.close();//���ݿ��ȿ����
					}
					if(stmt!=null)
					{
						stmt.close();
					}
					if(conn!=null)
					{
						conn.close();//�ر����ݿ�
					}
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}			
				
			}
			
			
		}
		
		
		return isCaling;
		
	}
	/**
     * �Ƿ���������û�
     * @return
     */
	protected boolean isExceptUser(AuthBean authBean)
	{
	    boolean	isExceptUser=false;
		Authorization auth=authBean.getAuthToken();
		String currUser=auth.getT00_user().getUsername();
		Map<String, String> paraMap=cm.getMapFromCache("t87_syspara");
		String exceptUser= paraMap.get(Constans.PARA_SERVER_CAL_CONTRL_USER);
		String[] users=exceptUser.split(",");
	 
		for(String user :users)
		{
			if(currUser.equals(user))
			{
				isExceptUser=true;
				break;
			}
			
		}
		
		return isExceptUser;
	
	}
		

}
