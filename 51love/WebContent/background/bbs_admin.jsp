<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.*"%>
<%@page import="org.apache.commons.beanutils.DynaBean"%>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
String del = SysCommonFunc.getStrParameter(request,"del");
if(bizaction.length() > 0)
{
   String s = BBSMng.bbsAcc(request,adminLoginInfo,bizaction,del);
   
   if(s == null)
      out.println("<script langauge=javascript>alert('�����ɹ���');</script>");
   else
      out.println("<script langauge=javascript>alert('"+s+"��');</script>");
}
%>
<%
   String starttime = SysCommonFunc.getStrParameter(request,"starttime");
   String endtime   = SysCommonFunc.getStrParameter(request,"endtime");
   String sortid    = SysCommonFunc.getStrParameter(request,"sortid");
   String topic     = SysCommonFunc.getStrParameter(request,"topic");
   String username  = SysCommonFunc.getStrParameter(request,"username");
   String censor    = SysCommonFunc.getStrParameter(request,"censor");
   String ischeck   = SysCommonFunc.getStrParameter(request,"ischeck");
    String isTitle   = SysCommonFunc.getStrParameter(request,"isTitle");

   if(ischeck.length() ==0)
     ischeck = "0";
   List sortList = BBSMng.getAllSort();
   Hashtable ht = new Hashtable();
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;


   String sql = "from Bb as o where o.reId =0 ";
   if(starttime.length() > 0){
       sql = sql + " and o.stime >= to_date('"+starttime + "','YYYY-MM-DD')";
   }

   if(endtime.length() >0){
       sql = sql + " and o.stime <= to_date('"+endtime + "','YYYY-MM-DD')";
   }

   if(sortid.length() > 0){
       sql = sql + " and o.sortid = "+sortid;
   }
   if( topic.length() > 0){
       sql = sql + " and o.title like '%"+topic+"%'";
   }

   if(username.length() > 0){
       sql = sql + " and o.userName ='"+username+"'";
   }

   if(censor.length() > 0){
       sql = sql + " and o.censor = '"+censor+"'";
   }

   if(ischeck.length() > 0){
       sql = sql + " and ischeck = '"+ischeck+"'";
   }

   sql = sql + " order by  o.ontop desc,o.commend desc,o.stime desc";
