package com.lover;

import cn.emay.sdk.client.api.Client;
import cn.emay.sdk.client.api.StatusReport;

import com.lover.mng.HYRegMng;
import com.web.bean.QueryRecord;
import com.web.common.DateTools;
import com.web.common.SysCommonFunc;
import com.web.obj.SendSms;
import com.web.obj.Userinfo;

import hibernate.db.HbmOperator;



import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import org.python.modules.synchronize;

/**
 * Created by IntelliJ IDEA.
 * User: ThinkPad
 * Date: 11-11-4
 * Time: ����1:56
 * To change this template use File | Settings | File Templates.
 */
public class SMSTools {


    public static Client  smsTools;

    public static Client getClient()
    {

        try
        {
        if(smsTools == null)
            smsTools = new Client("6SDK-EMY-6688-JCTON","761111");
        }catch(Exception e)
        {
            System.out.println("��ʼ�����Žӿڳ���"+e.getMessage());
        }

        return smsTools;

    }


    public synchronized static String sendSms(String mobile,HttpServletRequest request)
    {
        String sp = (String)request.getSession().getAttribute("sp");
        String gsp = request.getParameter("sp");

        //System.out.println("sp="+sp+"---"+"gsp="+gsp+"--"+request.getRemoteAddr());
        if(sp == null)
          return  "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        if(gsp == null)
          return  "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        if(sp.length() ==0)
          return  "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        if(!sp.equals(gsp))
          return  "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";

        try{
        String ip = getIpAddrByRequest(request);
        List tempList = HbmOperator.list("from Usernamecut as o where o.usernamecut='"+mobile+"'");
        if(tempList != null && tempList.size() > 0)
        {
            return "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        }
        List reList = HbmOperator.list("from SendSms as o where o.mobileNumber='"+mobile+"' and o.sysSubmitDate >= sysdate - 1");
        
        if(reList != null && reList.size()>2){
        	return "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        }
        List iList = HbmOperator.list("from SendSms as o where o.userIp='"+ip+"' and o.sysSubmitDate >= sysdate - 1");
        if(iList != null && iList.size()>5){
        	return "�����ֻ����벻��ע�ᣡ�뻻�������ʱ����ע�ᣡ";
        }
        Date cdate = new Date(System.currentTimeMillis());
        System.out.println(DateTools.dateToString(cdate,true)+"-"+ip+"-"+mobile);

        Userinfo user=   HYRegMng.getUserinfoByUsername(mobile);
        if(user != null)
           return "11�����ֻ������ѱ�ע�ᣬ��ʹ���ܱ������һ����룬�򻻸�����ע�ᣡ";

        Userinfo user1=   HYRegMng.getUserinfoBySjtel(mobile);
        if(user1 != null)
           return "11�����ֻ������ѱ���֤�����һ��û���������򻻸�������֤��";
        
       String sql = "from SendSms as o where o.mobileNumber='"+mobile+"' order by id desc";
        String sql1 = "from SendSms as o where o.userIp='"+ip+"' order by id desc";
       List sList = HbmOperator.list(sql);
        List ilist= HbmOperator.list(sql1);
       if(sList != null && sList.size() > 0)
       {
           SendSms ss = (SendSms)sList.get(0);

           //System.out.println(new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime());
            if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
            return "��2���Ӻ���[��ȡ������֤��]��ť��";
        }
        if(ilist != null && ilist.size() > 0)
        {
            SendSms ss = (SendSms)ilist.get(0);

            //System.out.println(new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime());
            if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
              return "��2���Ӻ���[��ȡ������֤��]��ť��";
        }

        SendSms ss = new SendSms();


        String s = System.currentTimeMillis() + "";
        String veryCode = s.substring(s.length()-6);
        Long a=SysCommonFunc.getSequenceIdForOracle("SEQ_SMS");
        ss.setId(a);
        ss.setMobileNumber(mobile);
        ss.setReportStatus(-1);
        ss.setSysSubmitDate(cdate);
        ss.setVeryCode(veryCode);
        ss.setRegstatus(-1);
        ss.setUserIp(ip);
        ss.setComp(new Long(1));
        ss.setVcation(new Long(0));
        HbmOperator.insert(ss);


         //String fs = "��ӭע��51����������վ������ע����֤��Ϊ��"+ss.getVeryCode()+"��������վע��ҳ����֤��";
        String fs = ss.getVeryCode();

//        int i = SMSTools.getClient().sendSMSEx(new String[]{mobile},fs,"","GBK",3,ss.getId().longValue());
//
//        if(i !=0)
//            return "������֤���ų���"+i ;
//

         String result=sendMobile(mobile, fs);
         List liste = HbmOperator.list("from SendSms as o where o.id="+a);
         if(liste != null && liste.size() > 0)
         {
             SendSms sSms= (SendSms)liste.get(0);
             sSms.setReturnStr(result);
             if (result.indexOf("#")>0){
            	 sSms.setReportStatus(0);
            	 HbmOperator.update(sSms);
             }

         }
         
         
         System.out.println(result);
         
        }catch(Exception e)
        {
            System.out.println("���Ͷ��ų���"+e.getMessage());
            return "������֤���ų���!";
        }
    	
    
    	


        return null;

    }
    
    //add by gaojinghong 20120820 for �ֻ���֤ start
    public synchronized static String sendSjyz(String mobile,HttpServletRequest request)
    {
    	 String sp = (String)request.getSession().getAttribute("sp");
         String gsp = request.getParameter("sp");
         if(sp == null)
           return  "�����ֻ����벻����֤���뻻�������ʱ������֤��11";
         if(gsp == null)
           return  "�����ֻ����벻����֤���뻻�������ʱ������֤��22";
         if(sp.length() ==0)
           return  "�����ֻ����벻����֤���뻻�������ʱ������֤��33";
         //��ֹ����Ⱥ�����������ε�����Ϊchrome�ں��������֧��
         //if(!sp.equals(gsp))
           //return  "�����ֻ����벻����֤���뻻�������ʱ������֤��";
        if(mobile.length()!=11){
            return  "�����ֻ����벻����֤���뻻�������ʱ������֤1111111111111��";
        }
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
        Matcher m = p.matcher(mobile);
        if(!m.matches()){
            return  "�����ֻ����벻����֤���뻻�������ʱ������֤��44";
        }

         try{
             String ip = getIpAddrByRequest(request);
             List tempList = HbmOperator.list("from Usernamecut as o where o.usernamecut='"+mobile+"'");
             if(tempList != null && tempList.size() > 0)
             {
                 return "�����ֻ������ѱ����Σ��뻻��������֤��";
             }
             List reList = HbmOperator.list("from SendSms as o where o.mobileNumber='"+mobile+"' and o.sysSubmitDate >= trunc(sysdate)");
             
             if(reList != null && reList.size()>2){
             	return "�����ֻ���������Ѷ�η�����֤�����뻻���ֻ������������ԣ�";
             }
             /*List iList = HbmOperator.list("from SendSms as o where o.userIp='"+ip+"' and o.sysSubmitDate >= sysdate - 1");
             if(iList != null && iList.size()>5){
             	return "�����ֻ����벻����֤���뻻�������ʱ������֤��";
             }*/
             Date cdate = new Date(System.currentTimeMillis());
             System.out.println(DateTools.dateToString(cdate,true)+"-"+ip+"-"+mobile);

             Userinfo user=   HYRegMng.getUserinfoBySjtel(mobile);
             if(user != null)
                return "�����ֻ������ѱ���֤���������������֤��";

            String sql = "from SendSms as o where o.mobileNumber='"+mobile+"' order by id desc";
            String sql1 = "from SendSms as o where o.userIp='"+ip+"' order by id desc";
            List sList = HbmOperator.list(sql);
             List ilist= HbmOperator.list(sql1);
            if(sList != null && sList.size() > 0)
            {
                SendSms ss = (SendSms)sList.get(0);
                if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
                 return "��2���Ӻ���[��ȡ������֤��]��ť��";
             }
             if(ilist != null && ilist.size() > 0)
             {
                 SendSms ss = (SendSms)ilist.get(0);
                 if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
                   return "��2���Ӻ���[��ȡ������֤��]��ť��";
             }

             SendSms ss = new SendSms();

             String s = System.currentTimeMillis() + "";
             String veryCode = s.substring(s.length()-6);
             Long a=SysCommonFunc.getSequenceIdForOracle("SEQ_SMS");
             ss.setId(a);
             ss.setMobileNumber(mobile);
             ss.setReportStatus(-1);
             ss.setSysSubmitDate(cdate);
             ss.setVeryCode(veryCode);
             ss.setRegstatus(-1);
             ss.setUserIp(ip);
             ss.setComp(new Long(1));
             ss.setVcation(new Long(0));
             ss.setFromclass(new Integer(1));
             HbmOperator.insert(ss);


             //String fs = "����51����������վ��ע����֤��Ϊ��"+ss.getVeryCode()+"��������վ�ֻ���֤ҳ��������֤����֤��";
             String fs = ss.getVeryCode();

	          String result=sendMobile(mobile, fs);
	          List liste = HbmOperator.list("from SendSms as o where o.id="+a);
	          if(liste != null && liste.size() > 0)
	          {
	              SendSms sSms= (SendSms)liste.get(0);
	              sSms.setReturnStr(result);
	              if (result.indexOf("#")>0){
	             	 sSms.setReportStatus(0);
	              }
	              HbmOperator.update(sSms);
	
	          }
	          System.out.println(result);
              
         }catch(Exception e)
         {
             System.out.println("���Ͷ��ų���"+e.getMessage());
             return "������֤���ų���!";
         }
         	
         return null;

    }
    //add by gaojinghong 20120820 for �ֻ���֤ end
    
  //add by gaojinghong 20150307 for �ֻ���̬���ŵ�¼��֤ start
    public synchronized static String sendSjdlval(String mobile,HttpServletRequest request)
    {
    	 String sp = (String)request.getSession().getAttribute("sp");
         String gsp = request.getParameter("sp");
        System.out.println("--------"+sp);
        System.out.println("-------gww"+gsp);
        if(sp == null)
            return  "�����ֻ����벻�ܻ�ȡУ���룡�뻻�������ʱ���ٻ�ȡУ���룡";

         if(gsp == null)
           return  "�����ֻ����벻�ܻ�ȡУ���룡�뻻�������ʱ���ٻ�ȡУ���룡";
         if(sp.length() ==0)
           return  "�����ֻ����벻�ܻ�ȡУ���룡�뻻�������ʱ���ٻ�ȡУ���룡";
         //��ֹ����Ⱥ�����������ε�����Ϊchrome�ں��������֧��
         //if(!sp.equals(gsp))
         //  return  "�����ֻ����벻����֤���뻻�������ʱ������֤��55";
         
         try{
             //add by gaojianhong 20150308 for �ж��Ƿ��и��ֻ�������� start
        	 String sqlString="select hyid from USERINFO o where o.isdel=0 and o.sjtel='"+mobile+"'";
     		 List userList=QueryRecord.query(sqlString);
     		 if(userList != null && userList.size() == 0)
             {
                return "�����ֻ����벻���ڣ��뻻�������ȡУ���룡";
             }
        	 //add by gaojianhong 20150308 for �ж��Ƿ��и��ֻ�������� end
        	 
        	 String ip = getIpAddrByRequest(request);
             if("58.216.217.70".equals(ip)){
                 return "����ip�ѱ����Σ�";
             }
             List tempList = HbmOperator.list("from Usernamecut as o where o.usernamecut='"+mobile+"'");
             if(tempList != null && tempList.size() > 0)
             {
                 return "�����ֻ������ѱ����Σ��뻻�������ȡУ���룡";
             }
             List reList = HbmOperator.list("from SendSms as o where o.mobileNumber='"+mobile+"' and o.sysSubmitDate >= trunc(sysdate)");
             
             if(reList != null && reList.size()>30){
             	return "�����ֻ���������Ѷ�η��ͻ�ȡУ���������뻻���ֻ������������ԣ�";
             }
             /*List iList = HbmOperator.list("from SendSms as o where o.userIp='"+ip+"' and o.sysSubmitDate >= sysdate - 1");
             if(iList != null && iList.size()>5){
             	return "�����ֻ����벻����֤���뻻�������ʱ������֤��";
             }*/
             Date cdate = new Date(System.currentTimeMillis());
             System.out.println(DateTools.dateToString(cdate,true)+"-"+ip+"-"+mobile);

            String sql = "from SendSms as o where o.mobileNumber='"+mobile+"' order by id desc";
            String sql1 = "from SendSms as o where o.userIp='"+ip+"' order by id desc";
            List sList = HbmOperator.list(sql);
             List ilist= HbmOperator.list(sql1);
            if(sList != null && sList.size() > 0)
            {
                SendSms ss = (SendSms)sList.get(0);
                if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
                 return "��2���Ӻ���[��ѻ�ȡУ����]��ť��";
             }
             if(ilist != null && ilist.size() > 0)
             {
                 SendSms ss = (SendSms)ilist.get(0);
                 if((new Date(System.currentTimeMillis()).getTime() - ss.getSysSubmitDate().getTime())/1000< 120 )
                   return "��2���Ӻ���[��ѻ�ȡУ����]��ť��";
             } 
         }catch(Exception e)
         {
             System.out.println("���Ͷ�����֤����"+e.getMessage());
             return "����У���������֤����!";
         }
         	
         return null;

    }
    
    //add by gaojinghong 20150307 for �ֻ���̬���ŵ�¼ start
    public synchronized static String sendSjdl(String mobile,HttpServletRequest request)
    {
         try{
             Date cdate = new Date(System.currentTimeMillis());
             String ip = getIpAddrByRequest(request);
             SendSms ss = new SendSms();
             System.out.println("000000000000000000000");
             if(mobile.length()!=11){
                 System.out.println("111111111111111");
                 return null;
             }
             if("58.216.217.10".equals(ip)){
                 System.out.println("2222222222");
                 return null;
             }
             String s = System.currentTimeMillis() + "";
             String veryCode = s.substring(s.length()-6);
             Long a=SysCommonFunc.getSequenceIdForOracle("SEQ_SMS");
             ss.setId(a);
             ss.setMobileNumber(mobile);
             ss.setReportStatus(-1);
             ss.setSysSubmitDate(cdate);
             ss.setVeryCode(veryCode);
             ss.setRegstatus(-1);
             ss.setUserIp(ip);
             ss.setComp(new Long(1));
             ss.setVcation(new Long(0));
             ss.setFromclass(new Integer(2));
             HbmOperator.insert(ss);


             //String fs = "����51����������վ��ע����֤��Ϊ��"+ss.getVeryCode()+"��������վ�ֻ���֤ҳ��������֤����֤��";
             String fs = ss.getVeryCode();

	          String result=sendMobile(mobile, fs,"MB-2015030725");
	          List liste = HbmOperator.list("from SendSms as o where o.id="+a);
	          if(liste != null && liste.size() > 0)
	          {
	              SendSms sSms= (SendSms)liste.get(0);
	              sSms.setReturnStr(result);
	              if (result.indexOf("#")>0){
	             	 sSms.setReportStatus(0);
	              }
	              HbmOperator.update(sSms);
	
	          }
	          System.out.println(result);
              
         }catch(Exception e)
         {
             System.out.println("���Ͷ��ų���"+e.getMessage());
             return "����У������ų���!";
         }
         	
         return null;

    }
    //add by gaojinghong 20150307 for �ֻ���̬���ŵ�¼ end
    
    public synchronized static String sendPwd(String mobile,HttpServletRequest request)
    {

        try{
        String ip = getIpAddrByRequest(request);
        List tempList = HbmOperator.list("from Usernamecut as o where o.usernamecut='"+mobile+"'");
        Date cdate = new Date(System.currentTimeMillis());

        Userinfo user=   HYRegMng.getUserinfoByUsername(mobile);
        if(user != null)
           return "11�����ֻ������ѱ�ע�ᣬ��ʹ���ܱ������һ����룬�򻻸�����ע�ᣡ";

       String sql = "from SendSms as o where o.mobileNumber='"+mobile+"' order by id desc";
        String sql1 = "from SendSms as o where o.userIp='"+ip+"' order by id desc";
       List sList = HbmOperator.list(sql);
        List ilist= HbmOperator.list(sql1);
       if(sList != null && sList.size() > 0)
       {
           SendSms ss = (SendSms)sList.get(0);

        }
        if(ilist != null && ilist.size() > 0)
        {
            SendSms ss = (SendSms)ilist.get(0);

        }

        SendSms ss = new SendSms();


        String s = System.currentTimeMillis() + "";
        String veryCode = s.substring(s.length()-6);
        Long a=SysCommonFunc.getSequenceIdForOracle("SEQ_SMS");
        ss.setId(a);
        ss.setMobileNumber(mobile);
        ss.setReportStatus(-1);
        ss.setSysSubmitDate(cdate);
        ss.setVeryCode(veryCode);
        ss.setRegstatus(-1);
        ss.setUserIp(ip);
        ss.setComp(new Long(1));
        ss.setVcation(new Long(0));
        HbmOperator.insert(ss);


         String fs = "��ӭע��51����������վ������ע����֤��Ϊ��"+ss.getVeryCode()+"��������վע��ҳ����֤��";


//        int i = SMSTools.getClient().sendSMSEx(new String[]{mobile},fs,"","GBK",3,ss.getId().longValue());
//
//        if(i !=0)
//            return "������֤���ų���"+i ;
//

         String result=sendMobile(mobile, fs);
         List liste = HbmOperator.list("from SendSms as o where o.id="+a);
         if(liste != null && liste.size() > 0)
         {
             SendSms sSms= (SendSms)liste.get(0);

             if (result.indexOf("#")>0){
            	 sSms.setReportStatus(0);
            	 HbmOperator.update(sSms);
             }

         }
         
         
         System.out.println(result);
         
        }catch(Exception e)
        {
            System.out.println("���Ͷ��ų���"+e.getMessage());
            return "������֤���ų���!";
        }
    	
    
    	


        return null;

    }
    
    public static String getIpAddrByRequest(HttpServletRequest request) {  

    	String ip = request.getHeader("x-forwarded-for");  

    	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  

    		ip = request.getHeader("Proxy-Client-IP");  

    	}  

    	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  

    		ip = request.getHeader("WL-Proxy-Client-IP");  

    	}  

    	if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {  

    		ip = request.getRemoteAddr();  

    	}  

    	return ip;  

    } 




