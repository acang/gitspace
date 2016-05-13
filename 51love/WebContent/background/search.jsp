<%@ page contentType="text/html; charset=gbk" %>
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
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
String title = "搜索会员";
String action = "editinfo.jsp";
if(isdel.equals("1"))
{
  title = "搜索已删除会员";
  action = "editinfodel.jsp";
}
String stime = (String)session.getAttribute("stime");
String etime = (String)session.getAttribute("etime");

List adminList = AdminMng.getAdminList();
String czry    = SysCommonFunc.getStrParameter(request,"czry");
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
<script src="tom_reg.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../commonlib/calendar/calendar-setup.js"></script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center"><%=title%></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="personal" method="post" action="<%=action%>">
  <input type="hidden" name="isdel" value="<%=isdel%>">

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" class="txt">
    <tr class="font12">
      <td width="102" height="32" align="center" class="tdc" ><strong>用户名</strong></td>
      <td width="355" height="32" align="left" >
      <input name="username" type="text" class="input3" id="username">      </td>
      <td width="84" height="32" align="center" class="tdc" ><strong>E-mail</strong></td>
      <td width="407" height="32" align="left" ><input name="email" type="text" class="input3" id="email2">      </td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>昵称</strong></td>
      <td height="32" align="left" ><input name="lcname" type="text" class="input3" id="lcname"></td>
      <td height="32" align="center" class="tdc" ><strong>QQ</strong></td>
      <td height="32" align="left" ><input name="oicq" type="text" class="input3" id="oicq2"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>性别</strong></td>
      <td height="32" align="left" ><font size="2">
                                  <select name="sex" size="1" class="border" id="sex">
                                    <option selected value="0">不限</option>
                                   <%=DicList.getDicListOption(SysDefine.DIC_SEX,"-1")%>
                                  </select>
      </font>      </td>
      <td height="32" align="center" class="tdc" ><strong>手机号码</strong></td>
      <td height="32" align="left" ><input name="sjtel" type="text" class="input3" id="sjtel3"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>学历</strong></td>
      <td height="32" align="left" ><select name="whcd" id="select2">
        <option selected value="0">不限</option>
        <%=DicList.getDicListOption(SysDefine.DIC_WHCD,"-1")%>
      </select></td>
      <td height="32"  align="center" class="tdc"><strong>固定电话</strong></td>
      <td height="32" align="left" ><font size="2">
        <input name="tel" type="text" class="input3" id="tel">
      </font></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>婚姻状况</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="hyzk" size="1" class="border" id="select5">
          <option selected value="0">不限</option>
          <%=DicList.getDicListOption(SysDefine.DIC_HYZH,"-1")%>
        </select>
      </font></td>
      <td height="32"  align="center" class="tdc"><strong>年龄</strong></td>
      <td height="32" align="left" ><font size="2">从
          <select name="agestart" size="1" class="border" id="select3">
            <option selected value="0">不限</option>
            <%
                              for(int i=16;i < 71;i ++)
                              {
                              %>
            <option  value="<%=i%>"><%=i%></option>
            <%
                              }
                                %>
          </select>
到
<select name="ageend" size="1" class="border" id="select4">
  <option selected value="0">不限</option>
  <%
                              for(int i=16;i < 71;i ++)
                              {
                              %>
  			<option  value="<%=i%>"><%=i%></option>
  			<%
                              }
                                %>
