<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>

<%
    String contextPath = request.getContextPath();
    String basePath = contextPath + "/commonlib/fckeditor/";
    String skinPath = contextPath + "/commonlib/fckeditor/editor/skins/office2003/";
    String imageBrowserURL = contextPath + "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Image&Connector=connectors/jsp/connector";
    String linkBrowserURL = contextPath + "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Connector=connectors/jsp/connector";
    String flashBrowserURL = contextPath + "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Flash&Connector=connectors/jsp/connector";
    String imageUploadURL = contextPath + "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Image";
    String linkUploadURL = contextPath + "/fckeditor/editor/filemanager/upload/simpleuploader?Type=File";
    String flashUploadURL = contextPath + "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Flash";

%>
<%

  String linkurl = SysCommonFunc.getStrParameter(request,"linkurl");
  if(linkurl.trim().length() >0)
  {
     String s = WTJDMng.addGgNewslt(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('您已经成功添加论坛文章发布！');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"！');</script>");
      }

  }

  Wtjd wtjd = null;
  wtjd = WTJDMng.getGgNews();

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
    <script language=javascript src="../../script/common.js"></script>
<script language="javascript">
function checkfrm(frm)
{

   if (trim(document.all("linkurl").value) == "") {
       alert('论坛文章地址不可以为空，请填写！');
       document.all("linkurl").focus();
       return false;
   }
   form1.submit();

}
</script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">论坛文章发布</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>

<form action="news_add_lt.jsp" method="POST"  name="form1" id="form1">
  <table width="95%"  border="1" align="left" cellpadding="0" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
    <input type="hidden" name="id" value="<%=wtjd==null? "":wtjd.getId().toString()%>">
     <%
      	String linkurls="";
      	String islink="";
      	if (wtjd!=null && wtjd.getIslink()==1){
      		islink="checked";
      		if (wtjd.getLinkurl()!=null){
      			linkurls=wtjd.getLinkurl();
      		}
      	}
       %>
    <tr valign="middle">
      <td width="166" height="32" align="center" class="tdc" ><strong>论坛文章地址</strong></td>
      <td width="1073"><input name="linkurl" type="text" class="input3" id="linkurl"  style="width:90% " value="<%=linkurls%>"></td>
    </tr>
     <tr valign="middle">
      <td height="40" colspan="2" align="center">
      <!--<input name="islink" type="checkbox" id="islink"  <%=islink %>>是否显示&nbsp;&nbsp;-->
      <input name="" type="button" class="button1"  value="确　定" onClick="checkfrm();">

      </td>
    </tr> 
  </table>
</form>
</body>
</html>

