<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>

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
            out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录或注册');parent.showLogin('disp_bbs.jsp?bbsid="+bbsid+"','disp_bbs.jsp?bbsid="+bbsid+"');</script>");
            return;
        }

        String mailreg = "[\\w\\.\\-]+@([\\w\\-]+\\.)+[\\w\\-]+";
        String preg    = "\\d{6,}";

        String s = null;
        if(content == null)
            content = "";
        String tempc=content.replaceAll("<p>","");
        tempc = tempc.replaceAll("</p>","");
        if(tempc != null && tempc.length() > 200)
        {

            s = "回帖请少于100个字！";
        }
        if(tempc == null || tempc.length() < 10)
        {

            s = "回帖请多于10个字！";
        }
        else
        {
            java.util.regex.Pattern pattern1 = java.util.regex.Pattern.compile(mailreg,java.util.regex.Pattern.CASE_INSENSITIVE);
            java.util.regex.Pattern pattern2 = java.util.regex.Pattern.compile(preg,java.util.regex.Pattern.CASE_INSENSITIVE);
            if(pattern1.matcher(content).matches() || pattern2.matcher(content).matches()){
                s = "回帖中有疑似联系方式，请重新填写";
            }else{
                s = BBSMng.userAddReTopic(request,loginUser,content,bbsid);
            }


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

%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
    <meta name="description" content="51交友中心-―中国AAA大型情感类交友网站。会员遍布北京交友，广东交友，上海交友，江苏交友等全国各大省市。51交友中心稳健专业、快捷超值,已积累400多万情感交友会员。" />
    <meta http-equiv=”Cache-Control” content=”no-transform” />
    <meta http-equiv=”Cache-Control” content=”no-siteapp” />
    <meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    <script language="javascript">
        function check()
        {
            var con = document.getElementById("content").value;
            if(con.indexOf("www.") >= 0 ||con.indexOf(".net") >= 0
                    ||con.indexOf(".cn") >= 0 || con.indexOf(".com") >= 0
                    || con.indexOf("ftp://") >= 0 || con.indexOf("http://") >= 0
                    || con.indexOf(".org") >= 0 || con.indexOf("<a href") >= 0)
            {
                alert("回帖请不要带网址链接！");
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
        function tijiao(){
            document.form1.submit();
        }
    </script>
    
</head>
<body class="cm_bbsxq">
<div class="wrapper1250 cm_block01" style="margin-top:0px; margin-bottom: 1px ">
<div class="block02" style="width:890px; margin:8px 0; margin-left:210px;vertical-align: middle">
    <div class="lm_name" style="background-color:#568cb6">
        <h2>会员回复</h2>
    </div>
    <form name="form1" method="post" action="addretopic.jsp" onSubmit=" return check();">
        <input type="hidden" name="bizaction" value="01">
        <input type="hidden" name="bbsid" value="<%=bbsid%>">
        <input type="hidden" name="isfb" value="<%=isfb%>"/>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" >

            <tr>
                <td><textarea id="content" name="content" cols="" rows="" style="width:884px; height:100px;"></textarea></td>
            </tr>
            <tr>
                <td align="center">
                    <a href="javascript:tijiao()" style="background-color:#21648f; height:30px; line-height:30px;
                        text-align:center; color:#FFF; width:100px; display:inline-block">回 复</a></td>
            </tr>

        </table>
    </form>
</div>
</div>

</body>
</html>

