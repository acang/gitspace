package com.lover.mng;
import com.web.common.*;
import com.common.*;

import javax.servlet.http.HttpServletRequest;

import com.web.obj.*;
import com.web.common.beanutil.*;

import hibernate.db.*;

import java.util.*;

import com.web.bean.QueryRecord;
import com.lover.mng.HYRegMng;
import com.web.servlet.InitEnvironment;
import java.io.File;
import java.math.BigDecimal;
import com.lover.*;

public class UserInfoSendReplyMng {
  public UserInfoSendReplyMng() {
  }
  
  public static Long insertUserInfoSendReply(UserInfoSendReply userInfoSendReply){
  	String s = null;
  	Long id;
  	id=Long.parseLong("0");
	try {
		 Vector saveList = new Vector();
	     MutSeaObject mso = new MutSeaObject();
	     id=SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_USERINFOSENDREPLY);
	     userInfoSendReply.setId(id);
         mso.setHbmSea(userInfoSendReply,MutSeaObject.SEA_HBM_INSERT);
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);
	} catch (Exception e) {
		 System.out.println(e.getMessage());
         s = "�����Ϣ���ͼ�¼�����������Ա��ϵ��";
	}
	return id;
  }
  
  public static UserInfoSendReply getUserInfoSendReply(String mobileoremailc,Integer mobileoremail){
	  UserInfoSendReply userInfoSendReply=null;
		try {
			 List list = HbmOperator.list("from UserInfoSendReply as o where o.mobileoremail=" + mobileoremail +" and o.mobileoremailc='"+mobileoremailc+"'");
	         if (list!=null && list.size()>0){
	        	 userInfoSendReply= (UserInfoSendReply) list.get(0);
	         }
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		return userInfoSendReply;
	  }
  
  public static List getUserInfoSendReplyList(String mobileoremailc,Integer mobileoremail){
	  List list=null;
		try {
			 list = QueryRecord.query("select distinct hyid from USERINFO_SEND_REPLY o where o.mobileoremail=" + mobileoremail +" and o.mobileoremailc='"+mobileoremailc+"'");
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		return list;
  }
  
  public static UserInfoSendReply getUserInfoSendReply(Long id){
	  UserInfoSendReply userInfoSendReply=null;
		try {
			 List list = HbmOperator.list("from UserInfoSendReply as o where o.id=" + id);
	         if (list!=null && list.size()>0){
	        	 userInfoSendReply= (UserInfoSendReply) list.get(0);
	         }
		} catch (Exception e) {
			 System.out.println(e.getMessage());
		}
		return userInfoSendReply;
	  }
  
  //�жϻ�Ա��Ϣ���ͷ�ʽ(0:�ֻ�  1������ 2��������)
  public static int getuserReceiveSet(String hyid){
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  List templist=new ArrayList();
	  templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid+" and o.isdel = 0");
	  if(templist != null && templist.size() == 1){
		  Userinfo userinfo=new Userinfo();
		  userinfo=(Userinfo)templist.get(0);
		  UserReceiveSet userReceiveSet=new UserReceiveSet();
		  templist.clear();
		  templist = HbmOperator.list("from UserReceiveSet as o where o.hyid="+hyid);
			//�жϻ�Ա������Ϣ����
	   		if(templist != null && templist.size() ==1){
	   			userReceiveSet=(UserReceiveSet)templist.get(0);
	   			if (userReceiveSet.getReceiveyesno()==0){
	   				if (userReceiveSet.getReceivetype()==0){
	   					//�ж��ֻ�����
	   					if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
	   						fsfs=0;
	   					}else if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
	   						fsfs=1;
	   					}
	   				}else if (userReceiveSet.getReceivetype()==1){
	   					if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
	   						fsfs=0;
	   					}
	   				}else if (userReceiveSet.getReceivetype()==2){
	   					if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
	   						fsfs=1;
	   					}
	   				}
	   			}
	   		}else{
	   			//�ж��ֻ�����
					if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
						fsfs=0;
					}else if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
						fsfs=1;
					}else{
						fsfs=2;
					}
	   		}
	  }
	  return fsfs;
  }
  
  //�жϻ�Ա��Ϣ���ͷ�ʽ(0:�ֻ�  1������ 2��������)
  public static int getuserReceiveSet(Userinfo userinfo){
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  List templist=new ArrayList();
	  UserReceiveSet userReceiveSet=new UserReceiveSet();
	  templist.clear();
	  templist = HbmOperator.list("from UserReceiveSet as o where o.hyid="+userinfo.getHyid());
		//�жϻ�Ա������Ϣ����
   		if(templist != null && templist.size() ==1){
   			userReceiveSet=(UserReceiveSet)templist.get(0);
   			if (userReceiveSet.getReceiveyesno()==0){
   				if (userReceiveSet.getReceivetype()==0){
   					//�ж��ֻ�����
   					if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
   						fsfs=0;
   					}else if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
   						fsfs=1;
   					}
   				}else if (userReceiveSet.getReceivetype()==1){
   					if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
   						fsfs=0;
   					}
   				}else if (userReceiveSet.getReceivetype()==2){
   					if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
   						fsfs=1;
   					}
   				}
   			}
   		}else{
   			//�ж��ֻ�����
				if (userinfo.getSjtel()!=null && !userinfo.getSjtel().equals("") && LoverTools.isMobileNO(userinfo.getSjtel())){
					fsfs=0;
				}else if (userinfo.getEmail()!=null && !userinfo.getEmail().equals("") && LoverTools.isEmail(userinfo.getEmail())){  //�ж�����
					fsfs=1;
				}else{
					fsfs=2;
				}
   		}
	  return fsfs;
  }
  
  /**
   * 
   * @param hyid  ���͸���ԱID
   * @param username  ���͸���Ա��
   * @param sendorreply  ���ͻ����  0������  1������
   * @param sender   �����߻�Ա��/����Ա�˻���
   * @param sendtype  ���ͷ�ʽ   0���Զ�  1���ֶ�
   * @param mobileoremail  �����ֻ�������  0���ֻ�  1������
   * @param mobileoremailc  �ֻ�������  0���ֻ�  1������
   * @param status  ����״̬  0���ɹ�   1��δ���  2:ʧ��
   * @param sendobject   ��������  0������   1���ﲨ   2����¼
   * @param sendnumber   ���ʹ���
   * @return
   */
  public static UserInfoSendReply setuserInfoSendReply(Long hyid,String username,int sendorreply,String sender,int sendtype,int mobileoremail,String mobileoremailc,int status,int sendobject,int sendnumber){
	  UserInfoSendReply userInfoSendReply=new UserInfoSendReply();
	  userInfoSendReply.setHyid(hyid);
	  userInfoSendReply.setUsername(username);
	  userInfoSendReply.setHdate(new Date(System.currentTimeMillis()));
	  userInfoSendReply.setSendorreply(sendorreply);
	  userInfoSendReply.setSender(sender);
	  userInfoSendReply.setSendtype(sendtype);
	  userInfoSendReply.setMobileoremail(mobileoremail);
	  userInfoSendReply.setMobileoremailc(mobileoremailc);
	  userInfoSendReply.setStatus(status);
	  userInfoSendReply.setSendobject(sendobject);
	  userInfoSendReply.setSendnumber(sendnumber);
	  return userInfoSendReply;
  }
	
}