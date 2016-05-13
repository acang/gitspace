<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%
        String url = (String)session.getAttribute("httpurl");
        if(url == null)
        {
          url = request.getHeader("referer");
          session.setAttribute("httpurl",url);
        }
        String advid = SysCommonFunc.getStrParameter(request,"advid");
        if(advid != null && advid.length() > 0)
          session.setAttribute("advid",advid);
        String tjid = SysCommonFunc.getStrParameter(request,"tjid");
        if(tjid != null && tjid.length() > 0)
          session.setAttribute("tjid",tjid);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心_332个城市的专业交友平台</title>
<META content=51交友中心--中国最便捷的专业大型情感类交友网站。会员遍布北京交友,广东交友,上海交友,江苏交友等地区...
name=description>
<META content=51交友中心,南京交友,江苏交友,上海交友,山东交友 name=keywords>
<link href="images/index.css" rel="stylesheet" type="text/css" />
<link href="images/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body>
<table border="0" cellspacing="0" cellpadding="0" class="banner">
  <tr>
    <td><script type="text/javascript">
AC_FL_RunContent( 'codebase','http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0','width','1002','height','204','src','images/top','quality','high','pluginspage','http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash','movie','images/top' ); //end AC code
    </script>
      <noscript>
      <object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=9,0,28,0" width="1002" height="204">
        <param name="movie" value="images/top.swf" />
        <param name="quality" value="high" />
        <embed src="images/top.swf" quality="high" pluginspage="http://www.adobe.com/shockwave/download/download.cgi?P1_Prod_Version=ShockwaveFlash" type="application/x-shockwave-flash" width="1002" height="204"></embed>
      </object>
      </noscript>    </td>
  </tr>
  <tr>
    <td><img src="images/index_02.gif" width="1002" height="9" /></td>
  </tr>
  <tr>
    <td><table cellspacing="" cellpadding="0" width="100%" border=0>
        <tr>
          <td width=174><img height=45
            src="images/index_03.gif" width=174></td>
          <td width=79><A href="../news/index.jsp"><img
            src="images/index_04.gif" border=0></A></td>
          <td width=96><A href="../grzq.jsp"><img
            src="images/index_05.gif" border=0></A></td>
          <td width=89><A href="../sszx.jsp"><img
            src="images/index_06.gif" border=0></A></td>
          <td width=91><A href="../hyzf.jsp"><img
            src="images/index_07.gif" border=0></A></td>
          <td width=90><A href="../bbs/"><img
            src="images/index_08.gif" border=0></A></td>
          <td width=88><A href="../wtjd.jsp?type=0"><img
            src="images/index_09.gif" border=0></A></td>
          <td width=88><A href="../kfzx.jsp"><img
            src="images/index_10.gif" border=0></A></td>
          <td><img height=45 src="images/index_11.gif"
            width=207></td></tr></table></td>
  </tr>
  <tr>
    <td><img height=6 src="images/index_12.gif"
    width=1002></td></tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" class="main">
  <tr>
    <td><table border="0" cellspacing="0" cellpadding="0" class="left">
      <tr>
        <td valign="top"><table class=bgbj cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tr>
          <td><img src="images/2010-4/login.jpg" width="160" height="59" /></td>
        </tr>
        <form name="form1" action="../checkuser.jsp" method=post target=_blank>
        <tr>
          <td style="padding-top: 8px" background="images/index_33.gif">
            <table cellspacing=0 cellPadding=0 width="127" align="center" border="0">
              <tr>
                <td><img src="images/index_36.gif" width=36 height=14></td>
                <td><input class=input01 maxLength=20 size=12 name=username  width="100%"></td></tr>
              <tr>
                <td><img src="images/index_42.gif" width=36 height=14></td>
                <td><input class=input01 type=password maxLength=20 size=12 name=password width="100%"></td></tr>
              <tr>
                <td><img src="images/index_361.gif" width=36 height=14></td>
                <td>
                  <table cellspacing=0 cellpadding=0 width="100%" border=0>
                    <tr>
                      <td><input class=input01 type=password maxLength=4 size=3 name=imager width="10"></td>
                      <td><img src="../images/imager.jsp" width=50 height="17" align=bottom></td>
                    </tr></table></td></tr>
              <tr>
                <td align="center" colSpan=2><a class=link04 title="51交友中心_332个城市的专业交友平台"
                  href="../forget.jsp"
                target=_blank>忘记密码</a></td></tr>
              <tr>
                <td align=right colSpan=2>
                  <div align=center><input type=image height="20" width="60"
                  src="images/index_60.gif"
                  name=Submit2>&nbsp;&nbsp;<a title="51交友中心_332个城市的专业交友平台"
                  href="../reg.jsp" target=_blank><img
                  height=20 alt=51交友中心_332个城市的专业交友平台
                  src="images/index_62.gif" width=60 border=0></a></div></td></tr></table></td></tr></form>
        <tr>
          <td><img alt="51交友中心_332个城市的专业交友平台" src="images/index_68.gif" width=160 height=25></td></tr>
        <tr>
          <td><a title="51交友中心_332个城市的专业交友平台"
            href="../sszx.jsp" target=_blank><img alt="51交友中心_332个城市的专业交友平台" src="images/index_71.gif" width=160  height=55 border=0></a></td></tr>
        <tr>
          <td><img height=12 alt="51交友中心_332个城市的专业交友平台"
            src="images/index_84.gif" width=160></td></tr></table>
  <table width="100%" border="0" cellpadding="0" cellspacing="0" class="bgbj">
        <tr>
          <td><img src="images/index_91.gif" width="160" height="23" /></td>
        </tr>
        <tr>
          <td background="images/index_97.gif" style="padding-top:17px;">
          <form name="form2" action="../searchjg.jsp" method=post target=_blank >
          <table width="128" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
              <td width="34"><img src="images/index_102.gif" width="24" height="12" /></td>
              <td>
                <select class=border id=sex size=1 name=sex> <option
                    value=0 selected>不限</option> <option value=10>男</option>
                    <option value=11>女</option></select></td>
            </tr>
            <tr>
              <td height="6" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/index_106.gif" width="24" height="13" /></td>
              <td><select class=border id=hyzk size=1 name=hyzk> <option
                    value=0 selected>不限</option> <option value=10>未婚</option>
                    <option value=12>单身</option> <option
                  value=11>已婚</option></select></td>
            </tr>
            <tr>
              <td height="10" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/index_109.gif" width="24" height="14" /></td>
              <td><select name=address> <option value=北京
                    selected>北京</option> <option value=天津>天津</option> <option
                    value=河北>河北</option> <option value=山西>山西</option> <option
                    value=内蒙古>内蒙古</option> <option value=辽宁>辽宁</option> <option
                    value=吉林>吉林</option> <option value=黑龙江>黑龙江</option> <option
                    value=上海>上海</option> <option value=江苏>江苏</option> <option
                    value=浙江>浙江</option> <option value=安徽>安徽</option> <option
                    value=福建>福建</option> <option value=江西>江西</option> <option
                    value=山东>山东</option> <option value=河南>河南</option> <option
                    value=湖北>湖北</option> <option value=湖南>湖南</option> <option
                    value=广东>广东</option> <option value=广西>广西</option> <option
                    value=海南>海南</option> <option value=重庆>重庆</option> <option
                    value=四川>四川</option> <option value=贵州>贵州</option> <option
                    value=云南>云南</option> <option value=西藏>西藏</option> <option
                    value=陕西>陕西</option> <option value=甘肃>甘肃</option> <option
                    value=青海>青海</option> <option value=宁夏>宁夏</option> <option
                    value=新疆>新疆</option> <option value=香港>香港</option> <option
                    value=澳门>澳门</option> <option value=台湾>台湾</option> <option
                    value=国外>国外</option></select></td>
            </tr>
            <tr>
              <td colspan="2" align="center" valign="bottom" height="25"><input type=image src="images/index_114.gif" border="0" width="68" height="19" name=B1></td>
              </tr>
          </table></form></td>
        </tr>
        <tr>
          <td><img src="images/index_116.gif" width="160" height="22" /></td>
        </tr>
      </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img src="images/index_120.gif" width="160" height="23" /></td>
        </tr>
        <tr>
          <td background="images/index_97.gif" style="padding-top:14px;"><table width="128" border="0" align="center" cellpadding="0" cellspacing="0">
     <form name="personal1" action="../searchjg01.jsp" method=post target=_blank>
            <tr>
              <td width="34"><img src="images/index_131.gif" width="24" height="13" /></td>
              <td><select class=border id=jyyxzz size=1 name=jyyx> <option
                    value=0 selected>不限</option> <option value=1>纯友谊</option>
                    <option value=2>异性恋人</option> <option value=3>同性恋人</option>
                    <option value=4>婚姻</option> <option value=5>E夜情</option>
                    <option value=6>陪伴</option> <option
                  value=7>其它</option></select></td>
            </tr>
            <tr>
              <td height="9" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/index_136.gif" width="24" height="13" /></td>
              <td><select class=border id=sex size=1 name=sex> <option
                    value=0 selected>不限</option> <option value=10>男</option>
                    <option value=11>女</option></select></td>
            </tr>
            <tr>
              <td height="9" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/index_140.gif" width="24" height="12" /></td>
              <td><select class=border id=hyzk size=1 name=hyzk> <option
                    value=0 selected>不限</option> <option value=10>未婚</option>
                    <option value=12>单身</option> <option
                  value=11>已婚</option></select></td>
            </tr>
            <tr>
              <td height="9" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/index_143.gif" width="24" height="12" /></td>
              <td><select class=border id=yx size=1 name=yx> <option
                    value=0 selected>不限</option> <option
                    value=10>2万元以下</option> <option
                    value=11>2-5万元</option> <option
                    value=12>5-10万元</option> <option
                    value=13>10-100万元 </option> <option
                    value=14>100万元以上 </option></select></td>
            </tr>
            <tr>
              <td height="9" colspan="2"></td>
              </tr>
            <tr>
              <td><img src="images/zz.gif" width="24" height="13" /></td>
              <td><select class=border id=address size=1 name=address>
                    <option value=北京 selected>北京</option> <option
                    value=天津>天津</option> <option value=河北>河北</option> <option
                    value=山西>山西</option> <option value=内蒙古>内蒙古</option> <option
                    value=辽宁>辽宁</option> <option value=吉林>吉林</option> <option
                    value=黑龙江>黑龙江</option> <option value=上海>上海</option> <option
                    value=江苏>江苏</option> <option value=浙江>浙江</option> <option
                    value=安徽>安徽</option> <option value=福建>福建</option> <option
                    value=江西>江西</option> <option value=山东>山东</option> <option
                    value=河南>河南</option> <option value=湖北>湖北</option> <option
                    value=湖南>湖南</option> <option value=广东>广东</option> <option
                    value=广西>广西</option> <option value=海南>海南</option> <option
                    value=重庆>重庆</option> <option value=四川>四川</option> <option
                    value=贵州>贵州</option> <option value=云南>云南</option> <option
                    value=西藏>西藏</option> <option value=陕西>陕西</option> <option
                    value=甘肃>甘肃</option> <option value=青海>青海</option> <option
                    value=宁夏>宁夏</option> <option value=新疆>新疆</option> <option
                    value=香港>香港</option> <option value=澳门>澳门</option> <option
                    value=台湾>台湾</option> <option
              value=国外>国外</option></select></td>
            </tr>
            <tr>
              <td height="9" colspan="2"></td>
              </tr>
            <tr>
              <td colspan="2" align="center"><input type=image src="images/index_114.gif" border=0 width="68" height="19" name=B1></td>
              </tr></form>
          </table></td>
        </tr>
        <tr>
          <td><img src="images/index_147.gif" width="160" height="27" /></td>
        </tr>
      </table>
        </td>
      </tr>
    </table>
    <table class="middle" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td valign="top"><div id="zwbg01">
      <div id="zwbg02">
        <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="bjbj02">
          <tr>
            <td width="11">&nbsp;</td>
            <td width="30"><img src="images/index_19.gif" width="30" height="35" /></td>
            <td background="images/index_20.gif" class="tit01">
			<%
                    Wtjd wtjd = WTJDMng.getGgNews();
                    if(wtjd != null){
                      %>
			<marquee onMouseOver="this.stop();" onMouseOut="this.start();" scrolldelay="150" width="540"><a href="#" onClick="MM_openBrWindow('../gonggao.jsp?id=<%=wtjd.getId()%>','51lover交友中心','scrollbars=yes,width=520,height=520')"><%=wtjd.getAsk()%></a>
            </marquee>
			 <% }%>
			</td>
            <td width="30"><img src="images/index_22.gif" width="30" height="35" /></td>
            <td width="9">&nbsp;</td>
          </tr>
        </table>
        <table width="601" border="0" align="center" cellpadding="0" cellspacing="0" class="bjbj02">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="135"><img src="images/index_29.gif" width="135" height="27" /></td>
                <td background="images/index_30.gif">&nbsp;</td>
                <td width="10"><img src="images/index_32.gif" width="10" height="27" /></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td background="images/index_41.gif">
			<table width="577" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:17px 0px 6px 0px;">
              <%=CacheTools.getTopOneSbNew()%>
            </table></td>
          </tr>
          <tr>
            <td><img src="images/index_82.gif" width="601" height="7" /></td>
          </tr>
        </table>
        <table width="601" border="0" align="center" cellpadding="0" cellspacing="0" class="bjbj02">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="135"><img src="images/index_86.gif" width="141" height="28" /></td>
                  <td background="images/index_87.gif">&nbsp;</td>
                  <td width="7"><img src="images/index_89.gif" width="7" height="28" /></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td background="images/index_95.gif"><table width="577" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:14px 0px 1px 0px; line-height:0px;">
             <%=CacheTools.getTopRqzwManSbNew()%>
            </table></td>
          </tr>
          <tr>
            <td><img src="images/index_121.gif" width="601" height="15" /></td>
          </tr>
        </table>
        <table width="601" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="135"><img src="images/index_124.gif" width="143" height="28" /></td>
                  <td background="images/index_125.gif">&nbsp;</td>
                  <td width="7"><img src="images/index_127.gif" width="7" height="28" /></td>
                </tr>
            </table></td>
          </tr>
          <tr>
            <td background="images/index_134.gif"><table width="577" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:12px 0px 0px 0px; line-height:0px;">
             <%=CacheTools.getTopRqzwWonSbNew()%>
            </table></td>
          </tr>
          <tr>
            <td><img src="images/index_145.gif" width="601" height="15" /></td>
          </tr>
        </table>
      </div>
    </div></td>
  </tr>
