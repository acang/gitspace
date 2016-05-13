package com.lover.mng; 

import com.web.common.*;
import com.common.*;
import com.web.obj.*;
import com.web.common.beanutil.*;

import java.util.*;

import com.web.servlet.InitEnvironment;

import java.util.*;

import javax.servlet.http.*;

import java.io.*;

import org.apache.commons.fileupload.*;

import hibernate.db.*;

import com.web.bean.*;
import com.lover.mng.*;

import java.math.*;
import java.text.*;





public class GRZQMng {
  public GRZQMng() {
  }



  public static String userAddPhotoA(HttpServletRequest  request, HttpSession session)
  {
    String s = null;
    try
    {
       Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
       Userother lother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
       if(loginUser == null)
         return "��½ʧЧ�����µ�½!";
       boolean mayUpPhoto = false;
       if(lother.getUserphoto1() == null || lother.getUserphoto1().trim().length() ==0)
         mayUpPhoto = true;
       if(lother.getUserphoto2() == null || lother.getUserphoto2().trim().length() ==0)
         mayUpPhoto = true;
       if(lother.getUserphoto3() == null || lother.getUserphoto3().trim().length() ==0)
         mayUpPhoto = true;
       if(lother.getUserphoto4() == null || lother.getUserphoto4().trim().length() ==0)
         mayUpPhoto = true;
       if(lother.getUserphoto5() == null || lother.getUserphoto5().trim().length() ==0)
         mayUpPhoto = true;
       if(!mayUpPhoto)
         return "��Ƭ��������ɾ�������ϴ�";


       DiskFileUpload df = new DiskFileUpload();
       Date cdate = new Date(System.currentTimeMillis());
       String cdates = DateTools.DateToString(cdate,DateTools.FORMART_yyyyMMdd);
       df.setSizeMax(1024*200);
       
       if(!DiskFileUpload.isMultipartContent(request))
         return "���ϴ���Ƭ��";



       List list = df.parseRequest(request);
       for(int i =0;i < list.size();i ++)
       {
          FileItem fi = (FileItem)list.get(i);
          if(!fi.isFormField()) ///�� �ļ�
          {
            String afilepath = SysCommonFunc.getPhotoPath();
            String afilepathsmall = SysCommonFunc.getPhotoSmalPath();

            File file = new File(afilepath+File.separator +cdates);
            if(!file.exists())
               file.mkdirs();
            file = new File(afilepathsmall+File.separator + cdates);
            if(!file.exists())
                file.mkdirs();

            String filename = fi.getName();
            if(filename == null || filename.trim().length() ==0)
              return "���ϴ���Ƭ��";
            if(!(filename.toLowerCase().endsWith(".jpg") || filename.toLowerCase().endsWith(".gif")))
              return "���ϴ�JPG��GIF��ʽ����Ƭ��";


            String afilename = cdates + File.separator+loginUser.getHyid()+"_"+System.currentTimeMillis()+filename.toLowerCase().substring(filename.length()-4);
            String afilenamepath = afilepath + File.separator + afilename;
            fi.write(new File(afilenamepath));
            fi.delete();

            //System.out.println("����ͼƬ�ɹ�");

            //ImageTools
            if(afilename.endsWith(".jpg"))
            {
              try
              {
                ImageUtil.dealImage(afilepath, afilename, afilepath, afilename);
                ImageUtil.resizePhotoJpg(afilepath,afilename,afilepathsmall,afilename,122,140);
              }catch(Exception e)
              {
                 System.out.println("����ˮӡ����"+afilepath + ":"+afilename);
              }
            }else
            {
                ImageUtil.dealGif(afilepath,afilename,afilepathsmall,afilename,122,140);
            }
            //System.out.println("����ͼƬ�ɹ�");

            if(lother.getUserphoto1() == null || lother.getUserphoto1().trim().length() ==0)
            {
                String[] sqlarray = new String[2];
                sqlarray[0] = "update userother set userphoto1='"+afilename+"' where hyid ="+lother.getHyid();

                if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
                {
                  sqlarray[1] = "update userinfo set img=" + 1 +
                      ",regtime3=sysdate,regtime2=sysdate where hyid =" +
                      loginUser.getHyid();
                }else
                {
                  sqlarray[1] = "update userinfo set img=" + 1 +
                      ",regtime3=sysdate  where hyid =" +
                      loginUser.getHyid();
                }

                 HbmOperator.executeSql(sqlarray);
                 lother.setUserphoto1(afilename);
                 loginUser.setImg(new Integer(1));
                return s;
            }else if(lother.getUserphoto2() == null || lother.getUserphoto2().trim().length() ==0){
                String[] sqlarray = new String[2];
                sqlarray[0] = "update userother set userphoto2='"+afilename+"' where hyid ="+lother.getHyid();
                if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
                {
                  sqlarray[1] = "update userinfo set img=" + 1 +
                      ",regtime3=sysdate,regtime2=sysdate where hyid =" +
                      loginUser.getHyid();
                }else
                {
                  sqlarray[1] = "update userinfo set img=" + 1 +
                      ",regtime3=sysdate where hyid =" +
                      loginUser.getHyid();

                }

                 HbmOperator.executeSql(sqlarray);
                 loginUser.setImg(new Integer(1));
                 lother.setUserphoto2(afilename);
                return s;
            }else if(lother.getUserphoto3() == null || lother.getUserphoto3().trim().length() ==0){

                 String[] sqlarray = new String[2];
                  sqlarray[0]= "update userother set userphoto3='"+afilename+"' where hyid ="+lother.getHyid();
                  if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
                  {
                    sqlarray[1] = "update userinfo set img=" + 1 +
                        ",regtime3=sysdate,regtime2=sysdate where hyid =" +
                        loginUser.getHyid();
                  }else
                  {
                    sqlarray[1] = "update userinfo set img=" + 1 +
                        ",regtime3=sysdate where hyid =" +
                        loginUser.getHyid();

                  }

                  HbmOperator.executeSql(sqlarray);
                  lother.setUserphoto3(afilename);
                  loginUser.setImg(new Integer(1));
                  return s;
            }else if(lother.getUserphoto4() == null || lother.getUserphoto4().trim().length() ==0){
                  String[] sqlarray = new String[2];
                  sqlarray[0] = "update userother set userphoto4='"+afilename+"' where hyid ="+lother.getHyid();
                  if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
                  {
                    sqlarray[1] = "update userinfo set img=" + 1 +
                        ",regtime3=sysdate,regtime2=sysdate where hyid =" +
                        loginUser.getHyid();
                  }else
                  {
                    sqlarray[1] = "update userinfo set img=" + 1 +
                        ",regtime3=sysdate where hyid =" +
                        loginUser.getHyid();

                  }

                   HbmOperator.executeSql(sqlarray);
                  lother.setUserphoto4(afilename);
                  loginUser.setImg(new Integer(1));

                  return s;
            }else if(lother.getUserphoto5() == null || lother.getUserphoto5().trim().length() ==0){
              String[] sqlarray = new String[2];
              sqlarray[0] = "update userother set userphoto5='" + afilename +
                  "' where hyid =" + lother.getHyid();
              if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
              {
                sqlarray[1] = "update userinfo set img=" + 1 +
                    ",regtime3=sysdate,regtime2=sysdate where hyid =" +
                    loginUser.getHyid();
              }else
              {
                sqlarray[1] = "update userinfo set img=" + 1 +
                    ",regtime3=sysdate where hyid =" +
                    loginUser.getHyid();

              }

              HbmOperator.executeSql(sqlarray);
              loginUser.setImg(new Integer(1));
              lother.setUserphoto5(afilename);
              return s;
            }
//                }else ///ȫ���Ѿ�����5��λ��
//              {
//                   ///ɾ��5���ļ�
//                   File dFile = new File(afilepath+File.separator+lother.getUserphoto5());
//                   dFile.delete();
//                   dFile = new File(afilepathsmall+File.separator+lother.getUserphoto5());
//                   dFile.delete();
//                   String[] sqlarray = new String[2];
//                   sqlarray[0] = "update userother set userphoto5='"+afilename+"' where hyid ="+lother.getHyid();
//                  sqlarray[1] = "update userinfo set img="+1+" where hyid ="+loginUser.getHyid();
//                  loginUser.setImg(new Integer(1));
//                      HbmOperator.executeSql(sqlarray);
//                      lother.setUserphoto5(afilename);
//              }

          }
       }
       //�����Ű���Ƭλ��
    }
    catch (Exception e) {
         System.out.println(e.getMessage());
         s = "�ϴ���Ƭ�����ļ�������С��";
    }

    return s;
  }

