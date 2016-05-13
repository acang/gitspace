<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
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

  String title = SysCommonFunc.getStrParameter(request,"title");
  String biz = SysCommonFunc.getStrParameter(request,"biz");
  if(biz.equals("1"))
  {
  	if(title.trim().length() >0)
  {
     String s = WTJDMng.preGgNews(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>window.open('../../gonggao.jsp')</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"！');</script>");
      }

  }
  }
  else
  {
  if(title.trim().length() >0)
  {
     String s = WTJDMng.addGgNews(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('您已经成功添加短文！');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"！');</script>");
      }

  }
  }

  Wtjd wtjd = null;
  Bcb  bcb  = null;
  wtjd = WTJDMng.getGgNews();
  bcb = null;
  if(wtjd != null && wtjd.getAnswer() != null)
    bcb = BCBMng.getBcbFromid(wtjd.getAnswer().toString());
  String content = bcb == null? "":SysCommonFunc.getStringFromBlob(bcb.getContent());



//  String channelid = request.getParameter("channelid");
//Employee emp = (Employee)session.getAttribute(SessionNameDefine.LOGIN_USER_NAME);
//
//  String title = request.getParameter("title");
//
//  if(title != null) ///新增加
//  {
//     System.out.println("开始新增加");
//     String sontitle = request.getParameter("sontitle");
//     String author   = request.getParameter("author");
//     String starttime = request.getParameter("starttime");
//     String endtime   = request.getParameter("endtime");
//     String ishome    = request.getParameter("ishome");
//     String content   = request.getParameter("content");
//     try
//     {
//        NewsMap.addNews(title,sontitle,author,starttime,endtime,ishome,content,channelid,emp.getEdeptid()+"",emp.getName());
//     }catch(Exception e)
//     {
//         e.printStackTrace();
//     }
//     System.out.println("增加结束");
//     out.println("<script>\n");
//     out.println("alert('操作成功！');\n");
//     //out.println("alert(parent.opener.location)");
//     out.println("parent.opener.location.reload();");
//     out.println("parent.close();");
//     out.println("window.close();");
//     out.println("</script>\n");
//      System.out.println("脚本输出结束");
//     return;
//  }

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

   if (trim(document.all("title").value) == "") {
       alert('标题不可以为空，请填写！');
       document.all("title").focus();
       return false;
   }
   form1.submit();

}

function checkfrm2(frm)
{

   if (trim(document.all("title").value) == "") {
       alert('标题不可以为空，请填写！');
       document.all("title").focus();
       return false;
   }
   document.form1.biz.value = "1";
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
          <td align="center">短文发布</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>

<form action="news_add.jsp" method="POST"  name="form1" id="form1">
  <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
    <input type="hidden" name="id" value="<%=wtjd==null? "":wtjd.getId().toString()%>">
    <input type="hidden" name="biz" value="">
    <tr valign="middle">
      <td width="166" height="32" align="center" class="tdc" ><strong>标 　 题</strong></td>
      <td width="1073"><input name="title" type="text" class="input3" id="title"  style="width:90% " value="<%=wtjd == null? "":wtjd.getAsk()%>"></td>
    </tr>

    <tr valign="middle">
      <td height="27" colspan="2" align="center">
	  <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="300" toolbarSet="ALL"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><%=content%> </FCK:editor>      </td>
    </tr>
    <%
      	String islink="";
      	if (wtjd!=null && wtjd.getIslink()==0){
      		islink="checked";
      	}
       %>
    <tr valign="middle">
      <td height="40" colspan="2" align="center">
      <!-- <input name="islink" type="checkbox" id="islink" <%=islink %>>是否显示&nbsp;&nbsp;-->
      <input name="" type="button" class="button1"  value="预　览" onClick="checkfrm2();">
      &nbsp;&nbsp;
      <input name="" type="button" class="button1"  value="确　定" onClick="checkfrm();">

      </td>
    </tr> 
  </table>
</form>
</body>
</html>

