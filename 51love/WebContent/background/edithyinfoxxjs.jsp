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
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
String hyid = SysCommonFunc.getStrParameter(request,"id");
Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1")){
	  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
	}else{
		List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
	    if(templist != null && templist.size() > 0)
	    {
	    	loginUser = (Userinfo)templist.get(0);
	    }
	}
Userother uother = HYRegMng.getUserOtherByHyid(hyid);
if(uother == null)
{
  uother = new Userother();
  uother.setJyly("");
  uother.setLxqr("");
  uother.setQggx("");
  uother.setHyid(loginUser.getHyid());
  uother.setUsername(loginUser.getUsername());
  HbmOperator.insert(uother);
}
  List list = HbmOperator.list("from UserReceiveSet as o where o.hyid="+loginUser.getHyid());
  UserReceiveSet userReceiveSet = null;
  if(list != null && list.size() > 0)
    userReceiveSet = (UserReceiveSet)list.get(0);
  int receiveyesno = 0;
    int receivetype = 0;
    if (userReceiveSet!=null){
	    if (userReceiveSet.getReceiveyesno()!=null){
	    	receiveyesno=userReceiveSet.getReceiveyesno().intValue();
	    }
	    if (userReceiveSet.getReceivetype()!=null){
	    	receivetype=userReceiveSet.getReceivetype().intValue();
	    }
    }

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");

if(bizaction.equals("04"))
{
  String s = UserReceiveSetMng.userupdateUserReceiveSet(request,loginUser);

  if(s == null)
    out.println("<script language='javascript'>alert('您已经修改了会员信息接收设置！');</script>");
  else
    out.println("<script language='javascript'>alert('"+s+"！');</script>");
  return;
}



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

<body>
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
	<a href="hybjd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">白金豆记录</a>&nbsp;&nbsp;
	<a href="hyxx.jsp?id=<%=hyid%>&isdel=<%=isdel%>">信息收发</a>&nbsp;&nbsp;
	  <a href="edithyinfoxxjs.jsp?id=<%=hyid%>&isdel=<%=isdel%>">信息接收设置</a>&nbsp;&nbsp;
	  <a href="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">会员审核</a>&nbsp;&nbsp;
	</td>
	<td>
	<a href="gogrzq.jsp?id=<%=hyid%>&isdel=<%=isdel%>" target="_blank">进入个人专区</a>&nbsp;&nbsp;
      <!-- <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">留言</a> --></td>
  </tr>
  <tr>
    <td height="25">提醒：当前修改的会员编号：<STRONG><%=loginUser.getHyid()%></STRONG>　　用户名：<STRONG><%=loginUser.getUsername()%></STRONG>　　昵称：<STRONG><%=loginUser.getLcname()%></STRONG></td>
  </tr>
</table>
  <table  id="t3"  width="60%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
              <form name="sethyzt" method="POST" target="sframe" action="edithyinfoxxjs.jsp">
           <input type="hidden" name="bizaction" value="04"/>
           <input type="hidden" name="id" value="<%=loginUser.getHyid()%>">
           <input type="hidden" name="isdel" value="<%=isdel%>">
	 <tr>
       <td height="25" colspan="2" align="center" class="tdc" ><strong>信息接收设置</strong></td>
     </tr>
     <tr>
       <td width="45%" height="25" align="center" class="tdc" ><strong>网站信息接收：</strong></td>
       <td width="55%" height="25"  align="left">
       <select id="receiveyesno" name="receiveyesno">
         <option value="0" <%if(receiveyesno == 0) out.print("selected");%>>接收</option>
         <option value="1" <%if(receiveyesno == 1) out.print("selected");%>>不接收</option>
       </select>
       </td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>接收方式：</strong></td>
       <td height="25"  align="left">
       <select id="receivetype" name="receivetype">
         <option value="0" <%if(receivetype==0) out.print("selected");%>>不限</option>
         <option value="1" <%if(receivetype==1) out.print("selected");%>>手机</option>
         <option value="2" <%if(receivetype==2) out.print("selected");%>>邮箱</option>
       </select>
       </td>
     </tr>
     
     <tr>
       <td height="25" align="left" >&nbsp;</td>
       <td height="25"  align="left"><input  name="submit3" type="submit" class="button1" value="确认修改" width="94" height="28" /></td>
     </tr>

	 </form>
</table>

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
</script>
