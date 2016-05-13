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

<%


   String isurl   = SysCommonFunc.getStrParameter(request,"isurl");
   String httpurl = SysCommonFunc.getStrParameter(request,"httpurl");
   String httpip  = SysCommonFunc.getStrParameter(request,"httpip");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String myname   = SysCommonFunc.getStrParameter(request,"myname");
   String tjname   = SysCommonFunc.getStrParameter(request,"tjname");
   String tjid     = SysCommonFunc.getStrParameter(request,"tjid");




   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///得到用户列表
//   String sql = "from Vipuserrecord as o  where 1=1 ";
//   String sql1 = "select sum(t.transamt) from vipuserrecord t where 1=1 ";
//select t.*,u.vip from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where vip = 1

   String sql = "select u.username,u.lcname,u.hyid,count(*) as allnumber from hytj h left join userinfo u  on (h.myid=u.hyid) left join userinfo u1 on (h.tjid=u1.hyid) where 1=1 ";
    if(tjid.length() > 0)
    {
        sql = sql+" and myid="+tjid;
    }

   if(myname.length() > 0)
   {
     sql = sql + " and myname = '"+myname+"'";
   }

   if(tjname.length() > 0)
     sql = sql + " and u1.username = '"+tjname+"'";

   if(httpip.length() > 0)
     sql = sql + " and u1.httpip = '"+httpip+"'";

   if(isurl.equals("0"))
   {
     if(httpurl.length() > 0)
     {
      sql = sql + " and u1.httpurl like '%"+httpurl + "%'";

     }
     else
     {
      sql = sql + " and u1.httpurl is not null";

     }
   }
   else if(isurl.equals("1"))
   {
     sql = sql + " and u1.httpurl is null";

   }

    Date cdate = new Date(System.currentTimeMillis());
    String dates = DateTools.dateToString(cdate,false);

   //if(starttime.length() ==0)
     //starttime = dates;


   if(starttime.length() > 0)
   {
     sql = sql + " and tjdate >= to_date('"+starttime + "','YYYY-MM-DD')";
   }

   //if(endtime.length() == 0 )
   //{

    //   endtime = dates;
   //}

   if(endtime.length() > 0)
   {
     sql = sql + " and tjdate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";

   }


   sql = sql + " group by u.username,u.lcname,u.hyid order by allnumber desc";

   QueryResult qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
   
   System.out.println(sql);
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
        <td align="center">推荐统计</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchhytjtj.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">

                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="4" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>推荐代码</strong></td>
                                      <td width="25%" height="22" align="left"><span class="tdc">
                                        <input name="tjid" type="text" id="tjid" value="<%=tjid%>">
                                      </span></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>推荐人用户名</strong></td>
                                      <td width="46%" height="22" align="left"><input name="myname" type="text" id="myname" value="<%=myname%>"></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>来源IP</strong></td>
                                      <td height="22" align="left"><input name="httpip" type="text" id="httpip" value="<%=httpip%>"></td>
                                      <td height="22" align="center" class="tdc"><strong>来源网址</strong></td>
                                      <td height="22" align="left"><select name="isurl" id="isurl">
                                          <option value="">不限</option>
                                          <option value="0" <%if(isurl.equals("0")) out.print("selected");%>>有</option>
                                          <option value="1" <%if(isurl.equals("1")) out.print("selected");%>>没有</option>
                                        </select>
                                          <input name="httpurl" type="text" id="httpurl" value="<%=httpurl%>"></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>起始时间</strong></td>
                                      <td height="22" align="left"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                        </script></td>
                                      <td height="22" align="center" class="tdc"><strong>终止时间</strong></td>
                                      <td height="22" align="left"><input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>"  readonly>
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
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>被推荐人用户名</strong></td>
                                      <td height="22" align="left"><span class="tdc">
                                        <input name="tjname" type="text" id="tjname" value="<%=tjname%>">
                                      </span></td>
                                      <td height="22" align="center" class="tdc">&nbsp;</td>
                                      <td height="22" align="left"><input name="Submit" type="submit" class="button1" value="统计">                                        </td>
                                    </tr>


                                  </table>                                </td>
                              </tr>

                              <tr >
                                <td width="4%" height="25" align="center" nowrap="nowrap" class="tdc"><strong>序号</strong></td>
                                <td width="35%" align="center" class="tdc"><strong>推荐人用户名</strong></td>
                                <td width="23%" align="center" nowrap="nowrap" class="tdc"><strong>推荐人昵称</strong></td>
                                <td width="38%" align="center" class="tdc"><strong>推荐数量</strong></td>
                              </tr>
                              <%

for(int i =0;i < qr.resultList.size();i ++)
{
   DynaBean db = (DynaBean)qr.resultList.get(i);


   String username = (String)db.get("username");
   String lcname   = (String)db.get("lcname");
   String allnumber = db.get("allnumber").toString();


%>

                              <tr>
                                <td width="4%" height="25" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td width="35%" align="center"><a href="edithyinfo.jsp?id=<%=db.get("hyid")%>" target="_blank"><%=username%></a></td>
                                <td width="23%" align="center"><a href="edithyinfo.jsp?id=<%=db.get("hyid")%>" target="_blank"><%=lcname%></a></td>
                                <td width="38%" align="center"><a href="javascript:gototj('<%=db.get("hyid")%>')"><%=allnumber%></a></td>
                              </tr>
                              <%
}
%>


                              <tr>
                                <td height="25" colspan="4" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="4" align="center"><%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="4" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="8" align="center">&nbsp;</td>
                              </tr>
                </table>
 </form>



</body>
</html>
<script>
function test(op)
{
  if(!confirm('确认操作吗？')) return false;
  document.go2to.bizaction.value=op;
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.name.value))
{
alert('请输入服务名称！');
document.form1.name.focus();
return false;
}
if (isNaN(document.form1.transamt.value))
{
alert('请输入服务金额！');
document.form1.transamt.focus();
return false;
}
if (isNaN(document.form1.serviceyear.value))
{
alert('请输入服务年限！');
document.form1.serviceyear.focus();
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

function gototj(tjid)
{
    document.gototj.tjid.value=tjid;
    document.gototj.submit();
}
</script>

<form name="gototj" method="Post" action="searchhytj.jsp" target="_blank">

                            <input type="hidden" name="tjid" value="<%=tjid%>">
                            <input type="hidden" name="isurl" value="<%=isurl%>">
    <input type="hidden" name="httpurl" value="<%=httpurl%>">
    <input type="hidden" name="httpip" value="<%=httpip%>">
    <input type="hidden" name="starttime" value="<%=starttime%>">
    <input type="hidden" name="endtime" value="<%=endtime%>">
    <input type="hidden" name="tjname" value="<%=tjname%>">
    <input type="hidden" name="myname" value="<%=myname%>">


</form>
