<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%


   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("01"))
   {
      String s = ProductMng.addProduct(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('您已经成功添加服务项目！');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"！');</script>");
      }
   }
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
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">增加服务项目</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<form name="form1" method="post" action="addproduct.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td height="30" align="center" class="tdc"><strong>服务名称</strong></td>
      <td height="30" align="left"><input name="name" type="text" id="name">      </td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>服务金额</strong></td>
      <td height="30" align="left"><input name="transamt" type="text" id="transamt">      </td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>服务时间</strong></td>
      <td height="30" align="left"><input name="serviceyear" type="text" id="serviceyear">
      （输入数字）</td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>时间类型</strong></td>
      <td height="30" align="left"><select name="datetype" id="datetype">
          <option value="1">年</option>
          <option value="0">月</option>
          <option value="2">周</option>
        </select>      </td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>会员等级</strong></td>
      <td height="30" align="left"><input name="sqdj" type="text" id="sqdj"></td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>会员标志</strong></td>
      <td height="30" align="left"><input name="flag" type="text" id="flag"></td>
    </tr>
    <tr >
      <td height="30" align="center" class="tdc"><strong>服务简称</strong></td>
      <td height="30" align="left"><input name="simplename" type="text" id="simplename"></td>
    </tr>
    
    <tr >
      <td height="30" align="center" class="tdc"><strong>服务说明</strong></td>
      <td height="30" align="left"><input name="promotion" type="text" id="promotion">      </td>
    </tr>
    
    <tr >
      <td height="30" align="center" class="tdc"><strong>排序号</strong></td>
      <td height="30" align="left"><input name="orderno" type="text" id="orderno">      </td>
    </tr>
    <tr >
      <td height="30" colspan="2" align="center">
        <input type="submit" name="Submit2"  class="button1" value="提交" onClick="return check();">      </td></tr>
  </table>
</form>

</body>
</html>
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

