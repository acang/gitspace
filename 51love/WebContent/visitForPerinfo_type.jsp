<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>

<%
    Userinfo loginUser = (Userinfo) session.getAttribute(SysDefine.SESSION_LOGINNAME);
    String type = SysCommonFunc.getStrParameter(request, "type");
    String userid = SysCommonFunc.getStrParameter(request, "userid");
 	
    if (loginUser != null) {
        String vurl = "http://www.51lover.org/perinfo.jsp?id="+userid; 
        if (request.getQueryString() != null) {
            vurl += "&" + request.getQueryString();
        }else{
         	vurl += "&type="+type;
        }
       // System.out.println("vurl=: " + vurl);
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }

%>