  public static String adminAddPhoto(HttpServletRequest  request, HttpSession session)
  {
    String s = null;
    try
    {

      DiskFileUpload df = new DiskFileUpload();

      df.setSizeMax(1024 * 200);
      if (!DiskFileUpload.isMultipartContent(request))
        return "���ϴ���Ƭ��";
      //       String hyid = SysCommonFunc.getStrParameter(request,"hyid");

      List list = df.parseRequest(request);
      String afilename = "";
      FileItem fifile = null;
      String hyid = "";
      String isdel = "";

      for (int i = 0; i < list.size(); i++) {
        FileItem fi = (FileItem) list.get(i);
        if (!fi.isFormField()) { ///�� �ļ�
          fifile = fi;
        }
        else {
          if (fi.getFieldName() != null && fi.getFieldName().equals("hyid")) {
            hyid = fi.getString();
          }
          if (fi.getFieldName() != null && fi.getFieldName().equals("isdel"))
            isdel = fi.getString();
          fi.delete();
        }
      }
      request.setAttribute("hyid",hyid);
      request.setAttribute("isdel",isdel);
      if (hyid.length() == 0)
        return "��ѡ���Ա��";

      Userinfo loginUser = null;
      if(isdel.equals("1"))
         loginUser= HYRegMng.getDelUserInfoByHyid(hyid);
      else
         loginUser = HYRegMng.getUserinfoByHyid(hyid);
      Userother lother = HYRegMng.getUserOtherByHyid(hyid);
      boolean mayUpPhoto = false;
      if (lother.getUserphoto1() == null ||
          lother.getUserphoto1().trim().length() == 0)
        mayUpPhoto = true;
      if (lother.getUserphoto2() == null ||
          lother.getUserphoto2().trim().length() == 0)
        mayUpPhoto = true;
      if (lother.getUserphoto3() == null ||
          lother.getUserphoto3().trim().length() == 0)
        mayUpPhoto = true;
      if (lother.getUserphoto4() == null ||
          lother.getUserphoto4().trim().length() == 0)
        mayUpPhoto = true;
      if (lother.getUserphoto5() == null ||
          lother.getUserphoto5().trim().length() == 0)
        mayUpPhoto = true;
      if (!mayUpPhoto)
        return "��Ƭ��������ɾ�������ϴ�";

      Date cdate = new Date(System.currentTimeMillis());
      Vector saveList = new Vector();
      if (lother == null) {
        lother = new Userother();
        lother.setHyid(loginUser.getHyid());
        lother.setUsername(loginUser.getUsername());
        MutSeaObject mso = new MutSeaObject();
        mso.setHbmSea(lother, MutSeaObject.SEA_HBM_INSERT);
        saveList.add(mso);
      }

      if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
      {
        String sql =
            "update userinfo set regtime2=sysdate where hyid=" +
            loginUser.getHyid();
        MutSeaObject mso = new MutSeaObject();
        mso = new MutSeaObject();
        mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
        saveList.add(mso);
      }







      HbmOperator.SeaMutData(saveList);
      saveList.clear();

      String cdates = DateTools.DateToString(cdate, DateTools.FORMART_yyyyMMdd);
      String afilepath = SysCommonFunc.getPhotoPath();
      String afilepathsmall = SysCommonFunc.getPhotoSmalPath();

      File file = new File(afilepath + File.separator + cdates);
      if (!file.exists())
        file.mkdirs();
      file = new File(afilepathsmall + File.separator + cdates);
      if (!file.exists())
        file.mkdirs();

      String filename = fifile.getName();
      if (filename == null || filename.trim().length() == 0)
        return "���ϴ���Ƭ��";
      if (! (filename.toLowerCase().endsWith(".jpg") ||
             filename.toLowerCase().endsWith(".gif")))
        return "���ϴ�JPG��GIF��ʽ����Ƭ��";

      afilename = cdates + File.separator + loginUser.getHyid() + "_" +
          System.currentTimeMillis() +
          filename.toLowerCase().substring(filename.length() - 4);
      String afilenamepath = afilepath + File.separator + afilename;
      fifile.write(new File(afilenamepath));
      fifile.delete();
      //ImageTools
      if (afilename.endsWith(".jpg")) {
        try {
          ImageUtil.dealImage(afilepath, afilename, afilepath, afilename);
          ImageUtil.resizePhotoJpg(afilepath, afilename, afilepathsmall,
                                   afilename, 122, 140);
        }
        catch (Exception e) {
          System.out.println("����ˮӡ����" + afilepath + ":" + afilename+":"+e.getMessage());
        }
      }
      else {
        ImageUtil.dealGif(afilepath, afilename, afilepathsmall, afilename, 122,
                          140);
      }


      //20090814�޸�ɾ����Ƭ������־��¼
      Admininfo adminLoginInfo = (Admininfo)request.getSession().getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
      OpLogMng.userAdminAPhotoLog(loginUser,adminLoginInfo,afilename);


      if (lother.getUserphoto1() == null ||
          lother.getUserphoto1().trim().length() == 0) {
        String[] sqlarray = new String[2];
        sqlarray[0] = "update userother set userphoto1='" + afilename +
            "' where hyid =" + lother.getHyid();
        sqlarray[1] = "update userinfo set img=" + 1 + " where hyid =" +
            loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
        lother.setUserphoto1(afilename);
        return s;
      }
      else if (lother.getUserphoto2() == null ||
               lother.getUserphoto2().trim().length() == 0) {
        String[] sqlarray = new String[2];
        sqlarray[0] = "update userother set userphoto2='" + afilename +
            "' where hyid =" + lother.getHyid();
        sqlarray[1] = "update userinfo set img=" + 1 + " where hyid =" +
            loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
        lother.setUserphoto2(afilename);
        GRZQMng.adminRsortPhoto(lother);
        return s;
      }
      else if (lother.getUserphoto3() == null ||
               lother.getUserphoto3().trim().length() == 0) {

        String[] sqlarray = new String[2];
        sqlarray[0] = "update userother set userphoto3='" + afilename +
            "' where hyid =" + lother.getHyid();

        sqlarray[1] = "update userinfo set img=" + 1 + " where hyid =" +
            loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
        lother.setUserphoto3(afilename);
        GRZQMng.adminRsortPhoto(lother);
        return s;
      }
      else if (lother.getUserphoto4() == null ||
               lother.getUserphoto4().trim().length() == 0) {
        String[] sqlarray = new String[2];
        sqlarray[0] = "update userother set userphoto4='" + afilename +
            "' where hyid =" + lother.getHyid();

        sqlarray[1] = "update userinfo set img=" + 1 + " where hyid =" +
            loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
        lother.setUserphoto4(afilename);
        GRZQMng.adminRsortPhoto(lother);
        return s;
      }
      else if (lother.getUserphoto5() == null ||
               lother.getUserphoto5().trim().length() == 0) {
        String[] sqlarray = new String[2];
        sqlarray[0] = "update userother set userphoto5='" + afilename +
            "' where hyid =" + lother.getHyid();

        sqlarray[1] = "update userinfo set img=" + 1 + " where hyid =" +
            loginUser.getHyid();
        HbmOperator.executeSql(sqlarray);
        lother.setUserphoto5(afilename);
        GRZQMng.adminRsortPhoto(lother);
        return s;
      }


//      }else ///ȫ���Ѿ�����5��λ��
//    {
//         ///ɾ��5���ļ�
//         File dFile = new File(afilepath+File.separator+lother.getUserphoto5());
//         dFile.delete();
//         dFile = new File(afilepathsmall+File.separator+lother.getUserphoto5());
//         dFile.delete();
//         String[] sqlarray = new String[2];
//         sqlarray[0] = "update userother set userphoto5='"+afilename+"' where hyid ="+lother.getHyid();
//
//
//
//
//        sqlarray[1] = "update userinfo set img="+1+" where hyid ="+loginUser.getHyid();
//            HbmOperator.executeSql(sqlarray);
//            lother.setUserphoto5(afilename);
//    }

    }
    catch (Exception e) {
         System.out.println(e.getMessage());
         e.printStackTrace();
         s = "�ϴ���Ƭ�����������Ա��ϵ��";
    }
    return s;
  }


