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
///�����û����ֲ�ѯ�û���Ϣ ע���Ƿ���ɾ���û� ISDEL
///��½�ɹ��޸�����½ʱ��
///��ѯVIP �û���Ϣ

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
   	   out.println("<script language='javascript'>alert('�������֤�벻��ȷ');history.go(-1)</script>");
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