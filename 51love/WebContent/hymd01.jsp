<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="hibernate.db.*"%>

<%
String action = SysCommonFunc.getStrParameter(request,"bizaction");
String id = SysCommonFunc.getStrParameter(request,"id");

if(SysCommonFunc.getNumberFromString(id,0)==0)
{
   System.out.println("sql注入"+id);
   return;
}

Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
if(loginUser == null)
{
  out.println("登录失效，请重新登录");
  return;
}
if(action.equals("01")){
    HbmOperator.executeSql("update hygl set sqtype="+SysDefine.SYSTEM_HYGL_FRIEND+" where  myid="+loginUser.getHyid() +" and id="+id);
} //加为好友

    if(action.equals("03")){
        HbmOperator.executeSql("update hygl set sqtype="+SysDefine.SYSTEM_HYGL_BLACK+" where  myid="+loginUser.getHyid() +" and id="+id);
    } //加为黑名单


if(action.equals("02"))
{
  HbmOperator.executeSql("delete hygl where  myid="+loginUser.getHyid() +" and id="+id);
  OpLogMng.addOpLog(loginUser,null,request,OpLogMng.OP_LOG_U_R_FR);
}
//response.redirect "grhy.asp"
//response.sendRedirect("grhy.jsp");
out.println("<script language='javascript'>if (window != top)top.location.href = 'grhy.jsp';</script>");
%>



