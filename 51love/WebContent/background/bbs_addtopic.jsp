<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%
    String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
    if(bizaction.equals("01"))
    {
        String s = BBSMng.addTopTopic(request);
        if(s == null)
        {
           out.println("<script langauge=javascript>alert('发表帖子成功！');</script>");
           response.sendRedirect("bbs_admin.jsp");
           return;
         }
         else
          out.println("<script langauge=javascript>alert('"+s+"！');</script>");

    }
    List sortList = BBSMng.getAllSort();

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
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>文章管理</title>
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
        <td align="center">发布主题</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
<form name="form1" method="post" action="bbs_addtopic.jsp">
<input type="hidden" name="bizaction" value="01">
  <tr align="center" bgcolor="#FFFFFF">
    <td width="14%" align="center" class="tdc"><span class="style11"><strong>所属分区</strong></span></td>
    <td width="86%" height="25" align="left"><select name="sortid" id="sortid">
<%
for(int i =0;i < sortList.size();i ++)
{
   Bbssort bsort = (Bbssort)sortList.get(i);
   String se = "";
   if(bsort.getSortname().equals("新闻热点"))
      se = "selected";
%>
<option value="<%=bsort.getId()%>" <%=se%>><%=bsort.getSortname()%></option>
<%
}
%>
</select></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td align="center" class="tdc"><span class="style11"><strong>主　　题</strong></span></td>
    <td height="25" align="left"><input name="title" type="text" size="35"></td>
  </tr>

  <tr align="center" bgcolor="#FFFFFF">
    <td height="25" colspan="2">
        <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="320" toolbarSet="Default"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><%=""%>
        </FCK:editor>      </td>
    </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td>&nbsp;</td>
    <td height="25">
	  <input type="submit" name="Submit" value="发表帖子">　　      </td>
  </tr>
  </form>
</table>
</body>
</html>
