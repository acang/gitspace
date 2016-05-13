<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.lover.*"%>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />


<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>
<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,19,0" width="1002" height="204">
      <param name="movie" value="images/top.swf" />
      <param name="quality" value="high" />
      <embed src="images/top.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="1002" height="204"></embed>
    </object>	</td>
  </tr>
  <tr>
    <td><img src="images/index_02.gif" width="1002" height="9" /></td>
  </tr>
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="174"><img src="images/index_03.gif" width="174" height="45" /></td>
        <td width="79"><a href="<%=request.getContextPath()%>/index.jsp"><img src="images/index_04.gif" border="0" /></a></td>
        <td width="96"><a href="<%=request.getContextPath()%>/grzq.jsp"><img src="images/index_05.gif" border="0" /></a></td>
        <td width="89"><a href="<%=request.getContextPath()%>/sszx.jsp"><img src="images/index_06.gif" border="0" /></a></td>
        <td width="91"><a href="<%=request.getContextPath()%>/hyzf.jsp"><img src="images/index_07.gif" border="0" /></a></td>
        <td width="90"><a href="<%=request.getContextPath()%>/bbs/"><img src="images/index_08.gif" border="0" /></a></td>
        <td width="88"><a href="<%=request.getContextPath()%>/wtjd.jsp"><img src="images/index_09.gif" border="0" /></a></td>
        <td width="88"><a href="<%=request.getContextPath()%>/kfzx.jsp"><img src="images/index_10.gif" border="0" /></a></td>
        <td><img src="images/index_11.gif" width="207" height="45" /></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td><img src="images/index_12.gif" width="1002" height="6" /></td>
  </tr>
  <tr>
    <td><table width="1002" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="33">&nbsp;</td>
        <td width="937" bgcolor="#255277"><img src="images/search/001.gif" width="936" height="22" /></td>
        <td width="32">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td height="140" valign="top" background="images/search/bg1.gif" bgcolor="#255277"><table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="193" align="right" valign="top"><table onclick="" style="cursor:pointer" width="185" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td><a href="new_allhy.jsp" target="_blank"><img src="images/search/01.gif" width="185" height="36" border="0" /></a></td>
              </tr>
              <tr>
                <td align="right" background="images/search/02.gif" width="185">
				<table width="148" border="0" cellspacing="0" cellpadding="0">
				<a href="../new_allhy.jsp" target="_blank">
                    <tr>
					
						<td align="left"><b>总注册：<%=(long)(CacheTools.getAll_user()*CacheTools.v1)%>人</b></td>
                    </tr>
                    <tr>
                     	<td align="left"><b>昨日新增：<%=(long)(CacheTools.getAllUserVday()*CacheTools.v3)%>人</b></td>
                    </tr>
                    <tr>
                       	<td align="left"><b>今日访问：<%=(long)(CacheTools.getAccessToday()*CacheTools.v4)%>人</b></td>
                    </tr>
                    <tr>
						<td align="left"><b>目前在线：<%=(long)(CacheTools.getAllOnline()*CacheTools.v5)%>人</b></td>
						
                    </tr>
					</a>
                </table>
				</td>
              </tr>
              <tr>
                <td><img src="images/search/03.gif" width="185" height="21" /></td>
              </tr>
            </table></td>
            <td width="729" style="padding-left:1px;"><table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-left:1px;margin-top:0px;">
  <tr>
    <td bgcolor="#A6C9EA" class="bk05" height="137" valign="top"><%@ include file="whq.jsp"%></td>
  </tr>
</table>
</td>
          </tr>

        </table>


</td>
        <td width="35" align="left"></td>
      </tr>
    </table></td>
  </tr>
</table>


