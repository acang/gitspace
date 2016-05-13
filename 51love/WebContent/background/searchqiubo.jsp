<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
   String fsr    = SysCommonFunc.getStrParameter(request,"fsr");
    String s1    = SysCommonFunc.getStrParameter(request,"s1");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
    String ageStart   = SysCommonFunc.getStrParameter(request,"ageStart");
    int ageStarts = SysCommonFunc.getNumberFromString(ageStart,1);
    String ageEnd   = SysCommonFunc.getStrParameter(request,"ageEnd");
    int ageEnds = SysCommonFunc.getNumberFromString(ageEnd,1);

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   int pagesize = 30;

   ///得到用户列表
   String sql = "select q.*,u.LCNAME,u.lasttime,u.CSDATE,u.S1,u.S2,u.USERNAME,u.HYID,u.ISDEL,u.sex from DB_QIUBOFS q join USERINFO u on q.SENDUSERID=u.HYID  where 1=1 ";

    if(ageStarts>1 && ageEnds>1 && ageEnds>ageStarts){
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        int start = cal.get(Calendar.YEAR)-ageEnds;
        int end = cal.get(Calendar.YEAR)-ageStarts;
        String sDate=start+"-01-01";
        String eDate=end+"-12-31";
        sql = sql + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD')";
    }

    if(s1.length() > 0)
    {
        sql = sql + " and u.s1 like '%"+s1+"%'";
    }
   if(fsr.length() > 0)
   {
     sql = sql + " and u.USERNAME like '%"+fsr+"%'";
   }

   if(starttime.length() > 0)
   {
     sql = sql + " and q.SENDTIME >= to_date('"+starttime + "','YYYY-MM-DD')";

   }

   if(endtime.length() > 0)
   {
     sql = sql + " and q.SENDTIME <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";

   }

   sql = sql + " order by q.id desc";
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
        <td align="center">秋波匹配表</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchqiubo.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="8" align="left">
                                <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                        <td width="10%" height="22" align="center" class="tdc"><strong>地区</strong></td>
                                        <td width="10%" height="22" align="left"> <select name="s1" id="s1" >
                                            <option value="">请选择：</option>
                                            <option value="北京" <%="北京".equals(s1)?"selected":""%>>北京</option>
                                            <option value="天津" <%="天津".equals(s1)?"selected":""%>>天津</option>
                                            <option value="河北" <%="河北".equals(s1)?"selected":""%>>河北</option>
                                            <option value="山西" <%="山西".equals(s1)?"selected":""%>>山西</option>
                                            <option value="内蒙古" <%="内蒙古".equals(s1)?"selected":""%>>内蒙古</option>
                                            <option value="辽宁" <%="辽宁".equals(s1)?"selected":""%>>辽宁</option>
                                            <option value="吉林" <%="吉林".equals(s1)?"selected":""%>>吉林</option>
                                            <option value="黑龙江" <%="黑龙江".equals(s1)?"selected":""%>>黑龙江</option>
                                            <option value="上海" <%="上海".equals(s1)?"selected":""%>>上海</option>
                                            <option value="江苏" <%="江苏".equals(s1)?"selected":""%>>江苏</option>
                                            <option value="浙江" <%="浙江".equals(s1)?"selected":""%>>浙江</option>
                                            <option value="安徽" <%="安徽".equals(s1)?"selected":""%>>安徽</option>
                                            <option value="福建" <%="福建".equals(s1)?"selected":""%>>福建</option>
                                            <option value="江西" <%="江西".equals(s1)?"selected":""%>>江西</option>
                                            <option value="山东" <%="山东".equals(s1)?"selected":""%>>山东</option>
                                            <option value="河南" <%="河南".equals(s1)?"selected":""%>>河南</option>
                                            <option value="湖北" <%="湖北".equals(s1)?"selected":""%>>湖北</option>
                                            <option value="湖南" <%="湖南".equals(s1)?"selected":""%>>湖南</option>
                                            <option value="广东" <%="广东".equals(s1)?"selected":""%>>广东</option>
                                            <option value="广西" <%="广西".equals(s1)?"selected":""%>>广西</option>
                                            <option value="海南" <%="海南".equals(s1)?"selected":""%>>海南</option>
                                            <option value="重庆" <%="重庆".equals(s1)?"selected":""%>>重庆</option>
                                            <option value="四川" <%="四川".equals(s1)?"selected":""%>>四川</option>
                                            <option value="贵州" <%="贵州".equals(s1)?"selected":""%>>贵州</option>
                                            <option value="云南" <%="云南".equals(s1)?"selected":""%>>云南</option>
                                            <option value="西藏" <%="西藏".equals(s1)?"selected":""%>>西藏</option>
                                            <option value="陕西" <%="陕西".equals(s1)?"selected":""%>>陕西</option>
                                            <option value="甘肃" <%="甘肃".equals(s1)?"selected":""%>>甘肃</option>
                                            <option value="青海" <%="青海".equals(s1)?"selected":""%>>青海</option>
                                            <option value="宁夏" <%="宁夏".equals(s1)?"selected":""%>>宁夏</option>
                                            <option value="新疆" <%="新疆".equals(s1)?"selected":""%>>新疆</option>

                                        </select></td>
                                      <td width="10%" height="22" align="center" class="tdc"><strong>匹配用户名</strong></td>
                                      <td width="15%" height="22" align="left"><input name="fsr" type="text" id="fsr" value="<%=fsr%>"></td>
                                      <td width="10%" height="22" align="center" class="tdc"><strong>匹配时间</strong></td>
                                     <td height="22" colspan="3" align="left"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                      &nbsp;至：&nbsp;&nbsp;<input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
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
                                        </script>&nbsp;
                                       </td>
                                      </td>
                                    </tr>
                                  </table></td>
                              </tr>
                                <tr>
                                    <td height="35"  align="center"class="tdc"><strong>年龄</strong></td>
                                    <td height="35"  align="center"> <input type="text" size="3" name="ageStart" value="<%=ageStart%>"> ~ <input type="text" size="3" name="ageEnd" value="<%=ageEnd%>"></td>
                                    <td height="35" colspan="6" align="center">  <input name="Submit" type="submit" class="button1" value="查询">  </td>
                                </tr>
                              <tr >
                                <td width="8%" height="25" align="center" nowrap="nowrap" class="tdc"><strong>序号</strong></td>
                                <td width="16%" align="center" class="tdc"><strong>秋波匹配时间</strong></td>
                                <td width="16%" align="center" nowrap="nowrap" class="tdc"><strong>用户名</strong></td>
                                <td width="8%" align="center" class="tdc"><strong>性别</strong></td>
                                <td width="13%" align="center" class="tdc"><strong>昵称</strong></td>
                                <td width="12%" align="center" class="tdc"><strong>地区</strong></td>
                                <td width="11%" align="center" class="tdc"><strong>年龄</strong></td>
                                <td width="16%" align="center" class="tdc"><strong>登录时间</strong></td>
                              </tr>
                              <%
