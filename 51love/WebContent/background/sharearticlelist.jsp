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
    Admininfo adminLeft = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
	int flag = 2;
	if(adminLeft.getFlag() != null)
	   flag = adminLeft.getFlag().intValue();
   
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("01"))
   {
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from sharearticle where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }
   }

   List sharelist = SharearticleMng.getSharearticleList();


   String orderid = SysCommonFunc.getStrParameter(request,"orderid");

   String searchName  	= SysCommonFunc.getStrParameter(request,"sqhy");
   String searchTitle   = SysCommonFunc.getStrParameter(request,"sqtitle");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);




   int pagesize = 20;

   ///得到用户列表
   String sql = "from Sharearticle as o where 1=1 ";

   if(searchName.length() > 0)
	     sql = sql + " and o.name='"+searchName+"'";
   if(searchTitle.length() > 0)
	     sql = sql + " and o.title='"+searchTitle+"'";   
    Date cdate = new Date(System.currentTimeMillis());
    String dates = DateTools.dateToString(cdate,false);

    if(starttime.length() ==0){
     cdate.setYear(cdate.getYear()-2);
     starttime=DateTools.dateToString(cdate,false);
    }
    if(endtime.length() ==0)
     endtime = dates;

   if(starttime.length() > 0)
     sql = sql + " and o.inserttime >= to_date('"+starttime + "','YYYY-MM-DD')";
   if(endtime.length() > 0)
     sql = sql + " and o.inserttime <= to_date('"+endtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";

   
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

function valite(){
   var flag=<%=flag%>;
   /*if (flag==6){
	   var nowDate=new Date();
	   nowDate.setYear(nowDate.getYear() - 2);
	   var startDate=document.getElementById("starttime").value;
	   var dateArr = startDate.split("-");
	   var startDateCom=new Date(dateArr[0],dateArr[1]-1,parseInt(dateArr[2])+1);
	   if (startDateCom<nowDate){
	      alert("您的权限不足，不能查询2年前的订单！");
	   	  return false;
	   }else{
	   	  return true;
	   }
   }else{
   	   return true;
   }*/
   var nowDate=new Date();
   nowDate.setYear(nowDate.getYear() - 2);
   var startDate=document.getElementById("starttime").value;
   var dateArr = startDate.split("-");
   var startDateCom=new Date(dateArr[0],dateArr[1]-1,parseInt(dateArr[2])+1);
   if (startDateCom<nowDate){
      document.getElementById("starttime").value=nowDate.format('yyyy-MM-dd');
   }
   return true;
}

Date.prototype.format = function(format)
{
 var o = {
 "M+" : this.getMonth()+1, //month
 "d+" : this.getDate(),    //day
 "h+" : this.getHours(),   //hour
 "m+" : this.getMinutes(), //minute
 "s+" : this.getSeconds(), //second
 "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
 "S" : this.getMilliseconds() //millisecond
 }
 if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
 (this.getFullYear()+"").substr(4 - RegExp.$1.length));
 for(var k in o)if(new RegExp("("+ k +")").test(format))
 format = format.replace(RegExp.$1,
 RegExp.$1.length==1 ? o[k] :
 ("00"+ o[k]).substr((""+ o[k]).length));
 return format;
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
        <td align="center">分享查看</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="sharearticlelist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >

                                <td height="25" colspan="10" align="left" class="tdc">
                                  <strong>分享人用户名</strong>
                                  <input name="sqhy" type="text" id="sqhy" value="<%=searchName%>">
                                  <strong>分享标题</strong>
                                  <input name="sqtitle" type="text" id="sqtitle" value="<%=searchTitle%>">
                                </td>
                              </tr>
                              
                              <tr >
                                <td height="25" colspan="10" align="left" class="tdc"><strong>分享时间</strong> 从
                                  <input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                <input name="Submit" type="submit" class="button1" value="查询" onclick="return valite()"></td>
                              </tr>

                              <tr >
                                <td width="2%" align="center" class="tdc">&nbsp;</td>
                                <td width="7%" align="center" class="tdc"><strong>序号</strong></td>
                                <td width="7%" align="center" class="tdc"><strong>用户名</strong></td>
                                <td width="7%" align="center" class="tdc"><strong>昵称</strong></td>
                                <td width="27%" align="center" class="tdc"><strong>标题</strong></td>
                                <td width="7%" align="center" class="tdc"><strong>阅读数</strong></td>
                                <td width="10%" align="center" class="tdc"><strong>分享时间</strong></td>
                                  
                              </tr>
                              <%
for(int i =0;i < qr.resultList.size();i ++)
{
   Sharearticle cart = (Sharearticle)qr.resultList.get(i);
   //String datetype = cart.getDatetype().intValue() ==1 ? "年":"月";

   Userinfo uinfo= HYRegMng.getAllUserinfoByUsername(cart.getName());
%>
                              <tr>
                                <td align="center"><input name="delid" type="checkbox" id="delid" value="<%=cart.getId()%>"></td>
                                <td align="center"><a href="javascript:MM_openBrWindow('cartview.jsp?id=<%=cart.getId()%>','dd','width=518,height=520,scrollbars=yes')"><%=i+1%></a></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=uinfo == null ? "":uinfo.getHyid().toString()%>&isdel=<%=uinfo == null ? "":uinfo.getIsdel()+""%>" target="_blank"><%=cart.getName()%></a></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=uinfo == null ? "":uinfo.getHyid().toString()%>&isdel=<%=uinfo == null ? "":uinfo.getIsdel()+""%>" target="_blank"><%=cart.getLname()%></a></td>
                                <td align="center"><%=cart.getTitle()%></td>
                                <td align="center"><%=cart.getReadnumber()%></td>
                                <td align="center"><%=DateTools.dateToString(cart.getInserttime(),true)%></td>
                              </tr>
                              <%
}
%>

                              <tr>
                                <td height="25" colspan="10" align="center"><input name="删除" type="button" id="删除" value="删除" class="button1"onClick="test();"></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center"><%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp; <font color='000064'> 转到第
<input type='text' name='turnpage' size=5 maxlength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">
页</font>&nbsp;&nbsp;
<input name="button" type='button' class=button style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19' onClick=turn(document.go2to.turnpage.value) value='确 定'></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
                </table>
 </form>



</body>
</html>
<script>
function test()
{
  if(!confirm('确认操作吗？')) return false;
  document.go2to.bizaction.value="01";
  document.go2to.submit();
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
