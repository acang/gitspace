package com.lover;
import hibernate.db.HbmOperator;
import java.util.*;
import java.text.*;
import com.lover.mng.UserInfoSendReplyMng;
import com.web.obj.UserInfoSendReply;
import com.web.obj.Userinfo;
import com.web.common.*;

public class SmsTimerTask extends TimerTask{
  public SmsTimerTask() {
	  
  }

  public void run()
  {
    System.out.println("ÿ��9�㶨ʱ����ʼ");
    //���͵������15���δ�ϴ�ͷ����Ϣ��
//    sendNoheadimg();
    //����3������δ��¼��
//    sendNologin(3);
    //����7������δ��¼��
//    sendNologin(7);
    //����12������δ��¼��
//    sendNologin(12);
    //����2��5��10��������δ��¼���û������ﲨ����Ϊ���ӣ�
    //sendNologinQiubo(2);
    //sendNologinQiubo(5);
    //sendNologinQiubo(10);
    //����9������δ��¼��
    //sendNologin(9);
    //����12������δ��¼��
    //sendNologin(12);
    //����15������δ��¼��
    //sendNologin(15);
    //����18������δ��¼��
    //sendNologin(18);
    //����21������δ��¼��
    //sendNologin(21);
    //����24������δ��¼��
    //sendNologin(24);
    System.out.println("ÿ��9�㶨ʱ�������");
  }
  
