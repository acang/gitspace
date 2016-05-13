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
import java.text.SimpleDateFormat;
import java.util.Date;

public class JavaMailTools{
	private MimeMessage msg = null;
    private String saveAttchPath = "";
    private StringBuffer bodytext = new StringBuffer();
    private String dateformate = "yy-MM-dd HH:mm";
    
    public JavaMailTools(MimeMessage msg){
        this.msg = msg;
        }
    public void setMsg(MimeMessage msg) {
        this.msg = msg;
    }
    
    /**
     * ��ȡ�����ʼ��ߵ�ַ
     * @return
     * @throws MessagingException
     */
    public String getFromaddr() throws MessagingException{
        InternetAddress[] address = (InternetAddress[]) msg.getFrom();
        String from = address[0].getAddress();
        if(from == null){
            from = "";
        }
        return from;
    }
    
    /**
     * ��ȡ�����ʼ�����Ϣ
     * @return
     * @throws MessagingException
     */
    public String getFrom() throws MessagingException{
        InternetAddress[] address = (InternetAddress[]) msg.getFrom();
        String from = address[0].getAddress();
        if(from == null){
            from = "";
        }
        String personal = address[0].getPersonal();
        if(personal == null){
            personal = "";
        }
        String fromaddr = personal +"<"+from+">";
        return fromaddr;
    }
    
    /**
     * ��ȡ�ʼ��ռ��ˣ����ͣ����͵ĵ�ַ����Ϣ�����������ݵĲ�����ͬ "to"-->�ռ���,"cc"-->�����˵�ַ,"bcc"-->���͵�ַ
     * @param type
     * @return
     * @throws MessagingException
     * @throws UnsupportedEncodingException
     */
    public String getMailAddress(String type) throws MessagingException, UnsupportedEncodingException{
        String mailaddr = "";
        String addrType = type.toUpperCase();
        InternetAddress[] address = null;
        
        if(addrType.equals("TO")||addrType.equals("CC")||addrType.equals("BCC")){
            if(addrType.equals("TO")){
                address = (InternetAddress[]) msg.getRecipients(Message.RecipientType.TO);
            }
            if(addrType.equals("CC")){
                address = (InternetAddress[]) msg.getRecipients(Message.RecipientType.CC);
            }
            if(addrType.equals("BCC")){
                address = (InternetAddress[]) msg.getRecipients(Message.RecipientType.BCC);
            }
            
            if(address != null){
                for(int i=0;i<address.length;i++){
                    String mail = address[i].getAddress();
                    if(mail == null){
                        mail = "";
                    }else{
                        mail = MimeUtility.decodeText(mail);
                    }
                    String personal = address[i].getPersonal();
                    if(personal == null){
                        personal = "";
                    }else{
                        personal = MimeUtility.decodeText(personal);
                    }
                    String compositeto = personal +"<"+mail+">";
                    mailaddr += ","+compositeto; 
                }
                mailaddr = mailaddr.substring(1);
            }
        }else{
            throw new RuntimeException("Error email Type!");
        }
        return mailaddr;
    }
    
    /**
     * ��ȡ�ʼ�����
     * @return
     * @throws UnsupportedEncodingException
     * @throws MessagingException
     */
    public String getSubject() throws UnsupportedEncodingException, MessagingException{
        String subject = "";
        subject = MimeUtility.decodeText(msg.getSubject());
        if(subject == null){
            subject = "";
        }
        return subject;
    }
    
    /**
     * ��ȡ�ʼ���������
     * @return
     * @throws MessagingException
     */
    public String getSendDate() throws MessagingException{
        Date sendDate = msg.getSentDate();
        SimpleDateFormat smd = new SimpleDateFormat(dateformate);
        return smd.format(sendDate);
    }
    
    /**
     * ��ȡ�ʼ���������
     * @return
     */
    public String getBodyText(){
        
        return bodytext.toString();
    }
    
