<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>

<%
/// ��ͨ��Ա�����ܽ��лظ�
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  if(loginUser == null)
  {
    out.println("<script language='javascript'>alert('��¼�ѳ�ʱ�������µ�¼��');history.go(-1);</script>");
    return;
  }
//  if(loginUser.getFlag() == null || loginUser.getFlag().longValue() != SysDefine.SYSTEM_HY_TYPE_vip)
//  {
//    out.println("<script language='javascript'>alert('������ͨ��Ա������Ȩ�޲�����������Ϊvip��Ա');parent.parent.location.replace('hyzf.jsp');</script>");
//    return;
//  }

//set rs1=server.createobject("adodb.recordset")
//rs1.open "select top 1 setzt from hyset where hyid="&request("fromid"),conn,1,1
//if rs1("setzt")=6 then
//<script language=javascript>
//alert("�û�Ա����������ţ�")
//window.close()
//</script>





  String fromid = SysCommonFunc.getStrParameter(request,"fromid");
  String fromname = SysCommonFunc.getStrParameter(request,"fromname");
  String dates = DateTools.dateToString(new Date(System.currentTimeMillis()),true);

if(request.getParameter("bj") != null)
{
   String s = GRZQMng.addHyly(request,loginUser);
   if(s == null)
      out.println("<script language='javascript'>alert('���Ѿ��ɹ�����������!');window.parent.close();</script>");
   else
      out.println("<script language='javascript'>alert('"+s+"!');window.parent.close();</script>");
   return;
}
%>


<link href="style.css" rel="stylesheet" type="text/css">
<body>
<form name="form1" method="post" action="reperly.jsp?bj=1">
<table width="600" height="400" border="0" cellspacing="0" cellpadding="0" align="center">
    <tr ><td height="100px"></td></tr>
  <tr>
    <td  ><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="9" >&nbsp;</td>
        <td valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="1" bgcolor="#234D74">
          <tr>
            <td colspan="2" align="center" bgcolor="#5B8EBD" class="tit13">51�������ģ���Ա����ϵͳ</td>
            </tr>
          <tr>
            <td width="26%" align="right" bgcolor="#D6E6F3" class="tit14"><font color="#000000">���������ߣ�</font></td>
            <td width="74%" bgcolor="#FFFFFF" class="tit12"><div align="left" class="tit06"><%=loginUser.getLcname()%></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#D6E6F3" class="tit14"><font color="#000000">���������ߣ�</font></td>
            <td bgcolor="#FFFFFF" class="tit12"><div align="left" class="tit03"><%=fromname%>
	   <input type="hidden" name="hyname" value="<%=fromname%>">
            <input type="hidden" name="hyid" value="<%=fromid%>"></div></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#D6E6F3" class="tit14"><font color="#000000">����ʱ�䣺</font></td>
            <td bgcolor="#FFFFFF"><span style="font-size:12px"><%=dates%></span><input type="hidden" name="lytime" value="<%=dates%>"></td>
          </tr>
          <tr>
            <td align="right" bgcolor="#D6E6F3" class="tit14"><font color="#000000">�������ݣ�</font></td>
            <td bgcolor="#FFFFFF"><label>
              <textarea name="content" cols="35" rows="10" style="width:400px;"></textarea>
            </label></td>
          </tr>
          <tr>
            <td height="40" colspan="2" align="center" bgcolor="#FFFFFF">
              <input type="image" name="Submit" src="./images/btn_tjly.gif" />
</td>
            </tr>
        </table></td>
        <td width="11" valign="top">&nbsp;</td>
      </tr>
    </table></td>
  </tr>

</table>
</form>

</body>
</html>
