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
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);


   if(adminLoginInfo.getFlag() == null || adminLoginInfo.getFlag().intValue() != 10)
   {
      out.println("<script language='javascript'>alert('�Բ�������Ȩ�������Ա�����ϣ�');history.go(-1);</script>");
      return;
   }
   
   String biz=SysCommonFunc.getStrParameter(request,"admin");
%>

<%
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from admininfo where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }
%>

<%
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///�õ��û��б�
   String sql = "from Admininfo as o ";
   
   if(biz.equals("1"))
   {
   	sql=sql+"where o.flag != 4";
   }
   if(biz.equals("2"))
   {
    sql=sql+"where o.flag = 4";
   }
   sql=sql+" order by  o.flag desc,o.regtime desc";
   QueryResult qr = null;

     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
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
function go()
{
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
        <td align="center">ά������Ա��Ϣ</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
			  <form name="go2to" method="Post" action="editadmin.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="23%" align="center" class="tdc"><strong>����Ա��ѯ</strong></td>
      <td width="77%" align="left">
      <input name="admin" type="radio" id="admin" value="1"  onclick="go()" <%=biz.equals("1")?"checked='checked'":""%>>����Ա
      &nbsp;&nbsp;&nbsp;&nbsp;
      <input name="admin" type="radio" id="adv" value="2" onclick="go()" <%=biz.equals("2")?"checked='checked'":""%>>�ƹ���
      </td>
    </tr>
  </table>
  <br/>
  <br/>                          
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="44" height="25" align="center" class="tdc"><div align="center"></div></td>
      <td width="262" height="25" align="center" class="tdc"><div align="center"><strong>�� �� ��</strong></div></td>
      <td width="228" height="25" align="center" class="tdc"><div align="center"><strong>�ܡ�����</strong></div></td>
      <td width="152" height="25" align="center" class="tdc"><div align="center"><strong> ��¼����</strong></div></td>
      <td width="191" height="25" align="center" class="tdc"><div align="center"><strong> �����¼ʱ��</strong></div></td>
      <td width="171" height="25" align="center" class="tdc"><div align="center"><strong>Ȩ������</strong></div></td>
      <td width="176" height="25" align="center" class="tdc"><div align="center"><strong>������ע</strong></div></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Admininfo temp = (Admininfo)qr.resultList.get(i);
   String flag = "����Ա";
   if(temp.getFlag() != null && temp.getFlag().intValue() ==10)
     flag = "����Ա";
   else if(temp.getFlag() != null && temp.getFlag().intValue() ==2)
     flag = "���Ա";
   else if(temp.getFlag() != null && temp.getFlag().intValue() ==3)
     flag = "��̳����";
   else if(temp.getFlag() !=null && temp.getFlag().intValue()==1)
     flag = "Ӫ������";
   else if(temp.getFlag() !=null && temp.getFlag().intValue()==5)
     flag = "�ƹ�����";
   else if(temp.getFlag() !=null && temp.getFlag().intValue()==4)
     flag = "�ƹ���";
   else if(temp.getFlag() != null && temp.getFlag().intValue() == 20)
     flag = "�������";
   else if(temp.getFlag() != null && temp.getFlag().intValue() == 30)
     flag = "�ͷ�����";
   else if(temp.getFlag() != null && temp.getFlag().intValue() == 40)
     flag = "���۹���";
   else if(temp.getFlag() != null && temp.getFlag().intValue() == 6)
     flag = "�շѹ���Ա";
%>
    <tr>
      <td height="25" align="center"><input type="checkbox" name="delid" value=<%=temp.getId()%>>        </td>
      <td height="25" align="center"><a href='editadmin.jsp?mid=<%=temp.getId()%>'><%=temp.getAdminname()%></a></td>
      <td height="25" align="center">********</td>
      <td height="25" align="center"><%=temp.getDlcs()%></td>
      <td height="25" align="center"><%=DateTools.dateToString(temp.getLasttime(),true)%></td>
      <td height="25" align="center"><%=flag%></td>
      <td height="25" align="center"><%=temp.getMemo()==null? "":temp.getMemo()%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="25" colspan="7" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="25" colspan="7" align="center" valign="middle">
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
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>��&nbsp;&nbsp;</td>
    </tr>
    <tr align="center" >
      <td height="25" colspan="7"><input type="submit" name="Submit3" value="ɾ��" class="button1" onClick="return test();"></td>
    </tr>
    <tr >
      <td height="25" colspan="7"> <div align="center">
      </div></td>
    </tr>
    <tr>
      <td height="25" colspan="11" align="center">&nbsp;</td>
    </tr>
</table>
 </form>
<%
String mid = SysCommonFunc.getStrParameter(request,"mid");
//out.println("<script langauge=javascript>alert('���Ѿ��ɹ����޸��˸��û�����Ϣ��');</script>");
if(mid.length() > 0)
{

   if(SysCommonFunc.getStrParameter(request,"bizaction").equals("01"))
   {
      String s = AdminMng.modAdmin(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('�޸��û���Ϣ�ɹ���');</script>");
         return;
      }else
      {
        out.println("<script langauge=javascript>alert('"+s+"');</script>");
      }
   }
   Admininfo mAdminfo = AdminMng.getAdmin("from Admininfo as o where o.id="+mid);
   if(mAdminfo == null)
   {
      out.println("<script langauge=javascript>alert('û���ҵ��û���Ϣ��');</script>");
      return;
   }
   int flag = 1;
   if(mAdminfo.getFlag() != null)
     flag = mAdminfo.getFlag().intValue();

%>
<form name="form1" method="post" action="editadmin.jsp">
  <input type="hidden" name="bizaction" value="01">
    <input type="hidden" name="mid" value="<%=mid%>">
<table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
  <tr >
    <td height="25" class="tdc"><div align="center"><strong>�� �� ��</strong></div></td>
    <td height="25" align="left"><input name="adminname" type="text" id="adminname" value="<%=mAdminfo.getAdminname()%>">    </td>
  </tr>
  <tr >
    <td height="25" class="tdc"><div align="center"><strong>�ܡ�����</strong></div></td>
    <td height="25" align="left"><input name="adminpass" type="password" id="adminpass" value="<%=mAdminfo.getAdminpass()%>">    </td>
  </tr>
  <tr >
    <td height="25" class="tdc"><div align="center"><strong>Ȩ������</strong></div></td>
    <td height="25" align="left">
    <input type="radio" name="flag" value="1"  <%if(flag == 1) out.print("checked");%>>
      Ӫ������
    <input type="radio" name="flag" value="2" <%if(flag == 2) out.print("checked");%>>
      ���Ա
      <input type="radio" name="flag" value="3"  <%if(flag == 3) out.print("checked");%>>
      ��̳����
          <input type="radio" name="flag" value="5"  <%if(flag == 5) out.print("checked");%>>
      �ƹ�����
      <input type="radio" name="flag" value="4"  <%if(flag == 4) out.print("checked");%>>
      �ƹ���
      <input type="radio" name="flag" value="10"  <%if(flag == 10) out.print("checked");%>>
      ����Ա
          <input type="radio" name="flag" value="20"  <%if(flag == 20) out.print("checked");%>>
      �������
             <input type="radio" name="flag" value="30"  <%if(flag == 30) out.print("checked");%>>
      �ͷ�����
      <input type="radio" name="flag" value="40"  <%if(flag == 40) out.print("checked");%>>
      ���۹���
       <input type="radio" name="flag" value="6"  <%if(flag == 6) out.print("checked");%>>
      �շѹ���Ա
    </td>
  </tr>
  <tr >
    <td height="25" class="tdc"><div align="center"><strong>������ע</strong></div></td>
    <td height="25" align="left"><input name="memo" type="text" id="memo" value="<%=mAdminfo.getMemo() == null? "":mAdminfo.getMemo()%>">    </td>
  </tr>
  <tr >
    <td height="25" colspan="2" align="center">
      <input type="submit" name="Submit2"  class="button1" value="�޸�" onClick="return check();">    </td>
  </tr>
</table>
<br>
  <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr>
      <td align="center"><span class="font12"><font color="#FF0000"><strong>ע�����⣺</strong>������޸����룬�벻Ҫ��д�κ���Ϣ</font></span></td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td>&nbsp;</td>
    </tr>
    <tr>
      <td><div align="center" class="font12"></div></td>
    </tr>
  </table>
</form>

<%
}
%>

</body>
</html>
<script>
function test()
{
  if(!confirm('ȷ��ɾ����')) return false;
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
if(!confirm('��ȷ��Ҫ�޸��ʺ�������')) return false;
}
function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}
</script>