System.out.println("bbs_admin.jsp--sql:"+sql);
   QueryResult qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
   String ctitle = "�����";
   if(ischeck.equals("2"))
     ctitle = "ɾ����";
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
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
}
a:active {
	text-decoration: none;
}
-->
</style></head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">��̳�������</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="bbs_admin.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <input type="hidden" name="cbbsid" value=""/>
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td height="25" colspan="13" align="center"><table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">

        <tr align="center" bgcolor="#FFFFFF">
          <td width="10%" align="center" class="tdc"><strong>�������</strong></td>
          <td width="14%" align="left" class="style3"><select name="sortid" id="sortid">
            <option value="">����</option>
            <%
            for(int i =0;i < sortList.size();i ++)
            {
               Bbssort bbssort = (Bbssort)sortList.get(i);

               ht.put(bbssort.getId().toString(),bbssort.getSortname());
               String se = "";
               if(sortid.equals(bbssort.getId().toString()))
                 se = "selected";
            %>
             <option value="<%=bbssort.getId()%>" <%=se%>><%=bbssort.getSortname()%></option>
            <%
            }
            %>
          </select>          </td>
          <td width="10%" align="center" class="tdc"><strong>����</strong></td>
          <td width="38%" align="left" class="style3"><input name="topic" type="text" class="input2" id="topic"  value="<%=topic%>" size="40"></td>
          <td width="12%" align="center" class="tdc"><strong>�����û���</strong></td>
          <td width="16%" align="left" class="style3"><input name="username" type="text" class="input3" id="username" size="15" value="<%=username%>"></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td class="tdc"><strong>��ѯʱ��</strong></td>
          <td colspan="3" align="left" class="style3"><input name="starttime" type="text" class="input3" id="starttime" value="<%=starttime%>" readonly>
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
                                    </script></td>
          <td align="center" class="tdc"><strong>�����</strong></td>
          <td align="left" class="style3"><input name="censor" type="text" class="input3" id="u_name2" size="15" value="<%=censor%>"></td>
        </tr>
        <tr align="center" bgcolor="#FFFFFF">
          <td align="center" class="tdc"><strong>�Ƿ����</strong></td>
          <td align="left" class="style3">
            <select name="ischeck" id="ischeck">
            <option value="0"  <%if(ischeck.equals("0")) out.print("selected");%>>�����</option>
            <option value="1"  <%if(ischeck.equals("1")) out.print("selected");%>>�����</option>
			<option value="2"  <%if(ischeck.equals("2")) out.print("selected");%>>��ɾ��</option>
              </select>          </td>
          <td align="center" class="tdc"><strong>��������</strong></td>
          <td align="left" class="style3">
              <select name="titleOrContent" id="isTitle">
              <option value="0"  selected="selected">��ѡ��</option>
              <option value="1"  <%if(isTitle.equals("1")) out.print("selected");%>>����</option>
              <option value="2"  <%if(isTitle.equals("2")) out.print("selected");%>>����</option>
          </select></td>
          <td align="left" class="style3"><input name="Submit" type="button" value="����" onclick="tijiaoSearch()"></td>
          <td align="left" class="style3">&nbsp;</td>
        </tr>

      </table></td>
    </tr>
    <tr >
      <td width="3%" height="30" align="center" class="tdc"></td>
      <td width="4%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>���</strong></td>
      <td width="14%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>�� �� ��</strong></td>
      <td width="3%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>�Ա�</strong></td>
      <td width="16%" height="30" align="center" class="tdc"><strong>����</strong></td>
      <td width="1%" height="30" align="center" nowrap class="tdc"><strong>ǰ̨Ч��</strong></td>
      <td width="1%" height="30" align="center" nowrap="nowrap" class="tdc"><strong> �ظ�</strong></td>
      <td width="8%" height="30" align="center" nowrap class="tdc"><strong> ����ʱ��</strong></td>
      <td width="7%" height="30" align="center" class="tdc"><strong><%=ctitle%></strong></td>
      <%
      	if(ischeck.equals("2"))
      	{
       %>
       <td width="7%" height="30" align="center" class="tdc"><strong>ɾ��ԭ��</strong></td>
       <%
       }
        %>
      <td width="6%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>���</strong></td>
      <td width="6%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>�ö�</strong></td>
      <td width="6%" height="30" align="center" nowrap="nowrap" class="tdc"><strong>����</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Bb b = (Bb)qr.resultList.get(i);
   String hischeck = "ͨ��";
   if(b.getIscheck().equals("0"))
     hischeck = "<a href=\"javascript:test('01','"+b.getId()+"');\">���</a>";
   if(b.getIscheck().equals("2"))
     hischeck = "<a href=\"javascript:test('07','"+b.getId()+"');\">�ָ�</a>";
   String ontop = null;
   if(b.getOntop().intValue() ==1)
     ontop = "<a href=\"javascript:test('02','"+b.getId()+"');\" class='cancel'>ȡ��</a>";
   else
     ontop = "<a href=\"javascript:test('03','"+b.getId()+"');\">�ö�</a>";
   String commend =  null;
   if(b.getCommend().intValue() ==1)
     commend = "<a href=\"javascript:test('04','"+b.getId()+"');\" class='cancel'>ȡ��</a>";
   else
     commend = "<a href=\"javascript:test('05','"+b.getId()+"');\">����</a>";
     
     String sqlt="select sex from userinfo where hyid ="+b.getUserId();
     List listt=QueryRecord.query(sqlt);
     DynaBean dbt =null;
     if(listt.size()>0)
     {
     	dbt=(DynaBean)listt.get(0);
     }
     String sex ="";
     if(dbt.get("sex")!=null && dbt.get("sex").equals("10"))
     {
     	sex="��";
     }
     else
     {
     	sex="Ů";
     }
