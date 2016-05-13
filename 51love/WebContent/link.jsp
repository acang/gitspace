<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
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
    
    <script language="JavaScript">
        function check(sform)
        {
           if (sform.netname.value.length==0)
            {
                alert('网站名称不能为空');
                sform.netname.focus();
                return false;
            }
            if (sform.nethttp.value.length==0)
            {
                alert('网址不能为空');
                sform.nethttp.focus();
                return false;
            }
            if (sform.memo.value.length==0)
            {
                alert('网站简介不能为空');
                sform.memo.focus();
                return false;
            }
            if (sform.applyreason.value.length==0)
            {
                alert('申请理由不能为空');
                sform.applyreason.focus();
                return false;
            }
            if (sform.man.value.length==0)
            {
                alert('联系人不能为空');
                sform.man.focus();
                return false;
            }
            if (sform.tel.value.length==0)
            {
                alert('联系电话不能为空');
                sform.tel.focus();
                return false;
            }
            return true;
        }



    </script>
</head>
<body class="cm_syzn">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01" style="margin-top:8px;">
    <div class="block02">
        <div class="lm_name02">
            <h2>申请友情链接</h2>
        </div>
        <div style="clear:both"></div>
        <div style="margin:8px 100px; border:#CCC 1px solid; padding:10px; background-color:#F5F5F5; font-size:14px">
            <strong>申请条件：</strong> <br/>世界排名10万以内、GooglePR值3以上或日流量2000IP以上。只做首页链接
            (申请时请先将我们网站链接上贵站首页，如果提交两周后贵站没有被我们链接，可能是因为您的网站不符合我们的链接标准，
            您可以等一个月后再提交，请不要重复提交)。
        </div>
        <div style="margin:8px 100px; padding:10px; background-color:#F5F5F5; font-size:14px">
            请将51交友中心网站设为您的网站首页友情链接</div>
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03">
            <tr>
                <td>
                    如果是文字连接，网站名称：“51交友中心”，上网导航：<br/>
                    <textarea name="siteintro"  style="width:100%;" readonly="readonly" ><a href="http://www.51lover.org">51交友中心</a></textarea>
                </td>
            </tr>
        </table>
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03" style="margin-top:10px;">
            <tr>
                <td colspan="2">如果是图片链接，51交友中心上网导航：</td>
            </tr>
            <tr>
                <td style="width:150px">
                    <img src="skin/logo.png" width="143" height="44" />
                </td>
                <td>
                    <textarea name="siteintro"  style="width:100%; height:50px;" readonly="readonly" ><a href="http://www.51lover.org"><img src="http://www.51lover.org/skin/logo.png" width="143" height="44" alt="51交友中心" /></a></textarea>
                </td>
            </tr>
        </table>
        <div style="margin:8px 100px; padding:10px; background-color:#F5F5F5; font-size:14px">
            提交您的网站链接申请（每项都要填写）</div>
        <form name="linkform" method="post" action="link_do.jsp"  enctype="multipart/form-data" onSubmit="return check(document.linkform);">
        <table width="70%" border="0" align="center" cellpadding="3" cellspacing="0" class="bk03">
            <tr>
                <td width="22%" align="right"><strong>* 网站名称：</strong></td>
                <td width="78%"><input name="netname" type="text" class="input02" id="netname" style="width:250px;"  maxlength="20"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* 网站地址：</strong></td>
                <td><input name="nethttp" type="text" class="input02" id="nethttp" style="width:250px;" value="http://" maxlength="100"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* 网站LOGO图片：</strong></td>
                <td >  <input type="file" name="file1" style="HEIGHT: 22px; WIDTH: 200px"></td>
            </tr>

            <tr>
                <td align="right"><strong>* 网站简介： </strong></td>
                <td ><textarea name="memo" rows="8" id="memo" style="width:440px;" title="这里请输入您的网站的简单介绍"></textarea>                    </td>
            </tr>
            <tr>
                <td align="right" ><strong> * 申请理由：</strong></td>
                <td><input name="applyreason" type="text" class="input02" id="applyreason" style="width:250px;" maxlength="20"/>（PR值、IP流量或ALEXA排名）</td>
            </tr>
            <tr>
                <td align="right"><strong>* 联系人：</strong></td>
                <td ><input name="man" type="text" class="input02" id="man" style="width:250px;" value="" maxlength="30"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* 联系电话：</strong></td>
                <td ><input name="tel" type="text" class="input02" id="tel" style="width:250px;" value="" maxlength="30"/></td>
            </tr>
            <tr>
                <td align="right"><strong>* 是否已加友链：</strong></td>
                <td><select name="addlink" id="addlink" ><option value="0">否</option><option value="1">是</option></select>
                  </td>
            </tr>
        </table>

        <div class="MyBtn">
            <input type="button" onclick="tijiaoLink()" value=" 立即申请 " class="btn" />
        </div>
        </form>
    </div>
    <div class="block02t">
        <div class="lm_name">
            <h2>扫描二维码</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
        <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
<script>
    function tijiaoLink(){
        var addlink_obj = document.getElementById("addlink");
        var seleted_index = addlink_obj.selectedIndex;
        if(addlink_obj[seleted_index].value == "0"){
            alert("请先将我站加入贵站首页链接！");
            return;
        }
         document.linkform.submit();
    }
</script>
</html>
