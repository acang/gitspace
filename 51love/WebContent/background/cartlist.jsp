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
    Admininfo adminLeft = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
	int flag = 2;
	if(adminLeft.getFlag() != null)
	   flag = adminLeft.getFlag().intValue();
   
   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("01"))
   {
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from cart where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }
   }

   List plist = ProductMng.getProductList();


   String orderid = SysCommonFunc.getStrParameter(request,"orderid");
   String sqhy    = SysCommonFunc.getStrParameter(request,"sqhy");
   String product = SysCommonFunc.getStrParameter(request,"product");
   String zsname  = SysCommonFunc.getStrParameter(request,"zsname");
   String tel     = SysCommonFunc.getStrParameter(request,"tel");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String trans     = SysCommonFunc.getStrParameter(request,"trans");
   String upgrade   = SysCommonFunc.getStrParameter(request,"upgrade");
   String paymode  = SysCommonFunc.getStrParameter(request,"paymode");
    System.out.println(">>>>>"+paymode);
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);




   int pagesize = 20;

   ///�õ��û��б�
   String sql = "from Cart as o  where 1=1 ";
   if(orderid.length() > 0)
     sql = sql + " and o.ordid = '"+orderid + "'";
   if(sqhy.length() > 0)
     sql = sql + " and o.username = '"+sqhy+"'";
   if(product.length() > 0)
     sql = sql + " and o.name = '"+product + "'";
   if(zsname.length() > 0)
     sql = sql + " and o.zsname='"+zsname+"'";
   if(tel.length() >0)
     sql =sql + " and o.tel = '"+tel+"'";
   if(trans.length() > 0)
     sql = sql + " and o.trans = "+trans;
   if(upgrade.length() > 0)
     sql = sql + " and o.upgrade = "+ upgrade;
    if(paymode.length() > 0)
        sql = sql + " and o.payMode = "+ paymode;
   
    Date cdate = new Date(System.currentTimeMillis());
    String dates = DateTools.dateToString(cdate,false);

    if(starttime.length() ==0){
     cdate.setYear(cdate.getYear()-2);
     starttime=DateTools.dateToString(cdate,false);
    }
    if(endtime.length() ==0)
     endtime = dates;

   if(starttime.length() > 0)
     sql = sql + " and o.sjtime >= to_date('"+starttime + "','YYYY-MM-DD')";
   if(endtime.length() > 0)
     sql = sql + " and o.sjtime <= to_date('"+endtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";




   sql = sql + " order by o.id desc";
    System.out.println(sql);
   QueryResult qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
%>
 <html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51love��������</title>
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
		 alert("����ȷ��дת��ҳ����");
                return;
   }
   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}

function valite(){
   var flag=<%=flag%>;
   /*if (flag==6){
	   var nowDate=new Date();
	   nowDate.setYear(nowDate.getYear() - 2);
	   var startDate=document.getElementById("starttime").value;
	   var dateArr = startDate.split("-");
	   var startDateCom=new Date(dateArr[0],dateArr[1]-1,parseInt(dateArr[2])+1);
	   if (startDateCom<nowDate){
	      alert("����Ȩ�޲��㣬���ܲ�ѯ2��ǰ�Ķ�����");
	   	  return false;
	   }else{
	   	  return true;
	   }
   }else{
   	   return true;
   }*/
   var nowDate=new Date();
   nowDate.setYear(nowDate.getYear() - 2);
   var startDate=document.getElementById("starttime").value;
   var dateArr = startDate.split("-");
   var startDateCom=new Date(dateArr[0],dateArr[1]-1,parseInt(dateArr[2])+1);
   if (startDateCom<nowDate){
      document.getElementById("starttime").value=nowDate.format('yyyy-MM-dd');
   }
   return true;
}

