<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.lover.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>

<%

Userinfo sessionUserinfo = (Userinfo) request.getSession().getAttribute(SysDefine.SESSION_LOGINNAME);
if (sessionUserinfo == null){
	out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录　　');showLogin('index.jsp','grzq.jsp');</script>");
    return;
}
String sjtel = SysCommonFunc.getStrParameter(request,"sjtel");
if(sjtel!=null &&sjtel.length()>0){
	
String unactivesql = "update userinfo set isdel = 2, ISVCATION=0,VACSJTEL=0,SJTEL='"+sjtel+"' where hyid="  +sessionUserinfo.getHyid();

HbmOperator.executeSql(unactivesql);
List templist = HbmOperator.list("from Userinfo as o where o.hyid="+sessionUserinfo.getHyid());
if(templist != null && templist.size() > 0)
{
	request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME, (Userinfo)templist.get(0));
}

SimpleDateFormat subFormatter = new SimpleDateFormat("yyyy-MM-dd");
String tjtime = subFormatter.format(new Date());

Checkinfo checkinfo = new Checkinfo(2L,sessionUserinfo.getHyid(),0L,"手机修改",sessionUserinfo.getUsername(),sessionUserinfo.getLcname(),"",new Date(),
		new Date(),sessionUserinfo.getIstj()+"",sessionUserinfo.getSex(),sessionUserinfo.getCsdate(),null);
CheckinfoMng.addCheckInfo(checkinfo);



String addUpdatesql = "update checkinfo set nexttime= to_date('"+tjtime+"','yyyy-MM-dd') where hyid=" +sessionUserinfo.getHyid();
HbmOperator.executeSql(addUpdatesql);

out.println("<script language='javascript'>alert('您已经成功修改了手机号码！');window.parent.location.href='grzq.jsp';  </script>");
}else{
	out.println("<script language='javascript'>alert('请重新填写手机号码！');" +
	        "window.parent.location.href='grzq.htm'; </script>");
}

%>
