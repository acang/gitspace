<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>

<%
 Admininfo adminLeft = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
 int flag = 2;
 if(adminLeft.getFlag() != null)
   flag = adminLeft.getFlag().intValue();
%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #f0f0f0;
	scrollbar-3dlight-color:#cccccc;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#eeeeee;
	scrollbar-arrow-color:#777777;
	scrollbar-shadow-color:#cccccc;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#dedede;
}
-->
</style>
<script language="JavaScript" src="./dtree/dtree.js"></script>
<%--<link href="../style/css.css" rel="stylesheet" type="text/css">--%>
<link href="./dtree/dtree.css" rel="stylesheet" type="text/css">
</head>

<body   style="background-position:right bottom; background-repeat:no-repeat ">
<div class="dtree" style="width:190px;height:100%; overflow:auto">
<script type="text/javascript">
   //out.println("d.add(1,0,'用户管理','userManage/userList.jsp');");

    var d = new dTree('d');
    d.config.target = "mlist";
    d.config.useIcons=true;
    d.add(0,-1,'后台管理','http://www.51lover.org/',"","_blank");
   d.config.closeSameLevel=true;
    <%
    if(flag ==10)
    {
    %>
    d.add(1,0,'管理员设定');
    d.add(101,1,'增加管理员','addadmin.jsp');
    d.add(102,1,'维护管理员','editadmin.jsp');
    <%
    }
    %>
    <%
    if(flag ==10 || flag == 1)
    {
    %>

    d.add(2,0,'网站管理');
    d.add(201,2,'网站信息','siteinfo.jsp');

    d.add(202,2,'公告发布');
    d.add(203,202,'短文发布','./channel/news_add.jsp');   //即原来的公告发布
    d.add(204,202,'论坛文章发布','./channel/news_add_lt.jsp');
    d.add(205,2,'关于我们');
    d.add(206,205,'网站介绍',"./channel/wtnews_mod3.jsp?id=1773446");
    d.add(207,205,'网站证照',"./channel/wtnews_mod3.jsp?id=1773447");
    d.add(208,205,'网站动态','newslist.jsp');
    d.add(210,2,'服务指南');
    d.add(211,210,'使用指南',"newslist2.jsp");
    d.add(212,210,'服务条款',"./channel/wtnews_mod3.jsp?id=1773448");
    d.add(213,210,'隐私保护',"./channel/wtnews_mod3.jsp?id=1773449");
    d.add(214,210,'交友须知',"./channel/wtnews_mod3.jsp?id=1773450");
    d.add(215,2,'情商训练');
    d.add(216,215,'训练介绍',"./channel/wtnews_mod3.jsp?id=1773368");
    d.add(217,215,'训练图片',"./channel/wtnews_mod4.jsp?id=1773369");
    d.add(218,215,'训练分享',"newslist5.jsp");
   //    d.add(202,2,'流量设置','setll.jsp');
    <%
    }
    %>


    <%
    if(flag ==10 || flag == 5)
    {
    %>
    d.add(3,0,'友情链接管理');
    d.add(301,3,'申请链接','friend.jsp?state=0');
    d.add(302,3,'在用链接','friend.jsp?state=1');
    d.add(303,3,'暂停链接','friend.jsp?state=2');

    d.add(304,3,'漂浮广告','');
    <%
    }
    %>

    <%
    if(flag ==10 || flag ==5 || flag == 1 || flag == 30)
    {
    %>
    d.add(4,0,'客服中心');
    <%
    }
    %>
     <%
    if(flag ==10 || flag == 1 ||  flag == 30)
    {
    %>
    
    d.add(401,4,'新留言','kfzxlist.jsp?ntype=0');
    d.add(402,4,'交费','kfzxlist.jsp?ntype=1');
    d.add(403,4,'咨询','kfzxlist.jsp?ntype=2');
    d.add(404,4,'投诉','kfzxlist.jsp?ntype=3');
    d.add(405,4,'建议','kfzxlist.jsp?ntype=4');
    <%
    }
    %>
    
    <%
    if(flag ==10 || flag ==5 || flag == 1 ||  flag == 30)
    {
    %>
    d.add(406,4,'其它','kfzxlist.jsp?ntype=5');
    <%
    }
    %>
     <%
    if(flag ==10 || flag == 1 || flag == 30)
    {
    %>
    d.add(407,4,'删除','kfzxlist.jsp?ntype=6');
    <%
    }
    %>


    <%
    if(flag ==10 || flag ==2 || flag ==1 || flag ==5 || flag ==3 || flag == 20 ||  flag == 30 ||  flag == 40)
    {
    %>
    d.add(6,0,'会员管理');
    <%
     if(flag == 10 || flag==30 ||flag == 2 ||flag ==3 ||flag ==40)
     {
    %>
   d.add(608,6,'会员验证','searchsms.jsp');
   d.add(609,6,'信息收发','xxsf.jsp');
   <%
   }
   %>

    d.add(601,6,'会员管理','search.jsp?isdel=0');
    <%
    }
    %>

    <%
    if(flag ==10 || flag ==1 || flag ==5 || flag== 20 ||  flag == 30)
    {
    %>
    d.add(602,6,'已删除会员','search.jsp?isdel=1');
    <%
	}    
    %>
    
    <%
    if(flag ==10 || flag ==1 || flag == 20 ||  flag == 30)
    {
    %>
    d.add(603,6,'操作照片','searchoplog.jsp');
    d.add(604,6,'删除文集','searchoplogarticle.jsp');
    d.add(605,6,'用户信息修改','searchoploguinfo.jsp');
    /*d.add(606,6,'用户名屏蔽','usernamecutlist.jsp');*/
    d.add(608,6,'秋波匹配','searchqiubo.jsp');
    //d.add(606,6,'骚扰屏蔽','usernamecutlist.jsp');
    d.add(607,6,'敏感词管理','sensitivelist.jsp');

<%
    }
    
    if(flag ==10 || flag ==2 || flag ==1 || flag ==5 || flag ==3 || flag == 20 ||  flag == 30 ||  flag == 40)
    {
    %>
    	d.add(606,6,'骚扰屏蔽','usernamecutlist.jsp');
    	d.add(610,6,'审核管理','hychecklist.jsp');
    <%
    }
    %>

   <%
