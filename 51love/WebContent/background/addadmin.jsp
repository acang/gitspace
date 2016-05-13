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
   if(adminLoginInfo.getFlag() == null)
   {
      out.println("<script language='javascript'>alert('对不起！您无权增加管理员的资料！');history.go(-1);</script>");
      return;
   }
   
   if(adminLoginInfo.getFlag().intValue() != 10)
   {
      out.println("<script language='javascript'>history.go(-1);</script>");
      return;
   }

   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("01"))
   {
      String s = AdminMng.addAdmin(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('您已经成功添加该管理员！');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"！');</script>");
      }
   }
%>
<script>
function cuser(){
	document.getElementById("adminname")==
}
</script>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love交友中心</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color:#8CABDE;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#E8F1FF;
	scrollbar-arrow-color:#8CABDE;
	scrollbar-shadow-color:#8CABDE;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#F2F7FF;
}
-->
</style>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">增加管理员</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="addadmin.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td align="center" class="tdc"><strong>用 户 名</strong></td>
      <td align="left">
          <input name="adminname" type="text" id="adminname">
      </td>
    </tr>
    <tr >
      <td align="center" class="tdc"><strong>密　　码</strong></td>
      <td align="left">
          <input name="adminpass" type="text" id="adminpass">
      </td>
    </tr>
    <tr >
      <td align="center" class="tdc"><strong>权　　限</strong></td>
      <td align="left">
         <input type="radio" name="flag" value="1">
          营运主管
         <input type="radio" name="flag" value="2" checked>
          审核员
           <input type="radio" name="flag" value="3">
          论坛主管
   
          <input type="radio" name="flag" value="5">
          推广主管
          <input type="radio" name="flag" value="4">
          推广人
          <input type="radio" name="flag" value="10">
      管理员
          <input type="radio" name="flag" value="20">
      审核主管
          <input type="radio" name="flag" value="30">
      客服主管
      <input type="radio" name="flag" value="40">
      销售顾问
      <input type="radio" name="flag" value="6">
      收费管理员
      </td>
    </tr>
    <tr >
      <td align="center" class="tdc"><strong>备　　注</strong></td>
      <td align="left">
          <input name="memo" type="text" id="memo">
      </td>
    </tr>
    <tr >
      <td colspan="2" align="center">
          　　
      <input type="submit" name="Submit2"  class="button1" value="提交" onClick="return check();">      </td>
    </tr>
  </table>
</form>

</body>
</html>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.adminname.value))
{
alert('请输入管理员名称！');
document.form1.adminname.focus();
return false;
}
if (checkspace(document.form1.adminpass.value))
{
alert('请输入新增加管理员的密码！');
document.form1.adminpass.focus();
return false;
}
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</script>

