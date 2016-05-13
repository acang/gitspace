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
<%@ page import="org.apache.commons.beanutils.*"%>
<%@page import="java.text.DecimalFormat"%>
<%
Date cdate = new Date(System.currentTimeMillis());
String dates = DateTools.dateToString(cdate,false);
List list = HbmOperator.list("from Vipuserrecord as o where o.czsj >= to_date('"+dates + "','YYYY-MM-DD') order by id desc");
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
<table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr>
      <td height="25" colspan="12" align="center" class="tdc"><strong>今日收费信息</strong></td>
    </tr>
    <tr>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>序号</strong></td>
      <td width="0" align="center" class="tdc"><strong>办理时间</strong></td>

      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>办理人</strong></td>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>申请用户名</strong></td>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>昵称</strong></td>
      <td width="0" height="25" align="center" class="tdc" nowrap="nowrap"><strong>原有效日期</strong></td>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>升级地区</strong></td>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>服务项目</strong></td>
      <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>申请费用</strong></td>
      <td width="0" height="25" align="center" class="tdc" nowrap="nowrap"><strong>到期日期</strong></td>
        <td width="0" align="center" class="tdc"><strong>来源类别</strong></td>
      <td width="0" height="25" align="center" class="tdc" nowrap="nowrap"><strong>订单号/留言时间</strong></td>
	  <%--<td width="0" align="center" class="tdc" nowrap="nowrap"><strong>推荐客服</strong></td>--%>
    </tr>
<%
int record = 0;
double money = 0;
DecimalFormat f=new DecimalFormat("0.00");
for(int i =0;i < list.size();i ++)
{
	Vipuserrecord vur = (Vipuserrecord)list.get(i);
	//String sqlt="select ordid from cart where trans =1 and upgrade = 1 and username='"+vur.getSqhy()+"' order by id desc";
	
	 String sqlt="select ordid,sjtime from cart where trans =1 and upgrade = 1 and username='"+vur.getSqhy()
	    		+"' and name ='"+vur.getName()+ "' order by id desc";
	
	List listt=QueryRecord.query(sqlt);
	DynaBean dbt=null;
	if(listt!=null&&listt.size()>0)
	{
		dbt=(DynaBean)listt.get(0);
	}
   
   record = record + 1;
   money =money+ vur.getTransamt() ;
   //String datetype = vur.getDatetype().intValue() ==1 ? "年":"月";
   String productinfo = vur.getName();
   
   	
	
	String sqll="select l.lyid,k.n_date from lycart l left join kfzx k on l.lyid = k.id where l.hyid = "+vur.getHyid()+" and l.updatetime = to_date('"+DateTools.dateToString(vur.getCzsj(),true)+"','YY-MM-DD HH24:mi:ss')";
	List listl=QueryRecord.query(sqll);
	DynaBean dbl=null;
	String lyt="";
	String lyi="";
	if(listl.size()>0)
	{
		dbl=(DynaBean)listl.get(0);
		lyt=DateTools.dateToString((Date)dbl.get("n_date"),true);
		lyi=String.valueOf(dbl.get("lyid"));
	}
	
	String sqlo="select lcname,vip from userinfo where hyid = "+vur.getHyid();
	List listo=QueryRecord.query(sqlo);
	DynaBean dbo=null;
	String lccname="";
    String vip = "";
    String adv = "";
	if(listo.size()>0)
	{
		dbo=(DynaBean)listo.get(0);
		lccname=String.valueOf(dbo.get("lcname"));
        vip=String.valueOf(dbo.get("vip"));

        if(vip.equals("1"))
            adv = "GOOGLE";
        else if(vip.equals("2"))
            adv = "BAIDU2";
        else if(vip.equals("3"))
            adv = "BAIDU3";
        else if(vip.equals("17"))
            adv = "360搜索";
	}
%>
    <tr>
      <td align="center"><%=i+1%></td>
      <td align="center"><%=DateTools.dateToString(vur.getCzsj(),true)%></td>

      <td align="center"><%=vur.getCzry()%></td>
      <td align="center"><a href="edithyinfo.jsp?id=<%=vur.getHyid()%>&isdel=0" target="_blank"><%=vur.getSqhy()%></a></td>
      <td width="0" align="center"><a href="edithyinfo.jsp?id=<%=vur.getHyid()%>&isdel=0" target="_blank"><%=lccname%></a></td>
      <td height="25" align="center"><%=DateTools.dateToString(vur.getYyxq(),false)%></td>
      <td align="center"><%=vur.getArea()%></td>
      <td align="center"><%=productinfo%></td>
      <td align="center"><%=f.format(vur.getTransamt())%></td>
      <td height="25" align="center"><%=DateTools.dateToString(vur.getZzsj(),false)%></td>
        <td align="center"><%=adv%></td>
      <td height="25" align="center">
          <a href ="<%=(vur.getCzry().equals("银联")||vur.getCzry().equals("支付宝"))?"lydisplay.jsp?bizaction=0&ordid="+dbt.get("ordid"):"channel/viewkfzx.jsp?id="+lyi%>" target="_blank">
              <%=(vur.getCzry().equals("银联")||vur.getCzry().equals("支付宝"))?dbt.get("ordid"):lyt%>
          </a></td>
	  <%--<td align="center"><%=vur.getSimplename()== null ? "":vur.getSimplename()%></td>--%>
    </tr>
<%
}
%>
 
    <tr>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">合计</td>
      <td align="center"><%=record%>笔</td>
      <td align="center"><%=f.format(money)%>元</td>
      <td height="25" align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
    </tr>
   <tr>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
    </tr>   <tr>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
      <td height="25" align="center">&nbsp;</td>
    </tr>
</table>
</body>
</html>
