<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Date" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%
if(request.getHeader("referer")==null)
			{
				response.setStatus(403);
				response.sendError(403);
				return;
			}
			
///未做功能
//判断是否在对方的黑名单中
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
if(loginUser == null)
{
   out.println("<script language='javascript'>alert('您是游客，请先登录或注册');location.replace('login.jsp');</script>");
   return;
}
String hyid = SysCommonFunc.getStrParameter(request,"hyid");
if(hyid.length() == 0)
{
  out.println("<script language='javascript'>alert('请选择要发送秋波的会员！');window.close();</script>");
  return;
}

if(SysCommonFunc.getNumberFromString(hyid,0)==0)
{
   out.println("<script language='javascript'>alert('请选择要发送秋波的会员');window.close();</script>");
   System.out.println("sql注入"+hyid);
   return;
}

Userinfo hyinfo = new Userinfo();
hyinfo.setHyid(new Long(hyid));
boolean isBlack = GRZQMng.isHy(hyinfo,SysDefine.SYSTEM_HYGL_BLACK,loginUser);
%>

<%
String s = GRZQMng.addQiubo(loginUser,hyid);
 //    2015.11.11取消男会员加女好友修改搜索结果排序时间为当前，改为男会员发秋波的第一个女会员搜索结果排序时间改为当前
    Userinfo us = HYRegMng.getAllUserinfoByHyid(hyid);
     if("10".equals(loginUser.getSex()) && "11".equals(us.getSex())){
      Boolean result = false;
      String today = DateTools.DateToString(new Date(),"yyyy-MM-dd");
      List hylist = HbmOperator.list("from DbQiubo as o where o.senduserid = " +loginUser.getHyid() + " and o.sendtime>to_date('"+today+"','yyyy-MM-dd')");
      if(hylist!=null && hylist.size()>1){
          result = true;
      }
          if(!result){
             String sqlstr = "update userinfo set Regtime5 = sysdate where hyid="+hyid;
             HbmOperator.executeSql(sqlstr);
         }
         
     }
if(s == null)
  out.println("<script language='javascript'>alert('您已经成功向该会员发送秋波！');window.close();</script>");
else
  out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
%>

