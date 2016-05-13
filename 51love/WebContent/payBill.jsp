<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Date" %>

<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  if(loginUser == null)
  {
    response.sendRedirect("login.jsp");
    return;
  }

  String product = SysCommonFunc.getStrParameter(request,"product");
  int index = product.indexOf("@");
  product = product.substring(0,index);
  Product p = ProductMng.getProduct(product);
  
  //add by gaojianghong 20120816 for 判断VIP会员升级白金VIP会员时，VIP会员时间要小于拟升级白金VIP会员时间。白金VIP没有到期不能升级VIP会员 start
  Date sdate = new Date(System.currentTimeMillis());
  if (loginUser.getFlag()==25 && loginUser.getZzsj().after(sdate)){
  	if (p!=null && p.getFlag()==30){
  		//判断升级白金VIP会员的是年还是月 1:年 0：月 2:周
  		if (p.getDatetype()==1){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue()*12);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('请选择大于您VIP剩余期限的白金VIP会员项目');history.go(-1);}</script>");
  				return;
  			}
  		}else if (p.getDatetype()==0){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue());
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('请选择大于您VIP剩余期限的白金VIP会员项目');history.go(-1);}</script>");
  				return;
  			}
  		}else{
  			sdate.setDate(sdate.getDate()+p.getServiceyear().intValue()*7);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('请选择大于您VIP剩余期限的白金VIP会员项目');history.go(-1);}</script>");
  				return;
  			}
  		}
  	}
  }
  else if (loginUser.getFlag()==30 && loginUser.getZzsj().after(sdate)){
  	if (p!=null && p.getFlag()==25){
  		out.println("<script language='javascript'>{window.alert('您的白金VIP会员暂未到期限，不能降级为VIP会员，请选择白金VIP会员项目');history.go(-1);}</script>");
  		return;
  	}
  }
  //add by gaojianghong 20120816 for 判断VIP会员升级白金VIP会员时，VIP会员时间要小于拟升级白金VIP会员时间 白金VIP没有到期不能升级VIP会员 end
  
  //判断办理的全部地区白金项目期限大于地区VIP剩余时间
  //modified by gaojianhong 20130113 for 暂时将地区折扣取消  start
  //String area  = SysCommonFunc.getStrParameter(request,"area");
  String area  = "全部";
  //modified by gaojianhong 20130113 for 暂时将地区折扣取消  end
  if (loginUser.getArea()!=null && !loginUser.getArea().equals("全部") && area.equals("全部") && loginUser.getFlag()==30 && loginUser.getZzsj()!=null && loginUser.getZzsj().after(sdate)){
  	if (p!=null){
  		//判断升级全国地区的是年还是月 1:年 0：月
  		if (p.getDatetype()==1){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue()*12);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('升级的全部地区白金VIP期限要大于您剩余的地区白金VIP期限！');history.go(-1);}</script>");
  				return;
  			}
  		}else if (p.getDatetype()==0){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue());
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('升级的全部地区白金VIP期限要大于您剩余的地区白金VIP期限！');history.go(-1);}</script>");
  				return;
  			}
  		}else{
  			sdate.setDate(sdate.getDate()+p.getServiceyear().intValue()*7);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('升级的全部地区白金VIP期限要大于您剩余的地区白金VIP期限！');history.go(-1);}</script>");
  				return;
  			}
  		}
  	}
  }
  //判断以前是全部地区现改完特定地区的会员并且未到期的
  sdate.setDate(sdate.getDate()+10);
  if (loginUser.getArea()!=null && loginUser.getArea().equals("全部") && !area.equals("全部") && loginUser.getFlag()==30 && loginUser.getZzsj()!=null && loginUser.getZzsj().after(sdate)){
  	out.println("<script language='javascript'>{window.alert('您的白金VIP（全部地区）暂未到期限，不能降级为某个特定地区，请选择全部地区或快到期限（10天内）再进行降级为某个特定地区！');history.go(-1);}</script>");
  	return;
  }
  
  String MerId = CartMng.MerId;

  String zsname  = SysCommonFunc.getStrParameter(request,"zsname");
  String tel     = SysCommonFunc.getStrParameter(request,"tel");
  String email   = SysCommonFunc.getStrParameter(request,"email");
  String address = SysCommonFunc.getStrParameter(request,"address");
  String simplename =   SysCommonFunc.getStrParameter(request,"simplename");
  String OrdId = CartMng.getOrderId();
  //String TransAmt = CartMng.getTransAmt(p);
  double transamt=0;
  if (area.equals("全部")){
  	transamt=new Double(p.getTransamt());
  }else{
  	transamt=p.getTransamt()*SysDefine.ybdqzk;
  	for(int i=0;i<SysDefine.tsdqArray.length;i++){
   		if (SysDefine.tsdqArray[i].equals(area)){
   			transamt=p.getTransamt()*SysDefine.tsdqzk;
   		}
   	}
  }
  DecimalFormat f=new DecimalFormat("0.00");
  String TransAmt =CartMng.getTransAmt(f.format(transamt));
  Date cdate = new Date(System.currentTimeMillis());
  String TransDate = DateTools.DateToString(cdate,DateTools.FORMART_yyyyMMdd);
  String ChkValue  = CartMng.getCheckValue(MerId,OrdId,TransAmt,CartMng.CuryId,TransDate,CartMng.TransType);

  Cart cart = new Cart();
  cart.setAddress(address);
  cart.setDatetype(p.getDatetype());
  cart.setEmail(email);
  cart.setFlag(p.getFlag());
  cart.setLcname(loginUser.getLcname());
  cart.setName(p.getName());
  cart.setOrdid(OrdId);
  cart.setServiceyear(p.getServiceyear());
  cart.setSimplename(simplename);
  cart.setSjtime(cdate);
  cart.setSqdj(p.getSqdj());
  cart.setTel(tel);
  cart.setTrans(new Integer(0));
  cart.setTransamt(transamt);
  cart.setUpgrade(new Integer(0));
  cart.setUsername(loginUser.getUsername());
  cart.setZsname(zsname);
  cart.setArea(area);
  CartMng.addCart(cart);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<!-- #include file="marquee.asp" -->
