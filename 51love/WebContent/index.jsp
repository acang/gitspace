<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.obj.Bb" %>
<%@ page import="com.lover.CacheToolsNew" %>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    
     String isPhone = SysCommonFunc.getStrParameter(request, "isPhone");
     
    String login = System.currentTimeMillis()+"";
    session.setAttribute("login",login);
    if(request.getRequestURL().toString().toLowerCase().indexOf("www.51lover.org") < 0&& request.getRequestURL().toString().toLowerCase().indexOf("localhost") < 0)
    {
        response.setStatus(301);
        response.setHeader("Location","http://www.51lover.org" );
        response.setHeader("Connection","close");
    }
    if (request.getRequestURL().toString().toLowerCase().indexOf("kp56.net") > -1) {
        response.setStatus(403);
        response.sendError(403);
        return;
    }
    request.setCharacterEncoding("gb2312");


    String url = (String) session.getAttribute("httpurl");
    if (url == null) {
        url = request.getHeader("referer");
        session.setAttribute("httpurl", url);
    }
    String advid = SysCommonFunc.getStrParameter(request, "advid");
    if (advid != null && advid.length() > 0)
        session.setAttribute("advid", advid);
    String tjid = SysCommonFunc.getStrParameter(request, "tjid");
    if (tjid != null && tjid.length() > 0)
        session.setAttribute("tjid", tjid);
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。客服真实审核，全程贴心服务，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
    <meta name="baidu-site-verification" content="XGXEHLUB1e" />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css?v=1" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>

    <script src="http://siteapp.baidu.com/static/webappservice/uaredirect.js" type="text/javascript"></script>
  <%
  	
  	 if(isPhone !=null && "1".equals(isPhone)){
     	session.setAttribute("isPhone", isPhone);
     }else{
     	isPhone=(String)session.getAttribute("isPhone");
     	if(isPhone ==null  ){
     	%>
     	 <script type="text/javascript">uaredirect("http://www.51lover.org/mobile")</script>
     	<% 
     	}
     }
  
  
   %>
  
   

</head>
<body class="cm_index">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  <div class="lm_name">
    <h2>诚意新会员</h2>

      <A href="searchjg02.jsp?s1=北京" target="_blank">北京交友</a>
      |
      <a href="searchjg02.jsp?s1=上海" target="_blank">上海交友</a>
      |
      <a href="searchjg02.jsp?s1=天津" target="_blank">天津交友</a>
      |
      <a href="searchjg02.jsp?s1=重庆" target="_blank">重庆交友</a>
      |
      <a href="searchjg02.jsp?s2=广州" target="_blank">广州交友</a>
      |
      <a href="searchjg02.jsp?s2=深圳" target="_blank">深圳交友</a>
      |
      <a href="searchjg02.jsp?s2=南京" target="_blank">南京交友</a>
      |
      <a href="sszx.htm" target="_blank"> 更多&gt;&gt;</a>
  </div>
  <div class="box">
  	<div style="width:1300px; height:270px; overflow:hidden">
        <%=CacheToolsNew.getTopOneSbNew()%>
          </div>
  </div>
