<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
   String fsr    = SysCommonFunc.getStrParameter(request,"fsr");
    String s1    = SysCommonFunc.getStrParameter(request,"s1");
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
    String ageStart   = SysCommonFunc.getStrParameter(request,"ageStart");
    int ageStarts = SysCommonFunc.getNumberFromString(ageStart,1);
    String ageEnd   = SysCommonFunc.getStrParameter(request,"ageEnd");
    int ageEnds = SysCommonFunc.getNumberFromString(ageEnd,1);

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   int pagesize = 30;

   ///�õ��û��б�
   String sql = "select q.*,u.LCNAME,u.lasttime,u.CSDATE,u.S1,u.S2,u.USERNAME,u.HYID,u.ISDEL,u.sex from DB_QIUBOFS q join USERINFO u on q.SENDUSERID=u.HYID  where 1=1 ";

    if(ageStarts>1 && ageEnds>1 && ageEnds>ageStarts){
        Calendar cal = Calendar.getInstance();
        cal.setTime(new Date());
        int start = cal.get(Calendar.YEAR)-ageEnds;
        int end = cal.get(Calendar.YEAR)-ageStarts;
        String sDate=start+"-01-01";
        String eDate=end+"-12-31";
        sql = sql + " and u.CSDATE>=to_date('"+sDate+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate+"','YYYY-MM-DD')";
    }

    if(s1.length() > 0)
    {
        sql = sql + " and u.s1 like '%"+s1+"%'";
    }
   if(fsr.length() > 0)
   {
     sql = sql + " and u.USERNAME like '%"+fsr+"%'";
   }

   if(starttime.length() > 0)
   {
     sql = sql + " and q.SENDTIME >= to_date('"+starttime + "','YYYY-MM-DD')";

   }

   if(endtime.length() > 0)
   {
     sql = sql + " and q.SENDTIME <= to_date('"+endtime+" 23:59:59" + "','YYYY-MM-DD HH24:MI:SS')";

   }

   sql = sql + " order by q.id desc";
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
        <td align="center">�ﲨƥ���</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="searchqiubo.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >

                              <tr >
                                <td height="25" colspan="8" align="left">
                                <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
                                    <tr>
                                        <td width="10%" height="22" align="center" class="tdc"><strong>����</strong></td>
                                        <td width="10%" height="22" align="left"> <select name="s1" id="s1" >
                                            <option value="">��ѡ��</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="���" <%="���".equals(s1)?"selected":""%>>���</option>
                                            <option value="�ӱ�" <%="�ӱ�".equals(s1)?"selected":""%>>�ӱ�</option>
                                            <option value="ɽ��" <%="ɽ��".equals(s1)?"selected":""%>>ɽ��</option>
                                            <option value="���ɹ�" <%="���ɹ�".equals(s1)?"selected":""%>>���ɹ�</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="������" <%="������".equals(s1)?"selected":""%>>������</option>
                                            <option value="�Ϻ�" <%="�Ϻ�".equals(s1)?"selected":""%>>�Ϻ�</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="�㽭" <%="�㽭".equals(s1)?"selected":""%>>�㽭</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="ɽ��" <%="ɽ��".equals(s1)?"selected":""%>>ɽ��</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="�㶫" <%="�㶫".equals(s1)?"selected":""%>>�㶫</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="�Ĵ�" <%="�Ĵ�".equals(s1)?"selected":""%>>�Ĵ�</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="�ຣ" <%="�ຣ".equals(s1)?"selected":""%>>�ຣ</option>
                                            <option value="����" <%="����".equals(s1)?"selected":""%>>����</option>
                                            <option value="�½�" <%="�½�".equals(s1)?"selected":""%>>�½�</option>

                                        </select></td>
                                      <td width="10%" height="22" align="center" class="tdc"><strong>ƥ���û���</strong></td>
                                      <td width="15%" height="22" align="left"><input name="fsr" type="text" id="fsr" value="<%=fsr%>"></td>
                                      <td width="10%" height="22" align="center" class="tdc"><strong>ƥ��ʱ��</strong></td>
                                     <td height="22" colspan="3" align="left"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                      &nbsp;����&nbsp;&nbsp;<input name="endtime" type="text" class="input3" id="endtime" value="<%=endtime%>" readonly>
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
                                        </script>&nbsp;
                                       </td>
                                      </td>
                                    </tr>
                                  </table></td>
                              </tr>
                                <tr>
                                    <td height="35"  align="center"class="tdc"><strong>����</strong></td>
                                    <td height="35"  align="center"> <input type="text" size="3" name="ageStart" value="<%=ageStart%>"> ~ <input type="text" size="3" name="ageEnd" value="<%=ageEnd%>"></td>
                                    <td height="35" colspan="6" align="center">  <input name="Submit" type="submit" class="button1" value="��ѯ">  </td>
                                </tr>
                              <tr >
                                <td width="8%" height="25" align="center" nowrap="nowrap" class="tdc"><strong>���</strong></td>
                                <td width="16%" align="center" class="tdc"><strong>�ﲨƥ��ʱ��</strong></td>
                                <td width="16%" align="center" nowrap="nowrap" class="tdc"><strong>�û���</strong></td>
                                <td width="8%" align="center" class="tdc"><strong>�Ա�</strong></td>
                                <td width="13%" align="center" class="tdc"><strong>�ǳ�</strong></td>
                                <td width="12%" align="center" class="tdc"><strong>����</strong></td>
                                <td width="11%" align="center" class="tdc"><strong>����</strong></td>
                                <td width="16%" align="center" class="tdc"><strong>��¼ʱ��</strong></td>
                              </tr>
                              <%
