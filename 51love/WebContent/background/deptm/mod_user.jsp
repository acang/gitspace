<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*,
                 com.web.map.*"%>


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
  function checkSubmit() {
    var position = document.all("position").options[document.all("position").selectedIndex].value;
    var isadmin = document.all("isadmin").options[document.all("isadmin").selectedIndex].value;
    var sort = document.all("sort").options[document.all("sort").selectedIndex].value;

    if (trim(document.all("eaccount").value) == "") {
        alert('请填写登录帐号！');
        document.all("eaccount").focus();
        return false;

    }
    if (document.all("epassword").value == "") {
        alert('请填写登录密码！');
        document.all("epassword").focus();
        return false;

    }
    if (document.all("epassword2").value == "") {
        alert('请填写确认密码！');
        document.all("epassword2").focus();
        return false;

    }
    if (trim(document.all("name").value) == "") {
        alert('请填写姓名！');
        document.all("name").focus();
        return false;

    }
    if (trim(document.all("aliasname").value) == "") {
        alert('请填写别名！');
        document.all("aliasname").focus();
        return false;

    }

    if (document.all("epassword").value != document.all("epassword2").value) {
        alert('登录密码与确认密码必须相同，请重新输入！');
        document.all("epassword").focus();
        return false;

    }

    if (position == -1) {
        alert('请选择职务！');
        return false;

    }

    if (isadmin == -1) {
        alert('请选择是否超级管理员！');
        return false;

    }
    if (sort == -1) {
        alert('请选择排序！');
        return false;

    }
    modForm.submit();


  }
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<%
  String eid = request.getParameter("eid") == null ?
                          "" : request.getParameter("eid");
  //职员ID
  Employee emp = UserMap.getOneEmployee(eid);


  String eaccount = emp.getEaccount() == null ? "" : emp.getEaccount();
  //登录帐号
  String name = emp.getName() == null ? "" : emp.getName();
  //姓名
  String aliasname = emp.getAliasname() == null ? "" : emp.getAliasname();
  //别名
  String address = emp.getAddress() == null ?
                          "" : emp.getAddress();
  //家庭住址
  String phone = emp.getPhone() == null ?
                          "" : emp.getPhone();
  //电话号码
  int position = emp.getPosition();
  //职务
  int sort = emp.getSort();
  //排序
  int isadmin = emp.getIsadmin();
  //是否超级管理员
  String epassword = emp.getEpassword() == null ?
                          "" : emp.getEpassword();
  //密码

%>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">修改人员信息</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<iframe name="modFrm" style="display:none;"></iframe>
<form action="mod_user_do.jsp" method="post" name="modForm" target="modFrm">
<input type="hidden" name="eid" value="<%=eid%>">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">

        <tr valign="middle">
          <td width="107" height="32" align="left"><strong>登录帐号<span class="style1">*</span></strong></td>
          <td width="393" height="32">
            <input name="eaccount" type="text" class="input3" id="eaccount" value="<%=eaccount%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>登录密码<span class="style1">*</span></strong></td>
          <td height="27">
            <input name="epassword" type="password" class="input3" id="epassword" value="<%=epassword%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>确认密码<span class="style1">*</span></strong></td>
          <td height="27">
            <input name="epassword2" type="password" class="input3" id="epassword2" value="<%=epassword%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>姓　　名<span class="style1">*</span></strong></td>
          <td height="27">
            <input name="name" type="text" class="input3" id="name" value="<%=name%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>别　　名<span class="style1">*</span></strong></td>
          <td height="27">
            <input name="aliasname" type="text" class="input3" id="aliasname" value="<%=aliasname%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>职　　务<span class="style1">*</span></strong></td>
          <td height="27">
            <select name="position" size="1" id="position">
              <option value="-1" selected>--请选择--</option>
<%

   List list = DicMap.getDicList(SysParaDefine.PUBLIC_ZW);
   for (int i = 0; list != null && i < list.size(); i++) {
        Dic dictionary = (Dic) list.get(i);
        String sel = "";
        if (dictionary.getDicnumber().intValue() == position)
            sel = " selected=selected";

%>
           <option value="<%=dictionary.getDicnumber().toString()%>" <%=sel%>><%=dictionary.getContent()%></option>

<%
   }
%>


          </select></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>家庭地址</strong></td>
          <td height="27">
            <input name="address" type="text" class="link1" id="address" value="<%=address%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>联系电话</strong></td>
          <td height="27">
            <input name="phone" type="text" class="input3" id="phone" value="<%=phone%>">
          </td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>是否超级管理员<span class="style1">*</span></strong></td>
          <td height="27"><select name="isadmin" size="1" id="isadmin">
            <option value="-1" selected>--请选择--</option>
<%
   String seladmin1 = "";
   String seladmin2 = "";
   if ((isadmin + "").equals(SysParaDefine.IS_SUPER_ADMIN))
       seladmin1 = " selected=selected";
   if ((isadmin + "").equals(SysParaDefine.IS_NOT_SUPER_ADMIN))
       seladmin2 = " selected=selected";
%>
            <option value="<%=SysParaDefine.IS_SUPER_ADMIN%>" <%=seladmin1%>>是</option>
            <option value="<%=SysParaDefine.IS_NOT_SUPER_ADMIN%>" <%=seladmin2%>>否</option>
          </select></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>排　　序<span class="style1">*</span></strong></td>
          <td height="27"><select name="sort" size="1">
            <option value="-1" selected>排序</option>
<%
  String selsort = "";
  if (sort == 0)
      selsort = "selected=selected";
%>
            <option value="0" <%=selsort%>>最前</option>
          </select></td>
        </tr>

        <tr valign="middle">
          <td height="40" colspan="2" align="center"><input name="" type="button" class="button1"  value="修　改" onClick="return checkSubmit();">
            　
            <input name="close" type="button" class="button1" onClick="window.close();" value="关　闭"></td>
        </tr>
</table>
</form>
</body>
</html>





