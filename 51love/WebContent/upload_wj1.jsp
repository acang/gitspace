<%@ page import="java.io.File" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.lover.mng.GRZQMng" %>
<%@ page import="com.lover.mng.OpLogMng" %>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-���й���������ཻ����վ����Ա�鲼��������,�㶫����,�Ϻ�����,���ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���1000������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
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

    if(loginUser == null)
    {
        out.println("��¼ʧЧ�������µ�¼");
        return;
    }
    if(request.getParameter("bj") != null) ///��Ҫ�ϴ�
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
        String s = GRZQMng.userAddArticle(request, loginUser);
        if(s == null)
        {
            out.println("<script language='javascript'>alert('���Ѿ��ɹ��ϴ��˸����ļ�!');window.parent.parent.location.href='../gryj.jsp';window.close();</script>");
            return;
        }
        else
            out.println("<script language='javascript'>alert('"+s+"!');window.parent.parent.location.href='../gryj.jsp';window.close();</script>");
    }
    if(request.getParameter("delid") != null) //ɾ��
    {
        String s = GRZQMng.userDelArticle(request,loginUser);
        OpLogMng.addOpLog(loginUser, null, request, OpLogMng.OP_LOG_U_R_ARTICLE);
        if(s==null)
            out.println(" <script language='javascript'>alert('���Ѿ��ɹ�ɾ���˸����ļ�!');window.opener.location.href='../gryj.jsp';window.close();</script>");
        else
            out.println(" <script language='javascript'>alert('"+s+"!');window.opener.location.href='../gryj.jsp';window.close();</script>");

        return;
    }
%>

<div class="wrapper1250 cm_block01">
    <div class="block01">
        <div class="box01"> <span class="tx"><img src="../<%=afilepathsmall+File.separator+uother.getUserphoto1()%>" alt=""/></span>
            <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
            <div class="lm_name">
                <h2>���˲���ר��</h2>
            </div>
            <%@ include file="grleft.jsp"%>
        </div>
        <div class="box02">
            <div class="lm_name">
                <h2><a href="2_10.asp">Ӱ��/�ļ��޶�</a>&nbsp;&gt;&nbsp;<a href="2_10.asp">�ļ��޶�</a>&nbsp;&gt;&nbsp;�ϴ��ļ�</h2>
            </div>
            <form name="form1" method="post" action="upload_wj1.jsp?bj=1" onSubmit="return check();">
                <table border="0" cellpadding="0" cellspacing="0" style="width:100%">
                    <tr>
                        <td style="width:90px; text-align:center; font-weight:bold">�� �⣺</td>
                        <td style="padding:5px;">
                            <input type="text"  name="title" id="title"  style="width:98%; height:25px; line-height:25px;" >
                        </td>
                    </tr>
                    <tr>
                        <td style="width:90px; text-align:center; font-weight:bold">�� �ݣ�</td>
                        <td style="padding:5px;">
                            <FCK:editor id="article" basePath="<%=basePath%>"
                                        skinPath="<%=skinPath%>" width="95%" height="300"
                                        toolbarSet="ALLARTICLE" imageBrowserURL="<%=imageBrowserURL%>"
                                        linkBrowserURL="<%=linkBrowserURL%>"
                                        flashBrowserURL="<%=flashBrowserURL%>"
                                        imageUploadURL="<%=imageUploadURL%>"
                                        linkUploadURL="<%=linkUploadURL%>"
                                        flashUploadURL="<%=flashUploadURL%>">
                            </FCK:editor>
                        </td>
                    </tr>
                </table>

                <div class="MyBtn">
                    <input type="Submit" value="  �ϴ��ļ�  " class="btn" />
                </div>
            </form>
        </div>
        <div style="clear:both"></div>
    </div>
    <div class="block02">
        <div class="box02">
            <div class="lm_name">
                <h2>ɨ���ά��</h2>
            </div>
            <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>�ٷ�΢��</div>
            <div class="erweima"><img src="images/wap_erweima.jpg" alt="" width="120" height="120"/><br/>�ֻ���վ</div>
        </div>
    </div>
    <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
