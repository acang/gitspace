<%@ page contentType="text/html; charset=gb2312" %>
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
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   String filepath = InitEnvironment.getSystemProValue(SysDefine.ENV_WEB_PATH)+File.separator+"WEB-INF/setll.properties";
   if(bizaction.equals("01"))
   {
      String v1 = SysCommonFunc.getStrParameter(request,"v1");
      String v2 = SysCommonFunc.getStrParameter(request,"v2");
      String v3 = SysCommonFunc.getStrParameter(request,"v3");
      String v4 = SysCommonFunc.getStrParameter(request,"v4");
      String v5 = SysCommonFunc.getStrParameter(request,"v5");
      FileWriter fw = new FileWriter(filepath);
      BufferedWriter bw = new BufferedWriter(fw);
      bw.write(v1+":"+v2+":"+v3+":"+v4+":"+v5);
      bw.close();
      fw.close();
      CacheTools.loadLLSet();
      out.println("<script language='javascript'>alert('设置成功');</script>");
   }



   File file = new File(filepath);
   if(!file.exists())
     file.createNewFile();

   FileReader fr = new FileReader(filepath);
   BufferedReader br = new BufferedReader(fr);

   String s = br.readLine();
   br.close();
   fr.close();
   if(s == null)
   {
      s = "0:0:0:0:0";
   }

   String[] array = s.split(":");



%>

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
        <td align="center">流量设置</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="setll.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
    <tr align="left">
      <td width="186" height="25" align="center" class="tdc" ><strong><font color="#FF0000"> 调整内容</font></strong></td>
      <td width="193" height="25" align="center" class="tdc" ><strong><font color="#FF0000">原始数据</font></strong></td>
      <td width="205" align="center" class="tdc" ><strong><font color="#FF0000">显示系数</font></strong></td>
      <td width="205" height="25" align="center" class="tdc" ><strong><font color="#FF0000">显示数字</font></strong></td>
    </tr>
    <tr align="center">
      <td height="25" align="center" class="tdc" ><strong>会员总数</strong></td>
      <td height="25" ><%=CacheTools.getAll_user()%></td>
      <td ><input name="v1" type="text" id="v1" value="<%=array[0]%>">      </td>
      <td height="25" ><%=(long)(CacheTools.getAll_user()*Double.parseDouble(array[0]))%></td>
    </tr>
	<input name="v2" type="hidden" id="v2" value="0">

    <tr align="center">
      <td height="25" align="center" class="tdc" ><strong>昨日新增会员</strong></td>
      <td height="25" ><%=CacheTools.getAllUserVday()%></td>
      <td ><input name="v3" type="text" id="v3" value="<%=array[2]%>">      </td>
      <td height="25" ><%=(long)(CacheTools.getAllUserVday()*Double.parseDouble(array[2]))%></td>
    </tr>
    <tr align="center">
      <td height="25" align="center" class="tdc" ><strong>今日访问量</strong></td>
      <td height="25" ><%=CacheTools.getAccessToday()%></td>
      <td ><input name="v4" type="text" id="v4" value="<%=array[3]%>"></td>
      <td height="25" ><%=(long)(CacheTools.getAccessToday()*Double.parseDouble(array[3]))%></td>
    </tr>
    <tr align="center">
      <td height="25" align="center" class="tdc" ><strong>目前在线</strong></td>
      <td height="25" ><%=CacheTools.getUserOnline()%></td>
      <td ><input name="v5" type="text" id="v5" value="<%=array[4]%>">      </td>
      <td height="25" ><%=(long)(CacheTools.getUserOnline()*Double.parseDouble(array[4]))%></td>
    </tr>
    <tr>
      <td colspan="4" align="center" >
          <input name="Submit2" type="submit" class="button1" value="确  　定">      </td>
    </tr>
  </table>
</form>

</body>
</html>


