<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
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
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
if (loginUser!=null){
	String vurl="";
   	vurl=request.getRequestURL().toString();
    if (request.getQueryString()!=null){
   	   vurl+="?"+request.getQueryString();
    }
    UserVisitMng.insertUserVisit(loginUser.getHyid(),vurl);
}
 %>
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
</head>
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>���м�֧����֧��</h2>
    </div>
       <div class="TabBox" style="position:relative">
       		<%--<div style="width:180px; height:180px; position:absolute; top:200px; right:50px;"><img src="skin/zfbsk.png" width="180" height="180" /></div>--%>
           <table width="880px" border="0" cellspacing="0" cellpadding="0" class="Tabc" style=" margin:auto;margin-top:8px;">
          <tr>
            <td style="width:300px; text-align:right;vertical-align:top"><img src="skin/icbc.gif" width="226" height="54" /></td>
            <td style="vertical-align:top">
            	<strong>�տ����У�</strong>�й�ũҵ�����Ͼ���֧��Ӫҵ��<br/>
                <strong>�����ţ�</strong>6228480394121426016<br/>
                <strong>�ա�����</strong>����ǿ 
            </td>
          </tr>
          <tr>
            <td style="width:300px; text-align:right;;vertical-align:top"><img src="skin/icbc.gif" width="226" height="54" /></td>
            <td style=" height:80px;vertical-align:top">
            	<strong>�տλ��</strong>�Ͼ��������缼�����޹�˾<br/>
                <strong>�տ����У�</strong>�й�ũҵ�����Ͼ���֧��<br/>
                <strong>�ˡ��ţ�</strong>10120001040209689 
            </td>
          </tr>
          <%--<tr>--%>
            <%--<td style="width:300px; text-align:right; vertical-align:top"><img src="skin/zfb.jpg" width="226" height="54" /></td>--%>
            <%--<td style="height:110px;vertical-align:top">--%>
            	<%--<strong>֧�����տ��˺ţ�</strong>service@51lover.org<br/>--%>
				<%--��ɨ���Ҳ�֧�����տ��ά��֧��--%>
            <%--</td>--%>
          <%--</tr>--%>
        </table>
        <div style="height:30px; line-height:30px; width:868px; margin:auto; padding-left:10px; font-size:14px; font-weight:bold; background-color:#dbdbdb; border:#CCC 1px solid; border-top:0; border-bottom:0;">�����֪��</div>
        <table width="880px" border="0" cellspacing="0" cellpadding="0" class="Tabf" style="margin:auto; margin-bottom:8px;">
          <tr>
            <td style="padding-left:70px;">
            	һ�����ɹ�������<a href="/kfzx.htm" target="_blank" style="color: blue">��ϵ����</a>���Ը����ǣ��������Կ��������ע���������ݣ� <br/>
                ����1�������û���&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>���磺</strong>&nbsp;<span style="color:#156cb1	">�����û�����zk00</span><br/>
                ����2�����ʱ��&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">���ʱ�䣺2012��8��8��15ʱ36��</span><br/>
                ����3�������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">����998Ԫ��498Ԫ��598Ԫ��298Ԫ</span><br/>
                ����4��������Ŀ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">������Ŀ���׽�VIP��Ա�����ڡ�һ���ڻ�VIP��Ա�����ڡ�һ����</span><br/>
                ����5������������������&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">�������㣺�й����������Ϻ��ֶ�֧��</span><br/>
                ����6���տ��˻�&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">�տ��˻�������ǿ�˻�/��˾�˻�</span><br/>
                ����7��֧����ʽ&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="color:#156cb1">֧����ʽ��ATM��ת��/��̨���/�����Կ�֧��</span><br/>


               ���� ����ǿ�˻�֧��ATM�������й�̨������7*24Сʱ֧����<br/>
                ������˾�˻���֧��ATM��֧�����������й�̨������֧������������7*24Сʱ֧����<br/>
                �������ʱ���ڽ�������ע����Ҫ�������û�����<br/>
               �������ǽ����յ����Ժ�1����������������˿�ͨ��
            </td>
          </tr>
        </table>
    </div>
  </div>
  <div class="block02t">
        <div class="lm_name">
          <h2>ɨ���ά��</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
      <div style="clear:both"></div>
    </div>
  
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
<!-- Google Code for ��Ӫ������ -->
<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1057143543;
var google_conversion_label = "u6RhCK2u6wMQ9_WK-AM";
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1057143543/?value=0&amp;label=u6RhCK2u6wMQ9_WK-AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
</body>
</html>
