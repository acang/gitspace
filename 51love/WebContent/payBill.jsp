<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@page import="java.text.DecimalFormat"%>
<%@ page import="java.util.Date" %>

<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  if(loginUser == null)
  {
    response.sendRedirect("login.jsp");
    return;
  }

  String product = SysCommonFunc.getStrParameter(request,"product");
  int index = product.indexOf("@");
  product = product.substring(0,index);
  Product p = ProductMng.getProduct(product);
  
  //add by gaojianghong 20120816 for �ж�VIP��Ա�����׽�VIP��Աʱ��VIP��Աʱ��ҪС���������׽�VIP��Աʱ�䡣�׽�VIPû�е��ڲ�������VIP��Ա start
  Date sdate = new Date(System.currentTimeMillis());
  if (loginUser.getFlag()==25 && loginUser.getZzsj().after(sdate)){
  	if (p!=null && p.getFlag()==30){
  		//�ж������׽�VIP��Ա�����껹���� 1:�� 0���� 2:��
  		if (p.getDatetype()==1){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue()*12);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('��ѡ�������VIPʣ�����޵İ׽�VIP��Ա��Ŀ');history.go(-1);}</script>");
  				return;
  			}
  		}else if (p.getDatetype()==0){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue());
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('��ѡ�������VIPʣ�����޵İ׽�VIP��Ա��Ŀ');history.go(-1);}</script>");
  				return;
  			}
  		}else{
  			sdate.setDate(sdate.getDate()+p.getServiceyear().intValue()*7);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('��ѡ�������VIPʣ�����޵İ׽�VIP��Ա��Ŀ');history.go(-1);}</script>");
  				return;
  			}
  		}
  	}
  }
  else if (loginUser.getFlag()==30 && loginUser.getZzsj().after(sdate)){
  	if (p!=null && p.getFlag()==25){
  		out.println("<script language='javascript'>{window.alert('���İ׽�VIP��Ա��δ�����ޣ����ܽ���ΪVIP��Ա����ѡ��׽�VIP��Ա��Ŀ');history.go(-1);}</script>");
  		return;
  	}
  }
  //add by gaojianghong 20120816 for �ж�VIP��Ա�����׽�VIP��Աʱ��VIP��Աʱ��ҪС���������׽�VIP��Աʱ�� �׽�VIPû�е��ڲ�������VIP��Ա end
  
  //�жϰ����ȫ�������׽���Ŀ���޴��ڵ���VIPʣ��ʱ��
  //modified by gaojianhong 20130113 for ��ʱ�������ۿ�ȡ��  start
  //String area  = SysCommonFunc.getStrParameter(request,"area");
  String area  = "ȫ��";
  //modified by gaojianhong 20130113 for ��ʱ�������ۿ�ȡ��  end
  if (loginUser.getArea()!=null && !loginUser.getArea().equals("ȫ��") && area.equals("ȫ��") && loginUser.getFlag()==30 && loginUser.getZzsj()!=null && loginUser.getZzsj().after(sdate)){
  	if (p!=null){
  		//�ж�����ȫ�����������껹���� 1:�� 0����
  		if (p.getDatetype()==1){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue()*12);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('������ȫ�������׽�VIP����Ҫ������ʣ��ĵ����׽�VIP���ޣ�');history.go(-1);}</script>");
  				return;
  			}
  		}else if (p.getDatetype()==0){
  			sdate.setMonth(sdate.getMonth()+p.getServiceyear().intValue());
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('������ȫ�������׽�VIP����Ҫ������ʣ��ĵ����׽�VIP���ޣ�');history.go(-1);}</script>");
  				return;
  			}
  		}else{
  			sdate.setDate(sdate.getDate()+p.getServiceyear().intValue()*7);
  			sdate.setDate(sdate.getDate()+1);
  			if (sdate.before(loginUser.getZzsj())){
  				out.println("<script language='javascript'>{window.alert('������ȫ�������׽�VIP����Ҫ������ʣ��ĵ����׽�VIP���ޣ�');history.go(-1);}</script>");
  				return;
  			}
  		}
  	}
  }
  //�ж���ǰ��ȫ�������ָ����ض������Ļ�Ա����δ���ڵ�
  sdate.setDate(sdate.getDate()+10);
  if (loginUser.getArea()!=null && loginUser.getArea().equals("ȫ��") && !area.equals("ȫ��") && loginUser.getFlag()==30 && loginUser.getZzsj()!=null && loginUser.getZzsj().after(sdate)){
  	out.println("<script language='javascript'>{window.alert('���İ׽�VIP��ȫ����������δ�����ޣ����ܽ���Ϊĳ���ض���������ѡ��ȫ��������쵽���ޣ�10���ڣ��ٽ��н���Ϊĳ���ض�������');history.go(-1);}</script>");
  	return;
  }
  
  String MerId = CartMng.MerId;

  String zsname  = SysCommonFunc.getStrParameter(request,"zsname");
  String tel     = SysCommonFunc.getStrParameter(request,"tel");
  String email   = SysCommonFunc.getStrParameter(request,"email");
  String address = SysCommonFunc.getStrParameter(request,"address");
  String simplename =   SysCommonFunc.getStrParameter(request,"simplename");
  String OrdId = CartMng.getOrderId();
  //String TransAmt = CartMng.getTransAmt(p);
  double transamt=0;
  if (area.equals("ȫ��")){
  	transamt=new Double(p.getTransamt());
  }else{
  	transamt=p.getTransamt()*SysDefine.ybdqzk;
  	for(int i=0;i<SysDefine.tsdqArray.length;i++){
   		if (SysDefine.tsdqArray[i].equals(area)){
   			transamt=p.getTransamt()*SysDefine.tsdqzk;
   		}
   	}
  }
  DecimalFormat f=new DecimalFormat("0.00");
  String TransAmt =CartMng.getTransAmt(f.format(transamt));
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
  cart.setTransamt(transamt);
  cart.setUpgrade(new Integer(0));
  cart.setUsername(loginUser.getUsername());
  cart.setZsname(zsname);
  cart.setArea(area);
  CartMng.addCart(cart);
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
<!-- #include file="marquee.asp" -->
<!-- #include file="sbox.asp" -->
<div class="wrapper1250 cm_block01">
  
  <div class="block02">
      <div class="lm_name02">
      <h2>51������������֧��ϵͳ</h2>
    </div>
    <form action="https://payment.chinapay.com/pay/TransGet " name="form1" method="post">
       <div class="TabBox">
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Tab">
         <tr>
            <td style="padding:20px;">
               <img src="skin/cuplogo.gif" width="152" height="40" />&nbsp;&nbsp;��Ҫ�̻�&nbsp;&nbsp;<span style="color:#F60">������</span>
               
               <span style="float:right; line-height:50px; font-size:16px">����֧�����裺1��������д&nbsp;>&nbsp;2�����ɶ���&nbsp;>&nbsp;3��֧������</span>
            </td>
          </tr>
          </table>
          <div style="height:40px; line-height:30px;border-bottom:#6fa9ce 2px solid; text-align:center;font-size:24px; margin:0 50px;"><strong>���ɶ���</strong></div>
           <table width="800px" border="0" cellspacing="0" cellpadding="0" class="Tabs" style=" margin:auto;margin-top:20px;">
          <tr>
            <td width="130" align="right"><strong>�����ɵĶ����ţ�</strong></td>
            <td><%=OrdId%></td>
            <td width="90" align="right"><strong>����ʱ�䣺</strong></td>
            <td><%=DateTools.dateToString(cdate,false)%></td>
          </tr>
          <tr>
            <td align="right"><strong>�����û�����</strong></td>
            <td colspan="3"><%=loginUser.getUsername()%></td>
          </tr>
          <tr>
            <td align="right"><strong>�������ࣺ</strong></td>
            <td colspan="3"><%=p.getName()%>(<%=transamt%>Ԫ)</td>
          </tr>
          <tr>
            <td align="right"><strong>������������</strong></td>
            <td><%=zsname%></td>
            <td align="right"><strong>��ϵ�绰��</strong></td>
            <td><%=tel%></td>
          </tr>
          <tr>
            <td align="right"><strong>�����ʼ���</strong></td>
            <td colspan="3"><%=email%></td>
          </tr>
          <tr>
            <td align="right"><strong>סַ��</strong></td>
            <td colspan="3"><%=address%></td>
          </tr>
        </table>
        <div style="height:30px; line-height:30px; text-align:center; font-size:14px">
        	<strong>�ر�˵����</strong>�����������Ϻ���������֧���������޹�˾��Ϊ��ȡ��֧��������ͬ������Ϊ�׽�VIP��Ա��
        </div>
        <table>
         <tr>
                <td>
          <input type="hidden" name="MerId" value="<%=MerId%>">
          <input name="OrdId" type="hidden" value="<%=OrdId%>">
          <input type="hidden" name="TransAmt" value="<%=TransAmt%>">
          <input type="hidden" name="CuryId" value="<%=CartMng.CuryId%>">
          <input type="hidden" name="TransDate" value="<%=TransDate%>">
          <input type="hidden" name="TransType" value="<%=CartMng.TransType%>">
          <input type="hidden" name="Version" value="<%=CartMng.Version%>">
          <input type="hidden" name="BgRetUrl" value="<%=CartMng.BgRetUrl%>">
          <input type="hidden" name="PageRetUrl" value="<%=CartMng.PageRetUrl%>">
          <input type="hidden" name="ChkValue" value="<%=ChkValue%>">

                </td>
              </tr>
        </table>
        <div class="MyBtn">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="  ��  ��  " onclick="javascript:window.location.href='paymemory.jsp'" class="btn" />&nbsp;&nbsp;
            <input type="submit"  name="Submit2" value="  ȷ  ��  " class="btn" />
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
