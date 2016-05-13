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

  String bjd1 = SysCommonFunc.getStrParameter(request,"bjd1");
  if(loginUser == null)
  {
    response.sendRedirect("login.jsp");
    return;
  }
  List plist = ProductMng.getProductList();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心网上支付系统</title>
<link href="style.css" rel="stylesheet" type="text/css" />
<script language="JavaScript">
function Settransamt()
{
var pro=document.form1.product.value;
document.form1.transamt.value=pro.substring(pro.indexOf("@")+1);
}

function ChkInput(){
if (document.form1.username.value=="" )
{
alert('请输入升级用户名');
document.form1.username.focus();
return false;
}
if (document.form1.product.value=="")
{
alert('请选择服务项目');
document.form1.product.focus();
return false;
}

var sname =document.form1.simplename.value;

if (sname != "" && sname != "(没有可不填)" && (!isNumber(sname) || parseInt(sname) > 9999))
{
alert("输入的销售顾问编号不正确");
document.form1.simplename.focus();
return false;
}

if(sname =="(没有可不填)" )
{
    document.form1.simplename.value="";
}
return true;

}

function isNumber(str) {
	for(var i=0;i<str.length;i++)
	if(str.charCodeAt(i)<0x0030 || str.charCodeAt(i)>0x0039) return false;
	return true;
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
            <td><a href="http://www.chinapay.com/" target="_blank" class=""><img src="../images/cart/cuplogo.gif" width="152" height="40" border="0" /></a></td>
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


		<form action="cart2.jsp" name="form1" method="post" onSubmit="return ChkInput()">

        <table width="84%" border="0" align="center" cellpadding="0" cellspacing="0" style="margin:20px 0px 40px 0px;">
          <tr>
            <td align="center"><img src="../images/cart/002.gif" width="358" height="77" /></td>
          </tr>
          <tr>
            <td class="bk03"><table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td height="30" align="center" valign="bottom" class="tit04">订单填写</td>
              </tr>
              <tr>
                <td align="center" background="../images/cart/005.gif"><img src="../images/cart/005.gif" width="344" height="3" /></td>
              </tr>
              <tr>
                <td style="padding:20px 0px;"><table width="100%" border="0" align="center" cellpadding="4" cellspacing="0">
                  <tr>
                    <td width="16%" align="right">升级用户名：</td>
                    <td width="27%"><input name="username" type="text" id="username"  style="width:124px;" value="<%=loginUser.getUsername()%>" size="14" readonly="readonly"/></td>
                    <td width="17%" align="right">升级服务种类：</td>
                    <td width="40%"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tr>
                        <td width="90%">
         <select name="product" onchange="Settransamt()" class="input2">
   <option value="">请选择服务项目</option>
       <%
           String amount = "";
       for(int i=0;i< plist.size();i ++)
       {
          Product temp = (Product)plist.get(i);

          if(temp.getServiceyear().toString().equals(bjd1))
          {
              amount = temp.getTransamt().toString();
          }

       %>
       <option value="<%=temp.getId()+"@"+temp.getTransamt()%>" <%=temp.getServiceyear().toString().equals(bjd1) ? "selected":""%>><%=temp.getName()%></option>
       <%
       }
       %>
                  </select>
                      <input name="transamt" size="5" readonly value="<%=amount%>"></td>
                        <td width="10%">元</td>
                      </tr>
                    </table></td>
                  </tr>
                  <tr>
                    <td align="right">销售顾问编号：</td>
                    <td colspan="3"><input name="simplename" type="text" id="simplename" value="(没有可不填)" /></td>
                  </tr>
                  <tr>
                    <td align="right">付款人姓名：</td>
                    <td ><input name="zsname" type="text" size="14"  style="width:124px;"/></td>
					  <td align="right">联系电话：</td>
                    <td><input name="tel" type="text" size="14"  style="width:160px;"/></td>
                  </tr>
                  <tr>
                    <td align="right">电子邮件：</td>
                    <td colspan="3"><input name="email" type="text" size="14"  style="width:300px;"/></td>
                    </tr>
                  <tr>
                    <td align="right">住址：</td>
                    <td colspan="3"><input name="address" type="text" size="14"  style="width:300px;"/></td>
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
                <td>&nbsp;</td>
              </tr>
              <tr>
                <td align="center"><input  name="Submit2"  type="image" src="../images/btn_next.gif" width="94" height="28" border="0" /></td>
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




