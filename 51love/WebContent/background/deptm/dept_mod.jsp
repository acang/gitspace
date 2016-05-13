<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%
/**
 * 当前要修改的部门id;
 */
String deptid = request.getParameter("deptid");
if(deptid == null)
  deptid = "0";

/**
 * 父部门id;
 */
String pdeptid = request.getParameter("pdeptid");
if(pdeptid == null)
  pdeptid = "0";

String deptname = request.getParameter("deptname");
String sort     = request.getParameter("sort");
Dept cdept = null;
if(deptname != null &&deptname.length() >0)
{
  cdept = DeptMap.modDept(deptid,pdeptid,deptname,sort);
  deptid = cdept.getDeptid()+"";
  pdeptid = cdept.getParentid()+"";
     out.println("<script>\n");
     out.println("alert('操作成功！');\n");
     //out.println("parent.opener.location.reload();");
     out.println("top.opener.parent.tree.location.reload();top.close();");
     out.println("</script>\n");


}
if(cdept == null && !deptid.equals("0"))
  cdept = DeptMap.getOneDept(deptid);
else if(cdept == null)
  cdept = new Dept();

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
<link href="../../style/css.css" rel="stylesheet" type="text/css">
    <script language=javascript src="../../script/common.js"></script>
<script language="javascript">
function checkfrm(frm)
{
   //alert(frm.dicnumber.value);
   if(trim(document.all.deptname.value) == "")
   {
      alert("请输入部门名称！");
      return false;
   }

   return true;
}
</script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center"><%if(deptid.equals("0")) out.println("增加部门"); else out.println("修改部门");%></td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<iframe name="deptFrm" style="display:none"></iframe>
<form action="dept_mod.jsp" method="POST" onSubmit="return checkfrm(this);" target="deptFrm">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">
       <input type="hidden" name="deptid" value="<%=deptid%>">
       <input type="hidden" name="pdeptid" value="<%=pdeptid%>">
        <tr valign="middle">
          <td height="32" align="center">部门名称：</td>
          <td height="32"><input name="deptname" type="text" class="input3" id="deptname" value="<%=cdept.getDeptname()==null?"":cdept.getDeptname()%>"></td>
        </tr>
        <tr valign="middle">
          <td width="96" height="27" align="center">排　序：</td>
          <td width="354" height="27"><select name="sort" size="1">
            <option value="-1" selected>排序</option>
            <option value="0">最前</option>
          </select></td>
        </tr>

        <tr valign="middle">
          <td height="40" colspan="2" align="center"><input name="" type="submit" class="button1"  value="确　定">
            　
              <input name="reset" type="reset" class="button1" value="重　写">
            　
            <input name="close" type="button" class="button1" onClick="window.close();" value="关　闭"></td>
        </tr>
</table>
</form>
</body>
</html>