  public static void adminRsortPhoto(Userother uother)
  {
      Vector v = new Vector();
      if(uother.getUserphoto1() != null)
        v.add(uother.getUserphoto1());
      if(uother.getUserphoto2() != null)
        v.add(uother.getUserphoto2());
      if(uother.getUserphoto3() != null)
        v.add(uother.getUserphoto3());
      if(uother.getUserphoto4() != null)
        v.add(uother.getUserphoto4());
      if(uother.getUserphoto5() != null)
        v.add(uother.getUserphoto5());
      if(v.size() ==1)
        return;
      String endp = (String)v.elementAt(v.size()-1);

      //System.out.println(endp);
      v.remove(v.size()-1);
      v.insertElementAt(endp,0);
      for(int i  =0;i < v.size();i ++)
      {
        if(i == 0)
           uother.setUserphoto1((String)v.elementAt(i));
        else if(i == 1)
           uother.setUserphoto2((String)v.elementAt(i));
        else if(i == 2)
           uother.setUserphoto3((String)v.elementAt(i));
        else if(i == 3)
           uother.setUserphoto4((String)v.elementAt(i));
        else if(i == 4)
           uother.setUserphoto5((String)v.elementAt(i));
      }
      try
      {
        HbmOperator.update(uother);
      }catch(Exception e)
      {
         System.out.println("����Ա���°�����Ƭ����"+e.getMessage());
      }

  }


  public static String userRemovePhotoA(HttpServletRequest  request, HttpSession session)
  {
     String s = null;
     try
     {
        String rid = SysCommonFunc.getStrParameter(request,"bj");
        Userother lother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
        Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
        if(rid != null && rid.length() > 0)
        {
           String photo=null;
           if(rid.equals("1"))
             photo=lother.getUserphoto1();
           if(rid.equals("2"))
             photo=lother.getUserphoto2();
           if(rid.equals("3"))
             photo=lother.getUserphoto3();
           if(rid.equals("4"))
             photo=lother.getUserphoto4();
           if(rid.equals("5"))
             photo=lother.getUserphoto5();
           if(photo != null && photo.length() > 0)
           {

             String afilepath = SysCommonFunc.getPhotoPath();
             String afilepathsmall = SysCommonFunc.getPhotoSmalPath();
             File file = new File(afilepath + File.separator + photo);
             try
             {
               file.delete();
               file = new File(afilepathsmall + File.separator + photo);
               file.delete();
             }catch(Exception e){
               System.out.println(e.getMessage());
             }
             String sql = "update userother set userphoto"+rid+"='' where hyid ="+lother.getHyid();
             HbmOperator.executeSql(sql);
             if(rid.equals("1"))
               lother.setUserphoto1("");
             if(rid.equals("2"))
               lother.setUserphoto2("");
             if(rid.equals("3"))
               lother.setUserphoto3("");
             if(rid.equals("4"))
               lother.setUserphoto4("");
             if(rid.equals("5"))
               lother.setUserphoto5("");
           }
           int img = 0;
           if(lother.getUserphoto1() != null && lother.getUserphoto1().length() > 0)
              img = img+1;
            if(lother.getUserphoto2() != null && lother.getUserphoto2().length() > 0)
              img = img+1;
            if(lother.getUserphoto3() != null && lother.getUserphoto3().length() > 0)
              img = img+1;
            if(lother.getUserphoto4() != null && lother.getUserphoto4().length() > 0)
              img = img+1;
            if(lother.getUserphoto5() != null && lother.getUserphoto5().length() > 0)
              img = img+1;
            int imgnumber = img == 0 ? 0:1;

            if(loginUser.getSex() != null && loginUser.getSex().equals("11"))
            {
              String sql = "update userinfo set img=" + imgnumber +
                  "where hyid =" + lother.getHyid();
              HbmOperator.executeSql(sql);
            }else
            {
              String sql = "update userinfo set img=" + imgnumber +" where hyid =" + lother.getHyid();
              HbmOperator.executeSql(sql);
            }




               loginUser.setImg(new Integer(imgnumber));
            ///�����Ű���Ƭλ��
            if(img > 0 && img < 5)
            {
               System.out.println("���°���λ��");
               String[] pArray= new String[img];
               int index = 0;
               if(lother.getUserphoto1() != null && lother.getUserphoto1().length() > 0)
               {
                  pArray[index] = lother.getUserphoto1();
                  index = index+1;
               }
               if(lother.getUserphoto2() != null && lother.getUserphoto2().length() > 0)
               {
                  pArray[index] = lother.getUserphoto2();
                  index = index+1;
               }
               if(lother.getUserphoto3() != null && lother.getUserphoto3().length() > 0)
               {
                  pArray[index] = lother.getUserphoto3();
                  index = index+1;
               }
               if(lother.getUserphoto4() != null && lother.getUserphoto4().length() > 0)
               {
                  pArray[index] = lother.getUserphoto4();
                  index = index+1;
               }
               if(lother.getUserphoto5() != null && lother.getUserphoto5().length() > 0)
               {
                  pArray[index] = lother.getUserphoto5();
                  index = index+1;
               }
               index = 0;
               if(index < pArray.length)
               {
                 lother.setUserphoto1(pArray[index]);
                 index = index +1;
               }else
               {
                  lother.setUserphoto1("");
               }
               if(index < pArray.length)
               {
                 lother.setUserphoto2(pArray[index]);
                 index = index +1;
               }else
               {
                  lother.setUserphoto2("");
               }

               if(index < pArray.length)
               {
                 lother.setUserphoto3(pArray[index]);
                 index = index +1;
               }else
               {
                  lother.setUserphoto3("");
               }

               if(index < pArray.length)
               {
                 lother.setUserphoto4(pArray[index]);
                 index = index +1;
               }else
               {
                  lother.setUserphoto4("");
               }

               if(index < pArray.length)
               {
                 lother.setUserphoto5(pArray[index]);
                 index = index +1;
               }else
               {
                  lother.setUserphoto5("");
               }
               HbmOperator.update(lother);
            }


        }
     }catch(Exception e)
     {
        System.out.println(e.getMessage());
     }
     return s;
  }

