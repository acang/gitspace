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
if(isdel.equals("1"))
  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
else
  loginUser = HYRegMng.getUserinfoByHyid(hyid);
if(loginUser == null)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}

   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   
	String content = SysCommonFunc.getStrParameter(request,"liuyan");
	if(!content.equals(""))
	{
      Date now = new Date();
      try
      {
        Hyly hyly = new Hyly();
        hyly.setId(SysCommonFunc.getSequenceIdForOracle(SysDefine.SEQ_HYLY));
        hyly.setFromid(new Long(0));
        hyly.setFromname(adminLoginInfo.getAdminname());
        hyly.setHyid(loginUser.getHyid());
        hyly.setHyname(loginUser.getUsername());
        hyly.setLytime(now);
        hyly.setContent(content);
        HbmOperator.insert(hyly);
        out.println("<script language='javascript'>alert('���ѳɹ���������');</script>");
      }catch(Exception e)
      {
        System.out.println(e.getMessage());
        out.println("<script language='javascript'>alert('���Գ���');</script>");
      }

	}
	String sql ="from Hyly as o where (o.fromid = 0 or fromid = -1) and hyid = '"+loginUser.getHyid()+ "' order by id desc";
	Hyly hy=null;
	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
    int pagesize = 20;
    
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
        <td align="center">����</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr>
    <td height="25" width="87%"><a href="edithyinfo.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա����</a>&nbsp;&nbsp;
      <a href="edithyinfoyj.jsp?id=<%=hyid%>&isdel=<%=isdel%>">Ӱ���ļ�</a>&nbsp;&nbsp;
      <a href="edithyinfoset.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��������</a>&nbsp;&nbsp;
	<a href="edithyinfostat.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա״̬</a>&nbsp;&nbsp;
	</td>
	<td>
	<a href="gogrzq.jsp?id=<%=hyid%>&isdel=<%=isdel%>" target="_blank">�������ר��</a>&nbsp;&nbsp;
      <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a></td>
  </tr>
  <tr>
    <td height="25">���ѣ���ǰ�޸ĵĻ�Ա��ţ�<STRONG><%=loginUser.getHyid()%></STRONG>�����û�����<STRONG><%=loginUser.getUsername()%></STRONG>�����ǳƣ�<STRONG><%=loginUser.getLcname()%></STRONG></td>
  </tr>
</table>
<form name="personal" id="personal" method="post" action="talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>"  >
<table  width="45%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr align="center">
  <td>
  �������ݣ�
  </td>
  <td>
  <textarea rows="10" cols="60" id="liuyan" name="liuyan"></textarea>
  </td>
  </tr>
</table>


 <table  width="45%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
  <tr align="center">
  <td style="padding-left:50px">
    <p>&nbsp;</p>
    <p>
      <input type="submit" name="submit" value="ȷ��"> 
       </p></td>
  
</table>
</form>

<form name="go2to" method="Post" action="talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">
<input type="hidden" name="cpages" value="<%=cpage%>" />
<input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
<table align="center" width="60%" border="0">
     <tr>
      <td width="4%" height="30" align="center" class="tdc"><strong>���</strong></td>
      <td width="10%" height="30" align="center" class="tdc"><strong>����ʱ��</strong></td>
      <td width="26%" height="30" align="center" class="tdc"><strong>��������</strong></td>
      <td width="8%" height="30" align="center" class="tdc"><strong>������</strong></td>
    </tr>
    <%
    if(qr.resultList.size() > 0)
	{
  		 for(int i =0;i < qr.resultList.size();i ++)
              {
                 Hyly hyly = (Hyly)qr.resultList.get(i);
     %>
    <tr align="center">
    <td><%=hyly.getId()%></td>
    <td><%=sdf.format(hyly.getLytime())%></td>
    <td><%=hyly.getContent() %></td>
    <td><%=hyly.getFromname() %></td>
    </tr>
    
    
    <%
    }
    %>
    
    <tr >
      <td height="30" colspan="7" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="7" align="center" valign="middle">
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
    }
     %>
</table>
</form>


  <table id="t1"  width="80%" border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
<tr>
<td>&nbsp;</td>
</tr>
</table>

</body>
</html>
