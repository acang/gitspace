<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%
  Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  String tjid = (String)session.getAttribute("tjid");
  if(tjid != null && tjid.length() > 0)
  {
    //�����Ƽ��û���Ϣ
    try
    {
    Hytj hytj = new Hytj();
    hytj.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_HYTJ"));
    Userinfo utemp = HYRegMng.getUserinfoByHyid(tjid);

    hytj.setMyid(utemp.getHyid());
    hytj.setMyname(utemp.getUsername());
    hytj.setTjdate(new Date(System.currentTimeMillis()));
    hytj.setTjid(loginUser.getHyid());
    hytj.setTjname(loginUser.getLcname());
    HbmOperator.insert(hytj);
    }catch(Exception e)
    {
    }
    session.removeAttribute("tjid");
   }
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<title>www.51lover.org</title>
<style type="text/css">

<!--
body {
}
-->
</style>
<script type="text/javascript">
var _bdhmProtocol = (("https:" == document.location.protocol) ? " https://" : " http://");
document.write(unescape("%3Cscript src='" + _bdhmProtocol + "hm.baidu.com/h.js%3F9f77dbe500dc55538bd80add7b45eac4' type='text/javascript'%3E%3C/script%3E"));
</script>
<%
///if��½

if(loginUser != null)
{
%>

<div align="center"> <br/>  <br/><br/><br/><br/><br/>
  <p><font color="#0C5178" size="5"><strong>�� �� �� ����</strong></font></p>
   <p><strong><font color="#0C5178"> ����֤�����ֻ����룬�Ա�������֤��ʶ��ͬʱ�߱��ֻ����ŵ�½���ܣ�</font></strong></p>
     <input type="button" name="Submit" value="ȷ    ��" onClick="javascript:location.replace('grsjyz.jsp')">
  <p>

<%
String advid = (String)session.getAttribute("advid");
if(advid != null && advid.equals("1"))
{
%>
<!-- Google Code for signup Conversion Page -->
<script language="JavaScript" type="text/javascript">
<!--
var google_conversion_id = 1057143543;
var google_conversion_language = "zh_CN";
var google_conversion_format = "1";
var google_conversion_color = "666666";
if (1) {
  var google_conversion_value = 1;
}
var google_conversion_label = "signup";
//-->
</script>
<script language="JavaScript" src="http://www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<img height=1 width=1 border=0 src="http://www.googleadservices.com/pagead/conversion/1057143543/imp.gif?value=1&label=signup&script=0">
</noscript>

<!-- Google Code for ��Ӫ������ -->
<!-- Remarketing tags may not be associated with personally identifiable information or placed on pages related to sensitive categories. For instructions on adding this tag and more information on the above requirements, read the setup guide: google.com/ads/remarketingsetup -->
<script type="text/javascript">
/* <![CDATA[ */
var google_conversion_id = 1057143543;
var google_conversion_label = "u6RhCK2u6wMQ9_WK-AM";
var google_custom_params = window.google_tag_params;
var google_remarketing_only = true;
/* ]]> */
</script>
<script type="text/javascript" src="//www.googleadservices.com/pagead/conversion.js">
</script>
<noscript>
<div style="display:inline;">
<img height="1" width="1" style="border-style:none;" alt="" src="//googleads.g.doubleclick.net/pagead/viewthroughconversion/1057143543/?value=0&amp;label=u6RhCK2u6wMQ9_WK-AM&amp;guid=ON&amp;script=0"/>
</div>
</noscript>
<%
}
%>
</p>
</div>
<%
}
  else
{
   response.sendRedirect("index.jsp");
}

%>


</body>

</html>
