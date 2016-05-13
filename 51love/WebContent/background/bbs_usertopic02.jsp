<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.QueryRecord"%>
<%@ page import="com.web.bean.QueryResult"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   String hyid      = SysCommonFunc.getStrParameter(request,"hyid");
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   String ischeck = SysCommonFunc.getStrParameter(request,"ischeck");

QueryResult qr = null;
   int pagesize = 20;
   int money = 0;
    String sql = "";
	 if(bizaction.equals("02"))
   	 {
     //sql = sql + " and  o.reId =0 and o.commend =1";
     sql="select o.id,o.author,o.s_time,o.title,o.content,o.re_count,o.re_id,b.commend,o.user_id,o.user_name,o.hits,o.censor,o.ischeck,o.re_time,o.ontop,o.sortid,o.zan,b.bbsid,b.userid from bbs o " +
             "left join commend  b on o.id=b.bbsid " +
             "where o.user_Id = "+hyid+" and  b.userid = "+hyid+" and o.re_Id = 0 and b.commend = 1 order by o.ontop desc,b.commend desc,o.s_time desc";

     }

      if(tcount > 0){
          qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
      }else{
          qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
      }

           
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

</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">会员推荐主题</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="bbs_usertopic02.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="<%=bizaction%>">
                            <input type="hidden" name="hyid" value="<%=hyid%>" />
                            <input type="hidden" name="ischeck" value="<%=ischeck%>" />

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

    <tr >
      <td width="4%" align="center" class="tdc"><strong>序号</strong></td>
      <td width="11%" height="25" align="center" class="tdc"><strong>作者</strong></td>
      <td width="30%" height="25" align="center" class="tdc"><strong>主题</strong></td>
      <td width="10%" align="center" class="tdc"><strong>发布时间</strong></td>
      <td width="11%" align="center" class="tdc"><strong>推荐人</strong></td>
      <td width="10%" height="25" align="center" class="tdc"><strong> 推荐时间  </strong></td>
      <td width="10%" height="25" align="center" class="tdc"><strong>金币数</strong></td>
    </tr>
<%
    for(int i =0;i < qr.resultList.size();i ++)
{
   DynaBean db = (DynaBean)qr.resultList.get(i);
   String title = (String)db.get("TITLE");
   if(db.get("re_id") != null)
   {
       Bcb bcb = BCBMng.getBcbFromid(db.get("content").toString());
       if(bcb != null)
         title = SysCommonFunc.getStringFromBlob(bcb.getContent());
       if(title.length() > 56)
         title = title.substring(0,56)+"<font color=red>…</font>";
   }
%>

<tr>
      <td width="4%" align="center"><%=(i+1)+(cpage-1)*pagesize%></td>
      <td width="25" height="25" align="center"><a href='edithyinfo.jsp?id=<%=db.get("user_id")%>' target="_blank"><%=db.get("user_name")%></a></td>
      <td width="225" height="25" align="left">
      	<a href="bbs_topic.jsp?id=<%=db.get("id")%>" target="_blank"><%=db.get("title")%></a>
	  </td>
      <td width="125" align="center"><%=DateTools.dateToString((Date)db.get("s_time"),true)%></td>
      <td width="105" align="center"><%=db.get("censor")==null ? "":db.get("censor")%></td>
      <td width="125" height="25" align="center"><%=DateTools.dateToString((Date)db.get("re_time"),true)%></td>
      <td height="25" align="center"><%=money%></td>
    </tr>
<%
	}
%>

    <tr >
      <td height="25" colspan="9" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="25" colspan="9" align="center" valign="middle">
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;&nbsp;<font color='000064'>转到第
<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">
页</font>&nbsp;&nbsp;
<input name="button" type='button' class=button style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19' onclick=turn(document.go2to.turnpage.value) value='确 定'>
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金币总数<%=totalCount*money%>

      </td>
    </tr>
                                  <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
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
