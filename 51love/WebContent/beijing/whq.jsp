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
            <td width="120">[51交友中心公告]</td>
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
//判断用户类型
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
            <td colspan="2" align="center" class="tit09">您好!欢迎来到51交友中心</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong></td>
            <td width="90%" class="style02">游客   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>剩余期限：</strong>无</strong> </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">3个搜索条件，查看会员交友资料。无权查看联系方式。</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_NOR)
{
%>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> 您好!欢迎来到51交友中心</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong><br /></td>
            <td width="90%" class="style02">普通会员   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;剩余期限：</strong>&nbsp;无 </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">5个搜索条件，查看会员交友资料。无权查看联系方式。<br />
              长期展示自己资料，自主设定资料的开放，发送秋波。</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_vip)
{
%>
        <table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> 您好!欢迎来到51交友中心</td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>您的等级：</strong><br /></td>
            <td width="90%" class="style02">白金VIP会员   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>剩余期限：</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%> </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>您的权限：</strong></td>
            <td class="style02">十三个搜索条件，查看所有会员交友资料及联系方式。<br />
            普通会员的全部权限，受赠内部留言箱、好友名单/黑名单。首页推荐（附照)</td>
          </tr>
</table>
<%
}
%>



