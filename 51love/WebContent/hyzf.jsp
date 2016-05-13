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
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);

    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录　　');showLogin('index.jsp','hyzf.jsp');</script>");
        return;
    }
%>
<div class="wrapper1250 cm_block01">
   <iframe id="visitFrame" name="visitFrame" width="0" height="0" frameborder="0" src="visitForGRZQ_type.jsp?url=http://www.51lover.org/hyzf.htm" ></iframe>
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
        <td><span style="line-height:23px;">★普通搜索，查看会员基本资料，无权查看会员详细联系办法</span><br />
         <span style="line-height:23px;"> ★长期展示自己资料、已验证会员和未验证会员分别排列</span><br/>
          <span style="line-height:23px;">&nbsp;&nbsp;使用资料开放设置、好友名单/黑名单、查看留言</span><br/>
          <span style="line-height:23px;">&nbsp;&nbsp;收到的秋波、我看过谁、论坛发帖等10项权限</span></td>
        <td align="center">长期</td>
        <td width="250" align="center">免费</td>
      </tr>

       <tr>
        <td align="center"><strong>VIP会员</strong></td>
        <td><span style="line-height:23px;">★普通会员的全部权限、首页推荐（附照）<br/>
★专享高级搜索，十六个条件精准查找全部会员<br/>
★查看全部未验证会员的详细联系办法<br/>
给全部未验证会员发送留言、可在留言区公开自己的联系办法</span>
  </td>
        <td align="center"><span style="line-height:23px;">一年期<br />三年期</span></td>
        <td align="left">
        <span style=" text-decoration:line-through;line-height:23px;">原价：580元</span><span style="line-height:23px;">&nbsp;&nbsp;&nbsp;
        惊爆价：298元</span><br />
        <span style=" text-decoration:line-through;line-height:23px;">原价：1280元</span><span style="line-height:23px;">&nbsp;&nbsp;
        惊爆价：598元</span></td>
      </tr>
      <tr>
        <td align="center"><strong>白金VIP会员</strong></td>
        <td><span style="line-height:23px;">★VIP会员的全部权限<br/>
              ★增加查看内部验证会员库所有会员的详细联系办法<br/>
          &nbsp;&nbsp;给全部会员发送留言、可在留言区公开自己的联系办法</span></td>
        <td align="center"><span style="line-height:23px;">一年期<br />三年期</span></td>
        <td align="left">
        <span style=" text-decoration:line-through;line-height:23px;">原价：980元</span><span style="line-height:23px;">&nbsp;&nbsp;
        惊爆价：498元<br /></span>
       
        <span style=" text-decoration:line-through;line-height:23px;">原价：1980元</span><span style="line-height:23px;">&nbsp;&nbsp;
        惊爆价：998元</span></td>
      </tr>
      
      <tr>
        <td align="center"><strong>情商训练</strong></td>
          <td align="left"> ★4天体验式情商提升研习会</td>
          <td align="center">    32个小时  </td>
        <td  align="left">
            <span style="text-decoration:line-through;">原价：16800元</span><span style="line-height:23px;">&nbsp;&nbsp;惊爆价：6800元</span>
             </td>
      </tr>
   <tr>
        <td align="center"><strong>免费升级</strong></td>
  <td align="center" colspan="3"> 
  <span style="line-height:23px;">通过微信分享和论坛发帖回帖获得VIP会员、白金VIP会员权限（请查看会员交流使用须知）
</span>  </td>
      </tr>
      <tr>
      <td align="center" colspan="4"> 
       <a href="paymoney.jsp"><img src="images/buy.png"></a>
      </td>
      </tr>
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
