<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("mod"))
   {
      String tm = SysCommonFunc.getStrParameter(request,"tmh");
      String bid = SysCommonFunc.getStrParameter(request,"bid");
   //   String sql = "update bbsuser set moneys="+tm + " where hyid="+bid;
  //    HbmOperator.executeSql(sql);
   }


   String username  = SysCommonFunc.getStrParameter(request,"username");
   String grade     = SysCommonFunc.getStrParameter(request,"grade");
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   int pagesize = 20;
   String sql = "from BbsuserTemp as o where 1=1 ";
   if(username.length() > 0){
       sql = sql + " and o.username ='"+username+"'";
   }

   if(grade.length() > 0)
   {
      int idx = Integer.parseInt(grade);
      int startm = BBSMng.gradeMongy[idx];
      int endm   = Integer.MAX_VALUE;
      idx = idx+1;
      if(idx < BBSMng.gradeMongy.length)
       endm =  BBSMng.gradeMongy[idx];
      sql =sql +" and o.moneys >= "+startm;
      if(endm < Integer.MAX_VALUE)
        sql = sql + " and o.moneys < "+endm;
   }


   sql = sql + " order by o.hyid desc";
   tcount = 0;
   QueryResult qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
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
        <td align="center">分享金币管理</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="bbs_userTemp.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <input type="hidden" name="tnh" value="">
                            <input type="hidden" name="tcnh" value="">
                            <input type="hidden" name="tnrh" value="">
                            <input type="hidden" name="tmh" value="">
                            <input type="hidden" name="bid" value="">

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td height="25" colspan="13" align="center">
          <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">

        <tr align="center" bgcolor="#FFFFFF">
          <td width="9%" align="center" class="tdc"><strong>用户名</strong></td>
          <td width="16%" align="left" class="style3">
              <input name="username" type="text" class="input3" id="username" size="15" value="<%=username%>"></td>
          <td width="12%" align="center" class="tdc"><strong>等级</strong></td>
          <td width="12%" align="left" class="style3"><select name="grade" id="grade">
            <option value="">不限</option>
            <%
            for(int i =0;i < BBSMng.gradeDes.length;i ++)
            {
               String se = "";
               if(grade.equals(i+""))
                se = "selected";
            %>
            <option value="<%=i%>" <%=se%>><%=BBSMng.gradeDes[i]%></option>
            <%
            }
            %>
          </select></td>
          <td width="51%" align="left" class="style3"><input name="Submit" type="submit" value="查找"></td>
        </tr>
      </table></td>
    </tr>
    <tr >
      <td width="4%" align="center" nowrap class="tdc"><strong>序号</strong></td>
      <td width="8%" align="center" nowrap class="tdc"><strong>用户名</strong></td>
      <td width="8%" height="25" align="center" nowrap class="tdc"><strong>昵称 </strong></td>
      <td width="8%" height="25" align="center" nowrap class="tdc"><strong> 等级</strong></td>
      <td width="5%" align="center" nowrap class="tdc"><strong>主题帖数</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>推荐贴数</strong></td>
         <td width="5%" align="center" nowrap class="tdc"><strong>删除主题数</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>回帖数</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>删除回帖数</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>原金币</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>新金币</strong></td>
        <td width="5%" align="center" nowrap class="tdc"><strong>总金币</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   BbsuserTemp bu = (BbsuserTemp)qr.resultList.get(i);
   int dt = SysCommonFunc.getNumberForSql("select count(*) from bbs where ischeck='2' and re_id=0 and user_id="+bu.getHyid()).intValue();
   int drt = SysCommonFunc.getNumberForSql("select count(*) from bbs where ischeck='1' and re_id>0 and user_id="+bu.getHyid()).intValue();
%>
    <tr>
      <td width="4%" align="center"><%=(i+1)+(cpage-1)*pagesize%></td>
      <td width="8%" align="center"><a href='edithyinfo.jsp?id=<%=bu.getHyid()%>' target="_blank"><%=bu.getUsername()%></a></td>
      <td width="8%" height="25" align="center"><%=bu.getLcname()%></td>
      <td width="8%" height="25" align="center"><%=bu.getMoneys()%></td>
        <%
            long topicold = bu.getTopics()==null?0:bu.getTopics();
            long topicnew = bu.getTopicsnew()==null?0:bu.getTopicsnew();
        %>
       <td width="5%" align="center"><a href="bbs_usertopic.jsp?bizaction=01&hyid=<%=bu.getHyid()%>&ischeck=1" target="_blank"><%=topicold+topicnew%></a></td>
        <td width="5%" align="center"><a href="bbs_usertopic02.jsp?bizaction=02&hyid=<%=bu.getHyid()%>" target="_blank">
            <%=bu.getCommend()==null?0:bu.getCommend()%></a></td>
        <td width="5%" align="center"><a href="bbs_usertopic04.jsp?bizaction=01&hyid=<%=bu.getHyid()%>&ischeck=2" target="_blank">
            <%=bu.getDeltopics()==null?0:bu.getDeltopics()%></a></td>
        <td width="5%" align="center">
            <%
                 long replynum = bu.getReplynum()==null?0:bu.getReplynum();
				 long resum = bu.getResum()==null?0:bu.getResum();	
            %>
            <a href="bbs_usertopic03.jsp?bizaction=03&hyid=<%=bu.getHyid()%>&ischeck=0" target="_blank"><%=resum+replynum%></a>
        </td>

        <td width="5%" align="center">
            <a href="bbs_usertopic03.jsp?bizaction=03&hyid=<%=bu.getHyid()%>&ischeck=1" target="_blank"><%=bu.getDelresum()==null?0:bu.getDelresum()%></a>
        </td>
        <td width="5%" align="center" ><%=bu.getMoneys()==null?0:bu.getMoneys()%> </td>
        <td width="5%" align="center" ><%=bu.getMoneynew()==null?0:bu.getMoneynew()%> </td>
        <%
            long moneyold = bu.getMoneys()==null?0:bu.getMoneys();
            long moneynew = bu.getMoneynew()==null?0:bu.getMoneynew();
        %>
        <td width="5%" align="center" ><%=moneyold+moneynew%> </td>
    </tr>
<%
}
%>

    <tr >
      <td height="25" colspan="13" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="25" colspan="13" align="center" valign="middle"><%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;&nbsp;<font color='000064'>转到第
<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">
页</font>&nbsp;&nbsp;
<input name="button" type='button' class=button style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19' onclick=turn(document.go2to.turnpage.value) value='确 定'></td>
    </tr>
    <tr >
      <td height="25" colspan="13" align="center" valign="middle">&nbsp;</td>
    </tr>
                                  <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
</table>
 </form>


</body>
</html>
<script>
function test(tmh,bid)
{

//  alert(tn);
//  alert(tcn);
//  alert(tnr);
//  alert(tm);
//  alert(bid);
  document.go2to.bizaction.value="mod";
//  document.go2to.tnh.value = tnh;
//  document.go2to.tcnh.value = tcnh;
//  document.go2to.tnrh.value = tnrh;
  document.go2to.tmh.value = tmh;
  document.go2to.bid.value = bid;
  document.go2to.submit();
}
</script>

