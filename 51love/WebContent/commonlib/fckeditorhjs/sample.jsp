<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
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
<html>
<head>
<title>
sample
</title>
</head>
<body bgcolor="#ffffff">
<form action="../common/1.jsp" method="post" name="postform" target="operation">
<div align="center">
<table width="95%" border="0" cellspacing="1" bgcolor="#2F4F9B" class=text>

    <tr>
        <td width="124" height="20" align="center" class="td">作者</td>
        <td width="795" align="left" bgcolor="#FFFFFF"><input name="author" type="text"  class="input2"  size="100" maxLength="100"style="width:100%;"></td>
    </tr>
    <tr>
        <td width="124" height="20" align="center" valign="middle" class="td"><p>正</p><p>文</p></td>
        <td align="left" bgcolor="#FFFFFF">
            <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="405" toolbarSet="Default"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>">
            </FCK:editor>
        </td>
    </tr>


  </table>
  <p align="center">
</div>
</form>
</body>
</html>
