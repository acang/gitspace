<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.common.SysCommonFunc" %>



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
<script src="js/Popup.js"></script>
<script src="js/tom_reg2.js"></script>
<script type="text/javascript">
function tan()
{
    document.getElementById('lcname1').style.display ='none';
    document.getElementById('qggx1').style.display ='none';
    document.getElementById('lxqr1').style.display ='none';
    document.getElementById('jyly1').style.display ='none';
}

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
    var jyyx01,i,j=0;
    if (checkspace(document.personal.password.value)||document.personal.password.value == 'null'){
        alert('请输入密码！');
        document.personal.password.focus();
        return false;
    }
    if (document.personal.password.value!=document.personal.repassword.value)
    {
        alert('您两次输入的密码不一致，请重新输入!');
        document.personal.password.focus();
        return false;
    }
    if (checkspace(document.personal.ask.value)||document.personal.ask.value == 'null'){
        alert('请输入密码保护的问题！');
        document.personal.ask.focus();
        return false;
    }
    if (checkspace(document.personal.answer.value)||document.personal.answer.value == 'null'){
        alert('请输入密码保护的答案！');
        document.personal.answer.focus();
        return false;
    }
    if (checkspace(document.personal.lcname.value)){
        alert('请输入您的昵称！');
        document.personal.lcname.focus();
        return false;
    }
    var s =document.personal.lcname.value ;
    if (tag_byteLen(s)>12)
    {
        alert('您输入的昵称不能超过6个字,请重填');
        document.personal.lcname.focus();
        return false;
    }
    if ( s.indexOf("手机会员")>=0 )
    {
        alert('请修改您的昵称！');
        document.personal.lcname.focus();
        return false;
    }
    var shu="0123456789";
    var s =document.personal.lcname.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('您输入的昵称含有疑似联系办法的内容,请重填');
        document.personal.lcname.focus();
        return false;
    }
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
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }
    if (x==1) {
        alert('您输入的昵称含有疑似联系办法的内容,请重填');
        document.personal.lcname.focus();
        return false;
    }

    if (document.personal.s1.value=="-1" || document.personal.s1.value=="")
    {
        alert('请选择您的地址。');
        document.personal.s1.focus();
        return false;
    }

    if (document.personal.s2.value=="-1" || document.personal.s2.value=="")
    {
        alert('请选择您的城市地址。');
        document.personal.s1.focus();
        return false;
    }

    if (document.personal.s3.value=="" || document.personal.s3.value=="县区")
    {
        alert('请输入您的地址县区名称！');
        document.personal.s3.focus();
        return false;
    }
	if (document.personal.year.value=="" )
    {
        alert('请输入您的生日年份！');
        document.personal.year.focus();
        return false;
    }
    if (document.personal.month.value=="" )
    {
        alert('请输入您的生日月份！');
        document.personal.month.focus();
        return false;
    }
    if (document.personal.day.value=="" )
    {
        alert('请输入您的生日日期！');
        document.personal.day.focus();
        return false;
    }
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
    var xgtz01="",yyap01=""
    i=0;
    j=0;
    for (i=0;i<document.personal.xgtz.length;i++) {
        if (document.personal.xgtz[i].checked)
        {
            j=1+j;
            xgtz01=xgtz01+"1"
        }
        else{
            xgtz01=xgtz01+"0"
        }
    }
    if (j==0||j>=5) {
        alert("请选择您的性格特征！并且不超过四项！")
        return (false);
    }
    document.personal.xgtz01.value=xgtz01;
    i=0;
    j=0;
    for (i=0;i<document.personal.yyap.length;i++) {
        if (document.personal.yyap[i].checked)
        {
            j=1+j;
            yyap01=yyap01+"1"
        }
        else{
            yyap01=yyap01+"0"
        }
    }
    if (j==0||j>=5) {
        alert("请选择您的业余安排！并且不超过四项！")
        return (false);
    }
    document.personal.yyap01.value=yyap01;
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
    if (checkspace(document.personal.qggx.value)){
        alert('请输入您对情爱关系的看法！');
        document.personal.qggx.focus();
        return false;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('您输入的情爱关系含有疑似联系办法的内容,请重填');
        document.personal.qggx.focus();
        return false;
    }
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('您输入的情爱关系含有疑似联系办法的内容,请重填');
        document.personal.qggx.focus();
        return false;
    }

    if (checkspace(document.personal.lxqr.value)){
        alert('请输入您的理想情人！');
        document.personal.lxqr.focus();
        return false;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('您输入的情性关系含有疑似联系办法的内容,请重填');
        document.personal.qggx.focus();
        return false;}
    var m = document.personal.lxqr.value;
    if (((m.indexOf("http")>=0)||(m.indexOf("www")>=0)||(m.indexOf("@")>=0)))
    {
        alert('您输入的理想情人含有疑似联系办法的内容,请重填');
        document.personal.lxqr.focus();
        return false;
    }
    j=0;
    var x=0;
    for (i=0;i<m.length;i++)
    {
        if ((shu.indexOf(m.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('您输入的理想情人含有疑似联系办法的内容,请重填');
        document.personal.lxqr.focus();
        return false;
    }


    if (checkspace(document.personal.jyly.value)){
        alert('请输入您的交友留言！');
        document.personal.jyly.focus();
        return false;
    }
    if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
    {
        alert('为保证交友效果，留言请在20字以上，不能超过300字，并请勿填写任何联系方式');
        document.personal.jyly.focus();
        return false;
    }
    s =document.personal.jyly.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('您输入的留言中含有疑似联系办法的内容,请重填');
        document.personal.jyly.focus();
        return false;
    }
    j=0;
    x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('您输入的留言中含有疑似联系办法的内容,请重填');
        document.personal.jyly.focus();
        return false;
    }

    if (checkspace(document.personal.sjtel.value))
    {
        alert("请输入手机号码");
        document.personal.sjtel.focus();
        return false;
    }

//    if (checkspace(document.personal.oicq.value))
//    {
//        alert("请输入qq号码");
//        document.personal.oicq.focus();
//        return false;
//    }

	if(!confirm('修改资料会将您的资料设置为待审核状态，网站审核员将与您核实后激活您的资料上线！')) {
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
   function zuheYMD(){
   
		var year = document.personal.year.value;
		var month = document.personal.month.value;
		var day = document.personal.day.value;
		
		if(month.length<2){
			month = "0"+month;
		}
		if(day.length<2){
			day = "0"+day;
		}
       document.personal.csdate.value=  year+"-"+month+"-"+day;
   }

</script>

</head>

<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    String username = request.getParameter("username");
    long uL = 0;
    try
    {
        uL=Long.parseLong(loginUser.getUsername());
    }catch(Exception e)
    {

    }

    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('您是游客，您的权限不够，请先登录　　');showLogin('index.jsp','grzq.jsp');</script>");
        return;
    }else{
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
%>

<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
  <div class="box01"> <span class="tx">
      <%
         if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())
         &&new File("E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1()).exists()){
          String left_small_pic ="../"+afilepathsmall+File.separator+uother.getUserphoto1();
      %>
      <img src="<%=left_small_pic%>" alt=""/>
       <%
           }else{
       %>
          <img src="images/nopic2.gif" alt=""/>

       <%
           }
       %>
  </span>
      <%
          String lcname = "";
          if(grwhqUser!=null){
              lcname =  grwhqUser.getLcname();
          }
      %>
      
      <p class="zl"><a href="perinfo.jsp?id=<%=loginUser.getHyid()%>"><strong><%=lcname%></strong></a></p>
      
      <div class="lm_name">
          <h2>个人操作专区</h2>
      </div>
      <%@ include file="grleft.jsp"%>
  </div> 
    <div class="box02">
      <div class="lm_name">
        <h2>资料修改</h2>
      </div>
      <form name="personal" method="post" action="userinfoupdate.jsp" onSubmit="return test()" >
<table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02">
              <tbody>
                <tr>
                  <td style="width:120px;" align="right" bgcolor="#D6E6F3" class="bk04"><strong>用户名：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><strong><%=loginUser.getUsername()%></strong></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>密码：</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                      <input name="password" type="password" class="txt01" id="password" value="<%=loginUser.getPassword()%>"/>
                        （10位以下字符）</td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>重输密码：</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                        <input name="repassword" type="password" class="txt01" id="repassword2" value="<%=loginUser.getPassword()%>"/>
                        （如：秦丽）</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>密码保护问题：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="ask" type="text" class="txt01" id="ask2"  maxlength="40" value="<%=loginUser.getAsk()%>"/>
                    （如：我的母亲叫什么？）</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>密码保护答案：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="answer" type="text" class="txt01" id="answer2"  maxlength="40" value="<%=loginUser.getAnswer()%>"/>
                      （如：秦丽）</td>
                </tr>
                
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>您的性别：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                 	<% 
                 	if(loginUser.getSex()==null || loginUser.getSex().trim().length()<1){
                 		%>
                 		<select name="sex" id="sex">
                 			<%=DicList.getDicListOption(SysDefine.DIC_SEX, loginUser.getSex())%>
                  		</select>
                 		<%
                 	}else{
                 		String sexShow="10".equals(loginUser.getSex().trim())?"男":"女";
                 		%>
                 		<strong><%=sexShow%></strong>
                 		<%
                 	}
                 	
                 	%>

                      
                    &nbsp;&nbsp;
                    <!-- （性别一旦填写提交，不能修改，只能查看异性资料，请准确填写！） --></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:5px;"><strong>昵　称：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="lcname" type="text" class="txt01" id="lcname2" value="<%=loginUser.getLcname()%>" size="12" maxlength="12"/>
                      （起一个好听的交友昵称）<div id="lcname1" style="display:none"><font color="red">（昵称中含有敏感词，请修改！）</font></div></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>住址：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
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
                      <input name="s3" type="text" class="input02" id="s3" value="<%=loginUser.getS3() == null ? "县区":loginUser.getS3()%>" size="12" maxlength="5"/>  <%File name=null;if(username!=null){name = new File(username);}%>
                    </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>生 日：</strong></td>

                    <input name="csdate" type="hidden" id="csdate" value="<%=DateTools.dateToString(loginUser.getCsdate(),false)%>"/>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="year" onchange="zuheYMD()">
                      <%
                          Date csDate = loginUser.getCsdate();
                          String year_month_day = "";
                          if(csDate!=null){
                               year_month_day = DateTools.dateToString(csDate,false);
                          }
                          
                          String year = "";
                          String month = "";
                          String day = "";
                          if(year_month_day!=null && !"".equals(year_month_day)){
                              year = year_month_day.substring(0,4);
                              month = year_month_day.substring(5,7);
                              day = year_month_day.substring(8,10);
                          }
                      %>
                      <option value="<%=year%>"><%=year%></option>
                      <option value="1945">1945</option>
                      <option value="1946">1946</option>
                      <option value="1947">1947</option>
                      <option value="1948">1948</option>
                      <option value="1949">1949</option>
                      <option value="1950">1950</option>
                      <option value="1951">1951</option>
                      <option value="1952">1952</option>
                      <option value="1953">1953</option>
                      <option value="1954">1954</option>
                      <option value="1955">1955</option>
                      <option value="1956">1956</option>
                      <option value="1957">1957</option>
                      <option value="1958">1958</option>
                      <option value="1959">1959</option>
                      <option value="1960">1960</option>
                      <option value="1961">1961</option>
                      <option value="1962">1962</option>
                      <option value="1963">1963</option>
                      <option value="1964">1964</option>
                      <option value="1965">1965</option>
                      <option value="1966">1966</option>
                      <option value="1967">1967</option>
                      <option value="1968">1968</option>
                      <option value="1969">1969</option>
                      <option value="1970">1970</option>
                      <option value="1971">1971</option>
                      <option value="1972">1972</option>
                      <option value="1973">1973</option>
                      <option value="1974">1974</option>
                      <option value="1975">1975</option>
                      <option value="1976">1976</option>
                      <option value="1977">1977</option>
                      <option value="1978">1978</option>
                      <option value="1979">1979</option>
                      <option value="1980">1980</option>
                      <option value="1981">1981</option>
                      <option value="1982">1982</option>
                      <option value="1983">1983</option>
                      <option value="1984">1984</option>
                      <option value="1985">1985</option>
                      <option value="1986">1986</option>
                      <option value="1987">1987</option>
                      <option value="1988">1988</option>
                      <option value="1989">1989</option>
                      <option value="1990">1990</option>
                      <option value="1991">1991</option>
                      <option value="1992">1992</option>
                      <option value="1993">1993</option>
                      <option value="1994">1994</option>
                      <option value="1995">1995</option>
                      <option value="1996">1996</option>
                      <option value="1997">1997</option>
                      <option value="1998">1998</option>
                      <option value="1999">1999</option>
                    </select>
                    年
                    <select name="month" onchange="zuheYMD()">
                        <option value="<%=month%>"><%=month%></option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                    </select>
                    月
                    <select name="day" onchange="zuheYMD()">
                        <option value="<%=day%>"><%=day%></option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                    </select>
                    日 </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>血型：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="sx" id="select3">
                      <%=DicList.getDicListOption(SysDefine.DIC_XX ,loginUser.getSx())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>星座：</strong>
                      <select name="xz" id="select4">
                          <%=DicList.getDicListOption(SysDefine.DIC_XZ ,loginUser.getXz())%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>身高：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <select name="sg" size="1" class="border" id="select5">
                      <%=DicList.getDicListOption(SysDefine.DIC_SG ,loginUser.getSg())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>体重</strong>：
                          <select name="tz" size="1" class="border" id="select6">
                              <%=DicList.getDicListOption(SysDefine.DIC_TZ ,loginUser.getTz())%>
                          </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>肤色</strong>：
                              <select name="fs" size="1" class="border" id="select7">
                                  <%=DicList.getDicListOption(SysDefine.DIC_FS ,loginUser.getFs())%>
                              </select>
                    </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>婚姻状况：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="hyzk" size="1" class="border" id="select10">
                      <%=DicList.getDicListOption(SysDefine.DIC_HYZH ,loginUser.getHyzk())%>
                  </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>文化程度：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">  <%
                      String o = "";
                      if(loginUser.getWhcd()!=null){
                          o =  loginUser.getWhcd().toString();
                      }

                      if(o.equals("11")){
                          o = "12";
                      }else{
                          o = loginUser.getWhcd();
                      }
                  %>
                      <select name="whcd" size="1" class="border" id="select8">

                          <%=DicList.getDicListOption(SysDefine.DIC_WHCD ,o)%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>职业：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="zy" size="1" class="border" id="zy">
                      <%=DicList.getDicListOption(SysDefine.DIC_ZY ,loginUser.getZy())%>
                  </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>年薪：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="yx" size="1" class="border" id="select9">
                      <%=DicList.getDicListOption(SysDefine.DIC_YX ,loginUser.getYx())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>住房：</strong>
                      <select name="zf" size="1" class="border" id="yx">
                          <%=DicList.getDicListOption(SysDefine.DIC_ZF ,loginUser.getZf())%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;"><strong>性格特征：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                      <ul>
                          <%
                              String xgtz01= "000000000000000";
                              if(loginUser.getXgtz()!= null && loginUser.getXgtz().length() == 15){
                                  xgtz01 = loginUser.getXgtz();
                              }


                          %>
                        <li><input name="xgtz" type="checkbox" id="xgtz002" value="1" <%if(xgtz01.charAt(0) == '1') out.print("checked");%>>外向开朗</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz012" value="1" <%if(xgtz01.charAt(1) == '1') out.print("checked");%> />积极乐观</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz022" value="1" <%if(xgtz01.charAt(2) == '1') out.print("checked");%>/>风趣幽默</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz032" value="1" <%if(xgtz01.charAt(3) == '1') out.print("checked");%>/>直爽干脆</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz042" value="1" <%if(xgtz01.charAt(4) == '1') out.print("checked");%>/>追求刺激</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz052" value="1" <%if(xgtz01.charAt(5) == '1') out.print("checked");%>>不拘小节</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz062" value="1" <%if(xgtz01.charAt(6) == '1') out.print("checked");%>/>诚实正直</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz072" value="1" <%if(xgtz01.charAt(7) == '1') out.print("checked");%>/>温柔体贴</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz082" value="1" <%if(xgtz01.charAt(8) == '1') out.print("checked");%>/>成熟稳重</li>
                        <li> <input name="xgtz" type="checkbox" id="xgtz092" value="1" <%if(xgtz01.charAt(9) == '1') out.print("checked");%>/>小心谨慎</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz102" value="1"  <%if(xgtz01.charAt(10) == '1') out.print("checked");%>>浪漫多情</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz112" value="1"  <%if(xgtz01.charAt(11) == '1') out.print("checked");%>/>多愁善感</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz122" value="1"  <%if(xgtz01.charAt(12) == '1') out.print("checked");%>/>循规蹈矩</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz132" value="1"  <%if(xgtz01.charAt(13) == '1') out.print("checked");%>/>少言寡语</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz142" value="1"  <%if(xgtz01.charAt(14) == '1') out.print("checked");%>/>淡薄名利</li>
                          <input type="hidden" name="xgtz01" />
                      </ul>
                      <div style="clear:both"></div>
                  </div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;"><strong>业余生活安排：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                  	<ul>
                        <%
                            String yyap01= "00000000000";
                            if(loginUser.getYyap()!= null && loginUser.getYyap().length() == 11){
                                yyap01 = loginUser.getYyap();
                            }
                        %>
                  	<li><input name="yyap" type="checkbox" id="yyap002" value="1" <%if(yyap01.charAt(0) == '1') out.print("checked");%>/>看 电 视</li>
                  	<li><input name="yyap" type="checkbox" id="yyap012" value="1" <%if(yyap01.charAt(1) == '1') out.print("checked");%>/>泡 酒 吧</li>
                  	<li><input name="yyap" type="checkbox" id="yyap022" value="1" <%if(yyap01.charAt(2) == '1') out.print("checked");%>/>看　　书</li>
                  	<li><input name="yyap" type="checkbox" id="yyap032" value="1"  <%if(yyap01.charAt(3) == '1') out.print("checked");%>/>上　　网</li>
                  	<li><input name="yyap" type="checkbox" id="yyap042" value="1"  <%if(yyap01.charAt(4) == '1') out.print("checked");%>/>卡 拉OK</li>
                  	<li><input name="yyap" type="checkbox" id="yyap052" value="1" <%if(yyap01.charAt(5) == '1') out.print("checked");%>/>做 家 务</li>
                  	<li><input name="yyap" type="checkbox" id="yyap062" value="1" <%if(yyap01.charAt(6) == '1') out.print("checked");%>/>喝茶聊天</li>
                  	<li><input name="yyap" type="checkbox" id="yyap072" value="1" <%if(yyap01.charAt(7) == '1') out.print("checked");%>/>体育运动</li>
                  	<li><input name="yyap" type="checkbox" id="yyap082" value="1"  <%if(yyap01.charAt(8) == '1') out.print("checked");%>/>打工赚钱</li>
                  	<li><input name="yyap" type="checkbox" id="yyap092" value="1" <%if(yyap01.charAt(9) == '1') out.print("checked");%>/>
                        <input type="hidden" name="yyap01" />读书进修</li>
                  	<li><input name="yyap" type="checkbox" id="yyap102" value="1" <%if(yyap01.charAt(10) == '1') out.print("checked");%>/>结交朋友</li>
                  </ul>
                  <div style="clear:both"></div>
                  </div>
                        </td>
                </tr>
                </tbody>
                </table>
             <table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" width="100%" style="margin-top:5px;">
              	<tbody>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="width:120px;"><strong>交友意向：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                  <ul>
                      <%
                          String jyyx01= "00000000";
                          if(loginUser.getJyyx()!= null && loginUser.getJyyx().toString().length() == 6)
                              jyyx01 = loginUser.getJyyx().toString();
                      %>
                  	<li><input name="jyyx" type="checkbox" id="jyyx002" value="1"   <%if(jyyx01.charAt(1) == '1') out.print("checked");%> >纯友谊</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx012" value="2"   <%if(jyyx01.charAt(2) == '1') out.print("checked");%> >亲密关系</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx022" value="3"   <%if(jyyx01.charAt(3) == '1') out.print("checked");%> >婚 姻</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx032"  value="4"  <%if(jyyx01.charAt(4) == '1') out.print("checked");%> />陪伴</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx042"  value="5"  <%if(jyyx01.charAt(5) == '1') out.print("checked");%> />其它
                        <input type="hidden" name="jyyx01" />
                    </li>
                  </ul>
                  <div style="clear:both"></div>
                  </div>
                 </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>情爱关系：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  您认为感情、婚姻与性爱的关系是什么？请勿填写任何联系方式<br/>
                      <%
                      String qggx_str = "";
                          if(uother!=null){
                              if(uother.getQggx()!=null &&! "null".equals(uother.getQggx())){
                                          qggx_str =  uother.getQggx();
                                    }
                          }
                      %>
                      <textarea name="qggx" cols="70" rows="5" class="put" id="qggx2"><%=qggx_str%></textarea><br/>
                  <div id="qggx1"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>理想情人：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  为保证交友效果，请仔细描绘你的理想情人，并请勿填写任何联系方式<br/>
                      <%
                               String lxqr_content = "";
                          if(uother!=null && uother.getLxqr()!=null && !"null".equals(uother.getLxqr())){
                              lxqr_content = uother.getLxqr();
                          }
                      %>
                      <textarea name="lxqr" cols="70" rows="5" id="textarea2"><%=lxqr_content%></textarea><br/>
                  <div id="lxqr1"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>交友留言：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  为保证交友效果，留言请在20字以上，并请勿填写任何联系方式<br/>
                      <%
                          String jyly_content = "";
                          if(uother!=null && uother.getJyly()!=null && !"null".equals(uother.getJyly())){
                              jyly_content = uother.getJyly();
                                   if(name!=null){
                                       name.delete();
                                   }

                          }
                      %>
                      <textarea name="jyly" cols="70" rows="5" id="textarea"><%=jyly_content%></textarea><br/>
                  <div id="jyly1"></div>
                  </td>
                </tr>
                </tbody>
                </table>
                <table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" width="100%" style="margin-top:5px;">
              	<tbody>
                <tr>
                  <td align="right" bgcolor="#FFFFFF" class="bk04"><strong>联系方式：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">（请填写本人真实联系方式，以便网站审核及其他会员与您联系）</td>
                </tr>
                <tr>
                  <td style="width:120px;" align="right" bgcolor="#D6E6F3" class="bk04"><strong><strong>手机：</strong></strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">


                      <%
                          if (loginUser.getVacsjtel()== 1){
                      %>
                      <strong><%=loginUser.getSjtel() == null ? "" : loginUser.getSjtel()%></strong>
                      <span style="background-color:#090; height:20px;margin-left:10px;
                color:#FFF">已验证</span> &nbsp;
                      <input type="button" class="button1" onClick="modifysjtel();" value="重新验证" />
                      <%
                          }else{
                      %>



                      <input name="sjtel" type="text" class="input02" id="sjtel2" size="24" maxlength="20" value="<%=loginUser.getSjtel() == null ? "" : loginUser.getSjtel()%>" <%=(loginUser.getVacsjtel()== 1 && loginUser.getIsvcation() == 1 ) ? "readonly=\"true\"":"false"%>/>

                      <%
                          }
                      %>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>固定电话：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <input name="tel" type="text" class="input02" id="tel2" size="24" maxlength="20" value="<%=loginUser.getTel()==null ? "":loginUser.getTel()%>" />
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>QQ：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><input name="oicq" type="text" class="input02" id="oicq2" size="24" maxlength="20" value="<%=loginUser.getOicq() == null ? "":loginUser.getOicq()%>" />
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>E-mail：</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <input name="email" type="text" class="input02" id="email" size="24" maxlength="50" value="<%=loginUser.getEmail() == null ? "":loginUser.getEmail()%>" <%=(loginUser.getVacemail()== 1 && loginUser.getIsvcation() == 1 ) ? "readonly=\"true\"":"false"%>/>
                      <%
                          if (loginUser.getVacemail()== 1 && loginUser.getIsvcation() == 1 ){
                      %>

                      &nbsp;<strong><font color='red' size='2.5'>（已验证）</font></strong>&nbsp;&nbsp;
                      <%
                          }
                      %>
                  </td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>微信：</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                        <input name="wx" type="text" class="input02" id="wx" size="24" maxlength="50" value="<%=loginUser == null ? "":loginUser.getWx()%>" />
                     </td>
                </tr>
              </tbody>
            </table>
            <div class="MyBtn">
               <input name="bsendsms" type="submit" value="提交修改" class="btn">
            </div>
  </form>
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
<%
if("2".equals(loginUser.getIsdel()+"")){
	out.println("<script language='javascript'>alert('您的资料还未通过审核上线，我们将与您电话核实，请保持电话畅通！');</script>");
}
%>
<script>

function modifysjtel(){
	if(!confirm('修改资料会将您的资料设置为待审核状态，网站审核员将与您核实后激活您的资料上线！')) {
		return false;
	}
	window.location.href='grsjyz.jsp';
 }
</script>

</body>
</html>
