<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>����֧������</title>
<link href="../style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<style type="text/css">
<!--
.style9 {	font-size: 14px;
	font-weight: bold;
}
-->
</style>
</head>
<%
int ret = CartMng.cartOk(request);
String s = CartMng.cartOkResponse(ret);
out.println("״̬��"+s+"+"+ret);
System.out.println("״̬��"+s+"+"+ret);

%>

<body>
<%
if(ret ==0 || ret==5)
{
   Userinfo tempUser = (Userinfo)request.getAttribute("okuser");
   request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,tempUser);
	if(tempUser!=null){
		if(tempUser.getImportant()==null||tempUser.getImportant()!=91){
			Userother uother = HYRegMng.getUserOtherByHyid(""+tempUser.getHyid());
			  //must have photo
		    if(uother.getUserphoto1()!=null&& uother.getUserphoto1().trim().length()>0){
		    	String type = "9";
		        String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
		        HbmOperator.executeSql(sql2);
		        String sql = "update userinfo set important = " + type+"1  where  hyid = " +tempUser.getHyid();
		        HbmOperator.executeSql(sql);
		    }
		}
 }
	// /���û�VIP��Ϣ���뵽��½��Ϣ��
  Userinfo grwhqUser = (Userinfo)request.getSession().getAttribute(SysDefine.SESSION_LOGINNAME);
  grwhqUser.setFlag(SysDefine.SYSTEM_HY_TYPE_vip);
  request.getSession().setAttribute(SysDefine.SESSION_LOGINNAME,
		   grwhqUser);
  response.sendRedirect("http://www.51lover.org/grzq.jsp");
}
%>

<%
if(ret != 0 && ret != 5)
{
%>
<table width="400" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:100px;">
  <tr>
    <td height="30" align="center" bgcolor="#1D5EA6" class="tit11"><strong>����֧�����ɹ�</strong></td>
  </tr>
  <tr>
    <td height="4" align="center" bgcolor="#E7F0FA">&nbsp;</td>
  </tr>
  <tr>
    <td height="4" align="center" bgcolor="#E7F0FA">
      ���鲢����֧��</td>
  </tr>
  <tr>
    <td align="center" bgcolor="#E7F0FA" class="bk02" style="padding:20px;"><input type="button" value="������д����" onclick="location.replace('cart1.jsp')"></td>
  </tr>
</table>
<%
}
%>

</body>
</html>



