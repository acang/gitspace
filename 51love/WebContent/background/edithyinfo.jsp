<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="java.math.BigDecimal"%>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
int adminflag = 0;
if(adminLoginInfo.getFlag() != null)
  adminflag = adminLoginInfo.getFlag().intValue();
String hyid = SysCommonFunc.getStrParameter(request,"id");
String username = SysCommonFunc.getStrParameter(request,"username");
if(username != null && username.length() > 0)
{
    List templist = HbmOperator.list("from Userinfo as o where o.username='"+username+"' ");
    if(templist != null && templist.size() > 0)
    {
        Userinfo uuuui = (Userinfo)templist.get(0);
        hyid = uuuui.getHyid().toString();
    }
}
int i = 0;
if(hyid.length() ==0)
{
   out.println("会员信息不存在，请重新查找");
   return;
}

String checkhyid = SysCommonFunc.getStrParameter(request,"checkhyid");
if(checkhyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set  VACSJTEL=1 where hyid = " + checkhyid);
}
String uncheckhyid = SysCommonFunc.getStrParameter(request,"uncheckhyid");
if(uncheckhyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set ISVCATION=0, VACSJTEL=0 where hyid = " + uncheckhyid);
}
String shenhehyid = SysCommonFunc.getStrParameter(request,"shenhehyid");
if(shenhehyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set  ISVCATION=1 where hyid = " + shenhehyid);
}


Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1"))
  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
else{
	List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
    if(templist != null && templist.size() > 0)
    {
    	loginUser = (Userinfo)templist.get(0);
    }
}
//  loginUser = HYRegMng.getUserinfoByHyid(hyid);
if(loginUser == null)
{
   out.println("会员信息不存在，请重新查找");
   return;
}else{
	if (loginUser.getVacsjtel()==1){
		i = 1;
	}else if(loginUser.getVacemail()==1){
		i = 0;
	} else{
		i = 2;
	}
}

//更新女会员排序时间
if (loginUser.getSex()!=null && loginUser.getSex().equals("11")){
	HbmOperator.executeSql("update USERINFO set regtime5=sysdate where hyid = " + hyid);
}

Userother uother = HYRegMng.getUserOtherByHyid(hyid);
if(uother == null)
{
  uother = new Userother();
  uother.setJyly("");
  uother.setLxqr("");
  uother.setQggx("");
}

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
if(bizaction.equals("01"))
{
  String s = HYRegMng.adminModUserInfo(request,adminLoginInfo,loginUser,uother);
  if(s == null){
     out.println("<script language='javascript'>location.href=location.href;</script>");
     //response.sendRedirect("edithyinfo.jsp");
	 //更新审核信息
     String tjsql = "update checkinfo set sex= '"+loginUser.getSex()+"' where hyid=" +hyid;
	 HbmOperator.executeSql(tjsql);
  }else
    out.println("<script language='javascript'>alert('"+s+"');</script>");
  return;
}
//if(bizaction.equals("02"))
//{
//  String s = HYRegMng.adminSHUserinfo(request,adminLoginInfo,loginUser,uother);
//  if(s == null)
//    out.println("<script language='javascript'>alert('您已经修改审核情况！');</script>");
//  else
//    out.println("<script language='javascript'>alert('"+s+"！');</script>");
//  return;
//}

%>


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love交友中心</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color:#8CABDE;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#E8F1FF;
	scrollbar-arrow-color:#8CABDE;
	scrollbar-shadow-color:#8CABDE;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#F2F7FF;
}
-->
</style>
<script src="../js/Popup.js"></script>
<script src="../js/tom_reg2.js"></script>