</table>
<table border="0" cellspacing="0" cellpadding="0" class="right">
  <tr>
    <td valign="top"><table class=bgbj cellSpacing=0 cellPadding=0 width="100%" border=0>
        <tr>
          <td><img src="images/2010-4/right1.jpg" width="146" height="23" /></td>
        </tr>
        <tr>
          <td style="padding-top:14px" background="images/index_24.gif">
            <table style="margin-left: 10px" cellSpacing=0 cellPadding=0 width=128 border=0>
              <tr>
                <td align=left><B>总注册：<%=(long)(CacheTools.getAll_user()*CacheTools.v1)%>人</B></td></tr>
              <tr>
                <td align=left><B>昨日新增：<%=(long)(CacheTools.getAllUserVday()*CacheTools.v3)%>人</B></td></tr>
              <tr>
                <td align=left><B>今日访问：<%=(long)(CacheTools.getAccessToday()*CacheTools.v4)%>人</B></td></tr>
              <tr>
                <td align=left><B>目前在线：<%=(long)(CacheTools.getUserOnline()*CacheTools.v5)%>人</B></td></tr></table></td></tr>
        <tr>
          <td><IMG height=26 alt=51交友中心_332个城市的专业交友平台
            src="images/index_58.gif"
        width=146></td></tr></table>
		<table class="bgbj" width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/2010-4/right2.jpg" width="146" height="23" /></td>
  </tr>
  <tr>
    <td class="sideNews"><table class="sideNews_cont" border="0" cellspacing="0" cellpadding="0">

      <%
      for(int i =0;i < CacheTools.ggList.size();i ++)
      {
         Wtjd temp = (Wtjd)CacheTools.ggList.get(i);
      %>
      <tr>
        <td class="sideNews_contlist"><a href="#" onClick="MM_openBrWindow('../veiwwt.jsp?id=<%=temp.getId()%>','51lover交友中心','scrollbars=yes,width=520,height=520')"><%=temp.getAsk()%></a></td>
      </tr>
      <%
      }
      %>
      <tr>
        <td height="30" align="center" valign="bottom"><a href="../wtjd.jsp?type=2"><img src="images/2010-4/more.jpg" width="68" height="19" border="0" /></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/2010-4/right3.gif" width="146" height="22" /></td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/2010-4/right4.jpg" width="146" height="23" /></td>
  </tr>
  <tr>
    <td class="area"><table class="areaFriend" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=北京">北京交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=广东">广东交友</a></td>
      </tr>
      <tr>
        <td colspan="3" height="8"></td>
      </tr>
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=上海">上海交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=江苏">江苏交友</a></td>
        </tr>
      <tr>
        <td colspan="3" height="8">&nbsp;</td>
      </tr>
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=山东">山东交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=浙江">浙江交友</a></td>
      </tr>
      <tr>
        <td colspan="3" height="8">&nbsp;</td>
      </tr>
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=湖南">湖南交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=河南">河南交友</a></td>      </tr>
      <tr>
        <td colspan="3" height="8">&nbsp;</td>
      </tr>
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=四川">四川交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=湖北">湖北交友<a></td>
      </tr>
      <tr>
        <td colspan="3" height="8">&nbsp;</td>
      </tr>
      <tr>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=河北">河北交友</a></td>
        <td width="5">&nbsp;</td>
        <td class="areaFriend_list"><a href="areafriend.jsp?address=辽宁">辽宁交友</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/2010-4/right5.gif" width="146" height="27" /></td>
  </tr>