</select>
      </font></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>身高</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="sg" size="1" class="border" id="select6">
          <option selected value="0">不限</option>
          <%=DicList.getDicListOption(SysDefine.DIC_SG,"-1")%>
        </select>
      </font></td>
      <td height="32"  align="center" class="tdc"><strong>住址</strong></td>
      <td height="32" align="left" ><select name="s1" onChange="SetCity()">
        <option value="0" selected>全部</option>
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
        <select name="s2">
          <option value="0" selected>全部</option>
      </select></td>
    </tr>
    
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>有无照片</strong></td>
      <td height="32" align="left" ><select name="isimg" id="select7">
        <option value="-1" selected>不限</option>
        <option value="1">有</option>
        <option value="0">无</option>
      </select></td>
      <td height="32"  align="center" class="tdc"><strong>是否VIP</strong></td>
      <td height="32" align="left" ><select name="vip1" id="select8">
        <option value="-1" selected>不限</option>
        <option value="1">是</option>
        <option value="0">不是</option>
      </select></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>排序</strong></td>
      <td height="32"  align="left"><select name="orderby" id="select12">
          <option value="0">注册时间</option>
          <option value="1">登陆时间</option>
          <option value="2">加入时间</option>
          <option value="3">VIP到期时间</option>
          <option value="4">删除时间</option>
      </select></td>
      <td height="32" align="center" class="tdc" ><strong>审核人</strong></td>
      <td height="32"  align="left"><select name="shr" id="select11">
          <option value="-1">不限</option>
          <option value="0">没有</option>
          <option value="1">有</option>
        </select>
      <input name="shrname" type="text" id="shrname2" size="10"></td>
    </tr>

    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>起始时间</strong></td>
      <td height="32" align="left" ><input name="starttime" type="text" class="input3" id="singname4"  value="<%=stime == null ? "":stime%>">
		        <img src="../commonlib/calendar/img.gif" width="20" height="14" id="startt">
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "starttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "startt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script></td>
      <td height="32"  align="center" class="tdc"><strong>终止时间</strong></td>
      <td height="32" align="left" ><input name="endtime" type="text" class="input3" id="singname5"  value="<%=etime == null ? "":etime%>">
      <img src="../commonlib/calendar/img.gif" width="20" height="14" id="endt">
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "endtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>来源IP</strong></td>
      <td height="32" align="left" ><select name="isip" id="select9">
        <option value="-1">不限</option>
        <option value="0">没有</option>
        <option value="1">有</option>
      </select>
      <input name="httpip" type="text" class="input3" size="10"></td>
      <td height="32" align="center" class="tdc" ><strong>来源网址</strong></td>
      <td height="32" align="left" ><select name="isurl" id="select10">
        <option value="-1">不限</option>
        <option value="0">没有</option>
        <option value="1">有</option>
      </select>
      <input name="httpurl" type="text" class="input3" size="10"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>来源类别</strong></td>
      <td height="32" align="left" >

      <select name="advid" id="advid">
        <option value="0" selected>不限</option>
       <%
      List list = HbmOperator.list("from Advmember as o where o.flag = 1");
      for(int j=0;j<list.size();j++)
      {
      	Advmember adv=(Advmember)list.get(j);
       %>
        <option value="<%=adv.getAdvmembercode()%>"><%=adv.getAdvmembername()%></option>
        <%
        	}
         %>
         <option value="50">手机站</option>
         <option value="51">微信站</option>
      </select></td>
      <td height="32" align="center" class="tdc" ><strong>体重</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="tz" size="1" class="border" id="tz">
          <option selected value="0">不限</option>
          <%=DicList.getDicListOption(SysDefine.DIC_TZ,"-1")%>
        </select>
      </font></td>
    </tr>
    <%
    		if(isdel.equals("1"))
			{
     %>
    
    <tr class="font12">
    <td height="32" align="center" class="tdc" ><strong>删除人</strong></td>
    <td width="46%" height="22" align="left"><select name="czry" id="czry">
    <option value="">不限</option>
       <%
       for(int i=0;i < adminList.size();i ++)
       {
          Admininfo temp = (Admininfo)adminList.get(i);
          String se = "";
          if(czry.equals(temp.getAdminname()))
           se = "selected";
       %>
       <option value="<%=temp.getAdminname()%>" <%=se%>><%=temp.getAdminname()%></option>
       <%
       }
       %>
                                      </select></td>
                                      <td ></td>
    </tr>

<%} %>
<tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>是否验证</strong></td>
      <td height="32" align="left" ><select name="isv" id="select12">
        <option value="-2">不限</option>
        <option value="1">已验证</option>
        <option value="0">未验证</option>
        
      </select>
      </td>
      <td height="32" align="center" class="tdc" ><strong>交友意向</strong></td>
      <td height="32" align="left" >
      	<select name="jyyx" size="1" class="border" id="jyyxzz">
           <option selected value="0">不限</option>
           <option value="1">纯友谊</option>
           <option value="2">亲密关系</option>
           <!-- <option value="3">同性恋人</option> -->
           <option value="3">婚姻</option>
             <!--<option value="5">E夜情</option>-->
           <option value="4">陪伴</option>
           <option value="5">其它</option>
         </select>
      </td>
    </tr>
    
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>会员状态</strong></td>
      <td height="32" align="left" ><select name="checkstatu" id="select13">
        <option value="-2">不限</option>
        <option value="0">生效</option>
        <option value="2">待审核</option>
        <option value="1">删除</option>
        
      </select>
      </td>
      <td height="32" align="center" class="tdc" ><strong>是否推荐</strong></td>
      <td height="32" align="left" ><select name="istj" id="select14">
        <option value="-1">不限</option>
        <option value="0">不推荐</option>
        <option value="1">推荐</option>
      </select>
      </td>
    </tr>

    <tr class="font12">
      <td height="32" colspan="4" align="center" ><input type="submit" name="Submit" value="给我搜"  class="button1"></td>
    </tr>
        <tr>
      <td height="25" colspan="5" align="center" >&nbsp;</td>
    </tr>
        <tr>
      <td height="25" colspan="5" align="center" >&nbsp;</td>
    </tr>
  </table>
</form>

</body>
</html>