<script language="JavaScript">
<!--
function test()
{
var jyyx01,i,j=0;
if (checkspace(document.personal.lcname.value)){
alert('请输入您的昵称！');
document.personal.lcname.focus();
return false;
}
var s =document.personal.lcname.value ;
if (s.length>12)
{
alert('您输入的昵称不能超过6个字,请重填');
document.personal.lcname.focus();
return false;
}
//var shu="0123456789";
//var s =document.personal.lcname.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('您输入的昵称含有疑似联系办法的内容,请重填');
//document.personal.lcname.focus();
//return false;
//}
j=0;
//var x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('您输入的昵称含有疑似联系办法的内容,请重填');
//document.personal.lcname.focus();
//return false;
//}

var jyyx01=""
i=0;
j=0;
  for (i=0;i<document.personal.jyyx.length;i++) {
       if (document.personal.jyyx[i].checked)
	   { j=1+j;
	   jyyx01=jyyx01+"1"
	   }else
	   {
	   jyyx01=jyyx01+"0"
	   }

  }
  
  if (j==0||j>=5) {
      alert("请选择交友意向！并且不超过四项！")
      return (false);
  }
document.personal.jyyx01.value="1"+jyyx01;


if (checkspace(document.personal.csdate.value)){
alert('请选择您的出生日期！');
document.personal.csdate.focus();
return false;
}
var dtEnd = new Date();
var dtStart = document.personal.csdate.value.substr(0,4);
if ((dtEnd.getFullYear() - dtStart<16)||(dtEnd.getFullYear() - dtStart>70))
{
alert('您的年龄小于16岁，不能注册！');
return false;
}
//if (checkspace(document.personal.qggx.value)){
//alert('请输入您对情爱关系的看法！');
//document.personal.qggx.focus();
//return false;
//}

//var shu="0123456789";
//var s =document.personal.qggx.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('您输入的情爱关系含有疑似联系办法的内容,请重填');
//document.personal.qggx.focus();
//return false;
//}
//j=0;
//var x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('您输入的情爱关系含有疑似联系办法的内容,请重填');
//document.personal.qggx.focus();
//return false;
//}
//if ((document.personal.qggx.value.length<2) || (document.personal.qggx.value.length>300))
//{
//alert('为保证交友效果，情爱关系请在20字以上，不能超过300字，并请勿填写任何联系方式');
//document.personal.qggx.focus();
//return false;
//}
//if (checkspace(document.personal.lxqr.value)){
//alert('请输入您的理想情人！');
//document.personal.lxqr.focus();
//return false;
//}
//if ((document.personal.lxqr.value.length<2) || (document.personal.lxqr.value.length>300))
//{
//alert('为保证交友效果，理想情人请在20字以上，不能超过300字，并请勿填写任何联系方式');
//document.personal.lxqr.focus();
//return false;
//}
//var shu="0123456789";
//var s =document.personal.qggx.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('您输入的情性关系含有疑似联系办法的内容,请重填');
//document.personal.qggx.focus();
//return false;}
//var m = document.personal.lxqr.value;
//if (((m.indexOf("http")>=0)||(m.indexOf("www")>=0)||(m.indexOf("@")>=0)))
//{
//alert('您输入的理想情人含有疑似联系办法的内容,请重填');
//document.personal.lxqr.focus();
//return false;
//}
//j=0;
//var x=0;
//for (i=0;i<m.length;i++)
//{
//if ((shu.indexOf(m.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('您输入的理想情人含有疑似联系办法的内容,请重填');
//document.personal.lxqr.focus();
//return false;
//}


//if (checkspace(document.personal.jyly.value)){
//alert('请输入您的交友留言！');
//document.personal.jyly.focus();
//return false;
//}
//if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
//{
//alert('为保证交友效果，留言请在20字以上，不能超过300字，并请勿填写任何联系方式');
//document.personal.jyly.focus();
//return false;
//}
//	 s =document.personal.jyly.value ;
//	 if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('您输入的留言中含有疑似联系办法的内容,请重填');
//document.personal.jyly.focus();
//return false;
//}
//j=0;
//x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('您输入的留言中含有疑似联系办法的内容,请重填');
//document.personal.jyly.focus();
//return false;
//}
var qggx1 = document.personal.qggx.value;
var lxqr1 = document.personal.lxqr.value;
var jyly1 = document.personal.jyly.value;
if (((qggx1.indexOf("script")>=0)||(qggx1.indexOf("<")>=0)||(qggx1.indexOf(">")>=0)))
{
alert('您输入的情爱关系含有违法内容,请重填');
document.personal.qggx.focus();
return false;
}
if (((lxqr1.indexOf("script")>=0)||(lxqr1.indexOf("<")>=0)||(lxqr1.indexOf(">")>=0)))
{
alert('您输入的理想情人含有违法内容,请重填');
document.personal.lxqr.focus();
return false;
}
if (((jyly1.indexOf("script")>=0)||(jyly1.indexOf("<")>=0)||(jyly1.indexOf(">")>=0)))
{
alert('您输入的交友留言含有违法内容,请重填');
document.personal.jyly.focus();
return false;
}

if ((checkspace(document.personal.email.value)) && (checkspace(document.personal.oicq.value)) && (checkspace(document.personal.sjtel.value)) && (checkspace(document.personal.tel.value)))
{
alert("请输入至少一种联系方法，");
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

function view(t1,t2,t3,t4)
{
    document.getElementById(t1).style.display = "block";
    document.getElementById(t2).style.display = "none";
    document.getElementById(t3).style.display = "none";
    document.getElementById(t4).style.display = "none";
}

function cccc(){
	if('<%=i%>' ==1){
		//document.getElementById("sjtel").readOnly=true;
		document.getElementById("sjtel").style.backgroundColor="grey";
		document.getElementById("email").readOnly=false;
		
	}else if ('<%=i%>'== 0){
		document.getElementById("email").readOnly=true;
		document.getElementById("email").style.backgroundColor="#A8A8A8";
		document.getElementById("sjtel").readOnly=false;
	} else{
		document.getElementById("sjtel").readOnly=false;
		document.getElementById("email").readOnly=false;
	}
}


<!--

function MM_openBrWindow1(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->

</script>

</head>

<body onload="cccc()">
<table width="80%" height="63"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">维护会员基本信息</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr>
    <td height="25" width="87%"><a href="edithyinfo.jsp?id=<%=hyid%>&isdel=<%=isdel%>">会员资料</a>&nbsp;&nbsp;
      <a href="edithyinfoyj.jsp?id=<%=hyid%>&isdel=<%=isdel%>">影集文集</a>&nbsp;&nbsp;
      <a href="edithyinfoset.jsp?id=<%=hyid%>&isdel=<%=isdel%>">设置</a>&nbsp;&nbsp;
      <a href="edithyinfostat.jsp?id=<%=hyid%>&isdel=<%=isdel%>">会员状态</a>&nbsp;&nbsp;
      <a href="edithyinfoupd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">升级记录</a>&nbsp;&nbsp;
	  <!-- <a href="hybjd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">白金豆记录</a>&nbsp;&nbsp; -->
	  <a href="hyxx.jsp?id=<%=hyid%>&isdel=<%=isdel%>">信息收发</a>&nbsp;&nbsp;
	  <a href="hyfw.jsp?id=<%=hyid%>&isdel=<%=isdel%>">访问记录</a>&nbsp;&nbsp;
<a href="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">会员审核</a>&nbsp;&nbsp;
	  <!-- <a href="edithyinfoxxjs.jsp?id=<%=hyid%>&isdel=<%=isdel%>">信息接收设置</a>&nbsp;&nbsp; -->
    </td>
      <td>
      <a href="gogrzq.jsp?id=<%=hyid%>&isdel=<%=isdel%>" target="_blank">进入个人专区</a>&nbsp;&nbsp;
      <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">留言</a></td>
  </tr>
</table>
  <table id="t1"  width="80%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
<form name="personal" id="personal" method="post" action="edithyinfo.jsp?id=<%=hyid%>&isdel=<%=isdel%>" onSubmit="return test()" >
  <input type="hidden" name="bizaction" value="01">
  <input type="hidden" name="id" value="<%=loginUser.getHyid()%>" />
  <input type="hidden" name="isdel" value="<%=isdel%>">
   <%
   String thyid = loginUser.getHyid().toString();
   String tusername = loginUser.getUsername();
   String tlcname   = loginUser.getLcname();
   String tpassword = loginUser.getPassword();
   String task      = loginUser.getAsk();
   String tanswer   = loginUser.getAnswer();
   String tcsdate   = DateTools.dateToString(loginUser.getCsdate(),false);
   String taddress  = (loginUser.getS1() == null ? "":loginUser.getS1()) + (loginUser.getS2() == null ? "":loginUser.getS2());
   int flag=loginUser.getFlag();

   if(taddress.equals("北京北京"))
     taddress = "北京";
   if(taddress.equals("上海上海"))
     taddress = "上海";
   if(taddress.equals("天津天津"))
     taddress = "天津";
   if(taddress.equals("重庆重庆"))
     taddress = "重庆";
   if(taddress.equals("香港香港"))
     taddress = "香港";
   if(taddress.equals("澳门澳门"))
     taddress = "澳门";

   String txx       = DicList.getDicValue(SysDefine.DIC_XX,loginUser.getSx(),1);
   String tzf       = DicList.getDicValue(SysDefine.DIC_ZF,loginUser.getZf(),1);
   String txz       = DicList.getDicValue(SysDefine.DIC_XZ,loginUser.getXz(),1);
   String tfs       = DicList.getDicValue(SysDefine.DIC_FS,loginUser.getFs(),1);
   String ttel      = loginUser.getTel()==null? "":loginUser.getTel();
   String tsjtel    = loginUser.getSjtel() == null ? "":loginUser.getSjtel();
   String tqq       = loginUser.getOicq() == null ? "":loginUser.getOicq();
   String temail    = loginUser.getEmail() == null ? "":loginUser.getEmail();
   String isvca     = loginUser.getIsvcation() == 1 ? "已验证" : "未验证";
   
   //判断手机、固定电话、QQ、邮箱是否存在骚扰屏蔽，用四位数值表示，每位有两种数字：0和1，分别代表是不含和含有骚扰词。四位数字分别是手机、固定电话、QQ、邮箱
   String s1="0"; //手机
   String s2="0"; //固定电话
   String s3="0"; //QQ
   String s4="0"; //邮箱
   String shield=loginUser.getShield()==null?"":loginUser.getShield();
   if (shield.length()==4){
       s1=shield.substring(0,1);
       s2=shield.substring(1,2);
       s3=shield.substring(2,3);
       s4=shield.substring(3,4);
   }
   %>

    <tr>
      <td height="25" colspan="8" align="left" valign="middle" class="tdc"><STRONG>编号：</STRONG><%=loginUser.getHyid()%>　　<STRONG>加入时间：</STRONG><%=DateTools.dateToString(loginUser.getRegtime(),true)%>　　<STRONG>注册时间：</STRONG><%=DateTools.dateToString(loginUser.getRegtime3(),true)%>　　<STRONG>登陆时间：</STRONG><%=DateTools.dateToString(loginUser.getLasttime(),true)%>　　<STRONG>注册IP：</STRONG><%=loginUser.getHttpip()%></td>
    </tr>
    <%
	     DynaBean dbt =null;
	     Map map=new HashMap();
	     String sqlt="select adv_member_name,adv_member_code from adv_member order by adv_member_code asc";
	     List listt=(List)QueryRecord.query(sqlt);
	     if(listt.size()>0)
	     {
	     	for(int o =0;o<listt.size();o++)
	     	{
	        	dbt =(DynaBean)listt.get(o);
	        	map.put(dbt.get("adv_member_code").toString(),dbt.get("adv_member_name"));
	        }
	      }
	      
	      //交友状态
	      //会员等级
	      String hytype = "普通";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
	         hytype = "白金";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
	         hytype = "VIP";
	         
	      String jyzt="";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT) 
	      	jyzt="等待中";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
	      	jyzt="暂勿打扰";
     %>
    <tr>
    
    
      <td height="25" colspan="8" align="left" valign="middle" class="tdc"><STRONG>来源类别：</STRONG><%=map.get(loginUser.getVip()+"")%>　<strong>是否验证：</strong><%=isvca %> 　<STRONG>交友状态：<%=jyzt %></STRONG>　　<STRONG>会员等级：</STRONG><%=hytype%>　　<STRONG>人气值：</STRONG><%=loginUser.getHots().toString()%>　　<STRONG>是否推荐：</STRONG><%=(loginUser.getIstj()!=null &&loginUser.getIstj()==1)?"推荐":"未推荐"%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>用户名</strong></td>
      <td width="14%" align="center" valign="middle" ><%=tusername%></td>
      <td width="9%" height="25" align="center" valign="middle" class="tdc"><strong>密码</strong></td>
      <td width="14%" align="center" valign="middle" ><%if (adminflag==10) {%>
      		<%=tpassword%><% } else {%>
       		<%if (flag==25 || flag==30) {%>
       			******
       		<%}else {%>
       			<%=tpassword%><%} %><%} %></td>
      <td width="11%" align="center" valign="middle" nowrap class="tdc" ><strong>密码问题</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (adminflag==10) {%>
      		<%=task%><% } else {%>
      		******
      <%} %>
      </td>
      <td width="9%" align="center" valign="middle" nowrap class="tdc" ><strong>密码答案</strong></td>
      <td width="21%" height="25" align="center" valign="middle" >
      <%if (adminflag==10) {%>
      		<%=tanswer%><% } else {%>
      		******
      <%} %>
      </td>
    </tr>


    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>昵称</strong></td>
      <td width="14%" align="center" valign="middle" ><input name="lcname" type="text" class="txt" id="lcname2" value="<%=tlcname%>" size="12"/></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>性别</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="sex" id="sex">
        <%=DicList.getDicListOption(SysDefine.DIC_SEX,loginUser.getSex())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>住址</strong></td>
      <td width="14%" align="center" valign="middle" >
      <select name="s1" id="s1" onchange="SetCity(this,document.personal.s2)">
                      <%
                          if(loginUser.getS1()!=null){
                       %>
                          <option value="<%=loginUser.getS1()%>" selected="selected"><%=loginUser.getS1()%></option>
                       <%} %>
                          <option value="北京">北京</option>
                          <option value="天津">天津</option>
                          <option value="河北">河北</option>
                          <option value="山西">山西</option>
                          <option value="内蒙古">内蒙古</option>
                          <option value="辽宁">辽宁</option>
                          <option value="吉林">吉林</option>
                          <option value="黑龙江">黑龙江</option>
                          <option value="上海">上海</option>
                          <option value="江苏">江苏</option>
                          <option value="浙江">浙江</option>
                          <option value="安徽">安徽</option>
                          <option value="福建">福建</option>
                          <option value="江西">江西</option>
                          <option value="山东">山东</option>
                          <option value="河南">河南</option>
                          <option value="湖北">湖北</option>
                          <option value="湖南">湖南</option>
                          <option value="广东">广东</option>
                          <option value="广西">广西</option>
                          <option value="海南">海南</option>
                          <option value="重庆">重庆</option>
                          <option value="四川">四川</option>
                          <option value="贵州">贵州</option>
                          <option value="云南">云南</option>
                          <option value="西藏">西藏</option>
                          <option value="陕西">陕西</option>
                          <option value="甘肃">甘肃</option>
                          <option value="青海">青海</option>
                          <option value="宁夏">宁夏</option>
                          <option value="新疆">新疆</option>
                          <option value="香港">香港</option>
                          <option value="澳门">澳门</option>
                          <option value="台湾">台湾</option>
                          <option value="国外">国外</option>
                      </select>
                      <select name="s2" id="s2">
                      <%
                          if(loginUser.getS2()!=null){
                       %>
                          <option value="<%=loginUser.getS2()%>" selected="selected"><%=loginUser.getS2()%></option>
                       <%} %>
                          
                      </select>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>区县</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><input name="s3" type="text" id="s3" value="<%=loginUser.getS3() == null ?"":loginUser.getS3()%>"></td>
    </tr>

    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong><strong>生日</strong></strong></td>
      <td width="14%" align="center" valign="middle" ><input name="csdate" type="text" id="csdate2" value="<%=tcsdate%>" size="15"></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>年薪</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="yx" size="1" class="border" id="select9">
        <%=DicList.getDicListOption(SysDefine.DIC_YX ,loginUser.getYx())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>血型</strong></td>
      <td width="14%" align="center" valign="middle" ><%=txx%></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>住房</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><%=tzf%></td>
    </tr>

    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc" style="padding-top:5px;"><strong>星座</strong></td>
      <td width="14%" align="center" valign="middle" ><%=txz%></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>身高</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="sg" size="1" class="border" id="select5">
        <%=DicList.getDicListOption(SysDefine.DIC_SG ,loginUser.getSg())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>体重</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="tz" size="1" class="border" id="select6">
        <%=DicList.getDicListOption(SysDefine.DIC_TZ ,loginUser.getTz())%>
      </select></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>肤色</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><%=tfs%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>婚姻状况</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="hyzk" size="1" class="border" id="select10">
        <%=DicList.getDicListOption(SysDefine.DIC_HYZH ,loginUser.getHyzk())%>
      </select></td>
      <td width="9%" align="center" valign="middle" nowrap class="tdc" ><strong>文化程度</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="whcd" size="1" class="border" id="select8">
        <%=DicList.getDicListOption(SysDefine.DIC_WHCD ,loginUser.getWhcd())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>手机验证</strong></td>
      <td width="14%" align="center" valign="middle" ><%=isvca %></td>
      <td width="9%" align="center" valign="middle" class="tdc" >
      <strong>&nbsp;</strong>
      <%
      if("已验证".equals(isvca)){
    	  %>
    	  <input class="button1 " type='button' value="改未验证" width="85" height="28" onclick="checkuserinfo();document.uncheckuserinfo.submit();"/>
    	  <%
      }
      %>
	</td>
      <td width="21%" height="25" align="center" valign="middle" >
      &nbsp;
      </td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>固定电话</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s2.equals("1")) {%>
      	<input name="tel" type="text"  id="tel2" size="15" maxlength="20" style="font-size:15px;color='red';font-weight:bold;" value="<%=ttel%>">
       <%
       }else{
       %>
        <input name="tel" type="text"  id="tel2" size="15" maxlength="20" value="<%=ttel%>">
        <%} %>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>手机</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s1.equals("1")) {%>
      	<input name="sjtel" id ="sjtel" type="text" class="txt" id="sjtel2" size="15" style="font-size:15px;color='red';font-weight:bold;" maxlength="20" value="<%=tsjtel%>" />
      <%
       }else{
       %>
       <input name="sjtel" id ="sjtel" type="text" class="txt" id="sjtel2" size="15" maxlength="20" value="<%=tsjtel%>" />
       <%} %>
      </td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>QQ</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s3.equals("1")) {%>
      	<input name="oicq" type="text" class="txt" id="oicq2" size="15" maxlength="20" style="font-size:15px;color='red';font-weight:bold;" value="<%=tqq%>" />
       <%
       }else{
       %>
       	<input name="oicq" type="text" class="txt" id="oicq2" size="15" maxlength="20" value="<%=tqq%>" />
       <%} %>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>E-mail</strong></td>
      <td width="21%" height="25" align="center" valign="middle" >
      <%if (s4.equals("1")) {%>
      	<input name="email" id="email" type="text"  id="email" size="22" maxlength="40" style="font-size:15px;color='red';font-weight:bold;" value="<%=temail%>" />
       <%
       }else{
       %>
        <input name="email" id="email" type="text"  id="email" size="22" maxlength="40" value="<%=temail%>" />
       <%} %>
      </td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><span style="padding-top:7px;"><strong>性格特征</strong></span></td>
      <td height="25" colspan="7" align="left" valign="middle" ><%=LoverTools.getXgtzdes(loginUser)%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><span style="padding-top:7px;"><strong>业余安排</strong></span></td>
      <td height="25" colspan="7" align="left" valign="middle" ><%=LoverTools.getYYapdes(loginUser)%></td>
    </tr>
    <tr>
      <td width="8%" height="28" align="center" valign="middle" nowrap class="tdc"><strong>交友意向</strong></td>
      <td height="28" colspan="7" align="left" valign="middle" ><%
                     String jyyx01= "000000";
                     if(loginUser.getJyyx()!= null && loginUser.getJyyx().toString().length() == 6)
                       jyyx01 = loginUser.getJyyx().toString();
                  %>
          <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
            <tr>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx002" value="1"  <%if(jyyx01.charAt(1) == '1') out.print("checked");%> >
                纯友谊</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx012" value="2"   <%if(jyyx01.charAt(2) == '1') out.print("checked");%> >
                  亲密关系</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx022" value="3"  <%if(jyyx01.charAt(3) == '1') out.print("checked");%> >
                婚姻</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx032" value="4"   <%if(jyyx01.charAt(4) == '1') out.print("checked");%> >
                陪伴 </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx042" value="5"   <%if(jyyx01.charAt(5) == '1') out.print("checked");%> >
                其它<input type="hidden" name="jyyx01" id="jyyx01" /></td>
            </tr>
            <!-- <tr>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx032" value="5"   <%//if(jyyx01.charAt(4) == '1') out.print("checked");%> >
                婚姻 </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx041" value="7"   <%//if(jyyx01.charAt(5) == '1') out.print("checked");%> >
                E夜情 </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx052" value="8"   <%//if(jyyx01.charAt(6) == '1') out.print("checked");%> >
                陪伴 </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx062" value="9"   <%//if(jyyx01.charAt(7) == '1') out.print("checked");%> >
                其它 </td>
              <td width="20%"><input type="hidden" name="jyyx01" id="jyyx01" />              </td>
            </tr> -->
      </table></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>情爱关系</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="qggx" cols="80" rows="3" class="put" id="qggx2"><%=uother == null ? "":uother.getQggx()%></textarea></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>理想情人</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="lxqr" cols="80" rows="3" id="textarea2"><%=uother == null ? "":uother.getLxqr()%></textarea></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>交友留言</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="jyly" cols="80" rows="3" id="textarea"><%=uother == null ? "":uother.getJyly()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="25" colspan="8" valign="middle" nowrap>&nbsp;</td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>审核人</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><input name="shr" type="text" id="shr" value="<%=loginUser.getShr() == null ? "":loginUser.getShr()%>"></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>审核情况</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><input name="shqk" type="text" id="shqk" value="<%=loginUser.getShqk() == null ? "":loginUser.getShqk()%>"></td>
    </tr>
    <tr>
      <td height="25" colspan="8" align="center"><input  name="submit" type="submit" class="button1 " value="确认修改" width="94" height="28" />    </td>
    </tr>
    </form>
    <tr><td height="25" colspan="8" align="center"></td></tr>
    <tr>
      <td height="25" colspan="8" align="center">
      	<form name="qiubo" method="post" onSubmit="return checkqb()" action="saveqiubo.jsp" target="sframe" >
	        <input type="hidden" name="qbname" value="<%=tusername%>">
	      	<input  name="submit" type="submit" class="button1 " value="秋波匹配" width="94" height="28" />
	    </form>  
      </td>
    </tr>
    <tr>
      <td height="25" colspan="11" align="center">&nbsp;</td>
    </tr>
                                  <tr>
      <td height="25" colspan="11" align="center">&nbsp;</td>
    </tr>
</table>
<form name="checkuserinfof" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="checkhyid" value="<%=hyid%>">
</form>
<form name="uncheckuserinfo" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="uncheckhyid" value="<%=hyid%>">
</form>
<form name="shenhe" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="shenhehyid" value="<%=hyid%>">
</form>
</body>
</html>
<iframe  name="sframe" src="#" width="0" height="0" style="display:none"></iframe>
<script type="text/JavaScript">
function crphoto(pid)
{
  if(!confirm('确认删除此图片吗？')) return false;
  document.rphoto.p.value=pid;
  document.rphoto.submit();
}

function fsetf(actionid)
{

  document.fset.bizaction.value=actionid;
  document.fset.submit();
}

function checkqb()
{
   /*if(document.qiubo.qbname.value == "")
   {
       alert("请输入秋波发送用户名字");
      return false;
   }*/
   if(confirm("是否秋波匹配该会员?"))
   {
	  return true;
   }else
	  return false;
   return true;
}
function checkuserinfo()
{
   if(confirm("您将要修改资料验证情况"))
   {
	  return true;
   }else
	  return false;
}

function shenheinfo()
{
   if(confirm("您将要修改资料审核情况"))
   {
	  return true;
   }else
	  return false;
}
</script>
