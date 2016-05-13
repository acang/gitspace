package com.lover.mng;
import com.web.common.*;
import com.common.*;

import javax.servlet.http.HttpServletRequest;

import com.web.obj.*;
import com.web.common.beanutil.*;

import hibernate.db.*;

import java.io.UnsupportedEncodingException;
import java.util.*;

import com.web.bean.QueryRecord;
import com.lover.mng.HYRegMng;
import com.web.servlet.InitEnvironment;

import java.io.File;

import chinapay.*;

public class CartMng {

  //public static final String MerId = "808080002500123";

  //808080450004554
  public static final String MerId = "808080450004554";


  //public static final String msubid = "00123";
  public static final String msubid = "04554";

  //public static final String OrdId = "808080002500123";
  //public static final String TransAmt = "808080002500123";
  public static final String CuryId = "156";
  //public static final String TransDate = "";

  public static final String TransType = "0001";
  public static final String Version = "20040916";
  public static final String BgRetUrl = "http://www.51lover.org/cart/cartdata.jsp";
  public static final String PageRetUrl = "http://www.51lover.org/cart/cartok.jsp";
//  public static final String ChkValue = "";

  public CartMng() {
  }

  public static Cart getCartById(String id)
  {
     List list = HbmOperator.list("from Cart as o where o.id = " + id);
     if(list.size() > 0)
       return (Cart)list.get(0);
     return null;
  }

  public static Cart getCartByOrderId(String ordid)
  {
    List list = HbmOperator.list("from Cart as o where o.ordid = '" + ordid+"'");
    if(list.size() > 0)
      return (Cart)list.get(0);
    return null;

  }

