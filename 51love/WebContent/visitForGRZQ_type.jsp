<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>

<%
    Userinfo loginUser = (Userinfo) session.getAttribute(SysDefine.SESSION_LOGINNAME);
 	String url = SysCommonFunc.getStrParameter(request, "url");
    if (loginUser != null) {
        String vurl =  request.getRequestURL().toString();
        if(url != null && !"".equals(url)){
        	vurl = url;
        }
        
       // System.out.println("vurl=: " + vurl);
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }

%>