    /**
     * �����ʼ������õ����ʼ����ݱ��浽һ��stringBuffer�����У������ʼ� ��Ҫ����MimeType�Ĳ�ִͬ�в�ͬ�Ĳ�����һ��һ���Ľ���
     * @param part
     * @throws MessagingException
     * @throws IOException
     */
    public void getMailContent(Part part) throws MessagingException, IOException{
        
        String contentType = part.getContentType();
        int nameindex = contentType.indexOf("name");
        boolean conname = false;
        if(nameindex != -1){
            conname = true;
        }
        System.out.println("CONTENTTYPE:"+contentType);
        if(part.isMimeType("text/plain")&&!conname){
            bodytext.append((String)part.getContent());
        }else if(part.isMimeType("text/html")&&!conname){
            bodytext.append((String)part.getContent());
        }else if(part.isMimeType("multipart/*")){
            Multipart multipart = (Multipart) part.getContent();
            int count = multipart.getCount();
            for(int i=0;i<count;i++){
                getMailContent(multipart.getBodyPart(i));
            }
        }else if(part.isMimeType("message/rfc822")){
            getMailContent((Part) part.getContent()); 
        }
        
    }
    
    /**
     * �ж��ʼ��Ƿ���Ҫ��ִ�������ִ����true�����򷵻�false
     * @return
     * @throws MessagingException
     */
    public boolean getReplySign() throws MessagingException{
        boolean replySign = false;
        String needreply[] = msg.getHeader("Disposition-Notification-TO");
        if(needreply != null){
            replySign = true;
        }
        return replySign;
    }
    
    /**
     * ��ȡ���ʼ���message-id
     * @return
     * @throws MessagingException
     */
    public String getMessageId() throws MessagingException{
        return msg.getMessageID();
    }
    
    /**
     * �жϴ��ʼ��Ƿ��Ѷ������δ���򷵻�false���Ѷ�����true
     * @return
     * @throws MessagingException
     */
    public boolean isNew() throws MessagingException{
        boolean isnew = false;
        Flags flags = ((Message)msg).getFlags();
        Flags.Flag[] flag = flags.getSystemFlags();
        System.out.println("flags's length:"+flag.length);
        for(int i=0;i<flag.length;i++){
            if(flag[i]==Flags.Flag.SEEN){
                isnew = true;
                System.out.println("seen message .......");
                break;
            }
        }
        
        return isnew;
    }
    
    /**
     * �ж����Ƿ��������
     * @param part
     * @return
     * @throws MessagingException
     * @throws IOException
     */
    public boolean isContainAttch(Part part) throws MessagingException, IOException{
        boolean flag = false;
        
        String contentType = part.getContentType();
        if(part.isMimeType("multipart/*")){
            Multipart multipart = (Multipart) part.getContent();
            int count = multipart.getCount();
            for(int i=0;i<count;i++){
                BodyPart bodypart = multipart.getBodyPart(i);
                String dispostion = bodypart.getDisposition();
                if((dispostion != null)&&(dispostion.equals(Part.ATTACHMENT)||dispostion.equals(Part.INLINE))){
                    flag = true;
                }else if(bodypart.isMimeType("multipart/*")){
                    flag = isContainAttch(bodypart);
                }else{
                    String conType = bodypart.getContentType();
                    if(conType.toLowerCase().indexOf("appliaction")!=-1){
                        flag = true;
                    }
                    if(conType.toLowerCase().indexOf("name")!=-1){
                        flag = true;
                    }
                }
            }
        }else if(part.isMimeType("message/rfc822")){
            flag = isContainAttch((Part) part.getContent());
        }
        
        return flag;
    }
    