DynaBean dbl=null;
String vs1="";
String vs2="";
String zz="";
for(int i =0;i < qr.resultList.size();i ++)
{
   dbl=(DynaBean)qr.resultList.get(i);
   vs1 = dbl.get("s1") == null? "":dbl.get("s1").toString();
   vs2 = dbl.get("s2") == null? "":dbl.get("s2").toString();
   zz = vs1+vs2;
   if(zz.equals("��������"))
     zz = "����";
   if(zz.equals("�Ϻ��Ϻ�"))
     zz = "�Ϻ�";
   if(zz.equals("������"))
     zz = "���";
   if(zz.equals("��������"))
     zz = "����";
   if(zz.equals("������"))
     zz = "���";
   if(zz.equals("���Ű���"))
     zz = "����";
     
   Date csdate = (Date)dbl.get("csdate");
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "δ֪";
   String sex="";
   if (dbl.get("sex")!=null && dbl.get("sex").equals("10")){
   	 sex="��";
   }else if (dbl.get("sex")!=null && dbl.get("sex").equals("11")){
   	 sex="Ů";
   }
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
%>

                              <tr>
                                <td width="8%" height="25" align="center"><%=((cpage-1)*pagesize+i+1)%></td>
                                <td align="center"><%=DateTools.dateToString((Date)dbl.get("sendtime"),true)%></td>
                                <td align="center"><a href="edithyinfo.jsp?id=<%=dbl.get("hyid")%>&isdel=<%=dbl.get("isdel")%>" target="_blank"><%=(String)dbl.get("username")%></a></td>
                                <td align="center"><%=sex%></td>
                                <td align="center"><%=dbl.get("lcname")%></td>
                                <td align="center"><%=zz%></td>
                                <td align="center"><%=age%></td>
                                <td align="center"><%=DateTools.dateToString((Date)dbl.get("lasttime"),true)%></td>
                              </tr>
                              <%
}
%>


                              <tr>
                                <td height="25" colspan="7" align="center">&nbsp;</td>
                              </tr>
                              <tr>
                                <td height="25" colspan="7" align="center"><%
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
                                <td height="25" colspan="7" align="center">&nbsp;</td>
                              </tr>
                                                            <tr>
                                <td height="25" colspan="7" align="center">&nbsp;</td>
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
