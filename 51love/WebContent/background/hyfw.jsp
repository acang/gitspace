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
if(loginUser == null)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
      int allNumber = 0;
//    String allNumbers =  SysCommonFunc.getStrParameter(request,"allnumbers");
//    if(allNumbers.length() > 0)
//      allNumber = Integer.parseInt(allNumbers);

	String sql ="from Uservisit as o where o.hyid = "+hyid +" order by o.id desc";
	
	
    int pagesize = 20;

    int allPreNumber = 0;
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

</head>

<body>
<table width="80%" height="63"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">���ʼ�¼</td>
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
	<!-- <a href="hybjd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">�׽𶹼�¼</a>&nbsp;&nbsp;	 -->
	<a href="hyxx.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ϣ�շ�</a>&nbsp;&nbsp;
	<a href="hyfw.jsp?id=<%=hyid%>&isdel=<%=isdel%>">���ʼ�¼</a>&nbsp;&nbsp;
	<a href="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա���</a>&nbsp;&nbsp;
	  <!-- <a href="edithyinfoxxjs.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ϣ��������</a>&nbsp;&nbsp; -->
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


<form name="go2to" method="Post" action="hyfw.jsp?id=<%=hyid%>&isdel=<%=isdel%>">
<input type="hidden" name="cpages" value="<%=cpage%>" />
<input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
<table width="80%" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
     <tr>
      <td width="4%" height="30" align="center" class="tdc"><strong>���</strong></td>
      <td width="15%" height="30" align="center" class="tdc"><strong>����ʱ��</strong></td>
      <td height="30" align="center" class="tdc"><strong>����ҳ��</strong></td>
    </tr>
    <%
    for(int i =0;i < qr.resultList.size();i ++)
	{
  		 Uservisit uservisit = (Uservisit)qr.resultList.get(i);
     %>
    
    <tr align="center">
    <td height="30"><%=(cpage-1)*pagesize+i+1%></td>
    <td height="30"><%=DateTools.dateToString(uservisit.getVtime(),true)%></td>
    <td height="30"><a href="<%=uservisit.getVurl()%>" target="_blank"><%=uservisit.getVurl()%></a></td>
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


</body>
</html>
