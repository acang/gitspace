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


   List adminList = AdminMng.getAdminList();


   String czry    = SysCommonFunc.getStrParameter(request,"czry");
   String sqhy    = SysCommonFunc.getStrParameter(request,"sqhy");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");



   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 30;

   ///得到用户列表
   String sql = "from Oplog as o  where o.optype=2 ";


   if(czry.length() > 0)
   {
     sql = sql + " and o.adname = '"+czry+"'";

   }
   if(sqhy.length() > 0)
   {
     sql = sql + " and o.hyname = '"+sqhy+"'";
   }


//    Date cdate = new Date(System.currentTimeMillis());
//    String dates = DateTools.dateToString(cdate,false);
//
//   if(starttime.length() ==0)
//     starttime = dates;


   if(starttime.length() > 0)
   {
     sql = sql + " and o.opdate >= to_date('"+starttime + "','YYYY-MM-DD')";

   }

//   if(endtime.length() == 0 )
//   {
//
//       endtime = dates;
//   }

   if(endtime.length() > 0)
   {
     sql = sql + " and o.opdate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";

   }


   sql = sql + " order by o.id desc";

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
        <td align="center">文集删除日志</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchoplogarticle.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="5" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>用户名</strong></td>
                                      <td width="25%" height="22" align="left"><input name="sqhy" type="text" id="sqhy" value="<%=sqhy%>"></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>删除人</strong></td>
                                      <td width="46%" height="22" align="left"><select name="czry" id="czry">
                                        <option value="">不限</option>
                                        <%
       for(int i=0;i < adminList.size();i ++)
       {
          Admininfo temp = (Admininfo)adminList.get(i);
          String se = "";
          if(czry.equals(temp.getAdminname()))
           se = "selected";
       %>
                                        <option value="<%=temp.getAdminname()%>" <%=se%>><%=temp.getAdminname()%></option>
                                        <%
       }
       %>
                                      </select></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>起始时间</strong></td>
                                      <td height="22" align="left"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
                                      <img src="../commonlib/calendar/img.gif" width="20" height="14" id="startt"></td>
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
                                        </script>
                                        <input name="Submit" type="submit" class="button1" value="查询"></td>
                                    </tr>




                                  </table>                                </td>
                              </tr>

                              <tr >
                                <td width="8%" height="25" align="center" nowrap="nowrap" class="tdc"><strong>序号</strong></td>
                                <td width="17%" align="center" class="tdc"><strong>删除时间</strong></td>
                                <td width="18%" align="center" nowrap="nowrap" class="tdc"><strong>删除人</strong></td>
                                <td width="22%" align="center" class="tdc"><strong>用户名</strong></td>
                                <td width="35%" align="center" class="tdc"><strong>文集</strong></td>
                              </tr>
                              <%

for(int i =0;i < qr.resultList.size();i ++)
{
   Oplog oplog = (Oplog)qr.resultList.get(i);


%>

                              <tr>
                                <td width="8%" height="25" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td width="17%" align="center"><%=DateTools.dateToString(oplog.getOpdate(),true)%></td>
                                <td width="18%" align="center"><%=oplog.getAdname()%></td>
                                <td width="22%" align="center"><a href="edithyinfo.jsp?id=<%=oplog.getHyid()%>&isdel=0" target="_blank"><%=oplog.getHyname()%></a></td>
                                <td width="35%" align="center"><a href="#" onClick="MM_openBrWindow('searchoplogarticleview.jsp?cid=<%=oplog.getContentid()%>','51lover交友中心','scrollbars=yes,width=520,height=520')"><%=oplog.getOpdes()%></a></td>
                              </tr>
                              <%
}
%>


                              <tr>
                                <td height="25" colspan="5" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="5" align="center"><%
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
                                <td height="25" colspan="5" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
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
