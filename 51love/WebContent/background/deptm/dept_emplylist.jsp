<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%
  Employee empl = (Employee)session.getAttribute(SessionNameDefine.LOGIN_USER_NAME);
  String deptid = request.getParameter("deptid");
  if(deptid == null)
    deptid = "0";
  List elist = HbmOperator.list("from Employee as o where o.edeptid="+deptid+" and o.useable="+SysParaDefine.IS_MAY_USE +" order by sort asc");
  Dept cdept = DeptMap.getOneDept(deptid);

%>
<html>
<head>
<title></title>
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
<script language=javascript src="../../script/common.js"></script>
<script language="javascript">
function del(did)
{
  if(confirm("确定要删除该部门吗？"))
  {
    document.turnPage.dbid.value = did;
    document.turnPage.submit();

  }
}


function delUser(k) {
  if (confirm('您确定要删除该人员吗？') == true) {
      document.all("empId").value = k;
      delEmpForm.submit();
      return true;
  }
  else {
      return false;
  }

}
</script>
<link href="../../style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
.style1 {font-weight: bold}
-->
</style>
</head>
<iframe name="delEmpFrm" style="display:none;"></iframe>
<form name="delEmpForm" action="del_user.jsp" target="delEmpFrm">
<input type="hidden" name="empId" value="">
</form>
<body>
<table width="100%" border="0">
  <tr>
    <td><table width="100%"  border="0" align="left" cellpadding="0" cellspacing="0" class="txt">
  <tr>
    <td height="26"><img src="../images/arrow2.gif" width="11" height="11" align="absmiddle">
    <%if(cdept != null) out.println(cdept.getDeptname()+"__");%>人员列表</td>
  </tr>
  <tr>
    <td height="1" bgcolor="#999999"></td>
  </tr>
  <tr>
    <td height="40" align="right">
      <%
      if(UserMap.userHaveModulePre("100-001",empl))
      {
      %>
      <input name="Submit2" type="button" class="button1" value="新增部门" onClick="modalWindow('dept_mod.jsp?pdeptid=<%=deptid%>',550,450);">
      <%
      }
      %>
      <input name="Submit22" type="button" class="button1" value="修改部门" onClick="modalWindow('dept_mod.jsp?deptid=<%=deptid%>',550,450);">
      <input name="Submit22" type="button" class="button1" value="删除部门" onClick="modalWindow('dept_del.jsp?deptid=<%=deptid%>',550,450);">
      <input name="Submit" type="button" class="button1" value="新增人员" onClick="modalWindow('add_user.jsp?deptid=<%=deptid%>',600,500);"></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td><table width="100%" border="1" align="left" cellpadding="2" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">

  <tr valign="middle" bgcolor="#f7f7f7">
    <td width="121" height="28" align="center"><strong> 编号</strong></td>
    <td width="128" align="center"><strong>姓名</strong></td>
    <td width="131" align="center"><strong>电话</strong></td>
    <td width="153" align="center"><strong>管理员</strong></td>
    <td width="155" height="28" align="center"><strong>操作</strong></td>
  </tr>

<%
for(int i =0;elist != null && i < elist.size();i ++)
{
  Employee emp = (Employee)elist.get(i);
%>
  <tr valign="middle" bgcolor="#ffffff" onMouseOver="bgColor='#DDECFF'" onMouseOut="bgColor='#ffffff'">
    <td width="121" align="center"><%=emp.getEid()%></td>
    <td width="128" align="center"><%=emp.getName()%></td>
    <td width="131" align="center"><%=emp.getPhone()%></td>
    <td width="153" height="28" align="center"><%if(emp.getIsadmin()==1) out.println("超级管理员");%></td>
    <td width="155" height="28" align="center">
    <a href="javascript:" class="manager" onClick="modalWindow('mod_user.jsp?eid=<%=emp.getEid()%>',600,500);">[修改]</a>
    <a href="javascript:" class="manager" onClick="return delUser(<%=emp.getEid()%>);">[删除]</a>
    <a href="roleset.jsp?eid=<%=emp.getEid()%>" class="manager" >[权限]</a>
    </td>
  </tr>
<%
}
%>
</table></td>
  </tr>
</table>



</body>
</html>
