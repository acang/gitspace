<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.mng.*"%>

<%
String s = GRZQMng.userAddPhotoA(request,session);
if(s == null)
  out.println("<script language='javascript'>alert('上传照片成功！');window.parent.parent.parent.location.href='gryj.jsp?upload=1';window.close();</script>");
else
  out.println("<script language='javascript'>alert('"+s+"');</script>");
%>
