<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%
///根据用户名字查询用户信息 注意是否是删除用户 ISDEL
///登陆成功修改最后登陆时间
///查询VIP 用户信息

  if(request.getHeader("referer")==null)
			{
				response.setStatus(403);
				response.sendError(403);
				return;
			}
   String username = SysCommonFunc.getStrParameter(request,"username");
   String password = SysCommonFunc.getStrParameter(request,"password");
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");

String srand = (String)session.getAttribute("rand2");
String irand = SysCommonFunc.getStrParameter(request,"imager");
  	 if(srand != null && !srand.equals(irand.trim()))
   	{
   	   out.println("<script language='javascript'>alert('输入的验证码不正确');history.go(-1)</script>");
    	  return;
  	 }
   

   if(username.length() > 0)
   {
       String s = HYRegMng.userLogin(username,password,request);
       if(s != null)
       {
          out.println("<script language='javascript'>alert('"+s+"');history.go(-1)</script>");
       }else
       {
          response.sendRedirect("cart1.jsp");
       }
   }

%>