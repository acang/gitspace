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
<%
///�����û����ֲ�ѯ�û���Ϣ ע���Ƿ���ɾ���û� ISDEL
///��½�ɹ��޸�����½ʱ��
///��ѯVIP �û���Ϣ
   String username = SysCommonFunc.getStrParameter(request,"username");
   String password = SysCommonFunc.getStrParameter(request,"password");
   if(username.length() > 0)
   {
       String s = HYRegMng.userLogin(username,password,request);
       if(s != null)
       {
          out.println("<script language='javascript'>alert('"+s+"');</script>");
       }else
       {
          response.sendRedirect("cart1.jsp");
       }
   }

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51������������֧��ϵͳ</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script language="javascript">
function ChkInput(){
 if (document.form1.username.value=="" )
{
alert('�������û���');
document.form1.username.focus();
return false;
}
return true;
}

</script>
</head>
<body>
<table width="801" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/cart/bg.gif">
  <tr>
    <td>&nbsp;</td>
    <td width="760"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="http://www.chinapay.com/" target="_blank"><img src="../images/cart/cuplogo.gif" width="152" height="40" border="0" /></a></td>
            <td width="400"><img src="../images/cart/001.gif" width="392" height="40" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="../images/cart/nav.gif" width="760" height="19" /></td>
      </tr>
      <tr>
        <td><img src="../images/cart/shadow.jpg" width="286" height="16" /></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="tit02"><table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td bgcolor="#F1F1F1" class="bk02"><a href="http://www.chinapay.com/newportal/cooperate/merchant.jsp" target="_blank">�й�������Ҫ�ͻ� <img src="../images/cart/5xing.gif" width="41" height="8"  border="0"/></a></td>
              </tr>
            </table></td>
          </tr>
        </table>
		<form method="post" action="check.jsp" name="form1" onSubmit="return ChkInput();">
		
        <table width="358" border="0" align="center" cellpadding="0" cellspacing="0" >
          <tr>
            <td><img src="../images/cart/002.gif" width="358" height="77" /></td>
          </tr>
          <tr>
            <td><img src="../images/cart/003.gif" width="358" height="30" /></td>
          </tr>
          <tr>
            <td background="../images/cart/004.gif"><table width="195" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td width="67" height="30" align="right" class="tit01">�û�����</td>
                <td width="128">
                  <input name="username" type="text" size="14"  style="width:124px;"/>
                </td>
              </tr>
              <tr>
                <td height="30" align="right" class="tit01">��&nbsp;&nbsp; �룺</td>
                <td><input type="password" name="password" size="14" style="width:124px;" /></td>
              </tr>
<tr>
<td height="30" align="right" class="tit01">��֤�룺</td>
<td height="30">
<table   width="100%" border="0" cellspacing="0" cellpadding="0">
<tr>
                <td ><input  type=text maxLength=4 size=4 name=imager width="40"></td><td style="padding-left:10px"><img src="imager.jsp" width=50 height="20" ></td>
              </tr>
</table>
</td>
</tr>


            </table>
              <table width="344" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                  <td height="20"><img src="../images/cart/005.gif" width="344" height="3" /></td>
                </tr>
                <tr>
                  <td height="32" align="center"><input type="image" name="Submit2" src="../images/cart/btn.gif" width="91" height="27" border="0" /></td>
                </tr>
              </table></td>
          </tr>
          <tr>
            <td><img src="../images/cart/006.gif" width="358" height="29" /></td>
          </tr>
        </table>

		</form>
		</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="bk01"><%@ include file="../footer2.jsp"%></td>
  </tr>
</table>
</body>
</html>





