<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="java.text.DecimalFormat"%>
<%
	String remobile = SysCommonFunc.getStrParameter(request,"remobile");
    String s = SMSTools.sendPwd(remobile,request);
%>
<%
if(s != null)
{
%>
<script language='javascript'>{alert('<%=s%>');window.parent.location.href='searchsms.jsp';}</script>
<%
}else{
	
%>
 <script language='javascript'>{alert('·¢ËÍ³É¹¦');}</script>
 <%
}
 %>