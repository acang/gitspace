package com.web.common;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import java.util.Date;
import javax.activation.*;
import java.io.*;

import com.jit.util.GetMinConnect;
import com.sun.mail.smtp.*;
import com.sun.mail.imap.*;
import sun.misc.BASE64Encoder;
import javax.mail.*;
import com.lover.mng.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import com.web.obj.*;
import org.apache.commons.beanutils.DynaBean;


public class MailTools
{
//    private MimeMessage mimeMsg; //MIME�ʼ�����
//    private Session session; //�ʼ��Ự����
//    private Properties props; //ϵͳ����
//    private boolean needAuth = false; //smtp�Ƿ���Ҫ��֤
//    private String username = ""; //smtp��֤�û���������
//    private String password = "";
//    private Multipart mp; //Multipart����,�ʼ�����,����,���������ݾ���ӵ����к�������//MimeMessage����

//    public final static String FROM     = "service@51lover.org";
//    public final static String NICKNAME = "51��������";
//
//    public final static String USERNAME = "service@51lover.org";
//    public final static String PASSWORD = "123456";
//    public final static String MAILIP   = "58.222.0.190";



    //public final static String FROM = "<service@51lover.net>";
	public final static String FROM = "<service@51lover.org>";
    //public final static String NICKNAME = "51��������";
    public final static String NICKNAME = "www.51lover.org";

    public final static StringBuffer bodytext = new StringBuffer();

    public final static String USERNAME = "service@51lover.org";
    //public final static String PASSWORD = "huang2000780116";
    public final static String PASSWORD = "51loverservice";
    public final static String MAILIP   = "182.254.151.29";
    //public final static String MAILIP   = "61.155.107.6";

    /*public final static String  adds="<br><br><br><br><br><br><br>51����������վ<br>" +
            "�й�AAA��������ཻ����վ<br>" +
            "�ҵ����԰��£������м�į��<br>" +
            "�ͷ��绰��4000680001<br>" +
            "��ַ�������Ͼ��ؽ��������ƴ�6��¥B��<br>" +
            "�����ʼ����ܻظ�����������<a href='http://www.51lover.org/kfzx.jsp'>��վ�ͷ��������ԣ�<br>";*/
    
    public final static String  adds="<br><br><br><br><br><br><br>www.51lover.org<br>" +
    "�ҵ����԰��£������м�į��<br>" +
    "�ͷ��绰��025-85519991<br>" +
    "��ַ�������Ͼ��ؽ��������ƴ�6��¥B��<br>" +
    "�����ʼ����ܻظ�����������<a href='http://www.51lover.org/kfzx.jsp'>��վ�ͷ��������ԣ�<br>";
    
    public final static String  adds2="<br><br><br><br><br><br><br>www.51lover.org<br>" +
    "�ҵ����԰��£������м�į��<br>" +
    "�ͷ��绰��025-85519991<br>" +
    "��ַ�������Ͼ��ؽ��������ƴ�6��¥B��<br>";
    
    static {
      setSmtpHost("smtp");
    }

    public MailTools(String smtp)
    {
      //this.setSmtpHost(smtp);
//      this.createMimeMessage();
    }


    public static void setSmtpHost(String hostName)
    {
       System.out.println("����ϵͳ���ԣ�mail.smtp.host = "+hostName);
       System.out.println("����smtp�����֤��mail.smtp.auth = ");

       Properties  props = System.getProperties(); //���ϵͳ���Զ���
       props.put("mail.smtp.host",hostName); //����SMTP����
       props.put("mail.smtp.auth", "true");
     }

     public static boolean reMail(String title,String content,String to)
     {
       SMTPTransport t = null;
       boolean rs = false;
       try
       {
         Properties props = System.getProperties();
         Session session = Session.getInstance(props, null);
         session.setDebug(false);

         Message msg = new MimeMessage(session);
         String from1 = javax.mail.internet.MimeUtility.encodeText(MailTools.NICKNAME);
//         System.out.println(from);
         //msg.setFrom(new InternetAddress(from1+MailTools.FROM, MailTools.NICKNAME));


         //String from2 = new BASE64Encoder().encode(MailTools.FROM.getBytes());
         //System.out.println(from1+from2);

         msg.setFrom(new InternetAddress(from1+MailTools.FROM));

         msg.setRecipients(Message.RecipientType.TO,
                           InternetAddress.parse(to, false));
         msg.setSubject(title);
         Multipart mp = new MimeMultipart();
         MimeBodyPart mbp = new MimeBodyPart();

       // �趨�ʼ����ݵ�����Ϊ text/plain �� text/html

         mbp.setContent(content+MailTools.adds,"text/html ;charset=GB2312");
         mp.addBodyPart(mbp);
         msg.setContent(mp);




         //msg.setHeader("X-Mailer", "sss");
         msg.setSentDate(new Date());

         t = (SMTPTransport) session.getTransport("smtp");

         t.connect(MailTools.MAILIP, MailTools.USERNAME, MailTools.PASSWORD);

         t.sendMessage(msg, msg.getAllRecipients());
         rs = true;
       }catch(Exception e)
       {
         System.out.println(e.getMessage());
         rs = false;
       }finally
       {
           if(t != null)
           {
             try
             {
               t.close();
             }catch(Exception ee)
             {

             }
           }
       }
       return rs;
     }
     
