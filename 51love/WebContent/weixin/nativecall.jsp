<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="com.wxap.util.TenpayUtil"%>
<%@ page import="com.wxap.util.MD5Util"%>
<%@ page import="com.wxap.RequestHandler"%>
<%@ page import="com.wxap.ResponseHandler"%>
<%@ page import="com.wxap.client.TenpayHttpClient"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.SortedMap"%>
<%@page import="com.wxap.util.Sha1Util"%>
<%@ include file="config.jsp"%>

<%

response.resetBuffer();
response.setHeader("ContentType","text/xml");
out.println("<?xml version=\"1.0\" encoding=\"GBK\"?>");
out.println("<root>");
int retcode;
String xml_body="";
 //��ʼ��
    RequestHandler reqHandler = new RequestHandler(null, null);
	reqHandler.init(APP_ID, APP_SECRET, PARTNER_KEY, APP_KEY);
	
	//��ǰʱ�� 
	String currTime = TenpayUtil.getCurrTime();
	//8λ����
	String strTime = currTime.substring(8, currTime.length());
	//��λ�����
	String strRandom = TenpayUtil.buildRandom(4) + "";
	//10λ���к�,�������е���
	String strReq = strTime + strRandom;
	//������
	String out_trade_no = strReq;
	
	//����package��������
	SortedMap<String, String> packageParams = new TreeMap<String, String>();
			packageParams.put("bank_type", "WX");  //֧������   
			packageParams.put("body", "��Ʒ���"); //��Ʒ����   
			packageParams.put("fee_type","1"); 	  //���б���
			packageParams.put("input_charset", "GBK"); //�ַ�    
			packageParams.put("notify_url", NOTIFY_URL); //֪ͨ��ַ  
			packageParams.put("out_trade_no", out_trade_no); //�̻�������  
			packageParams.put("partner", PARTNER); //�����̻���
			packageParams.put("total_fee", "1"); //��Ʒ�ܽ��,�Է�Ϊ��λ
			packageParams.put("spbill_create_ip",  request.getRemoteAddr()); //������ɵĻ���IP��ָ�û��������IP
		
		//��ȡpackage��
		String packageValue = reqHandler.genPackage(packageParams);
		String noncestr = Sha1Util.getNonceStr();
		String timestamp = Sha1Util.getTimeStamp();
		
		//����֧������
		SortedMap<String, String> signParams = new TreeMap<String, String>();
		
			signParams.put("AppId", APP_ID);
			signParams.put("NonceStr", noncestr);
			signParams.put("Package", packageValue);
			signParams.put("TimeStamp", timestamp);
			signParams.put("RetCode", "0");
			signParams.put("RetErrMsg",	"OK");
			
			xml_body = reqHandler.parseXML();
		
		String sign = Sha1Util.createSHA1Sign(signParams);
       		signParams.put("app_signature",sign);
			signParams.put("sign_method","SHA1");
			
			response.setHeader("ContentType", "text/xml");
			out.clear();
			out.println(signParams);
			out.println(reqHandler.parseXML());
%>

