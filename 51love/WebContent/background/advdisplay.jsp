<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
	Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
	   
	   String isdel =SysCommonFunc.getStrParameter(request,"isdel");
	   String vip =SysCommonFunc.getStrParameter(request,"vip");
	   String stime =SysCommonFunc.getStrParameter(request,"starttime");
	   String etime =SysCommonFunc.getStrParameter(request,"endtime");
	   String[] delid = request.getParameterValues("delid");
	   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
	   String del = SysCommonFunc.getStrParameter(request,"del");
	   if(delid != null && delid.length >0 && isdel.equals("0") && bizaction.equals("remove"))
	   {
	       String sqlarray[] = new String[delid.length];
	       for(int i =0;i < delid.length;i ++)
	       {
	         sqlarray[i] = "update userinfo set isdel = 1,shr = '"+adminLoginInfo.getAdminname()+"',regtime4=sysdate where hyid=" +delid[i];
	       	 String sqlt ="select shqk from userinfo where hyid=" +delid[i];
	       	 List listt=QueryRecord.query(sqlt);
	       	 if(listt.size()>0)
	       	 {
	       	 DynaBean dbt=(DynaBean)listt.get(0);
	       	 if(dbt.get("shqk")==null)
	       	 {
	       	 	HbmOperator.executeSql("update userinfo set shqk = '"+del+"' where hyid=" +delid[i]);
	       	 }
	       	 else
	       	 {
	       	 	String del2=String.valueOf(dbt.get("shqk"))+"    "+del;
	       	 	HbmOperator.executeSql("update userinfo set shqk = '"+del2+"' where hyid=" +delid[i]);
	       	 }
	       	 }
	       }
	       HbmOperator.executeSql(sqlarray);
	       
	   }
	   if(delid != null && delid.length >0 && isdel.equals("0") && bizaction.equals("remove"))
	   {
	       String sqlarray[] = new String[delid.length];
	       for(int i =0;i < delid.length;i ++)
	         sqlarray[i] = "delete from hytj  where tjid=" +delid[i];
	       HbmOperator.executeSql(sqlarray);
	   }
	   String button = "删除";
	   if(isdel.equals("1"))
	     button = "还原";
	   
	   
	   String sql = "from Userinfo  where vip = "+vip;
	   
	   if(isdel.equals("1"))
	   {
		sql=sql+" and isdel = 1 and lcname not is null"; 
	   }
	   else
	   {
		sql=sql+" and isdel = 0";   
	   }
	   if(stime.length()>0)
		{
			sql=sql+" and regtime >= to_date('"+stime+ "','YYYY-MM-DD')";
		}
		if(etime.length()>0)
		{
			sql=sql+" and regtime <= to_date('"+etime+ "','YYYY-MM-DD')";
		}
	   sql=sql+" order by regtime desc";
	   		
	   DynaBean dbt =null;
	   Map map=new HashMap();
	   String sqlt="select adv_member_name,adv_member_code from adv_member order by adv_member_code asc";
       List listt=(List)QueryRecord.query(sqlt);
	     if(listt.size()>0)
	     {
	     	for(int o =0;o<listt.size();o++)
	     	{
	        	dbt =(DynaBean)listt.get(o);
	        	map.put(dbt.get("adv_member_code").toString(),dbt.get("adv_member_name"));
	        }
	      }
		   
	   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
	   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
	   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
	   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
	   String wttype = SysCommonFunc.getStrParameter(request,"wttype");


	   tcount = 0;

	   int pagesize = 20;

	   ///得到用户列表

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
<title>51lover交友中心</title>
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

<script language="JavaScript">
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

function test()
{
  if(document.go2to.del.value == "")
  {
  	alert("请输入删除原因！");
  	return false;
  }
  if(!confirm('确认删除吗？')) return false;
  document.go2to.bizaction.value = "remove";
}

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;
   document.go2to.submit();
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
        <td align="center">推广数量</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="advdisplay.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="isdel" value="<%=isdel%>">
                            <input type="hidden" name="vip" value="<%=vip%>">
                            <input type="hidden" name="bizaction" value="">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td align="center" class="tdc"><strong>查询加入时间</strong></td>
      <td align="left">
        起始时间：<input name="starttime" type="text" class="input3" id="starttime"  value="<%=stime == null ? "":stime%>">
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
</script>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;终止时间：<input name="endtime" type="text" class="input3" id="endtime"  value="<%=etime == null ? "":etime%>">
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<input type="submit" name="Submit2"  class="button1" value="查询" onClick="return check();"> 
</td>
    </tr>
  </table>
