<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="com.lover.mng.WTJDMng" %>
<%@ page import="com.lover.mng.BCBMng" %>

<%
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   String wttype = "5";


   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from wtjd where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
       tcount = 0;
   }

   tcount = 0;

   int pagesize = 6;

   ///得到用户列表
   String sql = "from Wtjd as o where o.wttype = 5 order by o.stime desc";
   QueryResult qr = null;
   if(tcount > 0)
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage,false,tcount);
   else
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
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

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;

   document.go2to.submit();
}
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">训练分享</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="newslist5.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="38" align="center" class="tdc"></td>
      <td width="120" align="center" class="tdc"><strong>分享人</strong></td>
      <td width="881" height="30" align="center" class="tdc"><strong>分享内容</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
    Wtjd temp = (Wtjd)qr.resultList.get(i);
    Bcb  bcb  = null;
    if(temp != null && temp.getAnswer() != null){
        bcb = BCBMng.getBcbFromid(temp.getAnswer().toString());
    }
    String content = bcb == null? "":SysCommonFunc.getStringFromBlob(bcb.getContent());
    String s = "";
    if(content.length() >=200){
        s = content.substring(0,200)+"......";
    }else{
        s = content;
    }
%>
    <tr>
      <td align="center"><input type="checkbox" name="delid" value=<%=temp.getId()%>></td>
      <td align="center"><a href="./channel/wtnews_mod.jsp?id=<%=temp.getId()%>&wttype=<%=wttype%>"><%=temp.getAsk()%></a></td>
      <td height="30" align="left"><a href="./channel/wtnews_mod.jsp?id=<%=temp.getId()%>&wttype=<%=wttype%>"><%=s%></a></td>
    </tr>
<%
   }
%>

    <tr >
      <td height="30" colspan="4" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="4" align="center" valign="middle">
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
<font color='000064'> 转到第<input type='text' name='turnpage' size='5' maxLength='8' style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr align="center" >
      <td height="30" colspan="4"><input type="submit" name="Submit3" value="删除" class="button1" onClick="return test();">
        <a href="./channel/wtnews_mod.jsp?wttype=5" class="button1">增加新文章</a></td>
    </tr>
    <tr >
      <td height="30" colspan="4">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="4"> <div align="center">
          </div></td>
    </tr>
</table>
 </form>




</body>
</html>
<script>
function test()
{
  if(!confirm('确认删除吗？')) return false;
}
function utime(wtid,stimeid)
{
   document.ustimef.wtid.value=wtid;
   document.ustimef.stime.value = document.getElementById(stimeid).value;
   document.ustimef.submit();
}

</script>
<form name="ustimef" action="updatenewslisttime.jsp" >
          <input type="hidden" name="wtid" value="">
          <input type="hidden" name="stime" value="">
</form>

<iframe src="" width="0" height="0" name="cframe" style="display:none"></iframe>
