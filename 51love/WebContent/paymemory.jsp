<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>

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
function Settransamt()
{
	var pro=document.form1.product.value;
	var transamt=pro.substring(pro.indexOf("@")+1);
	document.form1.transamt.value=transamt;
}
function ChkInput(){
if (document.form1.username.value=="" )
{
alert('请输入升级用户名');
document.form1.username.focus();
return false;
}
if (document.form1.product.value=="")
{
alert('请选择服务项目');
document.form1.product.focus();
return false;
}

var sname =document.form1.simplename.value;

if (sname != "" && sname != "(没有可不填)" && (!isNumber(sname) || parseInt(sname) > 9999))
{
alert("输入的销售顾问编号不正确");
document.form1.simplename.focus();
return false;
}

if(sname =="(没有可不填)" )
{
    document.form1.simplename.value="";
}
return true;

}

function isNumber(str) {
	for(var i=0;i<str.length;i++)
	if(str.charCodeAt(i)<0x0030 || str.charCodeAt(i)>0x0039) return false;
	return true;
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
    String bjd1 = SysCommonFunc.getStrParameter(request,"bjd1");
    if(loginUser == null)
    {
        response.sendRedirect("login.jsp");
        return;
    }
    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(),vurl);
    }
    List plist = ProductMng.getProductList();
%>

<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51交友中心网上支付系统</h2>
    </div>
    <form action="payBill.jsp" name="form1" method="post" onSubmit="return ChkInput()">
       <div class="TabBox">
       
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;重要商户&nbsp;&nbsp;<span style="color:#F60">★★★★★</span>
               
               <span style="float:right; line-height:50px; font-size:16px">网上支付步骤：1、订单填写&nbsp;>&nbsp;2、生成订单&nbsp;>&nbsp;3、支付升级</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>订单填写</strong></div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab" style="margin-top:20px;">
          <tr>
            <td width="270" align="right"><strong>升级用户名：</strong></td>
            <td>
              <input name="username" type="text" id="username"  value="<%=loginUser.getUsername()%>"/>
            </td>
          </tr>
          <tr>
            <td align="right"><strong>升级种类：</strong></td>
            <td>
               <select name="product" onchange="Settransamt()" style="height:25px;" >
                   <option value="">请选择服务项目</option>
                    <%
           				String amount = "";
					       for(int i=0;i< plist.size();i ++)
					       {
					          Product temp = (Product)plist.get(i);
					
					          if(temp.getServiceyear().toString().equals(bjd1))
					          {
					              amount = temp.getTransamt().toString();
					          }
					          if (temp.getId()!=201){
			       %>
                   <option value="<%=temp.getId()+"@"+temp.getTransamt()%>" <%=temp.getServiceyear().toString().equals(bjd1) ? "selected":""%>><%=temp.getName()+"--"+temp.getTransamt()+"元"%></option>
                   <%
       				}}
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
            <td align="right"><strong>电子邮件：</strong></td>
            <td>
                <input type="text" name="email" value="" style="width:455px;" />
            </td>
          </tr>
          <tr>
            <td align="right"><strong>住址：</strong></td>
            <td>
                <input type="text" name="address" value="" style="width:455px;" />
            </td>
          </tr>
          <tr>
            <td align="right"><strong>特别说明：</strong></td>
            <td >
            升级款项由上海银联电子支付服务有限公司代为收取，支付后在线同步升级为白金VIP会员。
            </td>
          </tr>
        </table>
        <div class="MyBtn">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit2" type="submit" value="下一步 " class="btn" />
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
