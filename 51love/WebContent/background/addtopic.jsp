<%@ page contentType="text/html; charset=GBK"%>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK"%>
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
	Userinfo loginUser = (Userinfo) session
			.getAttribute(SysDefine.SESSION_LOGINNAME);

	String bizaction = SysCommonFunc.getStrParameter(request,
			"bizaction");
	String sortid = SysCommonFunc.getStrParameter(request, "sortid");
	String isfb = SysCommonFunc.getStrParameter(request, "isfb");
	String content = SysCommonFunc.getStrParameter(request, "content");
	String title = SysCommonFunc.getStrParameter(request, "title");
	if (bizaction.equals("01")) {
		if (loginUser == null) {
			out
					.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登陆!　');window.top.location.href='"
							+ request.getContextPath()
							+ "/index.jsp'</script>");
			return;
		}

		String s = null;
		if (content != null && content.length() > 8)
			s = BBSMng.userAddTopic(request, loginUser, content,
					sortid, title);
		else
			s = "发帖请多于8个字！";
		if (s == null) {
			out
					.println("<script langauge=javascript>alert('您发表的主题正在审核中');</script>");
			title = "";
			isfb = "isfb";
			content = "";
		} else
			out.println("<script langauge=javascript>alert('" + s
					+ "！');</script>");

	}

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
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>会员发布帖子</title>
		<link href="../background/style/css.css" rel="stylesheet"
			type="text/css">
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color: #8CABDE;
	scrollbar-highlight-color: #eeeeee;
	scrollbar-face-color: #E8F1FF;
	scrollbar-arrow-color: #8CABDE;
	scrollbar-shadow-color: #8CABDE;
	scrollbar-darkshadow-color: #eeeeee;
	scrollbar-base-color: #F0F0F0;
	scrollbar-track-color: #F2F7FF;
}
-->
</style>
		<script language="javascript">
function check()
{
   title = document.form1.title.value;
   var editor = FCKeditorAPI.GetInstance("content");
   var con = editor.EditorDocument.body.innerText;
  if(con.indexOf("www.") >= 0 ||con.indexOf(".net") >= 0 
  ||con.indexOf(".cn") >= 0 || con.indexOf(".com") >= 0 
  || con.indexOf("ftp://") >= 0 || con.indexOf("http://") >= 0 
  || con.indexOf(".org") >= 0)
  		{
			alert("发贴请不要带网址链接！");
			return false;
		}
   if(title == "")
   {
      alert("标题不能为空!");
      return false;
   }
   isfb = document.form1.isfb.value;
   if(!(isfb == ""))
   {
      alert("请不要重复发布!");
      return false;
   }

   return true;
}
</script>
	</head>
	<body>
		<form name="form1" method="post" action="addtopic.jsp"
			onSubmit=" return check();">
			<input type="hidden" name="bizaction" value="01">
			<input type="hidden" name="sortid" value="<%=sortid%>">
			<input type="hidden" name="isfb" value="<%=isfb%>" />
			<table width="100%" border="0" align="center" cellpadding="4"
				cellspacing="1" bgcolor="#CCCCCC">
				<tr>
					<td colspan="2" align="center" bgcolor="#77A9D5" class="tit09">
						发布主题帖
					</td>
				</tr>
				<tr>
					<td width="11%" align="right" bgcolor="#FFFFFF">
						<strong>主题：</strong>
					</td>
					<td width="89%" bgcolor="#FFFFFF">
						<span class="txt"> <input name="title" type="text"
								size="35" value="<%=title%>"> </span>
					</td>
				</tr>
				<tr>
					<td align="right" valign="top" bgcolor="#FFFFFF"
						style="padding-top: 6px;">
						<strong>内容：</strong>
						<br>
					</td>
					<td bgcolor="#FFFFFF">
						<FCK:editor id="content" basePath="<%=basePath%>"
							skinPath="<%=skinPath%>" width="100%" height="320"
							toolbarSet="Default" imageBrowserURL="<%=imageBrowserURL%>"
							linkBrowserURL="<%=linkBrowserURL%>"
							flashBrowserURL="<%=flashBrowserURL%>"
							imageUploadURL="<%=imageUploadURL%>"
							linkUploadURL="<%=linkUploadURL%>"
							flashUploadURL="<%=flashUploadURL%>"><%=content%></FCK:editor>
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center" bgcolor="#FFFFFF">
						<input name="image" type="image" src="../images/btn_fbtz.gif"
							width="94" height="28" />
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>
