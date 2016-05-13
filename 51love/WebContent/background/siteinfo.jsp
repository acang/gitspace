<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.lover.*"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51交友中心</title>
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
        <td align="center">网站信息</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
  <tr>
    <td width="40%" height="25" align="center" class="tdc"><b>总注册会员：</b></td>
    <td width="60%" height="25" align="center"><%=CacheToolsNew.getAll_user()%></td>
  </tr>
  <tr>
    <td height="25" align="center" class="tdc"><b>昨日新增会员：</b></td>
    <td height="25" align="center"><%=CacheToolsNew.getAllUserVday()%></td>
  </tr>
  <tr>
    <td height="25" align="center" class="tdc"><b>今日访问量：</b></td>
    <td height="25" align="center"><%=CacheToolsNew.getAccessToday()%></td>
  </tr>
  <tr>
    <td height="25" align="center" class="tdc"><b>在线人数：</b></td>
    <td height="25" align="center"><b><%=CacheToolsNew.getUserOnline()%></b></td>
  </tr>
  <tr>
    <td height="25" colspan="2" align="center"><b><a href="http://new.cnzz.com/v1/login.php?siteid=1214579" target="_blank">CNZZ 统计</a></b></td>
  </tr>
</table>


</body>
</html>
