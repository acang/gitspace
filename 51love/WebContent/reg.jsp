<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
    <script language="JavaScript">
        function tag_byteLen(str) {
            var len = 0;

            for (var i = 0; i < str.length; i++) {
                var code = str.charCodeAt(i);
                if (code > 255) {
                    len += 2;
                }
                else {
                    len += 1;
                }
            }

            return len;
        }

        function test()
        {

            if (checkspace(document.personal.username.value)){
                alert('请填写您的用户名!');
                document.personal.username.focus();
                return false;
            }
             var name = getBLen(document.personal.username.value)
            if(name<8 || name>16)
            {
                alert("用户名由8-16个字符组成!");
                document.personal.username.focus();
                return false;
            }
            if (checkspace(document.personal.password.value)){
                alert('请输入密码!');
                document.personal.password.focus();
                return false;
            }
            if(document.personal.password.value.length<8)
            {
                alert("密码由8位以上字符组成!");
                document.personal.password.focus();
                return false;
            }
            if (checkspace(document.personal.repassword.value)){
                alert('请输入密码确认!');
                document.personal.repassword.focus();
                return false;
            }
            if( document.personal.repassword.value.length<8)
            {

                alert("密码确认由8位以上字符组成!");
                return false;
            }

            if (document.personal.password.value!=document.personal.repassword.value)
            {
                alert('您两次输入的密码不一致，请重新输入!');
                document.personal.repassword.focus();
                return false;
            }

            if (document.personal.password.value==document.personal.username.value)
            {
                alert('密码不能与用户名相同！');
                document.personal.password.focus();
                return false;
            }
                if(!document.getElementById("isagree").checked){
                    alert('请仔细阅读本站服务条款，并同意！');
                    return false;
                }
            return true;
        }

        function test1()
        {
           if(document.personal.password.value.length<8)
            {
                alert("密码由8位以上字符组成!");
                document.personal.password.focus();
            }
        }


        function checkspace(checkstr) {
            var str = '';
            for(i = 0; i < checkstr.length; i++) {
                str = str + ' ';
            }
            return (str == checkstr);
        }
        function Check(){
            document.cform.username.value=document.personal.username.value;
            document.cform.submit();

        }
        getBLen = function(str) {
		  if (str == null) return 0;
		  if (typeof str != "string"){
		    str += "";
		  }
		  return str.replace(/[^x00-xff]/g,"01").length;
		}
    </script>
</head>
<body class="reg">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  <div class="lm_name">
    <h2>真实注册，找到倾心的朋友！</h2>
  </div>
  <div class="step_box"><span class="current">1、用户名、密码设置</span><span>2、完善基本资料及联系方式</span><span>3、提交审核</span></div>
  <div style="clear:both"></div>
    <form name="personal" method="post" action="afterregnewuser.jsp" onSubmit="return test()" target="cname">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <td colspan="2" align="center" bgcolor="#D6E6F3" class="bk04" style="color:red;">
       <div class="lm_name" style="text-align:center;font-size:17px;height:30px;"><strong>请本人真实填写，并保持电话畅通，客服审核后激活上线。如不愿被审核，请勿注册，以免浪费您的时间！ </strong> </div>
       </td>
     </tr>
    <tr>
      <td width="200" align="right"><strong>用户名：</strong></td>
      <td width="400"><input name="username"  id="username" type="text"  class="txt01" value="" /></td>
      <td>（用户名由8-16个字符及数字组成）</td>
    </tr>
    <tr>
      <td align="right"><strong>创建密码：</strong></td>
      <td><input name="password" id="password" type="password" class="txt01" value="" /></td>
      <td>（密码由8位字符及数字组成）</td>
    </tr>
    <tr>
      <td align="right"><strong>确认密码：</strong></td>
      <td><input name="repassword" type="password"  id="repassword" class="txt01" onfocus="javascript:test1()" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2" style=" font-family:'微软雅黑'; font-size:16px"><input id="isagree" type="checkbox" value="" checked="checked"  />已阅网站<a href="veiwwt.jsp?id=1773449" target="_blank" style="color:#ff3300;font-size:16px">隐私保护</a>和<a href="veiwwt.jsp?id=1773450" target="_blank" style="color:#ff3300;font-size:16px">交友须知</a>内容，并同意网站<a href="veiwwt.jsp?id=1773448" target="_blank" style="color:#ff3300;font-size:16px ">服务条款</a>内容。</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2"><input name="" type="submit" value="免费注册，开启交友之旅" class="btn"/></td>
    </tr>
  </table>
  </form>
  <div style="clear:both"></div>
  <div class="erweima_box">
      <div class="lm_name02">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
  </div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