     public static boolean reMail2(String title,String content,String to)
     {
       SMTPTransport t = null;
       boolean rs = false;
       try
       {
         Properties props = System.getProperties();
         Session session = Session.getInstance(props, null);
         session.setDebug(false);

         Message msg = new MimeMessage(session);
         String from1 = javax.mail.internet.MimeUtility.encodeText(MailTools.NICKNAME);
//         System.out.println(from);
         //msg.setFrom(new InternetAddress(from1+MailTools.FROM, MailTools.NICKNAME));


         //String from2 = new BASE64Encoder().encode(MailTools.FROM.getBytes());
         //System.out.println(from1+from2);

         msg.setFrom(new InternetAddress(from1+MailTools.FROM));

         msg.setRecipients(Message.RecipientType.TO,
                           InternetAddress.parse(to, false));
         msg.setSubject(title);
         Multipart mp = new MimeMultipart();
         MimeBodyPart mbp = new MimeBodyPart();

       // �趨�ʼ����ݵ�����Ϊ text/plain �� text/html

         mbp.setContent(content+MailTools.adds2,"text/html ;charset=GB2312");
         mp.addBodyPart(mbp);
         msg.setContent(mp);




         //msg.setHeader("X-Mailer", "sss");
         msg.setSentDate(new Date());

         t = (SMTPTransport) session.getTransport("smtp");

         t.connect(MailTools.MAILIP, MailTools.USERNAME, MailTools.PASSWORD);

         t.sendMessage(msg, msg.getAllRecipients());
         rs = true;
       }catch(Exception e)
       {
         System.out.println(e.getMessage());
         rs = false;
       }finally
       {
           if(t != null)
           {
             try
             {
               t.close();
             }catch(Exception ee)
             {

             }
           }
       }
       return rs;
     }
     
     
     public static void recevie(){
    	 String imapserver = MAILIP; // �ʼ�������
         String user = USERNAME;
         String pwd = PASSWORD;     // �������ѵ������޸�
         Properties props = new Properties(); 
         props.setProperty("mail.smtp.host", MAILIP);        
         props.setProperty("mail.smtp.auth", "true"); 
         Session session = Session.getDefaultInstance(props,null);        
         URLName urlname = new URLName("pop3",MAILIP,110,null,USERNAME,PASSWORD); 
         try {
        	 Store store = session.getStore(urlname);
             store.connect();
             Folder folder = store.getFolder("INBOX");       
             folder.open(Folder.READ_WRITE);
             Message msgs[] = folder.getMessages();        
             int count = msgs.length; 
             System.out.println("�ʼ�����:"+count);  
             for(int i=0;i<count;i++)
             {
            	 MimeMessage rm;
            	 rm=(MimeMessage)msgs[i];
                 
                 //��ȡ���͵�ַ
                 InternetAddress[] address = (InternetAddress[]) rm.getFrom();
                 String from = address[0].getAddress();
                 if(from == null){
                     from = "";
                 }          
                 
                 //��ȡ�ʼ�����
                 String subject = "";
                 subject = MimeUtility.decodeText(rm.getSubject());
                 if(subject == null){
                     subject = "";
                 }
                 System.out.println(subject);
                 
                 //��ȡ�ʼ�����
                 bodytext.setLength(0);
                 getMailContent(msgs[i]);
                 //System.out.println(bodytext.toString());
                 
                 //���ʼ�����д�뷢��/�ظ���¼��Ϳͷ�����
                 List list=UserInfoSendReplyMng.getUserInfoSendReplyList(from,1);
             	 DynaBean dbtnew=null;
             	 if (list!=null){
             		for(int j =0;j < list.size();j ++){
             			dbtnew=(DynaBean)list.get(j);
             			Userinfo userinfo=new Userinfo();
            			userinfo=HYRegMng.getUserinfoByHyid(String.valueOf(dbtnew.get("hyid")));
	             		UserInfoSendReply newUserInfoSendReply=new UserInfoSendReply();
	             		newUserInfoSendReply.setHyid(Long.parseLong(String.valueOf(dbtnew.get("hyid"))));
	             		if (userinfo!=null){
	        				newUserInfoSendReply.setUsername(userinfo.getUsername());
	        			}else{
	        				newUserInfoSendReply.setUsername("");
	        			}
	             		newUserInfoSendReply.setContent(bodytext.toString());
	             		newUserInfoSendReply.setHdate(rm.getSentDate());
	             		newUserInfoSendReply.setSendorreply(1);
	             		newUserInfoSendReply.setMobileoremailc(from);
	             		newUserInfoSendReply.setMobileoremail(1);
	             		newUserInfoSendReply.setSendtype(0);
	             		UserInfoSendReplyMng.insertUserInfoSendReply(newUserInfoSendReply);
	             		
	             		Kfzx kfzx=new Kfzx(); 
	             		if (userinfo!=null){
	             			kfzx.setUsername(userinfo.getUsername());
	        			}else{
	        				kfzx.setUsername("");
	        			}
	            		kfzx.setTel("");
	            		kfzx.setEmail("");
	            		kfzx.setNtitle(subject);
	            		kfzx.setNtext(bodytext.toString());
	            		kfzx.setNdate(rm.getSentDate());
	            	    kfzx.setNtype(new Integer(0));
	            	    kfzx.setZtai(new Integer(0));
	            	    kfzx.setIpaddress(from);
	            	    kfzx.setDeletename("");
	            	    kfzx.setEmail2(from);
	            	    kfzx.setHyid(Long.parseLong(String.valueOf(dbtnew.get("hyid"))));
	            	    kfzx.setSource(1);
	            	    kfzx.setMobileoremail(1);
	            	    KFZXMng.addKfzx(kfzx);
             		}
             	}
                 //ɾ���ʼ�
                 rm.setFlag(Flags.Flag.DELETED, true); 
             }
             folder.close(true);
             store.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
              
          
     }
     
     
     /**
      * �����ʼ������õ����ʼ����ݱ��浽һ��stringBuffer�����У������ʼ� ��Ҫ����MimeType�Ĳ�ִͬ�в�ͬ�Ĳ�����һ��һ���Ľ���
      * @param part
      * @throws MessagingException
      * @throws IOException
      */
     public static void getMailContent(Part part) throws MessagingException, IOException{
         
         String contentType = part.getContentType();
         int nameindex = contentType.indexOf("name");
         boolean conname = false;
         if(nameindex != -1){
             conname = true;
         }
         if(part.isMimeType("text/*")&&!conname){
             bodytext.append((String)part.getContent());
         }else if(part.isMimeType("multipart/*")){
             Multipart multipart = (Multipart) part.getContent();
             int count = multipart.getCount();
             for(int i=1;i<count;i++){
                 //getMailContent(multipart.getBodyPart(i));
            	 bodytext.append(multipart.getBodyPart(i).getContent().toString());
             }
         }
         
     }

public static void main(String[] args)
{

try
{
    long test = System.currentTimeMillis();
     boolean b =     MailTools.reMail("����", "<br>����fdsafdsafd���ı���111111111<br>fdsafdsaf<br>", "hwjxsy@163.com");
     System.out.println(b);
     System.out.println((System.currentTimeMillis()-test)/1000);
       }catch(Exception e)
       {
         e.printStackTrace();
       }
//     String from = "service@51lover.org";
//     //String sendname = "51��������";
//
//
//
//     String username =  "service@51lover.org";
//     String password = "123456";
//     String ip = "58.222.0.190";
//     String to = "hwjxsy@163.com";
//
//
//   String mailbody = "hello. This is a testing.";
//   MailTools themail = new MailTools(ip);
//   themail.setNeedAuth(true);
//   if(themail.setSubject("����") == false)
//     return;
//   if(themail.setBody(mailbody) == false)
//     return;
//   if(themail.setTo(to) == false)
//     return;
//   if(themail.setFrom(from) == false)
//     return;
//   themail.setNamePass(username,password); //�û���������
//   if(themail.sendout() == false)
//     return;
}

}





