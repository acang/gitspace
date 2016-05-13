<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.common.*"%>
<%@ page import="com.web.obj.*"%>
<%

Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
  session.invalidate();
  
  //add by linyu 20151002 前台推出登陆，后台不要退出
 request.getSession().setAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME, adminLoginInfo); 
  
%>
<% 
Cookie[] cookies=request.getCookies(); 
try 
{ 
     for(int i=0;i<cookies.length;i++)   
     { 
      Cookie cookie = new Cookie("51up",null); 
      cookie.setMaxAge(0); 
      //cookie.setPath("/");//根据你创建cookie的路径进行填写     
      response.addCookie(cookie); 
     } 
}catch(Exception ex) 
{ 
     out.println("清空Cookies发生异常！"); 
}
%>


<script language="javascript">
 alert('欢迎再次光临51交友中心！');
 	window.parent.location.href='index.htm';
</script>
