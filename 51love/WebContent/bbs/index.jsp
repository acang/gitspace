<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站?中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/lcmbase.js"></script>
</head>
<body class="cm_bbs">
<%@ include file="head.jsp"%>

<div class="wrapper1250 cm_block01">
  <div class="block01">
    
    <div class="box04">
    <div class="lm_name"><h2>会员交流</h2></div>
        <ul class="hyjl_list">
            <li><span class="img"><a href="bbsindex.jsp?sortid=13" target="_blank"><img src="../images/xwdt_img.jpg" alt=""/></a></span><p><span class="bg bg01"></span><span class="tit"><a href="#" target="_blank">交友动态</a></span></p></li>
            <li><span class="img"><a href="bbsindex.jsp?sortid=3"  target="_blank"><img src="../images/jygn_img.jpg" alt=""/></a></span><p><span class="bg bg02"></span><span class="tit"><a href="#" target="_blank">交友观念</a></span></p></li>
            <li><span class="img"><a href="bbsindex.jsp?sortid=12" target="_blank"><img src="../images/jygl_img.jpg" alt=""/></a></span><p><span class="bg bg03"></span><span class="tit"><a href="#" target="_blank">交友攻略</a></span></p></li>
            <li><span class="img"><a href="bbsindex.jsp?sortid=9"  target="_blank"><img src="../images/wdgs.jpg" alt=""/></a></span><p><span class="bg bg04"></span><span class="tit"><a href="#" target="_blank">交友故事</a></span></p></li>
        </ul>
	  <div style="clear:both"></div>
    </div>
          <table style="height: 180px">
              <tr>
                  <td width="5%" align="left" colspan="2"><strong>使用须知:</strong></td>
              </tr>
              <tr>
                  <td width="5%" align="center" valign="top">一、</td>
                  <td height="30" align="left">分享是种美德，分享时不但可以带给自己愉悦，同时也可以在分享的过程中增加自己的人气值，让自己被更多的会员关注！</td>
              </tr>
              <tr>
                  <td align="center" valign="top">二、</td>
                  <td height="30" align="left">本论坛侧重于交友话题讨论，不得发布任何违反国家法律的信息，不得进行商业广告行为。任何主题及回帖内容都只代表个人观点，<br/>不代表本站立场。</td>
              </tr>
              <tr>
                  <td align="center">三、</td>
                  <td height="30" align="left">在论坛发布主题帖和回帖，以及在微信分享本论坛文章均可以获得金币奖励，具体分享奖励政策如下：</td>
              </tr>
              <tr>
                  <td align="center"> 1、</td>
                  <td>审核通过的主题帖获赠100金币/篇，若您的主题帖有会员回帖，则每个回帖再奖励您8个金币。 </td>
              </tr>
              <tr>
                  <td align="center" valign="top">2、</td>
                  <td height="30" align="left">回帖获赠8金币/个，若您的回帖被其他会员点赞，则每个点赞再奖励您2个金币。<br> 下列回帖会被删除，则双倍扣除回帖人的金币，即扣16个金币/篇：
                     <br> 少于10个字的内容、违反法律或不文明的内容、与主题无关、复制或重复的内容、含有各种联系办法的内容。</td>
              </tr>
              <tr>
                  <td align="center" valign="top"> 3、</td>
                  <td>将论坛文章分享到微信好友、朋友圈、手机QQ（具体方法请查看个人专区分享奖励栏目），只要被阅读一次，即奖励您1个论坛金币。 </td>
              </tr>
              <tr>
                  <td align="center" valign="top">四、</td>
                  <td height="30" align="left">每当您积累金币数到10000金币时，就可以换取一年期VIP会员，积累到20000金币时，可换取一年期白金VIP会员。届时请在“<a href="../kfzx.htm" target="_blank" style="color: blue">联系我们</a>”留言申请，以便管理员核实办理。 </td>
              </tr>
          </table>

    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="../images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="../images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
