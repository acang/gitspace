<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>

<%
Wtjd wtjd = WTJDMng.getGgNews();
%>

<table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td width="30"><img src="images/index_19.gif" width="30" height="35" /></td>
        <td background="images/index_20.gif" class="tit01"><table width="630" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td width="120">[51�������Ĺ���]</td>
            <td width="500"><%
                    if(wtjd != null){
                      %>
                <marquee style="width:99%" onMouseOver="this.stop();" onMouseOut="this.start();" scrolldelay="2" scrollamount="2">
                  <a href="../gonggao.jsp?id=<%=wtjd.getId()%>"  target="_blank"> <%=wtjd.getAsk()%> </a>
                </marquee>
            <% }%></td>
          </tr>
        </table></td>
        <td width="30"><img src="images/index_22.gif" width="30" height="35" /></td>
      </tr>
    </table>

<%
//�ж��û�����
  Userinfo grwhqUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  int flag = 0;
  if(grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
    flag = SysDefine.SYSTEM_HY_TYPE_vip;
  else if(grwhqUser != null)
    flag = SysDefine.SYSTEM_HY_TYPE_NOR;
%>
<%
if(flag==0)
{
%>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09">����!��ӭ����51��������</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>���ĵȼ���</strong></td>
            <td width="90%" class="style02">�ο�   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ʣ�����ޣ�</strong>��</strong> </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>����Ȩ�ޣ�</strong></td>
            <td class="style02">3�������������鿴��Ա�������ϡ���Ȩ�鿴��ϵ��ʽ��</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_NOR)
{
%>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> ����!��ӭ����51��������</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>���ĵȼ���</strong><br /></td>
            <td width="90%" class="style02">��ͨ��Ա   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ʣ�����ޣ�</strong>&nbsp;�� </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>����Ȩ�ޣ�</strong></td>
            <td class="style02">5�������������鿴��Ա�������ϡ���Ȩ�鿴��ϵ��ʽ��<br />
              ����չʾ�Լ����ϣ������趨���ϵĿ��ţ������ﲨ��</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_vip)
{
%>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> ����!��ӭ����51��������</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>���ĵȼ���</strong><br /></td>
            <td width="90%" class="style02">�׽�VIP��Ա   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ʣ�����ޣ�</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%> </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>����Ȩ�ޣ�</strong></td>
            <td class="style02">ʮ���������������鿴���л�Ա�������ϼ���ϵ��ʽ��<br />
            ��ͨ��Ա��ȫ��Ȩ�ޣ������ڲ������䡢��������/����������ҳ�Ƽ�������)</td>
          </tr>
</table>
<%
}
%>



