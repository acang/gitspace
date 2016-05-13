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
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>会员等级及资费</h2>
    </div>
        
    <table width="100%" border="0" cellspacing="0" cellpadding="0" class="hydjjzf">
	<thead>
      <tr>
        <th width="110">会员等级</th>
        <th>权限</th>
        <th width="80">期限</th>
        <th>价格</th>
      </tr>
	  </thead>
      <tr>
        <td align="center"><strong>普通会员</strong></td>
        <td>★普通搜索，查看会员基本资料，无权查看会员详细联系办法<br />
          ★长期展示自己资料、已验证会员和未验证会员分别排列<br/>
          &nbsp;&nbsp;使用资料开放设置、好友名单/黑名单、免费回复留言<br/>
          &nbsp;&nbsp;收到的秋波、我看过谁、论坛发帖等10项权限</td>
        <td align="center">长期</td>
        <td width="200" align="center">免费</td>
      </tr>
      <tr>
        <td align="center"><strong>白金VIP会员</strong></td>
        <td>★普通会员的全部权限、首页推荐（附照）<br/>
            ★专享高级搜索，十六个条件精准查找全部会员<br/>
          ★查看全部已验证会员和未验证会员的详细联系办法<br />
          &nbsp;&nbsp;给全部会员发送留言、可在留言区公开自己的联系办法</td>
        <td align="center">三年期<br />二年期<br />一年期</td>
        <td align="center">
        <span style=" text-decoration:line-through;">原价：1580元</span>&nbsp;
        优惠价：1280元<br />
        <span style=" text-decoration:line-through;">原价：1280元</span>&nbsp;
        优惠价：980元<br />
        <span style=" text-decoration:line-through;">原价：880元</span>&nbsp;&nbsp;
        优惠价：580元</td>
      </tr>
      <tr>
        <td align="center"><strong>支付方式</strong></td>
        <td colspan="3">
        
<div style="text-align:center; padding-top:20px;">
<a href="paymemory.jsp" target="_blank" class="zfbzf_btn">网上支付</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a href="payLast.jsp" target="_blank" class="zfbzf_btn">银行支付</a>
</div>

<br />
<strong>说明：</strong>网上支付：使用网上支付银行卡办理,通过中国银联电子支付平台同步开通。<br />&nbsp;&nbsp;&nbsp;&nbsp;<strong>&nbsp;&nbsp;</strong>银行及支付宝支付：当地中国农业银行或支付宝办理，1个工作日内开通。</td>
      </tr>

        <%--<tr>--%>
            <%--<td align="center" bgcolor="#FFFFFF" class="style02"><strong>免费升级</strong></td>--%>
            <%--<td colspan="6" align="left" bgcolor="#FFFFFF" style="padding-left:10px;">--%>
                <%--1) 推荐会员注册，可免费获得白金豆，用于查看会员详细联系办法，具体政策请登陆后详见个人专区<a href="grzqbjd.jsp" target="_blank">会员推荐</a>栏目。<br />--%>
                <%--2) 论坛发贴回帖获得的金币可兑换相应的白金VIP会员权限，金币获得及奖励办法请查看会员交流栏目中的<a href="http://www.51lover.org/bbs/disp_bbs-bbsid-33080.htm" target="_blank">51交友中心论坛使用规则</a>。</td>--%>
        <%--</tr>--%>
        <tr>
            <td colspan="7" align="center" bgcolor="#FFFFFF" class="tit08">*注:VIP会员期满将自动降为普通会员。</td>
        </tr>
      <%--<tr>--%>
        <%--<td align="center"><strong>情商训练</strong></td>--%>
        <%--<td colspan="3"> 4天团体体验式研习会   32个小时    原价：16800元 优惠价6800元</td>--%>
      <%--</tr>--%>
      <%--<tr>--%>
        <%--<td colspan="4" align="center"><input type="button" class="zfbzf_btn" value="我要购买"></td>--%>
      <%--</tr>--%>
    </table>
  </div>
  <div class="block02t">
        <div class="lm_name">
          <h2>普通会员搜索</h2>
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
