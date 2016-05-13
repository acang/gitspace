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
    Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   String isdel = SysCommonFunc.getStrParameter(request,"isdel");
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0 && isdel.equals("1"))
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "update userinfo set isdel = 0,shr = '"+adminLoginInfo.getAdminname()+"' where hyid=" +delid[i];
       HbmOperator.executeSql(sqlarray);
   }

   String button = "删除";
   if(isdel.equals("1"))
     button = "还原";

%>

<%
   String sex = SysCommonFunc.getStrParameter(request,"sex");
   if(sex.length() ==0)
     sex = "0";
   String hyzk  = SysCommonFunc.getStrParameter(request,"hyzk");
   if(hyzk.length() ==0)
     hyzk = "0";
   String s1 = SysCommonFunc.getStrParameter(request,"s1");
   String s2 = SysCommonFunc.getStrParameter(request,"s2");

   String sg = SysCommonFunc.getStrParameter(request,"sg");
   if(sg.length() ==0)
     sg = "0";

   String whcd = SysCommonFunc.getStrParameter(request,"whcd");
   if(whcd.length() ==0)
     whcd = "0";
     
   String czry    = SysCommonFunc.getStrParameter(request,"czry");
   



   int agestart = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"agestart"),0);
   int ageend = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"ageend"),0);





   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);

   int pagesize = 20;




   String   sql = "from Userinfo as o where o.isdel = 1 and o.lcname not is null";


   if(s1.length() > 1)
     sql = sql + " and o.s1 ='"+s1+"'";
   if(s2.length() > 1)
     sql = sql + " and o.s2 ='"+s2+"'";
   if(sex.length() > 1)
      sql = sql + " and o.sex ='"+sex+"'";
   if(hyzk.length() > 1)
      sql = sql + " and o.hyzk = '"+hyzk+"'";
   if(sg.length() > 1)
     sql = sql + " and o.sg = '"+sg+"'";

   if(whcd.length() > 1)
     sql = sql + " and o.whcd = '"+whcd+"'";
     
   if(czry.length()>1)
     {
     	sql= sql + " and o.shr = '"+czry+"'";
     }


   if(agestart > 0)
   {
      int year = new Date(System.currentTimeMillis()).getYear() + 1900 - agestart;
      String csdate = year + "-12-31 23:59:59";
      sql = sql + " and o.csdate <= to_date('"+csdate+"','YYYY-MM-DD HH24:MI:SS')";
   }
   if(ageend > 0)
   {
      int year = new Date(System.currentTimeMillis()).getYear() + 1900 - ageend;
      String csdate = year + "-01-01";
      sql = sql + " and o.csdate >= to_date('"+csdate+"','YYYY-MM-DD')";
   }

   String username = SysCommonFunc.getStrParameter(request,"username");
   String email    = SysCommonFunc.getStrParameter(request,"email");
   String lcname   = SysCommonFunc.getStrParameter(request,"lcname");
   String oicq     = SysCommonFunc.getStrParameter(request,"oicq");
   String tel      = SysCommonFunc.getStrParameter(request,"tel");
   //String tel1     = SysCommonFunc.getStrParameter(request,"tel1");
   String vip1     = SysCommonFunc.getStrParameter(request,"vip1");
   String isimg    = SysCommonFunc.getStrParameter(request,"isimg");
   String sjtel    = SysCommonFunc.getStrParameter(request,"sjtel");
   //String havesjtel = SysCommonFunc.getStrParameter(request,"havesjtel");
   String isip     = SysCommonFunc.getStrParameter(request,"isip");
   String httpip   = SysCommonFunc.getStrParameter(request,"httpip");
   String isurl    = SysCommonFunc.getStrParameter(request,"isurl");
   String httpurl  = SysCommonFunc.getStrParameter(request,"httpurl");
   String shr      = SysCommonFunc.getStrParameter(request,"shr");
   String shrname  = SysCommonFunc.getStrParameter(request,"shrname");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String orderby = SysCommonFunc.getStrParameter(request,"orderby");
   String advid   = SysCommonFunc.getStrParameter(request,"advid");
   String jyyx=SysCommonFunc.getStrParameter(request,"jyyx");
   int jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);


     
   if(username.length() > 0)
     sql = sql + " and o.username = '"+username+"'";
   if(email.length() >0)
     sql = sql + " and o.email like '%"+email+"%'";
   if(lcname.length() >0)
     sql = sql + " and o.lcname like '%"+lcname+"%'";
   if(oicq.length() >0)
     sql = sql + " and o.oicq ='"+oicq+"'";

         if(tel.length() > 0)
           sql = sql + " and o.tel ='"+tel+"'";

   if(vip1.length() > 0 && !vip1.equals("-1"))
   {
     if(vip1.equals("1"))
       sql = sql + " and o.flag = " + SysDefine.SYSTEM_HY_TYPE_vip;
     else if(vip1.equals("0"))
       sql = sql + " and o.flag = " + SysDefine.SYSTEM_HY_TYPE_NOR;
   }

   if(isimg.length() > 0 && !isimg.equals("-1"))
   {
     if(isimg.equals("1"))
       sql = sql + " and o.img > 0";
     else if(isimg.equals("0"))
       sql = sql + " and o.img = 0";
   }


         if(sjtel.length() > 0)
           sql = sql + " and o.sjtel = '"+sjtel+"'";


   if(isip.length() > 0 && !isip.equals("-1"))
   {
      if(isip.equals("0"))
        sql = sql + " and o.httpip is null";
      else
      {
         if(httpip.length() > 0)
           sql = sql + " and o.httpip like '%"+httpip+"%'";
         else
           sql = sql + " and o.httpip is not null";
      }
   }

   if(isurl.length() > 0 && !isurl.equals("-1"))
   {
      if(isurl.equals("0"))
        sql = sql + " and o.httpurl is null";
      else
      {
         if(httpurl.length() > 0)
           sql = sql + " and o.httpurl like '%"+httpurl+"%'";
         else
           sql = sql + " and o.httpurl is not null";
      }
   }
   if(shr.length() > 0 && !shr.equals("-1"))
   {
      if(shr.equals("0"))
        sql = sql + " and o.shr is null";
      else
      {
         if(shrname.length() > 0)
           sql = sql + " and o.shr like '%"+shrname+"%'";
         else
           sql = sql + " and o.shr is not null";
      }
   }
   
   if(advid.trim().length() > 0 && !advid.trim().equals("0"))
   {
       sql = sql + " and o.vip="+advid;
   }
   if(jyyxP > 0 && jyyxP < 6)
   {
      sql = sql + " and jyyx like '"+LoverTools.getMinJyyx(jyyxP)+"'";
   }


   String orderfield = "regtime3";
   if(!orderby.equals("0"))
     orderfield = "lasttime";
   
   if(orderby.equals("4"))
     orderfield = "regtime4";

   if(starttime.length() > 0)
     sql = sql + " and o."+orderfield+" > to_date('"+starttime + "','YYYY-MM-DD')";
   if(endtime.length() > 0)
     sql = sql + " and o."+orderfield+" < to_date('"+endtime + "','YYYY-MM-DD')";
   session.setAttribute("stime",starttime);
   session.setAttribute("etime",endtime);



   if(orderby.equals("0")){
      sql = sql + " order by o.flag desc,o.regtime3 desc";
   }else if(orderby.equals("4")){
	   sql = sql + " order by o.flag desc,o.regtime4 desc";
   }else{
      sql = sql + " order by o.flag desc,o.lasttime desc";
   }
   QueryResult qr = null;


   if(tcount > 0)
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage,false,tcount);
   else
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
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
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">已删除会员</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="editinfodel.jsp">
                            <input type="hidden" name="bizaction" value="<%=isdel%>"/>
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="sex" value="<%=sex%>"/>
                            <input type="hidden" name="s1" value="<%=s1%>" />
                            <input type="hidden" name="hyzk" value="<%=hyzk%>" />
                            <input type="hidden" name="sg" value="<%=sg%>" />
                            <input type="hidden" name="whcd" value="<%=whcd%>" />
                            <input type="hidden" name="s2" value="<%=s2%>">
                            <input type="hidden" name="agestart" value="<%=agestart%>">
                            <input type="hidden" name="ageend" value="<%=ageend%>">
                            <input type="hidden" name="username" value="<%=username%>">
			    <input type="hidden" name="czry" value="<%=czry%>">

