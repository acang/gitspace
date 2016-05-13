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
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   if(adminLoginInfo.getFlag() == null)
   {
      out.println("<script language='javascript'>alert('对不起！您无权增加管理员的资料！');history.go(-1);</script>");
      return;
   }
   
   if(adminLoginInfo.getFlag().intValue() != 10 && adminLoginInfo.getFlag().intValue() != 5)
   {
      out.println("<script language='javascript'>history.go(-1);</script>");
      return;
   }
   String ok=SysCommonFunc.getStrParameter(request,"ok");
   String stime =SysCommonFunc.getStrParameter(request,"starttime");
   String etime =SysCommonFunc.getStrParameter(request,"endtime");
   String sql = "select adv_member_name,adv_member_code,createtime from  adv_member where 1=1 ";
   if(ok.equals("1"))
   {
	   String advmembername=SysCommonFunc.getStrParameter(request,"advmembername");
	   if(advmembername.length()>0)
		{
				sql=sql+" and adv_member_name='" +advmembername+"'";
		}
   	}
   sql=sql+" order by id asc";
   		
  
	   
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   String wttype = SysCommonFunc.getStrParameter(request,"wttype");


   tcount = 0;

   int pagesize = 15;

   ///得到用户列表

   QueryResult qr = null;
   
   qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51lover交友中心</title>
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

<script language="JavaScript">

function check()
{

}

function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

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

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;
   document.go2to.submit();
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
        <td align="center">推广统计</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="advlist.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="23%" align="center" class="tdc"><strong>推广人名称</strong></td>
      <td width="77%" align="left">
      <input name="advmembername" type="text" id="advmembername">      </td>
    </tr>
    <tr >
      <td align="center" class="tdc"><strong>查询时间</strong></td>
      <td align="left">
        起始时间：<input name="starttime" type="text" class="input3" id="starttime"  value="<%=stime == null ? "":stime%>">
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
</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;终止时间：<input name="endtime" type="text" class="input3" id="endtime"  value="<%=etime == null ? "":etime%>">
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
</script></td>
    </tr>
    <tr >
      <td colspan="2" align="center">
          　<input type="hidden" value="1" name ="ok"> 
      <input type="submit" name="Submit2"  class="button1" value="查询" onClick="return check();">      </td>
    </tr>
  </table>
</form>
<br>




<form name="go2to" method="Post" action="advlist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" value="2" name ="ok2"> 

  <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="10%" height="30" align="center" class="tdc"><strong>序号</strong></td>
      <td width="20%" height="30" align="center" class="tdc"><strong>推广人名称</strong></td>
      <td width="35%" height="30" align="center" class="tdc"><strong>推广数量</strong></td>
      <td width="35%" height="30" align="center" class="tdc"><strong>删除数量</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
	DynaBean db = (DynaBean)qr.resultList.get(i);
	String sql3="select sum(1) as count from userinfo where isdel = 0 and vip ="+db.get("adv_member_code") ;
		if(stime.length()>0)
		{
			sql3=sql3+" and regtime >= to_date('"+stime+ "','YYYY-MM-DD')";
		}
		if(etime.length()>0)
		{
			sql3=sql3+" and regtime <= to_date('"+etime+ "','YYYY-MM-DD')";
		}
	List list3=QueryRecord.query(sql3);
	DynaBean db3 = (DynaBean)list3.get(0);
	String sql4="select sum(1) as count from userinfo where isdel = 1 and lcname is not null and vip ="+db.get("adv_member_code") ;
	if(stime.length()>0)
	{
		sql4=sql4+" and regtime4 >= to_date('"+stime+ "','YYYY-MM-DD')";
	}
	if(etime.length()>0)
	{
		sql4=sql4+" and regtime4 <= to_date('"+etime+ "','YYYY-MM-DD')";
	}
	List list4=QueryRecord.query(sql4);
	DynaBean db4 = (DynaBean)list4.get(0);
	
%>
    <tr>
      <td height="30" align="center"><%=(cpage-1)*20+i+1%></td>
      <td height="30" align="center"><%=db.get("adv_member_name")%></td>
      <td height="30" align="center"><a href ="advdisplay.jsp?isdel=0&vip=<%=db.get("adv_member_code")%>&starttime=<%=stime %>&endtime=<%=etime %>" target="_blank"><%=db3.get("count")%></a></td>
      <td height="30" align="center"><a href ="advdisplaydel.jsp?isdel=1&vip=<%=db.get("adv_member_code")%>&starttime=<%=stime %>&endtime=<%=etime %>" target="_blank"><%=db4.get("count")%></a></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="7" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="7" align="center" valign="middle">
<%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条 &nbsp;&nbsp;
<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr >
      <td height="30" colspan="7">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="7"> <div align="center">
          </div></td>
    </tr>
</table>
 </form>




</body>
</html>


