<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.*"%>
<%
String hyid = request.getParameter("hyid");
if(hyid != null && hyid.length() > 0)
{
  ImportData id = new ImportData();
  id.importHYQB(hyid);
  out.println("³É¹¦");
}
%>
