<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.common.*"%>
<%

  String refresh = request.getParameter("action");
  if(refresh != null)
  {
     out.println("<script>\n");
     out.println("alert('更新内存成功！');\n");
     out.println("</script>\n");
    DicList.initDicList();

  }
  String dtype = request.getParameter(SessionNameDefine.DIC_TYPE_NAME);
  Dictype dt = null;
  if(dtype == null || (dt=DicTypeMap.getDicType(dtype))==null)
  {
     out.println("<script>\n");
     out.println("alert('没有找到该字典类型');\n");
     out.println("window.close();");
     out.println("</script>\n");
     return;
  }
  String did = request.getParameter(SessionNameDefine.DIC_ID_NAME);
  if(did != null)
  {
    DicMap.delDic(did);
     out.println("<script>\n");
     out.println("alert('删除成功！');\n");
     out.println("</script>\n");
  }
List list = DicMap.getDicList(dtype);
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
<link href="../style/css.css" rel="stylesheet" type="text/css">
<script language=javascript src="../script/common.js"></script>
<script language="javascript">
function del(did)
{
  document.form1.dicid.value = did;
  document.form1.submit();
}
</script>
</head>
<body>
<table width="100%" border="0" align="left">
  <tr>
    <td><table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="26"><img src="../images/arrow2.gif" width="11" height="11" align="absmiddle">【<%=dt.getTypename()%>】字典列表</td>
  </tr>
  <tr>
    <td height="1" bgcolor="#999999"></td>
  </tr>
  <tr>
    <td height="30" align="right">
	<a href="javascript:"  class="manager" onClick="modalWindow('moddic.jsp?<%=SessionNameDefine.DIC_TYPE_NAME+"="+dtype%>',550,450);">[增加字典]</a>　
	<a href="diclist.jsp?<%=SessionNameDefine.DIC_TYPE_NAME+"="+dtype+"&action=refresh"%>" class="manager">[更新内存]</a></td>
  </tr>
</table></td>
  </tr>
  <tr>
    <td><table width="100%" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
  <tr valign="middle" bgcolor="#f7f7f7">
    <td width="112" height="28" align="center"><strong> 编 号</strong></td>
    <td width="388" height="28" align="center"><strong>名 称</strong></td>
    <td width="200" height="28" align="center"><strong>操作</strong></td>
  </tr>
<%
for(int i =0; list != null && i < list.size();i ++)
{
  Dic dic = (Dic)list.get(i);
%>
  <tr valign="middle" bgcolor="#ffffff" onMouseOver="bgColor='#DDECFF'" onMouseOut="bgColor='#ffffff'">
    <td width="112" height="28" align="center"><%=dic.getDicnumber()%></td>
    <td width="388" height="28" align="center"><%=dic.getContent()%></td>
    <td width="200" height="28" align="center">

    <a href="javascript:" class="manager" onClick="modalWindow('moddic.jsp?<%=SessionNameDefine.DIC_TYPE_NAME+"="+dtype+"&"+SessionNameDefine.DIC_ID_NAME+"="+dic.getDicid().intValue()%>',550,450);">[查看]</a>
    <a href="javascript:" onClick="del('<%=dic.getDicid().intValue()%>');" class="manager">[删除]</a>
    </td>
  </tr>
<%
}
%>
</table></td>
  </tr>
</table>


<form name="form1" method="POST" action="">
  <input type="hidden" name="<%=SessionNameDefine.DIC_TYPE_NAME%>" value="<%=dtype%>">
  <input type="hidden" name="<%=SessionNameDefine.DIC_ID_NAME%>" value="">
</form>



</body>
</html>


