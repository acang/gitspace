<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.mng.*"%>

<%
	String s = HYRegMng.updateSjdl(request);
    String goToUrl = (String)request.getParameter("goToUrl");
	if(s == null){
		
	  out.println("<script language='javascript'>window.parent.location.href='"+goToUrl+"'; window.close();  </script>");
	  }
	else
	 out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");

%>