  //���͵������15���δ�ϴ�ͷ����Ϣ��
  public void sendNoheadimg(){
	  List templist=new ArrayList();
	  //��ȡǰһ������
	  Calendar calendar = Calendar.getInstance();
	  calendar.add(Calendar.DATE, -3);    //�õ�ǰһ��
	  Date date = calendar.getTime();
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  String day=df.format(date);
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  try {
		  //��ȡǰ����ע����δ�ϴ���Ƭ�Ļ�Ա
		  templist = HbmOperator.list("from Userinfo as o where o.img = 0 and o.isdel = 0 and o.regtime >= to_date('"+day+"','YYYY-MM-DD') and o.regtime<= to_date('"+day+" 23:59:59','YYYY-MM-DD HH24:MI:SS')");
		  for (int i = 0; i < templist.size(); i++) {
			  Userinfo userinfo=new Userinfo();
			  userinfo=(Userinfo)templist.get(i);
			  if (userinfo!=null){
				  fsfs=UserInfoSendReplyMng.getuserReceiveSet(userinfo);
			  }
			  if (fsfs==0){
				  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 0, 0, userinfo.getSjtel(), 1, 0, 0);
				  String contentString="�װ���@1@���뾡���ϴ�������Ƭ���ύ���Ľ���Ч����Ч�ʣ��ҵ�������£�www.51lover.org 51����������վ";
	          	  StringBuilder content=new StringBuilder();
		          content.append("@1@="+userinfo.getLcname());
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          String result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015020813");
				  UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
				  newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
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
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 1, 0, userinfo.getEmail(), 0, 0, 0);
				  String contentString="�װ���@1@���뾡���ϴ�������Ƭ���ύ���Ľ���Ч����Ч�ʣ��ҵ�������£�www.51lover.org 51����������վ";
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          //�����ʼ�����
 				  MailTools.reMail2("51����������վ��ʾ��Ϣ",userInfoSendReply.getContent(),userinfo.getEmail());
			  }
		  }
	  } catch (Exception e) {
			System.out.println("�����ϴ���Ƭ���ѳ���" + e.getMessage());
	  }
	  
	  //��ȡǰ15������
	  calendar.add(Calendar.DATE, -12);    //�õ�ǰһ��
	  date = calendar.getTime();
	  day=df.format(date);
	  try {
		  //��ȡǰ15��ע����δ�ϴ���Ƭ�Ļ�Ա
		  templist = HbmOperator.list("from Userinfo as o where o.img = 0 and o.isdel = 0 and o.regtime >= to_date('"+day+"','YYYY-MM-DD') and o.regtime<= to_date('"+day+" 23:59:59','YYYY-MM-DD HH24:MI:SS')");
		  for (int i = 0; i < templist.size(); i++) {
			  Userinfo userinfo=new Userinfo();
			  userinfo=(Userinfo)templist.get(i);
			  if (userinfo!=null){
				  fsfs=UserInfoSendReplyMng.getuserReceiveSet(userinfo);
			  }
			  if (fsfs==0){
				  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 0, 0, userinfo.getSjtel(), 1, 0, 0);
				  String contentString="�װ���@1@���뾡���ϴ�������Ƭ���ύ���Ľ���Ч����Ч�ʣ��ҵ�������£�www.51lover.org 51����������վ";
	          	  StringBuilder content=new StringBuilder();
		          content.append("@1@="+userinfo.getLcname());
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          String result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015020813");
				  UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
				  newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
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
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 1, 0, userinfo.getEmail(), 0, 0, 0);
				  String contentString="�װ���@1@���뾡���ϴ�������Ƭ���ύ���Ľ���Ч����Ч�ʣ��ҵ�������£�www.51lover.org 51����������վ";
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          //�����ʼ�����
				  MailTools.reMail2("51����������վ��ʾ��Ϣ",userInfoSendReply.getContent(),userinfo.getEmail());
			  }
		  }
	  } catch (Exception e) {
			System.out.println("�����ϴ���Ƭ���ѳ���" + e.getMessage());
	  }
  }
  
  //����δ��¼��Ϣ��
  public void sendNologin(int number){
	  List templist=new ArrayList();
	  Calendar calendar = Calendar.getInstance();
	  calendar.add(Calendar.MONTH, -number); //�õ�ǰnumber��
	  calendar.add(Calendar.DATE, -1); 
	  Date date = calendar.getTime();
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  String day=df.format(date);
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  try {
		  templist = HbmOperator.list("from Userinfo as o where o.img = 0 and o.isdel = 0 and o.lasttime >= to_date('"+day+"','YYYY-MM-DD') and o.lasttime<= to_date('"+day+" 23:59:59','YYYY-MM-DD HH24:MI:SS')");
		  for (int i = 0; i < templist.size(); i++) {
			  Userinfo userinfo=new Userinfo();
			  userinfo=(Userinfo)templist.get(i);
			  if (userinfo!=null){
				  fsfs=UserInfoSendReplyMng.getuserReceiveSet(userinfo);
			  }
			  if (fsfs==0){
				  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 0, 0, userinfo.getSjtel(), 1, 2, 0);
				  String contentString="�װ���@1@��51����������վ�����ע���˺ܶ������Ҫ���˧����ˣ�����������ɣ�www.51lover.org";
	          	  StringBuilder content=new StringBuilder();
		          content.append("@1@="+userinfo.getLcname());
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          //content.append(",@2@="+number);
		          //contentString=contentString.replace("@2@", String.valueOf(number));
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          String result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015020846");
				  UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
				  newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
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
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 1, 0, userinfo.getEmail(), 0, 2, 0);
				  String contentString="�װ���@1@��51����������վ�����ע���˺ܶ������Ҫ���˧����ˣ�����������ɣ�www.51lover.org";
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          //contentString=contentString.replace("@2@", String.valueOf(number));
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          //�����ʼ�����
 				  MailTools.reMail2("51����������վ��ʾ��Ϣ",userInfoSendReply.getContent(),userinfo.getEmail());
			  }
		  }
	  } catch (Exception e) {
			System.out.println("����δ��¼���ѳ���" + e.getMessage());
	  }
  }
  
  //����δ��¼��Ϣ��(�������ﲨ)
  public void sendNologinQiubo(int number){
	  List templist=new ArrayList();
	  Calendar calendar = Calendar.getInstance();
	  calendar.add(Calendar.MONTH, -number); //�õ�ǰnumber��
	  calendar.add(Calendar.DATE, -1); 
	  Date date = calendar.getTime();
	  DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	  String day=df.format(date);
	  int fsfs=2; // 0:�ֻ�  1������ 2��������
	  String sex="";
	  try {
		  templist = HbmOperator.list("from Userinfo as o where o.img = 0 and o.isdel = 0 and o.lasttime >= to_date('"+day+"','YYYY-MM-DD') and o.lasttime<= to_date('"+day+" 23:59:59','YYYY-MM-DD HH24:MI:SS')");
		  for (int i = 0; i < templist.size(); i++) {
			  Userinfo userinfo=new Userinfo();
			  userinfo=(Userinfo)templist.get(i);
			  sex="��";
			  if (userinfo.getSex().equals("10"))
				  sex="��";
			  if (userinfo!=null){
				  fsfs=UserInfoSendReplyMng.getuserReceiveSet(userinfo);
			  }
			  if (fsfs==0){
				  UserInfoSendReply userInfoSendReply=UserInfoSendReplyMng.setuserInfoSendReply(
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 0, 0, userinfo.getSjtel(), 1, 2, 0);
				  String contentString="�װ���@1@,�кܶ��Ա�������������ﲨ������@2@���Ƿ���������⣡www.51lover.org 51����������վ";
	          	  StringBuilder content=new StringBuilder();
		          content.append("@1@="+userinfo.getLcname());
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          content.append(",@2@="+sex);
		          contentString=contentString.replace("@2@", sex);
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          String result=SMSTools.sendMobileMb(userinfo.getSjtel(),content.toString(),"MB-2015030835");
				  UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
				  newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(id);
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
						  	userinfo.getHyid(), userinfo.getUsername(), 0, "", 1, 0, userinfo.getEmail(), 0, 2, 0);
				  String contentString="�װ���@1@,�кܶ��Ա�������������ﲨ������@2@���Ƿ���������⣡www.51lover.org 51����������վ";
		          contentString=contentString.replace("@1@", userinfo.getLcname());
		          contentString=contentString.replace("@2@", sex);
		          userInfoSendReply.setContent(contentString);
		          Long id=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
		          //�����ʼ�����
 				  MailTools.reMail2("51����������վ��ʾ��Ϣ",userInfoSendReply.getContent(),userinfo.getEmail());
			  }
		  }
	  } catch (Exception e) {
			System.out.println("����δ��¼���ѳ���" + e.getMessage());
	  }
  }
}
