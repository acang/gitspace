<%@ page contentType="text/html; charset=gbk" %>
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
        alert('����д��¼�ʺţ�');
        document.all("eaccount").focus();
        return false;

    }
    if (document.all("epassword").value == "") {
        alert('����д��¼���룡');
        document.all("epassword").focus();
        return false;

    }
    if (document.all("epassword2").value == "") {
        alert('����дȷ�����룡');
        document.all("epassword2").focus();
        return false;

    }
    if (trim(document.all("name").value) == "") {
        alert('����д������');
        document.all("name").focus();
        return false;

    }
    if (trim(document.all("aliasname").value) == "") {
        alert('����д������');
        document.all("aliasname").focus();
        return false;

    }

    if (document.all("epassword").value != document.all("epassword2").value) {
        alert('��¼������ȷ�����������ͬ�����������룡');
        document.all("epassword").focus();
        return false;

    }

    if (position == -1) {
        alert('��ѡ��ְ��');
        return false;

    }

    if (isadmin == -1) {
        alert('��ѡ���Ƿ񳬼�����Ա��');
        return false;

    }
    if (sort == -1) {
        alert('��ѡ������');
        return false;

    }
    addForm.submit();


  }
</script>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
</head>
<%
   String deptid = request.getParameter("deptid") == null ?
                           "" : request.getParameter("deptid");
   //����ID
%>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">������Ա</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<iframe name="addFrm" style="display:none;"></iframe>
<form action="add_user_do.jsp" method="post" name="addForm" target="addFrm">
<input type="hidden" name="deptid" value="<%=deptid%>">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">
       <input type="hidden" name="deptid" value="0">
       <input type="hidden" name="pdeptid" value="0">
        <tr valign="middle">
          <td width="107" height="32" align="left"><strong>��¼�ʺ�<span class="style1">*</span></strong></td>
          <td width="393" height="32"><input name="eaccount" type="text" class="input3" id="eaccount" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>��¼����<span class="style1">*</span></strong></td>
          <td height="27"><input name="epassword" type="password" class="input3" id="epassword" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>ȷ������<span class="style1">*</span></strong></td>
          <td height="27"><input name="epassword2" type="password" class="input3" id="epassword2" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>�ա�����<span class="style1">*</span></strong></td>
          <td height="27"><input name="name" type="text" class="input3" id="name" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>�𡡡���<span class="style1">*</span></strong></td>
          <td height="27"><input name="aliasname" type="text" class="input3" id="aliasname" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>ְ������<span class="style1">*</span></strong></td>
          <td height="27"><select name="position" size="1" id="position">
            <option value="-1" selected>--��ѡ��--</option>
<%

   List list = DicMap.getDicList(SysParaDefine.PUBLIC_ZW);
   for (int i = 0; list != null && i < list.size(); i++) {
        Dic dictionary = (Dic) list.get(i);


%>
           <option value="<%=dictionary.getDicnumber().toString()%>"><%=dictionary.getContent()%></option>

<%
   }
%>
          </select></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>��ͥ��ַ</strong></td>
          <td height="27"><input name="address" type="text" class="input3" id="address" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>��ϵ�绰</strong></td>
          <td height="27"><input name="phone" type="text" class="input3" id="phone" value=""></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>�Ƿ񳬼�����Ա<span class="style1">*</span></strong></td>
          <td height="27"><select name="isadmin" size="1" id="isadmin">
            <option value="-1" selected>--��ѡ��--</option>
            <option value="<%=SysParaDefine.IS_SUPER_ADMIN%>">��</option>
            <option value="<%=SysParaDefine.IS_NOT_SUPER_ADMIN%>">��</option>
          </select></td>
        </tr>
        <tr valign="middle">
          <td width="107" height="27" align="left"><strong>�š�����<span class="style1">*</span></strong></td>
          <td height="27"><select name="sort" size="1">
            <option value="-1" selected>����</option>
            <option value="0">��ǰ</option>
          </select></td>
        </tr>

        <tr valign="middle">
          <td height="40" colspan="2" align="center"><input name="" type="button" class="button1"  value="ȷ����" onClick="return checkSubmit();">
            ��
              <input name="reset" type="reset" class="button1" value="�ء�д">
            ��
            <input name="close" type="button" class="button1" onClick="window.close();" value="�ء���"></td>
        </tr>
</table>
</form>
</body>
</html>




