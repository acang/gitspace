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

	String ip = SysCommonFunc.getStrParameter(request,"ip");
   String mobilenumber = SysCommonFunc.getStrParameter(request,"mobilenumber");
   String sstatus    = SysCommonFunc.getStrParameter(request,"sstatus");
   String comp = SysCommonFunc.getStrParameter(request,"comp");
   String fromclass = SysCommonFunc.getStrParameter(request,"fromclass");
   if(comp == null || comp.length() ==0)
      comp = "1";
   if(sstatus == null || sstatus.length() ==0)
      sstatus = "0";
   String regstatus =  SysCommonFunc.getStrParameter(request,"regstatus");
    if(regstatus == null || regstatus.length() ==0)
       regstatus = "0";
   if(fromclass == null || sstatus.length() ==0)
      fromclass = "-1";

   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");


   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 30;

   ///�õ��û��б�
//   String sql = "from Vipuserrecord as o  where 1=1 ";
//   String sql1 = "select sum(t.transamt) from vipuserrecord t where 1=1 ";
//select t.*,u.vip from  vipuserrecord t left join userinfo u on (t.hyid = u.hyid) where vip = 1

   String sql = "from SendSms as o where 1=1 ";
   String countSql = "from SendSms as o where 1=1 ";
   String ssql ="from SendSms as o where 1=1 and o.reportStatus=0";
   String sssql ="from SendSms as o where 1=1 and o.regstatus=0";
   String ssssql = "from SendSms as o where 1=1 and o.vcation=1 ";
    double k =0.0;
   if(mobilenumber != null && mobilenumber.length() > 0)
     sql = sql + " and o.mobileNumber='" +mobilenumber + "'";
     if(ip != null && ip.length() > 0)
     sql = sql + " and o.userIp='" +ip + "'";
   if(sstatus.length() > 0 && sstatus.equals("1"))
   {
        sql = sql + " and o.reportStatus=0";
   }

    if(sstatus.length() > 0 && sstatus.equals("2"))
    {
         sql = sql + " and o.reportStatus<>0";
    }

   if(regstatus.length() > 0 && regstatus.equals("1"))
   {
        sql = sql + " and o.regstatus=0";
   }

    if(regstatus.length() > 0 && regstatus.equals("2"))
    {
         sql = sql + " and o.regstatus<>0";
    }
    if(comp.length() > 0 && comp.equals("1"))
   {
        sql = sql + " and o.comp=1";
        countSql = countSql +" and o.comp=1";
		ssql = ssql + " and o.comp=1";
		sssql =sssql + " and o.comp=1";
		ssssql = ssssql +" and o.comp=1";
   }

    if(comp.length() > 0 && comp.equals("0"))
    {
         sql = sql + " and o.comp<>1";
         countSql = countSql +  " and o.comp<>1";
		ssql = ssql +  " and o.comp<>1";
		sssql =sssql +  " and o.comp<>1";
		ssssql =  ssssql+ " and o.comp<>1";
    }
    
    if(fromclass.length() > 0 && !fromclass.equals("-1"))
    {
         sql = sql + " and o.fromclass="+fromclass;
         countSql = countSql +  " and o.fromclass="+fromclass;
		ssql = ssql +  " and o.fromclass="+fromclass;
		sssql =sssql +  " and o.fromclass="+fromclass;
		ssssql =  ssssql+ " and o.fromclass="+fromclass;
    }

    

