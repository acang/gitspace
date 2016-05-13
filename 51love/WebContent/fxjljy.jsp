<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.mng.GRZQMng" %>
<%@ page import="com.lover.mng.OpLogMng" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.obj.Userarticle" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.bean.QueryResult" %>
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
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);

%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
      <div class="box01"> <span class="tx"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" alt=""/></span>
          <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
          <div class="lm_name">
              <h2>个人操作专区</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>分享交流奖励</h2>
      </div>
      <div style="clear:both"></div>
      <div class="tab"><span class="current">奖励政策</span><!--<span>互联网分享金币申请</span>暂时取消--><span>总金币查询</span></div>
      <div class="mingdan show">
      <div style="line-height:30px; font-size:14px; padding:10px 0;">
      <p>您想寻找到激情的异性伙伴？寻找一生的伴侣 ？您想结识心目中的意中人吗？51交友中心网站一定能帮助您！</p>
      <p> 51交友中心网站经过10年的积累,现已发展成为拥有逾700万名会员、日均新增注册会员5000名、日均点击流量20万人次的中国AAA级大型专业交友网站。在这里您可以按照16个搜索条件查找到感兴趣的两性伴侣。您的交友目的既可以是短期的E夜情， 也可以是长期的婚姻关系,既可以是有实力的男人，也可以是多情温柔的女性...... 在这里，您的任何梦想都可以真实实现！</p>
      <p> 您是否经常在QQ或者聊天室里聊天？但那里根本看不到您网友的详细资料，也不了解对方真正的目的，地域的限制也使您力不从心。您还在那守株待兔吗？ 
        您是否也去过婚介所，您可能也为那儿的机会少、效率低、婚托等问题而苦恼过吧</p>
      <p> 有了51交友中心网站，现在一切都简单了！指间轻动，一个个侯选人便会展现眼前。无论您的年龄多大，在51交友中心网站里都能够找到您最爱的另一半。</p>
      <p> 加入51交友中心网站，包您找到满意的异性伴侣，从此再也不寂寞了！！ </p>
</div>
      </div>
      <div class="mingdan">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style="width:100px;background-color:#f7f7f7" align="center"><strong>序号</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>等级</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>论坛主题帖</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>论坛回帖</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>删除回帖</strong></td>
          <td align="center" style=" background-color:#f7f7f7"><strong>金币数</strong></td>
        </tr>
        <tr>
          <td align="center">1258</td>
          <td align="center">★★★★★</td>
          <td align="center"><a href="2_11.asp">20</a></td>
          <td align="center"><a href="2_12.asp">10</a></td>
          <td align="center"><a href="2_13.asp">0</a></td>
          <td align="center">15</td>
        </tr>
      </table>
      </div>
      <div class="mingdan">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td style=" background-color:#f7f7f7"><strong>序号</strong></td>
          <td style=" background-color:#f7f7f7"><strong>昵称</strong></td>
          <td style=" background-color:#f7f7f7"><strong>操作</strong></td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>通过</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>通过</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>通过</td>
        </tr>
        <tr>
          <td>12589456</td>
          <td>dongbo</td>
          <td>通过</td>
        </tr>
      </table>
      </div>
      <div style="clear:both"></div>
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
