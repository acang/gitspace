<%@ page contentType="text/html; charset=gbk" %>
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
//审核人    审核时间                 审核情况              下次审核时间
   	String checkername = SysCommonFunc.getStrParameter(request,"checkername");
   	String checkerid = SysCommonFunc.getStrParameter(request,"checkerid");
   	String hyname = SysCommonFunc.getStrParameter(request,"hyname");
   	String lcname = SysCommonFunc.getStrParameter(request,"lcname");
   	
   	String status = SysCommonFunc.getStrParameter(request,"status");
   	String nexttime = SysCommonFunc.getStrParameter(request,"nexttime");
	//Long checkerid,Long hyid,Long id,String status,String hyname,String lcname,String checkername,Date time,Date nexttime
	Checkinfo checkinfo = new Checkinfo(2L,2L,0L,"1","hyname","lcname",checkername,new Date(),new Date());
	CheckinfoMng.addCheckInfo(checkinfo);
%>

