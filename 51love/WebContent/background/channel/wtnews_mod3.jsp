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

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
String biz = SysCommonFunc.getStrParameter(request,"biz");
String id = SysCommonFunc.getStrParameter(request,"id");
String previewUrl = "";
    String title = "";
    if("1773446".equals(id)){
        title = "��վ����";
        previewUrl = "../../newwebpage/introduce.jsp?id=1773446";
    }
    if("1773447".equals(id)){
        title = "��վ֤��";
        previewUrl = "../../newwebpage/introduce.jsp?id=1773447";
    }
    if("1773448".equals(id)){
        title = "��������";
        previewUrl = "../../newwebpage/veiwwt.jsp?id=1773448";
    }
    if("1773449".equals(id)){
        title = "��˽����";
        previewUrl = "../../newwebpage/veiwwt.jsp?id=1773449";

    }
    if("1773450".equals(id)){
        title = "��ȫ����";
        previewUrl = "../../newwebpage/veiwwt.jsp?id=1773450";

    }
    if("1773368".equals(id)){
        title = "ѵ������";
        previewUrl = "../../newwebpage/train.jsp?id=1773368";
    }

int id2=0;
if(biz.equals("1"))
{
	if(bizaction.equals("add"))
{
     String s = WTJDMng.preWtjd(request);
     id2= Integer.parseInt(s);
      if(s.length()< 5)
      {
         out.println("<script langauge=javascript>window.open('../../veiwwt-id-"+id2+".htm');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"��');</script>");
      }

  }
}
else
{
if(bizaction.equals("add"))
{
     String s = WTJDMng.addOrModWtjd(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('����ɹ���');</script>");
         response.sendRedirect("./wtnews_mod3.jsp?id="+id);
         return ;
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"��');</script>");
      }

  }
  }

  Wtjd wtjd = null;
  Bcb  bcb  = null;

  if(id.length() >0)
     wtjd = WTJDMng.getWtjdFromid(id);
     else
     wtjd =WTJDMng.getWtjdFromid(String.valueOf(id2));
  bcb = null;
  if(wtjd != null && wtjd.getAnswer() != null)
    bcb = BCBMng.getBcbFromid(wtjd.getAnswer().toString());
  String content = bcb == null? "":SysCommonFunc.getStringFromBlob(bcb.getContent());

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
       alert('���ⲻ����Ϊ�գ�����д��');
       document.all("title").focus();
       return false;
   }


   var s =document.getElementById('title').value;
   var l = 0;
   var a = s.split("");
   for (var i=0;i<a.length;i++) {
   if (a[i].charCodeAt(0)<299) {
   l++;
   } else {
     l+=2;
   }
 }

    if(l>=37)
    {
	   alert("����������18�����֣�");
           return false;
    }

   form1.submit();
}

function checkfrm2(frm)
{

   if (trim(document.all("title").value) == "") {
       alert('���ⲻ����Ϊ�գ�����д��');
       document.all("title").focus();
       return false;
   }


   var s =document.getElementById('title').value;
   var l = 0;
   var a = s.split("");
   for (var i=0;i<a.length;i++) {
   if (a[i].charCodeAt(0)<299) {
   l++;
   } else {
     l+=2;
   }
 }

    if(l>=37)
    {
	   alert("����������18�����֣�");
           return false;
    }
   document.form1.biz.value = "1";
   form1.submit();
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
          <td align="center"><%=title%></td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>

<form action="wtnews_mod3.jsp" method="POST"  name="form1" id="form1" >
  <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
    <input type="hidden" name="id" value="<%=wtjd==null? "":wtjd.getId().toString()%>">
    <input type="hidden" name="id2" value="<%=id2%>">
    <input type="hidden" name="bcbid" value="<%=bcb == null? "":bcb.getId().toString()%>">
    <input type="hidden" name="bizaction" value="add">
    <input type="hidden" name="biz" value="">
	<input type="hidden" name="wttype" id="wttype"  value="3">
      <input name="bianhao" type="hidden"  id="bianhao"   value="1">
      <input name="title" type="hidden" class="input3" id="title"  style="width:90% " value="<%=wtjd == null? "":wtjd.getAsk()%>">
      <input name="stime" type="hidden" class="input3" id="stime"  value="<%=wtjd == null ? "" : DateTools.dateToString(wtjd.getStime(),false)%>">
    <tr valign="middle">
      <td height="25" colspan="2"  align="center">
	  <FCK:editor id="content"
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="360" toolbarSet="ALL"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><span style="font-size:14px"><%=content%><span> </FCK:editor>      </td>
    </tr>
    <tr valign="middle">
    
      <td height="40" colspan="2" align="center">
          <input name="" type="button" class="button1" onclick="javascript:window.open('<%=previewUrl%>')" value="Ԥ����">
      &nbsp;&nbsp;<input name="" type="button" class="button1"  value="ȷ����" onClick="checkfrm();">
            </td>
    </tr>
  </table>
</form>
</body>
</html>

