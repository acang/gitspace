<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.FriendMng" %>

<%
    String s = FriendMng.addFriend(request);
    if(s == null)
    {
        out.println("<script language='javascript'>alert('���Ѿ��ɹ��������������ӣ�');window.location.href='link.jsp'</script>");
    }
    else
    {
        out.println("<script language='javascript'>alert('"+s+"');window.location.href='link.jsp'</script>");
    }
%>