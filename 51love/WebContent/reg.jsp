<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>

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
    <script language="JavaScript">
        function tag_byteLen(str) {
            var len = 0;

            for (var i = 0; i < str.length; i++) {
                var code = str.charCodeAt(i);
                if (code > 255) {
                    len += 2;
                }
                else {
                    len += 1;
                }
            }

            return len;
        }

        function test()
        {

            if (checkspace(document.personal.username.value)){
                alert('����д�����û���!');
                document.personal.username.focus();
                return false;
            }
             var name = getBLen(document.personal.username.value)
            if(name<8 || name>16)
            {
                alert("�û�����8-16���ַ����!");
                document.personal.username.focus();
                return false;
            }
            if (checkspace(document.personal.password.value)){
                alert('����������!');
                document.personal.password.focus();
                return false;
            }
            if(document.personal.password.value.length<8)
            {
                alert("������8λ�����ַ����!");
                document.personal.password.focus();
                return false;
            }
            if (checkspace(document.personal.repassword.value)){
                alert('����������ȷ��!');
                document.personal.repassword.focus();
                return false;
            }
            if( document.personal.repassword.value.length<8)
            {

                alert("����ȷ����8λ�����ַ����!");
                return false;
            }

            if (document.personal.password.value!=document.personal.repassword.value)
            {
                alert('��������������벻һ�£�����������!');
                document.personal.repassword.focus();
                return false;
            }

            if (document.personal.password.value==document.personal.username.value)
            {
                alert('���벻�����û�����ͬ��');
                document.personal.password.focus();
                return false;
            }
                if(!document.getElementById("isagree").checked){
                    alert('����ϸ�Ķ���վ���������ͬ�⣡');
                    return false;
                }
            return true;
        }

        function test1()
        {
           if(document.personal.password.value.length<8)
            {
                alert("������8λ�����ַ����!");
                document.personal.password.focus();
            }
        }


        function checkspace(checkstr) {
            var str = '';
            for(i = 0; i < checkstr.length; i++) {
                str = str + ' ';
            }
            return (str == checkstr);
        }
        function Check(){
            document.cform.username.value=document.personal.username.value;
            document.cform.submit();

        }
        getBLen = function(str) {
		  if (str == null) return 0;
		  if (typeof str != "string"){
		    str += "";
		  }
		  return str.replace(/[^x00-xff]/g,"01").length;
		}
    </script>
</head>
<body class="reg">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  <div class="lm_name">
    <h2>��ʵע�ᣬ�ҵ����ĵ����ѣ�</h2>
  </div>
  <div class="step_box"><span class="current">1���û�������������</span><span>2�����ƻ������ϼ���ϵ��ʽ</span><span>3���ύ���</span></div>
  <div style="clear:both"></div>
    <form name="personal" method="post" action="afterregnewuser.jsp" onSubmit="return test()" target="cname">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
    <tr>
       <td colspan="2" align="center" bgcolor="#D6E6F3" class="bk04" style="color:red;">
       <div class="lm_name" style="text-align:center;font-size:17px;height:30px;"><strong>�뱾����ʵ��д�������ֵ绰��ͨ���ͷ���˺󼤻����ߡ��粻Ը����ˣ�����ע�ᣬ�����˷�����ʱ�䣡 </strong> </div>
       </td>
     </tr>
    <tr>
      <td width="200" align="right"><strong>�û�����</strong></td>
      <td width="400"><input name="username"  id="username" type="text"  class="txt01" value="" /></td>
      <td>���û�����8-16���ַ���������ɣ�</td>
    </tr>
    <tr>
      <td align="right"><strong>�������룺</strong></td>
      <td><input name="password" id="password" type="password" class="txt01" value="" /></td>
      <td>��������8λ�ַ���������ɣ�</td>
    </tr>
    <tr>
      <td align="right"><strong>ȷ�����룺</strong></td>
      <td><input name="repassword" type="password"  id="repassword" class="txt01" onfocus="javascript:test1()" /></td>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2" style=" font-family:'΢���ź�'; font-size:16px"><input id="isagree" type="checkbox" value="" checked="checked"  />������վ<a href="veiwwt.jsp?id=1773449" target="_blank" style="color:#ff3300;font-size:16px">��˽����</a>��<a href="veiwwt.jsp?id=1773450" target="_blank" style="color:#ff3300;font-size:16px">������֪</a>���ݣ���ͬ����վ<a href="veiwwt.jsp?id=1773448" target="_blank" style="color:#ff3300;font-size:16px ">��������</a>���ݡ�</td>
    </tr>
    <tr>
      <td align="right">&nbsp;</td>
      <td colspan="2"><input name="" type="submit" value="���ע�ᣬ��������֮��" class="btn"/></td>
    </tr>
  </table>
  </form>
  <div style="clear:both"></div>
  <div class="erweima_box">
      <div class="lm_name02">
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
  </div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
