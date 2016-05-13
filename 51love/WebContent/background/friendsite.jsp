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

<%
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from friendsite where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
       tcount = 0;

   }

   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
   if(bizaction.equals("01"))
   {
      String cid = SysCommonFunc.getStrParameter(request,"opid");
      HbmOperator.executeSql("update friendsite set isok =1 where id= "+cid);
   }else if(bizaction.equals("02"))
   {
      String cid = SysCommonFunc.getStrParameter(request,"opid");
      HbmOperator.executeSql("update friendsite set isok =0 where id= "+cid);
   }else if(bizaction.equals("03"))
   {
      String cid = SysCommonFunc.getStrParameter(request,"opid");
      HbmOperator.executeSql("update friendsite set isok =1,isgood=1 where id= "+cid);
   }else if(bizaction.equals("04"))
   {
      String cid = SysCommonFunc.getStrParameter(request,"opid");
      HbmOperator.executeSql("update friendsite set isgood =0 where id= "+cid);
   }


   int pagesize = 20;

   ///�õ��û��б�
   String sql = "from Friendsite as o order by o.isok desc,o.xuhao asc ";

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

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;

   document.go2to.submit();
}
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">�������ӹ����ı�</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="friendsite.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" name="bizaction" value="">
                            <input type="hidden" name="opid" value="">
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="26" align="center" class="tdc"></td>
      <td width="56" height="30" align="center" class="tdc"><strong>���</strong></td>
      <td width="234" height="30" align="center" class="tdc"><strong>��վ����</strong></td>
      <td width="209" height="30" align="center" class="tdc"><strong>��ϵ�绰</strong></td>
      <td width="204" height="30" align="center" class="tdc"><strong> ��ϵ��</strong></td>
      <td width="204" height="30" align="center" class="tdc"><strong> �ύʱ��</strong></td>
      <td width="194" height="30" align="center" class="tdc"><strong> ״̬</strong></td>
      <td width="301" height="30" align="center" class="tdc"><strong>����</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Friendsite temp = (Friendsite)qr.resultList.get(i);
   String zt = "&nbsp;";

   if(temp.getIsok() ==1)
   {
     zt = "�����";
   }
   String shname = "���";
   String shhre  = "javascript:coper('01','"+temp.getId()+"');";
   String cclass = "info_link";
   if(temp.getIsok() == 1)
   {
     shname = "ȡ��";
     shhre  = "javascript:coper('02','"+temp.getId()+"');";
     cclass = "cancel";
   }

%>
    <tr>
      <td align="center"><input type="checkbox" name="delid" value=<%=temp.getId()%>></td>
      <td height="30" align="center"><%=temp.getXuhao()==null?0:temp.getXuhao().intValue()%></td>
      <td height="30" align="center"><a href='<%=temp.getSiteurl()%>' target="_blank"><%=temp.getSitename() == null ? "":temp.getSitename()%></a></td>
      <td height="30" align="center"><%=temp.getLogourl() == null ? "":temp.getLogourl()%></td>
      <td height="30" align="center"><%=temp.getSiteadmin() == null ? "":temp.getSiteadmin()%></td>
      <td height="30" align="center"><%=temp.getSitepassword() == null ? "":temp.getSitepassword()%></td>
      <td height="30" align="center"><%=zt%></td>
      <td height="30" align="center">

        <A href="<%=shhre%>" class='<%=cclass%>'><%=shname%></A>
        <A href="javascript:MM_openBrWindow('friendsiteupdate.jsp?id=<%=temp.getId()%>','dd','width=518,height=520,scrollbars=yes')  " class="info_link">�޸�</A>      </td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="11" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="11" align="center" valign="middle">
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
    <tr >
      <td height="30" colspan="11" align="center"><input type="submit" name="Submit3" value="ɾ��" class="button1" onClick="return test();">
        <a href="friendsiteupdate.jsp" class="button1">����</a></td>
    </tr>
    <tr >
      <td height="30" colspan="11">&nbsp;</td>
    </tr>
                                  <tr>
                                <td height="25" colspan="11" align="center">&nbsp;</td>
                              </tr>
</table>
 </form>




</body>
</html>
<script>
function test()
{
  if(!confirm('ȷ��ɾ����')) return false;
}
</script>
