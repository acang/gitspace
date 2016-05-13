<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.QueryRecord"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="org.apache.commons.beanutils.DynaBean"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="com.web.common.DateTools"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.text.DateFormat"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%
String s = GRZQMng.adminAddPhoto(request,session);
if(s == null)
{
   String hyid = request.getAttribute("hyid").toString();
   String isdel = request.getAttribute("isdel").toString();
   Userinfo userUp = HYRegMng.getUserinfoByHyid(hyid);
   if(userUp.getSex()!=null&&userUp.getSex().equals("11")){
   
   userUp.setLasttime(new Date(System.currentTimeMillis()));
   userUp.setRegtime2(new Date(System.currentTimeMillis()));
   HbmOperator.update(userUp);
   }
   
%>

   <script language='javascript'>alert('上传文件成功！');window.parent.parent.parent.opener.location.href='edithyinfoyj.jsp?id=<%=hyid%>&isdel=<%=isdel%>';window.parent.close()</script>
<%
}
else if(s.indexOf("满") > -1)
{
  out.println("<script language='javascript'>alert('"+s+"');window.parent.close()</script>");
}else
{
  out.println("<script language='javascript'>alert('"+s+"');</script>");
}
%>
