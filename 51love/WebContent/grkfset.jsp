<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.lover.mng.*"%>

<%

  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
if(loginUser == null)
{
  out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录或注册');location.replace('login.jsp');</script>");
  return;
}
String s = GRZQMng.userUpdateHyset(request,loginUser);
String s1 = UserReceiveSetMng.userupdateUserReceiveSet(request,loginUser);
if(s == null && s1==null)
  out.println("<script language='javascript'>alert('您已经成功修改此会员的开放设置！');window.parent.location.href='grkf.htm';window.close();</script>");
else if (s != null && s1==null)
  out.println("<script language='javascript'>alert('"+s+"');</script>");
else if (s == null && s1!=null){
	if (s1.startsWith("11")){
		out.println("<script language='javascript'>{window.alert('"+s1.substring(2)+"');}</script>");
	}else if (s1.startsWith("12")){
		out.println("<script language='javascript'>{window.alert('"+s1.substring(2)+"');window.top.location.replace('grsjyz.jsp');}</script>");
	}else if (s1.startsWith("13")){
		out.println("<script language='javascript'>{window.alert('"+s1.substring(2)+"');window.top.location.replace('grzq.jsp');}</script>");
	}
}
%>
