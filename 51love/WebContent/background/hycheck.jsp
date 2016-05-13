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
<%@ page import="com.lover.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%




Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
String hyid = SysCommonFunc.getStrParameter(request,"id");

if(hyid.length() ==0)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}
Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1")){
  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
}else{
	List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
    if(templist != null && templist.size() > 0)
    {
    	loginUser = (Userinfo)templist.get(0);
    }
}
//  loginUser = HYRegMng.getUserinfoByHyid(hyid);
if(loginUser == null)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}

//check add this day 

SimpleDateFormat subFormatter = new SimpleDateFormat("yyyy-MM-dd");
Date ldate=new Date();
try {
	ldate = subFormatter.parse(subFormatter.format(new Date()));
} catch (Exception e) {
}
SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
String dateString = "to_date('"+formatter.format(ldate) + "','YYYY-MM-DD HH24:MI:SS')";
String existsSql = "from checkinfo where hyid=" +hyid
		+" and time > " + dateString;
List existsList = HbmOperator.list("from Checkinfo where hyid=" +hyid +" and time > " + dateString);
int todayExists =((existsList!=null && existsList.size()>0)?1:0);

Date cdate = new Date(System.currentTimeMillis());
String currenttime = "";	
currenttime=DateTools.dateToString(cdate,false);

String status = SysCommonFunc.getStrParameter(request,"status");
String hidehyid = SysCommonFunc.getStrParameter(request,"hidehyid");
String nexttime = SysCommonFunc.getStrParameter(request,"nexttime");

if(hidehyid!=null&&hidehyid.trim().length()>0){
	System.out.println("hidehyid:"+ hidehyid);
	
	String tj = "0";
	
	if(SysCommonFunc.getStrParameter(request,"bizaction").equals("del")){
		String delString = SysCommonFunc.getStrParameter(request,"del");
	       String delsql = "update userinfo set isdel = 1,shr = '"+adminLoginInfo.getAdminname()+"',regtime4=sysdate, shqk = '"+delString+"' where hyid=" +hyid;
	       HbmOperator.executeSql(delsql);
	       
	       delsql = "delete from hytj  where tjid=" + hyid;
	       HbmOperator.executeSql(delsql);
	       
	       delsql = "update checkinfo set isdel = 1 where hyid=" + hyid;
	       HbmOperator.executeSql(delsql);
	       out.println("<script langauge=javascript>alert('����ɾ���ɹ���');</script>");
	}else if(SysCommonFunc.getStrParameter(request,"bizaction").equals("active")){
		String activesql = "update userinfo set isdel = 0, ISVCATION=1,VACSJTEL=1 where hyid=" +hyid;
	    HbmOperator.executeSql(activesql);
	    out.println("<script langauge=javascript>alert('��Ա����ɹ���');</script>");
	    List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
	    if(templist != null && templist.size() > 0)
	    {
	    	loginUser = (Userinfo)templist.get(0);
	    }
	}else{
		if(SysCommonFunc.getStrParameter(request,"bizaction").equals("1")){
			
			 String tjtime = subFormatter.format(new Date());
			 String tjsql = "update checkinfo set tj = 1,tjtime=to_date('"+tjtime+"','yyyy-MM-dd hh24:mi:ss') where hyid=" +hyid;
		     HbmOperator.executeSql(tjsql);
			 String usertjsql = "update userinfo set istj = 1 where hyid=" +hyid;
		     HbmOperator.executeSql(usertjsql);
		     List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
		    if(templist != null && templist.size() > 0)
		    {
		    	loginUser = (Userinfo)templist.get(0);
		    }
		     
		}else if(todayExists < 1&& SysCommonFunc.getStrParameter(request,"bizaction").equals("0")){
			String checkername = adminLoginInfo.getAdminname();
		   	String checkerid = SysCommonFunc.getStrParameter(request,"checkerid");
		   	String hyname = SysCommonFunc.getStrParameter(request,"hyname");
		   	String lcname = SysCommonFunc.getStrParameter(request,"lcname");
			
			Checkinfo checkinfo = new Checkinfo(2L,loginUser.getHyid(),0L,status,loginUser.getUsername(),loginUser.getLcname(),checkername,new Date(),
					DateTools.stringToDate(nexttime),loginUser.getIstj()+"",loginUser.getSex(),loginUser.getCsdate(),null);
			CheckinfoMng.addCheckInfo(checkinfo);
			String addUpdatesql = "update checkinfo set nexttime= to_date('"+nexttime+"','yyyy-MM-dd hh24:mi:ss') where hyid=" +hyid;
			HbmOperator.executeSql(addUpdatesql);
			status="";
			nexttime="";
		}
	}
}