  public static String userAddArticle(HttpServletRequest request,Userinfo user)
  {
       String s = null;
       String title = SysCommonFunc.getStrParameter(request,"title");
       title=title.replace("script", "");
       title=title.replace("iframe", "");
      String article = SysCommonFunc.getStrParameter(request,"article");
      article=article.replace("script", "");
      article=article.replace("iframe", "");
      //article = SysCommonFunc.textToHtml(article);
      if(article.length() > 3000)
        return "�������3000�����ڣ�";
      List arList = GRZQMng.getUserArticleList(user);
      if(arList!= null && arList.size() > 7)
      {
        //System.out.println("is "+arList.size());
        return "�����ļ���������ɾ�������ϴ�";
      }
      try
      {
        Userarticle uarticle = new Userarticle();
        Bcb bigContentS = new Bcb();
        Long id = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HY_ARTICLE);
        Long contentid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_BCB);

        Vector saveList = new Vector();

        uarticle.setContentid(contentid);
        uarticle.setCreatetime(new Date(System.currentTimeMillis()));
        uarticle.setHyid(user.getHyid());
        uarticle.setHyname(user.getUsername());
        uarticle.setId(id);
        uarticle.setLcname(user.getLcname());
        uarticle.setTitle(title);

        MutSeaObject mso = new MutSeaObject();
        mso.setHbmSea(uarticle,MutSeaObject.SEA_HBM_INSERT);
        saveList.add(mso);

        mso = new MutSeaObject();
        bigContentS.setId(contentid);
        //bigContentS.setContent(article);
        mso.setHbmSea(bigContentS,MutSeaObject.SEA_HBM_INSERT);
        mso.setBlobStream(new ByteArrayInputStream(article.getBytes()),"content");
        saveList.add(mso);

        if(user.getSex() != null && user.getSex().equals("11"))
        {
          String sql =
              "update userinfo set regtime3=sysdate,regtime2=sysdate where hyid=" +
              user.getHyid();
          mso = new MutSeaObject();
          mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
          saveList.add(mso);
        }else
        {
          String sql =
              "update userinfo set regtime3=sysdate where hyid=" +
              user.getHyid();
          mso = new MutSeaObject();
          mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
          saveList.add(mso);
        }



