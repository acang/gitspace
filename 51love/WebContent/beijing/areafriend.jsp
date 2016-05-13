<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
   String sex = SysCommonFunc.getStrParameter(request,"sex");
   if(sex.length() ==0)
     sex = "0";
   String hyzk  = SysCommonFunc.getStrParameter(request,"hyzk");
   if(hyzk.length() ==0)
     hyzk = "0";

  String address = SysCommonFunc.getStrParameter(request,"address");
  if(address.length() ==0)
  {
     String uri = request.getRequestURI();
     if(uri.indexOf("beijing") > -1)
       address = "beijing";
     else if(uri.indexOf("guangdong") > -1)
       address = "guangdong";
     else if(uri.indexOf("shanghai") > -1)
       address = "shanghai";
     else if(uri.indexOf("jiangsu") > -1)
       address = "jiangsu";
     else if(uri.indexOf("shandong") > -1)
       address = "shandong";
     else if(uri.indexOf("zhejiang") > -1)
       address = "zhejiang";
     else if(uri.indexOf("hunan") > -1)
       address = "hunan";
     else if(uri.indexOf("henan") > -1)
       address = "henan";
     else if(uri.indexOf("sichuan") > -1)
       address = "sichuan";
     else if(uri.indexOf("hubei") > -1)
       address = "hubei";
     else if(uri.indexOf("hebei") > -1)
       address = "hebei";
     else if(uri.indexOf("liaoning") > -1)
       address = "liaoning";
      else if(uri.indexOf("nanjing") > -1)
       address = "nanjing";
      else if(uri.indexOf("tianjin") > -1)
       address = "tianjin";
       else if(uri.indexOf("chongqing") > -1)
       address = "chongqing";
       else if(uri.indexOf("guangzhou") > -1)
       address = "guangzhou";
       else if(uri.indexOf("shenzhen") > -1)
       address = "shenzhen";
       else if(uri.indexOf("chengdu") > -1)
       address = "chengdu";
       else if(uri.indexOf("wuhan") > -1)
       address = "wuhan";
       else if(uri.indexOf("xian") > -1)
       address = "xian";
       else if(uri.indexOf("zhengzhou") > -1)
       address = "zhengzhou";
       else if(uri.indexOf("suzhou") > -1)
       address = "suzhou";
       else if(uri.indexOf("jinan") > -1)
       address = "jinan";
       else if(uri.indexOf("hangzhou") > -1)
       address = "hangzhou";
       else if(uri.indexOf("changsha") > -1)
       address = "changsha";
       else if(uri.indexOf("qingdao") > -1)
       address = "qingdao";
       else if(uri.indexOf("shijiazhuang") > -1)
       address = "shijiazhuang";
       else if(uri.indexOf("dongguan") > -1)
       address = "dongguan";
       else if(uri.indexOf("haerbin") > -1)
       address = "haerbin";
       else if(uri.indexOf("shenyang") > -1)
       address = "shenyang";
       else if(uri.indexOf("hefei") > -1)
       address = "hefei";
       else if(uri.indexOf("taiyuan") > -1)
       address = "taiyuan";
       else if (uri.indexOf("fuzhou") >-1)
       address = "fuzhou";
       else if (uri.indexOf("dalian")>-1)
       address = "dalian";
       
     
  }



   String address1="";
   String s2 = "";
   if(address.equals("dalian"))
   {
   		s2 = "大连";
   }
   if(address.equals("beijing"))
   {
   		address1="北京";
   }
   if(address.equals("nanjing"))
   {
   		//address1="江苏";
   		s2 = "南京";
   }
   if(address.equals("tianjin"))
   {
   		address1="天津";
   		//s2 = "天津";
   }
   if(address.equals("chongqing"))
   {
   		address1="重庆";
   		//s2 = "重庆";
   }
   if(address.equals("fuzhou")){
   		//address1="福建";
   		s2 ="福州";
   }
   if(address.equals("guangzhou"))
   {
   		//address1="广东";
   		s2 = "广州";
   }
   if(address.equals("shenzhen"))
   {
   		//address1="广东";
   		s2 = "深圳";
   }
   if(address.equals("chengdu"))
   {
   		//address1="四川";
   		s2 = "成都";
   }
   if(address.equals("wuhan"))
   {
   		//address1="湖北";
   		s2 = "武汉";
   }
   if(address.equals("xian"))
   {
   		//address1="陕西";
   		s2 = "西安";
   }
   if(address.equals("zhengzhou"))
   {
   		//address1="河南";
   		s2 = "郑州";
   }
   if(address.equals("suzhou"))
   {
   		//address1="江苏";
   		s2 = "苏州";
   }
   if(address.equals("jinan"))
   {
   		//address1="山东";
   		s2 = "济南";
   }
   if(address.equals("hangzhou"))
   {
   		//address1="浙江";
   		s2 = "杭州";
   }
   if(address.equals("changsha"))
   {
   		//address1="湖南";
   		s2 = "长沙";
   }
   if(address.equals("qingdao"))
   {
   		//address1="山东";
   		s2 = "青岛";
   }
   if(address.equals("shijiazhuang"))
   {
   		//address1="河北";
   		s2 = "石家庄";
   }
   if(address.equals("dongguan"))
   {
   		//address1="广东";
   		s2 = "东莞";
   }
   if(address.equals("haerbin"))
   {
   		//address1="黑龙江";
   		s2 = "哈尔滨";
   }
   if(address.equals("shenyang"))
   {
   		//address1="辽宁";
   		s2 = "沈阳";
   }
   if(address.equals("hefei"))
   {
   		//address1="安徽";
   		s2 = "合肥";
   }
   if(address.equals("taiyuan"))
   {
   		//address1="山西";
   		s2 = "太原";
   }

 

   if(address.equals("shanghai"))
   {
   		address1="上海";
   }


   String yx   = SysCommonFunc.getStrParameter(request,"yx");
   if(yx.length() ==0)
     yx = "0";

   String jyyx = SysCommonFunc.getStrParameter(request,"jyyx");
   int jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
   if(jyyx.length() > 0 || yx.length() > 1)
   {

  if(loginUser == null)
  {
    out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先注册！');window.location.href='../reg.htm';</script>");
    return;

  }
   }



   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///得到用户列表
   String sql = "from Userinfo as o where o.isdel = 0 ";
   //String sql = "select o.hyid,o.lcname,o.csdate,o.sex,o.hyzk,o.yx,o.s1,o.s2,o.jyyx,o.setzt from Userinfo as o where o.isdel = 0 ";


   if(address1.length() > 1)
     sql = sql + " and o.s1= '"+address1+"'";
   if(s2 != null && s2.length() > 1)
     sql = sql + " and o.s2='"+s2+"'";
   if(sex.length() > 1)
      sql = sql + " and o.sex ='"+sex+"'";
   if(hyzk.length() > 1)
      sql = sql + " and o.hyzk = '"+hyzk+"'";

   if(yx.length() > 1)
      sql = sql + " and o.yx = '"+yx+"'";
   if(jyyxP > 0 && jyyxP < 8)
   {
      sql = sql + " and jyyx like '"+LoverTools.getMinJyyx(jyyxP)+"'";
   }


   if(sex.length() > 1 && sex.equals("11") || address.equals("上海") || address.equals("广东") || address.equals("天津"))
     sql = sql+" order by o.img desc,o.flag desc,o.lasttime desc";
   else
     sql = sql+" order by o.img desc,o.lasttime desc";




   long start = System.currentTimeMillis();

   //QueryResult qr = null;  qr = QueryRecord.queryByHbm(sql,pagesize,cpage);


   //long step = System.currentTimeMillis()-start;

   //System.out.println("time="+step/1000);
   //int totalPage = qr.pageCount;
   //int totalCount = qr.rowCount;
   //cpage = qr.pageNum;
   //int prepage = cpage-1;
   //int nextpage = cpage+1;

    String dqname = address1.length() > 0 ? address1:s2;


