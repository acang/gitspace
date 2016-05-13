<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="hibernate.db.HbmOperator" %>


<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
if(loginUser == null)
{
  out.println("<script language='javascript'>alert('您是游客，请先登录或注册');location.replace('login.jsp');</script>");
  return;
}
String action = SysCommonFunc.getStrParameter(request,"bizaction");
String hyid   = SysCommonFunc.getStrParameter(request,"hyid");

if(SysCommonFunc.getNumberFromString(hyid,0)==0)
{
      out.println("<script language='javascript'>alert('请选择要添加的好友');window.close();</script>");

   System.out.println("sql注入"+hyid);
   return;
}

if(action.equals("1")) //增加好友
{
   if(hyid.length()==0)
   {
      out.println("<script language='javascript'>alert('请选择要添加的好友');window.close();</script>");
      return;
   }
   if(hyid.equals(loginUser.getHyid().longValue()+""))
   {
      out.println("<script language='javascript'>alert('对不起，自己不能把自己加为好友!');window.close();</script>");
      return;
   }
   String s = GRZQMng.addHy(loginUser,hyid);
  /**    2015.11.11取消男会员加女好友修改搜索结果排序时间为当前，改为男会员发秋波的第一个女会员搜索结果排序时间改为当前
    Userinfo us = HYRegMng.getAllUserinfoByHyid(hyid);
     if("10".equals(loginUser.getSex()) && "11".equals(us.getSex())){
         Boolean a = GRZQMng.isAddHy(loginUser);
          if(!a){
             //当点击加为好友时会员regtime5时间为当前，2015年7月7日，沈凯健增加
             String sqlstr = "update userinfo set Regtime5 = sysdate where hyid="+hyid;
             HbmOperator.executeSql(sqlstr);
         }
         
     }
**/


   if(s == null)
   {
     out.println("<script language='javascript'>alert('您已经成功将此会员加为好友！');window.close();</script>");
     return;
   }else
   {
      out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
      return;
   }
}
%>
<%
if(action.equals("2")) //增加好友
{
   if(hyid.length()==0)
   {
      out.println("<script language='javascript'>alert('请选择要加入黑名单的会员！);window.close();</script>");
      return;
   }
   if(hyid.equals(loginUser.getHyid().longValue()+""))
   {
      out.println("<script language='javascript'>alert('对不起，自己不能把自己加入到黑名单！');window.close();</script>");
      return;
   }
   String s = GRZQMng.addToBlack(loginUser,hyid);
   if(s == null)
   {
     out.println("<script language='javascript'>alert('您已经成功将此会员加入到黑名单！');window.close();</script>");
     return;
   }else
   {
      out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
      return;
   }
}
out.println("<script language='javascript'>alert('选择操作错误！');window.close();</script>");
%>

