<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>

<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
%>
<%
if(loginUser == null)
{
  out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲���������ע�ᡡ��');window.close();</script>");
  return;
}


%>
<html>
<head>
<title>�ϴ�</title>
<style type="text/css">
<!--
.STYLE2 {font-size: 12}
-->
</style>
</head>
<%
//chkpost()
//dim msg
//msg=request("msg")
//if msg<>"" then
//response.write "<script language='javascript'>alert('"&msg&"');window.opener.location.reload();window.close();</script>"
//end if
%>
<script language='javascript'>



function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
function test()
{

   var fileext;
   var my_value;
   my_value=document.form1.file1.value;

   fileext=my_value.substr(my_value.length-3,3);
   fileext=fileext.toUpperCase();
   if ((fileext != "GIF") && (fileext != "JPG") )
   {
       alert("����ѡ��gif��jpgͼƬ�ļ�!");
       return false;
   }
}

  function   getFileSize   (fileName)   {
          window.oldOnError   =   window.onerror;
          window.onerror   =   function   (err)   {
              if   (err.indexOf('utomation')   !=   -1)   {
                  alert('file   access   not   possible');
                  return   false;
              }
              else
                  return   false;
          };
          var   fso   =   new   ActiveXObject('Scripting.FileSystemObject');
          var   file   =   fso.GetFile(fileName);
          window.onerror   =   window.oldOnError;
          return   file.Size;
      }



</script>
<body>

<form name="form1" method="post" action="upload_pic_do.jsp" enctype="multipart/form-data" onSubmit="return test();" target="cf">
  <input type="hidden" name="add" value="add" />
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center">&nbsp;</td>
  </tr>
  <tr>
    <td align="center"><span class="STYLE2"></span></td>
  </tr>
  <tr>
    <td align="center"><span class="STYLE2">ѡ����Ƭ�ļ���
        <input type="file" name="file1" style="HEIGHT: 22px; WIDTH: 200px">
      </span></td>
  </tr>
  <tr>
    <td align="center"><input  name="Submit" type="submit" class=BlueSubmitButton  value="�ϴ�"></td>
  </tr>
</table>
</form>
<iframe style="display:none" width="0" height="0" name="cf">
</iframe>
</body>

</html>
