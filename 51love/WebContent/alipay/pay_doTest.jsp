<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.mng.ProductMng" %>
<%@ page import="com.lover.mng.CartMng" %>
<%@ page import="com.web.obj.Product" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="com.web.obj.Cart" %>

<%
    String paymodes  = "3";
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ����ȵ�¼��ע�ᣡ');showLogin('hyzf.htm','paymemory.jsp');</script>");
        return;
    }
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
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }


    String MerId = CartMng.MerId;
    String zsname  = "aaa";
    String tel     = "15850779848";
    String simplename =   "";
    String OrdId = CartMng.getOrderId();
    String product = "221";

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
    String area  = "ȫ��";
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
    String TransDate = DateTools.DateToString(cdate, DateTools.FORMART_yyyyMMdd);
    String ChkValue  = CartMng.getCheckValue(MerId,OrdId,TransAmt,CartMng.CuryId,TransDate,CartMng.TransType);
    Cart cart = new Cart();
    cart.setDatetype(p.getDatetype());
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
     if("1".equals(paymodes)){
         cart.setPayMode(new Integer(1));
     }
    if("2".equals(paymodes)){
        cart.setPayMode(new Integer(2));
    }
    if("3".equals(paymodes)){
        cart.setPayMode(new Integer(3));
    }
    if("4".equals(paymodes)){
        cart.setPayMode(new Integer(4));
    }
    CartMng.addCart(cart);
%>

<form id="netBank" action="https://payment.chinapay.com/pay/TransGet " name="form1" method="post">
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
</form>
<form id="weixin" action="weixin/native.jsp" name="form1" method="post">
</form>
<form id="alipay" name=alipayment action=alipay/alipayapi.jsp method=post target="_self">
    <input type="hidden" name="WIDout_trade_no" value="<%=OrdId%>"/>
    <input type="hidden" name="trade_no" value="<%=OrdId%>"/>
    <input type="hidden" name="WIDsubject" value="<%=p.getName()%>"/>
    <input type="hidden" name="WIDtotal_fee"  value="0.01"/>
    <input type="hidden" name="WIDbody" value="��Ϊ��Ա"/>
    <input type="hidden" name="WIDshow_url"  value="http://www.51lover.org/alipay/return_url.jsp"/>
</form>

<form id="huikuan" action="payLast.jsp" name="form1" method="post">
</form>

  <script type="text/javascript">
<%
    if("1".equals(paymodes)){
%>
   document.getElementById("netBank").submit();
<%
    }
%>

<%
   if("2".equals(paymodes)){
%>
document.getElementById("weixin").submit();
<%
    }
%><%
   if("3".equals(paymodes)){
%>
document.getElementById("alipay").submit();
<%
    }
%>


<%
   if("4".equals(paymodes)){
%>
document.getElementById("huikuan").submit();
<%
    }
%>


  </script>