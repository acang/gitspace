package com.lover.mng;


import com.web.common.*;
import com.common.*;

import javax.servlet.http.HttpServletRequest;

import org.python.modules.newmodule;

import com.web.obj.*;
import com.web.common.beanutil.*;

import hibernate.db.*;

import java.util.*;

public class KFZXMng {
  public KFZXMng() {
  }


  public static String userAddKfzx(HttpServletRequest request,String email2)
  {
	  
     String s = null;
     String spp = (String)request.getSession().getAttribute("spp");
     String gspp = request.getParameter("spp");

     System.out.println("sp="+spp+"---"+"gsp="+gspp+"--"+IPTools.getIp(request));
     
     if(spp == null)
       return  "���ύ�ٶȹ��죬���Ժ��ύ��";
     if(gspp == null)
       return  "���ύ�ٶȹ��죬���Ժ��ύ��";
     if(spp.length() ==0)
       return  "���ύ�ٶȹ��죬���Ժ��ύ��";
     if(!spp.equals(gspp))
       return  "���ύ�ٶȹ��죬���Ժ��ύ��";

     Kfzx kfzx = (Kfzx)BeanInitializer.initBean(Kfzx.class,request);
     kfzx.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_KFZX));
     kfzx.setNdate(new Date(System.currentTimeMillis()));
     kfzx.setNtype(new Integer(0));
     kfzx.setZtai(new Integer(0));
//     kfzx.setIpaddress(request.getRemoteAddr());
     kfzx.setIpaddress(IPTools.getIp(request));
     kfzx.setEmail2(email2);
     kfzx.setHyid(new Long(0));
     kfzx.setSource(0);
     kfzx.setMobileoremail(1);
     try
     {
       HbmOperator.insert(kfzx);
     }catch(Exception e)
     {
        s = "�ύ���Գ����������Ա��ϵ��";
        System.out.println(e.getMessage());
     }

     return s;
  }
  
  public static String addKfzx(Kfzx kfzx)
  {
	  
     String s = null;
     kfzx.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_KFZX));
     
     try
     {
       HbmOperator.insert(kfzx);
     }catch(Exception e)
     {
        s = "�ύ���Գ����������Ա��ϵ��";
        System.out.println(e.getMessage());
     }

     return s;
  }

  public static Kfzx getKfzxFromId(String id)
  {
     List list = HbmOperator.list("from Kfzx as o where o.id="+id);
     if(list.size() >0)
       return (Kfzx)list.get(0);
     return null;
  }

  public static String sendBack(HttpServletRequest request)
  {
      String s = null;
      try
      {
        String id = SysCommonFunc.getStrParameter(request, "id");
        String sendUser = SysCommonFunc.getStrParameter(request, "senduser");
        String email = SysCommonFunc.getStrParameter(request, "email");
        String title = SysCommonFunc.getStrParameter(request, "title");
        String content = SysCommonFunc.getStrParameter(request, "content");


        Kfzx kfzx = KFZXMng.getKfzxFromId(id);
        kfzx.setNcontent(content);
        kfzx.setZtai(new Integer(1));
        kfzx.setDeletename("");
        long start = System.currentTimeMillis();

        HbmOperator.update(kfzx);

        System.out.println("�����ʼ�����ʱ�䣺"+(System.currentTimeMillis()-start)/1000+"��");
        start = System.currentTimeMillis();

        ///�����ʼ�
        boolean sendSuccess = MailTools.reMail(title,content,email);


        System.out.println("�����ʼ�����ʱ�䣺"+(System.currentTimeMillis()-start)/1000+"��");
        if(!sendSuccess)
          return "�ظ��ʼ�����";
      }catch(Exception e)
      {
          System.out.println(e.getMessage());
          s = "�ظ���Ϣ�������뿪������ϵ��";
      }
      return s;
  }
  
  public static String updateKfzx(HttpServletRequest request)
  {
      String s = null;
      try
      {
        String id = SysCommonFunc.getStrParameter(request, "id");
        String sendUser = SysCommonFunc.getStrParameter(request, "senduser");
        String email = SysCommonFunc.getStrParameter(request, "email");
        String title = SysCommonFunc.getStrParameter(request, "title");
        String content = SysCommonFunc.getStrParameter(request, "content");


        Kfzx kfzx = KFZXMng.getKfzxFromId(id);
        //if (kfzx.getNtitle()==null){
        	//kfzx.setNtitle(" ");
        //}
        kfzx.setNtitle(title);
        kfzx.setNcontent(content);
        kfzx.setZtai(new Integer(1));
        kfzx.setDeletename("");
        long start = System.currentTimeMillis();

        HbmOperator.update(kfzx);
      }catch(Exception e)
      {
          System.out.println(e.getMessage());
          s = "����������뿪������ϵ��";
      }
      return s;
  }
}
