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

%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love��������</title>
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
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("����ȷ��дת��ҳ����");
                return;
   }
   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}
</script>


</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">�����û�</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>


  <table width="90%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td height="25" colspan="7" align="center">&nbsp;</td>
    </tr>
    <tr >
      <td width="0" align="center" class="tdc"><strong>���</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong>�� �� ��</strong></td>
      <td width="0" align="center" class="tdc"><strong>IP��ַ</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong>�û����</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong> �û�����</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong> ��½ʱ��</strong></td>
      <td width="0" height="25" align="center" class="tdc"><strong>ͣ��ʱ��</strong></td>
    </tr>
<%
Iterator enu = CacheTools.adminOnline.values().iterator();
Date cdate = new Date(System.currentTimeMillis());
int i =0;
while(enu.hasNext())
{
   i = i +1;
   Admininfo admin = (Admininfo)enu.next();
   String uj = "";
   if(admin.getFlag() != null)
   {
      if(admin.getFlag().intValue() == 10)
        uj = "����Ա";
      else if(admin.getFlag().intValue() == 2)
        uj = "���Ա";
      else
        uj = "����Ա";
   }
%>
    <tr>
      <td width="0" align="center"><%=(i+1)%></td>
      <td width="0" height="25" align="center"><%=admin.getAdminname()%></td>
      <td width="0" align="center"><%=admin.getMemo()%></td>
      <td width="0" height="25" align="center">������Ա</td>
      <td width="0" height="25" align="center"><%=uj%></td>
      <td width="0" height="25" align="right"><%=DateTools.dateToString(admin.getLasttime(),true)%></td>
      <td width="0" height="25" align="right"><%=SysCommonFunc.getDateStep(admin.getLasttime(),cdate)%></td>
    </tr>
<%
}
%>
<%
enu = CacheTools.userOnline.values().iterator();
while(enu.hasNext())
{
   i = i +1;
   Userinfo  user = (Userinfo)enu.next();
%>
    <tr>
      <td width="0" align="center"><%=(i+1)%></td>
      <td width="0" height="25" align="center"><a href="edithyinfo.jsp?id=<%=user.getHyid()%>" target="_blank"><%=user.getUsername()%></a></td>
      <td width="0" align="center"><%=user.getHttpip()%></td>
      <td width="0" height="25" align="center">��Ա</td>
      <td width="0" height="25" align="center"><%=LoverTools.getHyDj(user)%></td>
      <td width="0" height="25" align="right"><%=DateTools.dateToString(user.getLasttime(),true)%></td>
      <td width="0" height="25" align="right"><%=SysCommonFunc.getDateStep(user.getLasttime(),cdate)%></td>
    </tr>
<%
}
%>
</table>



</body>
</html>
<script>
function test(op,bbsid)
{
  var msg = "";
  if(op == '01')
    msg = "ȷ�����ô?";
  if(op == '02')
    msg = "ȷ��ȡ���ö�ô?";
  if(op == '03')
    msg = "ȷ���ö�ô?";
  if(op == '04')
    msg = "ȷ��ȡ���Ƽ�ô?";
  if(op == '05')
    msg = "ȷ���Ƽ�ô?";
  if(op == '06')
    msg = "ȷ��ɾ��ô?";

  if(!confirm(msg))
    return;
  document.go2to.bizaction.value=op;
  document.go2to.cbbsid.value=bbsid;
  document.go2to.submit();
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.adminname.value))
{
alert('���������Ա���ƣ�');
document.form1.adminname.focus();
return false;
}
if (checkspace(document.form1.adminpass.value))
{
alert('�����������ӹ���Ա�����룡');
document.form1.adminpass.focus();
return false;
}
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</script>