%>
    <tr>
      <td width="3%" height="30" align="center"><input type="checkbox" name="bbsid" value=<%=b.getId()+":"+b.getUserId()+":"+b.getSortid()%>>      </td>
      <td width="4%" height="30" align="center"><%=(i+1)+(cpage-1)*pagesize%></td>
      <td width="14%" height="30" align="center"><a href='edithyinfo.jsp?id=<%=b.getUserId()%>' target="_blank"><%=b.getUserName()%></a></td>
      <td width="4%" height="30" align="center"><%=sex%></td>
       <%
          if("0".equals(ischeck)){
       %>
      <td width="30%" height="30" align="left"><a href="bbs_topic.jsp?id=<%=b.getId()%>" target="_blank"><%=b.getTitle()%></a></td>
        <%
            }else{
        %>
        <td width="30%" height="30" align="left">[<%=ht.get(b.getSortid().toString())%>]<a href="bbs_topic.jsp?id=<%=b.getId()%>" target="_blank"><%=b.getTitle()%></a></td>

        <%
            }
        %>
        <td width="1%" height="30" align="center"><a href="<%=request.getContextPath()%>/disp_bbs.jsp?bbsid=<%=b.getId()%>" target="_blank">�鿴</a></td>
      <td width="1%" height="30" align="center">
        <%
        if(b.getReCount() != null && b.getReCount().longValue() > 0)
        {
        %>
        <a href="bbs_retopic.jsp?retopicid=<%=b.getId()%>"><%=b.getReCount()%></a>
      <%
        }else
        {
           out.println("0");
        }
        %></td>
      <td width="10%" height="30" align="center"><%=DateTools.dateToString(b.getStime(),true)%></td>
      <td width="7%" height="30" align="center"><%=b.getCensor() == null ? "":b.getCensor()%></td>
        <%
      	if(ischeck.equals("2"))
      	{
       %>
       <td width="7%" height="30" align="center"><%=b.getReason()==null ? "":b.getReason() %></td>
       <%
       }
        %>
      <td width="6%" height="30" align="center"><%=hischeck%></td>
      <td width="6%" height="30" align="center"><%=ontop%></td>
      <td width="6%" height="30" align="center">
          <%=commend%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="15" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="15" align="center" valign="middle">
<%
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
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>��&nbsp;&nbsp;
<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr >
      <td height="30" colspan="15" align="center"><input type="button" name="Submit3" value="ɾ��" class="button1" onClick="test('06','');">
          <%--&nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(*)������ɾ��ԭ��</font><input type="text" name="del" id="del" size="20" maxlength="10">--%>

      </td>
    </tr>
    <tr >
      <td height="30" colspan="15" align="center">&nbsp;</td>
    </tr>
                                  <tr>
                                <td height="25" colspan="15" align="center">&nbsp;</td>
                              </tr>
</table>
 </form>


</body>
</html>
<script>
function test(op,bbsid)
{
  var msg = "";
  if(op == '01')
    msg = "ȷ�����ô?";
  if(op == '02')
    msg = "ȷ��ȡ���ö�ô?";
  if(op == '03')
    msg = "ȷ���ö�ô?";
  if(op == '04')
    msg = "ȷ��ȡ���Ƽ�ô?";
  if(op == '05')
    msg = "ȷ���Ƽ�ô?";
  if(op == '06')
  {
    msg = "ȷ��ɾ��ô?";
//    if(document.go2to.del.value == "")
//    {
//  	  alert("������ɾ��ԭ��");
//  	  return;
//    }
  }
  if(op == '07')
    msg = "ȷ�ϻָ�ô�� ";

  if(!confirm(msg))
    return;
  document.go2to.bizaction.value=op;
  document.go2to.cbbsid.value=bbsid;
  document.go2to.submit();
}
</script>
<script language="JavaScript">
function check()
{
if (checkspace(document.form1.adminname.value))
{
alert('���������Ա���ƣ�');
document.form1.adminname.focus();
return false;
}
if (checkspace(document.form1.adminpass.value))
{
alert('�����������ӹ���Ա�����룡');
document.form1.adminpass.focus();
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

    function tijiaoSearch(){
        document.go2to.cpages.value=1;
        document.go2to.submit();
    }
</script>
