package com.web.common;

import javax.servlet.http.*;
import com.web.bean.*;
import com.web.obj.*;
import org.apache.commons.beanutils.*;
import hibernate.db.*;
import java.util.Enumeration;
import javax.servlet.*;
import com.common.SysDefine;
import java.util.*;
import com.lover.*;


public class SessionListener
    implements HttpSessionListener,HttpSessionAttributeListener  {

  /**
   * ���˵�½ʱ
   * 2006-11-23�޸�,�û�����ҳ,������½,��ʱsession�Ѵ���,�������ܼ�1,���Լ�1�Ĳ���ֻ��
   * �ŵ�������֤�����
   * @param httpSessionEvent HttpSessionEvent
   */
  public void sessionCreated(HttpSessionEvent httpSessionEvent) {
     HttpSession session = httpSessionEvent.getSession();
     CacheTools.setOnline(true,"add",session.getId());
     
  }

  //ע��ʱ
  public void sessionDestroyed(HttpSessionEvent httpSessionEvent)
  {
    HttpSession session = httpSessionEvent.getSession();
    CacheTools.setOnline(false,"remove",session.getId());

  }
  public void attributeAdded(HttpSessionBindingEvent httpSessionBindingEvent)
  {
      try
      {
         HttpSession session = httpSessionBindingEvent.getSession();
         if(httpSessionBindingEvent.getName().equals("IPLOG"))
         {
           Date cdate = new Date(System.currentTimeMillis());
           IpLog iplog = new IpLog();
           iplog.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_IPLOG));
           iplog.setIsadmin(new Integer(0));
           iplog.setLogintime(cdate);
           iplog.setLogintimestr(DateTools.DateToString(cdate,DateTools.FORMART_yyyyMMddHHmmss));
           iplog.setUserip(new Long(1));
           iplog.setSessionid(session.getId());
           iplog.setUserstrip(httpSessionBindingEvent.getValue().toString());
           HbmOperator.insert(iplog);
         }

      }catch(Exception e)
      {
         System.out.println(e.getMessage()+"����session���ӳ���");
      }

  }
  public void attributeRemoved(HttpSessionBindingEvent httpSessionBindingEvent)
  {

  }
  public void attributeReplaced(HttpSessionBindingEvent httpSessionBindingEvent)
  {

  }




}
