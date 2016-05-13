<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
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
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<!-- #include file="marquee.asp" -->
<!-- #include file="sbox.asp" -->

<div class="wrapper1250 cm_block01">
  <div class="block01">
    <div class="box01"> <span class="tx"><img src="images/01.jpg" alt=""/></span>
      <p class="zl"><strong>优雅的猫</strong></p>
      <div class="lm_name">
        <h2>个人操作专区</h2>
      </div>
      <ul>
        <li><a href="2_1.asp">资料修订</a></li>
        <li><a href="2_10.asp">影集/文集修订</a></li>
        <li><a href="2.asp" class="current">手机验证</a></li>
        <li><a href="2_4.asp">设置</a></li>
        <li><a href="2_5.asp">我看过谁</a></li>
        <li><a href="2_6.asp">好友名单/黑名单</a></li>
        <li><a href="2_7.asp">收到的秋波<span style="color:#FF0">(5条)</span></a></li>
        <li><a href="2_8.asp">收到的留言<span style="color:#FF0">(5条)</span></a></li>
        <li><a href="2_9.asp">分享交流奖励</a></li>
      </ul>
    </div>
    <div class="box02">
      <div class="lm_name">
        <h2>手机验证</h2>
      </div>
      <form id="form2" name="form2" method="post" action="">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100" align="right">用户名：</td>
            <td>chenletian</td>
          </tr>
          <tr>
            <td align="right">手机号码：</td>
            <td><label>
                <input type="text" name="textfield" />
                （请填写真实的手机号码）</label></td>
          </tr>
          <tr>
            <td align="right">&nbsp;</td>
            <td><label>
                <input type="submit" name="Submit2" value="免费获取短信验证码" class="BlueBtn" />
              </label></td>
          </tr>
          <tr>
            <td align="right">验证码：</td>
            <td><label>
                <input type="text" name="textfield2" />
                （填写收到的手机验证码）</label></td>
          </tr>
        </table>
        <div class="MyBtn" style="line-height:40px;">
        
         <input type="submit" name="Submit3" value="  手 机 验 证  "  class="btn"/><br/>
         <span style="color:#F60; font-size:14px">温馨提示：若网络不稳定收不到短信验证码，请换个时间再验证！</span>
        </div>
      </form>
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
