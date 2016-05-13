<%@ page contentType="text/html; charset=GBK" %>
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
  if(loginUser == null)
  {
    response.sendRedirect("login.jsp");
    return;
  }
  String MerId = CartMng.MerId;

  String product = SysCommonFunc.getStrParameter(request,"product");
  int index = product.indexOf("@");
  product = product.substring(0,index);
  String zsname  = SysCommonFunc.getStrParameter(request,"zsname");
  String tel     = SysCommonFunc.getStrParameter(request,"tel");
  String email   = SysCommonFunc.getStrParameter(request,"email");
  String address = SysCommonFunc.getStrParameter(request,"address");
  String simplename =   SysCommonFunc.getStrParameter(request,"simplename");
  String OrdId = CartMng.getOrderId();
  Product p = ProductMng.getProduct(product);
  String TransAmt = CartMng.getTransAmt(p);
  Date cdate = new Date(System.currentTimeMillis());
  String TransDate = DateTools.DateToString(cdate,DateTools.FORMART_yyyyMMdd);
  String ChkValue  = CartMng.getCheckValue(MerId,OrdId,TransAmt,CartMng.CuryId,TransDate,CartMng.TransType);

  Cart cart = new Cart();
  cart.setAddress(address);
  cart.setDatetype(p.getDatetype());
  cart.setEmail(email);
  cart.setFlag(p.getFlag());
  cart.setLcname(loginUser.getLcname());
  cart.setName(p.getName());
  cart.setOrdid(OrdId);
  cart.setServiceyear(p.getServiceyear());
  cart.setSimplename(simplename);
  cart.setSjtime(cdate);
  cart.setSqdj(p.getSqdj());
  cart.setTel(tel);
  cart.setTrans(new Integer(0));
  cart.setTransamt(p.getTransamt());
  cart.setUpgrade(new Integer(0));
  cart.setUsername(loginUser.getUsername());
  cart.setZsname(zsname);
  CartMng.addCart(cart);


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心网上支付系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function ChkInput(){
document.form1.submit();
}
</script>
<script type="text/JavaScript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>
</head>

<body>
<table width="801" border="0" align="center" cellpadding="0" cellspacing="0" background="../images/cart/bg.gif">
  <tr>
    <td>&nbsp;</td>
    <td width="760"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><a href="http://www.chinapay.com/" target="_blank"><img src="../images/cart/cuplogo.gif" width="152" height="40" border="0" /></a></td>
            <td width="400"><img src="../images/cart/001.gif" width="392" height="40" /></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><img src="../images/cart/nav.gif" width="760" height="19" /></td>
      </tr>
      <tr>
        <td><img src="../images/cart/shadow.jpg" width="286" height="16" /></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
          <tr>
            <td class="tit02"><table width="84%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td bgcolor="#F1F1F1" class="bk02"><a href="http://www.chinapay.com/newportal/cooperate/merchant.jsp" target="_blank">中国银联重要客户 <img src="../images/cart/5xing.gif" width="41" height="8"  border="0"/></a></td>
              </tr>
            </table></td>
          </tr>
        </table>


		<form action="http://payment.chinapay.com:8081/pay/TransGet" name="form1" method="post">


        <table width="84%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:20px 0px 40px 0px;">
          <tr>
            <td align="center"><img src="../images/cart/002.gif" width="358" height="77" /></td>
          </tr>
          <tr>
            <td class="bk03"><table width="94%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" align="center" valign="bottom" class="tit04">生成订单</td>
              </tr>
              <tr>
                <td align="center" background="../images/cart/005.gif"><img src="../images/cart/005.gif" width="344" height="3" /></td>
              </tr>
              <tr>
                <td style="padding:20px 0px;"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="1" bgcolor="#CCCCCC">
                  <tr>
                    <td width="20%" align="right" bgcolor="#FFFFFF"><strong>您生成的订单号：</strong></td>
                    <td width="36%" bgcolor="#FFFFFF"><%=OrdId%></td>
                    <td width="18%" align="right" bgcolor="#FFFFFF"><strong>申请时间：</strong></td>
                    <td width="26%" bgcolor="#FFFFFF"><%=DateTools.dateToString(cdate,false)%></td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF"><strong>您的升级用户名：</strong></td>
                    <td bgcolor="#FFFFFF"><%=loginUser.getUsername()%></td>
                    <td align="right" bgcolor="#FFFFFF"><strong>升级服务种类：</strong></td>
                    <td bgcolor="#FFFFFF"><%=p.getName()%>(<%=p.getTransamt()%>元)</td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF"><strong>您的姓名：</strong></td>
                    <td bgcolor="#FFFFFF"><%=zsname%></td>
                    <td align="right" bgcolor="#FFFFFF"><strong>销售顾问编号：</strong></td>
                    <td bgcolor="#FFFFFF"><%=simplename%></td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF"><strong>联系电话：</strong></td>
                    <td colspan="3" bgcolor="#FFFFFF"><%=tel%></td>
                  </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF"><strong>电子邮件：</strong></td>
                    <td colspan="3" bgcolor="#FFFFFF"><%=email%> </td>
                    </tr>
                  <tr>
                    <td align="right" bgcolor="#FFFFFF"><strong>住址：</strong></td>
                    <td colspan="3" bgcolor="#FFFFFF"> <%=address%></td>
                    </tr>
                </table></td>
              </tr>
              <tr>
                <td><strong>特别说明：</strong>升级款项由上海银联电子支付服务有限公司代为收取，支付后在线同步升级为白金VIP会员。</td>
              </tr>
              <tr>
                <td background="../images/cart/005.gif"><img src="../images/cart/005.gif" width="344" height="3" /></td>
              </tr>
              <tr>
                <td> <input type="hidden" name="MerId" value="<%=MerId%>">
          <input name="OrdId" type="hidden" value="<%=OrdId%>">
          <input type="hidden" name="TransAmt" value="<%=TransAmt%>">
          <input type="hidden" name="CuryId" value="<%=CartMng.CuryId%>">
          <input type="hidden" name="TransDate" value="<%=TransDate%>">
          <input type="hidden" name="TransType" value="<%=CartMng.TransType%>">
          <input type="hidden" name="Version" value="<%=CartMng.Version%>">
          <input type="hidden" name="BgRetUrl" value="<%=CartMng.BgRetUrl%>">
          <input type="hidden" name="PageRetUrl" value="<%=CartMng.PageRetUrl%>">
          <input type="hidden" name="ChkValue" value="<%=ChkValue%>"></td>
              </tr>
              <tr>
                <td align="center"><a href="cart1.jsp"><img src="../images/btn_ct.gif" width="94" height="28" border="0" /></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="image" name="Submit2" src="../images/btn_qd.gif" width="94" height="28" border="0" /></td>
              </tr>
            </table></td>
          </tr>
        </table>
		</form>
		</td>
      </tr>
    </table></td>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="bk01"><%@ include file="../footer2.jsp"%></td>
  </tr>
</table>
</body>
</html>