</div>
<div class="wrapper1250 mt10"><a href="#" target="_blank"><img src="images/ad01.jpg" alt="" /></a></div>
<div class="wrapper1250 cm_block02">
  <div class="block01">
    <div class="box01"><a href="#" target="_blank"><img src="images/ad02.jpg" alt=""/></a></div>
    <div class="box02">
      <div class="lm_name">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120" /><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div class="block02">
    <div class="lm_name">
      <h2>重点男会员</h2>
        <a href="searchjg02.jsp?s2=成都" target="_blank">成都交友</a>
        |<a href="searchjg02.jsp?s2=武汉" target="_blank">武汉交友</a>
        |<a href="searchjg02.jsp?s2=西安" target="_blank">西安交友</a>
        |<a href="searchjg02.jsp?s2=郑州" target="_blank">郑州交友</a>
        |<a href="searchjg02.jsp?s2=杭州" target="_blank">杭州交友</a>
        |<a href="searchjg02.jsp?s2=济南" target="_blank">济南交友</a>
        |<a href="searchjg02.jsp?s2=苏州" target="_blank">苏州交友</a>
        |<a href="./sszx.htm" target="_blank">更多&gt;&gt;</a>
    </div>
    <div class="box">

        <%=CacheToolsNew.getTopRqzwManSbNew()%>
    </div>
    <div class="lm_name">
      <h2>重点女会员</h2>
        <a href="searchjg02.jsp?s2=长沙" target="_blank">长沙交友</a>
        |<a href="searchjg02.jsp?s2=青岛" target="_blank">青岛交友</a>
        |<a href="searchjg02.jsp?s2=石家庄" target="_blank">石家庄交友</a>
        |<a href="searchjg02.jsp?s2=东莞" target="_blank">东莞交友</a>
        |<a href="searchjg02.jsp?s2=哈尔滨" target="_blank">哈尔滨交友</a>
        |<a href="searchjg02.jsp?s2=沈阳" target="_blank">沈阳交友</a>
        |<a href="searchjg02.jsp?s2=合肥" target="_blank">合肥交友</a>
        |<a href="./sszx.htm" target="_blank">更多&gt;&gt;</a>
    </div>
    <div class="box">
        <%=CacheToolsNew.getTopRqzwWonSbNew()%>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<div class="wrapper1250 cm_block03">
  <div class="block01">
    <div class="box">
      <div class="lm_name">
          <a href="bbsindex.jsp?sortid=13" target="_blank"> <h2> 交友动态</h2></a>
        <a href="bbsindex.jsp?sortid=13" target="_blank">更多&gt;&gt;</a></div>
      <ul>
         <%
             QueryResult qr = CacheToolsNew.getXWDT(13);
            for(int i=0;i < qr.resultList.size();i ++)
                {
               Bb bb = (Bb)qr.resultList.get(i);
               String title = bb.getTitle();
                    String showtitle = "";
                    if(bb.getCommend() != null && bb.getCommend().intValue() ==1)
                    {
                        showtitle ="<span style='color:#21648f'>[新帖]</span><span style='color:#21648f'>"+title+"</span>";

                    }else{
                        showtitle = title;
                    }
             %>
        <li><i></i><a href="disp_bbs-bbsid-<%=bb.getId()%>.htm" target="_blank"><%=showtitle%></a></li>
                 <%}%>
      </ul>
    </div>
    <div class="box">
      <div class="lm_name">
       <a href="bbsindex.jsp?sortid=3" target="_blank"> <h2>交友观念</h2></a>
        <a href="bbsindex.jsp?sortid=3" target="_blank">更多&gt;&gt;</a></div>
      <ul>
          <%
              QueryResult qr2 = CacheToolsNew.getXWDT(3);
              for(int i=0;i < qr2.resultList.size();i ++)
              {
                  Bb bb = (Bb)qr2.resultList.get(i);
                  String title = bb.getTitle();
                  String showtitle = "";
                  if(bb.getCommend() != null && bb.getCommend().intValue() ==1)
                  {
                      showtitle ="<span style='color:#21648f'>[新帖]</span><span style='color:#21648f'>"+title+"</span>";

                  }else{
                      showtitle = title;
                  }
          %>
          <li><i></i><a href="disp_bbs-bbsid-<%=bb.getId()%>.htm" target="_blank"><%=showtitle%></a></li>
          <%}%>
      </ul>
    </div>
    <div class="box">
      <div class="lm_name">
         <a href="bbsindex.jsp?sortid=12" target="_blank"><h2>交友攻略</h2></a>
        <a href="bbsindex.jsp?sortid=12" target="_blank">更多&gt;&gt;</a></div>
      <ul>
          <%
              QueryResult qr3 = CacheToolsNew.getXWDT(12);
              for(int i=0;i < qr3.resultList.size();i ++)
              {
                  Bb bb = (Bb)qr3.resultList.get(i);
                  String title = bb.getTitle();
                  String showtitle = "";
                  if(bb.getCommend() != null && bb.getCommend().intValue() ==1)
                  {
                      showtitle ="<span style='color:#21648f'>[新帖]</span><span style='color:#21648f'>"+title+"</span>";

                  }else{
                      showtitle = title;
                  }
          %>
          <li><i></i><a href="disp_bbs-bbsid-<%=bb.getId()%>.htm" target="_blank"><%=showtitle%></a></li>
          <%}%>
      </ul>
    </div>
      <div class="box">
          <div class="lm_name">
              <a href="bbsindex.jsp?sortid=9" target="_blank"><h2>交友故事</h2></a>
              <a href="bbsindex.jsp?sortid=9" target="_blank">更多&gt;&gt;</a></div>
          <ul>
              <%
                  QueryResult qr4 = CacheToolsNew.getXWDT(9);
                  for(int i=0;i < qr4.resultList.size();i ++)
                  {
                      Bb bb = (Bb)qr4.resultList.get(i);
                      String title = bb.getTitle();
                      String showtitle = "";
                      if(bb.getCommend() != null && bb.getCommend().intValue() ==1)
                      {
                          showtitle ="<span style='color:#21648f'>[新帖]</span><span style='color:#21648f'>"+title+"</span>";

                      }else{
                          showtitle = title;
                      }
              %>
              <li><i></i><a href="disp_bbs-bbsid-<%=bb.getId()%>.htm" target="_blank"><%=showtitle%></a></li>
              <%}%>
          </ul>
      </div>
    <div style="clear:both"></div>
  </div>
  <!-- div class="block02">
      <div style="clear:both"></div>
  </div -->
  <div style="clear:both"></div>
</div>
<div class="mylink">
    	<div class="title">
        	<div><a href="link.jsp">&nbsp;&nbsp;友情链接&nbsp;&nbsp;(申请)</a></div>
         </div>
	    <div class="textlink">
            <%=CacheToolsNew.getFriendSiteLink()%>
        </div>
    <div class="link">
        <div class="lpic">
            <%=CacheToolsNew.getFriendLinkNew()%>
        </div>
    </div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
