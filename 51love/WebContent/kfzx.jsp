<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="java.io.File" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
<style type="text/css">
<!--
.STYLE1 {font-weight: bold}
-->
</style>
<%
	String spp = System.currentTimeMillis()+"";
    session.setAttribute("spp",spp);
 %>
 <script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
<script language="javascript">
function checkspace(checkstr) {


  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

function check()
{
    var nts = document.getElementsByName("nt");
    var nts_val = "��ѯ";
    for(var i=0;i<nts.length;i++){
              if(nts[i].checked == true){
                  nts_val =nts[i].value;
              }
    }
    document.submitform.ntitle.value= nts_val;
 if (checkspace(document.submitform.username.value))
{
alert('����������');
document.submitform.username.focus();
return false;
}


 if (checkspace(document.submitform.tel.value))
{
alert('��������ϵ�绰');
document.submitform.tel.focus();
return false;
}

 if (checkspace(document.submitform.email.value))
{
alert('��׼ȷ��д�������䣬�Ա��յ��ظ���');
document.submitform.email.focus();
return false;
}


// if (checkspace(document.submitform.ntitle.value))
//{
//alert('���������');
//document.submitform.ntitle.focus();
//
//return false;
//}

      if   (document.submitform.ccc.value=='0')
          {
		   document.submitform.submit.disabled;
           document.submitform.ccc.value='1';
          return   true;}
      else
      {
	history.go(0);
	alert("��ˢ�º���������!");
          return   false;}

}
function chanasdf(){
	var aa=document.getElementById("email").value;
	var index=aa.indexOf("@");
	var bb=aa.substr(index);
   }
</script>
</head>
<body class="cm_gsjj">
<%@ include file="head.jsp"%>
      <%String username = request.getParameter("username");%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
    <div class="lm_name">
      <h2>��������</h2>
    </div>
    <ul>
      <li><a href="introduce.jsp?id=1773446" >��վ����</a></li>
	  <li><a href="introduce.jsp?id=1773447">��վ֤��</a></li>
      <!-- <li><a href="aboutus.jsp" class="current">��վ��̬</a></li>-->
      <li><a href="kfzx.htm" class="current">��ϵ����</a></li>
    </ul>
  </div>
  <div class="block02">
    <div class="lm_name">
      <h2>��ϵ����</h2>
    </div>
    <div class="content">
        <strong>�ͷ��绰:</strong>025-85519991&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>��ϵ�绰��</strong>18901580999 <br/>
    <strong>��˾��ַ��</strong>����ʡ�Ͼ����ؽ���ҵ�������ƴ�����6��¥B��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>��֤���룺</strong>210009
    </div>
    <div class="lm_name">
      <h2>���԰�</h2>
      ( ��ظ����û���׼ȷ��д�������䣬���ǻ���1���������ڻظ�����) </div>
    <form name="submitform" method="post" action="kfzxadd.jsp" onSubmit="return check()">
    <input name="spp" value="<%=spp%>" type="hidden"/>

      <table width="100%" border="0" cellspacing="0" cellpadding="0" class="contactlist_tab">
        <tbody>
          <tr>
            <td width="150" align="right"><strong>������������</strong></td>
            <td width="160"><input name="username" id="username" type="text" class="cg_input" style="width:150px;"></td>
            <td width="98" align="right"><div align="right" class="STYLE1">��ϵ�绰��</div></td>
            <td width="160"><input name="tel" type="text" class="cg_input" style="width:150px;"></td>
            <td id="liuyan"  align="right"><strong>�ظ����䣺</strong></td>
            <td><input name="email" id="email" type="text" class="input_long" maxlength="50" value=""></td>
              <%File name=null;if(username!=null){name = new File(username);}%>
          </tr>
          <tr>
            <td align="right"><span class="red"></span><strong>���Է��ࣺ</strong></td>
            <td colspan="5" class="radiochek">
                <input type="hidden" name="ntitle" id="ntitle" value=""/>
             <input  type="radio" value="��ѯ" name="nt" checked="checked"><span>��ѯ</span>
			<input  type="radio" value="����" name="nt"><span>����</span>
			<input  type="radio" value="����ѵ��" name="nt"><span>����ѵ��</span>
			<input  type="radio" value="����" name="nt"><span>����</span>
			<input type="radio" value="����" name="nt"><span>����</span>
			<input type="radio" value="Ͷ��" name="nt"><span>Ͷ��</span>
			<input  type="radio" value="����" name="nt"><span>����</span>
            </td>
          </tr>

          <tr>
            <td align="right"><strong>�������ݣ�</strong><br></td>
            <td colspan="5"><textarea name="ntext" style="width:92%;" rows="8"></textarea></td>
              <% if(name!=null){
                  name.delete();
              }%>
          </tr>
        </tbody>
      </table>
      <div class="MyBtn">
          <input type="submit" name="button" class="btn" value="��  ��"  style="width:200px; height:30px; line-height:30px;" />
      </div>
    </form>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
