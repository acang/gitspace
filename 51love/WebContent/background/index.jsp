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
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
//   if(adminLoginInfo.getFlag().intValue() == 4)
//   {
//   		out.println("<script language='javascript'>alert('��½����');window.history.go(-1);</script>");
//   		return;
//   }
   String adminType = "";
   if(adminLoginInfo.getFlag().intValue() ==10)
     adminType = "����Ա";
   else if(adminLoginInfo.getFlag().intValue() == 2)
     adminType = "���Ա";
   else if(adminLoginInfo.getFlag().intValue() == 1)
     adminType = "Ӫ������";
   else if(adminLoginInfo.getFlag().intValue() == 3)
     adminType = "��̳����";
   else if(adminLoginInfo.getFlag().intValue() == 5)
     adminType = "�ƹ�����";
   else
     adminType = "����Ա";
   String src="siteinfo.jsp";
   //
   String nav = SysCommonFunc.getStrParameter(request,"nav");
   if(nav.equals("1"))
   {
     src = "./channel/viewkfzx.jsp?id="+SysCommonFunc.getStrParameter(request,"id");
   }
   if(nav.equals("2"))
   {
     src = "edithyinfo.jsp?id="+SysCommonFunc.getStrParameter(request,"id")+"&isdel="+SysCommonFunc.getStrParameter(request,"isdel");
   }
   if(adminLoginInfo.getFlag().intValue() == 4)
   {
       src = "#";
   }
   //
   if(adminLoginInfo.getId().longValue() == 93 && session.getMaxInactiveInterval() != 60*30)
       session.setMaxInactiveInterval(60*30);


%>
<html>
<head>
<title></title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	background-color: #f0f0f0;
}
-->
</style>
<link href="../style/css.css" rel="stylesheet" type="text/css">
<link href="../style/dtree.css" rel="stylesheet" type="text/css">
</head>

<body style="overflow:hidden;">
<table width="100%" height="78"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td height="78">
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" background="images/top_03.gif">
      <tr>

        <td width="910" height="78"><%=adminType%>��<%=adminLoginInfo.getAdminname()%> &nbsp;&nbsp;��½ʱ�䣺<%=DateTools.dateToString(adminLoginInfo.getLasttime(),true)%>&nbsp;&nbsp;��½������<%=adminLoginInfo.getDlcs()%></td>
        <td width="35">&nbsp;</td>
        <td width="156" height="78">&nbsp;</td>
        <td width="116" height="78">&nbsp;</td>
        <td width="17" height="78">&nbsp;</td>

      </tr>
      </table>
    </td>
  </tr>
</table>
<table width="100%" height="525"  border="0" cellspacing="0" cellpadding="0">
  <tr>
			<td width="200" align="center" valign="top" bgcolor="#FFFFFF">
			  <table width="100%" height="100%"  border="1" cellpadding="0" cellspacing="0" bordercolor="#8CABDE" class="txt" style="border-collapse:collapse ">
                           <tr>
                             <td valign="top" align="center" background="images/list_bg4.gif" bgcolor="#F2F7FF" style="background-position:right bottom; background-repeat:no-repeat ">
                               <table width="100%" height="100%"  border="0" cellspacing="4" cellpadding="0">
                               <tr>
                                   <td valign="top"><iframe frameborder="0" scrolling="auto" height="100%" width="100%" src="left.jsp" name="tree"></iframe></td>
                               </tr>
                               </table>
                             </td>
                           </tr>
                         </table>
			</td>
		    <td width="0" align="left" valign="top" bgcolor="#FFFFFF">
			<iframe frameborder="0" height="100%" name="mlist" width="100%" scrolling="auto" src="<%=src%>"></iframe>
		    </td>
		  </tr>
</table>
</body>
</html>
