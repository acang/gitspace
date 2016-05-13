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
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>

<%
    Admininfo adminLeft = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
	int flag = 2;
	if(adminLeft.getFlag() != null)
	   flag = adminLeft.getFlag().intValue();

   String checkername = SysCommonFunc.getStrParameter(request,"checkername");
   
   String selecttype = SysCommonFunc.getStrParameter(request,"selecttype");
   String hyName  	= SysCommonFunc.getStrParameter(request,"hyname");
   
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   
   String tjstarttime = SysCommonFunc.getStrParameter(request,"tjstarttime");
   String tjendtime   = SysCommonFunc.getStrParameter(request,"tjendtime");
   String ordertype = SysCommonFunc.getStrParameter(request,"ordertype");
   if(ordertype==null||ordertype.length()<1){
	   ordertype="2";
   }
   
   String nextStarttime = SysCommonFunc.getStrParameter(request,"nextstarttime");
   String nextEndtime   = SysCommonFunc.getStrParameter(request,"nextendtime");
   
   String tj = SysCommonFunc.getStrParameter(request,"tj");
   String sex   = SysCommonFunc.getStrParameter(request,"sex");
   String isdel   = SysCommonFunc.getStrParameter(request,"isdel");
   if(isdel==null ||isdel.trim().length() == 0){
	   isdel="0";
   }
   
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   
   int agestart = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"agestart"),0);
   int ageend = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"ageend"),0);





   int pagesize = 20;

   ///得到用户列表if(!"1".equals(selecttype)){
   
   String sql = "select * from Checkinfo where id in  (select max(id) from Checkinfo group by hyid) ";

   if("1".equals(selecttype)){
	   sql = "select * from Checkinfo where 1=1  ";
   }
   if(checkername.length() > 0)
	     sql = sql + " and  checkername='"+checkername+"'";
   if(hyName.length() > 0)
	     sql = sql + " and  hyname='"+hyName+"'";  
   
   if(tj.length() > 0&&!"-1".equalsIgnoreCase(tj))
	     sql = sql + " and  tj='"+tj+"'";
   
   if(sex.length() > 0&&!"0".equalsIgnoreCase(sex))
	     sql = sql + " and  sex='"+sex+"'"; 
   if(isdel.length() > 0)
	     sql = sql + " and  isdel="+isdel+""; 
   
   
   
 	if("1".equals(ordertype)){
 		if(tjstarttime.length() > 0)
		     sql = sql + " and  time >= to_date('"+tjstarttime + "','YYYY-MM-DD')";
		if(tjendtime.length() > 0)
		     sql = sql + " and  time <= to_date('"+tjendtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";
 	}else if("2".equals(ordertype)){
 		if(tjstarttime.length() > 0)
		     sql = sql + " and  nexttime >= to_date('"+tjstarttime + "','YYYY-MM-DD')";
		if(tjendtime.length() > 0)
		     sql = sql + " and  nexttime <= to_date('"+tjendtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";
 	}else if("3".equals(ordertype)){
 		if(tjstarttime.length() > 0)
		     sql = sql + " and  tjtime >= to_date('"+tjstarttime + " 00:00:00','YYYY-MM-DD HH24:MI:SS')";
		if(tjendtime.length() > 0)
		     sql = sql + " and  tjtime <= to_date('"+tjendtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";
 	}
 	
    /*if(starttime.length() > 0)
     sql = sql + " and  time >= to_date('"+starttime + "','YYYY-MM-DD')";
   if(endtime.length() > 0)
     sql = sql + " and  time <= to_date('"+endtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";

   if(tjstarttime.length() > 0)
     sql = sql + " and  tjtime >= to_date('"+tjstarttime + "','YYYY-MM-DD')";
   if(tjendtime.length() > 0)
     sql = sql + " and  tjtime <= to_date('"+tjendtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";

   if(nextStarttime.length() > 0)
     sql = sql + " and  nexttime >= to_date('"+nextStarttime + "','YYYY-MM-DD')";
   if(nextEndtime.length() > 0)
     sql = sql + " and  nexttime <= to_date('"+nextEndtime + " 23:59:59','YYYY-MM-DD HH24:MI:SS')";
   */
   if(agestart > 0)
   {
      int year = new Date(System.currentTimeMillis()).getYear() + 1900 - agestart;
      String csdate = year + "-12-31 23:59:59";
      sql = sql + " and csdate <= to_date('"+csdate+"','YYYY-MM-DD HH24:MI:SS')";
   }
   if(ageend > 0)
   {
      int year = new Date(System.currentTimeMillis()).getYear() + 1900 - ageend;
      String csdate = year + "-01-01";
      sql = sql + " and csdate >= to_date('"+csdate+"','YYYY-MM-DD')";
   }
   
   
   	if("1".equals(ordertype)){
	   sql = sql + " order by  time desc nulls last";
	}else if("2".equals(ordertype)){
		sql = sql + " order by  nexttime desc nulls last";
	}else if("3".equals(ordertype)){
		sql = sql + " order by  tjtime desc nulls last";
	}else{
		sql = sql + " order by  nexttime desc nulls last";
	}
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