%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心-—中国顶级情感类交友网站。会员遍布北京交友,广东交友,上海交友,江苏交友等全国各大省市。51交友中心稳健专业、快捷超值,已积累1000多万情感交友会员。" />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />

<link href="css/style2012.css" rel="stylesheet" type="text/css" />
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLETEMP {color: #FF0000}
td.txt11 {	font-size: 13px;
	color: #FFFFFF;
	text-decoration: none;
	font-weight: bold;
}
.STYLE1 {font-size: 12px}
-->
</style>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<script type="text/JavaScript">
<!--

function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("请正确填写转到页数！");
                return;
   }

   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}



//-->
</script>
</head>

<body>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="9"><object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1002" height="204">
      <param name="movie" value="images/top.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="opaque" />
      <param name="swfversion" value="8.0.35.0" />
      <!-- 此 param 标签提示使用 Flash Player 6.0 r65 和更高版本的用户下载最新版本的 Flash Player。如果您不想让用户看到该提示，请将其删除。 -->
      <param name="expressinstall" value="Scripts/expressInstall.swf" />
      <!-- 下一个对象标签用于非 IE 浏览器。所以使用 IECC 将其从 IE 隐藏。 -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="images/top.swf" width="1002" height="204">
        <!--<![endif]-->
        <param name="quality" value="high" />
        <param name="wmode" value="opaque" />
        <param name="swfversion" value="8.0.35.0" />
        <param name="expressinstall" value="Scripts/expressInstall.swf" />
        <!-- 浏览器将以下替代内容显示给使用 Flash Player 6.0 和更低版本的用户。 -->
        <div>
          <h4>此页面上的内容需要较新版本的 Adobe Flash Player。</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="获取 Adobe Flash Player" width="112" height="33" /></a></p>
        </div>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object></td>
  </tr>
  <tr>
    <td colspan="9"><img src="images/index_02.gif" width="1002" height="9" /></td>
  </tr>
  <tr>
    <td><img src="images/index_03.gif" width="174" height="45" /></td>
    <td><a href="../index.htm"><img src="images/index_04.gif" width="73" height="45" /></a></td>
    <td><a href="../grzq.htm"><img src="images/index_05.gif" width="89" height="45" /></a></td>
    <td><a href="../sszx.htm"><img src="images/index_06.gif" width="84" height="45" /></a></td>
    <td><a href="../hyzf.htm"><img src="images/index_07.gif" width="84" height="45" /></a></td>
    <td><a href="../bbs/index.htm"><img src="images/index_08.gif" width="85" height="45" /></a></td>
    <td><a href="../wtjd_syzn-type-0.htm"><img src="images/index_09.gif" width="82" height="45" /></a></td>
    <td><a href="../kfzx.htm"><img src="images/index_10.gif" width="124" height="45" /></a></td>
    <td><img src="images/index_11.gif" width="207" height="45" /></td>
  </tr>
  <tr>
    <td colspan="9"><img src="images/index_12.gif" width="1002" height="6" /></td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/001.gif" width="936" height="22" /></td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  background="images/bg1.gif">
  <tr>
    <td width="9">&nbsp;</td>
    <td width="188"><table style="CURSOR: pointer" onclick="" border="0" 
                  cellspacing="0" cellpadding="0" width="185">
      
        <tr>
          <td><a href="./new_allhy.htm" target="_blank"><img border="0" src="images/01.gif" width="185" height="36" /></a></td>
        </tr>
        <tr>
          <td background="images/02.gif" width="185" align="right"><table border="0" cellspacing="0" cellpadding="0" width="158"><A href="http://www.51lover.org/new_allhy.htm" target=_blank>
               <tr>
                <td height="5px"></td>
              </tr>
              <tr>
                <td align="left" class="basic"><b>总 注 册：<%=(long)(CacheTools.getAll_user()*CacheTools.v1) %>人</b></td>
              </tr> 
              <tr>
                <td align="left" class="basic"><b>昨日新增：<%=(long)(CacheTools.getAllUserVday()*CacheTools.v3)%>人</b></td>
              </tr>
              <tr>
                <td align="left" class="basic"><b>今日访问：<%=(long)(CacheTools.getAccessToday()*CacheTools.v4)%>人</b></td>
              </tr>
              <!--  <tr>
                <td  align="left" class="basic"><b>目前在线：<%=(long)(CacheTools.getAllOnline()*CacheTools.v5)%>人</b></td>
              </tr>-->
            </A>
          </table></td>
        </tr>
        <tr>
          <td><a href="./new_allhy.htm" 
                        target="_blank"><img border="0" src="images/03.gif" 
                        width="185" height="21" /></a></td>
        </tr>
      
    </table></td>
    <td><table width="729" border="0" cellpadding="0" 
                  cellspacing="0" style="MARGIN-TOP: 0px; MARGIN-LEFT: 1px">
      
        <tr>
          <td class="bk05" bgcolor="#a6c9ea" height="137" valign="top"><table border="0" cellspacing="0" cellpadding="0" width="700" 
                        align="center">
            
              <tr>
                <td width="30"><img src="images/index_19.gif" 
                              width="30" height="35" /></td>
                <td class="tit01" background="images/index_20.gif"><table border="0" cellspacing="0" cellpadding="0" 
                              width="100%">
                  
                    <tr>
                      <td width="125">[51交友中心公告]</td>
                      <td width="520">
                      <%
									Wtjd wtjd = WTJDMng.getGgNews();
										if (wtjd.getStime() != null) {
					  %>
                      <marquee style="WIDTH: 99%" 
                                onmouseover="this.stop();" 
                                onmouseout="this.start();" scrollamount="2" 
                                scrolldelay="2">
                        <a 
                                href="./gonggao-id-<%=wtjd.getId()%>.htm" 
                                target="_blank"><%=wtjd.getAsk()%> </a>
                      </marquee>
                      <%
						 }
					  %>
                      </td>
                    </tr>
                  
                </table></td>
                <td width="30"><img src="images/index_22.gif" 
                              width="30" height="35" /></td>
              </tr>
            
          </table>
           <%
