<%@ page contentType="text/html; charset=gb2312" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.obj.Bb" %>
<%@ page import="com.lover.CacheToolsNew" %>
<style type="text/css">
body {font:12px/24px 'ËÎÌו';height:41px;width:1200px;}
a:hover{color:#1f5b7f;text-decoration:none;-webkit-transition:color 0.2s ease;-moz-transition:color 0.2s ease;-o-transition:color 0.2s ease;transition:color 0.2s ease}
a:focus{outline:none;}
a{color:#000;text-decoration:none;-webkit-transition:color 0.4s ease;-moz-transition:color 0.4s ease;-o-transition:color 0.4s ease;transition:color 0.4s ease}
a:visited{text-decoration:none}
a { float:left; color:#666; margin-right:15px; white-space:nowrap; font-size:14px}
a:hover { color:#f00;}
ul { list-style:none; }
ul li{ width:88px; height:31px; float:left; margin-right:12px;}
img{ width:88px; height:31px; border:#e9e9e9 1px solid;}
</style>

 <%=CacheToolsNew.getFriendLinkNew()%>
 
