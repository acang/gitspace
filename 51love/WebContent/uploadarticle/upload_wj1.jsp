<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51lover交友中心</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript"> 
function check()
{
if (checkspace(document.form1.title.value))
{
alert('文章标题不能为空');
document.form1.title.focus();
return false;
}
if (checkspace(document.form1.article.value))
{
alert('文章内容不能为空');
document.form1.article.focus();
return false;
}
if (document.form1.article.value.length>3000)
{
alert('文章内容长度不能超过3000字！');
document.form1.article.focus();
return false;
}
//if (((document.form1.title.value.indexOf("script")>=0)||(document.form1.title.value.indexOf("<")>=0)||(document.form1.title.value.indexOf(">")>=0) ||(document.form1.title.value.indexOf("iframe")>=0)))
//{
//alert('您输入的文章标题含有违法内容,请重填');
//document.form1.title.focus();
//return false;
//}
//if (((document.form1.article.value.indexOf("script")>=0)||(document.form1.article.value.indexOf("<")>=0)||(document.form1.article.value.indexOf(">")>=0) ||(document.form1.article.value.indexOf("iframe")>=0)))
//{
//alert('您输入的文章标题含有违法内容,请重填');
//document.form1.article.focus();
//return false;
//}

return true;
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</script>


</head>

<body>
<%
	String contextPath = request.getContextPath();
	String basePath = contextPath + "/commonlib/fckeditor/";
	String skinPath = contextPath
			+ "/commonlib/fckeditor/editor/skins/office2003/";
	String imageBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Image&Connector=connectors/jsp/connector";
	String linkBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Connector=connectors/jsp/connector";
	String flashBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Flash&Connector=connectors/jsp/connector";
	String imageUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Image";
	String linkUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=File";
	String flashUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Flash";
%>

<%
///作上传
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
  if(loginUser == null)
  {
    out.println("登录失效，请重新登录");
    return;
  }
  if(request.getParameter("bj") != null) ///需要上传
  {
  	  if(request.getHeader("referer")==null)
		{
			response.setStatus(403);
			response.sendError(403);
			return;
		}else{
			if (request.getHeader("referer").toString().toLowerCase().indexOf("51lover.org") < 0){
				return;
			}
		}
      String s = GRZQMng.userAddArticle(request,loginUser);
      if(s == null)
      {
          out.println("<script language='javascript'>alert('您已经成功上传了个人文集!');window.parent.parent.location.href='../gryj.jsp?upload=1';</script>");
        return;
      }
      else{
            out.println("<script language='javascript'>alert('"+s+"!');window.parent.parent.location.href='../gryj.jsp';window.close();</script>");
        }
  }
  if(request.getParameter("delid") != null) //删除
  {
      String s = GRZQMng.userDelArticle(request,loginUser);
      OpLogMng.addOpLog(loginUser,null,request,OpLogMng.OP_LOG_U_R_ARTICLE);
      if(s==null)
        out.println(" <script language='javascript'>alert('您已经成功删除了个人文集!');window.parent.location.reload();</script>");
      else
        out.println(" <script language='javascript'>alert('"+s+"!');window.opener.location.href='../gryj.jsp';window.close();</script>");

      return;
  }
%>
<form name="form1" id="wenjiform" method="post" action="upload_wj1.jsp?bj=1" onSubmit="return check();">
    <input type="hidden" name="hyid" value="<%=loginUser.getHyid()%>"/>
<table width="900" border="0" cellspacing="0" cellpadding="0" align="center">
  <tr>
    <td><img src="images/111.gif" width="900" height="9" /></td>
  </tr>
  <tr>
    <td background="images/222.gif"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" valign="top">&nbsp;</td>
        <td valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#234D74">
          <tr>
            <td colspan="2" align="center" bgcolor="#5B8EBD" class="tit13"><span class="tit08"><%=loginUser.getLcname()%></span> 文集添加</td>
            </tr>
          <tr>
            <td colspan="2" align="right" bgcolor="#D6E6F3" class="tit12">&nbsp;</td>
            </tr>
          <tr>
            <td width="11%" align="right" bgcolor="#D6E6F3" class="tit12"><font color="#000000">文集标题：</font></td>
            <td width="89%" bgcolor="#FFFFFF">
              <input name="title" type="text" class="input02" id="title"  style="width:750px;">            </td>
          </tr>

          <tr>
            <td align="right" bgcolor="#D6E6F3" class="tit12"><font color="#000000">内&nbsp;&nbsp;&nbsp;&nbsp;容：</font></td>
            <td bgcolor="#FFFFFF">

			  			<FCK:editor id="article" basePath="<%=basePath%>"
							skinPath="<%=skinPath%>" width="95%" height="400"
							toolbarSet="ALLARTICLE" imageBrowserURL="<%=imageBrowserURL%>"
							linkBrowserURL="<%=linkBrowserURL%>"
							flashBrowserURL="<%=flashBrowserURL%>"
							imageUploadURL="<%=imageUploadURL%>"
							linkUploadURL="<%=linkUploadURL%>"
							flashUploadURL="<%=flashUploadURL%>">
						</FCK:editor>
            </td>
          </tr>
          <tr>
            <td height="40" colspan="2" align="center" bgcolor="#FFFFFF">
              <img src="images/preview.gif" border="0" onclick="yulan()">
                &nbsp;&nbsp;&nbsp;&nbsp;
              <img  src="images/btn_tj.gif" border="0" onclick="tijiao()"/>

</td>
            </tr>
        </table></td>
        <td width="11" valign="top">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/333.gif" width="900" height="10" /></td>
  </tr>
</table>


</form>
<script type="text/javascript">
    function yulan(){
        var form =document.getElementById("wenjiform");
            form.action = "../preview.jsp";
            form.target = "_blank";
            form.submit();
    }

    function tijiao(){
        var form =document.getElementById("wenjiform");
        form.action = "upload_wj1.jsp?bj=1";
        form.target = "";
        form.submit();
    }
</script>


</body>
</html>