//判断用户类型
  Userinfo grwhqUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  int flag = 0;
  if(grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
    flag = SysDefine.SYSTEM_HY_TYPE_vip;
    //vip会员
    else if (grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
    flag = SysDefine.SYSTEM_HY_TYPE_nvip;
  else if(grwhqUser != null)
    flag = SysDefine.SYSTEM_HY_TYPE_NOR;
%>
<%
if(flag==0)
{
%>
<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09">您好!欢迎来到51交友中心</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong></td>
            <td width="90%" class="style02">游客   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>剩余期限：</strong>无</strong> </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">3个搜索条件，查看会员交友资料。无权查看联系方式。</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_nvip)
{
%><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> 您好!欢迎来到51交友中心&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: 黑体; color: blue; font-size: " >退出登陆<span/></a></td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong><br /></td>
            <td width="90%" class="style02">VIP会员   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余期限：</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%>  </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">16个搜索条件，不限次查看全部自主注册会员的详细联系办法，发送和查看留言。<br />
               普通会员的全部权限<!-- 发送秋波。 --></td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_NOR)
{
%><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> 您好!欢迎来到51交友中心&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: 黑体; color: blue; font-size: " >退出登陆<span/></a></td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong><br /></td>
            <td width="90%" class="style02">普通会员   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余期限：</strong>&nbsp;无 </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">5个搜索条件，查看会员基本交友资料、 查看留言、谁看过我、我看过谁。长期展示自己资料（含照片）、<br />使用资料开放设置、好友名单/黑名单、论坛发帖等10项权限。</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_vip)
{
%>
            <table border="0" cellspacing="0" cellpadding="0" width="700" 
                        align="center">
              
                <tr>
                  <td class="tit09" colspan="2" align="middle"><span 
                              class="tit03"><%=grwhqUser.getLcname()%></span> 您好!欢迎来到51交友中心&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: 黑体; color: blue; font-size: " >退出登陆<span/></a></td>
                </tr>
                <tr>
                  <td height="6" colspan="2" align="middle"><img 
                              src="images/1px.gif" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="style02" 
                              width="10%"><strong>您的等级：</strong><br /></td>
                  <td class="style02" width="90%">白金VIP会员 　　　　　　<strong>剩余期限：</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%> </td>
                </tr>
                <tr>
                  <td style="PADDING-TOP: 2px" class="style02" 
                            valign="top"><strong>您的权限：</strong></td>
                  <td 
                              class="style02">16个搜索条件，不限次查看全部自主注册会员和主动验证会员的详细联系办法。<br />
                   普通会员的全部权限、发送和查看留言、可在留言区公开自己的联系办法。</td>
                </tr>
              
            </table>
            <%} %>
            </td>
        </tr>
      
    </table></td>
    <td width="9">&nbsp;</td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  background="images/bg3.gif">
  <tr>
    <td width="9">&nbsp;</td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="918" align="center">
      <tbody>
        <tr>
          <td height="1" colspan="3"><img src="images/1px.gif" width="1" 
          height="1" /></td>
        </tr>
        <tr>
          <td width="10"><img src="images/07.gif" width="10" height="36" /></td>
          <td class="tit09" background="images/08.gif" align="center"><span class="style03"><%=dqname%>地区交友</span></td>
          <td width="7"><img src="images/09.gif" width="7" height="36" /></td>
        </tr>
      </tbody>
    </table></td>
    <td width="9">&nbsp;</td>
  </tr>
</table>
<div id="page_bg">
<div id="page_bottom">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td width="9">&nbsp;</td>
    <td valign="top" style="border-left: 2px solid #A6C9EA; border-bottom:2px solid #A6C9EA;  border-right:1px solid #a0c3e2; ">
    
    <style type="text/css"> 

.woaicss {width:915px; height:auto; overflow:hidden; margin:0px auto; margin-top:10px }
.woaicss_title {width:900px; height:30px; background:#fff url(images/btn_bg2.png) no-repeat; overflow:hidden;}
.woaicss_title li {display:block; float:left; margin:0 ; display:inline; text-align:center; padding-top:2px}
.woaicss_title li a {display:block; width:auto; heigth:30px; line-height:34px; color:#fff; font-weight:bold}
.woaicss_title li a:hover {color:#f0f0f0; text-decoration:underline;}
.woaicss_title_bg1 {background-position:0 0;}
.woaicss_title_bg2 {background-position:0 -30px;}
.woaicss_title_bg3 {background-position:0 -60px;}
.woaicss_con {display:block; width:910px; min-height:500px;  padding-top:10px;  color:#666 ; overflow:hidden;  }

</style>

<div class="woaicss">
  <div class="woaicss">
    <script language="javascript"> 
	function woaicssq(num){
	for(var id = 1;id<=2;id++)
	{
	var MrJin="woaicss_con"+id;
	if(id==num)
	document.getElementById(MrJin).style.display="block";
	else
	document.getElementById(MrJin).style.display="none";
	}
	if(num==1) 
	document.getElementById("woaicsstitle").className="woaicss_title woaicss_title_bg1";
	if(num==2)
	document.getElementById("woaicsstitle").className="woaicss_title woaicss_title_bg2";
	}
  </script>
    <ul class="woaicss_title woaicss_title_bg1" id="woaicsstitle">
      <li style=" width:105px"><a onmouseover="javascript:woaicssq(1)">已验证会员</a></li>
      <li style=" width:105px"><a onmouseover="javascript:woaicssq(2)">未验证会员</a></li>
    </ul>
    <div class="woaicss_con" id="woaicss_con1" style="display:block;">
			
	<iframe src="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" width="910px" height="770px" scrolling="no" style="background-color=transparent" frameborder="0"></iframe>		 
    </div>
    
    <div class="woaicss_con" id="woaicss_con2" style="display:none;">
			 
	
	<iframe src="area1-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" width="910px" height="770px" scrolling="no" style="background-color=transparent" frameborder="0"></iframe>		 
			 
			 
    </div>

    
  </div>
  
</div>
    </td>
    
    <td width="9">&nbsp;</td>
  </tr>
</table>
</div></div>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  
    <tr>
      <td colspan="8">&nbsp;</td>
    </tr>
    <tr>
      <td width="3%">&nbsp;</td>
      <td width="33%" align="left" class="banquan" valign="top"> 运 营 商：<a href="http://www.51lover.org/veiwwt-id-1080.htm" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">汇特机构&middot;南京融亚网络技术有限公司</a><br />
        地　　址：江苏南京石鼓路107号华威大厦7层<br />
        业务电话：(025) 85519991 <br />
        版权号：<a href="http://www.51lover.org/logo/zzq2.jpg" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">苏作登字-2012-J-3105</a><br /></td>
      <td width="4%">&nbsp;</td>
      <td colspan="2" class="banquan" align="left" valign="top"> 免费客服电话：<b><font style="font-size: 15px" color=""><strong>4000680001</strong></font></b><br />
        客服时间：周一至周日   9：00-21：00<br />
        经营许可证编号：<a href="http://www.51lover.org/logo/icp.jpg" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">苏B2-20090263</a><br />
       51交友中心  版权所有  <br /></td>
      <td width="4%">&nbsp;</td>
      <td width="28%" colspan="2" class="banquan" valign="top"> 法律顾问：中国&middot;江苏法德永衡律师事务所 <br />
        结算支持：<a href="http://www.chinapay.com/newportal" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">中国银联电子支付公司</a><br />
       网站备案号：<a href="http://www.miibeian.gov.cn/" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">苏ICP备11046501</a>  <br />
        </td>
    </tr>
  
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="20">
  <tr>
	<td align="right" style="padding-right:5px"><a href="http://www.itrust.org.cn/" target="_blank"><img src="images/AAA.jpg" border="0"></a></td>
	<td align="left" style="padding-left:5px"><a href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1680527550" target="_blank"><img src="images/AAA2.jpg" border="0"></a></td>
  </tr>
</table>
<style>
    #top22{
        width:300px;
		height:140px;
        position:fixed;
        _position:absolute;
        bottom:0;
        right:0;
		_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));
    }

    *html{
        background-image:url(about:blank);
        background-attachment:fixed;
    }
</style>

<div id="top22" style="display:none">
	<%if(loginUser!=null){ %>
<iframe allowTransparency="true" id="HtmlEditor" name="HtmlEditor"   src = "xttj.jsp" frameborder="0" scrolling="no" >
</iframe>  

<%}%>
</div>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>
