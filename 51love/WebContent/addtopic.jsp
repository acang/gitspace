<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK"%>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.lover.mng.BBSMng" %>
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
            out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼��ע��');parent.showLogin()</script>");
            return;
        }

        String s = null;
        if (content != null ){
            s = BBSMng.userAddTopic(request, loginUser, content,sortid, title);
        }


        if (s == null) {
            out.println("<script langauge=javascript>alert('��������������������');window.close()</script>");
            title = "";
            isfb = "isfb";
            content = "";
        } else
            out.println("<script langauge=javascript>alert('" + s
                    + "��');</script>");

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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-�D�й�AAA��������ཻ����վ����Ա�鲼�������ѣ��㶫���ѣ��Ϻ����ѣ����ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���400������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    <script language="javascript">
        function check()
        {
            title = document.form1.title.value;
            var editor = FCKeditorAPI.GetInstance("content");
            var con = editor.EditorDocument.body.innerHTML;
            if(con.indexOf("www.") >= 0 ||con.indexOf(".net") >= 0
                    ||con.indexOf(".cn") >= 0 || con.indexOf(".com") >= 0
                    || con.indexOf("ftp://") >= 0 || con.indexOf("http://") >= 0
                    || con.indexOf(".org") >= 0||con.indexOf("<a href") >= 0)
            {
                alert("�����벻Ҫ����ַ���ӣ�");
                return false;
            }
            if(title == "")
            {
                alert("���ⲻ��Ϊ��!");
                return false;
            }
            isfb = document.form1.isfb.value;
            if(!(isfb == ""))
            {
                alert("�벻Ҫ�ظ�����!");
                return false;
            }

            return true;
        }
    </script>

</head>
<body class="cm_bbs" style="text-align: center">
<div class="wrapper1250 cm_block01">
<div class="block01">
    <div class="box03">
        <div class="lm_name">
            <h2>����������</h2>
        </div>
        <form name="form1" method="post" action="addtopic.jsp"
              onSubmit=" return check();">
            <input type="hidden" name="bizaction" value="01">
            <input type="hidden" name="sortid" value="<%=sortid%>">
            <input type="hidden" name="isfb" value="<%=isfb%>" />
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td width="80" align="right">�������⣺</td>
                    <td align="left"><input name="title" type="text"
                               size="35" class="txt01" value="<%=title%>"> </td>
                </tr>
                <tr>
                    <td align="right" valign="top">�������ݣ�</td>
                    <td style="padding-left:10px;">
                        <FCK:editor id="content"
                                    basePath="<%=basePath%>"
                                    skinPath="<%=skinPath%>" width="100%"
                                    height="260" toolbarSet="ALLARTICLE"
                                    imageBrowserURL="<%=imageBrowserURL%>"
                                    linkBrowserURL="<%=linkBrowserURL%>"
                                    flashBrowserURL="<%=flashBrowserURL%>"
                                    imageUploadURL="<%=imageUploadURL%>"
                                    linkUploadURL="<%=linkUploadURL%>"
                                    flashUploadURL="<%=flashUploadURL%>"><%=content%> </FCK:editor>  </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td style="height:60px;">
                        <a href="javascript:yulan()" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:100px; display:inline-block">Ԥ&nbsp;&nbsp;&nbsp;��</a>
                        <a href="javascript:fabu()" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px; display:inline-block">����������</a></td>
                </tr>
            </table>
        </form>
    </div>
    <div style="clear:both"></div>
</div>
</div>
  <script type="text/javascript">
      function fabu(){
          document.form1.action = "addtopic.jsp";
          document.form1.target = "";
          document.form1.submit();
      }
      function yulan(){
          document.form1.action = "bbs_preview.jsp";
          document.form1.target = "_blank";
          document.form1.submit();
      }
  </script>
</body>