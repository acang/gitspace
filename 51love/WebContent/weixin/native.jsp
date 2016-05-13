<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%@ page import="com.wxap.RequestHandler"%>
<%@page import="java.util.TreeMap"%>
<%@page import="java.util.SortedMap"%>
<%@page import="com.wxap.util.Sha1Util"%>

<%@ include file="config.jsp"%>
<%

//============================
//weixin://wxpay/bizpayurl?sign=XXXXX&appid=XXXXXX&productid=XXXXXX&timestamp=XXXXXX&noncestr=XXXXXX
//=============================
    String productid = "1234567890";
    RequestHandler queryReq = new RequestHandler(null, null);
    queryReq.init();
    queryReq.init(APP_ID, APP_SECRET, PARTNER_KEY, APP_KEY);
    
		String noncestr = Sha1Util.getNonceStr();
		String timestamp = Sha1Util.getTimeStamp();
    
    SortedMap<String, String> signParams = new TreeMap<String, String>();
		signParams.put("appid", APP_ID);
		signParams.put("nonceStr", noncestr);
		signParams.put("productid", productid);
		signParams.put("timestamp", timestamp);
		
		String sign = Sha1Util.createSHA1Sign(signParams);
		signParams.put("sign", sign);
		String parm = "weixin://wxpay/bizpayurl?" + queryReq.toString();
		
 %> 		
<html>
<body>	
<center>
    <a href="<%=parm%>">���֧��(΢�������)</a><br>
    <center>ɨ��֧��</center>	<br>
    <img src="../ddd.jpg" alt="QR code"/></center>
		
</center>
</body>
 </html>