function valite(){
   var flag=<%=flag%>;
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
        <td align="center">审核管理</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="hychecklist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>审核人</strong></td>
                                      <td width="33%" height="22" align="left"><input name="checkername" type="text" id="sqhy" value="<%=checkername%>"></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>用户名</strong></td>
                                      <td width="38%" height="22" align="left"><input name="hyname" type="text" id="sqhy" value="<%=hyName%>"></td>
                                    </tr>
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>性别</strong></td>
                                      <td width="33%" height="22" align="left">
                                      <select name="sex" size="1" class="border" id="sex">
                                    <option value="0" <%=sex.equals("0") ? "selected":""%>>不限</option>
                                    <option value="10"  <%=sex.equals("10") ? "selected":""%>>男</option>
								    <option value="11"  <%=sex.equals("11") ? "selected":""%>>女</option>
                                  </select>
                                      </td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>年龄</strong></td>
                                      <td height="32" align="left" ><font size="2">从
									          <select name="agestart" size="1" class="border" id="select3">
									            <option selected value="0" <%=agestart==0 ? "selected":""%>>不限</option>
									            <%
									                              for(int i=16;i < 71;i ++)
									                              {
									                              %>
									            <option  value="<%=i%>"  <%=agestart==i ? "selected":""%>><%=i%></option>
									            <%
									                              }
									                                %>
									          </select>
									到
									<select name="ageend" size="1" class="border" id="select4">
									  <option selected value="0" <%=ageend==0 ? "selected":""%>>不限</option>
									  <%
									                              for(int i=16;i < 71;i ++)
									                              {
									                              %>
									  			<option  value="<%=i%>" <%=ageend==i ? "selected":""%>><%=i%></option>
									  			<%
									                              }
									                                %>
									</select>
									      </font></td>
                                    </tr>
                                    
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>是否推荐</strong></td>
                                      <td width="33%" height="22" align="left">
                                      <select name="tj" id="tj">
                                      		<option value="-1" <%=tj.equals("-1") ? "selected":""%>>不限</option>
								        	<option value="1"  <%=tj.equals("1") ? "selected":""%>>推荐</option>
								        	<option value="0"  <%=tj.equals("0") ? "selected":""%>>不推荐</option>
								      	</select>
                                      </td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>显示方式</strong></td>
                                      <td width="38%" height="22" align="left">
                                      <select name="selecttype" id="selecttype">
								        	<option value="0" <%=selecttype.equals("0") ? "selected":"" %>>用户名显示</option>
								        	<option value="1" <%=selecttype.equals("1") ? "selected":"" %>>全部显示</option>
								      	</select>
                                      </td>
                                    </tr>
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>排序方式</strong></td>
                                      <td width="33%" height="22" align="left">
                                   <select name="ordertype" size="1" class="border" id="ordertype">
								    <option value="2"  <%=ordertype.equals("2") ? "selected":""%>>下次审核时间</option>
                                    <option value="1"  <%=ordertype.equals("1") ? "selected":""%>>审核时间</option>
								    <option value="3"  <%=ordertype.equals("3") ? "selected":""%>>推荐时间</option>
                                  </select>
                                      </td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>时间范围</strong></td>
                                      <td width="33%" height="22" align="left">从
                                      <input name="tjstarttime" type="text" class="input3" id="tjstarttime" value="<%=tjstarttime%>" readonly>
                                  <img src="../commonlib/calendar/img.gif" width="20" height="14" id="starttj">
                                  <script type="text/javascript">
    Calendar.setup({
        inputField     :    "tjstarttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "starttj",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
                                    </script>
                                  到
                                  <input name="tjendtime" type="text" class="input3" id="tjendtime" value="<%=tjendtime%>" readonly>
                                  <img src="../commonlib/calendar/img.gif" width="20" height="14" id="endtj">
                                  <script type="text/javascript">
    Calendar.setup({
        inputField     :    "tjendtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endtj",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
                                </script>
                                	</td>
                                    </tr>
                              <tr >
                              		<td width="11%" height="22" align="center" class="tdc"><strong>是否删除会员</strong></td>
                                      <td width="33%" height="22" align="left">
                                      <select name="isdel" size="1" class="border" id="isdel">
                                    <option value="0"  <%=isdel.equals("0") ? "selected":""%>>未删除</option>
								    <option value="1"  <%=isdel.equals("1") ? "selected":""%>>已删除</option>
                                  </select>
                                      </td>
							      <td height="25" colspan="2" align="center"><input name="Submit" type="submit" class="button1" value="查询" onclick="return valite()"></td>
							  </tr>
                              </table>
                              <br/>
                              <br/>
                              
                              <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                              <tr >
                                <td width="4%" align="center" class="tdc" height="25"><strong>序号</strong></td>
                                <td width="10%" align="center" class="tdc" height="25"><strong>审核人</strong></td>
                                <td width="15%" align="center" class="tdc" height="25"><strong>审核时间</strong></td>
                                <td width="10%" align="center" class="tdc" height="25"><strong>用户名</strong></td>
                                <td width="10%" align="center" class="tdc" height="25"><strong>昵称</strong></td>
                                <td width="4%" align="center" class="tdc" height="25"><strong>性别</strong></td>
                                <td width="4%" align="center" class="tdc" height="25"><strong>年龄</strong></td>
                                <td width="15%" align="center" class="tdc" height="25"><strong>审核情况</strong></td>
                                <td width="12%" align="center" class="tdc" height="25"><strong>下次审核时间</strong></td>
                                <td width="5%" align="center" class="tdc" height="25"><strong>是否推荐</strong></td>
                                <td width="12%" align="center" class="tdc" height="25"><strong>推荐时间</strong></td>
                                  
                              </tr>
                          <%
                              Date cdate  = new Date(System.currentTimeMillis());
                              DynaBean dbl=null;
                              List listall = qr.resultList;
for(int i =0;i < listall.size();i ++)
{
	dbl=(DynaBean)listall.get(i);
	String vage = "未知";
	if(dbl.get("csdate")!=null){
		try{
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date csdate = formatter.parse(dbl.get("csdate").toString());
		if(csdate != null)
			vage  = (cdate.getYear()-csdate.getYear())+"";
		}catch(Exception e){}
	}
	//Date csdate = checkinfo.getCsdate();
	//   if(csdate != null)
	//     vage  = (cdate.getYear()-csdate.getYear())+"";
	String vsex ="未知";
	if(dbl.get("sex")!=null){
	   vsex = DicList.getDicValue(SysDefine.DIC_SEX,dbl.get("sex").toString(),1);
	}
	   
	String vtj ="不推荐";
	if(dbl.get("tj")!=null){
	 vtj = "1".equalsIgnoreCase(dbl.get("tj").toString())?"推荐":"不推荐";
	}
	
%>
                              <tr>
                                <td align="center" height="25"><%=(cpage-1)*20+i+1%></td>
                                <td align="center" height="25"><%=dbl.get("checkername")!=null ?dbl.get("checkername").toString():""%></td>
                                <td align="center" height="25"><%=dbl.get("time")!=null ?dbl.get("time").toString():""%></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=dbl.get("hyid").toString()%>&isdel=0" target="_blank"><%=dbl.get("hyname").toString()%></a></td>
                                
                                <td align="center" height="25"><%=dbl.get("lcname").toString()%></td>
                                <td align="center" height="25"><%=vsex%></td>
                                <td align="center" height="25"><%=vage%></td>
                                
                                <td align="center" height="25"><a href="hycheck.jsp?id=<%=dbl.get("hyid").toString()%>&isdel=0" target="_blank"><%=dbl.get("status")!=null ?dbl.get("status").toString():""%></a></td>
                                <td align="center" height="25"><%=dbl.get("nexttime").toString().substring(0, 19)%></td>
                              	
                              	<td align="center" height="25"><%=vtj%></td>
                              	<td align="center" height="25"><%=dbl.get("tjtime")!=null ?dbl.get("tjtime").toString().substring(0, 10):""%></td>
                              </tr>
                              <%
}
%>

                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center"><%
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
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条&nbsp; <font color='000064'> 转到第
<input type='text' name='turnpage' size=5 maxlength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">
页</font>&nbsp;&nbsp;
<input name="button" type='button' class=button style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19' onClick=turn(document.go2to.turnpage.value) value='确 定'></td>
                              </tr>
                </table>
 </form>
 <br/>
 <br/>
 <br/>
 <br/>
 



</body>
</html>
<script>
function test()
{
  if(!confirm('确认操作吗？')) return false;
  document.go2to.bizaction.value="01";
  document.go2to.submit();
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
