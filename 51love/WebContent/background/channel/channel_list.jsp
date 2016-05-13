<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%
//Employee emp = (Employee)session.getAttribute(SessionNameDefine.LOGIN_USER_NAME);
String channelid = request.getParameter("channelid");
if(channelid == null)
  channelid = "0";
//List clist = HbmOperator.list("from Channel as o where o.parentid= "+channelid+" and o.useable="+SysParaDefine.IS_MAY_USE +" order by o.sort asc,o.channelid asc");


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
function del(did)
{
  if(confirm("确定要删除该书麽？"))
  {
    document.turnPage.dbid.value = did;
    document.turnPage.submit();
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
        <td height="26"><img src="../images/arrow2.gif" width="11" height="11" align="absmiddle">
            频道列表</td>
      </tr>
      <tr>
        <td height="1" bgcolor="#999999"></td>
      </tr>
      <tr>
        <td height="40" align="right">
             <%--<%--%>
             <%--if(UserMap.userAddChannel(channelid,emp,0))--%>
             <%--{--%>
             <%--%>--%>
              <%--<input name="Submit2" type="button" class="button1" value="增加频道" onClick="modalWindow('channel_add.jsp?pchannelid=<%=channelid%>',550,450);">--%>
             <%--<%--%>
             <%--}--%>
             <%--%>--%>
             <%--<%--%>
             <%--if(UserMap.userModChannel(channelid,emp))--%>
             <%--{--%>
             <%--%>--%>
              <%--<input name="Submit22" type="button" class="button1" value="修改频道" onClick="modalWindow('channel_add.jsp?channelid=<%=channelid%>',550,450);">--%>
             <%--<%--%>
             <%--}--%>
             <%--%>--%>
             <%--<%--%>
             <%--if(UserMap.userDelChannel(channelid,emp))--%>
             <%--{--%>
             <%--%>--%>
              <%--<input name="Submit" type="button" class="button1" value="删除频道" onClick="modalWindow('channel_del.jsp?channelid=<%=channelid%>',0,0);">--%>
              <%--<%--%>
             <%--}--%>
              <%--%>--%>
              <input name="Submit" type="button" class="button1" value="发布频道" onClick="modalWindow('channel_clear.jsp',1,1);"></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><table width="100%" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
      <form action="" method="POST" name="turnPage">
      </form>
      <tr valign="middle" bgcolor="#f7f7f7">
        <td width="38" height="28" align="center"><strong> 编号</strong></td>
        <td width="116" align="center"><strong>频道名称</strong></td>
        <td width="116" align="center"><strong>唯一名称</strong></td>
        <td width="320" height="28" align="center"><strong>操作</strong></td>
      </tr>
      <%--<%--%>
<%--for(int i =0;clist != null && i < clist.size();i ++)--%>
<%--{--%>
  <%--Channel channel = (Channel)clist.get(i);--%>
<%--%>--%>
      <%--<tr valign="middle" bgcolor="#ffffff" onMouseOver="bgColor='#DDECFF'" onMouseOut="bgColor='#ffffff'">--%>
        <%--<td align="center"><%=channel.getChannelid()%></td>--%>
        <%--<td align="center"><%=channel.getChannelname()%></td>--%>
        <%--<td align="center"><%=channel.getSingname()%></td>--%>
        <%--<td width="320" height="28" align="center"><%--%>
    <%--if(UserMap.userModChannel(channel.getChannelid()+"",emp))--%>
    <%--{--%>
    <%--%>--%>
            <%--<a href="javascript:modalWindow('channel_add.jsp?channelid=<%=channel.getChannelid()%>',550,450);" class="button1">查看</a>--%>
            <%--<%--%>
    <%--}--%>
    <%--%>--%>
            <%--<%--%>
    <%--if(UserMap.userDelChannel(channel.getChannelid()+"",emp))--%>
    <%--{--%>
    <%--%>--%>
            <%--<a href="javascript:modalWindow('channel_del.jsp?channelid=<%=channel.getChannelid()%>',0,0);" class="button1">删除</a>--%>
            <%--<%--%>
    <%--}--%>
    <%--%>--%>
        <%--</td>--%>
      <%--</tr>--%>
      <%--<%--%>
<%--}--%>
<%--%>--%>
    </table></td>
  </tr>
</table>

</body>
</html>
