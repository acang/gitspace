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
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
String photo = SysCommonFunc.getStrParameter(request,"photo");
if(hyid.length() ==0)
{
   out.println("会员信息不存在，请重新查找");
   return;
}
Userinfo loginUser = null;

if(isdel.equals("1"))
  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
else
  loginUser = HYRegMng.getUserinfoByHyid(hyid);
if(loginUser == null)
{
   out.println("会员信息不存在，请重新查找");
   return;
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


String afilepath =request.getContextPath() +"/"+InitEnvironment.getSystemProValue(SysDefine.ENV_ANNEXPATH_PATH);
String bizaction=SysCommonFunc.getStrParameter(request,"bizaction");
String lca="E:\\web\\lover51\\upload\\hyimg\\";
String lca2="E:\\web\\lover51\\upload\\hyimgsmall\\";
String url = "edithyphoto.jsp?id="+hyid+"&isdel=0";


if(bizaction.equals("1") && photo.equals("1"))
{
    ImageReverseTest.rotateImage(lca+uother.getUserphoto1(),90);
	ImageReverseTest.rotateImage(lca2+uother.getUserphoto1(),90);
	response.sendRedirect(url+"&photo=1");
}
if(bizaction.equals("1") && photo.equals("2"))
{
	ImageReverseTest.rotateImage(lca+uother.getUserphoto2(),90);
	ImageReverseTest.rotateImage(lca2+uother.getUserphoto2(),90);
	response.sendRedirect(url+"&photo=2");
}if(bizaction.equals("1") && photo.equals("3"))
{
	ImageReverseTest.rotateImage(lca+uother.getUserphoto3(),90);
	ImageReverseTest.rotateImage(lca2+uother.getUserphoto3(),90);
	response.sendRedirect(url+"&photo=3");
}if(bizaction.equals("1") && photo.equals("4"))
{
	ImageReverseTest.rotateImage(lca+uother.getUserphoto4(),90);
	ImageReverseTest.rotateImage(lca2+uother.getUserphoto4(),90);
	response.sendRedirect(url+"&photo=4");
}if(bizaction.equals("1") && photo.equals("5"))
{
	ImageReverseTest.rotateImage(lca+uother.getUserphoto5(),90);
	ImageReverseTest.rotateImage(lca2+uother.getUserphoto5(),90);
	response.sendRedirect(url+"&photo=5");
}



if(bizaction.equals("2")&& photo.equals("1"))
{
	ImageUtil.dealImage(lca+uother.getUserphoto1(), "", lca+uother.getUserphoto1(), "");
	ImageUtil.dealImage(lca2+uother.getUserphoto1(), "", lca2+uother.getUserphoto1(), "");
	response.sendRedirect(url+"&photo=1");
}
if(bizaction.equals("2")&& photo.equals("2"))
{
	ImageUtil.dealImage(lca+uother.getUserphoto2(), "", lca+uother.getUserphoto2(), "");
	ImageUtil.dealImage(lca2+uother.getUserphoto2(), "", lca2+uother.getUserphoto2(), "");
	response.sendRedirect(url+"&photo=2");
}if(bizaction.equals("2")&& photo.equals("3"))
{
	ImageUtil.dealImage(lca+uother.getUserphoto3(), "", lca+uother.getUserphoto3(), "");
	ImageUtil.dealImage(lca2+uother.getUserphoto3(), "", lca2+uother.getUserphoto3(), "");
	response.sendRedirect(url+"&photo=3");
}if(bizaction.equals("2")&& photo.equals("4"))
{
	ImageUtil.dealImage(lca+uother.getUserphoto4(), "", lca+uother.getUserphoto4(), "");
	ImageUtil.dealImage(lca2+uother.getUserphoto4(), "", lca2+uother.getUserphoto4(), "");
	response.sendRedirect(url+"&photo=4");
}if(bizaction.equals("2")&& photo.equals("5"))
{
	ImageUtil.dealImage(lca+uother.getUserphoto5(), "", lca+uother.getUserphoto5(), "");
	ImageUtil.dealImage(lca2+uother.getUserphoto5(), "", lca2+uother.getUserphoto5(), "");
	response.sendRedirect(url+"&photo=5");
}

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    	<script type="text/javascript">
 	function sub()
 	{
		document.getElementById('bizaction').value= "1";
		document.edithyphoto1.submit();
 	}
 	function sub2()
 	{
		document.getElementById('bizaction2').value= "2";
		document.edithyphoto2.submit();
 	}


  	</script>
  </head>

  <body >

<table>

<tr>

<td width="800">
 <%if(photo.equals("1"))
{
%>
<img src="<%=afilepath+File.separator+uother.getUserphoto1()%>">
<%} %>
 <%if(photo.equals("2"))
{
%>
<img src="<%=afilepath+File.separator+uother.getUserphoto2()%>">
<%} %>
 <%if(photo.equals("3"))
{
%>
<img src="<%=afilepath+File.separator+uother.getUserphoto3()%>">
<%} %>
 <%if(photo.equals("4"))
{
%>
<img src="<%=afilepath+File.separator+uother.getUserphoto4()%>">
<%} %>
 <%if(photo.equals("5"))
{
%>
<img src="<%=afilepath+File.separator+uother.getUserphoto5()%>">
<%} %>
</td>
</tr>
<tr><td>
<br>
	<input type="button" value="逆时针旋转90度" onclick="sub()">

	<input type="button" value="加上水印" onclick="sub2()">
	</td>
</tr>
<tr>
<td>
(点击按钮后刷新即可看到按钮效果)
</td>
</tr>

</table>
<form action="edithyphoto.jsp" name="edithyphoto1">
 <input name="bizaction" id ="bizaction" type="hidden" >
 <input type="hidden" name="id" value="<%=loginUser.getHyid()%>">
 <input type="hidden" name="photo" value="<%=photo%>">
</form>
<form action="edithyphoto.jsp" name="edithyphoto2">
 <input name="bizaction" id ="bizaction2" type="hidden" >
 <input type="hidden" name="photo" value="<%=photo%>">
  <input type="hidden" name="id" value="<%=loginUser.getHyid()%>">
</form>
<form>
  </body>
</html>