<input type="hidden" name="email" value="<%=email%>">
<input type="hidden" name="lcname" value="<%=lcname%>">
<input type="hidden" name="oicq" value="<%=oicq%>">
<input type="hidden" name="tel" value="<%=tel%>">

<input type="hidden" name="vip1" value="<%=vip1%>">
<input type="hidden" name="isimg" value="<%=isimg%>">
<input type="hidden" name="sjtel" value="<%=sjtel%>">

<input type="hidden" name="isip" value="<%=isip%>">
<input type="hidden" name="httpip" value="<%=httpip%>">

<input type="hidden" name="isurl" value="<%=isurl%>">
<input type="hidden" name="httpurl" value="<%=httpurl%>">
<input type="hidden" name="shr" value="<%=shr%>">

<input type="hidden" name="shrname" value="<%=shrname%>">
<input type="hidden" name="starttime" value="<%=starttime%>">
<input type="hidden" name="endtime" value="<%=endtime%>">
<input type="hidden" name="orderby" value="<%=orderby%>">
<input type="hidden" name="isdel" value="<%=isdel%>">
<input type="hidden" name="jyyx" value="<%=jyyx%>">


  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="3%" height="25" align="center" nowrap class="tdc"></td>
      <td width="10%" height="25" align="center" nowrap class="tdc"><strong>用户名</strong></td>
      <td width="15%" height="25" align="center" nowrap class="tdc"><strong>昵称</strong></td>
      <td width="12%" height="25" align="center" nowrap class="tdc"><strong>注册时间</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>登陆时间</strong></td>
      <td width="9%" align="center" nowrap class="tdc"><strong>删除人</strong></td>
      <td width="10%" align="center" nowrap class="tdc"><strong>删除时间</strong></td>
      <td width="10%" align="center" nowrap class="tdc"><strong>删除原因</strong></td>
      <td width="19%" height="25" align="center" nowrap class="tdc"><strong>来源网址</strong></td>
      <td width="7%" height="25" align="center" nowrap class="tdc"><strong>来源IP</strong></td>
      <td width="4%" align="center" nowrap class="tdc"><strong>等级</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Userinfo temp = (Userinfo)qr.resultList.get(i);
   Date csdate = temp.getCsdate();
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "未知";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   String vsex = DicList.getDicValue(SysDefine.DIC_SEX,temp.getSex(),1);