        HbmOperator.SeaMutDataWithBlob(saveList);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         return "�ϴ��ļ������������Ա��ϵ��";
      }


    return s;
  }

  public static String userUpdateArticle(HttpServletRequest request,Userinfo user)
  {
       String s = null;
       String articleid = SysCommonFunc.getStrParameter(request,"articleid");
       String title = SysCommonFunc.getStrParameter(request,"title");
       title=title.replace("script", "");
       title=title.replace("iframe", "");
      String article = SysCommonFunc.getStrParameter(request,"article");
      article=article.replace("script", "");
      article=article.replace("iframe", "");
      //article = SysCommonFunc.textToHtml(article);
      if(article.length() > 3000)
        return "�������3000�����ڣ�";

      try
      {
        Userarticle uarticle = GRZQMng.getUserArticle(user.getHyid().toString(),articleid);


        Vector saveList = new Vector();

        uarticle.setTitle(title);

        MutSeaObject mso = new MutSeaObject();
        mso.setHbmSea(uarticle,MutSeaObject.SEA_HBM_UPDATE);
        saveList.add(mso);


        Bcb bcb = new Bcb();



        mso = new MutSeaObject();
        bcb.setId(uarticle.getContentid());

        mso.setHbmSea(bcb,MutSeaObject.SEA_HBM_UPDATE);
        mso.setBlobStream(new ByteArrayInputStream(article.getBytes()),"content");
        saveList.add(mso);

        if(user.getSex() != null && user.getSex().equals("11"))
        {
          String sql =
              "update userinfo set regtime3=sysdate,regtime2=sysdate where hyid=" +
              user.getHyid();
          mso = new MutSeaObject();
          mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
          saveList.add(mso);
        }else
        {
          String sql =
              "update userinfo set regtime3=sysdate where hyid=" +
              user.getHyid();
          mso = new MutSeaObject();
          mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
          saveList.add(mso);
        }



        HbmOperator.SeaMutDataWithBlob(saveList);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         return "�ϴ��ļ������������Ա��ϵ��";
      }


    return s;
  }



  public static String adminAddArticle(HttpServletRequest request,Userinfo user)
  {
      String s = null;
       String title = SysCommonFunc.getStrParameter(request,"title");
      String article = SysCommonFunc.getStrParameter(request,"article");
      title=title.replace("script", "");
      title=title.replace("iframe", "");
      article=article.replace("script", "");
      article=article.replace("iframe", "");
      article = SysCommonFunc.textToHtml(article);
      if(article.length() > 3000)
        return "�������3000�����ڣ�";
      try
      {
        Userarticle uarticle = new Userarticle();
        Bcb bigContentS = new Bcb();
        Long id = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HY_ARTICLE);
        Long contentid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_BCB);

        Vector saveList = new Vector();

        uarticle.setContentid(contentid);
        uarticle.setCreatetime(new Date(System.currentTimeMillis()));
        uarticle.setHyid(user.getHyid());
        uarticle.setHyname(user.getUsername());
        uarticle.setId(id);
        uarticle.setLcname(user.getLcname());
        uarticle.setTitle(title);

        MutSeaObject mso = new MutSeaObject();
        mso.setHbmSea(uarticle,MutSeaObject.SEA_HBM_INSERT);
        saveList.add(mso);

        mso = new MutSeaObject();
        bigContentS.setId(contentid);
        //bigContentS.setContent(article);
        mso.setHbmSea(bigContentS,MutSeaObject.SEA_HBM_INSERT);
        mso.setBlobStream(new ByteArrayInputStream(article.getBytes()),"content");
        saveList.add(mso);

      if(user.getSex() != null && user.getSex().equals("11"))
      {
        String sql =
            "update userinfo set regtime2=sysdate where hyid=" +
            user.getHyid();
        mso = new MutSeaObject();
        mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
        saveList.add(mso);
      }


        HbmOperator.SeaMutDataWithBlob(saveList);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         return "�ϴ��ļ������������Ա��ϵ��";
      }


    return s;
  }

  public static String adminModArticle(HttpServletRequest request,Userinfo user,Userarticle uarticle,Bcb bigContentS)
  {
      String s = null;
       String title = SysCommonFunc.getStrParameter(request,"title");
      String article = SysCommonFunc.getStrParameter(request,"article");
      title=title.replace("script", "");
      title=title.replace("iframe", "");
      article=article.replace("script", "");
      article=article.replace("iframe", "");
      if(article.length() > 3000)
        return "�������3000�����ڣ�";
      try
      {
        Vector saveList = new Vector();
        MutSeaObject mso = null;
        if(bigContentS == null || bigContentS.getId() == null)
        {
           Long contentid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_BCB);
           uarticle.setContentid(contentid);
           bigContentS = new Bcb();
           bigContentS.setId(contentid);
           //bigContentS.setContent(article);
           mso = new MutSeaObject();
           mso.setHbmSea(bigContentS,MutSeaObject.SEA_HBM_INSERT);
           mso.setBlobStream(new ByteArrayInputStream(article.getBytes()),"content");
           saveList.add(mso);
        }else
        {
          ///bigContentS.setContent(article);
          //System.out.println(bigContentS.getId());
          mso = new MutSeaObject();
          mso.setHbmSea(bigContentS,MutSeaObject.SEA_HBM_UPDATE);
          mso.setBlobStream(new ByteArrayInputStream(article.getBytes()),"content");
          saveList.add(mso);
        }
        //System.out.println(article);


        uarticle.setCreatetime(new Date(System.currentTimeMillis()));
        uarticle.setHyid(user.getHyid());
        uarticle.setHyname(user.getUsername());
        uarticle.setLcname(user.getLcname());
        uarticle.setTitle(title);

        mso = new MutSeaObject();
        mso.setHbmSea(uarticle,MutSeaObject.SEA_HBM_UPDATE);
        saveList.add(mso);

        if(user.getSex() != null && user.getSex().equals("11"))
        {
          String sql =
              "update userinfo set regtime2=sysdate where hyid=" +
              user.getHyid();
          mso = new MutSeaObject();
          mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
          saveList.add(mso);
        }


        HbmOperator.SeaMutDataWithBlob(saveList);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         return "�ϴ��ļ������������Ա��ϵ��";
      }


    return s;
  }

  public static String userDelArticle(HttpServletRequest request,Userinfo user)
  {
    String s = null;
    try
    {
        String delid = request.getParameter("delid");
        String cid   = request.getParameter("cid");
        String sql = "delete from userarticle where id = "+delid+" and hyid="+user.getHyid();
        String sql1 = "delete from bcb where id="+cid;
        String sql2 = "update userinfo set regtime3=sysdate where hyid="+user.getHyid();
        if(user.getSex() != null && user.getSex().equals("11"))
       {
          sql2 = "update userinfo set regtime3=sysdate,regtime2=sysdate where hyid="+user.getHyid();
       }else
       {
         sql2 = "update userinfo set  regtime3=regtime3 where hyid="+user.getHyid();
       }




        String[] sqlArray = new String[]{sql,sql1,sql2};
        HbmOperator.executeSql(sqlArray);
    }catch(Exception e)
    {
       System.out.println(e.getMessage());
       return "ɾ���ļ������������Ա��ϵ��";
    }
    return s;
  }


  /**
   * �޸ĸ��˿����趨
   * @param request HttpServletRequest
   * @param user Userinfo
   * @param hyset Hyset
   * @return String
   */
  public static String userUpdateHyset(HttpServletRequest request,Userinfo user)
  {
       String s =null;
       Hyset hyset = GRZQMng.getHyset(user);
       if(hyset == null)
         hyset = (Hyset)BeanInitializer.initBean(Hyset.class,request);
       else
         BeanInitializer.updateBean(hyset,request);
       Vector saveList = new Vector();

       try
       {
         MutSeaObject mso = new MutSeaObject();
         if (hyset.getHyid() == null) {
           hyset.setHyid(user.getHyid());
           mso.setHbmSea(hyset, MutSeaObject.SEA_HBM_INSERT);
         }
         else {
           mso.setHbmSea(hyset, MutSeaObject.SEA_HBM_UPDATE);
         }
         saveList.add(mso);

         mso = new MutSeaObject();


         user.setSetzt(new Integer(SysCommonFunc.getStrParameter(request,"setzt")));
         user.setRegtime3(new Date(System.currentTimeMillis()));
         user.setRegtime2(new Date(System.currentTimeMillis())); //�޸�ע��ʱ�䣬ͬʱ�޸���ҳ��ע���Աչʾ
         mso.setHbmSea(user,MutSeaObject.SEA_HBM_UPDATE);
         saveList.add(mso);
         ///�����û��޸�ʱ��ʱ��

        if(user.getSex() != null && user.getSex().equals("11"))
      {
        String sql =
            "update userinfo set regtime3=sysdate,regtime2=sysdate where hyid=" +
            user.getHyid();
        mso = new MutSeaObject();
        mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
        saveList.add(mso);
      }


         HbmOperator.SeaMutData(saveList);

       }catch(Exception e)
       {
         System.out.println(e.getMessage());
         s = "���¿����趨�����������Ա��ϵ��";
       }

       return s;
  }

  /**
   * �޸ĸ��˿����趨
   * @param request HttpServletRequest
   * @param user Userinfo
   * @param hyset Hyset
   * @return String
   */
  public static String adminUpdateHyset(HttpServletRequest request)
  {
       String s =null;
       String hyid = SysCommonFunc.getStrParameter(request,"id");
       String isdel = SysCommonFunc.getStrParameter(request,"isdel");

       Userinfo user = null;
       if(isdel.equals("1"))
         user= HYRegMng.getDelUserInfoByHyid(hyid);
       else
         user = HYRegMng.getUserinfoByHyid(hyid);
       Hyset hyset = GRZQMng.getHyset(user);
       if(hyset == null)
         hyset = (Hyset)BeanInitializer.initBean(Hyset.class,request);
       else
         BeanInitializer.updateBean(hyset,request);
       Vector saveList = new Vector();

       try
       {
         MutSeaObject mso = new MutSeaObject();
         if (hyset.getHyid() == null) {
           hyset.setHyid(user.getHyid());
           mso.setHbmSea(hyset, MutSeaObject.SEA_HBM_INSERT);
         }
         else {
           mso.setHbmSea(hyset, MutSeaObject.SEA_HBM_UPDATE);
         }
         saveList.add(mso);

         mso = new MutSeaObject();


         user.setSetzt(new Integer(SysCommonFunc.getStrParameter(request,"setzt")));
         user.setRegtime2(new Date(System.currentTimeMillis()));
         mso.setHbmSea(user,MutSeaObject.SEA_HBM_UPDATE);
         saveList.add(mso);

         if(user.getSex() != null && user.getSex().equals("11"))
         {
           String sql =
               "update userinfo set regtime2=sysdate where hyid=" +
               user.getHyid();
           mso = new MutSeaObject();
           mso.setSqlSea(sql, mso.SEA_SQL_UPDATE);
           saveList.add(mso);
         }



         HbmOperator.SeaMutData(saveList);

       }catch(Exception e)
       {
         System.out.println(e.getMessage());
         s = "���¿����趨�����������Ա��ϵ��";
       }

       return s;
  }



  public static Hyset getHyset(Userinfo user)
  {
      Hyset hyset = null;
      List list = HbmOperator.list("from Hyset as o where o.hyid="+user.getHyid().longValue());
      if(list != null && list.size() > 0)
        return (Hyset)list.get(0);
      return hyset;
  }

  public static List getUserArticleList(Userinfo user)
  {
     try
     {
        String sql = "from Userarticle as o where o.hyid = " +user.getHyid() + " and o.title not like '%script%' and o.title not like '%iframe%' and o.title not like '%onload%' and o.title not like '%url%' and o.title not like '%src%' and o.title not like '%href%' and o.title not like '%load%' and o.title not like '%frame%' order by id desc";
        return HbmOperator.list(sql);
     }catch(Exception e)
     {
        System.out.println(e.getMessage());
     }
     return null;
  }
  
  public static QueryResult getUserArticleListPage(Long hyid,int page,int pagesize)
  {
      QueryResult qr = null;
      try
      {
          String sql = "from Userarticle as o where o.hyid = " +hyid + " and o.title not like '%script%' and o.title not like '%iframe%' and o.title not like '%onload%' and o.title not like '%url%' and o.title not like '%src%' and o.title not like '%href%' and o.title not like '%load%' and o.title not like '%frame%' order by id desc";
                  qr = QueryRecord.queryByHbm(sql,pagesize,page);
       }catch(Exception e)
      {
          System.out.println(e.getMessage());
      }
      return qr;
  }


  public static Userarticle getUserArticle(String hyid,String aid)
  {
    try
    {
       String sql = "from Userarticle as o where o.id = " +aid + " and o.hyid = "+hyid;
       List list = HbmOperator.list(sql);
       if(list.size() > 0)
         return (Userarticle)list.get(0);

    }catch(Exception e)
    {
       System.out.println(e.getMessage());
    }
    return null;

  }


  /**
   * �õ����ѹ�����Ϣ
   * @param userinfo Userinfo
   * @param sqtype int
   * @return List
   */
  public static QueryResult getHYMD(Userinfo userinfo,int sqtype,int page,int pagesize)
  {
      String sql = "from Hygl as o where o.myid="+userinfo.getHyid().longValue() + " and o.sqtype="+sqtype + " order by id desc";

      return QueryRecord.queryByHbm(sql,pagesize,page);
  }


  public static String[] getGrzqNumber(Userinfo userinfo)
  {
     String[] array = new String[4];
     long notqiubo =    SysCommonFunc.getNumberForSql("select count(*) from db_qiubo where postuserid="+userinfo.getHyid() + " and (isread='0' or isread is null )").longValue();
     array[0] = notqiubo+"";
     String sql = "select count(*) from hygl where myid="+userinfo.getHyid() + " and sqtype = " + SysDefine.SYSTEM_HYGL_SQ;
     array[1] = SysCommonFunc.getNumberForSql(sql).toString();
     sql = "select count(*) from hyly   where hyid = "+ userinfo.getHyid();
     array[2] = SysCommonFunc.getNumberForSql(sql).toString();
     sql = "select count(*) from hytj   where myid = "+ userinfo.getHyid();
     array[3] = SysCommonFunc.getNumberForSql(sql).toString();
     return array;
  }


  public static boolean isHy(Userinfo userinfo,int sqtype,Userinfo other)
  {
       boolean isHy = false;
       String sql = "from Hygl as o where o.myid="+userinfo.getHyid() + " and o.sqtype = " + sqtype +  " and o.sqid="+other.getHyid();
       List list = HbmOperator.list(sql);
       if(list.size() >0)
         isHy = true;

       return isHy;
  }

  public static boolean isAddHy(Userinfo userinfo) ///�����Ƿ���˺���
  {
      boolean  result = false;
      String today = DateTools.DateToString(new Date(),"yyyy-MM-dd");

      List hylist = HbmOperator.list("from Hygl as o where o.myid = " +userinfo.getHyid() + " and o.riqi>to_date('"+today+"','yyyy-MM-dd')");
      if(hylist!=null && hylist.size()>1){
          result = true;
      }
      return  result;
  }

   public static String addHy(Userinfo userinfo,String hyid) ///������Ϣҳ��쿴��������
   {
      String s = null;
      try
      {
        List hylist = HbmOperator.list("from Hygl as o where o.myid = " +
                                       userinfo.getHyid() + " and o.sqid=" + hyid);
        ///��������˶����ͬ���ѽ���ɾ��
        if (hylist != null && hylist.size() > 1)
          HbmOperator.executeSql("delete from hygl where myid=" +
                                 userinfo.getHyid() + " and sqid=" + hyid);
        Hygl hygl = null;
        if(hylist != null && hylist.size() ==1)
           hygl = (Hygl)hylist.get(0);
         Userinfo hyUser = HYRegMng.getUserinfoByHyid(hyid);
         if(hyUser == null)
            return "�û�Ա��Ϣ�����ڣ�";
        Vector saveList = new Vector();
        MutSeaObject mso = null;
        if(hygl !=null)
        {
           if(hygl.getSqtype() != null && hygl.getSqtype().intValue() == SysDefine.SYSTEM_HYGL_FRIEND) //�Ѿ��Ǻ���
             return s;
           else
           {
               hygl.setSqtype(new Integer(SysDefine.SYSTEM_HYGL_FRIEND));
               mso = new MutSeaObject();
               mso.setHbmSea(hygl,MutSeaObject.SEA_HBM_UPDATE);
               saveList.add(mso);
           }
        }else
        {
            Long hyglid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HYGL);
            hygl = new Hygl();
            hygl.setId(hyglid);
            hygl.setMyid(userinfo.getHyid());
            hygl.setMylc(userinfo.getLcname());
            hygl.setMyname(userinfo.getUsername());
            hygl.setRiqi(new Date(System.currentTimeMillis()));
            hygl.setSqid(hyUser.getHyid());
            hygl.setSqlc(hyUser.getLcname());
            hygl.setSqname(hyUser.getUsername());
            hygl.setSqtype(new Integer(SysDefine.SYSTEM_HYGL_FRIEND));
            mso = new MutSeaObject();
            mso.setHbmSea(hygl,MutSeaObject.SEA_HBM_INSERT);
            saveList.add(mso);
        }
        ///���ӶԷ�����
        Long hyglid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HYGL);
        Hygl hyglSq = new Hygl();
        hyglSq.setId(hyglid);
        hyglSq.setMyid(hyUser.getHyid());
        hyglSq.setMylc(hyUser.getLcname());
        hyglSq.setMyname(hyUser.getUsername());
        hyglSq.setRiqi(new Date(System.currentTimeMillis()));
        hyglSq.setSqid(userinfo.getHyid());
        hyglSq.setSqlc(userinfo.getLcname());
        hyglSq.setSqname(userinfo.getUsername());
        hyglSq.setSqtype(new Integer(SysDefine.SYSTEM_HYGL_SQ));
        mso = new MutSeaObject();
        mso.setHbmSea(hyglSq,MutSeaObject.SEA_HBM_INSERT);
        saveList.add(mso);
        HbmOperator.SeaMutData(saveList);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         s = "��Ӻ��ѳ����������Ա��ϵ��";
      }
      return s;
   }

   public static String addToBlack(Userinfo userinfo,String hyid) ///
   {
      String s = null;
      try
      {

        ///��������˶����ͬ���ѽ���ɾ��
          HbmOperator.executeSql("delete from hygl where myid=" +
                                 userinfo.getHyid() + " and sqid=" + hyid);
        Userinfo hyUser = HYRegMng.getUserinfoByHyid(hyid);
         if(hyUser == null)
            return "�û�Ա��Ϣ�����ڣ�";
        Long hyglid = SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HYGL);
        Hygl hygl = new Hygl();
        hygl.setId(hyglid);
        hygl.setMyid(userinfo.getHyid());
        hygl.setMylc(userinfo.getLcname());
        hygl.setMyname(userinfo.getUsername());
        hygl.setRiqi(new Date(System.currentTimeMillis()));
        hygl.setSqid(hyUser.getHyid());
        hygl.setSqlc(hyUser.getLcname());
        hygl.setSqname(hyUser.getUsername());
        hygl.setSqtype(new Integer(SysDefine.SYSTEM_HYGL_BLACK));
        HbmOperator.insert(hygl);

      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         s = "��������������������Ա��ϵ��";
      }
      return s;
   }

   public static String addQiubo(Userinfo user,String hyid)
   {
      String s = null;
      try
      {
        List list = HbmOperator.list("from DbQiubo as o where o.senduserid=" +
                                     user.getHyid() + " and o.postuserid=" + hyid);
        //System.out.println("���뵽htdb");
        int qiubozt = 0;
        if (list != null && list.size() > 0)
          qiubozt = 1;
        Userinfo hyInfo = HYRegMng.getUserinfoByHyid(hyid);
        if (hyInfo == null)
          return "��Ա��Ϣ�����ڣ�";
        DbQiubo dq = new DbQiubo();
        dq.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_QIUBO));
        dq.setPostuserid(hyInfo.getHyid());
        dq.setPostusername(hyInfo.getUsername());
        dq.setSendtime(new Date(System.currentTimeMillis()));
        dq.setSenduserid(user.getHyid());
        dq.setSendusername(user.getUsername());
        dq.setZt(new Integer(qiubozt));
        HbmOperator.insert(dq);
        
        //add by gaojianhong for �����ﲨʱ���û��ﲨ���е���������1��ֱ�Ӳ����µļ�¼ start
        //�ж��Ƿ�����û��ﲨ����
        Calendar calendar = Calendar.getInstance();
	    calendar.add(Calendar.MONTH,-6); //�õ�����ǰ
	    Date date = calendar.getTime();
	    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	    DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (hyInfo.getLasttime().after(sdf.parse(df.format(date)+" 00:00:00"))){
	        int qiubo_number=0;
	        UserQiuboMng userQiuboMng=new UserQiuboMng();
	        Userqiubo userqiubo=userQiuboMng.getUserqiubo(hyInfo.getHyid().toString());
	        if (userqiubo!=null){
	        	qiubo_number=userqiubo.getQiubo_number()+1;
	        	userqiubo.setQiubo_number(qiubo_number);
	        	HbmOperator.update(userqiubo);
	        }else{
	        	qiubo_number=userQiuboMng.getUserqiubo_number(hyInfo.getHyid());
	        	userQiuboMng.insertUserqiubo(hyInfo.getHyid(), qiubo_number);
	        }
	        String sex="��";
	        if (hyInfo.getSex().equals("10"))
	        	sex="��";
	        userQiuboMng.sendqiubowarn(hyInfo.getHyid(), user.getUsername(),user.getLcname(), sex,qiubo_number);
      }
      //add by gaojianhong for �����ﲨʱ���û��ﲨ���е���������1��ֱ�Ӳ����µļ�¼ end
        
      }catch(Exception e)
      {
        System.out.println(e.getMessage());
        s= "�����ﲨ�����������Ա��ϵ��";
      }

      return s;
   }
   
   //added by gaojianhong 20121012 for ��Ա��¼���Զ����ﲨ���ͱ���ƥ����Ϲ���Ļ�Ա�Զ������ﲨ start
   public static String addQiuboAuto(Userinfo sendUser,String hyid,Date sendTime)
   {
      String s = null;
      try
      {
        List list = HbmOperator.list("from DbQiubo as o where o.senduserid=" +
        		sendUser.getHyid() + " and o.postuserid=" + hyid);
        //System.out.println("���뵽htdb");
        int qiubozt = 0;
        if (list != null && list.size() > 0)
          qiubozt = 1;
        Userinfo hyInfo = HYRegMng.getUserinfoByHyid(hyid);
        if (hyInfo == null)
          return "��Ա��Ϣ�����ڣ�";
        DbQiubo dq = new DbQiubo();
        dq.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_QIUBO));
        dq.setPostuserid(hyInfo.getHyid());
        dq.setPostusername(hyInfo.getUsername());
        dq.setSendtime(sendTime);
        dq.setSenduserid(sendUser.getHyid());
        dq.setSendusername(sendUser.getUsername());
        dq.setZt(new Integer(qiubozt));
        HbmOperator.insert(dq);
      }catch(Exception e)
      {
        System.out.println(e.getMessage());
        s= "�����ﲨ�����������Ա��ϵ��";
      }

      return s;
   }
   //added by gaojianhong 20121012 for ��Ա��¼���Զ����ﲨ���ͱ���ƥ����Ϲ���Ļ�Ա�Զ������ﲨ end

   public static String replyQiubo(String shyid,String hyid)
   {
      Userinfo u = HYRegMng.getUserinfoByHyid(shyid);
      return GRZQMng.addQiubo(u,hyid);
   }


   public static String addHyly(HttpServletRequest request,Userinfo fromUser)
   {
      String s = null;
      String content = SysCommonFunc.getStrParameter(request,"content");
      if(content != null && content.length() > 100)
        return "�������ݲ��ܳ���100�֣�";
      try
      {
        Hyly hyly = new Hyly();
        hyly.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HYLY));
        hyly.setFromid(fromUser.getHyid());
        hyly.setFromname(fromUser.getLcname());
        hyly.setHyid(new Long(request.getParameter("hyid")));
        hyly.setHyname(request.getParameter("hyname"));
        hyly.setLytime(DateTools.stringToDate(request.getParameter("lytime")));
        hyly.setContent(content);
        HbmOperator.insert(hyly);
      }catch(Exception e)
      {
         System.out.println(e.getMessage());
         s = "�������Գ����������Ա��ϵ��";
      }

      return s;
   }

   public static String adminRemovePhotoA(HttpServletRequest  request, Userother lother,Userinfo user)
   {
     String s = null;
     try
     {
       String rid = SysCommonFunc.getStrParameter(request,"p");

       if(rid != null && rid.length() > 0)
       {
          String photo=null;
          if(rid.equals("1"))
            photo=lother.getUserphoto1();
          if(rid.equals("2"))
            photo=lother.getUserphoto2();
          if(rid.equals("3"))
            photo=lother.getUserphoto3();
          if(rid.equals("4"))
            photo=lother.getUserphoto4();
          if(rid.equals("5"))
            photo=lother.getUserphoto5();
          if(photo != null && photo.length() > 0)
          {
        	  String id = lother.getHyid().toString();
        	  Userinfo userUpTime = (Userinfo)HYRegMng.getUserinfoByHyid(id);
        	  if(userUpTime.getSex()!=null&&userUpTime.getSex().equals("11"))
        	  {
        	  userUpTime.setRegtime2(new Date(System.currentTimeMillis()));
        	  userUpTime.setLasttime(new Date(System.currentTimeMillis()));
        	  HbmOperator.update(userUpTime);
        	  }
            String afilepath = SysCommonFunc.getPhotoPath();
            String afilepathsmall = SysCommonFunc.getPhotoSmalPath();

            //20090814�޸�ɾ����Ƭ������־��¼
            Admininfo adminLoginInfo = (Admininfo)request.getSession().getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
            OpLogMng.userAdminRPhotoLog(user,adminLoginInfo,photo);




//            File file = new File(afilepath + File.separator + photo);
//            try
//            {
//              file.delete();
//              file = new File(afilepathsmall + File.separator + photo);
//              file.delete();
//            }catch(Exception e){
//              System.out.println(e.getMessage());
//            }
            String sql = "update userother set userphoto"+rid+"='' where hyid ="+lother.getHyid();
            HbmOperator.executeSql(sql);
            if(rid.equals("1"))
              lother.setUserphoto1("");
            if(rid.equals("2"))
              lother.setUserphoto2("");
            if(rid.equals("3"))
              lother.setUserphoto3("");
            if(rid.equals("4"))
              lother.setUserphoto4("");
            if(rid.equals("5"))
              lother.setUserphoto5("");
          }
          int img = 0;
          if(lother.getUserphoto1() != null && lother.getUserphoto1().length() > 0)
             img = img+1;
           if(lother.getUserphoto2() != null && lother.getUserphoto2().length() > 0)
             img = img+1;
           if(lother.getUserphoto3() != null && lother.getUserphoto3().length() > 0)
             img = img+1;
           if(lother.getUserphoto4() != null && lother.getUserphoto4().length() > 0)
             img = img+1;
           if(lother.getUserphoto5() != null && lother.getUserphoto5().length() > 0)
             img = img+1;
           int imgnumber = img == 0 ? 0:1;

           if(user.getSex() != null && user.getSex().equals("11"))
          {
            String sql = "update userinfo set img="+imgnumber+",regtime2=sysdate where hyid ="+lother.getHyid();

             HbmOperator.executeSql(sql);

          }else
          {

            String sql = "update userinfo set img=" + imgnumber +" where hyid =" + lother.getHyid();

            HbmOperator.executeSql(sql);
          }
              user.setImg(new Integer(imgnumber));
           ///�����Ű���Ƭλ��
           if(img > 0 && img < 5)
           {
              System.out.println("���°���λ��");
              String[] pArray= new String[img];
              int index = 0;
              if(lother.getUserphoto1() != null && lother.getUserphoto1().length() > 0)
              {
                 pArray[index] = lother.getUserphoto1();
                 index = index+1;
              }
              if(lother.getUserphoto2() != null && lother.getUserphoto2().length() > 0)
              {
                 pArray[index] = lother.getUserphoto2();
                 index = index+1;
              }
              if(lother.getUserphoto3() != null && lother.getUserphoto3().length() > 0)
              {
                 pArray[index] = lother.getUserphoto3();
                 index = index+1;
              }
              if(lother.getUserphoto4() != null && lother.getUserphoto4().length() > 0)
              {
                 pArray[index] = lother.getUserphoto4();
                 index = index+1;
              }
              if(lother.getUserphoto5() != null && lother.getUserphoto5().length() > 0)
              {
                 pArray[index] = lother.getUserphoto5();
                 index = index+1;
              }
              index = 0;
              if(index < pArray.length)
              {
                lother.setUserphoto1(pArray[index]);
                index = index +1;
              }else
              {
                 lother.setUserphoto1("");
              }
              if(index < pArray.length)
              {
                lother.setUserphoto2(pArray[index]);
                index = index +1;
              }else
              {
                 lother.setUserphoto2("");
              }

              if(index < pArray.length)
              {
                lother.setUserphoto3(pArray[index]);
                index = index +1;
              }else
              {
                 lother.setUserphoto3("");
              }

              if(index < pArray.length)
              {
                lother.setUserphoto4(pArray[index]);
                index = index +1;
              }else
              {
                 lother.setUserphoto4("");
              }

              if(index < pArray.length)
              {
                lother.setUserphoto5(pArray[index]);
                index = index +1;
              }else
              {
                 lother.setUserphoto5("");
              }
              HbmOperator.update(lother);
           }


       }

     }catch(Exception e)
     {
        System.out.println(e.getMessage());
     }
     return s;

   }

}