String mid = SysCommonFunc.getStrParameter(request,"mid");
String modifyid = SysCommonFunc.getStrParameter(request,"modifyid");
if(modifyid.length()>0){
	 String modifynexttime = SysCommonFunc.getStrParameter(request,"modifynexttime");
	 String modifystatus = SysCommonFunc.getStrParameter(request,"modifystatus");
	 System.out.println("  aaa  "+modifystatus);
	 System.out.println("  bbb  "+modifynexttime);
	 String updatesql = "update checkinfo set checkername='"+adminLoginInfo.getAdminname()+"', status = '"+modifystatus+"', nexttime= to_date('"+modifynexttime+"','yyyy-MM-dd hh24:mi:ss') where id=" +modifyid;
   	HbmOperator.executeSql(updatesql);
   updatesql = "update checkinfo set nexttime= to_date('"+modifynexttime+"','yyyy-MM-dd hh24:mi:ss') where hyid=" +hyid;
   HbmOperator.executeSql(updatesql);
}




   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
      int allNumber = 0;
      int pagesize = 20;

      ///�õ��û��б�
      String sql = "from Checkinfo as o where o.hyid= "+hyid;
      sql = sql + " order by o.id desc";

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
<script src="../js/Popup.js"></script>
<script src="../js/tom_reg2.js"></script>

<script language="JavaScript">
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
<table width="80%" height="63"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">��˼�¼</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr>
    <td height="25" width="85%"><a href="edithyinfo.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա����</a>&nbsp;&nbsp;
      <a href="edithyinfoyj.jsp?id=<%=hyid%>&isdel=<%=isdel%>">Ӱ���ļ�</a>&nbsp;&nbsp;
      <a href="edithyinfoset.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a>&nbsp;&nbsp;
	<a href="edithyinfostat.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա״̬</a>&nbsp;&nbsp;
	<a href="edithyinfoupd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">������¼</a>&nbsp;&nbsp;
	<a href="hyxx.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ϣ�շ�</a>&nbsp;&nbsp;
	<a href="hyfw.jsp?id=<%=hyid%>&isdel=<%=isdel%>">���ʼ�¼</a>&nbsp;&nbsp;
	<a href="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա���</a>&nbsp;&nbsp;
	</td>
	<td width="15%">
	<a href="gogrzq.jsp?id=<%=hyid%>&isdel=<%=isdel%>" target="_blank">�������ר��</a>&nbsp;&nbsp;
      <!-- <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a> --></td>
  </tr>
  <%
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
	      
	      //����״̬
	      //��Ա�ȼ�
	      String hytype = "��ͨ";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
	         hytype = "�׽�";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
	         hytype = "VIP";
	         
	      String jyzt="";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT) 
	      	jyzt="�ȴ���";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
	      	jyzt="�������";
     %>
    <tr>
    <td height="25" colspan="8" >���ѣ���ǰ�޸ĵĻ�Ա��ţ�<STRONG><%=loginUser.getHyid()%></STRONG>�� ����ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getRegtime(),true)%></STRONG>����ע��ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getRegtime3(),true)%></STRONG>������½ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getLasttime(),true)%></STRONG>����
    </td>
  	</tr>
    <tr>
    <td height="25" colspan="8" >�û�����<STRONG><%=loginUser.getUsername()%></STRONG>�� �ǳƣ�<STRONG><%=loginUser.getLcname()%></STRONG>
     	����ע��IP��<STRONG><%=loginUser.getHttpip()%></STRONG>&nbsp;&nbsp;��Դ���<STRONG><%=map.get(loginUser.getVip()+"")%></STRONG>�� ����״̬��<STRONG><%=jyzt %></STRONG>�� ��Ա�ȼ���<STRONG><%=hytype%></STRONG>�� ����ֵ��<STRONG><%=loginUser.getHots().toString()%></STRONG>
    </td>
  	</tr>
