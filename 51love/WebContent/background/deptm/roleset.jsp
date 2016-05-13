<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="java.io.*"%>
<%

String eid = request.getParameter("eid");

String channelrole[]  = request.getParameterValues("channelcheck");
String modqxrole[]    = request.getParameterValues("modcheck");
String action = request.getParameter("action");
if(action != null && action.equals("set"))
{
   UserMap.setEmployeeRole(modqxrole,channelrole,eid);
}
Employee ey = UserMap.getOneEmployee(eid);

Hashtable mht = CommonFunc.splitString(ey.getModulerole(),",");
%>
<html>
<head>
<title>权限设置</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
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
<script language=javascript src="../script/common.js"></script>
<script language="javascript">

</script>
<link href="../../style/css.css" rel="stylesheet" type="text/css">
</head>
<body>
<form name="" action="" method="post">
  <input type="hidden" name="<%=eid%>">
  <input type="hidden" name="action" value="set">
<table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="26"><img src="../images/arrow2.gif" width="11" height="11" align="absmiddle">
        为<%=ey.getName()%> 设置权限
        <input name="Submit" type="submit" class="button1" value="保存"></td>
  </tr>
  <tr>
    <td height="1" bgcolor="#999999"></td>
  </tr>
</table>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#EEEEEE" class="txt" style="border-collapse:collapse ">
  <tr valign="middle" bgcolor="#f7f7f7">
    <td height="28" align="left">模块权限</td>
  </tr>
<%
Vector v = (Vector)SysCommonFunction.getSystemProObjectValue("module");
for(int i =0;i < v.size();i ++)
{
   ModType mt = (ModType)v.elementAt(i);
   System.out.println(mt.modlist.size());
%>
  <tr valign="middle" bgcolor="#f7f7f7">
    <td align="left"><table width="100%"  border="0" align="center" cellpadding="0" cellspacing="0" class="txt">
      <tr>
        <td height="22"><%=mt.typename%></td>
      </tr>
      <tr>
        <td height="13"><table width="95%"  border="0" align="center" cellpadding="0" cellspacing="0" class="txt">
          <%
          for(int j=0; j <mt.modlist.size();j ++)
          {
             ModOperation mop = (ModOperation)mt.modlist.elementAt(j);
          %>
          <tr>
            <td width="19%"><%=mop.modname%></td>
            <td width="81%" height="22">
              <%
              Iterator itor = mop.operatiron.keySet().iterator();
              while(itor.hasNext())
              {
                String key = itor.next().toString();
                String value = mop.operatiron.get(key).toString();
              %>
              <input type="checkbox" name="modcheck" <%if(mht.get(key) != null) out.print("checked");%> value="<%=key%>"><%=value%>
              <%
              }
              %>
            </td>
          </tr>
          <%
          }
          %>
        </table></td>
      </tr>
    </table> </td>
  </tr>
  <%
  }
  %>
</table>
<table width="100%" border="1" align="center" cellpadding="2" cellspacing="0" bordercolor="#EEEEEE" class="txt" style="border-collapse:collapse ">
  <tr valign="middle" bgcolor="#f7f7f7">
    <td height="28" align="left">栏目权限</td>
  </tr>
  <tr valign="middle" bgcolor="#f7f7f7">
    <td height="28" align="left"><table width="98%"  border="0" align="center" cellpadding="0" cellspacing="0" class="txt">
       <%=ChannelMap.channelCheckTop%>
       <%
       Hashtable ht = CommonFunc.splitString(ey.getChannelrole(),",");
       //System.out.println("dd"+ht.size());
       %>
       <%ChannelMap.outAllChannelTocheck(out,ht);%>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
