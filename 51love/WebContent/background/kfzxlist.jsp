<%@ page contentType="text/html; charset=gbk"%>
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
	String cpages = SysCommonFunc.getStrParameter(request, "cpages");
	int cpage = SysCommonFunc.getNumberFromString(cpages, 1);
	String tcounts = SysCommonFunc.getStrParameter(request, "tcounts");
	int tcount = SysCommonFunc.getNumberFromString(tcounts, 0);

	String bizaction = SysCommonFunc.getStrParameter(request,
			"bizaction");
	if (bizaction.equals("01")) {
		String tntype = SysCommonFunc
				.getStrParameter(request, "tntype");
		String[] delid = request.getParameterValues("delid");
		if (delid != null && delid.length > 0) {
			String sqlarray[] = new String[delid.length];
			for (int i = 0; i < delid.length; i++)
			{
				sqlarray[i] = "update kfzx set n_type=" + tntype
						+ " where id=" + delid[i];
						}
			HbmOperator.executeSql(sqlarray);
			
			tcount = 0;

		}
	}

	//   String[] delid = request.getParameterValues("delid");
	//   if(delid != null && delid.length >0)
	//   {
	//       String sqlarray[] = new String[delid.length];
	//       for(int i =0;i < delid.length;i ++)
	//         sqlarray[i] = "delete from friendsite where id="+delid[i];
	//       HbmOperator.executeSql(sqlarray);
	//       tcount = 0;
	//
	//   }
	//
	//   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
	//   if(bizaction.equals("01"))
	//   {
	//      String cid = SysCommonFunc.getStrParameter(request,"opid");
	//      HbmOperator.executeSql("update friendsite set isok =1 where id= "+cid);
	//   }else if(bizaction.equals("02"))
	//   {
	//      String cid = SysCommonFunc.getStrParameter(request,"opid");
	//      HbmOperator.executeSql("update friendsite set isok =0 where id= "+cid);
	//   }else if(bizaction.equals("03"))
	//   {
	//      String cid = SysCommonFunc.getStrParameter(request,"opid");
	//      HbmOperator.executeSql("update friendsite set isok =1,isgood=1 where id= "+cid);
	//   }else if(bizaction.equals("04"))
	//   {
	//      String cid = SysCommonFunc.getStrParameter(request,"opid");
	//      HbmOperator.executeSql("update friendsite set isgood =0 where id= "+cid);
	//   }

	String ntype = SysCommonFunc.getStrParameter(request, "ntype");
	String starttime = SysCommonFunc.getStrParameter(request,
			"starttime");
	String endtime = SysCommonFunc.getStrParameter(request, "endtime");

	List adminList = AdminMng.getAdminList();
	String czry = SysCommonFunc.getStrParameter(request, "czry");
	String kflm = SysCommonFunc.getStrParameter(request, "kflm");
	if(!kflm.equals(""))
	{
		ntype=kflm;
	}

	if (ntype.length() == 0)
		ntype = "0";

	String ntypes = "";
	
	if (ntype.equals("0"))
	{
		ntypes = "新留言";
		}
	if (ntype.equals("1")){
		ntypes = "交费";
		}
	if (ntype.equals("2")){
		ntypes = "咨询";
		}
	if (ntype.equals("3")){
		ntypes = "投诉";
		}
	if (ntype.equals("4")){
		ntypes = "建议";
		}
	if (ntype.equals("5")){
		ntypes = "其它";
		}
	if (ntype.equals("6")){
		ntypes = "删除";
		}
		
	if(!kflm.equals(""))
	{
		if (kflm.equals("00"))
		{
			ntypes = "全部";
		}
		if (kflm.equals("0"))
		{
			ntypes = "新留言";
		}
		if (kflm.equals("1"))
		{
			ntypes = "交费";
		}
		if (kflm.equals("2"))
		{
			ntypes = "咨询";
		}
		if (kflm.equals("3"))
		{
			ntypes = "投诉";
		}
		if (kflm.equals("4"))
		{
			ntypes = "建议";
		}
		if (kflm.equals("5"))
		{
			ntypes = "其它";
		}
		if (kflm.equals("6"))
		{
			ntypes = "删除";
		}
	}
	int pagesize = 40;

	///得到用户列表
	String sql = "from Kfzx as o where o.ntype=" + ntype;

	if (!(kflm.equals("")|| kflm.equals("00"))) {
		sql = "from Kfzx as o where o.ntype=" + kflm;
	}
	if (kflm.equals("00")) {
		sql = "from Kfzx as o where 1=1 ";
	}

	if (starttime.length() > 0)
		sql = sql + " and o.ndate > to_date('" + starttime
				+ "','YYYY-MM-DD')";
	if (endtime.length() > 0)
		sql = sql + " and o.ndate < to_date('" + endtime
				+ " 23:59:59','YYYY-MM-DD HH24:MI:SS')";

	if (czry.length() > 1) {
		sql = sql + " and o.deletename = '" + czry + "'";
	}

	if (ntype.equals("6")||kflm.equals("00")) {
		sql = sql + " order by o.id desc";
	} else {
		sql = sql + " order by o.ztai asc,o.id desc";
	}

	QueryResult qr = QueryRecord.queryByHbm(sql, pagesize, cpage);
	int totalPage = qr.pageCount;
	int totalCount = qr.rowCount;
	cpage = qr.pageNum;
	int prepage = cpage - 1;
	int nextpage = cpage + 1;
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gbk">
		<title>51love交友中心</title>
		<link href="style/css.css" rel="stylesheet" type="text/css">
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color: #8CABDE;
	scrollbar-highlight-color: #eeeeee;
	scrollbar-face-color: #E8F1FF;
	scrollbar-arrow-color: #8CABDE;
	scrollbar-shadow-color: #8CABDE;
	scrollbar-darkshadow-color: #eeeeee;
	scrollbar-base-color: #F0F0F0;
	scrollbar-track-color: #F2F7FF;
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

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;

   document.go2to.submit();
}
</script>
		<link rel="stylesheet" type="text/css" media="all"
			href="../commonlib/calendar/calendar-win2k-cold-1.css"
			title="win2k-cold-1" />
		<script type="text/javascript" src="../commonlib/calendar/calendar.js"></script>

		<!-- language for the calendar -->
		<script type="text/javascript"
			src="../commonlib/calendar/lang/calendar-zh.js"></script>

		<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
		<script type="text/javascript"
			src="../commonlib/calendar/calendar-setup.js"></script>
	</head>

	<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">客服中心-<%=ntypes%></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
		
		
		<form name="go2to" method="Post" action="kfzxlist.jsp">
			<input type="hidden" name="cpages" value="<%=cpage%>" />
			<input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
			<input type="hidden" name="ntype" value="<%=ntype%>" />
			<input type="hidden" name="bizaction" value="" />
			<table width="1150px" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="D8D8D8" class="txt"
				style="border-collapse: collapse">

				<tr>
					<td height="30" colspan="8" align="left" class="tdc">
						<strong>起始时间</strong>
						<input name="starttime" type="text" class="input3" id="singname4"
							value="<%=starttime%>" readonly>
						<img src="../commonlib/calendar/img.gif" width="20" height="14"
							id="startt">
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
						<strong>终止时间</strong>
						<input name="endtime" type="text" class="input3" id="singname5"
							value="<%=endtime%>" readonly>
						<img src="../commonlib/calendar/img.gif" width="20" height="14"
							id="endt">
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

						&nbsp;&nbsp;&nbsp;&nbsp;
						<strong>回复人</strong>
						<select name="czry" id="czry">
							<option value="">
								不限
							</option>
							<%
								for (int i = 0; i < adminList.size(); i++) {
									Admininfo temp = (Admininfo) adminList.get(i);
									String se = "";
									if (czry.equals(temp.getAdminname()))
										se = "selected";
							%>
							<option value="<%=temp.getAdminname()%>" <%=se%>><%=temp.getAdminname()%></option>
							<%
								}
							%>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<strong>客服栏目</strong>
						<select name="kflm" id="kflm">
							<option value="00" <%=kflm.equals("00") ? "selected":"" %>>
								全部
							</option>
							<option value="0" <%=(kflm.equals("0") || ntype.equals("0"))&& !kflm.equals("00")? "selected":"" %>>
								新留言
							</option>
							<option value="1" <%=(kflm.equals("1") || ntype.equals("1"))&& !kflm.equals("00")? "selected":"" %>>
								交费
							</option>
							<option value="2" <%=(kflm.equals("2") || ntype.equals("2"))&& !kflm.equals("00")? "selected":"" %>>
								咨询
							</option>
							<option value="3" <%=(kflm.equals("3") || ntype.equals("3"))&& !kflm.equals("00")? "selected":"" %>>
								投诉
							</option>
							<option value="4" <%=(kflm.equals("4") || ntype.equals("4"))&& !kflm.equals("00")? "selected":"" %>>
								建议
							</option>
							<option value="5" <%=(kflm.equals("5") || ntype.equals("5"))&& !kflm.equals("00")? "selected":"" %>>
								其它
							</option>
							<option value="6" <%=(kflm.equals("6") || ntype.equals("6"))&& !kflm.equals("00")? "selected":"" %>>
								删除
							</option>
						</select>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="Submit" type="submit" class="button1" value="查询">


					</td>
				</tr>
				</table>
				<br/>
				<br/>
				<table width="1150px" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="D8D8D8" class="txt"
				style="border-collapse: collapse">
				<tr>
					<td width="3%" height="30" align="center" class="tdc"></td>
					<td width="5%" height="30" align="center" class="tdc">
						<strong>状态</strong>
					</td>
					<td width="5%" height="30" align="center" class="tdc">
						<strong>姓名</strong>
					</td>
					<td width="10%" height="30" align="center" class="tdc">
						<strong>标题</strong>
					</td>
					<td width="11%" height="30" align="center" class="tdc">
						<strong> 日期</strong>
					</td>
					<td width="7%" align="center" class="tdc">
						<strong>发送者</strong>
					</td>
					<td width="7%" align="center" class="tdc">
						<strong>回复人</strong>
					</td>
					<td width="25%" height="30" align="center" class="tdc">
						<strong> 处理结果</strong>
					</td>
				</tr>
				<%
					for (int i = 0; i < qr.resultList.size(); i++) {

						Kfzx temp = (Kfzx) qr.resultList.get(i);
				%>
				<tr>
					<td width="3%" align="center">
						<input type="checkbox" name="delid" value=<%=temp.getId()%>>
					</td>
					<td width="3%" height="30" align="center">
						<%
							if (temp.getZtai() != null && temp.getZtai().intValue() == 1) {
						%>
						<img src="images/mopen.gif" width="15" height="12">
						<%
							} else {
						%>
						<img src="images/mclose.gif" width="14" height="11">
						<%
							}
						%>

					</td>
					<td width="13%" height="30" align="center"><%=temp.getUsername()%></td>
					<td width="21%" height="30" align="center">
						<a href="./channel/viewkfzx.jsp?id=<%=temp.getId()%>"
							target="_blank"><%=temp.getNtitle()%></a>
					</td>
					<td width="11%" height="30" align="center"><%=DateTools.dateToString(temp.getNdate(), true)%></td>
					<td width="7%" align="center"><%=temp.getIpaddress() == null ? "" : temp
						.getIpaddress()%></td>
					<td width="7%" align="center"><%=temp.getDeletename() == null ? "" : temp
						.getDeletename()%></td>
					<td width="35%" height="30" align="center"><%=temp.getNcontent() == null ? "" : temp.getNcontent()%></td>
				</tr>
				<%
					}
				%>

				<tr>
					<td height="30" colspan="9" align="center" valign="middle">
						&nbsp;
					</td>
				</tr>
				<tr>
					<td height="30" colspan="8" align="center" valign="middle">
						<%
							if (cpage == 1)
								out
										.println("<font class='info_link'>首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; </font> ");
							else {
								out
										.println("<a href='javascript:turn(1)' class='info_link'>首    页</a>&nbsp;&nbsp;");
								out.println("<a href='javascript:turn(" + prepage
										+ ")' class='info_link'>上一页</a>&nbsp;&nbsp;");
							}
							if (cpage >= totalPage)
								out
										.println("<font class='info_link'>下一页&nbsp;&nbsp;尾页&nbsp;&nbsp;  </font> ");
							else {
								out.println("<a href='javascript:turn(" + nextpage
										+ ")' class='info_link'>下一页</a>&nbsp;&nbsp;");
								out.println("<a href='javascript:turn(" + totalPage
										+ ")' class='info_link'>尾页</a>&nbsp;&nbsp;");
							}
						%>
						页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条
						&nbsp;&nbsp;
						<font color='000064'> 转到第<input type='text' name='turnpage'
								size=5 maxLength=8
								style='font-size: 9pt; color: #00006A; position: relative; height: 18'
								value="">页</font>&nbsp;&nbsp;
						<input class=button type='button' value='确 定'
							onclick=turn(document.go2to.turnpage.value)
							style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'>
					</td>
				</tr>
				<tr>
					<td height="30" colspan="8" valign="middle">
						<div align="center">
							<select name="tntype">
								<option value="0">
									新留言
								</option>
								<option value="1">
									交费
								</option>
								<option value="2">
									咨询
								</option>
								<option value="3">
									投诉
								</option>
								<option value="4">
									建议
								</option>
								<option value="5">
									其它
								</option>
								<option value="6">
									删除
								</option>
							</select>
							<input type="submit" name="Submit3" value="移动" class="button1" onClick="return test();">
						</div>
					</td>
				</tr>
				<tr>
					<td height="30" colspan="8" valign="middle">
					</td>
				</tr>
				                              <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
			</table>
		</form>




	</body>
</html>
<script>
	function test() {
		document.go2to.bizaction.value = "01";
	}
</script>