</table>

<form name="go3to" method="post" action="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">
    <input type="hidden" name="hidehyid" value="<%=hyid%>">
    <input type="hidden" name="bizaction" value=""/>
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
  <tr >
    <td height="30" align="center" class="tdc"><strong>�����</strong></td>
    <td height="30" align="left"><input name="checkername" type="text" id="checkername"   value="<%=adminLoginInfo.getAdminname() %>" readonly="readonly"/></td>
    <td height="30" align="center" class="tdc"><strong> ���ʱ��</strong></td>
    <td height="30" align="left"><input name="time" type="text" id="time"  value="<%=currenttime %>" readonly="readonly"/></td>
    <td height="30" align="center" class="tdc"><strong>�´����ʱ��</strong></td>
    <td height="30" align="left"><input name="nexttime" type="text" id="nexttime" value="<%=nexttime %>" />
    
    <img src="../commonlib/calendar/img.gif" width="20" height="14" id="nendt">
                                  <script type="text/javascript">
    Calendar.setup({
        inputField     :    "nexttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d %H:%M:%S",       // format of the input field
        showsTime      :    true,            // will display a time selector
        button         :    "nendt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
                                </script>
    
    
    </td>
  </tr>
  <tr >
    <td height="30" align="center" class="tdc"><strong>������</strong></td>
    <td height="45" colspan="8" align="left">
    <textarea name="status" rows="2" id="status" style="width:98%;" ><%=status %></textarea>
    </td>
  </tr>
  <tr >
     <td height="30" colspan="6" align="center"> 
      <input type="submit" name="Submit2"  class="button1" value="�ύ" onClick="return valite('0');">    
      <%
      if("1".equals(loginUser.getIstj()+"")){
    %>
      	���Ƽ�    
    <%
      }else{
      %>
    	<input type="submit" name="Submit2"  class="button1" value="�Ƽ�" onClick="return valite('1');">
      <%
      }
      %>
      
      
      <%
      if("2".equals(loginUser.getIsdel()+"")){
    %>
      	<input type="submit" name="Submit2"  class="button1" value="����" onClick="return valite('active');">    
    <%
      }else if("0".equals(loginUser.getIsdel()+"")){
      %>
      �Ѽ���
      <%
      }
      %>   
     </td>
  </tr>
  <tr >
      <td height="30" colspan="6"> 
      <div align="center">
          <input type="submit" name="Submit2" value="ɾ��" class="button1" onClick="return testdel();">
          &nbsp;&nbsp;&nbsp;&nbsp;<font color="red">(*)������ɾ��ԭ��</font><input type="text" name="del" id="del" size="40">
      </div>
      </td>
    </tr>
  </table>
 </form>
 <script type="text/javascript">
 
 function valite(op){
	if("1"==op){
		if(!confirm('�û�Ա��Ҫ�Ƽ���')) return false;
	}else if("active"==op){
		if(!confirm('�û�Ա��Ҫ������')) return false;
	}else{
		if(<%=todayExists%> >0){
			alert("�������Ѿ��ύ�����޸�������˼�¼��");
	       	return false;
		}
	    var nowDate=new Date();
	    var startDate=document.getElementById("nexttime").value;
	    if (startDate==null || startDate.length<1)
	    {
	 		alert("�´����ʱ�䲻��Ϊ��");
	       	return false;
	    }
	    
	    var dateStrs = startDate.split("-");
	    var dateyear = parseInt(dateStrs[0], 10);
	    var datemonth = parseInt(dateStrs[1], 10) - 1;
	    var dateday = parseInt(dateStrs[2], 10);
	    var startDateCom = new Date(dateyear, datemonth, dateday);
	    
	    if (startDateCom<=nowDate){
	    	alert("�´����ʱ��Ӧ���ڽ���");
	        return false;
	    }
	}
    document.go3to.bizaction.value=op;
 }
 
 function testdel()
 {
   if(document.go3to.del.value == "")
   {
   	alert("������ɾ��ԭ��");
   	return false;
   }
   if(!confirm('ȷ��ɾ����')) return false;
   document.go3to.bizaction.value = "del";
 }
 
 
 </script>

<form name="go2to" method="Post" action="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">
<input type="hidden" name="cpages" value="<%=cpage%>" />
<input type="hidden" name="tcounts" value="<%=qr.rowCount%>" />
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
     <tr>
      <td width="5%" height="30" align="center" class="tdc"><strong>���</strong></td>
      <td width="10%" height="30" align="center" class="tdc"><strong>�����</strong></td>
      <td width="15%" height="30" align="center" class="tdc"><strong>���ʱ��</strong></td>
      <td width="50%" height="30" align="center" class="tdc"><strong>������</strong></td>
      <td width="15%" height="30" align="center" class="tdc"><strong>�´����ʱ��</strong></td>
      <td width="5%" height="30" align="center" class="tdc"><strong>�޸�</strong></td>
    </tr>
    <%
    for(int i =0;i < qr.resultList.size();i ++)
	{
  		 Checkinfo checkinfo = (Checkinfo)qr.resultList.get(i);
     %>
    
    <tr align="center">
    <td height="30"><%=(cpage-1)*pagesize+i+1%></td>
    <td height="30"><%=checkinfo.getCheckername()%></td>
    <td height="30"><%=DateTools.dateToString(checkinfo.getTime(),true)%></td>
    <%
    if((checkinfo.getId()+"").equalsIgnoreCase(mid)){
	%>
	
    	<td height="60">
    	<input type="hidden" name="modifyid" value="<%=checkinfo.getId()%>" />
    	<textarea name="modifystatus" rows="2" id="modifystatus" style="width:98%;" ><%=checkinfo.getStatus()%></textarea></td>
    	<td height="60">
    	<input name="modifynexttime" type="text" id="modifynexttime" value="<%=DateTools.DateToString(checkinfo.getNexttime(),"yyyy-MM-dd")%>" style="width:70%;"/>
    
    <img src="../commonlib/calendar/img.gif" width="20" height="14" id="modifytime">
        <script type="text/javascript">
		    Calendar.setup({
		        inputField     :    "modifynexttime",      // id of the input field
		        ifFormat       :    "%Y-%m-%d %H:%M:%S",       // format of the input field
		        showsTime      :    true,            // will display a time selector
		        button         :    "modifytime",   // trigger for the calendar (button ID)
		        singleClick    :    true,           // double-click mode
		        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
		    });
    
        </script>
    
    
    </td>
    	
    	
    	
    	<td height="60">
    	<input type="submit" name="Submit2" value="����" class="button1" >
    <%	
    }else{
    %>
    	<td height="30"><%=checkinfo.getStatus()%></td>
    	<td height="30"><%=DateTools.DateToString(checkinfo.getNexttime(),"yyyy-MM-dd HH:mm:ss")%></td>
    	<td height="30" nowrap="nowrap"><a href='hycheck.jsp?id=<%=hyid %>&isdel=0&mid=<%=checkinfo.getId()%>'>�޸�</a></td>
    <%
    }
    %>
    </tr>
    
    
    <%
    }
    %>
    <tr >
      <td height="30" colspan="8" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="8" align="center" valign="middle">
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
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>�� &nbsp;&nbsp;
<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    
    <%

     %>
</table>
     <input type="hidden" name="allnumbers" value="<%=allNumber%>">
</form>


<!-- pop up panel -->

</body>
</html>
