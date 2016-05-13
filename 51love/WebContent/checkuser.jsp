<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="sun.misc.BASE64Encoder" %>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.*"%>

<%
  if(request.getHeader("referer")==null)
			{
				response.setStatus(403);
				response.sendError(403);
				return;
			}
   String login = (String)request.getSession().getAttribute("login");
   String glogin = (String)request.getParameter("login");
   String goToUrl = (String)request.getParameter("goToUrl");
       // System.out.println("sp="+sp+"---"+"gsp="+gsp+"--"+request.getRemoteAddr());
        if(login == null)
          return;
        if(glogin == null)
          return;
        if(login.length() ==0)
          return;
          //网站防止重复登录情况，已经使用脚本，暂时屏蔽 update by linyu 20151018
          //历史用户登录引起系统问题，恢复使用 update by 20151107
       if(!login.equals(glogin))
          return;
///根据用户名字查询用户信息 注意是否是删除用户 ISDEL
///登陆成功修改最后登陆时间
///查询VIP 用户信息
   String username = SysCommonFunc.getStrParameter(request,"username");
   username = username.toLowerCase();
   String password = SysCommonFunc.getStrParameter(request,"password");
   String srand = (String)session.getAttribute("rand");
   String irand = SysCommonFunc.getStrParameter(request,"imager");
   String isauto = SysCommonFunc.getStrParameter(request,"isauto");
   if(isauto.equals("1"))
      irand=srand;
   if (srand == null && !isauto.equals("1"))
   {
      out.println("<script language='javascript'>alert('非法请求');window.close();</script>");
      return;
   }
   if(username == null || "".equals(username) || password == null || "".equals(password))
   {
     out.println("<script type='text/javascript'>alert('用户名或密码不正确');</script>");
      return;
   }
   
   Userinfo userinfo=HYRegMng.getAnyUserinfoByUsername(username);
   Date lastTime=null;
   if (userinfo!=null){
   	  lastTime=userinfo.getLasttime();
   }
   if (userinfo!=null){
   if(srand != null && !srand.equals(irand.trim()))
   {
      out.println("<script language='javascript'>alert('输入的验证码不正确');window.close();</script>");
      return;
   }
   
	   String s = HYRegMng.userLogin(username,password,request);
	   if(s != null)
	   {
	      out.println("<script language='javascript'>alert('"+s+"');window.close();</script>");
	      return;
	   }else
	   {
		//读取秋波发送表符合匹配的会员
//		if (userinfo.getSex()!=null && userinfo.getSex().equals("10")){
//			List list = null;
//			Calendar cal = Calendar.getInstance();
//			cal.setTime(userinfo.getCsdate());
//			int start = cal.get(Calendar.YEAR)-15;
//			int end = cal.get(Calendar.YEAR)+5;
//			String sDate=start+"-01-01";
//			String eDate=end+"-12-31";
//	   		String sql = "select q.*,u.USERNAME,u.HYID from Db_QiuboFs q join USERINFO u on q.SENDUSERID=u.HYID where q.sendtime <= to_date('"+DateTools.dateToString(lastTime,true)+"','YYYY-MM-DD HH24:MI:SS')";
//	   		sql = sql + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD') and u.s1='"+userinfo.getS1()+"' and u.sex='11' order by q.id asc";
//            list = QueryRecord.query(sql);
//	   		for(int i=0;i<list.size();i++){
//	   			DynaBean dbl=new LazyDynaBean();
//	   			Userinfo sendUser=new Userinfo();
//	   			dbl=(DynaBean)list.get(i);
//	   			sendUser.setHyid(Long.parseLong(((BigDecimal)dbl.get("hyid")).toString()));
//	   			sendUser.setUsername((String)dbl.get("username"));
//	   			GRZQMng.addQiuboAuto(sendUser,userinfo.getHyid().toString(),(Date)dbl.get("sendtime"));
//	   		}
//		}
	     String sss =username + "#####"+password;
	     BASE64Encoder be = new BASE64Encoder();

	     Cookie cookie = new Cookie("51up",be.encode(sss.getBytes()));
	     cookie.setMaxAge(2592000);
	
	     response.addCookie(cookie);
	    %>
	     <%
                     if(!isauto.equals("1")){
                     	if(userinfo!=null && "2".equals(userinfo.getIsdel()+"")){
                     	}else if(userinfo!=null && "0".equals(userinfo.getIsvcation()+"")){
                     		out.println("<script type='text/javascript'>alert('您是未验证会员，请验证您的手机提高交友成功率！');window.parent.location.replace('./grsjyz.jsp?subColumn=3');</script>");
                     	}else{
                     		   out.println("<script type='text/javascript'>window.parent.location.replace('"+goToUrl+"');</script>");
                     	}
                  	}
	   }
   }else{
    out.println("<script type='text/javascript'>alert('用户名或密码不正确');</script>");
   }
	
%>