DynaBean dbl=null;
String vs1="";
String vs2="";
String zz="";
for(int i =0;i < qr.resultList.size();i ++)
{
   dbl=(DynaBean)qr.resultList.get(i);
   vs1 = dbl.get("s1") == null? "":dbl.get("s1").toString();
   vs2 = dbl.get("s2") == null? "":dbl.get("s2").toString();
   zz = vs1+vs2;
   if(zz.equals("北京北京"))
     zz = "北京";
   if(zz.equals("上海上海"))
     zz = "上海";
   if(zz.equals("天津天津"))
     zz = "天津";
   if(zz.equals("重庆重庆"))
     zz = "重庆";
   if(zz.equals("香港香港"))
     zz = "香港";
   if(zz.equals("澳门澳门"))
     zz = "澳门";
     
   Date csdate = (Date)dbl.get("csdate");
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "未知";
   String sex="";
   if (dbl.get("sex")!=null && dbl.get("sex").equals("10")){
   	 sex="男";
   }else if (dbl.get("sex")!=null && dbl.get("sex").equals("11")){
   	 sex="女";
   }
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
%>

                              <tr>
                                <td width="8%" height="25" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td align="center"><%=DateTools.dateToString((Date)dbl.get("sendtime"),true)%></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=dbl.get("hyid")%>&isdel=<%=dbl.get("isdel")%>" target="_blank"><%=(String)dbl.get("username")%></a></td>
                                <td align="center"><%=sex%></td>
                                <td align="center"><%=dbl.get("lcname")%></td>
                                <td align="center"><%=zz%></td>
                                <td align="center"><%=age%></td>
                                <td align="center"><%=DateTools.dateToString((Date)dbl.get("lasttime"),true)%></td>
                              </tr>
                              <%
}
%>


                              <tr>
                                <td height="25" colspan="7" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="7" align="center"><%
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
                                <td height="25" colspan="7" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="7" align="center">&nbsp;</td>
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
