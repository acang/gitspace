<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>

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
function Settransamt()
{
	var pro=document.form1.product.value;
	var transamt=pro.substring(pro.indexOf("@")+1);
	document.form1.transamt.value=transamt;
}
function ChkInput(){
if (document.form1.username.value=="" )
{
alert('�����������û���');
document.form1.username.focus();
return false;
}
if (document.form1.product.value=="")
{
alert('��ѡ�������Ŀ');
document.form1.product.focus();
return false;
}

var sname =document.form1.simplename.value;

if (sname != "" && sname != "(û�пɲ���)" && (!isNumber(sname) || parseInt(sname) > 9999))
{
alert("��������۹��ʱ�Ų���ȷ");
document.form1.simplename.focus();
return false;
}

if(sname =="(û�пɲ���)" )
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
    String bjd1 = SysCommonFunc.getStrParameter(request,"bjd1");
    if(loginUser == null)
    {
        response.sendRedirect("login.jsp");
        return;
    }
    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(),vurl);
    }
    List plist = ProductMng.getProductList();
%>

<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51������������֧��ϵͳ</h2>
    </div>
    <form action="payBill.jsp" name="form1" method="post" onSubmit="return ChkInput()">
       <div class="TabBox">
       
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;��Ҫ�̻�&nbsp;&nbsp;<span style="color:#F60">������</span>
               
               <span style="float:right; line-height:50px; font-size:16px">����֧�����裺1��������д&nbsp;>&nbsp;2�����ɶ���&nbsp;>&nbsp;3��֧������</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>������д</strong></div>
           <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab" style="margin-top:20px;">
          <tr>
            <td width="270" align="right"><strong>�����û�����</strong></td>
            <td>
              <input name="username" type="text" id="username"  value="<%=loginUser.getUsername()%>"/>
            </td>
          </tr>
          <tr>
            <td align="right"><strong>�������ࣺ</strong></td>
            <td>
               <select name="product" onchange="Settransamt()" style="height:25px;" >
                   <option value="">��ѡ�������Ŀ</option>
                    <%
           				String amount = "";
					       for(int i=0;i< plist.size();i ++)
					       {
					          Product temp = (Product)plist.get(i);
					
					          if(temp.getServiceyear().toString().equals(bjd1))
					          {
					              amount = temp.getTransamt().toString();
					          }
					          if (temp.getId()!=201){
			       %>
                   <option value="<%=temp.getId()+"@"+temp.getTransamt()%>" <%=temp.getServiceyear().toString().equals(bjd1) ? "selected":""%>><%=temp.getName()+"--"+temp.getTransamt()+"Ԫ"%></option>
                   <%
       				}}
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
            <td align="right"><strong>�����ʼ���</strong></td>
            <td>
                <input type="text" name="email" value="" style="width:455px;" />
            </td>
          </tr>
          <tr>
            <td align="right"><strong>סַ��</strong></td>
            <td>
                <input type="text" name="address" value="" style="width:455px;" />
            </td>
          </tr>
          <tr>
            <td align="right"><strong>�ر�˵����</strong></td>
            <td >
            �����������Ϻ���������֧���������޹�˾��Ϊ��ȡ��֧��������ͬ������Ϊ�׽�VIP��Ա��
            </td>
          </tr>
        </table>
        <div class="MyBtn">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input name="Submit2" type="submit" value="��һ�� " class="btn" />
        </div>
    </div>
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
</html>
