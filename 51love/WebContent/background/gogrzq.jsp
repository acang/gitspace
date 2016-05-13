<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="java.math.BigDecimal"%>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.Date" %>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
String hyid = SysCommonFunc.getStrParameter(request,"id");
Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1")){
	  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
	}else{
		List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
	    if(templist != null && templist.size() > 0)
	    {
	    	loginUser = (Userinfo)templist.get(0);
	    }
	}

if(loginUser == null)
{
   out.println("会员信息不存在，请重新查找");
   return;
}
else
{
	 request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,loginUser);
	 List list = HbmOperator.list("from Userother as o where o.hyid="+hyid);
     Userother userother = null;
    if(list != null && list.size() > 0) {
        userother = (Userother)list.get(0);
     }

     request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME_OTHER,userother);

		 HbmOperator.executeSql("update userinfo set lasttime=sysdate,regtime5=sysdate where hyid = "+loginUser.getHyid());
         
         //读取秋波发送表符合匹配的会员
		if (loginUser.getSex()!=null && loginUser.getSex().equals("10")){
			list = null;
			Calendar cal = Calendar.getInstance();
			//cal.setTime(loginUser.getCsdate());
			int start = cal.get(Calendar.YEAR)-4;
			int end = cal.get(Calendar.YEAR)+15;
			String sDate=start+"-01-01";
			String eDate=end+"-12-31";
		  		String sqlQb = "select q.*,u.USERNAME,u.HYID from Db_QiuboFs q join USERINFO u on q.SENDUSERID=u.HYID where q.sendtime >= to_date('"+DateTools.dateToString(loginUser.getLasttime(),true)+"','YYYY-MM-DD HH24:MI:SS') ";
		  		sqlQb = sqlQb + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD') and u.s1='"+loginUser.getS1()+"' and u.sex='11' order by q.id asc";
		  		list = QueryRecord.query(sqlQb);
		  		for(int j=0;j<list.size();j++){
		  			DynaBean dbl=new LazyDynaBean();
		  			Userinfo sendUser=new Userinfo();
		  			dbl=(DynaBean)list.get(j);
		  			sendUser.setHyid(Long.parseLong(((BigDecimal)dbl.get("hyid")).toString()));
		  			sendUser.setUsername((String)dbl.get("username"));
		  			GRZQMng.addQiuboAuto(sendUser,loginUser.getHyid().toString(),(Date)dbl.get("sendtime"));
		  		}
		}
	response.sendRedirect("../grzq.jsp");
}

%>