    public static void getSendStatus()
    {
        try{
         List list =  SMSTools.getClient().getReport();

         System.out.println("�õ����泤��"+(list==null ? 0:list.size()));
         for(int i =0;list !=null && i < list.size();i ++)
         {
             StatusReport sr = (StatusReport)list.get(i);
             long id = sr.getSeqID();
             System.out.println("�������к�"+id);
             List liste = HbmOperator.list("from SendSms as o where o.id="+id);
             if(liste != null && liste.size() > 0)
             {
                 SendSms ss = (SendSms)liste.get(0);
                 ss.setReportStatus(sr.getReportStatus());
                 ss.setRerrorCode(sr.getErrorCode());

                 SimpleDateFormat sd = new SimpleDateFormat("yyMMddHHmmss");

                 ss.setSubmitDate(sd.parse(sr.getSubmitDate()));
                 ss.setReceiveDate(sd.parse(sr.getReceiveDate()));
//                 System.out.println(sr.getSubmitDate());
//                 System.out.println(sr.getReceiveDate());
                 HbmOperator.update(ss);
//                 ss.setSubmitDate(sr.getSubmitDate());
//                 ss.setReceiveDate(sr);

             }

         }
        }catch(Exception e)
        {
            System.out.println("�õ�����״̬����"+e.getMessage());
        }
    }


