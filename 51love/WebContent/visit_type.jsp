<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>

<%
    Userinfo loginUser = (Userinfo) session.getAttribute(SysDefine.SESSION_LOGINNAME);
    String type = SysCommonFunc.getStrParameter(request, "type");

    if (loginUser != null) {
        String vurl = "";
        vurl = request.getRequestURL().toString();
        if (request.getQueryString() != null) {
            vurl += "?" + request.getQueryString()+"&type="+type;
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }

%>