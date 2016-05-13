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
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);


    String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
    String bbsid = SysCommonFunc.getStrParameter(request,"bbsid");
    String isfb   = SysCommonFunc.getStrParameter(request,"isfb");
    String content = SysCommonFunc.getStrParameter(request,"content");
    if(bizaction.equals("01"))
    {
  if(loginUser == null)
  {
    out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登陆!　');window.top.location.href='"+request.getContextPath()+"/index.jsp'</script>");
    return;
  }

//    String str="ceponline163@yahoo.com.cn";
//    Pattern pattern = Pattern.compile("[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+",Pattern.CASE_INSENSITIVE);
//    Matcher matcher = pattern.matcher(str);
//    System.out.println(matcher.matches());

String mailreg = "[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+";
String preg    = "\\d{6,}";

//    String str = "\\d{6,}";
//    Pattern pattern = Pattern.compile(str,Pattern.CASE_INSENSITIVE);
//    Matcher matcher = pattern.matcher("123");
//    System.out.println(matcher.matches());

//        String s = null;
//        if(content != null && content.length() >8)
//          s = BBSMng.userAddReTopic(request,loginUser,content,bbsid);
//        else
//          s = "回帖请多于8个字！";
        String s = null;
        if(content == null)
          content = "";
        String tempc=content.replaceAll("<p>","");
        tempc = tempc.replaceAll("</p>","");
        //System.out.println(tempc);
        if(tempc == null || tempc.length() < 10)
        {

           s = "回帖请多于10个字！";
        }
        else
        {
           java.util.regex.Pattern pattern1 = java.util.regex.Pattern.compile(mailreg,java.util.regex.Pattern.CASE_INSENSITIVE);
           java.util.regex.Pattern pattern2 = java.util.regex.Pattern.compile(preg,java.util.regex.Pattern.CASE_INSENSITIVE);
           if(pattern1.matcher(content).matches() || pattern2.matcher(content).matches())
             s = "回帖中有疑似联系方式，请重新填写";
           else
             s = BBSMng.userAddReTopic(request,loginUser,content,bbsid);

        }


        if(s == null)
        {
           out.println("<script langauge=javascript>alert('发送成功');</script>");
           out.println("<script langauge=javascript>parent.location.reload();</script>");
           isfb = "isfb";
           content = "";
         }
         else
          out.println("<script langauge=javascript>alert('"+s+"！');</script>");

    }

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
<title>会员发布帖子</title>
<link href="../background/style/css.css" rel="stylesheet" type="text/css">
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
<script language="javascript">
function check()
{
   isfb = document.form1.isfb.value;
   if(!(isfb == ""))
   {
      alert("请不要重复发布!");
      return false;
   }
   return true;
   
  var editor = FCKeditorAPI.GetInstance("content");
  var con = editor.EditorDocument.body.innerText;
  if(con.indexOf("www.") >= 0 ||con.indexOf(".net") >= 0 
  ||con.indexOf(".cn") >= 0 || con.indexOf(".com") >= 0 
  || con.indexOf("ftp://") >= 0 || con.indexOf("http://") >= 0 
  || con.indexOf(".org") >= 0)
  		{
			alert("回帖请不要带网址链接！");
			return false;
		}
}
</script>
</head>
<body>
<form name="form1" method="post" action="addretopic.jsp" onSubmit=" return check();">
<input type="hidden" name="bizaction" value="01">
<input type="hidden" name="bbsid" value="<%=bbsid%>">
<input type="hidden" name="isfb" value="<%=isfb%>"/>
<table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
  <tr>
    <td align="center" bgcolor="#95BDDC" class="tit09">我要回复</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF" style="padding-top:6px;">	  <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="150" toolbarSet="NONETOOL"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><%=content%></FCK:editor></td>
  </tr>
  <tr>
    <td align="center" bgcolor="#FFFFFF">
        <input name="image" type="image" src="../images/btn_qjhf.gif" width="94" height="28" /></td>
  </tr>
</table>
</form>
</body>
</html>