    public static void main(String args[])  throws Exception
    {
       // String s  = SMSTools.sendSms("18963610587");
     // System.out.println(s);
//
//       Userinfo u = new Userinfo();
//        u.setHyid(new Long(1));
//        u.setRegtime(new Date(System.currentTimeMillis()));
//        HbmOperator.insert(u);
      //System.out.println(getIpAddrByRequest(request));
//;
      // SMSTools.getSendStatus();
        Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0-9]))\\d{8}$");
        Matcher m = p.matcher("15150302031");
        System.out.println(m.matches());

    }
    /**
	 * �ύģ����š���POST�ύ��ʽ��
	 * @param username 		�û���
	 * @param scode 		����
	 * @param mobile		�ֻ���
	 * @param content		��������
	 * @param extcode		��չ�롾�����û����ԣ�����չ=Y ��Ч��
	 * @param sendtime		ԤԼ����ʱ�䡾��ԤԼ����д��
	 * @return String 		���ؽ����0=�ɹ���������SDK����ĵ���
	 * @throws HttpException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String sendMobile(String mobile,	String content){
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		//String url="http://222.185.228.25:8000/msm/sdk/http/sendsms.jsp";
		String url="http://www.mssms.cn:8000/msm/sdk/http/sendsms.jsp";
		map.put("username","JSMA302856");
		map.put("scode","56225981");
		map.put("mobile",mobile);
		/*map.put("content",content);*/
		map.put("content", "@1@="+content);
		map.put("tempid", "MB-2013080530");

		
		//String result = send(url,map,"POST","GBK");
		String result;
		try{
			result = sendTemplateSms(mobile,"",content);
		}catch(Exception e){
			return null;
		}
		return result;
	}
	
	/**
	 * �ύģ����š���POST�ύ��ʽ��
	 * @param username 		�û���
	 * @param scode 		����
	 * @param mobile		�ֻ���
	 * @param content		��������
	 * @param extcode		��չ�롾�����û����ԣ�����չ=Y ��Ч��
	 * @param sendtime		ԤԼ����ʱ�䡾��ԤԼ����д��
	 * @return String 		���ؽ����0=�ɹ���������SDK����ĵ���
	 * @throws HttpException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String sendMobileMb(String mobile,	String content,String tempid){
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		//String url="http://222.185.228.25:8000/msm/sdk/http/sendsms.jsp";
		String url="http://www.mssms.cn:8000/msm/sdk/http/sendsms.jsp";
		map.put("username","JSMA302856");
		map.put("scode","56ss25981");
		map.put("mobile",mobile);
		/*map.put("content",content);*/
		if (!content.equals("")){
			map.put("content", content);
		}else {
			map.put("content", "");
		}
		map.put("tempid", tempid);

		//String result = send(url,map,"POST","GBK");
		String result;
		try{
			result = sendTemplateSms(mobile,tempid,content);
		}catch(Exception e){
			return null;
		}
		return result;
	}
	
	 /**
	 * �ύģ����š���POST�ύ��ʽ��
	 * @param username 		�û���
	 * @param scode 		����
	 * @param mobile		�ֻ���
	 * @param content		��������
	 * @param extcode		��չ�롾�����û����ԣ�����չ=Y ��Ч��
	 * @param sendtime		ԤԼ����ʱ�䡾��ԤԼ����д��
	 * @return String 		���ؽ����0=�ɹ���������SDK����ĵ���
	 * @throws HttpException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String sendMobile(String mobile,	String content,String tempid){
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		//String url="http://222.185.228.25:8000/msm/sdk/http/sendsms.jsp";
		String url="http://www.mssms.cn:8000/msm/sdk/http/sendsms.jsp";
		map.put("username","JSMA30222856");
		map.put("scode","56592281");
		map.put("mobile",mobile);
		/*map.put("content",content);*/
		if (!content.equals("")){
			map.put("content", "@1@="+content);
		}else {
			map.put("content", "");
		}
		map.put("tempid", tempid);

		//String result = send(url,map,"POST","GBK");
		String result;
		try{
			result = sendTemplateSms(mobile,tempid,content);
		}catch(Exception e){
			return null;
		}
		return result;
	}
	
	/**
	 * �ύ��ʱ���š���POST�ύ��ʽ��
	 * @param username 		�û���
	 * @param scode 		����
	 * @param mobile		�ֻ���
	 * @param content		��������
	 * @param extcode		��չ�롾�����û����ԣ�����չ=Y ��Ч��
	 * @param sendtime		ԤԼ����ʱ�䡾��ԤԼ����д��
	 * @return String 		���ؽ����0=�ɹ���������SDK����ĵ���
	 * @throws HttpException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String sendMobileJs(String mobile,	String content){
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		//String url="http://222.185.228.25:8000/msm/sdk/http/sendsms.jsp";
		String url="http://www.mssms.cn:8000/msm/sdk/http/sendsms.jsp";
		map.put("username","JSMA30222856");
		map.put("scode","56592281");
		map.put("mobile",mobile);
		map.put("content",content);
		map.put("extcode", "8888");
		
		String result = send(url,map,"POST","GBK");
		
		return result;
	}
	
	/**
	 * �ύ��ʱ���š���POST�ύ��ʽ��
	 * @param username 		�û���
	 * @param scode 		����
	 * @param mobile		�ֻ���
	 * @param content		��������
	 * @param extcode		��չ�롾�����û����ԣ�����չ=Y ��Ч��
	 * @param sendtime		ԤԼ����ʱ�䡾��ԤԼ����д��
	 * @return String 		���ؽ����0=�ɹ���������SDK����ĵ���
	 * @throws HttpException
	 * @throws IOException
	 */
	@SuppressWarnings("unchecked")
	public static String sendMobileJs(String mobile,	String content,String msgid){
		@SuppressWarnings("rawtypes")
		Map map = new HashMap();
		//String url="http://222.185.228.25:8000/msm/sdk/http/sendsms.jsp";
		String url="http://www.mssms.cn:8000/msm/sdk/http/sendsms.jsp";
		map.put("username","JSMA22302856");
		map.put("scode","56592281");
		map.put("mobile",mobile);
		map.put("content",content);
		map.put("extcode", "8888");
		map.put("msgid", msgid);
		
		//String result = send(url,map,"POST","GBK");
		String result;
		try{
			result = sendTemplateSms(mobile,msgid,content);
		}catch(Exception e){
			return null;
		}
		return result;
	}
	
	public static String sendTemplateSms(String mobile,String tempId,String content) throws Exception{
		String HTTP_URL = "http://112.74.76.186:8030";
		String address = HTTP_URL + "/service/httpService/httpInterface.do?method=sendMsg";
		
		if(content==null||!content.startsWith("@1@=")){
			content="@1@="+content;
		}
		StringBuilder params = new StringBuilder();
		params.append("username=").append("JSM4022712");
		params.append("&password=").append("5k22azz624");
		params.append("&veryCode=").append("h7obyggmet21");
		params.append("&mobile=").append(mobile);
		params.append("&content=").append(content);
		params.append("&msgtype=").append("2");
		params.append("&tempid=").append("JSM40712-0003");
		params.append("&code=").append("GBK");
		
		URL url = new URL(address);
		URLConnection connection = url.openConnection();
		connection.setDoOutput(true);
		OutputStreamWriter out = new OutputStreamWriter(connection.getOutputStream(), "GBK");
		out.write(params.toString()); //post�Ĺؼ����ڣ�
		out.flush();
		out.close();
		String temp = "";
		String result = "";
		InputStream is = connection.getInputStream();
		BufferedReader br = new BufferedReader(new InputStreamReader(is));
		
		while (( temp = br.readLine()) != null) {
			result += temp;
		}
		System.out.println(result);
		if(result!=null &&result.indexOf("<status>0</status>")>0){
			return "0#";
		}else{
			return result;
		}
	}
	
	
	private static HttpURLConnection conn = null;	
	
	private static  String send(String urlAddr, @SuppressWarnings("rawtypes") Map map,
			String Mode,String chartSet )  {
		String str = "";
		StringBuffer params = new StringBuffer();
		@SuppressWarnings("rawtypes")
		Iterator it = map.entrySet().iterator();
		while (it.hasNext()) {
			@SuppressWarnings("rawtypes")
			Entry element = (Entry) it.next();
			params.append(element.getKey());
			params.append("=");
			params.append(element.getValue());
			params.append("&");
		}

		if (params.length() > 0) {
			params.deleteCharAt(params.length() - 1);
		}

		try {
			URL url = new URL(urlAddr);
			conn = (HttpURLConnection) url.openConnection();

			conn.setDoOutput(true);
			conn.setRequestMethod(Mode);
			conn.setUseCaches(false);
			conn.setRequestProperty("Content-Type",
					"application/x-www-form-urlencoded");
			conn.setRequestProperty("Content-Length",
					String.valueOf(params.length()));
			conn.setDoInput(true);
			conn.connect();

			OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), chartSet);
			out.write(params.toString());
			out.flush();
			out.close();
			InputStream is = conn.getInputStream();

			byte[] echo = new byte[10 * 1024];
			int len = is.read(echo);

			str = (new String(echo, 0, len)).trim();

			int code = conn.getResponseCode();
			if (code != 200) {
				str = "ERROR" + code;
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			conn.disconnect();
		}

		return str;
	}


}
