package com.lover.mng;
import com.web.common.*;
import com.common.*;
import javax.servlet.http.HttpServletRequest;

import com.web.obj.*;
import com.web.common.beanutil.*;

import hibernate.db.*;

import java.util.*;

import com.web.bean.QueryRecord;
import com.lover.LoverTools;
import com.lover.mng.HYRegMng;
import com.web.servlet.InitEnvironment;
import java.io.File;
import java.math.BigDecimal;

public class UserReceiveSetMng {
  public UserReceiveSetMng() {
  }
  
  /**
   * �޸ĸ�����Ϣ��������
   * @param request HttpServletRequest
   * @param user Userinfo
   * @param hyset UserReceiveSet
   * @return String
   */
  public static String userupdateUserReceiveSet(HttpServletRequest request,Userinfo user)
  {
       String s =null;
       UserReceiveSet userReceiveSet = getUserReceiveSet(user.getHyid());
       if(userReceiveSet == null)
    	   userReceiveSet = (UserReceiveSet)BeanInitializer.initBean(UserReceiveSet.class,request);
       else
         BeanInitializer.updateBean(userReceiveSet,request);
       
       //added by gaojianhong 20150308 for �ж��ֻ��Ƿ���֤�������Ƿ���ȷ start
       //�ж���վ��Ϣ�Ƿ����
       if (userReceiveSet.getReceiveyesno()==0){ 
    	   //���շ�ʽ����
    	   if (userReceiveSet.getReceivetype()==0){
    		   //�ж��ֻ��Ƿ���֤�������Ƿ���ȷ
    		   if ((user.getSjtel().equals("") || user.getVacsjtel()==0) && (user.getEmail().equals("") || !LoverTools.isEmail(user.getEmail()))){
    			   return "11���Ƚ����ֻ���֤��������ȷ�����䣬�Ա��ܼ�ʱ�յ���վ�ͻ�Ա������Ϣ";
    		   }
    	   }else if (userReceiveSet.getReceivetype()==1){ //���շ�ʽΪ�ֻ�
			   if (user.getSjtel().equals("") || user.getVacsjtel()==0){
				   return "12���Ƚ����ֻ���֤���Ա��ܼ�ʱ�յ���վ�ͻ�Ա������Ϣ";
			   }
		   }else if (userReceiveSet.getReceivetype()==2){ //���շ�ʽΪ����
			   if (user.getEmail().equals("") || !LoverTools.isEmail(user.getEmail())){
				   return "13����������ȷ�������ַ���Ա��ܼ�ʱ�յ���վ�ͻ�Ա������Ϣ";
			   }
		   }
       }
       //added by gaojianhong 20150308 for �ж��ֻ��Ƿ���֤�������Ƿ���ȷ end
       
       Vector saveList = new Vector();

       try
       {
         MutSeaObject mso = new MutSeaObject();
         if (userReceiveSet.getHyid() == null) {
        	 userReceiveSet.setHyid(user.getHyid());
           mso.setHbmSea(userReceiveSet, MutSeaObject.SEA_HBM_INSERT);
         }
         else {
           mso.setHbmSea(userReceiveSet, MutSeaObject.SEA_HBM_UPDATE);
         }
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);

       }catch(Exception e)
       {
         System.out.println(e.getMessage());
         s = "������Ϣ�������ó����������Ա��ϵ��";
       }

       return s;
  }
  
  public static UserReceiveSet getUserReceiveSet(Long hyid){
	UserReceiveSet userReceiveSet=null;
	try {
		 List list = HbmOperator.list("from UserReceiveSet as o where o.hyid=" + hyid);
         if (list!=null && list.size()>0){
        	userReceiveSet= (UserReceiveSet) list.get(0);
         }
	} catch (Exception e) {
		 System.out.println(e.getMessage());
	}
	return userReceiveSet;
  }
  
  public static void insertUserReceiveSet(Long hyid, Integer receiveyesno,Integer receivetype){
  	String s = null;
	try {
		 Vector saveList = new Vector();
	     MutSeaObject mso = null;
	     UserReceiveSet userReceiveSet=new UserReceiveSet();
	     userReceiveSet.setHyid(hyid);
	     userReceiveSet.setReceiveyesno(receiveyesno);
	     userReceiveSet.setReceivetype(receivetype);
	     mso = new MutSeaObject();
         mso.setHbmSea(userReceiveSet,MutSeaObject.SEA_HBM_INSERT);
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);
	} catch (Exception e) {
		 System.out.println(e.getMessage());
         s = "��Ӹ�����Ϣ�������ó����������Ա��ϵ��";
	}
  }
  
  public static void updateUserReceiveSet(UserReceiveSet userReceiveSet){
  	String s = null;
	try {
		 Vector saveList = new Vector();
	     MutSeaObject mso = null;
	     mso = new MutSeaObject();
         mso.setHbmSea(userReceiveSet,MutSeaObject.SEA_HBM_UPDATE);
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);
	} catch (Exception e) {
		 System.out.println(e.getMessage());
         s = "�޸ĸ�����Ϣ�������ó����������Ա��ϵ��";
	}
  }
}