</form>
<br>

<form name="go2to" method="Post" action="advdisplay.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="isdel" value="<%=isdel%>">
                            <input type="hidden" name="vip" value="<%=vip%>">
                            <input type="hidden" name="starttime" value="<%=stime%>">
                            <input type="hidden" name="endtime" value="<%=etime%>">
                            <input type="hidden" name="bizaction" value="">

 <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="4%" height="25" align="center" nowrap class="tdc"><strong>选定</strong></td>
      <td width="8%" height="25" align="center" nowrap class="tdc"><strong>用户名</strong></td>
      <td width="12%" height="25" align="center" nowrap class="tdc"><strong>昵称</strong></td>
      <td width="3%" height="25" align="center" nowrap class="tdc"><strong>性别</strong></td>
      <td width="3%" height="25" align="center" nowrap class="tdc"><strong> 年龄</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>地址</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>来源IP</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>加入时间</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>注册时间</strong></td>
      <td width="11%" height="25" align="center" nowrap class="tdc"><strong>登陆时间</strong></td>
      <td width="8%" align="center" nowrap class="tdc"><strong>来源类别</strong></td>
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

   String vs1 = temp.getS1() == null? "":temp.getS1();
   String vs2 = temp.getS2() == null? "":temp.getS2();
   String zz = vs1+vs2;
   if(zz.equals("北京北京"))
     zz = "北京";
   if(zz.equals("上海上海"))
     zz = "上海";
   if(zz.equals("天津天津"))
     zz = "天津";
   if(zz.equals("重庆重庆"))
     zz = "重庆";
   if(zz.equals("香港香港"))
     zz = "香港";
   if(zz.equals("澳门澳门"))
     zz = "澳门";


   String tusername = temp.getUsername();
   String tlcname   = temp.getLcname();
   String tregtime  = DateTools.dateToString(temp.getRegtime(),true);
   String tregtime3  = DateTools.dateToString(temp.getRegtime3(),true);
   String tlasttime = DateTools.dateToString(temp.getLasttime(),true);
   String thttpip   = temp.getHttpip() == null ? "":temp.getHttpip();
   
%>
    <tr>
      <td width="4%" height="25" align="center"><input type="checkbox" name="delid" value=<%=temp.getHyid()%>></td>
      <td width="8%" height="25" align="center"><a href="edithyinfo.jsp?id=<%=temp.getHyid()%>&isdel=<%=isdel%>" target="_blank"><%=tusername%></a></td>
      <td width="12%" height="25" align="center"><%=tlcname%></td>
      <td width="3%" height="25" align="center"><%=vsex%></td>
      <td width="3%" height="25" align="center"><%=age%></td>
      <td width="11%" height="25" align="center"><%=zz%></td>
      <td width="11%" height="25" align="center"><%=thttpip%></td>
      <td width="11%" height="25" align="center"><%=tregtime%></td>
      <td width="11%" height="25" align="center"><%=tregtime3%></td>
      <td width="11%" height="25" align="center"><%=tlasttime%></td>
      <td width="8%" align="center"><%=map.get(temp.getVip()+"")%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="12" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="12" align="center" valign="middle">
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条 &nbsp;&nbsp;
<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr >
      <td height="30" colspan="12">&nbsp;</td>
    </tr>
   <tr >
      <td height="30" colspan="12"> 
      <div align="center">
          <input type="submit" name="Submit3" value="<%=button%>" class="button1" onClick="return test();">
          &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(*)请输入删除原因：</font><input type="text" name="del" id="del" size="40">
      </div>
      </td>
    </tr>
                                  <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
</table>
 </form>



</body>
</html>


