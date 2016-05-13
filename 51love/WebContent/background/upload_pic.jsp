<%@ page contentType="text/html; charset=GBK" %>
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
  String hyid = SysCommonFunc.getStrParameter(request,"hyid");
  String isdel = SysCommonFunc.getStrParameter(request,"isdel");
%>
<html>
<head>
<title>上传</title>
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
<script language='javascript'>
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function test()
{
if (checkspace(document.form1.file1.value))
{
alert ('test');
return false;
}
var fileext;
              var my_value;
              my_value=document.form1.file1.value;
              fileext=my_value.substr(my_value.length-3,3);
              fileext=fileext.toUpperCase();
              if ((fileext != "GIF") && (fileext != "JPG") && (fileext != "BMP")){
                  alert("请选择bmp或gif或jpg图片文件!");
                  return false;}
}
</script>
<body>
<table width="85%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
<form name="form1" method="post" action="upload_pic_do.jsp" enctype="multipart/form-data" target="cframe" >
<tr>
  <td height="39">&nbsp;</td>
</tr>
<tr><td class="tdc">选择文件：
  <input type="file"    name="file1" style="HEIGHT: 22px; WIDTH: 200px"
      size=50><input type="hidden" name="hyid" value="<%=hyid%>"><input type="hidden" name="isdel" value="<%=isdel%>"></td></tr>
<tr><td align="center"><input type="submit" class=BlueSubmitButton  name="Submit" value="上传" ></td>
</tr>
</form>
<tr><td></td></tr>
</table>
</body>
</html>
<iframe name="cframe" style="display:none" width="0" height="0"></iframe>