Date.prototype.format = function(format)
{
 var o = {
 "M+" : this.getMonth()+1, //month
 "d+" : this.getDate(),    //day
 "h+" : this.getHours(),   //hour
 "m+" : this.getMinutes(), //minute
 "s+" : this.getSeconds(), //second
 "q+" : Math.floor((this.getMonth()+3)/3),  //quarter
 "S" : this.getMilliseconds() //millisecond
 }
 if(/(y+)/.test(format)) format=format.replace(RegExp.$1,
 (this.getFullYear()+"").substr(4 - RegExp.$1.length));
 for(var k in o)if(new RegExp("("+ k +")").test(format))
 format = format.replace(RegExp.$1,
 RegExp.$1.length==1 ? o[k] :
 ("00"+ o[k]).substr((""+ o[k]).length));
 return format;
}
</script>
<link rel="stylesheet" type="text/css" media="all" href="../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../commonlib/calendar/calendar-setup.js"></script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">�����鿴</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="cartlist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="10" align="left" class="tdc"><strong>��������</strong>
                                  <input name="orderid" type="text" id="orderid" value="<%=orderid%>">
                                  <strong>�û���</strong>
                                  <input name="sqhy" type="text" id="sqhy" value="<%=sqhy%>">
                                  <strong>������Ŀ</strong>
                                  <select name="product" id="product">
                                    <option value="">����</option>
                                    <%
       for(int i=0;i < plist.size();i ++)
       {
          Product temp = (Product)plist.get(i);
          String se = "";
          if(product.equals(temp.getName().toString()))
           se = "selected";
       %>
                                    <option value="<%=temp.getName()%>" <%=se%>><%=temp.getName()%></option>
                                    <%
       }
       %>
                                </select>
                                    <strong>֧����ʽ</strong>
                                    <select name="paymode" id="paymode">
                                        <option value="">����</option>
                                        <option value="1">����֧��</option>
                                        <option value="2">΢��</option>
                                        <option value="3">֧����</option>
                                        <option value="4">���л��</option>
                                        <option value="5">�ֻ�վ֧����</option>
                                        <option value="6">΢��վ΢��֧��</option>
                                    </select>
                                </td>
                              </tr>
                              <tr >
                                <td height="25" colspan="10" align="left" class="tdc"><strong>����������</strong>
<input name="zsname" size="20" value="<%=zsname%>">
<strong>�����˵绰</strong>
<input name="tel" id="tel" value="<%=tel%>" size="20">
<strong>֧�����</strong>
<select name="trans">
  <option value="">����</option>
  <option value="1" <%if(trans.equals("1")) out.print("selected");%>>�ɹ�</option>
  <option value="0" <%if(trans.equals("0")) out.print("selected");%>>���ɹ�</option>
</select>
                                    <strong>�������</strong>
<select name="upgrade">
  <option value="">����</option>
  <option value="1" <%if(upgrade.equals("1")) out.print("selected");%>>�ɹ�</option>
  <option value="0" <%if(upgrade.equals("0")) out.print("selected");%>>���ɹ�</option>
