<%@ page contentType="text/html; charset=gbk" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
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
  String newsid = request.getParameter("newsid");


  String title = request.getParameter("title");
  if(title != null) ///������
  {
     String sontitle = request.getParameter("sontitle");
     String author   = request.getParameter("author");
     String starttime = request.getParameter("starttime");
     String endtime   = request.getParameter("endtime");
     String ishome    = request.getParameter("ishome");
     String content   = request.getParameter("content");
   //  NewsMap.modNews(newsid,title,sontitle,author,starttime,endtime,ishome,content,"0","hjs");
     out.println("<script>\n");
     out.println("alert('�����ɹ���');\n");
     out.println("parent.opener.location.reload();");
     out.println("parent.close();");
     out.println("window.close();");
     out.println("</script>\n");
  }
//  New news = NewsMap.getNews(newsid);
 // Newscontent ns = NewsMap.getNewscontent(newsid);
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
function checkfrm()
{

   if (trim(document.all("title").value) == "") {
       alert('���ⲻ����Ϊ�գ�����д��');
       document.all("title").focus();
       return false;
   }


   return true;
}
</script>
	<link rel="stylesheet" type="text/css" media="all" href="../../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../../commonlib/calendar/calendar-setup.js"></script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">�޸�����</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<form name="frm" action="" method="POST" onSubmit="return checkfrm();">
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">
        <input type="hidden" name="newsid" value="newsid">
        <tr valign="middle">
          <td width="97" align="center" bordercolor="#ffffff"><strong>�� �� ��</strong></td>
          <td width="533"><input name="title" type="text" class="input3" id="title" value="<%//=news.getTitle()%>"  style="width:90% "></td>
          <td width="97"><strong>�� �� ��</strong></td>
          <td width="523" height="32"><input name="sontitle" type="text" class="input3" id="singname2" value="<%//=news.getSontitle()%>" style="width:90% "></td>
        </tr>

        <tr valign="middle">
          <td width="97" align="center" bordercolor="#ffffff"><strong>�� �� ��</strong></td>
          <td><input name="author" type="text" class="input3" id="singname3" value="<%//=news.getAuthor()%>"  style="width:90% "></td>
          <td><strong>��ҳ��ʾ</strong></td>
          <td height="27"><input name="ishome" type="checkbox" id="ishome" value="1" <%//if(news.getIshome()==1) out.println("checked");%>>
��ҳ��ʾ</td>
        </tr>
        <tr valign="middle">
          <td width="97" align="center" bordercolor="#ffffff"><strong>����ʱ��</strong></td>
          <td><input name="starttime" type="text" class="input3" id="singname4" value="<%//=DateTools.dateToString(news.getStarttime())%>" readonly>
		        <img src="../../commonlib/calendar/img.gif" width="20" height="14" id="startt"></td>
<script type="text/javascript">
    Calendar.setup({
        inputField     :    "starttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "startt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script></td>
          <td><strong>����ʱ��</strong></td>
          <td height="27"><input name="endtime" type="text" class="input3" id="singname5" value="<%//=DateTools.dateToString(news.getEndtime())%>" readonly>
      <img src="../../commonlib/calendar/img.gif" width="20" height="14" id="endt"></td>
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "endtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script>
		  </td>
        </tr>
        <tr valign="middle">
          <td height="27" colspan="4" align="center">
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
                        <%//=ns.getContent()%>            </FCK:editor>	  	  </td>
        </tr>

        <tr valign="middle">
          <td height="40" colspan="4" align="center"><input name="" type="submit" class="button1"  value="ȷ����">
            ��
              <input name="reset" type="reset" class="button1" value="�ء�д">
            ��
            <input name="close" type="button" class="button1" onClick="window.close();" value="�ء���"></td>
        </tr>
</table>
</form>
</body>
</html>
