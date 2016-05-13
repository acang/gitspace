package com.web.filter;

import com.web.common.P;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import com.web.common.*;
import com.common.*;

import com.web.obj.*;
import com.web.common.beanutil.*;
import hibernate.db.*;
import java.util.*;
import com.web.bean.QueryRecord;
import com.lover.mng.*;
import com.web.servlet.InitEnvironment;

public class LoginFilter implements Filter
{

    public void init(FilterConfig filterConfig) throws ServletException
    {

    }

    public void doFilter(ServletRequest servletRequest,
        ServletResponse servletResponse, FilterChain chain) throws IOException,
        ServletException
    {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response = (HttpServletResponse) servletResponse;

        // adminname
        // adminpassword
        // System.out.println("������ˣ�:"+request.getRequestURI());
        Admininfo adminInfo = (Admininfo) request.getSession().getAttribute(
            SysDefine.SESSION_ADMIN_LOGIN_NAME);
        String adminname = SysCommonFunc.getStrParameter(request, "adminname1");

        int rt = 0;
        if (adminname != null)
            rt = 1;
        if ((adminInfo == null && adminname.trim().length() > 0)
            || (adminname != null && adminname.trim().length() > 0))
        {
            // String adminname =
            // SysCommonFunc.getStrParameter(request,"adminname");
            // System.out.println("��½�ʺ�"+adminname+":"+request.getRemoteAddr());
            String password = SysCommonFunc.getStrParameter(request,
                "adminpassword");
            String srand = (String) request.getSession().getAttribute("rand");
            String irand = SysCommonFunc.getStrParameter(request, "imager");

            if (srand == null || !srand.equals(irand.trim()))
            {

                System.out.println("��֤�벻��ȷ" + adminname);
                System.out.println("��֤�벻��ȷ" + adminname);
            }
            else if (adminname.length() > 0)
                adminInfo = AdminMng.adminLogin(adminname, password);

            if (adminInfo != null)
            {
                System.out
                    .println("-----------------�����ķָ���---��ֵ-------------------------");
                request.getSession().setAttribute(
                    SysDefine.SESSION_ADMIN_LOGIN_NAME, adminInfo);
                Date cdate = new Date(System.currentTimeMillis());
                IpLog iplog = new IpLog();
                iplog.setId(SysCommonFunc
                    .getSequenceIdForOracle(SysDefine.SEQ_IPLOG));
                iplog.setIsadmin(new Integer(1));
                iplog.setUserip(new Long(0));
                iplog.setLogintime(cdate);
                iplog.setLogintimestr(DateTools.DateToString(cdate,
                    DateTools.FORMART_yyyyMMddHHmmss));
                iplog.setSessionid(request.getSession().getId());
                iplog.setLogouttime(cdate);
                iplog.setUserid(adminInfo.getId());
                iplog.setUsername(adminInfo.getAdminname());
//                iplog.setUserstrip(request.getRemoteAddr());
                iplog.setUserstrip(IPTools.getIp(request));
                
                try
                {
                    HbmOperator
                        .executeSql("update ip_log set userip=1 where sessionid='"
                            + iplog.getSessionid() + "'");
                    HbmOperator.insert(iplog);
                }
                catch (Exception ee)
                {

                }
            }

        }
        // System.out.println("��������ж�"+adminInfo);
        StringBuffer fileURL = request.getRequestURL();
         // ���flag��ֵΪ�գ��ж������˵��ļ�����ΪͼƬ��������ִ��
         if (fileURL.indexOf(".jpg") > 0 || fileURL.indexOf(".bmp") > 0
           || fileURL.indexOf(".gif") > 0
           || fileURL.indexOf(".png") > 0 ||( fileURL.indexOf(".js") > 0 && fileURL.indexOf(".jsp") <= 0)|| fileURL.indexOf(".css") > 0) {
         }else  if (adminInfo == null)
        {
            System.out
                .println("-----------------�����ķָ���---ûֵ-------------------------");
            // System.out.println("û�е�½���ص���½ҳ��"+request.getRequestURL()+":"+request.getRemoteAddr());
            response.sendRedirect(request.getContextPath()
                + "/login/login.html?rt=" + rt);
            return;
        }

        // /�ж��Ƿ���Ҫ��¼ʱ��
        Long loptime = (Long) request.getSession().getAttribute("loptim");
        if (loptime == null)
        {
            loptime = new Long(System.currentTimeMillis());
            request.getSession().setAttribute("loptim", loptime);
        }
        Long lctime = new Long(System.currentTimeMillis());
        if (lctime.longValue() - loptime.longValue() > 1 * 60 * 1000)
        {
            String sql = "update ip_log set logouttime = to_date('"
                + DateTools.dateToString(new Date(lctime.longValue()), true)
                + "','YYYY-MM-DD HH24:MI:SS') where userip=0 and sessionid='"
                + request.getSession().getId() + "' and userid="
                + adminInfo.getId();
            try
            {
                HbmOperator.executeSql(sql);
                request.getSession().setAttribute("loptim", lctime);
            }
            catch (Exception ee)
            {

            }
        }

        chain.doFilter(servletRequest, servletResponse);
    }

    public void destroy()
    {

    }

}
