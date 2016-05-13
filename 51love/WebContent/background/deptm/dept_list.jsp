<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%
String deptid = request.getParameter("deptid");
if(deptid == null)
  deptid = "0";

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
<script language=javascript src="../script/common.js"></script>
<script language="javascript">
function del(did)
{
  if(confirm("确定要删除该书麽？"))
  {
    document.turnPage.dbid.value = did;
    document.turnPage.submit();
  }
}
</script>
<link href="../../style/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" height="63"  border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
            <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
                <tr>
                  <td align="center">部门列表</td>
                </tr>
            </table></td>
            <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
            <td background="../images/popwin1_04.gif">&nbsp;</td>
            <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
          </tr>
</table>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#EEEEEE" class="txt" style="border-collapse:collapse ">
  <form action="" method="POST" name="turnPage">
  </form>
  <tr valign="middle" bgcolor="#f7f7f7">
    <td width="48" height="28" align="center"><strong> 编号</strong></td>
    <td width="164" align="center"><strong>名称</strong></td>
    <td width="435" height="28" align="center"><strong>操作</strong></td>
  </tr>


  <tr valign="middle" bgcolor="#ffffff" onMouseOver="bgColor='#DDECFF'" onMouseOut="bgColor='#ffffff'">
    <td width="48" height="28" align="center">&nbsp;</td>
    <td align="center">&nbsp;</td>
    <td width="435" height="28" align="center">
    <a href="bookindex.jsp?bid=" class="button1" target="_blank">查看</a>
    <a href="javascript:del('');" class="button1">删除</a>
    </td>
  </tr>

</table>
</body>
</html>
