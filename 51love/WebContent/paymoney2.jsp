<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心--中国顶级情感类交友网站。会员遍布北京交友,广东交友,上海交友,江苏交友等全国各大省市。51交友中心稳健专业、快捷超值,已积累1000多万情感交友会员。" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css" rel="stylesheet" type="text/css" />

<script language="JavaScript">
    //选择产品，生成价格
function Settransamt()
{
    var proobj= document.payform.product;
	var pro = proobj.options[proobj.options.selectedIndex].text;
	var transamt=pro.substring(pro.indexOf("-")+2);
	document.payform.transamt.value=transamt;
}


</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('您是游客，请先登录或注册！');showLogin('hyzf.htm','paymemory.jsp');</script>");
        return;
    }
    List plist = ProductMng.getProductList();
    String bjd1 = SysCommonFunc.getStrParameter(request, "bjd1");



%>

<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51交友中心网上支付系统</h2>
    </div>
    <form action="pay_do.jsp" id="payform" name="payform" method="post" target="_blank">
       <div class="TabBox">
       
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;重要商户&nbsp;&nbsp;<span style="color:#F60">★★★★★</span>
               
               <span style="float:right; line-height:50px; font-size:16px">网上支付步骤：1、订单填写&nbsp;>&nbsp;2、确认支付&nbsp;>&nbsp;3、完成购买</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>订单填写</strong></div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab" style="margin-top:20px;">
          <tr>
            <td width="270" align="right"><strong>升级用户名：</strong></td>
            <td>
              <input name="username" type="text" id="username" readonly="readonly"  value="<%=loginUser.getUsername()%>"/>
            </td>
          </tr>
          <tr>
            <td align="right"><strong>升级种类：</strong></td>
            <td>
               <select name="product" onchange="Settransamt()" style="height:25px;" >
                   <option value="">请选择服务项目</option>
                   <%
                       String amount = "";
                       for (int i = 0; i < plist.size(); i++) {
                           Product temp = (Product) plist.get(i);
                           if (temp.getId() != 201) {
                   %>
                   <option value="<%=temp.getId()%>"><%=temp.getName() + "--" + temp.getTransamt() + "元"%>
                   </option>
                   <%
                           }
                       }
                   %>
              </select>
              <input name="transamt" size="5" readonly value="<%=amount%>"/>元
            </td>
          </tr>
          <tr>
            <td align="right"><strong>付款人姓名：</strong></td>
            <td>
                <input type="text" name="zsname" value="" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>联系电话：</strong>
                <input type="text" value="" name="tel" />
            </td>
          </tr>
               <tr>
                   <td align="right"><strong>支付方式：</strong></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="1" style="vertical-align:middle;">网银支付（直接升级）
                   </td>
               </tr>
               <tr>
                   <td  valign="middle" align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="2" style="vertical-align:middle;"><img src="images/wechart.jpg" style="vertical-align:middle;">（直接升级）
                   </td>
               </tr>
               <tr class='tr_even'>
                   <td align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="3" style="vertical-align:middle;"><img src="images/alipay.jpg" style="vertical-align:middle;">（直接升级）

                   </td>
               </tr>
               <tr>
                   <td align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="4" style="vertical-align:middle;">银行汇款（留言升级）
                   </td>
               </tr>
        </table>
        <div class="MyBtn">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >

                <tr>
                    <td width="50%" height="100px">&nbsp;</td>
                    <td  width="50%" align="center" bgcolor="#FFFFFF" class="tit08"><img src="images/buynow.png" onClick="goPay()"></td>
                </tr>

            </table>
        </div>
    </div>
        <input type="hidden" id="paymodetype" name="paymodetype" value="">
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

<script language="javascript">
    function goPay(){
        if (document.payform.product.value=="")
        {
            alert('请选择服务项目');
            document.payform.product.focus();
            return false;
        }
        var paymodes = document.getElementsByName("paymode");
        var mode="0";
        if(paymodes[0].checked ==true ){
            mode="1";

        }
        if(paymodes[1].checked ==true ){
            mode="2";
        }
        if(paymodes[2].checked ==true ){
            mode="3";
        }
        if(paymodes[3].checked ==true ){
            mode="4";
        }
        if(mode == "0"){
          alert("请选择一种支付方式!");
            return;
        }
        document.getElementById("paymodetype").value = mode;
        document.getElementById("payform").submit();
    }
</script>
</html>
