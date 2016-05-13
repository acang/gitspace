<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
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

  Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
  String hyid = SysCommonFunc.getStrParameter(request,"hyid");
  String articleid = SysCommonFunc.getStrParameter(request,"articleid");
  String cid   = SysCommonFunc.getStrParameter(request,"cid");
  String delid = SysCommonFunc.getStrParameter(request,"delid");
  String isdel = SysCommonFunc.getStrParameter(request,"isdel");
  if(delid.length() > 0)
  {
    OpLogMng.userAdminRArticleLog(hyid,adminLoginInfo,delid,cid);
    String sqlarray[] = new String[2];
    sqlarray[0] = "delete from userarticle where id = " + delid + " and hyid="+hyid;
    //sqlarray[1] = "delete from bcb where id="+cid;
    sqlarray[1] = "update userinfo set regtime2=sysdate where hyid="+hyid;
    HbmOperator.executeSql(sqlarray);




    //OpLogMng.addOpLog(tempu,adminLoginInfo,request,OpLogMng.OP_LOG_U_R_ARTICLE);
    out.println("<script language='javascript'>alert('您已经成功删除了个人文集!');window.parent.location.href='edithyinfoyj.jsp?id="+hyid+"&isdel="+isdel+"';window.close();</script>");
    return;
  }
Userinfo user = null;
if(isdel.equals("1"))
  user = HYRegMng.getDelUserInfoByHyid(hyid);
else
  user = HYRegMng.getUserinfoByHyid(hyid);

  Userarticle uarticle = null;
  if(articleid.length() > 0)
    uarticle = GRZQMng.getUserArticle(hyid,articleid);
  if(uarticle == null)
    uarticle = new Userarticle();

  Bcb b = null;
  if(uarticle != null)
  {
     String hsql = "from Bcb as o where o.id="+uarticle.getContentid();
     List list = HbmOperator.list(hsql);
     //System.out.println(list.size());
     b = list == null || list.size()==0 ? null : (Bcb)list.get(0);
  }

  //System.out.println(b);

  String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
  if(bizaction.equals("01"))
  {
     String s = null;
     if(uarticle.getId() == null)
       s =  GRZQMng.adminAddArticle(request,user);
     else
       s =  GRZQMng.adminModArticle(request,user,uarticle,b);
     out.println("<script language='javascript'>alert('您已经成功上传了个人文集!');window.opener.location.href='edithyinfoyj.jsp?id="+hyid+"&isdel="+isdel+"';window.close();</script>");
     return;
  }

  String con = "";
  if(b != null)
  {
    con = SysCommonFunc.getStringFromBlob(b.getContent());
  }

//response.write "<script language='javascript'>alert('您已经成功删除了个人文集!');window.opener.location.reload();window.close();</script>"

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<title>51love交友中心</title>
</head>

<body>


<form name="form1" method="post" action="upload_wj.jsp" onSubmit="return check();">
  <input type="hidden" name="hyid" value="<%=hyid%>" />
  <input type="hidden" name="isdel" value="<%=isdel%>" />
  <input type="hidden" name="articleid" value="<%=uarticle.getId() == null ? "":uarticle.getId().toString()%>" />
  <input type="hidden" name="bizaction" value="01" />
  <table width="600" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr>
      <td height="30" colspan="2"><div align="center"><strong><font color="red"><strong><%=user.getLcname()%></strong></font></strong>文集添加</div>
      <div align="center"></div></td>
    </tr>
    <tr>
      <td width="106" height="30" class="tdc"><div align="center"><strong>文集标题</strong></div></td>
      <td width="494" height="30"><input name="title" type="text" id="title" size="70" maxlength="60" value="<%=uarticle == null || uarticle.getTitle() == null? "":uarticle.getTitle()%>"></td>
    </tr>
    <tr>
      <td height="30" class="tdc"><div align="center"><strong>内　　容</strong></div></td>
      <td height="30"> <FCK:editor id="article" 
                        basePath="<%=basePath%>"
                        skinPath="<%=skinPath%>" width="100%"
                        height="260" toolbarSet="ALL"
                        imageBrowserURL="<%=imageBrowserURL%>"
                        linkBrowserURL="<%=linkBrowserURL%>"
                        flashBrowserURL="<%=flashBrowserURL%>"
                        imageUploadURL="<%=imageUploadURL%>"
                        linkUploadURL="<%=linkUploadURL%>"
                        flashUploadURL="<%=flashUploadURL%>"><%=con%> </FCK:editor>     </textarea></td>
    </tr>
    <tr>
      <td height="30" colspan="2"><div align="center">
          <input type="button" name="Submit" value="关闭窗口" onClick="javascript:window.close();">
          　　
          <input type="submit" name="Submit2" value="提　　交">
      </div></td>
    </tr>
  </table>
</form>

</body>
</html>


<script language="JavaScript">
function check()
{
if (checkspace(document.form1.title.value))
{
alert('文章标题不能为空');
document.form1.title.focus();
return false;
}

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