    /**
     * ���渽��
     * @param part
     * @throws MessagingException
     * @throws IOException
     */
    public void saveAttchMent(Part part) throws MessagingException, IOException{
        String filename = "";
        if(part.isMimeType("multipart/*")){
            Multipart mp = (Multipart) part.getContent();
            for(int i=0;i<mp.getCount();i++){
                BodyPart mpart = mp.getBodyPart(i);
                String dispostion = mpart.getDisposition();
                if((dispostion != null)&&(dispostion.equals(Part.ATTACHMENT)||dispostion.equals(Part.INLINE))){
                    filename = mpart.getFileName();
                    if(filename.toLowerCase().indexOf("gb2312")!=-1){
                        filename = MimeUtility.decodeText(filename);
                    }
                    saveFile(filename,mpart.getInputStream());
                }else if(mpart.isMimeType("multipart/*")){
                    saveAttchMent(mpart);
                }else{
                    filename = mpart.getFileName();
                    if(filename != null&&(filename.toLowerCase().indexOf("gb2312")!=-1)){
                        filename = MimeUtility.decodeText(filename);
                    }
                    saveFile(filename,mpart.getInputStream());
                }
            }
            
        }else if(part.isMimeType("message/rfc822")){
            saveAttchMent((Part) part.getContent());
        }
    }
    /**
     * ��ñ��渽���ĵ�ַ
     * @return
     */
    public String getSaveAttchPath() {
        return saveAttchPath;
    }
    /**
     * ���ñ��渽����ַ
     * @param saveAttchPath
     */
    public void setSaveAttchPath(String saveAttchPath) {
        this.saveAttchPath = saveAttchPath;
    }
    /**
     * �������ڸ�ʽ
     * @param dateformate
     */
    public void setDateformate(String dateformate) {
        this.dateformate = dateformate;
    }
    /**
     * �����ļ�����
     * @param filename
     * @param inputStream
     * @throws IOException
     */
    private void saveFile(String filename, InputStream inputStream) throws IOException {
        String osname = System.getProperty("os.name");
        String storedir = getSaveAttchPath();
        String sepatror = "";
        if(osname == null){
            osname = "";
        }
        
        if(osname.toLowerCase().indexOf("win")!=-1){
            sepatror = "//";
            if(storedir==null||"".equals(storedir)){
                storedir = "d://temp";
            }
        }else{
            sepatror = "/";
            storedir = "/temp";
        }
        
        File storefile = new File(storedir+sepatror+filename);
        System.out.println("storefile's path:"+storefile.toString());
        
        BufferedOutputStream bos = null;
        BufferedInputStream bis = null;
        
        try {
            bos = new BufferedOutputStream(new FileOutputStream(storefile));
            bis = new BufferedInputStream(inputStream);
            int c;
            while((c= bis.read())!=-1){
                bos.write(c);
                bos.flush();
            }
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }finally{
            bos.close();
            bis.close();
        }
    }
    
    public static void recevie(){
   	 	String imapserver = "182.254.151.29"; // �ʼ�������
        String user = "service@51lover.net";
        String pwd = "51loverservice";     // �������ѵ������޸�
        Properties props = new Properties(); 
        props.setProperty("mail.smtp.host", "182.254.151.29");        
        props.setProperty("mail.smtp.auth", "true"); 
        Session session = Session.getDefaultInstance(props,null);        
        URLName urlname = new URLName("pop3","182.254.151.29",110,null,"service","51loverservice"); 
        try {
       	 Store store = session.getStore(urlname);
            store.connect();
            Folder folder = store.getFolder("INBOX");       
            folder.open(Folder.READ_WRITE);
            Message msgs[] = folder.getMessages();        
            int count = msgs.length; 
            System.out.println("Message Count:"+count);  
            for(int i=0;i<count;i++)
            {
           	 MimeMessage rm;
           	 rm=(MimeMessage)msgs[i];
           	 
           	 //�Ƿ��Ѷ�
           	 Flags flags = ((Message)rm).getFlags();
                Flags.Flag[] flag = flags.getSystemFlags();
                System.out.println("flags's length:"+flag.length);
                for(int j=0;j<flag.length;j++){
                    if(flag[j]==Flags.Flag.SEEN){
                        System.out.println("seen message .......");
                        break;
                    }
                }
                
                //��ȡ���͵�ַ
                InternetAddress[] address = (InternetAddress[]) rm.getFrom();
                String from = address[0].getAddress();
                if(from == null){
                    from = "";
                }
                String personal = address[0].getPersonal();
                if(personal == null){
                    personal = "";
                }
                String fromaddr = personal +"<"+from+">";
                System.out.println(fromaddr);
                
                //��ȡ�ʼ�����
                String subject = "";
                subject = MimeUtility.decodeText(rm.getSubject());
                if(subject == null){
                    subject = "";
                }
                System.out.println(subject);
                
                //��ȡ�ʼ�����
                //getMailContent(msgs[i]);
                //System.out.println(bodytext.toString());
                //ɾ���ʼ�
                if (i==0)
                {
                rm.setFlag(Flags.Flag.DELETED, true);                  
                //rm.saveChanges(); 
                }
            }
            folder.close(true);
            store.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
    }
}