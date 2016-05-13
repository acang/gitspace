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
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
%>

<%
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from bbssort where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }
%>
<%
String mid = SysCommonFunc.getStrParameter(request,"mid");
//out.println("<script langauge=javascript>alert('您已经成功的修改了该用户的信息！');</script>");
Bbssort bs = null;
   if(mid.length() > 0)
      bs = BBSMng.getBbssort(mid);
   if(SysCommonFunc.getStrParameter(request,"bizaction").equals("01"))
   {
      String s = BBSMng.modBbssort(bs,request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('修改分区信息成功！');</script>");
      }else
      {
        out.println("<script langauge=javascript>alert('"+s+"');</script>");
      }
      mid = "";
      bs = null;
   }
   if(SysCommonFunc.getStrParameter(request,"bizaction").equals("02"))
   {
      String s = BBSMng.addBbssort(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('增加分区信息成功！');</script>");
      }else
      {
        out.println("<script langauge=javascript>alert('"+s+"');</script>");
      }
   }

%>
<%
   List list = BBSMng.getAllSort();
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
        <td align="center">论坛分区管理</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="bbssort_admin.jsp">

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="0" height="25" align="center" class="tdc"></td>
      <td width="0" height="25" align="center" class="tdc"><strong>排序</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong>分区名称</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong> 说明</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong> 主题数</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong>最后发表时间</strong></td>
    </tr>
<%

for(int i =0 ;i < list.size(); i ++)
{
   Bbssort bsort = (Bbssort)list.get(i);
%>
    <tr>
      <td width="0" height="25" align="center"><input type="checkbox" name="delid" value="<%=bsort.getId()%>"></td>
      <td width="0" height="25" align="center"><%=bsort.getOrders()%></td>
      <td width="0" height="25" align="center"><a href='bbssort_admin.jsp?mid=<%=bsort.getId()%>'><%=bsort.getSortname()%></a></td>
      <td width="0" height="25" align="center"><%=bsort.getContent()%></td>
      <td width="0" height="25" align="center"><%=bsort.getTopics()%></td>
      <td width="0" height="25" align="center"><%=DateTools.dateToString(bsort.getStime(),true)%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="6" align="center" valign="middle"></td>
    </tr>
    <tr >
      <td height="30" colspan="6">
          <input type="submit" name="Submit3" value="删除" class="button1" onClick="return test();">
      </td>
    </tr>
</table>
 </form>


<form name="form1" method="post" action="bbssort_admin.jsp">
  <input type="hidden" name="bizaction" value="<%=bs== null ? "02":"01"%>">
    <input type="hidden" name="mid" value="<%=mid%>">
<table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
  <tr >
    <td height="25" align="center" class="tdc"><strong>排序</strong></td>
    <td height="25" align="left"><input name="orders" type="text" id="orders" value="<%=bs == null ? "":bs.getOrders().toString()%>">    </td>
  </tr>
  <tr >
    <td height="25" align="center" class="tdc"><strong>分区名称</strong></td>
    <td height="25" align="left"><input name="sortname" type="text" id="sortname" value="<%=bs == null ? "":bs.getSortname()%>">    </td>
  </tr>

  <tr >
    <td height="25" align="center" class="tdc"><strong>说明</strong></td>
    <td height="25" align="left"><input name="content" type="text" id="content" value="<%=bs == null || bs.getContent() == null? "":bs.getContent()%>">    </td>
  </tr>
  <tr >
    <td colspan="2" align="center"><input type="submit" name="Submit2"  class="button1" value="<%=bs == null ? "增加":"修改"%>" onClick="return check();">      </td>
  </tr>
</table>
<br>
</form>


</body>
</html>
<script>
function test()
{
  if(!confirm('确认删除吗？')) return false;
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.orders.value))
{
alert('请输入排序！');
document.form1.orders.focus();
return false;
}
if (checkspace(document.form1.sortname.value))
{
alert('请输入分区名称！');
document.form1.sortname.focus();
return false;
}
if (checkspace(document.form1.content.value))
{
alert('请输入说明！');
document.form1.content.focus();
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