</table>

		</td>
  </tr>
</table>

    </td>
  </tr>
</table>
<table cellspacing=0 cellpadding=0 width="936" align=center border=0>
  <tr>
    <td>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tr>
          <td>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tr>
                <td width=274><img height=34 src="images/index_149.gif" width=274></td>
                <td background=images/index_150.gif>&nbsp;</td>
                <td width=9><img height=34 alt=51交友中心_332个城市的专业交友平台 src="images/index_153.gif" width=9></td></tr></table></td></tr>
        <tr>
          <td style="padding:8px 14px;" background=images/index_154.gif><%=CacheTools.getNewUserSbNew().toString()%></td>
        </tr>
        <tr>
          <td><img height=13 alt=51交友中心_332个城市的专业交友平台
            src="images/index_156.gif" width=936></td></tr>
        <tr>
          <td class="friendlink"><table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td width="10%"><img src="images/2010-4/friendlink.jpg" width="102" height="26" /></td>
              <td width="90%" align="right" class="applylink"><a href="../sitereg.jsp" target="_blank">申请51交友中心网站友情链接</a></td>
            </tr>
            <tr>
              <td colspan="2" class="piclink">
			  <%=CacheTools.getFriendLinkNew()%>
			  </td>
            </tr>
            <tr>
              <td colspan="2" align="center" style="padding-top:10px;">
              <%=CacheTools.getFriendSiteLink()%>
              </td>
            </tr>
          </table></td>
        </tr></table></td>
    </tr></table>
	<DIV id=bottom>