  public static void addCart(Cart cart)
  {
    try
    {
      cart.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_CARTID));
      HbmOperator.insert(cart);
    }catch(Exception e)
    {
       System.out.println(e.getMessage());
    }
  }

  public synchronized static String getOrderId()
  {
     String s = "";
     try
     {
       Date d = new Date(System.currentTimeMillis());
       String pre = DateTools.DateToString(d, DateTools.FORMART_yyMM);
       List list = HbmOperator.list("from Cartorderid as o where o.id = '" + pre +
                                    "'");
       if (list.size() == 0) {
         long mid = 1000000;
         Cartorderid cd = new Cartorderid(pre, mid + "");
         HbmOperator.insert(cd);
         return pre + CartMng.msubid + mid;
       }
       else {
          Cartorderid cd = (Cartorderid)list.get(0);
          long mid = Long.parseLong(cd.getCorderid());
          mid = mid + 1;
          cd.setCorderid(mid+"");
          HbmOperator.update(cd);
          return pre + CartMng.msubid + mid;
       }
     }catch(Exception e)
     {
        System.out.println(e.getMessage());
     }
     return s;
  }

  public static String getTransAmt(Product p)
  {
     String s = p.getTransamt().toString()+"00";
     String temp = "000000000000";
     if(s.length() < 12)
     {
       int len = 12-s.length();
       s = temp.substring(0,len)+s;
     }

     return s;
  }
  
  public static String getTransAmt(String transAmt)
  {
     String s = transAmt.replace(".","");
     String temp = "000000000000";
     if(s.length() < 12)
     {
       int len = 12-s.length();
       s = temp.substring(0,len)+s;
     }

     return s;
  }

  public static String getCheckValue(String MerId,String OrdId,String TransAmt,String CuryId,String TransDate,String TransType)
  {
     PrivateKey key = new PrivateKey();
      boolean  flag = key.buildKey(MerId,0,InitEnvironment.getSystemProValue(SysDefine.ENV_WEB_PATH)+File.separator+"WEB-INF"+File.separator+"MerPrk.key");
      System.out.println(flag);
     SecureLink t = new SecureLink(key);
     String CheckValue=t.signOrder(MerId,OrdId,TransAmt,CuryId,TransDate,TransType);
     return CheckValue;
  }

  public static  String cartOkResponse(int i )
  {
     if(i ==0)
       return "�����쳣��";  //null; update by linyu 20151031
     if(i ==1)
       return "��ʼ����Կ����";
     if(i ==2 || i ==3)
        return "����ʧ�ܣ�";
     if(i ==4)
        return "û���ҵ�������";
     if(i ==5)
        return "�Ѿ���������";  //"�����ɹ���";  update by linyu 20151031
      if(i ==6)
        return "û���ҵ������û���¼��";
      if(i ==7)
          return "�����ɹ���";
      return "����ʧ�ܣ��������Ա��ϵ��";
  }



  public synchronized static int cartBjdOk(Cart cart,Userinfo user,HttpServletRequest request)
  {
       int i =0;
      String MerId = SysCommonFunc.getStrParameter(request,"merid");
      String OrdId = SysCommonFunc.getStrParameter(request,"orderno");
      String TransAmt =SysCommonFunc.getStrParameter(request,"amount");
      String CuryId = SysCommonFunc.getStrParameter(request,"currencycode");
      String TransDate = SysCommonFunc.getStrParameter(request,"transdate");
      String TransType = SysCommonFunc.getStrParameter(request,"transtype");
      String OrderStatus=SysCommonFunc.getStrParameter(request,"status");
      String CheckValue=SysCommonFunc.getStrParameter(request,"checkvalue");

      Vector saveList = new Vector();
      MutSeaObject mso = null;

      try{
       if(cart.getUpgrade().intValue() != 1)//û��������
       {

          ///�����û��׽�
          UserBjd ub = null;
          List list = HbmOperator.list("from UserBjd as o where hyid="+user.getHyid());
          if(list == null || list.size() ==0)
          {
              ub = new UserBjd();
              ub.setBjdnumber(cart.getServiceyear().longValue());
              ub.setHyid(user.getHyid());

              mso = new MutSeaObject();
              mso.setHbmSea(ub,MutSeaObject.SEA_HBM_INSERT);
              saveList.add(mso);
          }else
          {
              ub = (UserBjd)list.get(0);
              ub.setBjdnumber(ub.getBjdnumber()+cart.getServiceyear().longValue());
              mso = new MutSeaObject();
              mso.setHbmSea(ub,MutSeaObject.SEA_HBM_UPDATE);
              saveList.add(mso);
          }
          ///���ӳ�ֵ��¼

          UserBjdRecord ubr = new UserBjdRecord();
          ubr.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_WTJD"));
          ubr.setBjddesc("����"+cart.getName());
          ubr.setBjdnumber(cart.getServiceyear().longValue());
          ubr.setHyid(user.getHyid().toString());
          ubr.setRecodeTime(new Date(System.currentTimeMillis()));

               mso = new MutSeaObject();
              mso.setHbmSea(ubr,MutSeaObject.SEA_HBM_INSERT);
              saveList.add(mso);

          ///�����շѰ���
          Vipuserrecord vur = new Vipuserrecord();
          vur.setCzry("����");
          vur.setCzsj(new Date(System.currentTimeMillis()));
          vur.setDatetype(cart.getDatetype());
          vur.setFlag(cart.getFlag());
          vur.setHttpurl(user.getHttpurl());
          vur.setHyid(user.getHyid().longValue());
          vur.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_VIPRECORD));
          vur.setName(cart.getName());
          vur.setServiceyear(cart.getServiceyear());
          vur.setSimplename(cart.getSimplename());
          vur.setSqdj(cart.getSqdj());
          vur.setSqhy(user.getUsername());
          //modify by gaojianhong 20120903 for ������ΪС�� start
          //vur.setTransamt(cart.getTransamt());
          vur.setTransamt(new Double(cart.getTransamt()));
        //modify by gaojianhong 20120903 for ������ΪС�� end
          //vur.setYyxq(DateTools.stringToDate(yyxq));
          //vur.setZzsj(user.getZzsj());
          mso = new MutSeaObject();
          mso.setHbmSea(vur,MutSeaObject.SEA_HBM_INSERT);
          saveList.add(mso);
       }

       ///�޸Ķ�����Ϣ
       cart.setZtai(OrderStatus);
       cart.setTrans(new Integer(1));
       cart.setUpgrade(new Integer(1));
       mso = new MutSeaObject();
       mso.setHbmSea(cart,MutSeaObject.SEA_HBM_UPDATE);
       saveList.add(mso);

          Userother uother = HYRegMng.getUserOtherByHyid(user.getHyid()+"");
            if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
              String type = "9";
              String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
              HbmOperator.executeSql(sql2);
              String sql = "update userinfo set important = " + type+"1" + " where  hyid = " +user.getHyid();
              HbmOperator.executeSql(sql);
           }

       HbmOperator.SeaMutData(saveList);
       request.setAttribute("okuser",user);
       request.setAttribute("okcart",cart);

     }catch(Exception e)
     {
       System.out.println(e.getMessage());
       e.printStackTrace();
       i = 999;
     }

      System.out.println("fdsafdsafjdsalfjdslajfdsafdsafd"+i);
     return i;
  }

    public synchronized static int cartBjdOkAlipay(Cart cart,Userinfo user,String OrderStatus)
    {
        int i =0;
        Vector saveList = new Vector();
        MutSeaObject mso = null;

        try{
            if(cart.getUpgrade().intValue() != 1)//û��������
            {

                ///�����û��׽�
                UserBjd ub = null;
                List list = HbmOperator.list("from UserBjd as o where hyid="+user.getHyid());
                if(list == null || list.size() ==0)
                {
                    ub = new UserBjd();
                    ub.setBjdnumber(cart.getServiceyear().longValue());
                    ub.setHyid(user.getHyid());

                    mso = new MutSeaObject();
                    mso.setHbmSea(ub,MutSeaObject.SEA_HBM_INSERT);
                    saveList.add(mso);
                }else
                {
                    ub = (UserBjd)list.get(0);
                    ub.setBjdnumber(ub.getBjdnumber()+cart.getServiceyear().longValue());
                    mso = new MutSeaObject();
                    mso.setHbmSea(ub,MutSeaObject.SEA_HBM_UPDATE);
                    saveList.add(mso);
                }
                ///���ӳ�ֵ��¼

                UserBjdRecord ubr = new UserBjdRecord();
                ubr.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_WTJD"));
                ubr.setBjddesc("����"+cart.getName());
                ubr.setBjdnumber(cart.getServiceyear().longValue());
                ubr.setHyid(user.getHyid().toString());
                ubr.setRecodeTime(new Date(System.currentTimeMillis()));

                mso = new MutSeaObject();
                mso.setHbmSea(ubr,MutSeaObject.SEA_HBM_INSERT);
                saveList.add(mso);

                ///�����շѰ���
                Vipuserrecord vur = new Vipuserrecord();
                vur.setCzry("֧����");
                vur.setCzsj(new Date(System.currentTimeMillis()));
                vur.setDatetype(cart.getDatetype());
                vur.setFlag(cart.getFlag());
                vur.setHttpurl(user.getHttpurl());
                vur.setHyid(user.getHyid().longValue());
                vur.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_VIPRECORD));
                vur.setName(cart.getName());
                vur.setServiceyear(cart.getServiceyear());
                vur.setSimplename(cart.getSimplename());
                vur.setSqdj(cart.getSqdj());
                vur.setSqhy(user.getUsername());
                //modify by gaojianhong 20120903 for ������ΪС�� start
                //vur.setTransamt(cart.getTransamt());
                vur.setTransamt(new Double(cart.getTransamt()));
                //modify by gaojianhong 20120903 for ������ΪС�� end
                //vur.setYyxq(DateTools.stringToDate(yyxq));
                //vur.setZzsj(user.getZzsj());
                mso = new MutSeaObject();
                mso.setHbmSea(vur,MutSeaObject.SEA_HBM_INSERT);
                saveList.add(mso);
            }

            ///�޸Ķ�����Ϣ
            cart.setZtai(OrderStatus);
            cart.setTrans(new Integer(1));
            cart.setUpgrade(new Integer(1));
            mso = new MutSeaObject();
            mso.setHbmSea(cart,MutSeaObject.SEA_HBM_UPDATE);
            saveList.add(mso);

            Userother uother = HYRegMng.getUserOtherByHyid(user.getHyid()+"");
             if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
                String type = "9";
                String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
                HbmOperator.executeSql(sql2);
                String sql = "update userinfo set important = " + type+"1" + " where  hyid = " +user.getHyid();
                HbmOperator.executeSql(sql);
             }

            HbmOperator.SeaMutData(saveList);
          //  request.setAttribute("okuser",user);
           // request.setAttribute("okcart",cart);

        }catch(Exception e)
        {
            System.out.println(e.getMessage());
            e.printStackTrace();
            i = 999;
        }

        return i;
    }


  public synchronized static int cartOk(HttpServletRequest request)
  {
     System.out.println("�õ�������Ӧ��");
     int i = 0;
     String MerId = SysCommonFunc.getStrParameter(request,"merid");
     String OrdId = SysCommonFunc.getStrParameter(request,"orderno");
     String TransAmt =SysCommonFunc.getStrParameter(request,"amount");
     String CuryId = SysCommonFunc.getStrParameter(request,"currencycode");
     String TransDate = SysCommonFunc.getStrParameter(request,"transdate");
     String TransType = SysCommonFunc.getStrParameter(request,"transtype");
     String OrderStatus=SysCommonFunc.getStrParameter(request,"status");
     String CheckValue=SysCommonFunc.getStrParameter(request,"checkvalue");
     try
     {
       //��֤Ӧ�����Ч��
       PrivateKey key = new PrivateKey();
       boolean flag = key.buildKey("999999999999999", 0,
                                   InitEnvironment.getSystemProValue(SysDefine.
           ENV_WEB_PATH) + File.separator + "WEB-INF" + File.separator +
                                   "PgPubk.key");
       if (!flag)
         return 1; ///��ʼ����Կ����
       SecureLink t = new SecureLink(key);
       flag = t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId, TransDate,
                                    TransType, OrderStatus, CheckValue);
       if (!flag)
         return 2; //��֤����ʧ��
       if (!OrderStatus.equals("1001")) {
         HbmOperator.executeSql("update cart set ztai = '" + OrderStatus +
                                "' where ordid = '" + OrdId + "'");
         return 3; //֧��ʧ��
       }
       ///֧���ɹ���ʼ�Ի�Ա��������
       //�ҵ�����:
       Cart cart = CartMng.getCartByOrderId(OrdId);
       Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
       if(cart == null)
          return 4;///û���ҵ�����
       if(cart.getTrans().intValue() ==1)
       {
         request.setAttribute("okuser",user);
         request.setAttribute("okcart",cart);

         return 5; ///�Ѿ�������
       }
       ///�ҵ������û�
       //Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
       if(user == null)
         return 6; //û���ҵ��û�
       Vector saveList = new Vector();
       MutSeaObject mso = null;

       if(cart.getFlag().intValue() == 5)
         return CartMng.cartBjdOk(cart,user,request);
       if(cart.getUpgrade().intValue() != 1)//û��������
       {
          user.setFlag(cart.getFlag());
          String yyxq = "";
          String zzsj = "";
          if(user.getZzsj() == null)
          {
             Date cdate = new Date(System.currentTimeMillis());
             yyxq = DateTools.dateToString(cdate,false);
             cdate.setDate(cdate.getDate()+1);


             if(cart.getDatetype().intValue() ==1)
             {
               cdate.setYear(cdate.getYear()+cart.getServiceyear().intValue());
               zzsj = DateTools.dateToString(cdate,false);
             }else if (cart.getDatetype().intValue() ==0)
             {
               cdate.setMonth(cdate.getMonth()+cart.getServiceyear().intValue());
               zzsj = DateTools.dateToString(cdate,false);
             }else {
               cdate.setDate(cdate.getDate()+cart.getServiceyear().intValue()*7);
               zzsj = DateTools.dateToString(cdate,false);
			}
          }
          else
          {
             Date cdate = new Date(System.currentTimeMillis());
             yyxq = DateTools.dateToString(user.getZzsj(),false);
             if(user.getZzsj().after(cdate))
              cdate = user.getZzsj();
             else
               cdate.setDate(cdate.getDate()+1);
             if(cart.getDatetype().intValue() ==1)
             {
               cdate.setYear(cdate.getYear()+cart.getServiceyear().intValue());
               zzsj = DateTools.dateToString(cdate,false);
             }else if (cart.getDatetype().intValue() ==0)
             {
               cdate.setMonth(cdate.getMonth()+cart.getServiceyear().intValue());
               zzsj = DateTools.dateToString(cdate,false);
             }else {
               cdate.setDate(cdate.getDate()+cart.getServiceyear().intValue()*7);
               zzsj = DateTools.dateToString(cdate,false);
			}
          }
          user.setZzsj(DateTools.stringToDate(zzsj));
          user.setArea(cart.getArea());
          if(user.getImg() != null && user.getImg().intValue() >0)
            user.setTjsj(new Date(System.currentTimeMillis()));
          mso = new MutSeaObject();
          mso.setHbmSea(user,MutSeaObject.SEA_HBM_UPDATE);
          saveList.add(mso);

          ///�����շѰ���
          Vipuserrecord vur = new Vipuserrecord();
          vur.setCzry("����");
          vur.setCzsj(new Date(System.currentTimeMillis()));
          vur.setDatetype(cart.getDatetype());
          vur.setFlag(cart.getFlag());
          vur.setHttpurl(user.getHttpurl());
          vur.setHyid(user.getHyid().longValue());
          vur.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_VIPRECORD));
          vur.setName(cart.getName());
          vur.setServiceyear(cart.getServiceyear());
          vur.setSimplename(cart.getSimplename());
          vur.setSqdj(cart.getSqdj());
          vur.setSqhy(user.getUsername());
          //modify by gaojianhong 20120903 for ������ΪС�� start
          //vur.setTransamt(cart.getTransamt());
          vur.setTransamt(new Double(cart.getTransamt()));
          //modify by gaojianhong 20120903 for ������ΪС�� end
          vur.setYyxq(DateTools.stringToDate(yyxq));
          vur.setZzsj(user.getZzsj());
          vur.setArea(cart.getArea());
          mso = new MutSeaObject();
          mso.setHbmSea(vur,MutSeaObject.SEA_HBM_INSERT);
          saveList.add(mso);
       }

       ///�޸Ķ�����Ϣ
       cart.setZtai(OrderStatus);
       cart.setTrans(new Integer(1));
       cart.setUpgrade(new Integer(1));
       mso = new MutSeaObject();
       mso.setHbmSea(cart,MutSeaObject.SEA_HBM_UPDATE);

         Userother uother = HYRegMng.getUserOtherByHyid(user.getHyid()+"");
         if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
             String type = "9";
             String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
             HbmOperator.executeSql(sql2);
             String sql = "update userinfo set important = " + type+"1" + " where  hyid = " +user.getHyid();
             HbmOperator.executeSql(sql);
          }

       saveList.add(mso);

       HbmOperator.SeaMutData(saveList);
       request.setAttribute("okuser",user);
       request.setAttribute("okcart",cart);
       
       // /���û�VIP��Ϣ���뵽��½��Ϣ��
       Userinfo grwhqUser = (Userinfo)request.getSession().getAttribute(SysDefine.SESSION_LOGINNAME);
       grwhqUser.setFlag(SysDefine.SYSTEM_HY_TYPE_vip);
       request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,
    		   grwhqUser);
       
     }catch(Exception e)
     {
       System.out.println(e.getMessage());
       i = 999;
     }
     return i;
  }


    public synchronized static int alipayOk(String MerId,String OrdId,String TransAmt,String CuryId,String TransDate,String TransType,String OrderStatus,String CheckValue)
    {
        int i = 0;

        try
        {
            //��֤Ӧ�����Ч��
            PrivateKey key = new PrivateKey();
            boolean flag = key.buildKey("999999999999999", 0,
                    InitEnvironment.getSystemProValue(SysDefine.
                            ENV_WEB_PATH) + File.separator + "WEB-INF" + File.separator +
                            "PgPubk.key");
//            if (!flag)
//                return 1; ///��ʼ����Կ����
//            SecureLink t = new SecureLink(key);
//            flag = t.verifyTransResponse(MerId, OrdId, TransAmt, CuryId, TransDate,
//                    TransType, OrderStatus, CheckValue);
//            if (!flag)
//                return 2; //��֤����ʧ��
//            if (!OrderStatus.equals("1001")) {
//                HbmOperator.executeSql("update cart set ztai = '" + OrderStatus +
//                        "' where ordid = '" + OrdId + "'");
//                return 3; //֧��ʧ��
//            }
            ///֧���ɹ���ʼ�Ի�Ա��������
            //�ҵ�����:
            Cart cart = CartMng.getCartByOrderId(OrdId);
//            Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
            if(cart == null){
                return 4;///û���ҵ�����
            }

            if(cart.getTrans().intValue() ==1)
            {
                return 5; ///�Ѿ�������
            }
            ///�ҵ������û�
            Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
            if(user == null){
                return 6; //û���ҵ��û�
            }

            Vector saveList = new Vector();
            MutSeaObject mso = null;
            if(cart.getFlag().intValue() == 5){  //����׽�
                return CartMng.cartBjdOkAlipay(cart,user,OrderStatus);
            }
            if(cart.getUpgrade().intValue() != 1)//û��������
            {
                i =7;
                //TODO �ж��û��Ƿ��Ѿ��׽��Ա�����ǵĻ�������Ҫ���ģ����ǵ��׽𶹻�Ա�ȼ�Ϊ5��
                user.setFlag(cart.getFlag());
                String yyxq = "";
                String zzsj = "";
                if(user.getZzsj() == null)
                {
                    Date cdate = new Date(System.currentTimeMillis());
                    yyxq = DateTools.dateToString(cdate,false);
                    cdate.setDate(cdate.getDate()+1);


                    if(cart.getDatetype().intValue() ==1)
                    {
                        cdate.setYear(cdate.getYear()+cart.getServiceyear().intValue());
                        zzsj = DateTools.dateToString(cdate,false);
                    }else if (cart.getDatetype().intValue() ==0)
                    {
                        cdate.setMonth(cdate.getMonth()+cart.getServiceyear().intValue());
                        zzsj = DateTools.dateToString(cdate,false);
                    }else {
                        cdate.setDate(cdate.getDate()+cart.getServiceyear().intValue()*7);
                        zzsj = DateTools.dateToString(cdate,false);
                    }
                }
                else
                {
                    Date cdate = new Date(System.currentTimeMillis());
                    yyxq = DateTools.dateToString(user.getZzsj(),false);
                    if(user.getZzsj().after(cdate))
                        cdate = user.getZzsj();
                    else
                        cdate.setDate(cdate.getDate()+1);
                    if(cart.getDatetype().intValue() ==1)
                    {
                        cdate.setYear(cdate.getYear()+cart.getServiceyear().intValue());
                        zzsj = DateTools.dateToString(cdate,false);
                    }else if (cart.getDatetype().intValue() ==0)
                    {
                        cdate.setMonth(cdate.getMonth()+cart.getServiceyear().intValue());
                        zzsj = DateTools.dateToString(cdate,false);
                    }else {
                        cdate.setDate(cdate.getDate()+cart.getServiceyear().intValue()*7);
                        zzsj = DateTools.dateToString(cdate,false);
                    }
                }
                user.setZzsj(DateTools.stringToDate(zzsj));
                user.setArea(cart.getArea());
                if(user.getImg() != null && user.getImg().intValue() >0)
                    user.setTjsj(new Date(System.currentTimeMillis()));
                mso = new MutSeaObject();
                mso.setHbmSea(user,MutSeaObject.SEA_HBM_UPDATE);
                saveList.add(mso);

                ///�����շѰ���
                Vipuserrecord vur = new Vipuserrecord();
                vur.setCzry("֧����");
                vur.setCzsj(new Date(System.currentTimeMillis()));
                vur.setDatetype(cart.getDatetype());
                vur.setFlag(cart.getFlag());
                vur.setHttpurl(user.getHttpurl());
                vur.setHyid(user.getHyid().longValue());
                vur.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_VIPRECORD));
                vur.setName(cart.getName());
                vur.setServiceyear(cart.getServiceyear());
                vur.setSimplename(cart.getSimplename());
                vur.setSqdj(cart.getSqdj());
                vur.setSqhy(user.getUsername());
                vur.setTransamt(new Double(cart.getTransamt()));
                vur.setYyxq(DateTools.stringToDate(yyxq));
                vur.setZzsj(user.getZzsj());
                vur.setArea(cart.getArea());
                mso = new MutSeaObject();
                mso.setHbmSea(vur,MutSeaObject.SEA_HBM_INSERT);
                saveList.add(mso);
            }

            ///�޸Ķ�����Ϣ
            cart.setZtai(OrderStatus);
            cart.setTrans(new Integer(1));
            cart.setUpgrade(new Integer(1));

            mso = new MutSeaObject();
            mso.setHbmSea(cart,MutSeaObject.SEA_HBM_UPDATE);
            saveList.add(mso);

            Userother uother = HYRegMng.getUserOtherByHyid(user.getHyid()+"");
             if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
                String type = "9";
                String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
                HbmOperator.executeSql(sql2);
                String sql = "update userinfo set important = " + type+"1  where  hyid = " +user.getHyid();
                System.out.println("paySql:"+sql);
                HbmOperator.executeSql(sql);
            }

            HbmOperator.SeaMutData(saveList);

        }catch(Exception e)
        {
            System.out.println(e.getMessage());
            i = 999;
        }
        return i;
    }
    //zxl add pay ok set user to headfirst
  private void setUserHeadFirst(Userinfo userInfo){
	  
	  if(userInfo!=null &&userInfo.getHyid()!=null && userInfo.getHyid()>0){
		  Userother uother = HYRegMng.getUserOtherByHyid(""+userInfo.getHyid());
		  //must have photo
	    if(convertPhotoJpg(uother.getUserphoto1())||convertPhotoJpg(uother.getUserphoto2())||convertPhotoJpg(uother.getUserphoto3())
	    		|| convertPhotoJpg(uother.getUserphoto4())||convertPhotoJpg(uother.getUserphoto5())){
	    	 try {
	 	    	String type = "9";
	 	    	String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
	 			HbmOperator.executeSql(sql2);
	 			String sql = "update userinfo set important = " + type+"1  where  hyid = " +userInfo.getHyid();
	 			HbmOperator.executeSql(sql);
	 		} catch (Exception e) {
	 			e.printStackTrace();
	 		}
	    }
	  }
  }
  
  private boolean convertPhotoJpg(String photoName){
	  if(photoName!=null && !"".equals(photoName)){
	        try {
	            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+photoName,"E:\\web\\lover51\\upload\\hyimgsmall\\"+photoName,190,230);
	            return true;
	        } catch (Exception e) {
	            e.printStackTrace(); 
	        }
	    }
	  return false;
  }

  public static void main(String args[])
  {
//    String s =   CartMng.getOrderId();
//    System.out.println(s);
   Product p = new Product();
  p.setTransamt(new Long(720));
  String s =  CartMng.getTransAmt(p);
  System.out.println(s + ":"+s.length());

  }
}
