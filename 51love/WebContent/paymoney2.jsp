<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51��������--�й���������ཻ����վ����Ա�鲼��������,�㶫����,�Ϻ�����,���ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���1000������н��ѻ�Ա��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
<link href="css/css.css" rel="stylesheet" type="text/css" />

<script language="JavaScript">
    //ѡ���Ʒ�����ɼ۸�
function Settransamt()
{
    var proobj= document.payform.product;
	var pro = proobj.options[proobj.options.selectedIndex].text;
	var transamt=pro.substring(pro.indexOf("-")+2);
	document.payform.transamt.value=transamt;
}


</script>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_hyzf">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ����ȵ�¼��ע�ᣡ');showLogin('hyzf.htm','paymemory.jsp');</script>");
        return;
    }
    List plist = ProductMng.getProductList();
    String bjd1 = SysCommonFunc.getStrParameter(request, "bjd1");



%>

<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51������������֧��ϵͳ</h2>
    </div>
    <form action="pay_do.jsp" id="payform" name="payform" method="post" target="_blank">
       <div class="TabBox">
       
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;��Ҫ�̻�&nbsp;&nbsp;<span style="color:#F60">������</span>
               
               <span style="float:right; line-height:50px; font-size:16px">����֧�����裺1��������д&nbsp;>&nbsp;2��ȷ��֧��&nbsp;>&nbsp;3����ɹ���</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>������д</strong></div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab" style="margin-top:20px;">
          <tr>
            <td width="270" align="right"><strong>�����û�����</strong></td>
            <td>
              <input name="username" type="text" id="username" readonly="readonly"  value="<%=loginUser.getUsername()%>"/>
            </td>
          </tr>
          <tr>
            <td align="right"><strong>�������ࣺ</strong></td>
            <td>
               <select name="product" onchange="Settransamt()" style="height:25px;" >
                   <option value="">��ѡ�������Ŀ</option>
                   <%
                       String amount = "";
                       for (int i = 0; i < plist.size(); i++) {
                           Product temp = (Product) plist.get(i);
                           if (temp.getId() != 201) {
                   %>
                   <option value="<%=temp.getId()%>"><%=temp.getName() + "--" + temp.getTransamt() + "Ԫ"%>
                   </option>
                   <%
                           }
                       }
                   %>
              </select>
              <input name="transamt" size="5" readonly value="<%=amount%>"/>Ԫ
            </td>
          </tr>
          <tr>
            <td align="right"><strong>������������</strong></td>
            <td>
                <input type="text" name="zsname" value="" />
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <strong>��ϵ�绰��</strong>
                <input type="text" value="" name="tel" />
            </td>
          </tr>
               <tr>
                   <td align="right"><strong>֧����ʽ��</strong></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="1" style="vertical-align:middle;">����֧����ֱ��������
                   </td>
               </tr>
               <tr>
                   <td  valign="middle" align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="2" style="vertical-align:middle;"><img src="images/wechart.jpg" style="vertical-align:middle;">��ֱ��������
                   </td>
               </tr>
               <tr class='tr_even'>
                   <td align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="3" style="vertical-align:middle;"><img src="images/alipay.jpg" style="vertical-align:middle;">��ֱ��������

                   </td>
               </tr>
               <tr>
                   <td align="right"></td>
                   <td valign="middle" height="50">
                       <input type="radio" name="paymode" value="4" style="vertical-align:middle;">���л�����������
                   </td>
               </tr>
        </table>
        <div class="MyBtn">
            <table width="100%" border="0" cellspacing="0" cellpadding="0" >

                <tr>
                    <td width="50%" height="100px">&nbsp;</td>
                    <td  width="50%" align="center" bgcolor="#FFFFFF" class="tit08"><img src="images/buynow.png" onClick="goPay()"></td>
                </tr>

            </table>
        </div>
    </div>
        <input type="hidden" id="paymodetype" name="paymodetype" value="">
    </form>
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
</body>

<script language="javascript">
    function goPay(){
        if (document.payform.product.value=="")
        {
            alert('��ѡ�������Ŀ');
            document.payform.product.focus();
            return false;
        }
        var paymodes = document.getElementsByName("paymode");
        var mode="0";
        if(paymodes[0].checked ==true ){
            mode="1";

        }
        if(paymodes[1].checked ==true ){
            mode="2";
        }
        if(paymodes[2].checked ==true ){
            mode="3";
        }
        if(paymodes[3].checked ==true ){
            mode="4";
        }
        if(mode == "0"){
          alert("��ѡ��һ��֧����ʽ!");
            return;
        }
        document.getElementById("paymodetype").value = mode;
        document.getElementById("payform").submit();
    }
</script>
</html>
