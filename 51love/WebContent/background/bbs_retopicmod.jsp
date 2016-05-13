<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
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
String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
String id = SysCommonFunc.getStrParameter(request,"id");
Bb b = BBSMng.getBBSById(id);
Bcb bcb = null;

if(bizaction.equals("01"))
{
   String s = BBSMng.modReTopic(b,request);
   if(s == null)
      out.println("<script langauge=javascript>alert('修改回复成功！');window.opener.location.reload();window.close();</script>");
   else
      out.println("<script langauge=javascript>alert('"+s+"！');</script>");

}
bcb = BCBMng.getBcbFromid(b.getContent().toString());
String content = bcb == null? "":SysCommonFunc.getStringFromBlob(bcb.getContent());

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
<title>修改回复内容</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<form name="form1" method="post" action="bbs_retopicmod.jsp">
<input type="hidden" name="bizaction" value="01">
<input type="hidden" name="id" value="<%=id%>"/>
</ins>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25" align="left"><span class="style11">当前主题:</span><%=b.getTitle()%></td>
  </tr>

  <tr bgcolor="#FFFFFF">
    <td height="25" align="left"><span class="style11">回复人:</span><%=b.getAuthor()%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="25" align="left"><span class="style11">回复时间:</span><%=DateTools.dateToString(b.getStime(),true)%></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25">	  <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="405" toolbarSet="NONETOOL"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><%=content%></FCK:editor>      </td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="25">
	  <input type="submit" name="Submit" value="　修改　"></td>
  </tr>
</table>
</form>
</body>
</html>
