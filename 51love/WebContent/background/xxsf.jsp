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
<%@ page import="java.text.DecimalFormat"%>


<%

   String mobileoremailc = SysCommonFunc.getStrParameter(request,"mobileoremailc");
   String status = SysCommonFunc.getStrParameter(request,"status");
   String sendorreply    = SysCommonFunc.getStrParameter(request,"sendorreply");
   String mobileoremail = SysCommonFunc.getStrParameter(request,"mobileoremail");

   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");


   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 30;

   String sql = "from UserInfoSendReply as o where 1=1 ";
   if(mobileoremailc != null && mobileoremailc.length() > 0)
     sql = sql + " and o.mobileoremailc like'%" +mobileoremailc + "%'";
   if(status!=null && !status.equals("") &&  !status.equals("-1"))
   {
   		if (status.equals("3")){
   			sql = sql + " and o.status not in (0,1,2)";
   		}else{
   			sql = sql + " and o.status="+status;
   		}
   }

   if(sendorreply!=null && !sendorreply.equals("") && !sendorreply.equals("-1"))
   {
   		sql = sql + " and o.sendorreply="+sendorreply;
   }

   if(mobileoremail!=null && !mobileoremail.equals("") && !mobileoremail.equals("-1"))
   {
   		sql = sql + " and o.mobileoremail="+mobileoremail;
   }

   if(starttime.length() > 0)
   {
     sql = sql + " and o.hdate >= to_date('"+starttime + "','YYYY-MM-DD')";
   }

   if(endtime.length() > 0)
   {
     sql = sql + " and o.hdate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
   }



   sql = sql + " order by id desc";

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
        <td align="center">信息收发</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="xxsf.jsp"  onSubmit="return ChkInput()">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="7" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>收发方式</strong></td>
                                      <td width="33%" height="22" align="left"><input name="mobileoremailc" type="text" id="mobileoremailc" value="<%=mobileoremailc%>"></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>审核状态</strong></td>
                                      <td width="38%" height="22" align="left"><select name="status" id="status">
                                          <option value="-1" selected <%=status.equals("-1") ? "selected":""%>>不限</option>
                                          <option value="0" <%=status.equals("0") ? "selected":""%>>成功</option>
                                          <option value="1" <%=status.equals("1") ? "selected":""%>>等待审核</option>
                                          <option value="2" <%=status.equals("2") ? "selected":""%>>审核失败</option>
                                          <option value="3" <%=status.equals("3") ? "selected":""%>>其他</option>
                                    </tr>
                                    
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>发送/回复</strong></td>
                                      <td height="22" align="left"><select name="sendorreply" id="sendorreply">
                                        <option value="-1" selected <%=sendorreply.equals("-1") ? "selected":""%>>不限</option>
                                        <option value="0" <%=sendorreply.equals("0") ? "selected":""%>>发送</option>
                                        <option value="1" <%=sendorreply.equals("1") ? "selected":""%>>回复</option>
                                                                            </select></td>
                                      <td height="22" align="center" class="tdc"><strong>手机/邮箱:</strong></td>
                                      <td height="22" align="left">
                                      <select name="mobileoremail" id="mobileoremail">
                                        <option value="-1" selected <%=mobileoremail.equals("-1") ? "selected":""%>>不限</option>
                                        <option value="0" <%=mobileoremail.equals("0") ? "selected":""%>>手机</option>
                                        <option value="1" <%=mobileoremail.equals("1") ? "selected":""%>>邮箱</option>
                                      </select>
                                      </td>
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
                                        </script>
                                        <input name="Submit" type="submit" class="button1" value="查询"></td>
                                    </tr>

                                  </table></td>
                              </tr>

                              <tr >
                                <td width="4%" height="30" align="center" class="tdc"><strong>序号</strong></td>
                                <td width="7%" height="30" align="center" class="tdc"><strong>用户名</strong></td>
							    <td width="12%" height="30" align="center" class="tdc"><strong>时间</strong></td>
							    <td width="7%" height="30" align="center" class="tdc"><strong>发送/回复</strong></td>
							    <td width="7%" height="30" align="center" class="tdc"><strong>收发方式</strong></td>
							    <td height="30" align="center" class="tdc"><strong>内容</strong></td>
							    <td width="8%" height="30" align="center" class="tdc"><strong>触发者</strong></td>
							    <td height="9%" align="center" class="tdc" style="white-space: nowrap;"><strong>审核状态</strong></td>
                              </tr>
                            <%
							String status1="成功";
							String sendusername="";
							String sendhyid="";
						    for(int i =0;i < qr.resultList.size();i ++)
							{
						  		 UserInfoSendReply userInfoSendReply = (UserInfoSendReply)qr.resultList.get(i);
						  		 if (userInfoSendReply.getStatus()==0){
						  		 	status1="成功";
						  		 }else if (userInfoSendReply.getStatus()==1){
						  		 	status1="等待审核";
						  		 }else if (userInfoSendReply.getStatus()==2){
						  		 	status1="审核失败";
						  		 }else{
						  		 	status1=userInfoSendReply.getStatus().toString();
						  		 }
						     %>
						    
						    <tr align="center">
						    <td height="30"><%=(cpage-1)*pagesize+i+1%></td>
						    <td height="30"><a href="edithyinfo.jsp?id=<%=userInfoSendReply.getHyid()%>&isdel=0" target="_blank"><%=userInfoSendReply.getUsername()%></a></td>
						    <td height="30"><%=DateTools.dateToString(userInfoSendReply.getHdate(),true)%></td>
						    <td height="30"><%=userInfoSendReply.getSendorreply() == 0? "发送":"回复"%></td>
						    <td height="30"><%=userInfoSendReply.getMobileoremailc() %></td>
						    <td height="30"><%=userInfoSendReply.getContent() %></td>
						    <td height="30">
						    <%
								sendusername="";
								sendhyid="";
								if (userInfoSendReply.getSendorreply()==0 && userInfoSendReply.getSendtype()==0 && userInfoSendReply.getSender()!=null && !userInfoSendReply.getSender().equals("")){
									sendusername=userInfoSendReply.getSender();
									//根据用户名获取用户ID
									Userinfo userinfo=new Userinfo();
									userinfo=HYRegMng.getUserinfoByUsername(sendusername);
									if (userinfo!=null){
										sendhyid=userinfo.getHyid().toString();
										sendusername=userinfo.getLcname();
												    
						     %>
						     			<a href="edithyinfo.jsp?id=<%=sendhyid%>&isdel=0" target="_blank"><%=sendusername%></a>
						     <% 	}
								}
							%>
						    </td>
						    <td height="30"><%=status1%></td>
						    </tr>
						    
						    
						    <%
						    }
						    %>
                              
                             
                              <tr>
                                <td height="25" colspan="8" align="center"><%
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
                                <td height="25" colspan="8" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="8" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="8" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="8" align="center">&nbsp;</td>
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