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
   String modeTitle = "";
    String sql = "from Bb as o where o.userId = "+ hyid+ " and o.reId = 0";


   if(ischeck.length() > 0)
   {
      sql = sql + " and ischeck='"+ischeck+"'";
   }

	sql = sql + " order by o.stime desc";


      if(tcount > 0){
          qr = QueryRecord.queryByHbm(sql,pagesize,cpage,false,tcount);
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
        <td align="center"><%=modeTitle%></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="bbs_usertopic.jsp">
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
      <td width="5%" height="25" align="center" class="tdc"><strong>被回帖数</strong></td>
      <td width="10%" height="25" align="center" class="tdc"><strong>金币数</strong></td>
    </tr>
<%

String sqll ="";
DynaBean db2= null;
for(int i =0;i < qr.resultList.size();i ++)
{
   Bb b = (Bb)qr.resultList.get(i);
   String title = b.getTitle();
   if(b.getReId() != null && b.getReId().longValue() > 0)
   {
       Bcb bcb = BCBMng.getBcbFromid(b.getContent().toString());
       if(bcb != null)
         title = SysCommonFunc.getStringFromBlob(bcb.getContent());
       if(title.length() > 56)
         title = title.substring(0,56)+"<font color=red>…</font>";
   }
        sqll = "select count(*) as resum from bbs  where ischeck='0' and  re_Id = "+b.getId();
      System.out.println("sqll = " + sqll);
        List list = QueryRecord.query(sqll);
        db2 =(DynaBean)list.get(0);


%>
    <tr>
      <td  align="center"><%=(i+1)+(cpage-1)*pagesize%></td>
      <td  height="25" align="center"><a href='edithyinfo.jsp?id=<%=b.getUserId()%>' target="_blank"><%=b.getUserName()%></a></td>
      <td height="25" align="left"><a href="bbs_topic.jsp?id=<%=b.getId()%>" target="_blank"><%=title%></a></td>
      <td  align="center"><%=DateTools.dateToString(b.getStime(),true)%></td>
      <td width="5%" height="25" align="center" class="tdc"><%=db2.get("resum")==null?"0":db2.get("resum")%></td>
      <td height="25" align="center">100</td>
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
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;金币总数<%=totalCount*100%>

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
