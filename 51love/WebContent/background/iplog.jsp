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
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
%>
<%
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String username  = SysCommonFunc.getStrParameter(request,"username");
   String ip        = SysCommonFunc.getStrParameter(request,"ip");
   String isf = SysCommonFunc.getStrParameter(request,"isf");
   if(isf.length() > 0)
   {
      Date cdate = new Date(System.currentTimeMillis());
      starttime = DateTools.dateToString(cdate,false);
      endtime = starttime;
   }




   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");



   int pagesize = 30;


   String sql = "from IpLog as o where o.isadmin =1 ";
   String sql1 = "select sum((t.logouttime - t.logintime) * 24 * 60 * 60) From ip_log t where isadmin=1 ";

   if(starttime.length() > 0)
   {
     sql = sql + " and o.logintime >= to_date('"+starttime + "','YYYY-MM-DD')";
     sql1 = sql1+ " and t.logintime >= to_date('"+starttime + "','YYYY-MM-DD')";
   }
   if(endtime.length() >0)
   {
     String lendtime = endtime + " 23:59:59";
     sql = sql + " and o.logintime <= to_date('"+lendtime + "','YYYY-MM-DD HH24:MI:SS')";
     sql1 = sql1 + " and t.logintime <= to_date('"+lendtime + "','YYYY-MM-DD HH24:MI:SS')";
   }

   if(username.length() > 0)
   {
     sql = sql + " and o.username ='"+username+"'";
     sql1 = sql1 + " and t.username ='"+username+"'";
   }
   if(ip.length() > 0)
   {
     sql = sql + " and o.userstrip like '%"+ip+"%'";
     sql1 = sql1 + " and t.userstrip like '%"+ip+"%'";
   }
   sql = sql + " order by o.logintime desc";


   QueryResult qr = null;

   qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;

   long alltime = SysCommonFunc.getNumberForSql(sql1).longValue();
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
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("请正确填写转到页数！");
                return;
   }
   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}
</script>
<link rel="stylesheet" type="text/css" media="all" href="../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../commonlib/calendar/calendar-setup.js"></script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">日志查询</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="iplog.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td height="25" colspan="6" align="center"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">

        <tr align="center" bgcolor="#FFFFFF">
          <td width="11%" align="center" class="tdc"><strong>用户名</strong></td>
          <td width="20%" align="left" class="style3"><input name="username" type="text" class="input3" id="username" size="15" value="<%=username%>"></td>
          <td width="9%" align="center" class="tdc"><strong>IP地址</strong></td>
          <td width="16%" align="left" class="style3"><input name="ip" type="text" class="input3" id="IP" size="15" value="<%=ip%>"></td>
            <td width="44%" align="left" class="style3">&nbsp;</td>
          </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td align="center" class="tdc"><strong>查询时间</strong></td>
          <td colspan="4" align="left" class="style3"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
            <img src="../commonlib/calendar/img.gif" width="20" height="14" id="startt">
            <script type="text/javascript">
    Calendar.setup({
        inputField     :    "starttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "startt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
            </script>
到
<input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
<img src="../commonlib/calendar/img.gif" width="20" height="14" id="endt">
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "endtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script>
<input name="Submit" type="submit" value="查找"></td>
          </tr>




      </table></td>
    </tr>
    <tr >
      <td width="5%" align="center" class="tdc"><strong>序号</strong></td>
      <td width="10%" height="25" align="center" class="tdc"><strong>用户名</strong></td>
      <td width="19%" height="25" align="center" class="tdc"><strong>登陆IP</strong></td>
      <td width="27%" height="25" align="center" class="tdc"><strong> 登陆时间</strong></td>
      <td width="24%" align="center" class="tdc"><strong>退出时间</strong></td>
      <td width="15%" align="center" class="tdc"><strong>停留时间</strong></td>
    </tr>
<%
long sumtime = 0;
for(int i =0;i < qr.resultList.size();i ++)
{
   IpLog ilog = (IpLog)qr.resultList.get(i);
   String usernameview = null;
   if(ilog.getIsadmin().intValue() == 0)
   {
     if(ilog.getUserid() != null &&  ilog.getUserid().longValue() > 0)
       usernameview = "<a href='edithyinfo.jsp?id="+ilog.getUserid()+"'>"+ilog.getUsername()+"</a>";
     else
       usernameview = "游客";

   }
   else
     usernameview = ilog.getUsername();
   long time = ilog.getLogouttime() == null ? 0:ilog.getLogouttime().getTime()-ilog.getLogintime().getTime();
   sumtime = sumtime+time;
%>
    <tr>
      <td align="center"><%=(i+1)+(cpage-1)*pagesize%></td>
      <td height="25" align="center"><%=usernameview%></td>
      <td height="25" align="center"><%=ilog.getUserstrip()%></td>
      <td height="25" align="center"><%=DateTools.dateToString(ilog.getLogintime(),true)%></td>
      <td align="center"><%=DateTools.dateToString(ilog.getLogouttime(),true)%></td>
      <td align="center"><%=SysCommonFunc.getDateStep(time)%></td>
    </tr>
<%
}
%>
    <tr>
      <td align="center" class="tdc">&nbsp;</td>
      <td height="25" align="center" class="tdc">总计：</td>
      <td height="25" align="center" class="tdc"><%=SysCommonFunc.getDateStep(alltime*1000)%></td>
      <td height="25" align="center" class="tdc">&nbsp;</td>
      <td  align="center" class="tdc">本页合计：</td>
	  <td  align="center" class="tdc"><%=SysCommonFunc.getDateStep(sumtime)%></td>
    </tr>
    <tr >
      <td height="25" colspan="6" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="25" colspan="6" align="center" valign="middle"><%
if(cpage == 1)
  out.println("<font class='info_link'>首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; </font> ");
else
{
  out.println("<a href='javascript:turn(1)' class='info_link'>首    页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>上一页</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("<font class='info_link'>下一页&nbsp;&nbsp;尾页&nbsp;&nbsp;  </font> ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>下一页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>尾页</a>&nbsp;&nbsp;");
}
%>
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;&nbsp;</td>
    </tr>
    <tr >
      <td height="25" colspan="6" align="center" valign="middle">&nbsp;</td>
    </tr>
                                  <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
</table>
 </form>


</body>
</html>
<script>
function test(op,bbsid)
{
  var msg = "";
  if(op == '01')
    msg = "确认审核么?";
  if(op == '02')
    msg = "确认取消置顶么?";
  if(op == '03')
    msg = "确认置顶么?";
  if(op == '04')
    msg = "确认取消推荐么?";
  if(op == '05')
    msg = "确认推荐么?";
  if(op == '06')
    msg = "确认删除么?";

  if(!confirm(msg))
    return;
  document.go2to.bizaction.value=op;
  document.go2to.submit();
}
</script>
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
