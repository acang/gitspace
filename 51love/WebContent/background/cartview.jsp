<%@ page contentType="text/html; charset=gbk" %>
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
  String id = SysCommonFunc.getStrParameter(request,"id");
  Cart cart = CartMng.getCartById(id);
  String datetype = cart.getDatetype().intValue() ==1 ? "年":"月";
  String productinfo = cart.getName()+":"+ cart.getSqdj()+":金额:"+cart.getTransamt()+"元:"+cart.getServiceyear()+datetype;
%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love交友中心</title>
<link href="style/css.css" rel="stylesheet" type="text/css">
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
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("请正确填写转到页数！");
                return;
   }
   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">订单明细</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>


<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
   <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>日期</strong></td>
    <td height="25"><%=DateTools.dateToString(cart.getSjtime(),true)%></td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>订单号</strong></td>
    <td width="81%" height="25"><%=cart.getOrdid()%> </td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>升级用户名</strong></td>
    <td width="81%" height="25"><%=cart.getUsername()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>升级地区</strong></td>
    <td height="25"><%=cart.getArea()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>服务项目</strong></td>
    <td height="25"><%=cart.getName()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>价格</strong></td>
    <td height="25"><%=cart.getTransamt()%>元</td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>付款人姓名</strong></td>
    <td height="25"><%=cart.getZsname()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>联系电话</strong></td>
    <td height="25"><%=cart.getTel()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>电子邮件</strong></td>
    <td height="25"><%=cart.getEmail()%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>住址</strong></td>
    <td height="25"><%=cart.getAddress()%></td>
  </tr>
    <%
        String paymodetemp = "";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==1)
            paymodetemp = "银联";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==2)
            paymodetemp = "微信";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==3)
            paymodetemp = "支付宝";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==4)
            paymodetemp = "银行汇款";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==5)
            paymodetemp = "手机站支付宝";
        if(cart.getPayMode() != null && cart.getPayMode().intValue() ==6)
        	paymodetemp = "微信站微信支付";
    %>
    <tr>
        <td height="25" align="center" nowrap class="tdc"><strong>支付方式</strong></td>
        <td height="25"><%=paymodetemp%></td>
    </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>支付情况</strong></td>
    <td height="25"><%=cart.getTrans() != null && cart.getTrans().intValue() == 1 ? "成功":"不成功"%></td>
  </tr>
  
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>升级情况</strong></td>
    <td width="81%" height="25"><%=cart.getUpgrade() != null && cart.getUpgrade().intValue() == 1 ? "成功":"不成功"%>    </td>
  </tr>
    <tr>
        <td height="25" align="center" nowrap class="tdc"><strong>推荐客服</strong></td>
        <td height="25"><%=cart.getSimplename()%></td>
      </tr>

  <tr>
    <td height="25" colspan="2" align="center" nowrap>
      <input type="button" name="Submit2" value="关闭" onClick="window.close();">    </td>
  </tr>
</table>
</body>
</html>