if(flag ==10 || flag ==3 || flag == 1 || flag == 5)
{
%>
   d.add(5,0,'论坛管理');
   d.add(501,5,'主题管理','bbs_admin.jsp');
   d.add(502,5,'回复管理','bbs_retopic.jsp');
   d.add(503,5,'发布主题','bbs_addtopic.jsp');
   d.add(504,5,'分区管理','bbssort_admin.jsp');

   <%
   }
   %>
    <%
    if(flag ==10|| flag==1|| flag ==5 )
    {
    %>
      d.add(12,0,'会员推荐');
      d.add(1201,12,'会员推荐','searchhytj.jsp');
      d.add(1202,12,'推荐统计','searchhytjtj.jsp');
	  d.add(1203,12,'微信分享','sharearticlelist.jsp');
    <%
    }
    %>
    
    <%
    if(flag ==10 || flag ==5)
    {
    %>
    d.add(11,0,'推广管理');
    d.add(1101,11,'推广人管理','advset.jsp');
    d.add(1102,11,'推广统计','advlist.jsp');
    //d.add(1103,11,'推广查询','advlist.jsp');
    <%
    }
    %>

    <%
    if(flag ==4)
    {
    %>
    d.add(11,0,'推广管理');
    d.add(1103,11,'推广查询','advplist.jsp');
    <%
    }
    %>
   d.add(1201,0,'分享金币管理','bbs_user.jsp');
    <%
    if(flag ==10 || flag == 1 ||  flag == 30 ||flag ==40 || flag ==6)
    {
    %>
    	d.add(7,0,'收费管理');
    <%
    }
    %>
    <%
    if(flag ==10 || flag == 1 ||  flag == 30)
    {
    %>
    d.add(701,7,'增加服务项目','addproduct.jsp');
    d.add(702,7,'维护服务项目','productlist.jsp');
    d.add(703,7,'订 单 查 看','cartlist.jsp');
    d.add(704,7,'收 费 办 理 ','addvip.jsp');
    d.add(705,7,'收 费 查 询','searchviprecordlist.jsp');

   <%
    }
    %>
    <%
    if(flag == 6)
    {
    %>
    d.add(701,7,'增加服务项目','addproduct.jsp');
    d.add(702,7,'维护服务项目','productlist.jsp');
    d.add(703,7,'订 单 查 看','cartlist.jsp');
   <%
    }
    %>
    <%
    if(flag ==40)
    {
    %>
    d.add(703,7,'订 单 查 看','cartlist.jsp');
   <%
    }
    %>

    <%
    if(flag ==10 || flag ==1 || flag == 20)
    {
    %>
      d.add(8,0,'网站日志','iplog.jsp?isf=1');
      d.add(9,0,'首页更新','jsp2.jsp');
    <%
    }
    %>
    

//    d.add(601,6,'在线用户','online.jsp');
//    d.add(602,6,'访问日志','iplog.jsp');


//    d.add(9,0,'退出管理','logout.jsp');
    document.write(d);
</script>
</div>

</body>
</html>
