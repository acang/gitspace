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
   String yx   = SysCommonFunc.getStrParameter(request,"yx");
   if(yx.length() ==0)
     yx = "0";

   String jyyx = SysCommonFunc.getStrParameter(request,"jyyx");
   int jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);



   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///得到用户列表
   String sql = "from Userinfo as o where o.isdel = 0 ";
   //String sql = "select o.hyid,o.lcname,o.csdate,o.sex,o.hyzk,o.yx,o.s1,o.s2,o.jyyx,o.setzt from Userinfo as o where o.isdel = 0 ";


   if(address.length() > 1)
     sql = sql + " and o.s1 ='"+address+"'";
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
     sql = sql+" order by o.hyid desc";

   QueryResult qr = null;
   long start = System.currentTimeMillis();
   if(tcount > 0)
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   else
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   long step = System.currentTimeMillis()-start;

   System.out.println("time="+step/1000);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;


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
          <td width=79><A href="index.jsp"><img
            src="images/index_04.gif" border=0></A></td>
          <td width=96><A href="../grzq.jsp"><img
            src="images/index_05.gif" border=0></A></td>
          <td width=89><A href="../sszx.jsp"><img
            src="images/index_06.gif" border=0></A></td>
          <td width=91><A href="../hyzf.jsp"><img
            src="images/index_07.gif" border=0></A></td>
          <td width=90><A href="../bbs/"><img
            src="images/index_08.gif" border=0></A></td>
          <td width=88><A href="../wtjd.jsp"><img
            src="images/index_09.gif" border=0></A></td>
          <td width=88><A href="http://www.51lover.org/kfzx.jsp"><img
            src="images/index_10.gif" border=0></A></td>
          <td><img height=45 src="images/index_11.gif"
            width=207></td></tr></table></td>
  </tr>
  <tr>
    <td><img height=6 src="images/index_12.gif"
    width=1002></td></tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
    <td valign="top"><img src="images/reg/001.gif" width="936" height="22" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td width="33">&nbsp;</td>
    <td valign="top" background="images/reg/bg3.gif"><div id="zwbg05">
      <div id="zwbg06">
        <table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="1" colspan="3"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
            </tr>
          <tr>
            <td width="10"><img src="images/reg/07.gif" width="10" height="36" /></td>
            <td align="center" background="images/reg/08.gif" class="tit09">地区交友</td>
            <td width="7"><img src="images/reg/09.gif" width="7" height="36" /></td>
          </tr>
        </table>
       <table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><table class="ssjg" border="0" cellpadding="2" cellspacing="1" bgcolor="#77a9d5">
      <tr>
        <td align="left" colspan="9" class="ssjg_title">&nbsp;序号&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;昵称&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年龄性别婚否&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;年薪&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;地址&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交友意向&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;交友状态</td>
        </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Userinfo temp = (Userinfo)qr.resultList.get(i);
   String lcname = temp.getLcname();
   Date csdate = temp.getCsdate();
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "未知";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   String vsex = DicList.getDicValue(SysDefine.DIC_SEX,temp.getSex(),1);
   String vhyzk = DicList.getDicValue(SysDefine.DIC_HYZH,temp.getHyzk(),1);
   String vyx   = DicList.getDicValue(SysDefine.DIC_YX,temp.getYx(),1);
   String s1 = temp.getS1() == null? "":temp.getS1();
   String vjyyx = LoverTools.getJYYXDes(temp);
   String jyzt = LoverTools.getJYZTDes(temp);

%>

            <tr>
                  <td align="center" bgcolor="#D6E6F3"><strong><%=(cpage-1)*pagesize+i+1%></strong></td>
                  <td align="center" bgcolor="#FFFFFF">
                  <a href="perinfo.jsp?id=<%=temp.getHyid()%>" target="_blank" class="new_link06"><%=lcname%></a>                  </td>
                  <td align="center" bgcolor="#FFFFFF"><%=age%></td>
                  <td align="center" bgcolor="#FFFFFF"><%=vsex%></td>
                  <td align="center" bgcolor="#FFFFFF"><%=vhyzk%></td>
                  <td align="center" bgcolor="#FFFFFF"><%=vyx%></td>
                  <td align="center" bgcolor="#FFFFFF"><%=s1%></td>
                  <td align="center" bgcolor="#FFFFFF"><%=vjyyx%></td>
                  <td align="center" bgcolor="#FFFFFF" class="new_tit08"><%=jyzt%></td>
                </tr>
