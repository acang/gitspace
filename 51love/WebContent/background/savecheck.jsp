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
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="java.math.BigDecimal"%>
<%
String hyid = SysCommonFunc.getStrParameter(request,"id");
if(hyid.length() ==0)
{
   out.println("会员信息不存在，请重新查找");
   return;
}else{
	HbmOperator.executeSql("update USERINFO set ISVCATION=1 where hyid = " + hyid);
}
%>


