<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.web.bean.*"%>
<%
String cpages = request.getParameter("cpage");
int cpage = 1;
if(cpages != null)
   cpage = Integer.parseInt(cpages);
int pagesize = 10;
String channelid = request.getParameter("channelid");
if(channelid == null)
  channelid = "0";

String[] delid = request.getParameterValues("delid");
String opaction = request.getParameter("opaction");
if(delid != null && delid.length >0 && opaction.equals("del"))
{
   String[] sql = new String[delid.length];
   for(int i =0;i < sql.length;i ++)
     sql[i] = "delete from news where newsid="+delid[i];
   HbmOperator.executeSql(sql);
}

if(delid != null && delid.length >0 && opaction.equals("open"))
{
   String[] sql = new String[delid.length];
   for(int i =0;i < sql.length;i ++)
   {
     sql[i] = "update  news  set useable = 0 where newsid="+delid[i];
   }
   HbmOperator.executeSql(sql);
}

if(delid != null && delid.length >0 && opaction.equals("close"))
{
   String[] sql = new String[delid.length];
   for(int i =0;i < sql.length;i ++)
     sql[i] = "update  news  set useable = 1 where newsid="+delid[i];
   HbmOperator.executeSql(sql);
}

QueryResult qr = QueryRecord.queryByHbm("from New as  o where o.chanelid = "+channelid +" order by o.newsid desc ",pagesize,cpage);

    int nTotalCount = qr.rowCount;
    int nTotalPages =qr.pageCount;   //总页数
    int nCurPage = qr.pageNum;

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
<script language=javascript src="../../script/common.js"></script>
<script language="javascript">
function del(opaction)
{
  if(opaction == "del")
  {
    if(confirm("确定要删除记录么？"))
    {
       document.turnPage.opaction.value = opaction
       document.turnPage.submit();
    }

   }
  if(opaction == "open")
  {
    if(confirm("确定要发布记录么？"))
    {
       document.turnPage.opaction.value = opaction
       document.turnPage.submit();
    }

   }
  if(opaction == "close")
  {
    if(confirm("确定要禁止记录么？"))
    {
       document.turnPage.opaction.value = opaction
       document.turnPage.submit();
    }

   }
}
function selectall(it){
    var flag = it.checked ;
    for(var i=0;i<document.all.length;i++){
      if (document.all[i].tagName == "INPUT")
      {
        var box = document.all[i];
        if(box.type+""=="checkbox")
          box.checked=flag;
      }
    }
}
</script>
<link href="../../style/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<table width="100%" border="0" align="left">
  <tr>
    <td><table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="30"><img src="../images/arrow2.gif" width="11" height="11" align="absmiddle">
        新闻列表    </td>
    <td align="right">
    <%--<%--%>
       <%--if(UserMap.userAddChannel(channelid,emp,0))--%>
       <%--{--%>
    <%--%>--%>
      <%--<input name="Submit2" type="button" class="button1" value="新增频道" onClick="modalWindow('channel_add.jsp?pchannelid=<%=channelid%>',500,450);">--%>
    <%--<%--%>
       <%--}--%>
    <%--%>--%>
    <%--<%--%>
       <%--if(UserMap.userModChannel(channelid,emp))--%>
       <%--{--%>
    <%--%>--%>
        <%--<input name="Submit22" type="button" class="button1" value="修改频道" onClick="modalWindow('channel_add.jsp?channelid=<%=channelid%>',500,450);">--%>
    <%--<%--%>
       <%--}--%>
    <%--%>--%>
    <%--<%--%>
       <%--if(UserMap.userDelChannel(channelid,emp))--%>
       <%--{--%>
    <%--%>--%>
       <%--<input name="Submit" type="button" class="button1" value="删除频道" onClick="modalWindow('channel_del.jsp?channelid=<%=channelid%>',0,0);"></td>--%>
    <%--<%--%>
       <%--}--%>
    <%--%>--%>
 </tr>
  <tr>
    <td height="1" colspan="2" bgcolor="#999999"></td>
  </tr>
  <tr>
    <td height="40" colspan="2" align="right">
    <%--<%--%>
    <%--if(UserMap.userAddNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
      <%--<input name="Submit3" type="button" class="button1" value="新增新闻" onClick="modalWindow('news_add.jsp?channelid=<%=channelid%>',800,650);">--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    <%--<%--%>
    <%--if(UserMap.userFbNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
      <%--<input name="Submit23" type="button" class="button1" value="发布新闻" onClick="del('open')">--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    <%--<%--%>
    <%--if(UserMap.userJzNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
      <%--<input name="Submit24" type="button" class="button1" value="禁止新闻" onClick="del('close')">--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    <%--<%--%>
    <%--if(UserMap.userDelNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
      <%--<input name="Submit25" type="button" class="button1" value="删除新闻" onClick="del('del')">--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    </td>

  </tr>
</table></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="1" colspan="2" bgcolor="#999999"></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td><form action="" method="POST" name="turnPage">
    <input type="hidden" name="cpage" value="<%=cpage%>">
    <input type="hidden" name="pagesize" value="<%=pagesize%>">
    <input type="hidden" name="opaction" value="del">
	<input type="hidden" name="j_TotalPages" value="<%=qr.pageCount%>">
<table width="100%" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
  <tr valign="middle" bgcolor="#f7f7f7">
    <td width="26" align="center">
      <input type="checkbox" name="delall" value="checkbox" onClick="selectall(this);"></td>
    <td width="54" height="28" align="center"><strong> 编号</strong></td>
    <td width="323" align="center"><strong>标题</strong></td>
    <td width="87" align="center"><strong>创建时间</strong></td>
    <td width="66" align="center"><strong>状态</strong></td>
    <td width="49" align="center"><strong>附件</strong></td>
    <td width="71" height="28" align="center"><strong>操作</strong></td>
  </tr>

<%--<%--%>
<%--for(int i =0;i < qr.resultList.size();i ++)--%>
<%--{--%>
  <%--New news = (New)qr.resultList.get(i);--%>
<%--%>--%>
  <%--<tr valign="middle" bgcolor="#ffffff" onMouseOver="bgColor='#DDECFF'" onMouseOut="bgColor='#ffffff'">--%>
    <%--<td width="26" align="center"><input type="checkbox" name="delid" value="<%=news.getNewsid()%>"></td>--%>
    <%--<td width="54" align="center"><%=news.getNewsid()%></td>--%>
    <%--<td width="323" align="center"><%=news.getTitle()%></td>--%>
    <%--<td width="87" align="center"><%=DateTools.dateToString(news.getCreatetime())%></td>--%>
    <%--<td width="66" align="center"><%if(news.getUseable() != null && news.getUseable().intValue()==0) out.println("发布"); else out.println("禁止");%></td>--%>
    <%--<td width="49" align="center">--%>
    <%--<%--%>
    <%--if(UserMap.userModNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
      <%--<a href="javascript:modalWindow('accfile.jsp?newsid=<%=news.getNewsid()%>',660,400);" class="manager">[附件]</a>--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    <%--</td>--%>
    <%--<td width="71" height="25" align="center">--%>
    <%--<%--%>
    <%--if(UserMap.userModNews(channelid,emp))--%>
    <%--{--%>
    <%--%>--%>
    <%--<a href="javascript:" onClick="modalWindow('news_mod.jsp?newsid=<%=news.getNewsid()%>',800,650);" class="manager">[查看]</a>--%>
    <%--<%--%>
    <%--}--%>
    <%--%>--%>
    <%--</td>--%>
  <%--</tr>--%>
<%--<%--%>
<%--}--%>
<%--%>--%>
</table>
    </form></td>
  </tr>
  <tr>
    <td><table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="txt">
      <tr>
        <td>&nbsp;</td>
      </tr>
      <%if(nCurPage==1){
      if(nTotalPages>1){%>
      <tr>
        <td height="39" align="right">共 <%=nTotalPages%> 页 <%=nTotalCount%> 条记录　当前第 <%=nCurPage%> 页　|　<a class="info_link">首页</a>　|　<a class="info_link">上一页</a>　|　<a href="javascript:goPage('next','')" class="info_link">下一页</a>　|　<a href="javascript:goPage('last','')" class="info_link">尾页</a>　|</td>
      </tr>
      <%}
  else {%>
  <td height="39" align="right">共 <%=nTotalPages%> 页 <%=nTotalCount%> 条记录　当前第 <%=nCurPage%> 页　|　<a class="info_link">首页</a>　|　<a class="info_link">上一页</a>　|　<a class="info_link">下一页</a>　|　<a class="info_link">尾页</a>　|</td>
      <%}
  }
  else if(nCurPage<nTotalPages){%>
      <td height="39" align="right">共 <%=nTotalPages%> 页 <%=nTotalCount%> 条记录　当前第 <%=nCurPage%> 页　|　<a href="javascript:goPage('first','')" class="info_link">首页</a>　|　<a href="javascript:goPage('prev','')" class="info_link">上一页</a>　|　<a href="javascript:goPage('next','')" class="info_link">下一页</a>　|　<a href="javascript:goPage('last','')" class="info_link">尾页</a>　|</td>
    <%}
  else{%>
      <td height="39" align="right">共 <%=nTotalPages%> 页 <%=nTotalCount%> 条记录　当前第 <%=nCurPage%> 页　|　<a href="javascript:goPage('first','')" class="info_link">首页</a>　|　<a href="javascript:goPage('prev','')" class="info_link">上一页</a>　|　<a class="info_link">下一页</a>　|　<a class="info_link">尾页</a>　|</td>
    <%}%>
    </table></td>
  </tr>
</table>





</body>
</html>
