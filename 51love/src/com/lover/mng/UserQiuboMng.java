package com.lover.mng;
import com.web.common.*;
import com.web.obj.*;
import hibernate.db.*;
import java.util.*;
import com.lover.SMSTools;

public class UserQiuboMng {
  public UserQiuboMng() {
  }
  
  /**
   * 
   * @param hyid
   * @return
   */
  public  Userqiubo getUserqiubo(String hyid){
	  Userqiubo userqiubo=null;
	try {
		 List list = HbmOperator.list("from Userqiubo as o where o.hyid=" + hyid);
         if (list!=null && list.size()>0){
        	 userqiubo= (Userqiubo) list.get(0);
         }
	} catch (Exception e) {
		 System.out.println(e.getMessage());
	}
	return userqiubo;
  }
  
  public void insertUserqiubo(Long hyid, Integer qiubo_number){
  	String s = null;
	try {
		 Vector saveList = new Vector();
	     MutSeaObject mso = null;
	     Userqiubo userqiubo=new Userqiubo();
	     userqiubo.setHyid(hyid);
	     userqiubo.setQiubo_number(qiubo_number);
	     mso = new MutSeaObject();
         mso.setHbmSea(userqiubo,MutSeaObject.SEA_HBM_INSERT);
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);
	} catch (Exception e) {
		 System.out.println(e.getMessage());
         s = "��Ӹ����ﲨ���������������Ա��ϵ��";
	}
  }
  
  public void updateUserqiubo(Userqiubo userqiubo){
  	String s = null;
	try {
		 Vector saveList = new Vector();
	     MutSeaObject mso = null;
	     mso = new MutSeaObject();
         mso.setHbmSea(userqiubo,MutSeaObject.SEA_HBM_UPDATE);
         saveList.add(mso);
         HbmOperator.SeaMutData(saveList);
	} catch (Exception e) {
		 System.out.println(e.getMessage());
         s = "�޸ĸ����ﲨ���������������Ա��ϵ��";
	}
  }
  
  /**
   * �����û�ID��ȡ�ۼ��ﲨ�����������ﲨƥ�䣩
   * @param hyid  �û�ID
   * @return   �ۼ��ﲨ�����������ﲨƥ�䣩
   */
  public int getUserqiubo_number(Long hyid){
	  int qiubo_number=0;
	  //�ﲨ��
	  qiubo_number=qiubo_number+SysCommonFunc.getNumberForSql("select count(1) from db_qiubo where postuserid="+hyid).intValue();
	  //ȡ�ﲨƥ���ȡ�û�Ա��¼ʱ��֮����ﲨƥ��������ݣ�,�Ҹû�ԱΪŮ��Ա
	  Userinfo userinfo=HYRegMng.getUserinfoByHyid(hyid.toString());
	  if (userinfo!=null && userinfo.getSex()!=null && userinfo.getSex().equals("10")){
		  Date lastTime=userinfo.getLasttime();
		  Calendar cal = Calendar.getInstance();
		  cal.setTime(userinfo.getCsdate());
		  int start = cal.get(Calendar.YEAR)-15;
		  int end = cal.get(Calendar.YEAR)+5;
		  String sDate=start+"-01-01";
		  String eDate=end+"-12-31";
		  String sql = "select count(1) from Db_QiuboFs q join USERINFO u on q.SENDUSERID=u.HYID where q.sendtime >= to_date('"+DateTools.dateToString(lastTime,true)+"','YYYY-MM-DD HH24:MI:SS') ";
	      sql = sql + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD') and u.s1='"+userinfo.getS1()+"' and u.sex='11'";
	      qiubo_number=qiubo_number+SysCommonFunc.getNumberForSql(sql).intValue();
	  }
	  return qiubo_number;
  }
  
  /**
   * 
   * @param hyid   �û�ID
   * @param username   �������û���
   * @param nickname  �������ǳ�
   * @param sex  �Ա�
   * @param qiubo_number  �ۼ��ﲨ����
   */
  public void sendqiubowarn(Long hyid,String username,String nickname,String sex,int qiubo_number){
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  Userinfo userinfo=HYRegMng.getUserinfoByHyid(hyid.toString());
	  int i=0;
	  try {
		  if (userinfo!=null){
			  boolean blfs=false;
			  String contentString="�װ���@1@,@2@�Ȼ�Ա����������@3@���ﲨ������@4@���Ƿ���������⣡www.51lover.org 51����������վ";
			  if (qiubo_number>10){
				  contentString="�װ���@1@,����@2@���ڶ��Ա�����������ﲨ������@3@���Ƿ���������⣡www.51lover.org 51����������վ";
			  }
			  StringBuilder content=new StringBuilder();
	          content.append("@1@="+userinfo.getLcname());
	          contentString=contentString.replace("@1@", userinfo.getLcname());
	          content.append(",@2@="+nickname);
	          contentString=contentString.replace("@2@", nickname);
			  if (qiubo_number==10){
				  content.append(",@3@=10");
		          contentString=contentString.replace("@3@", "10");
		          i=1;
		          blfs=true;
			  }/*else if (qiubo_number==25){
				  //content.append(",@3@=15");
		          //contentString=contentString.replace("@3@", "15");
		          i=2;
		          blfs=true;
			  }else if (qiubo_number>=75){
				  //���ﲨ�ۼ�������50������
				  if (((qiubo_number-25)%50)==0){
					  //content.append(",@3@=50");
			          //contentString=contentString.replace("@3@", "50");
			          i=(qiubo_number-25)/50+2;
			          blfs=true;
				  }
			  }*/
			  //content.append(",@4@="+sex);
	          //contentString=contentString.replace("@4@", sex);
			  if (qiubo_number>10){
				  content.append(",@3@="+sex);
		          contentString=contentString.replace("@3@", sex);
			  }else{
				  content.append(",@4@="+sex);
		          contentString=contentString.replace("@4@", sex);
			  }
			  
			  //�ж����ֻ����ͻ������䷢��
			  if (blfs){
				  fsfs=UserInfoSendReplyMng.getuserReceiveSet(userinfo);
				  if (fsfs==0){
					  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
							  	userinfo.getHyid(), userinfo.getUsername(), 0, username, 0, 0, userinfo.getSjtel(), 1, 1, i);
					  userInfoSendReply.setContent(contentString);
			        //  Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
			          String result="";
			          if (qiubo_number>10){
			        	//  result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015021138");
			          }else{
			        	//  result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015020822");
			          }
					  UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
					//  newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
					  if (newuserInfoSendReply!=null){
						  if (result.indexOf("#")<=0){
					    	 newuserInfoSendReply.setStatus(Integer.parseInt(result));
								
						  }else{
						     newuserInfoSendReply.setStatus(0);
						  }
						  HbmOperator.update(newuserInfoSendReply);
					  }
				  }else if (fsfs==1) {
					  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
							  	userinfo.getHyid(), userinfo.getUsername(), 0, username, 1, 0, userinfo.getEmail(), 0, 1, i);
					  userInfoSendReply.setContent(contentString);
			     //     Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
			          //�����ʼ�����
	 			//	  MailTools.reMail2("51����������վ��ʾ��Ϣ",userInfoSendReply.getContent(),userinfo.getEmail());
				  }
			  }
		  }
		
	   } catch (Exception e) {
			// TODO: handle exception
		   System.out.println("�����ﲨ���ѳ���" + e.getMessage());
	   }
  }
}