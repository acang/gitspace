<%
/* *
 功能：支付宝页面跳转同步通知页面
 版本：3.2
 日期：2011-03-17
 说明：
 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 //***********页面功能说明***********
 该页面可在本机电脑测试
 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 TRADE_FINISHED(表示交易已经成功结束，并不能再对该交易做后续操作);
 TRADE_SUCCESS(表示交易已经成功结束，可以对该交易做后续操作，如：分润、退款等);
 //********************************
 * */
%>
<%@ page language="java" contentType="text/html; charset=gbk" pageEncoding="gbk"%>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Map"%>
<%@ page import="com.alipay.util.*"%>
<%@ page import="com.alipay.config.*"%>
<%@ page import="com.lover.mng.CartMng" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.common.*"%>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<html>
  <head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>支付宝页面跳转同步通知页面</title>
  </head>
  <body>
<%
	//获取支付宝GET过来反馈信息
	Map<String,String> params = new HashMap<String,String>();
	Map requestParams = request.getParameterMap();
	for (Iterator iter = requestParams.keySet().iterator(); iter.hasNext();) {
		String name = (String) iter.next();
		String[] values = (String[]) requestParams.get(name);
		String valueStr = "";
		for (int i = 0; i < values.length; i++) {
			valueStr = (i == values.length - 1) ? valueStr + values[i]
					: valueStr + values[i] + ",";
		}
		//乱码解决，这段代码在出现乱码时使用。如果mysign和sign不相等也可以使用这段代码转化
		valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
		params.put(name, valueStr);
	}
	
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以下仅供参考)//
	//商户订单号

	String MerId = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"GBK");
	//支付宝交易号

	String OrdId = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"GBK");
    System.out.println(OrdId);
	//交易状态
	String OrderStatus = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"GBK");
    System.out.println("OrderStatus =???? " + OrderStatus);
    if("TRADE_SUCCESS".equals(OrderStatus)){
       OrderStatus = "1001";
    }
	//获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表(以上仅供参考)//

    int ret = CartMng.alipayOk(MerId,OrdId,"0.01","0","0","0",OrderStatus,"9");
    String s = CartMng.cartOkResponse(ret);
    out.println(s);

    Cart cart = CartMng.getCartByOrderId(OrdId);
    if(ret==5||ret==7 || (ret==0&& cart!=null &&cart.getFlag()!=null && cart.getFlag()==5)){
       
//      Userinfo user = HYRegMng.getUserinfoByUsername(cart.getUsername());
      if(cart != null){
    	///找到升级用户
            Userinfo tempUser = HYRegMng.getUserinfoByUsername(cart.getUsername());
    	if(tempUser!=null){
    		if(tempUser.getImportant()==null||tempUser.getImportant()!=91){
    			Userother uother = HYRegMng.getUserOtherByHyid(""+tempUser.getHyid());
  			  //must have photo
  		    if(uother.getUserphoto1()!=null&& uother.getUserphoto1().trim().length()>0){
	    		String type = "9";
	            String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
	            HbmOperator.executeSql(sql2);
	            String sql = "update userinfo set important = " + type+"1  where  hyid = " +tempUser.getHyid();
	            HbmOperator.executeSql(sql);
    		}
    		}
    	}
      }
		// /把用户VIP信息放入到登陆信息中
       Userinfo grwhqUser = (Userinfo)request.getSession().getAttribute(SysDefine.SESSION_LOGINNAME);
       grwhqUser.setFlag(SysDefine.SYSTEM_HY_TYPE_vip);
       request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,
    		   grwhqUser);
       response.sendRedirect("http://www.51lover.org/grzq.jsp");

    }

	//计算得出通知验证结果
	boolean verify_result = AlipayNotify.verify(params);
	
//	if(verify_result){//验证成功
//		//////////////////////////////////////////////////////////////////////////////////////////
//		//请在这里加上商户的业务逻辑程序代码
//
//		//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
//		if(trade_status.equals("TRADE_FINISHED") || trade_status.equals("TRADE_SUCCESS")){
//			//判断该笔订单是否在商户网站中已经做过处理
//				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
//				//如果有做过处理，不执行商户的业务程序
//            int ret = CartMng.alipayOk(request);
//            String s = CartMng.cartOkResponse(ret);
//		}
//
//		//该页面可做页面美工编辑
//		out.println("验证成功<br />");
//		//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
//
//		//////////////////////////////////////////////////////////////////////////////////////////
//	}else{
//		//该页面可做页面美工编辑
//		out.println("验证失败");
//	}
%>
  </body>
</html>
