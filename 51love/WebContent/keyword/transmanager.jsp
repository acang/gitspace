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
   //������
   String keyword = SysCommonFunc.getStrParameter(request,"keyword");
   if(keyword.length()> 0)
   {
       String address = SysCommonFunc.getStrParameter(request,"address");
       keyword = keyword.toUpperCase();
       Keywordlib key = new Keywordlib();
       key.setAddress(address);
       key.setKeyword(keyword);
       List list = HbmOperator.list("from Keywordlib as o where o.keyword = '"+keyword+"'");
       if(list != null && list.size() > 0)
       {
          key = (Keywordlib)list.get(0);
          key.setAddress(address);
          HbmOperator.update(key);
       }else
          HbmOperator.insert(key);
   }

   String delkey = SysCommonFunc.getStrParameter(request,"delkey");
   if(delkey.length() > 0)
   {
      HbmOperator.executeSql("delete from keywordlib where keyword='"+delkey+"'");
   }

   List list = HbmOperator.list("from Keywordlib as o ");
%>
<html>
<head>
<title>
transmanager
</title>
</head>
<body bgcolor="#ffffff">
<table width="100%" border="2" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25">�ؼ���</td>
    <td height="25">��ַ</td>
    <td height="25">����</td>
  </tr>
  <%
  for(int i =0;list != null && i < list.size();i ++)
  {
     Keywordlib temp = (Keywordlib)list.get(i);
  %>
  <tr>
    <td height="25"><%=temp.getKeyword()%></td>
    <td height="25"><%=temp.getAddress()%></td>
    <td height="25"><a href="transmanager.jsp?delkey=<%=temp.getKeyword()%>">ɾ��</a></td>
  </tr>
  <%
  }
  %>
  <tr>
    <td height="25">&nbsp;</td>
    <td height="25">&nbsp;</td>
    <td height="25">&nbsp;</td>
  </tr>
</table>
<br>
<br>
  <form name="form1" method="post" action="transmanager.jsp">
<table width="100%" border="2" cellspacing="0" cellpadding="0">
  <tr>
    <td width="21%" height="25">�ؼ���</td>
    <td width="79%" height="25"><label>
      <input name="keyword" type="text" id="keyword" size="50">
    </label></td>
  </tr>
  <tr>
    <td height="25">��ַ</td>
    <td height="25"><input name="address" type="text" id="address" size="50"></td>
  </tr>
  <tr>
    <td height="25">
      <input type="submit" name="Submit" value="�ύ">

    </td>
    <td height="25">&nbsp;</td>
  </tr>
</table>
  </form>
<h1>&nbsp;</h1>
</body>
</html>