//    Date cdate = new Date(System.currentTimeMillis());
//    String dates = DateTools.dateToString(cdate,false);
//
//   if(starttime.length() ==0)
//     starttime = dates;

   if(starttime.length() > 0)
   {
     sql = sql + " and o.sysSubmitDate >= to_date('"+starttime + "','YYYY-MM-DD')";
	countSql = countSql + " and o.sysSubmitDate >= to_date('"+starttime + "','YYYY-MM-DD')";
	ssql = ssql + " and o.sysSubmitDate >= to_date('"+starttime + "','YYYY-MM-DD')";
	sssql =sssql + " and o.sysSubmitDate >= to_date('"+starttime + "','YYYY-MM-DD')";
	ssssql  = ssssql+ " and o.sysSubmitDate >= to_date('"+starttime + "','YYYY-MM-DD')";
   }






   if(endtime.length() > 0)
   {
     sql = sql + " and o.sysSubmitDate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
     countSql = countSql + " and o.sysSubmitDate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
     ssql = ssql + "  and o.sysSubmitDate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
     sssql =sssql + "  and o.sysSubmitDate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
     ssssql = ssssql + "  and o.sysSubmitDate <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";
   }



   sql = sql + " order by id desc";
   countSql = countSql + " order by id desc";
   ssql = ssql +" order by id desc";

   QueryResult qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   QueryResult qr1 = QueryRecord.queryByHbm(countSql,pagesize,cpage);
   QueryResult qr2 = QueryRecord.queryByHbm(ssql,pagesize,cpage);
   QueryResult qr3 = QueryRecord.queryByHbm(sssql,pagesize,cpage);
   QueryResult qr4 = QueryRecord.queryByHbm(ssssql,pagesize,cpage);
   int cCount = qr1.rowCount;
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   int sCount = qr2.rowCount;
   int rCount = qr3.rowCount;
   int vCount = qr4.rowCount;
   
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
   k = (double) sCount/cCount*100;
   double v = 0.0;
   v= (double)vCount/sCount*100;
   DecimalFormat df = new DecimalFormat( "#.00 "); 
   double j =0.0;
   j = (double) rCount/ sCount *100;
   
  
   
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