<%
}
%>
            <tr>
              <td colspan="9" align="center" bgcolor="#D6E6F3">			  <form name="go2to" method="post" action="areafriend.jsp">
                            <input type="hidden" name="sex" value="<%=sex%>"/>
                            <input type="hidden" name="address" value="<%=address%>" />
                            <input type="hidden" name="hyzk" value="<%=hyzk%>" />
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">

页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>个会员 &nbsp;&nbsp;
<%
if(cpage == 1)
  out.println("首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; ");
else
{
  out.println("<a href='javascript:turn(1)'>首    页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")'>上一页</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("下一页&nbsp;&nbsp;尾页&nbsp;&nbsp; ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")'>下一页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")'>尾页</a>&nbsp;&nbsp;");
}
%>
<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'>
</form>
</font></td>
              </tr>
    </table>
 <table class="area_right" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/2010-4/search.jpg" width="160" height="24" /></td>
  </tr>
  <tr>
    <td class="search"><table class="search_list" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="fenlei">按性别选择：</td>
      </tr>
      <tr>
        <td class="xux" style="padding-bottom:8px;">
        <ul>
        <li><a href="areafriend.jsp?sex=10">帅哥</a></li>
        <li> <a href="areafriend.jsp?sex=11">美女</a></li></ul></td>
        </tr>
      <tr>
        <td class="fenlei">按婚姻状况选择：</td>
      </tr>
      <tr>
        <td class="xux" style="padding-bottom:8px;">        <ul>
          <li><a href="areafriend.jsp?hyzk=11"> 已婚</a></li>
        <li><a href="areafriend.jsp?hyzk=10">未婚</a></li></ul></td>
        </tr>
      <tr>
        <td class="fenlei">按年薪选择：</td>
      </tr>

      <tr>
        <td><a href="areafriend.jsp?yx=10">2万元以下</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?yx=11">2-5万元</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?yx=12">5-10万元</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?yx=13">10-100万元 </a></td>
      </tr>
      <tr>
        <td class="xux" style="padding-bottom:8px;"><a href="areafriend.jsp?yx=14">100万元以上 </a></td>
      </tr>
      <tr>
        <td class="fenlei">按交友意向选择：</td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?jyyx=1">纯友谊</a>    <a href="areafriend.jsp?jyyx=2">异性恋人</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?jyyx=3">同性恋人</a>  <a href="areafriend.jsp?jyyx=4">婚姻</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?jyyx=5">E夜情</a>     <a href="areafriend.jsp?jyyx=6">陪伴</a></td>
      </tr>
      <tr>
        <td><a href="areafriend.jsp?jyyx=7">其他</a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><a href="../sszx.jsp"><img src="images/2010-4/search1.jpg" width="160" height="55" border="0" style="margin-top:3px;" /></a></td>
  </tr>
</table>

    </td>
  </tr>
</table>

      </div>
    </div></td>
    <td width="33">&nbsp;</td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="33"></td>
    <td style="padding:4px 0px;"><img src="images/reg/grzq_49.gif" width="936" height="4" /></td>
    <td width="33"></td>
  </tr>
</table>
<div id=bottom>
<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>

  <tr>
    <td class=banquan align=right width="49%">51交友中心网站运营商：<A class=link01
      style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.htgroup.com.cn/jsht-ry.htm"
      target=_blank>中国·南京汇特网络传媒有限公司</A><br>
      地址：南京宁六路359号沿江新城管委会4层<br>经营许可证编号:<a
      class=link01 style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.51lover.org/logo/icp.jpg"
      target=_blank>苏B2-20040050</A><br>网站备案号:<a class=link01
      style="border-bottom: #ffffff 1px solid"
      href="http://www.miibeian.gov.cn/" target=_blank>苏ICP备05003319号</a> </td>
    <td width="2%">&nbsp;</td>
    <td class=banquan width="49%" colSpan=2>法律顾问：中国·江苏法德永衡律师事务所 <br>结算支持：<A
      class=link01 style="border-bottom:#ffffff 1px solid"
      href="http://www.chinapay.com/newportal/net/pay_online_merchant.jsp"
      target=_blank>中国银联电子支付公司</A><BR>51交友中心 版权所有 <br>版权号:<A class=link01
      style="border-bottom: #ffffff 1px solid"
      href="http://www.51lover.org/logo/zzq2.jpg"
      target=_blank>作登字10-2010-J-240</A></td></tr>
  <tr>
    <td colSpan=4 height=13></td></tr></table></div>
</body>
</html>