<TABLE cellSpacing=0 cellPadding=0 width="100%" align=center border=0>
  <TBODY>
  <TR>
    <TD class=banquan align=right width="49%">51交友中心网站运营商：<A class=link01
      style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.htgroup.com.cn/jsht-ry.htm"
      target=_blank>汇特机构·南京融亚网络技术有限公司</A><BR>
      地址：南京宁六路359号沿江新城管委会4层<BR>经营许可证编号:<A
      class=link01 style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.51lover.org/logo/icp.jpg"
      target=_blank>苏B2-20090263</A><BR>网站备案号:<A class=link01
      style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.miibeian.gov.cn/" target=_blank>苏ICP备05003319号</A> </TD>
    <TD width="2%">&nbsp;</TD>
    <TD class=banquan width="49%" colSpan=2>法律顾问：中国·江苏法德永衡律师事务所 <BR>结算支持：<A
      class=link01 style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.chinapay.com/newportal/net/pay_online_merchant.jsp"
      target=_blank>中国银联电子支付公司</A><BR>51交友中心 版权所有 <BR>版权号:<A class=link01
      style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.51lover.org/logo/zzq2.jpg"
      target=_blank>作登字10-2010-J-240</A></TD></TR>
  <TR>
    <TD colSpan=4 height=13></TD></TR></TBODY></TABLE>
	<table width="100%">
	<tr>
	<td align="center"><a href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1680527550"><IMG src="images/AAA2.gif"></a></td>
	</tr>
	</table>
</DIV>
</body>
</html>