<!-- #include file="sbox.asp" -->
<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51交友中心网上支付系统</h2>
    </div>
    <form action="https://payment.chinapay.com/pay/TransGet " name="form1" method="post">
       <div class="TabBox">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;重要商户&nbsp;&nbsp;<span style="color:#F60">★★★★★</span>
               
               <span style="float:right; line-height:50px; font-size:16px">网上支付步骤：1、订单填写&nbsp;>&nbsp;2、生成订单&nbsp;>&nbsp;3、支付升级</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>生成订单</strong></div>
           <table width="800px" border="0" cellspacing="0" cellpadding="0" class="Tabs" style=" margin:auto;margin-top:20px;">
          <tr>
            <td width="130" align="right"><strong>您生成的订单号：</strong></td>
            <td><%=OrdId%></td>
            <td width="90" align="right"><strong>申请时间：</strong></td>
            <td><%=DateTools.dateToString(cdate,false)%></td>
          </tr>
          <tr>
            <td align="right"><strong>升级用户名：</strong></td>
            <td colspan="3"><%=loginUser.getUsername()%></td>
          </tr>
          <tr>
            <td align="right"><strong>升级种类：</strong></td>
            <td colspan="3"><%=p.getName()%>(<%=transamt%>元)</td>
          </tr>
          <tr>
            <td align="right"><strong>付款人姓名：</strong></td>
            <td><%=zsname%></td>
            <td align="right"><strong>联系电话：</strong></td>
            <td><%=tel%></td>
          </tr>
          <tr>
            <td align="right"><strong>电子邮件：</strong></td>
            <td colspan="3"><%=email%></td>
          </tr>
          <tr>
            <td align="right"><strong>住址：</strong></td>
            <td colspan="3"><%=address%></td>
          </tr>
        </table>
        <div style="height:30px; line-height:30px; text-align:center; font-size:14px">
        	<strong>特别说明：</strong>升级款项由上海银联电子支付服务有限公司代为收取，支付后在线同步升级为白金VIP会员。
        </div>
        <table>
         <tr>
                <td>
          <input type="hidden" name="MerId" value="<%=MerId%>">
          <input name="OrdId" type="hidden" value="<%=OrdId%>">
          <input type="hidden" name="TransAmt" value="<%=TransAmt%>">
          <input type="hidden" name="CuryId" value="<%=CartMng.CuryId%>">
          <input type="hidden" name="TransDate" value="<%=TransDate%>">
          <input type="hidden" name="TransType" value="<%=CartMng.TransType%>">
          <input type="hidden" name="Version" value="<%=CartMng.Version%>">
          <input type="hidden" name="BgRetUrl" value="<%=CartMng.BgRetUrl%>">
          <input type="hidden" name="PageRetUrl" value="<%=CartMng.PageRetUrl%>">
          <input type="hidden" name="ChkValue" value="<%=ChkValue%>">

                </td>
              </tr>
        </table>
        <div class="MyBtn">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="  重  填  " onclick="javascript:window.location.href='paymemory.jsp'" class="btn" />&nbsp;&nbsp;
            <input type="submit"  name="Submit2" value="  确  定  " class="btn" />
        </div>
       </div>
        </form>

  </div>
  <div class="block02t">
        <div class="lm_name">
          <h2>扫描二维码</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
      <div style="clear:both"></div>
    </div>
  
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
