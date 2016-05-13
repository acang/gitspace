<%
    String login = System.currentTimeMillis()+"";
    session.setAttribute("login",login);
    session.setAttribute("sp",login);
%>
<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=GBK" />
    <title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
    <meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
    <meta http-equiv=”Cache-Control” content=”no-transform” />
    <meta http-equiv=”Cache-Control” content=”no-siteapp” />
    <meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    
    <script language="JavaScript">
        function validate(){
            if (checkspace(document.pt.username.value)){
                alert('请填写您的用户名!');
                document.pt.username.focus();
                return false;
            }
            if (checkspace(document.pt.password.value)){
                alert('请填写您的密码!');
                document.pt.password.focus();
                return false;
            }
            if (checkspace(document.pt.imager.value)){
                alert('请填写验证码!');
                document.pt.imager.focus();
                return false;
            }
            return true;
        }

        function validatesj()
        {
            if (checkspace(document.sj.sjtel.value)){
                alert('请填写您的手机号码。移动、联通、电信手机均可免费获取校验码!');
                document.sj.sjtel.focus();
                return false;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.sj.sjtel.value))
            {
                alert("手机号码不正确!");
                return false;
            }

            if (checkspace(document.sj.verycode.value)){
                alert('请填写您的短信验证码');
                document.sj.verycode.focus();
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

        function sendSms()
        {
            if (checkspace(document.sj.sjtel.value)){
                alert('请填写您的手机号码。移动、联通、电信手机均可免费获取校验码!');

                document.sj.sjtel.focus();
                return;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.sj.sjtel.value))
            {
                alert("手机号码不正确!");
                return;
            }else{
                /*if(confirm('您确定发送校验码吗？')){
                 document.csendsms.sjtel.value =  document.sj.sjtel.value;
                 document.csendsms.submit();

                 }*/
                document.csendsmsval.sjtel.value =  document.sj.sjtel.value;
                document.csendsmsval.submit();
            }
        }

        function callback(msg){
            if (msg="33"){
                document.csendsms.sjtel.value =  document.sj.sjtel.value;
                document.csendsms.submit();
            }
        }

        function selectTag(showContent,selfObj){
            // 操作标签
            var tag = document.getElementsByName("loginTab");
            var taglength = tag.length;
            for(i=0; i<taglength; i++){
                tag[i].className = "";
            }
            selfObj.className = "current";
            // 操作内容
            for(var i=0; i<2; i++){
                j=document.getElementById("tagContent"+i);
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }
    </script>

</head>
<body>
<div class="login_bg"></div>
<div class="login_box">
    <div class="block01">
        <div class="tab">
            <%String mobile= SysCommonFunc.getStrParameter(request, "mobile");
                if (mobile==null || mobile.equals("")){
            %>
            <span name="loginTab" class="current" onMouseOver="selectTag('tagContent0',this)">普通登录</span>
            <span name="loginTab"  onMouseOver="selectTag('tagContent1',this)">短信登录</span>
            <%}else{%>
            <span name="loginTab"  onMouseOver="selectTag('tagContent0',this)">普通登录</span>
            <span name="loginTab"  class="current" onMouseOver="selectTag('tagContent1',this)">短信登录</span>
            <% }%>
        </div>
        <form name="pt" method="post" action="./checkuser.jsp" onSubmit="return validate();" target="cname">
            <input type="hidden" name="isauto" value="" />
            <input type="hidden" name="login" value="<%=login %>" />

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" class="show" id="tagContent0">
                <tr>
                    <td width="200" align="right"><strong>用户名：</strong></td>
                    <td>
                        <input name="username" type="text" class="txt01" value=""  style="width:300px;" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><strong>密码：</strong></td>
                    <td>
                        <input type="password" name="password"  class="txt01" style="width:300px;" />
                    </td>
                </tr>
                <tr>
                    <td align="right"><strong>验证码：</strong></td>
                    <td>
                        <input type="text" name="imager"  class="txt01" maxlength="4" style="width:80px; margin-right:15px;" />
                        <img src="images/imager.jsp" width="50" height="17" align="bottom">
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><input name="" type="submit" class="btn" value="立即登录" /></td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td>　<a title="51交友中心_332个城市的专业交友平台" href="forget.htm" target="_blank">找回密码</a>&nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51交友中心_332个城市的专业交友平台" href="./reg.htm" target="_blank">用户注册</a>　</td>
                </tr>
            </table>
        </form>


        <form name="sj" method="post" action="./checksjlogin.jsp" onSubmit="return validatesj();" target="cname">

            <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:8px;" id="tagContent1">
                <tr>
                    <td width="200" align="right"><strong>手机号：</strong></td>
                    <td>
                        <input type="text" name="sjtel"  class="txt01"  style="width:300px;"  maxlength="11" value="<%=mobile %>" />
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><span class="xym_btn"><a href="javascript:void(0);" onclick="sendSms();">免费获取效验码</a></span></td>
                </tr>
                <tr>
                    <td align="right"><strong>效验码：</strong></td>
                    <td>
                        <input type="text" name="verycode"  class="txt01" style="width:300px;"/>
                    </td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td><input name="" type="submit" class="btn" value="立即登录" /></td>
                </tr>
                <tr>
                    <td align="right">&nbsp;</td>
                    <td>
                        <a title="51交友中心_332个城市的专业交友平台" href="forget.htm" target="_blank">找回密码</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a title="51交友中心_332个城市的专业交友平台" href="./reg.htm" target="_blank">注册新会员</a>
                    </td>
                </tr>
            </table>
        </form>

    </div>
    <div class="block02">
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
</div>
</body>
</html>

<form name="csendsmsval" action="sendsmsloginval.jsp" method="post" target="cname">
    <input name="sp" value="<%=login%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<form name="csendsms" action="sendsmslogin.jsp" method="post" target="cname">
    <input name="sp" value="<%=login%>" type="hidden"/>
    <input name="sjtel" value="" type="hidden"/>
</form>
<iframe name="cname" id="cname" src="" height="0" width="0">
</iframe>
