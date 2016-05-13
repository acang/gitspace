<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>

<%
    Userinfo loginUser = (Userinfo) session.getAttribute(SysDefine.SESSION_LOGINNAME);
 	
    if (loginUser != null) {
        String vurl = "http://www.51lover.org/paymoney.jsp"; 
        if (request.getQueryString() != null) {
            vurl += "&" + request.getQueryString();
        }
       // System.out.println("vurl=: " + vurl);
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }

%>