function ChkInput(){


var sname =document.go2to.simplename.value;

if (sname != "" && (!isNumber(sname) || parseInt(sname) > 9999))
{
alert("������Ƽ��ͷ���Ų���ȷ");
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

function sendSms()
{

    document.sendpwd.remobile.value =  document.go2to.remobile.value;
    document.sendpwd.submit();
  
    
    
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
        <td align="center">��Ա��֤</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchsms.jsp"  onSubmit="return ChkInput()">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="10" align="left"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                      <td width="11%" height="22" align="center" class="tdc"><strong>���պ���</strong></td>
                                      <td width="33%" height="22" align="left"><input name="mobilenumber" type="text" id="mobilenumber" value="<%=mobilenumber%>"></td>
                                      <td width="18%" height="22" align="center" class="tdc"><strong>����״̬</strong></td>
                                      <td width="38%" height="22" align="left"><select name="sstatus" id="sstatus">
                                          <option value="0" selected <%=sstatus.equals("0") ? "selected":""%>>����</option>
                                          <option value="1" <%=sstatus.equals("1") ? "selected":""%>>�ɹ�</option>
                                          <option value="2" <%=sstatus.equals("2") ? "selected":""%>>���ɹ�</option>
                                    </tr>
                                    
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>ע�����</strong></td>
                                      <td height="22" align="left"><select name="regstatus" id="regstatus">
                                        <option value="0" selected <%=regstatus.equals("0") ? "selected":""%>>����</option>
                                        <option value="1" <%=regstatus.equals("1") ? "selected":""%>>�ɹ�</option>
                                        <option value="2" <%=regstatus.equals("2") ? "selected":""%>>���ɹ�</option>
                                                                            </select></td>
                                      <td height="22" align="center" class="tdc"><strong>IP:</strong></td>
                                      <td height="22" align="left" ><input name="ip" type="text" id="ip" value="<%=ip%>"></td>
                                    </tr>
                                    <tr>
                                      <td height="22" align="center" class="tdc"><strong>��ʼʱ��</strong></td>
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
                                      <td height="22" align="center" class="tdc"><strong>��ֹʱ��</strong></td>
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
                                        <input name="Submit" type="submit" class="button1" value="��ѯ"></td>
                                    </tr>
                                    <tr>
                                    	<td height="22" align="center" class="tdc"><strong>���ͺ���</strong></td>
                                    	<td height="22" align="left"><input name="remobile" type="text" >
                                    	<input name="button" type="button" class="button1" value="����" onclick="javascript:sendSms();"></td>
                                    	<td height="22" align="center"  class="tdc"><strong>ƽ̨����</strong></td>
                                    	<td height="22" align="left"  class="tdc"><select name="comp" id="comp">
                                        <option value="1" selected <%=comp.equals("1") ? "selected":""%>>��ʥ</option>
                                        <option value="0" <%=comp.equals("0") ? "selected":""%>>����</option>
                                                                            </select></td>
                                    </tr>
                                    <tr>
                                    	<td height="22" align="center" class="tdc"><strong>���ͷ�ʽ</strong></td>
                                    	<td height="22" align="left">
	                                    	<select name="fromclass" id="fromclass">
		                                        <option value="-1" <%=fromclass.equals("-1") ? "selected":""%>>����</option>
		                                        <option value="1"  <%=fromclass.equals("1") ? "selected":""%>>��֤��</option>
		                                        <option value="2" <%=fromclass.equals("2") ? "selected":""%>>У����</option>
	                                        </select>
                                    	</td>
                                    	<td height="22" align="center"  class="tdc"><strong></strong></td>
                                    	<td height="22" align="left"  class="tdc"></td>
                                    </tr>
                                    
                                    
                                    


                                  </table></td>
                              </tr>

                              <tr >
                                <td width="3%" height="25" align="center" nowrap="nowrap" class="tdc"><strong>���</strong></td>
                                <td width="8%" align="center" class="tdc"><strong>��֤�뷢��ʱ��</strong></td>
                                <td width="6%" align="center" nowrap="nowrap" class="tdc"><strong>��֤��</strong></td>
                                <td width="6%" align="center" nowrap="nowrap" class="tdc"><strong>IP</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>���պ���</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>����״̬</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>��֤���</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>ע�����</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>����ֵ</strong></td>
                                <td width="6%" align="center" class="tdc"><strong>���ͷ�ʽ</strong></td>
                              </tr>
                              <%
int record = 0;
String vcation = "";
String fromclassv = "";
for(int i =0;i < qr.resultList.size();i ++)
{
	
   record = record + 1;
   SendSms ss = (SendSms)qr.resultList.get(i);
   



%>

                              <tr>
                                <td width="3%" height="25" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td width="9%" align="center"><%=DateTools.dateToString(ss.getSysSubmitDate(),true)%></td>
                                <td width="6%" align="center"><%=ss.getVeryCode()%></td>
                                <td width="6%" align="center"><%=ss.getUserIp()%></td>
                                <td width="6%" align="center">

                                <%
                                    if(ss.getRegstatus() ==0)
                                    {out.println(ss.getMobileNumber());
                                %>
                                       <!-- <a href="edithyinfo.jsp?username=<%//=ss.getMobileNumber()%>&isdel=<%//=0%>" target="_blank"><%//=ss.getMobileNumber()%></a> -->
                                       
                                <%
                                    }else
                                       out.println(ss.getMobileNumber());
                                %>

                                </td>
                                <td width="7%" align="center"><%=ss.getReportStatus() == 0 ? "�ɹ�":"���ɹ�"%></td>
                                <%
                                	if(ss.getVcation()==null || ss.getVcation().equals("")){
                                		vcation = "δ֪";
                                	}else if (ss.getVcation()!=null && ss.getVcation()==1){
                                		vcation = "�ɹ�";
                                	}else if (ss.getVcation()!=null && ss.getVcation()==0){
                                		vcation = "���ɹ�";
                                		}
                                 %>
                                <td width="6%" align="center"><%=vcation%></td>
                                <td width="6%" align="center"><%=ss.getRegstatus() == 0 ? "�ɹ�":"���ɹ�"%></td>
                                <td width="6%" align="center"><%=ss.getReturnStr()==null ?"":ss.getReturnStr()%></td>
                                 <%
                                	if(ss.getFromclass()==null || ss.getFromclass().equals("")){
                                		fromclassv = "δ֪";
                                	}else if (ss.getFromclass()!=null && ss.getFromclass()==0){
                                		fromclassv = "ע��";
                                	}else if (ss.getFromclass()!=null && ss.getFromclass()==1){
                                		fromclassv = "��֤��";
                                	}else if (ss.getFromclass()!=null && ss.getFromclass()==2){
                                		fromclassv = "У����";
                                	}
                                 %>
                                <td width="6%" align="center"><%=fromclassv%></td>
                              </tr>
<%
}
%>
                              
                              <tr>
                                <td height="25" colspan="10" align="center"> ͬ�ڷ��ͳɹ���<%=sCount %> �� &nbsp;&nbsp; ���ͳɹ��ʣ�<%=df.format(k)   %>% 
                                	 &nbsp;&nbsp;��֤�ɹ��ʣ�<%=df.format(v)%>%&nbsp;&nbsp;ע��ɹ��ʣ�<%=df.format(j)%>%&nbsp;&nbsp;ͬ��ע��ɹ���<%=rCount %>��</td>
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
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>��&nbsp;<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="10" align="center">&nbsp;</td>
                              </tr>
                </table>
 </form>
</body>
</html>
<script>
function test(op)
{
  if(!confirm('ȷ�ϲ�����')) return false;
  document.go2to.bizaction.value=op;
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
<form name="sendpwd" action="sendpwd.jsp" method="post" >
  <input name="remobile" value="" type="hidden"/>
</form>
