<%@ page contentType="text/html; charset=GBK" %>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK" %>
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
String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
List sortList = BBSMng.getAllSort();
String id = SysCommonFunc.getStrParameter(request,"id");
Bbsuser buser = BBSMng.getBbsuserByHyid(id);


if(bizaction.equals("01"))
{
   String s = BBSMng.modBbsuser(request,buser);
   if(s == null)
   {
      out.println("<script langauge=javascript>alert('修改会员等级信息成功！');window.opener.location.reload();window.close();</script>");
      return;
   }
   else
      out.println("<script langauge=javascript>alert('"+s+"！');</script>");
}

%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>修改会员等级</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
</head>

<body>
<form name="form1" method="post" action="bbs_useredit.jsp">
<input type="hidden" name="bizaction" value="01">
<input type="hidden" name="id" value="<%=id%>"/>
</ins>
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr align="center" bgcolor="#FFFFFF">
    <td  colspan="2">修改等级/金币</td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>会员帐号:</strong></span></td>
    <td height="30"><%=buser.getUsername()%></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>论坛等级:</strong></span></td>
    <td height="30"><span class="style3"><%=buser.getGrade()%>
      <select name="grade" id="grade">
        <%
            for(int i =0;i < BBSMng.gradeDes.length;i ++)
            {
               String se = "";
               if((i+"").equals(buser.getGrade().toString()))
                se = "selected";
            %>
        <option value="<%=i%>" <%=se%>><%=BBSMng.gradeDes[i]%></option>
        <%
            }
            %>
      </select>
    </span></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>主题贴数:</strong></span></td>
    <td height="30"><input name="topics" type="text" value="<%=buser.getTopics()%>" size="5"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>推荐贴数:</strong></span></td>
    <td height="30"><input name="commend" type="text" value="<%=buser.getCommend()%>" size="5"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>跟贴数:</strong></span></td>
    <td height="30"><input name="resum" type="text" value="<%=buser.getResum()%>" size="5"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>金币数:</strong></span></td>
    <td height="30"><input name="moneys" type="text" value="<%=buser.getMoneys()%>" size="5"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="30" align="center" class="tdc"><span class="style11"><strong>注册时间:</strong></span></td>
    <td height="30"><input name="regtime" type="text" value="<%=DateTools.dateToString(buser.getRegtime(),true)%>" size="20"></td>
  </tr>
  <tr align="center" bgcolor="#FFFFFF">
    <td height="30"  colspan="2"><input type="submit" name="Submit" value="修改"></td>
  </tr>
</table>
</form>
</body>
</html>
