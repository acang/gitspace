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
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧�������������ͷ���ʵ��ˣ�ȫ�����ķ����������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="baidu-site-verification" content="XGXEHLUB1e" />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
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
    <h2>�����»�Ա</h2>

      <A href="searchjg02.jsp?s1=����" target="_blank">��������</a>
      |
      <a href="searchjg02.jsp?s1=�Ϻ�" target="_blank">�Ϻ�����</a>
      |
      <a href="searchjg02.jsp?s1=���" target="_blank">�����</a>
      |
      <a href="searchjg02.jsp?s1=����" target="_blank">���콻��</a>
      |
      <a href="searchjg02.jsp?s2=����" target="_blank">���ݽ���</a>
      |
      <a href="searchjg02.jsp?s2=����" target="_blank">���ڽ���</a>
      |
      <a href="searchjg02.jsp?s2=�Ͼ�" target="_blank">�Ͼ�����</a>
      |
      <a href="sszx.htm" target="_blank"> ����&gt;&gt;</a>
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
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120" /><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
  </div>
  <div class="block02">
    <div class="lm_name">
      <h2>�ص��л�Ա</h2>
        <a href="searchjg02.jsp?s2=�ɶ�" target="_blank">�ɶ�����</a>
        |<a href="searchjg02.jsp?s2=�人" target="_blank">�人����</a>
        |<a href="searchjg02.jsp?s2=����" target="_blank">��������</a>
        |<a href="searchjg02.jsp?s2=֣��" target="_blank">֣�ݽ���</a>
        |<a href="searchjg02.jsp?s2=����" target="_blank">���ݽ���</a>
        |<a href="searchjg02.jsp?s2=����" target="_blank">���Ͻ���</a>
        |<a href="searchjg02.jsp?s2=����" target="_blank">���ݽ���</a>
        |<a href="./sszx.htm" target="_blank">����&gt;&gt;</a>
    </div>
    <div class="box">

        <%=CacheToolsNew.getTopRqzwManSbNew()%>
    </div>
    <div class="lm_name">
      <h2>�ص�Ů��Ա</h2>
        <a href="searchjg02.jsp?s2=��ɳ" target="_blank">��ɳ����</a>
        |<a href="searchjg02.jsp?s2=�ൺ" target="_blank">�ൺ����</a>
        |<a href="searchjg02.jsp?s2=ʯ��ׯ" target="_blank">ʯ��ׯ����</a>
        |<a href="searchjg02.jsp?s2=��ݸ" target="_blank">��ݸ����</a>
        |<a href="searchjg02.jsp?s2=������" target="_blank">����������</a>
        |<a href="searchjg02.jsp?s2=����" target="_blank">��������</a>
        |<a href="searchjg02.jsp?s2=�Ϸ�" target="_blank">�Ϸʽ���</a>
        |<a href="./sszx.htm" target="_blank">����&gt;&gt;</a>
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
          <a href="bbsindex.jsp?sortid=13" target="_blank"> <h2> ���Ѷ�̬</h2></a>
        <a href="bbsindex.jsp?sortid=13" target="_blank">����&gt;&gt;</a></div>
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
                        showtitle ="<span style='color:#21648f'>[����]</span><span style='color:#21648f'>"+title+"</span>";

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
       <a href="bbsindex.jsp?sortid=3" target="_blank"> <h2>���ѹ���</h2></a>
        <a href="bbsindex.jsp?sortid=3" target="_blank">����&gt;&gt;</a></div>
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
                      showtitle ="<span style='color:#21648f'>[����]</span><span style='color:#21648f'>"+title+"</span>";

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
         <a href="bbsindex.jsp?sortid=12" target="_blank"><h2>���ѹ���</h2></a>
        <a href="bbsindex.jsp?sortid=12" target="_blank">����&gt;&gt;</a></div>
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
                      showtitle ="<span style='color:#21648f'>[����]</span><span style='color:#21648f'>"+title+"</span>";

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
              <a href="bbsindex.jsp?sortid=9" target="_blank"><h2>���ѹ���</h2></a>
              <a href="bbsindex.jsp?sortid=9" target="_blank">����&gt;&gt;</a></div>
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
                          showtitle ="<span style='color:#21648f'>[����]</span><span style='color:#21648f'>"+title+"</span>";

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
        	<div><a href="link.jsp">&nbsp;&nbsp;��������&nbsp;&nbsp;(����)</a></div>
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
