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
	String isCheck     = SysCommonFunc.getStrParameter(request,"isCheck");



   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///得到用户列表
//   String sql = "from Vipuserrecord as o  where 1=1 ";
//   String sql1 = "select sum(t.transamt) from vipuserrecord t where 1=1 ";
//select t.*,u.vip from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where vip = 1

   String sql = "select h.myname,u.username,u.lcname,tjdate,u.httpurl,u.httpip,u.sex,u.CSDATE,myid,tjid,h.ischeck,h.tjtype  from hytj h left join userinfo u on (h.tjid=u.hyid) where 1 = 1";

    if(tjid.length() > 0)
    {
       sql = sql + " and myid = "+tjid;
    }

    if(myname.length() > 0)
   {
     sql = sql + " and myname = '"+myname+"'";
   }

   if(tjname.length() > 0)
     sql = sql + " and username = '"+tjname+"'";

   if(httpip.length() > 0)
     sql = sql + " and httpip = '"+httpip+"'";

   if(isurl.equals("0"))
   {
     if(httpurl.length() > 0)
     {
      sql = sql + " and httpurl like '%"+httpurl + "%'";

     }
     else
     {
      sql = sql + " and httpurl is not null";

     }
   }
   else if(isurl.equals("1"))
   {
     sql = sql + " and httpurl is null";

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
 if(isCheck.length() > 0)
   {
     sql = sql + " and ischeck = '"+isCheck+"'";

   }

   sql = sql + " order by id desc";
	System.out.println("-----------------bjd_sql:"+sql);
   QueryResult qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
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
        <td align="center">推荐查询</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchhytj.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="tjid" value="<%=tjid%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="12" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>推荐人用户名</strong></td>
                                      <td width="25%" height="22" align="left"><input name="myname" type="text" id="myname" value="<%=myname%>"></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>被推荐人用户名</strong></td>
                                      <td width="46%" height="22" align="left"><input name="tjname" type="text" id="tjname" value="<%=tjname%>"></td>
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
                                      <td height="22" align="left"><input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
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
                                      <td height="22" align="center" class="tdc"><strong>是否验证</strong></td>
                                      <td height="22" align="left">
										<select name="isCheck" id="isCheck">
                                          <option value="">不限</option>
                                          <option value="1" <%if(isCheck.equals("1")) out.print("selected");%> >已验证</option>
                                          <option value="0" <%if(isCheck.equals("0")) out.print("selected");%> >未验证</option>
                                        </select>
										</td>
                                      <td height="22" align="center" class="tdc">&nbsp;</td>
                                      <td height="22" align="left"><input name="Submit" type="submit" class="button1" value="查询">                                        </td>
                                    </tr>


                                  </table>                                </td>
                              </tr>

                              <tr >
                                <td width="3%" align="center" nowrap="nowrap" class="tdc"><strong>序号</strong></td>
                                <td width="8%" align="center" class="tdc"><strong>推荐人用户名</strong></td>
                                <td width="8%" align="center" nowrap="nowrap" class="tdc"><strong>推荐代码</strong></td>
                                <td width="9%" align="center" nowrap="nowrap" class="tdc"><strong>被推荐人用户名</strong></td>
                                <td width="11%" align="center" class="tdc"><strong>被推荐人昵称</strong></td>
                                <td width="4%" align="center" class="tdc"><strong>性别</strong></td>
                                <td width="4%" align="center" class="tdc"><strong>年龄</strong></td>
                                <td width="16%" height="25" align="center" class="tdc"><strong>注册时间</strong></td>
                                <td width="13%" align="center" class="tdc"><strong>来源网址</strong></td>
                                <td width="10%" height="25" align="center" class="tdc"><strong>来源IP</strong></td>
                                <td width="6%" height="25" align="center" class="tdc"><strong>验证情况</strong></td>
                                <td width="6%" height="25" align="center" class="tdc"><strong>推广类型</strong></td>
                              </tr>
                              <%

for(int i =0;i < qr.resultList.size();i ++)
{
   DynaBean db = (DynaBean)qr.resultList.get(i);

   String httpurlv = (String)db.get("httpurl");
   String  dmyname   = (String)db.get("myname");
   String username = (String)db.get("username");
   String lcname   = (String)db.get("lcname");
   Date tjdate     = (Date)db.get("tjdate");
   String dhttpip   = (String)db.get("httpip");
   String check   = (String)db.get("ischeck");
   String tjtype = (String)db.get("tjtype");
   String vsex = DicList.getDicValue(SysDefine.DIC_SEX,(String)db.get("sex"),1);
   Date csdate = (Date)db.get("csdate");
   String age = "未知";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   if(httpurlv != null)
   {
      httpurlv = httpurlv.startsWith("http://") ? httpurlv.substring(7):httpurlv;
      int length = httpurlv.indexOf("/");
      if(length > 0)
        httpurlv = httpurlv.substring(0,length);
      if(httpurlv.length() > 14)
        httpurlv=httpurlv.substring(0,14);
   }
   
   	String yzqk = "未验证";
   	if(check != null && "1".equals(check) ){
   		yzqk = "已验证";
   	} 
   	String tglx = "";
   	if(tjtype != null && "1".equals(tjtype) ){
   		tglx = "新浪微博";
   	} 
   	if(tjtype != null && "2".equals(tjtype) ){
   		tglx = "腾讯微博";
   	} 
   	if(tjtype != null && "3".equals(tjtype) ){
   		tglx = "QQ好友";
   	} 
   	if(tjtype != null && "11".equals(tjtype) ){
   		tglx = "手机分享";
   	} 

%>

                              <tr>
                                <td align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=db.get("myid")%>" target="_blank"><%=dmyname%></a></td>
                                <td align="center"><%=db.get("myid")%></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=db.get("tjid")%>" target="_blank"><%=username%></a></td>
                                <td align="center"><%=lcname%></td>
                                <td align="center"><%=vsex%></td>
                                <td align="center"><%=age%></td>
                                <td height="25" align="center"><%=DateTools.dateToString(tjdate,true)%></td>
                                <td align="center"><a href="<%=db.get("httpurl") == null ? "":db.get("httpurl")%>" target="_blank"><%=httpurlv%></a></td>
                                <td height="25" align="center"><%=dhttpip%></td>
                                <td height="25" align="center"><%=yzqk%></td>
                                <td height="25" align="center"><%=tglx %></td>
                              </tr>
                              <%
}
%>


                              <tr>
                                <td height="25" colspan="12" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="12" align="center"><%
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
                                <td height="25" colspan="12" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="14" align="center">&nbsp;</td>
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
</script>