<script type="text/javascript">
		/*function Show(){
				MessageBox.Show("", "");
		}
		function remove(){
			var browserWidth = $(window).width();
			var browserHeight = $(window).height();
			$box.animate({
				width: MessageBox.mWidth + "px",
				height: MessageBox.mHeight + "px",
				"left": browserWidth / 2 - MessageBox.mWidth / 2 + "px",
				"top": browserHeight / 2 - MessageBox.mHeight / 2 + "px"
			}, 300);
		}
		var MessageBox = {
			mWidth: "358",
			mHeight: "320",
			isMoving: true,
			titleMaxLength: 10,
			target: null,
			bgTar:null,
			currentX: 0,
			currentY: 0,
			Show: function(aTitle, aMsg, isModal,btnNub, aYesFunction, aNoFunction) {
				MessageBox.Close();
				aTitle = aTitle.length >= this.titleMaxLength ? aTitle.substr(0, this.titleMaxLength) + "..." : aTitle;
				//浏览器宽度
				var browserWidth = $(window).width();
				var browserHeight = $(window).height();
				
				if(isModal==true){
					$bg = $("<div></div>");
					$bg.css({"width": browserWidth+"px","height": browserWidth+"px","position": "fixed","top":"0px","left":"0px","z-index": 998,"background-color": "#efefef","opacity":"0.5"});
					$("body").append($bg);
					MessageBox.bgTar=$bg;
					$bg.click(function(){
					});
				}
				
				$box = $("<div></div>");
				MessageBox.target = $box;
				$box.css({"width": "0px","height": "0px","position": "fixed","border": "1px solid #ccc","z-index": 999,"background-color": "#fff"});
				$title = $("<div><h3></h3></div>");
				$title.css({"width": "100%","border-bottom": "1px solid #ccc"});
				$title.find("h3").css({"line-height": "20px","padding": "5px 0 5px 10px","margin": "0","font": "15px \"微软雅黑\", Arial, Helvetica, sans-serif"});
				$title.find("h3").html(aTitle);
				$title.hover(function() {
					$title.css({
						"cursor": "move"
					});
				});
				var drog = false;
				$title.mousedown(function(e) {
					drog = true;
					MessageBox.currentX = e.pageX;
					MessageBox.currentY = e.pageY;
					$("body").mousemove(function(e) {
						if (drog == true) MessageBox.Drog(e);
					});
				});
				$("body").mouseup(function() {
					drog = false;
				});
				//$box.append($title);
				if (MessageBox.isMoving == true) {
					$box.animate({
						width: this.mWidth + "px",
						height: this.mHeight + "px",
						"left": browserWidth / 2 - this.mWidth / 2 + "px",
						"top": browserHeight / 2 - this.mHeight / 2 + "px"
					}, 300);
				} else {
					$box.css("width", this.mWidth + "px").css("height", this.mHeight + "px");
				}
				$box.hover(function() {$box.css({"-webkit-box-shadow": "0px 0px 8px #ccc","-moz-box-shadow": "0px 0px 8px #ccc","box-shadow": "0px 0px 8px #ccc"});
				}, function() {
					$box.css({"-webkit-box-shadow": "0px 0px 5px #ccc","-moz-box-shadow": "0px 0px 5px #ccc","box-shadow": "0px 0px 5px #ccc"});
				});
				$center = $("<div></div>");
				$center.html("<img src='../images/popimage.jpg'/>");
				$center.css({"height": MessageBox.mHeight - 45 + "px","width": "98%","margin": "0 auto","margin-top": "5px","color": "#808080","font": "13px \"微软雅黑\", Arial, Helvetica, sans-serif"});
				$box.append($center);

				$foot = $("<div></div>");
				$foot.css({"height": "34px","width": "100%","margin-top": "5px","background-color": "#efefef"});
				
					$btnNo = $("<a>确定</a>");
					$btnNo.css({
						"font": "13px \"微软雅黑\", Arial, Helvetica, sans-serif",
						"-webkit-border-radius": "3px",
						"-moz-border-radius": "3px",
						"border-radius": "3px",
						"float": "right",
						"padding": "3px 10px 3px 10px",
						"margin": "5px 10px 0 0",
						"cursor": "pointer",
						"background-color": "#fff",
						"border": "1px solid #ccc"
					});
					$btnNo.hover(function() {
						$btnNo.css("background-color", "#efefef");
					}, function() {
						$btnNo.css("background-color", "#fff");
					});
					//$foot.append($btnNo);
					$btnNo.click(function() {
						if (aNoFunction != null) aNoFunction();
						$("#grjllink").click();
						window.scrollBy(500, 0);
						MessageBox.Close();
					});
				
				$btnYes = $("<a>关闭</a>");
				$btnYes.attr("class", "button");
				$btnYes.css({"font": "13px \"微软雅黑\", Arial, Helvetica, sans-serif","-webkit-border-radius": "3px","-moz-border-radius": "3px","border-radius": "3px","float": "right","padding": "3px 10px 3px 10px","margin": "5px 10px 0 0",
					"cursor": "pointer",
					"background-color": "#fff",
					"border": "1px solid #ccc"
				});
				$btnYes.hover(function() {$btnYes.css("background-color", "#efefef");}, function() {$btnYes.css("background-color", "#fff");});
				$foot.append($btnYes);
				$btnYes.click(function() {
					if (aYesFunction != null) aYesFunction();
					MessageBox.Close();
				});
				$box.append($foot);
				$("body").append($box);
			},
			//关闭
			Close: function() {
				$(this.target).remove();
				if(this.bgTar!=null)$(this.bgTar).remove();
			},
			//拖动
			Drog: function(e) {
				var x = e.pageX;
				var y = e.pageY;
				var cy = $box.offset().top - $(document.body).scrollTop() + (y - $(document.body).scrollTop() - (MessageBox.currentY - $(document.body).scrollTop()));
				$("#headMenuItema").html(cy);
				$box.css("left", $box.offset().left + (x - MessageBox.currentX) + "px").css("top", cy + "px");
				MessageBox.currentX = x;
				MessageBox.currentY = y;
			}
		}
	window.onload=Show;
	$(window).resize(remove);*/
</script>
</body>
</html>
