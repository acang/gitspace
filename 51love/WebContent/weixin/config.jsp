<%@ page language="java" contentType="text/html; charset=GBK" pageEncoding="GBK"%>
<%

    //调试模式
    boolean DEBUG_ = true;
    String PARTNER		= "" ;	//财付通商户号
    String PARTNER_KEY	= "";	//财付通密钥
    String APP_ID		= "wxfb0c41fd39d33468";	//appid
    String APP_SECRET	= "";	//appsecret
    String APP_KEY		= "";	//paysignkey 128位字符串(非appkey)
    String NOTIFY_URL	= "http://www.51lover.org/weixin/nativecall.jsp";  //支付完成后的回调处理页面,*替换成notify_url.asp所在路径
    String LOGING_DIR	= "";  //日志保存路径
%>