//   String vs1 = temp.getS1() == null? "":temp.getS1();
//   String vs2 = temp.getS2() == null? "":temp.getS2();
//   String zz = vs1+vs2;
//   if(zz.equals("北京北京"))
//     zz = "北京";
//   if(zz.equals("上海上海"))
//     zz = "上海";
//   if(zz.equals("天津天津"))
//     zz = "天津";
//   if(zz.equals("重庆重庆"))
//     zz = "重庆";


   String hytype = "普通";
   if(temp.getFlag() != null && temp.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
     hytype = "白金";
   String httpurlv = "";
   if(temp.getHttpurl() != null)
   {

      httpurlv = temp.getHttpurl().startsWith("http://") ? temp.getHttpurl().substring(7):temp.getHttpurl();
      int length = httpurlv.indexOf("/");
      if(length > 0)
        httpurlv = httpurlv.substring(0,length);
      if(httpurlv.length() > 14)
        httpurlv=httpurlv.substring(0,14);
   }
   String tusername = temp.getUsername();
   String tlcname   = temp.getLcname();
   String tregtime3  = DateTools.dateToString(temp.getRegtime3(),true);
   String shqk = temp.getShqk() == null ? "":temp.getShqk();
   String tlasttime = DateTools.dateToString(temp.getLasttime(),true);
   String thttpip   = temp.getHttpip() == null ? "":temp.getHttpip();
   String tshr      = temp.getShr() == null ? "":temp.getShr();


%>
    <tr>
      <td width="3%" height="25" align="center"><input type="checkbox" name="delid" value=<%=temp.getHyid()%>>        </td>
      <td width="10%" height="25" align="center"><a href="edithyinfo.jsp?id=<%=temp.getHyid()%>&isdel=<%=isdel%>" target="_blank"><%=tusername%></a></td>
      <td width="15%" height="25" align="center"><%=tlcname%></td>
      <td width="12%" height="25" align="center"><%=tregtime3%></td>
      <td width="11%" height="25" align="center"><%=tlasttime%></td>
      <td width="9%" align="center"><%=tshr%></td>
      <td width="10%" align="center"><%=temp.getRegtime4() == null ? "":DateTools.dateToString(temp.getRegtime4(),true)%></td>
      <td width="10%" align="center"><%=shqk%></td>
      <td width="19%" height="25" align="center"><a href="<%=temp.getHttpurl() == null?"":temp.getHttpurl()%>"><%=httpurlv%></a></td>
      <td width="7%" height="25" align="center"><%=thttpip%></td>
      <td width="4%" align="center"><%=hytype%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="11" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="11" align="center" valign="middle">
<%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp;&nbsp;
<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr >
      <td height="30" colspan="11" align="center"><input type="submit" name="Submit3" value="<%=button%>" class="button1" onClick="return test();"></td>
    </tr>
    <tr >
      <td height="30" colspan="11"></td>
    </tr>
                                  <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
</table>
			  </form>

</body>
</html>
<iframe name="cframe" width="0" height="0" style="display:none"></iframe>
<script>
function test()
{
  if(!confirm('确认还原吗？')) return false;
}
function checkqb()
{
   if(document.qiubo.qbname.value == "")
   {
       alert("请输入秋波发送用户名字");
      return false;
   }
   return true;
}
</script>