</select></td>
                              </tr>
                              <tr >
                                <td height="25" colspan="10" align="left" class="tdc"><strong>����ʱ��</strong> ��
                                  <input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
                                  <img src="../commonlib/calendar/img.gif" width="20" height="14" id="startt">
                                  <script type="text/javascript">
    Calendar.setup({
        inputField     :    "starttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "startt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
                                    </script>
                                  ��
                                  <input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
                                  <img src="../commonlib/calendar/img.gif" width="20" height="14" id="endt">
                                  <script type="text/javascript">
    Calendar.setup({
        inputField     :    "endtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
                                </script>
                                <input name="Submit" type="submit" class="button1" value="��ѯ" onclick="return valite()"></td>
                              </tr>

                              <tr >
                                <td width="2%" align="center" class="tdc">&nbsp;</td>
                                <td width="7%" align="center" class="tdc"><strong>������</strong></td>
                                <td width="10%" align="center" class="tdc"><strong>�����û���</strong></td>
                                <td width="7%" align="center" class="tdc"><strong>�ǳ�</strong></td>
                                <td width="8%" align="center" class="tdc"><strong>������Ŀ</strong></td>
                                <td width="7%" align="center" class="tdc"><strong>ʱ��</strong></td>
                                  <td width="7%" align="center" class="tdc"><strong>֧����ʽ</strong></td>
                                <td width="6%" height="25" align="center" class="tdc"><strong>֧�����</strong></td>
                                <td width="6%" height="25" align="center" class="tdc"><strong>�������</strong></td>
                              </tr>
                              <%
for(int i =0;i < qr.resultList.size();i ++)
{
   Cart cart = (Cart)qr.resultList.get(i);
   //String datetype = cart.getDatetype().intValue() ==1 ? "��":"��";

   Userinfo uinfo= HYRegMng.getAllUserinfoByUsername(cart.getUsername());



   String productinfo = cart.getName();
   String transtemp = null;
   if(cart.getTrans() != null && cart.getTrans().intValue() ==1)
     transtemp = "�ɹ�";
   else
     transtemp = "���ɹ�";
   String upgradetemp = null;
   if(cart.getUpgrade() != null && cart.getUpgrade().intValue() ==1)
     upgradetemp = "�ɹ�";
   else
     upgradetemp = "���ɹ�";

    String paymodetemp = "";
    if(cart.getPayMode() != null && cart.getPayMode().intValue() ==1)
        paymodetemp = "����";
    if(cart.getPayMode() != null && cart.getPayMode().intValue() ==2)
        paymodetemp = "΢��";
    if(cart.getPayMode() != null && cart.getPayMode().intValue() ==3)
        paymodetemp = "֧����";
    if(cart.getPayMode() != null && cart.getPayMode().intValue() ==4)
        paymodetemp = "���л��";
	if(cart.getPayMode() != null && cart.getPayMode().intValue() ==5)
        paymodetemp = "�ֻ�վ֧����";
    if(cart.getPayMode() != null && cart.getPayMode().intValue() ==6)
        paymodetemp = "΢��վ΢��֧��";
%>
                              <tr>
                                <td align="center"><input name="delid" type="checkbox" id="delid" value="<%=cart.getId()%>"></td>
                                <td align="center"><a href="javascript:MM_openBrWindow('cartview.jsp?id=<%=cart.getId()%>','dd','width=518,height=520,scrollbars=yes')"><%=cart.getOrdid()%></a></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=uinfo == null ? "":uinfo.getHyid().toString()%>&isdel=<%=uinfo == null ? "":uinfo.getIsdel()+""%>" target="_blank"><%=cart.getUsername()%></a></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=uinfo == null ? "":uinfo.getHyid().toString()%>&isdel=<%=uinfo == null ? "":uinfo.getIsdel()+""%>" target="_blank"><%=cart.getLcname()%></a></td>
                                <td align="center"><%=productinfo%></td>
                                <td align="center"><%=DateTools.dateToString(cart.getSjtime(),true)%></td>
                                  <td height="25" align="center"><%=paymodetemp%></td>
                                <td height="25" align="center"><%=transtemp%></td>
                                <td height="25" align="center"><%=upgradetemp%></td>
                              </tr>
                              <%
}
%>

                              <tr>
                                <td height="25" colspan="10" align="center"><input name="ɾ��" type="button" id="ɾ��" value="ɾ��" class="button1"onClick="test();"></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center"><%
if(cpage == 1)
  out.println("<font class='info_link'>��    ҳ&nbsp;&nbsp;��һҳ&nbsp;&nbsp; </font> ");
else
{
  out.println("<a href='javascript:turn(1)' class='info_link'>��    ҳ</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("<font class='info_link'>��һҳ&nbsp;&nbsp;βҳ&nbsp;&nbsp;  </font> ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>βҳ</a>&nbsp;&nbsp;");
}
%>
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>��&nbsp; <font color='000064'> ת����
<input type='text' name='turnpage' size=5 maxlength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">
ҳ</font>&nbsp;&nbsp;
<input name="button" type='button' class=button style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19' onClick=turn(document.go2to.turnpage.value) value='ȷ ��'></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
                </table>
 </form>



</body>
</html>
<script>
function test()
{
  if(!confirm('ȷ�ϲ�����')) return false;
  document.go2to.bizaction.value="01";
  document.go2to.submit();
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.name.value))
{
alert('������������ƣ�');
document.form1.name.focus();
return false;
}
if (isNaN(document.form1.transamt.value))
{
alert('����������');
document.form1.transamt.focus();
return false;
}
if (isNaN(document.form1.serviceyear.value))
{
alert('������������ޣ�');
document.form1.serviceyear.focus();
return false;
}
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</script>
