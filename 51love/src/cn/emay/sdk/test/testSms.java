package cn.emay.sdk.test;


import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

/**
 * Created by IntelliJ IDEA.
 * User: ThinkPad
 * Date: 2011-3-11
 * Time: 16:53:06
 * To change this template use File | Settings | File Templates.
 */
public class testSms {
    public static void main(String args[])  throws Exception
    {
        ///key 761111
        //024810
 //     Client client2=new Client("6SDK-EMY-6688-JCTON","761111");

//      List list =  client2.getReport();
//        for(int i =0;list != null && i < list.size();i ++)
//        {
//            System.out.println(i);
//        }

//     int i = client2.registEx("039518");
//System.out.println("ע����"+i);
//
//
//
//       int i= client2.sendSMS(new String[] {"13851839587"}, "test123","001",3);//����չ��
//	   System.out.println("testSendSMS====="+i);

         BASE64Encoder be = new BASE64Encoder();
        BASE64Decoder de = new BASE64Decoder();

        String s ="mahe00#####mahe00";
        String ss = be.encode(s.getBytes());
        System.out.println(ss);

         String     uname = new String(de.decodeBuffer(ss));

             System.out.println("uname="+uname);

    }
}

