<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>

<%
List list = HbmOperator.list("from Userinfo as o where o.regtime > sysdate-1 and o.httpip = '"+IPTools.getIp(request) + "' and o.isdel in (0,2)");
if(list.size() > 0)
{
  Userinfo utemp = (Userinfo)list.get(0);
  System.out.println("重复注册:"+list.size()+":"+utemp.getLcname() + ":"+utemp.getUsername() + ":"+utemp.getHttpip());
  out.println("<script language='javascript'>{window.alert('"+"一天之内请不要重复注册!"+"');}</script>");
return;
}

String username = request.getParameter("username");
Usernamecut usernamecut =null;
        List listt =HbmOperator.list("from Usernamecut");
        for(int i=0;i<listt.size();i++)
        {
			usernamecut=(Usernamecut)listt.get(i);
        	
        	if(username.indexOf(usernamecut.getUsernamecut())!=-1)
        	{
        		out.println("<script language='javascript'>{window.alert('您的用户名已被屏蔽，不能注册，请换个用户名验证！！');}</script>");
        		return;
        	}
        }
        
        
String s = HYRegMng.userRegNewUser(request);
if(s == null)
{
  Userinfo cuser = (Userinfo)request.getAttribute("cu");
  session.setAttribute("reg","ok");
  out.println("<script language='javascript'>window.top.location.href='./reg2user.jsp?hyid="+cuser.getHyid()+"&username="+username+"';</script>");
}

else if(s.startsWith("11"))
{
   out.println("<script language='javascript'>{window.alert('"+s.substring(2)+"');window.open('forget.jsp?step=2&username="+username+"')}</script>");
}else
{
   out.println("<script language='javascript'>{window.alert('"+s+"');}</script>");
}

%>
