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

   List plist = ProductMng.getProductList();
   List adminList = AdminMng.getAdminList();

   String product = SysCommonFunc.getStrParameter(request,"product");
   String czry    = SysCommonFunc.getStrParameter(request,"czry");
   String sqhy    = SysCommonFunc.getStrParameter(request,"sqhy");
   String isurl   = SysCommonFunc.getStrParameter(request,"isurl");
   String httpurl = SysCommonFunc.getStrParameter(request,"httpurl");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String advid     = SysCommonFunc.getStrParameter(request,"advid");
   String issimplename =  SysCommonFunc.getStrParameter(request,"issimplename");
   String simplename =  SysCommonFunc.getStrParameter(request,"simplename");
   String sffs       = SysCommonFunc.getStrParameter(request,"sffs");


   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 30;

   ///得到用户列表
//   String sql = "from Vipuserrecord as o  where 1=1 ";
//   String sql1 = "select sum(t.transamt) from vipuserrecord t where 1=1 ";
//select t.*,u.vip from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where vip = 1

   String sql = "select t.*,u.vip from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where 1 = 1";
   String sql1 = "select sum(t.transamt) from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where 1 = 1";

   if(product.length() > 0)
   {
     sql = sql + " and name = '"+product + "'";
     sql1 = sql1 + " and name = '"+product + "'";
   }
   if(czry.length() > 0)
   {
     sql = sql + " and czry = '"+czry+"'";
     sql1 = sql1 + " and czry = '"+czry+"'";
   }
   if(sqhy.length() > 0)
   {
     sql = sql + " and sqhy = '"+sqhy+"'";
     sql1 = sql1 + " and sqhy = '"+sqhy+"'";
   }

    if(isurl.equals("0"))
    {
      if(httpurl.length() > 0)
      {
       sql = sql + " and httpurl like '%"+httpurl + "%'";
       sql1 = sql1 + " and httpurl like '%"+httpurl + "%'";
      }
      else
      {
       sql = sql + " and httpurl is not null";
       sql1 = sql1 + " and httpurl is not null";
      }
    }
    else if(isurl.equals("1"))
    {
      sql = sql + " and httpurl is null";
      sql1 = sql1 + " and o.httpurl is null";
    }



   if(issimplename.equals("0"))
   {
     if(simplename.length() > 0)
     {
      sql = sql + " and simplename = '"+simplename + "'";
      sql1 = sql1 + " and simplename = '"+simplename + "'";
     }
     else
     {
      sql = sql + " and simplename is not null";
      sql1 = sql1 + " and simplename is not null";
     }
   }
   else if(issimplename.equals("1"))
   {
     sql = sql + " and simplename is null";
     sql1 = sql1 + " and o.simplename is null";
   }

    Date cdate = new Date(System.currentTimeMillis());
    String dates = DateTools.dateToString(cdate,false);

   if(starttime.length() ==0)
     starttime = dates;
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   if(!(adminLoginInfo.getAdminname().equals("huangjs") || adminLoginInfo.getAdminname().equals("mahe00")))
   {
       Date temp = DateTools.stringToDate("2011-08-01");
       Date temp2 = DateTools.stringToDate(starttime);
       if(temp2.before(temp))
       {
           starttime = "2011-08-01";
       }
   }

   if(starttime.length() > 0)
   {
     sql = sql + " and czsj >= to_date('"+starttime + "','YYYY-MM-DD')";
     sql1 = sql1 + " and czsj >= to_date('"+starttime + "','YYYY-MM-DD')";
   }




   if(endtime.length() == 0 )
   {

       endtime = dates;
   }

   if(endtime.length() > 0)
   {
     sql = sql + " and czsj <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
     sql1 = sql1 + " and czsj <= to_date('"+endtime+" 23:59:59"+ "','YYYY-MM-DD HH24:MI:SS')";
   }

   if(advid.trim().length() > 0 && !advid.trim().equals("0"))
   {
       sql = sql + " and vip="+advid;
       sql1 = sql1 + " and vip="+advid;
   }

   if(sffs.equals("1"))
   {
       sql = sql + " and transamt > 0";
       sql1 = sql1 + " and transamt > 0";
   }

    if(sffs.equals("0"))
    {
        sql = sql + " and transamt = 0";
        sql1 = sql1 + " and transamt = 0";
    }


   double allmoney = SysCommonFunc.getDoubleForSql(sql1);


   sql = sql + " order by id desc,czry asc";

   QueryResult qr = QueryRecord.queryByDynaResultSet(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
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

function ChkInput(){


var sname =document.go2to.simplename.value;

if (sname != "" && (!isNumber(sname) || parseInt(sname) > 9999))
{
alert("输入的推荐客服编号不正确");
document.go2to.simplename.focus();
return false;
}


return true;

}

function isNumber(str) {
	for(var i=0;i<str.length;i++)
	if(str.charCodeAt(i)<0x0030 || str.charCodeAt(i)>0x0039) return false;
	return true;
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
        <td align="center">收费查询</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchviprecordlist.jsp"  onSubmit="return ChkInput()">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="12" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>服务项目</strong></td>
                                      <td width="25%" height="22" align="left"><select name="product" id="product">
                                        <option value="">不限</option>
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
                                      </select></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>办理人</strong></td>
                                      <td width="46%" height="22" align="left"><select name="czry" id="czry">
                                        <option value="">不限</option>
                                        <%
       for(int i=0;i < adminList.size();i ++)
       {
          Admininfo temp = (Admininfo)adminList.get(i);
          String se = "";
          if(czry.equals(temp.getAdminname()))
           se = "selected";
       %>
                                        <option value="<%=temp.getAdminname()%>" <%=se%>><%=temp.getAdminname()%></option>
                                        <%
       }
       %>
                                      </select>
                                        <strong>推荐客服</strong>                                        
                                        <select name="issimplename" id="issimplename">
                                          <option value="">不限</option>
                                          <option value="0" <%if(issimplename.equals("0")) out.print("selected");%>>有</option>
                                          <option value="1" <%if(issimplename.equals("1")) out.print("selected");%>>没有</option>
                                        </select>
                                      <input name="simplename" type="text" id="simplename" value="<%=simplename%>"></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>用户名</strong></td>
                                      <td height="22" align="left"><input name="sqhy" type="text" id="sqhy" value="<%=sqhy%>"></td>
                                      <td height="22" align="center" class="tdc"><strong>会员来源</strong></td>
                                      <td height="22" align="left"><select name="isurl" id="isurl">
                                          <option value="">不限</option>
                                          <option value="0" <%if(isurl.equals("0")) out.print("selected");%>>有</option>
                                          <option value="1" <%if(isurl.equals("1")) out.print("selected");%>>没有</option>
                                        </select>
                                          <input name="httpurl" type="text" id="httpurl" value="<%=httpurl%>"></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>起始时间</strong></td>
                                      <td height="22" align="left"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                        </script></td>
                                      <td height="22" align="center" class="tdc"><strong>终止时间</strong></td>
                                      <td height="22" align="left"><input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
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
                                        </script></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>来源类别</strong></td>
                                      <td height="22" align="left">
                                          <select name="advid" id="advid">
                                            <option value="0">不限</option>
                                            <option value="1" <%if(advid.equals("1")) out.print("selected");%>>GOOGLE</option>
                                            <option value="2" <%if(advid.equals("2")) out.print("selected");%>>BAIDU2</option>
                                            <option value="3" <%if(advid.equals("3")) out.print("selected");%>>BAIDU3</option>
                                          </select></td>
                                      <td height="22" align="center" class="tdc"><strong>费用</strong></td>
                                      <td height="22" align="left"><select name="sffs" id="sffs">
                                        <option value="" <%=sffs.equals("") ? "selected":""%>>全部</option>
                                        <option value="1" <%=sffs.equals("1") ? "selected":""%>>收费</option>
                                        <option value="0" <%=sffs.equals("0") ? "selected":""%>>免费</option>
                                                                              </select>
                                      <input name="Submit" type="submit" class="button1" value="查询"></td>
                                    </tr>


                                  </table>                                </td>
                              </tr>

                              <tr >
                                <td width="0" align="center" nowrap="nowrap" class="tdc"><strong>序号</strong></td>
                                <td width="0" align="center" class="tdc"><strong>办理时间</strong></td>
                                <td width="0" align="center" nowrap="nowrap" class="tdc"><strong>办理人</strong></td>
                                <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>申请用户</strong></td>
                                <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>昵称</strong></td>
                                <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>升级地区</strong></td>
                                <td width="0" height="25" align="center" class="tdc"><strong>服务项目</strong></td>
                                <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>申请费用</strong></td>
                                <td width="0" height="25" align="center" class="tdc" nowrap="nowrap"><strong>原有效日期</strong></td>
                                <td width="0" height="25" align="center" class="tdc" nowrap="nowrap" witdh="180px"><strong>到期日期</strong></td>
                                <td width="0" align="center" class="tdc" nowrap="nowrap"><strong>来源类别</strong></td>
                                
                                <td width="0" height="25" align="center" class="tdc" nowrap="nowrap"><strong>订单号/留言时间</strong></td>
                              </tr>
                              <%
int record = 0;
double money = 0;
DecimalFormat f=new DecimalFormat("0.00");
for(int i =0;i < qr.resultList.size();i ++)
{
   DynaBean db = (DynaBean)qr.resultList.get(i);
   Vipuserrecord vur = new Vipuserrecord();
   vur.setTransamt(new Double(db.get("transamt").toString()));
   vur.setDatetype(new Integer(db.get("datetype").toString()));
   vur.setName((String)db.get("name"));
   vur.setHttpurl((String)db.get("httpurl"));
   vur.setCzsj((Date)db.get("czsj"));
   vur.setCzry((String)db.get("czry"));
   vur.setSqhy((String)db.get("sqhy"));
   vur.setYyxq((Date)db.get("yyxq"));
   vur.setZzsj((Date)db.get("zzsj"));
   vur.setHyid(Long.parseLong(db.get("hyid").toString()));
   vur.setSimplename((String)db.get("simplename"));
   vur.setArea((String)db.get("area"));

   record = record + 1;
   money =money+ vur.getTransamt().doubleValue() ;
   String datetype = vur.getDatetype().intValue() ==1 ? "年":"月";
   String productinfo = vur.getName();
   String httpurlv = "";
   if(vur.getHttpurl() != null)
   {
      httpurlv = vur.getHttpurl().startsWith("http://") ? vur.getHttpurl().substring(7):vur.getHttpurl();
      int length = httpurlv.indexOf("/");
      if(length > 0)
        httpurlv = httpurlv.substring(0,length);
      if(httpurlv.length() > 14)
        httpurlv=httpurlv.substring(0,14);
   }
   String adv = "";
   if(db.get("vip") != null  && db.get("vip").toString().equals("1"))
     adv = "GOOGLE";
   else if(db.get("vip") != null  && db.get("vip").toString().equals("2"))
     adv = "BAIDU2";
   else if(db.get("vip") != null  && db.get("vip").toString().equals("3"))
     adv = "BAIDU3";
   else if(db.get("vip") != null  && db.get("vip").toString().equals("17"))
       adv = "360搜索";
    //String sqlt="select ordid,sjtime from cart where trans =1 and upgrade = 1 and username='"+db.get("sqhy")+"' order by id desc";
    
    String sqlt="select ordid,sjtime from cart where trans =1 and upgrade = 1 and username='"+db.get("sqhy")
    		+"' and name ="+vur.getName()+ "' order by id desc";
	List listt=QueryRecord.query(sqlt);
	DynaBean dbt=null;
	String ord="";
	if(listt.size()>0)
	{
        long current = 0;
        long czsjtime = vur.getCzsj().getTime();
        for(int j =0;j < listt.size();j ++)
        {
		   dbt=(DynaBean)listt.get(j);
           long carttime = ((Date)dbt.get("sjtime")).getTime();
           if((czsjtime-carttime)<(30*60*1000))
		     ord=String.valueOf(dbt.get("ordid"));
        }
	}
	
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
	
	String sqlo="select lcname from userinfo where hyid = "+db.get("hyid").toString();
	List listo=QueryRecord.query(sqlo);
	DynaBean dbo=null;
	String lccname="";
	if(listo.size()>0)
	{
		dbo=(DynaBean)listo.get(0);
		lccname=String.valueOf(dbo.get("lcname"));
	}
%>

                              <tr>
                                <td width="0" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td width="0" align="center"><%=DateTools.dateToString(vur.getCzsj(),true)%></td>
                                <td width="0" align="center"><%=vur.getCzry()%></td>
                                <td width="0" align="center"><a href="edithyinfo.jsp?id=<%=vur.getHyid()%>&isdel=0" target="_blank"><%=vur.getSqhy()%></a></td>
                                <td width="0" align="center"><a href="edithyinfo.jsp?id=<%=vur.getHyid()%>&isdel=0" target="_blank"><%=lccname%></a></td>
                                <td width="0" height="25" align="center"><%=vur.getArea()%></td>
                                <td width="0" height="25" align="center"><%=productinfo%></td>
                                <td width="0" align="center"><%=f.format(vur.getTransamt())%></td>
                                <td width="0" height="25" align="center"><%=DateTools.dateToString(vur.getYyxq(),false)%></td>
                                <td width="0" height="25" align="center"><%=DateTools.dateToString(vur.getZzsj(),false)%></td>
                                <td width="0" align="center"><%=adv%></td>
                                
                                <td height="0" align="center">

                                    <a href ="<%=(vur.getCzry().equals("银联") || vur.getCzry().equals("支付宝"))?"lydisplay.jsp?bizaction=0&ordid="+ord:"channel/viewkfzx.jsp?id="+lyi%>" target="_blank">
                                        <%=(vur.getCzry().equals("银联")||vur.getCzry().equals("支付宝"))?ord:lyt%></a></td>
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
                                <td align="center">本页合计</td>
                                <td height="25" align="center"><%=record%>笔</td>
                                <td align="center"><%=f.format(money)%>元 </td>
                                <td height="25" align="center">总计</td>
                                <td height="25" align="center"><%=f.format(allmoney)%>元</td>
                                <td align="center">&nbsp;</td>
                                <td align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center"><%
if(cpage == 1)
  out.println("<font class='info_link'>首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; </font> ");
else
{
  out.println("<a href='javascript:turn(1)' class='info_link'>首    页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>上一页</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("<font class='info_link'>下一页&nbsp;&nbsp;尾页&nbsp;&nbsp;  </font> ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>下一页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>尾页</a>&nbsp;&nbsp;");
}
%>
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="13" align="center">&nbsp;</td>
                              </tr>
                </table>
 </form>
</body>
</html>
<script>
function test(op)
{
  if(!confirm('确认操作吗？')) return false;
  document.go2to.bizaction.value=op;
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.name.value))
{
alert('请输入服务名称！');
document.form1.name.focus();
return false;
}
if (isNaN(document.form1.transamt.value))
{
alert('请输入服务金额！');
document.form1.transamt.focus();
return false;
}
if (isNaN(document.form1.serviceyear.value))
{
alert('请输入服务年限！');
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
