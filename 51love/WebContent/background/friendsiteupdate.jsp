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
  String id = SysCommonFunc.getStrParameter(request,"id");
  if(id.length() ==0)
    id = "0";
  String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
  if(bizaction.equals("01"))
  {
    String s = FriendSiteMng.modFriendsite(request);
      if(s == null)
      {
         out.println("<script language='javascript'>alert('���Ѿ��ɹ��޸����������ӣ�');window.opener.location.reload();window.close();</script>");
      }
      else
      {
        out.println("<script language='javascript'>alert('"+s+"');</script>");
      }
  }

  Friendsite frs = FriendSiteMng.getFriendsite("from Friendsite as o where o.id="+id);
  if(frs == null)
    frs = new Friendsite(new Integer(0),new Integer(2),"","","","","","","",0,0,new Integer(0));



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

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;

   document.go2to.submit();
}
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">���������޸�</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="AddLink" method="Post" action="friendsiteupdate.jsp" onSubmit="return Check()">
                            <input type="hidden" name="id" value="<%=id%>"/>
                            <input type="hidden" name="bizaction" value="01"/>
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                              <tr class="title">
                                <td height="22" colspan="2" align="center" class="tdc"><strong>�޸�����������Ϣ</strong></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" valign="middle" class="tdc"><strong>��ţ�</strong></td>
                                <td width="788" height="25"><input name="xuhao" value="<%=frs.getXuhao() == null?0:frs.getXuhao().intValue()%>" size="10"  maxlength="20">
                                <font color="#FF0000"> ����*</font></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" valign="middle" class="tdc"><strong>��վ���ƣ�</strong></td>
                                <td height="25"><input name="sitename" id="sitename" title="����������������վ���ƣ����Ϊ20������" size="30"  maxlength="20" value="<%=frs.getSitename()%>">
                                    <font color="#FF0000"> *</font></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" class="tdc"><strong>��վ��ַ��</strong></td>
                                <td height="25"><input name="siteurl" type="text" id="siteurl" title="����������������վ��ַ�����Ϊ50���ַ���ǰ������http://" size="30"  maxlength="100" value="<%=frs.getSiteurl()%>">
                                    <font color="#FF0000">*</font></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" class="tdc"><strong>��ϵ��������</strong></td>
                                <td height="25"><input name="siteadmin" type="text" id="siteadmin"  title="�������������Ĵ����ˣ���Ȼ��֪������˭�������Ϊ20���ַ�" size="30"  maxlength="20" value="<%=frs.getSiteadmin()%>">
                                    <font color="#FF0000">*</font></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" class="tdc"><strong>��ϵ�˵绰��</strong></td>
                                <td height="25"><input name="logourl" type="text" id="logourl" size="30"  maxlength="100" value="<%=frs.getLogourl()%>">                                </td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" height="25" align="center" class="tdc"><strong>�����ʼ���</strong></td>
                                <td height="25"><input name="email" type="text" id="email" title="����������������ϵ�����ʼ������Ϊ30���ַ�" size="30"  maxlength="30" value="<%=frs.getEmail()%>">
                                    <font color="#FF0000">*</font></td>
                              </tr>
                              <tr class="tdbg">
                                <td width="429" align="center" class="tdc"><strong>��վ��飺</strong></td>
                                <td valign="middle"><textarea name="siteintro" cols="40" rows="5" id="siteintro" title="����������������վ�ļ򵥽���"><%=frs.getSiteintro()%></textarea></td>
                              </tr>


                              <tr class="tdbg">
                                <td  height="40" colspan="2" align="center">

                                    <input name="cmdOk" type="submit" class="button1" value=" ȷ �� ">                                </td>
                              </tr>
                </table>
			  </form>




</body>
</html>
<script>
function test()
{
  if(!confirm('ȷ��ɾ����')) return false;
}
</script>
<script LANGUAGE="javascript">
function Check() {
if (document.AddLink.sitename.value=="")
	{
	  alert("��������վ���ƣ�")
	  document.AddLink.sitename.focus()
	  return false
	 }
if (document.AddLink.siteurl.value=="")
	{
	  alert("��������վ��ַ��")
	  document.AddLink.siteurl.focus()
	  return false
	 }
if (document.AddLink.siteurl.value=="http://")
	{
	  alert("��������վ��ַ��")
	  document.AddLink.siteurl.focus()
	  return false
	 }
if (document.AddLink.siteadmin.value=="")
	{
	  alert("��������ϵ��������")
	  document.AddLink.siteadmin.focus()
	  return false
	 }
if (document.AddLink.email.value=="")
	{
	  alert("����������ʼ���ַ��")
	  document.AddLink.email.focus()
	  return false
	 }
if (document.AddLink.email.value=="@")
	{
	  alert("����������ʼ���ַ��")
	  document.AddLink.email.focus()
	  return false
	 }

if (document.AddLink.siteintro.value=="")
	{
	  alert("��������վ��飡")
	  document.AddLink.siteintro.focus()
	  return false
	 }
}
</script>
