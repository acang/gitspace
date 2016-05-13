<%@ page contentType="text/html; charset=gb2312" %>
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
Product pp = null;
String mid = SysCommonFunc.getStrParameter(request,"mid");
if(mid.length() > 0)
{
    pp = ProductMng.getProduct(mid);
   if(SysCommonFunc.getStrParameter(request,"bizaction").equals("01"))
   {
      String s = ProductMng.modProduct(request,pp);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('修改服务项目成功！');</script>");
      }else
      {
        out.println("<script langauge=javascript>alert('"+s+"');</script>");
      }
   }
}
%>

<%
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       String isdel = "1";
       if(SysCommonFunc.getStrParameter(request,"bizaction").equals("del"))
         isdel ="1";
       else
         isdel = "0";
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "update  product set isdel = "+isdel+" where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }
%>

<%
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 10;

   ///得到用户列表
   String sql = "from Product as o order by o.isdel asc, o.flag  asc";

   QueryResult qr = null;
   if(tcount > 0)
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage,tcounts);
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
</script>

</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">维护服务项目信息</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="productlist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value=""/>
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="35" height="25" align="center" nowrap class="tdc"></td>
      <td width="100" height="25" align="center" nowrap class="tdc"><strong>服务名称</strong></td>
      <td width="80" height="25" align="center" nowrap class="tdc"><strong>服务金额</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>服务时间</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>时间类型</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>会员等级</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>会员标志</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>服务简称</strong></td>
      <td width="87" height="25" align="center" nowrap class="tdc"><strong>服务说明</strong></td>
      <td width="69" height="25" align="center" nowrap class="tdc"><strong>删除标志</strong></td>
      <td width="48" height="25" align="center" nowrap class="tdc"><strong>排序号</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Product p = (Product)qr.resultList.get(i);
   String datetype = "未知";
   if(p.getDatetype() != null && p.getDatetype().intValue() ==1)
      datetype = "年";
   if(p.getDatetype() != null && p.getDatetype().intValue() == 0)
      datetype = "月";
   if(p.getDatetype() != null && p.getDatetype().intValue() == 2)
      datetype = "周";

%>
    <tr>
      <td height="25" align="center"><input type="checkbox" name="delid" value=<%=p.getId()%>>        </td>
      <td height="25" align="center" nowrap="nowrap"><a href='productlist.jsp?mid=<%=p.getId()%>'><%=p.getName()%></a></td>
      <td height="25" align="center"><%=p.getTransamt()%></td>
      <td height="25" align="center"><%=p.getServiceyear()%></td>
      <td height="25" align="center"><%=datetype%></td>
      <td height="25" align="center"><%=p.getSqdj() == null ? "":p.getSqdj()%></td>
      <td height="25" align="center"><%=p.getFlag() == null ? "":p.getFlag().toString()%></td>
      <td height="25" align="center"><%=p.getSimplename() == null ? "":p.getSimplename()%></td>
      <td height="25" align="center"><%=p.getPromotion()%></td>
      <td height="25" align="center"><%=p.getIsdel().intValue() == 0 ? "正常":"已删除"%></td>
      <td height="25" align="center"><%=p.getOrderno() == null ? "":p.getOrderno().toString()%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="12" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="12" align="center" valign="middle">
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="12" align="center">
          <input type="submit" name="Submit3" value="删除" class="button1" onClick="return test('del');">
          <input type="submit" name="Submit3" value="恢复" class="button1" onClick="return test('add');"></td>
    </tr>
    <tr >
      <td height="30" colspan="12" align="center">&nbsp;</td>
    </tr>
</table>
 </form>


<%

//out.println("<script langauge=javascript>alert('您已经成功的修改了该用户的信息！');</script>");
if(mid.length() > 0)
{
%>
<form name="form1" method="post" action="productlist.jsp">
  <input type="hidden" name="bizaction" value="01">
    <input type="hidden" name="mid" value="<%=mid%>">
<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
  <tr >
    <td height="30" align="center" class="tdc"><strong>服务名称</strong></td>
    <td height="30" align="left"><input name="name" type="text" id="name" value="<%=pp.getName()%>">    </td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>服务金额</strong></td>
    <td height="30" align="left"><input name="transamt" type="text" id="transamt" value="<%=pp.getTransamt()%>">    </td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>服务时间</strong></td>
    <td height="30" align="left"><input name="serviceyear" type="text" id="serviceyear" value="<%=pp.getServiceyear()%>"></td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>时间类型</strong></td>
    <td height="30" align="left"><select name="datetype" id="datetype">
      <option value="1" <%if(pp.getDatetype() != null && pp.getDatetype().intValue() ==1) out.print("selected");%>>年</option>
      <option value="0" <%if(pp.getDatetype() != null && pp.getDatetype().intValue() ==0) out.print("selected");%>>月</option>
      <option value="2" <%if(pp.getDatetype() != null && pp.getDatetype().intValue() ==2) out.print("selected");%>>周</option>
    </select>    </td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>会员等级</strong></td>
    <td height="30" align="left"><input name="sqdj" type="text" id="sqdj" value="<%=pp.getSqdj() == null ? "":pp.getSqdj()%>"></td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>会员标志</strong></td>
    <td height="30" align="left"><input name="flag" type="text" id="flag" value="<%=pp.getFlag() == null ? "":pp.getFlag().toString()%>"></td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>服务简称</strong></td>
    <td height="30" align="left"><input name="simplename" type="text" id="simplename" value="<%=pp.getSimplename() == null ? "":pp.getSimplename()%>"></td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>服务说明</strong></td>
    <td height="30" align="left"><input name="promotion" type="text" id="promotion" value="<%=pp.getPromotion() == null? "":pp.getPromotion()%>">    </td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>排序号</strong></td>
    <td height="30" align="left"><input name="orderno" type="text" id="orderno" value="<%=pp.getOrderno() == null? "":pp.getOrderno().toString()%>">    </td>
  </tr>
  <tr >
    <td height="30" colspan="2" align="center"><input type="reset" name="Submit" value="重置"  class="button1">

      <input type="submit" name="Submit2"  class="button1" value="提交" onClick="return check();">    </td>
  </tr>
</table>
<br>
</form>

<%
}
%>

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
