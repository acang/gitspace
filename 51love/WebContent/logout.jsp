<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.common.*"%>
<%@ page import="com.web.obj.*"%>
<%

Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
  session.invalidate();
  
  //add by linyu 20151002 ǰ̨�Ƴ���½����̨��Ҫ�˳�
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
      //cookie.setPath("/");//�����㴴��cookie��·��������д     
      response.addCookie(cookie); 
     } 
}catch(Exception ex) 
{ 
     out.println("���Cookies�����쳣��"); 
}
%>


<script language="javascript">
 alert('��ӭ�ٴι���51�������ģ�');
 	window.parent.location.href='index.htm';
</script>
