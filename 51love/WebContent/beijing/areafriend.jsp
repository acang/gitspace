<%@ page contentType="text/html; charset=GBK" %>
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
   String sex = SysCommonFunc.getStrParameter(request,"sex");
   if(sex.length() ==0)
     sex = "0";
   String hyzk  = SysCommonFunc.getStrParameter(request,"hyzk");
   if(hyzk.length() ==0)
     hyzk = "0";

  String address = SysCommonFunc.getStrParameter(request,"address");
  if(address.length() ==0)
  {
     String uri = request.getRequestURI();
     if(uri.indexOf("beijing") > -1)
       address = "beijing";
     else if(uri.indexOf("guangdong") > -1)
       address = "guangdong";
     else if(uri.indexOf("shanghai") > -1)
       address = "shanghai";
     else if(uri.indexOf("jiangsu") > -1)
       address = "jiangsu";
     else if(uri.indexOf("shandong") > -1)
       address = "shandong";
     else if(uri.indexOf("zhejiang") > -1)
       address = "zhejiang";
     else if(uri.indexOf("hunan") > -1)
       address = "hunan";
     else if(uri.indexOf("henan") > -1)
       address = "henan";
     else if(uri.indexOf("sichuan") > -1)
       address = "sichuan";
     else if(uri.indexOf("hubei") > -1)
       address = "hubei";
     else if(uri.indexOf("hebei") > -1)
       address = "hebei";
     else if(uri.indexOf("liaoning") > -1)
       address = "liaoning";
      else if(uri.indexOf("nanjing") > -1)
       address = "nanjing";
      else if(uri.indexOf("tianjin") > -1)
       address = "tianjin";
       else if(uri.indexOf("chongqing") > -1)
       address = "chongqing";
       else if(uri.indexOf("guangzhou") > -1)
       address = "guangzhou";
       else if(uri.indexOf("shenzhen") > -1)
       address = "shenzhen";
       else if(uri.indexOf("chengdu") > -1)
       address = "chengdu";
       else if(uri.indexOf("wuhan") > -1)
       address = "wuhan";
       else if(uri.indexOf("xian") > -1)
       address = "xian";
       else if(uri.indexOf("zhengzhou") > -1)
       address = "zhengzhou";
       else if(uri.indexOf("suzhou") > -1)
       address = "suzhou";
       else if(uri.indexOf("jinan") > -1)
       address = "jinan";
       else if(uri.indexOf("hangzhou") > -1)
       address = "hangzhou";
       else if(uri.indexOf("changsha") > -1)
       address = "changsha";
       else if(uri.indexOf("qingdao") > -1)
       address = "qingdao";
       else if(uri.indexOf("shijiazhuang") > -1)
       address = "shijiazhuang";
       else if(uri.indexOf("dongguan") > -1)
       address = "dongguan";
       else if(uri.indexOf("haerbin") > -1)
       address = "haerbin";
       else if(uri.indexOf("shenyang") > -1)
       address = "shenyang";
       else if(uri.indexOf("hefei") > -1)
       address = "hefei";
       else if(uri.indexOf("taiyuan") > -1)
       address = "taiyuan";
       else if (uri.indexOf("fuzhou") >-1)
       address = "fuzhou";
       else if (uri.indexOf("dalian")>-1)
       address = "dalian";
       
     
  }



   String address1="";
   String s2 = "";
   if(address.equals("dalian"))
   {
   		s2 = "����";
   }
   if(address.equals("beijing"))
   {
   		address1="����";
   }
   if(address.equals("nanjing"))
   {
   		//address1="����";
   		s2 = "�Ͼ�";
   }
   if(address.equals("tianjin"))
   {
   		address1="���";
   		//s2 = "���";
   }
   if(address.equals("chongqing"))
   {
   		address1="����";
   		//s2 = "����";
   }
   if(address.equals("fuzhou")){
   		//address1="����";
   		s2 ="����";
   }
   if(address.equals("guangzhou"))
   {
   		//address1="�㶫";
   		s2 = "����";
   }
   if(address.equals("shenzhen"))
   {
   		//address1="�㶫";
   		s2 = "����";
   }
   if(address.equals("chengdu"))
   {
   		//address1="�Ĵ�";
   		s2 = "�ɶ�";
   }
   if(address.equals("wuhan"))
   {
   		//address1="����";
   		s2 = "�人";
   }
   if(address.equals("xian"))
   {
   		//address1="����";
   		s2 = "����";
   }
   if(address.equals("zhengzhou"))
   {
   		//address1="����";
   		s2 = "֣��";
   }
   if(address.equals("suzhou"))
   {
   		//address1="����";
   		s2 = "����";
   }
   if(address.equals("jinan"))
   {
   		//address1="ɽ��";
   		s2 = "����";
   }
   if(address.equals("hangzhou"))
   {
   		//address1="�㽭";
   		s2 = "����";
   }
   if(address.equals("changsha"))
   {
   		//address1="����";
   		s2 = "��ɳ";
   }
   if(address.equals("qingdao"))
   {
   		//address1="ɽ��";
   		s2 = "�ൺ";
   }
   if(address.equals("shijiazhuang"))
   {
   		//address1="�ӱ�";
   		s2 = "ʯ��ׯ";
   }
   if(address.equals("dongguan"))
   {
   		//address1="�㶫";
   		s2 = "��ݸ";
   }
   if(address.equals("haerbin"))
   {
   		//address1="������";
   		s2 = "������";
   }
   if(address.equals("shenyang"))
   {
   		//address1="����";
   		s2 = "����";
   }
   if(address.equals("hefei"))
   {
   		//address1="����";
   		s2 = "�Ϸ�";
   }
   if(address.equals("taiyuan"))
   {
   		//address1="ɽ��";
   		s2 = "̫ԭ";
   }

 

   if(address.equals("shanghai"))
   {
   		address1="�Ϻ�";
   }


   String yx   = SysCommonFunc.getStrParameter(request,"yx");
   if(yx.length() ==0)
     yx = "0";

   String jyyx = SysCommonFunc.getStrParameter(request,"jyyx");
   int jyyxP = SysCommonFunc.getNumberFromString(jyyx,0);
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
   if(jyyx.length() > 0 || yx.length() > 1)
   {

  if(loginUser == null)
  {
    out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲���������ע�ᣡ');window.location.href='../reg.htm';</script>");
    return;

  }
   }



   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);


   int pagesize = 20;

   ///�õ��û��б�
   String sql = "from Userinfo as o where o.isdel = 0 ";
   //String sql = "select o.hyid,o.lcname,o.csdate,o.sex,o.hyzk,o.yx,o.s1,o.s2,o.jyyx,o.setzt from Userinfo as o where o.isdel = 0 ";


   if(address1.length() > 1)
     sql = sql + " and o.s1= '"+address1+"'";
   if(s2 != null && s2.length() > 1)
     sql = sql + " and o.s2='"+s2+"'";
   if(sex.length() > 1)
      sql = sql + " and o.sex ='"+sex+"'";
   if(hyzk.length() > 1)
      sql = sql + " and o.hyzk = '"+hyzk+"'";

   if(yx.length() > 1)
      sql = sql + " and o.yx = '"+yx+"'";
   if(jyyxP > 0 && jyyxP < 8)
   {
      sql = sql + " and jyyx like '"+LoverTools.getMinJyyx(jyyxP)+"'";
   }


   if(sex.length() > 1 && sex.equals("11") || address.equals("�Ϻ�") || address.equals("�㶫") || address.equals("���"))
     sql = sql+" order by o.img desc,o.flag desc,o.lasttime desc";
   else
     sql = sql+" order by o.img desc,o.lasttime desc";




   long start = System.currentTimeMillis();

   //QueryResult qr = null;  qr = QueryRecord.queryByHbm(sql,pagesize,cpage);


   //long step = System.currentTimeMillis()-start;

   //System.out.println("time="+step/1000);
   //int totalPage = qr.pageCount;
   //int totalCount = qr.rowCount;
   //cpage = qr.pageNum;
   //int prepage = cpage-1;
   //int nextpage = cpage+1;

    String dqname = address1.length() > 0 ? address1:s2;


%>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51��������-���й���������ཻ����վ����Ա�鲼��������,�㶫����,�Ϻ�����,���ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���1000������н��ѻ�Ա��" />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />

<link href="css/style2012.css" rel="stylesheet" type="text/css" />
<script src="Scripts/swfobject_modified.js" type="text/javascript"></script>
<style type="text/css">
<!--
.STYLETEMP {color: #FF0000}
td.txt11 {	font-size: 13px;
	color: #FFFFFF;
	text-decoration: none;
	font-weight: bold;
}
.STYLE1 {font-size: 12px}
-->
</style>
<script type="text/javascript">
<!--
function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->
</script>

<script type="text/JavaScript">
<!--

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



//-->
</script>
</head>

<body>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td colspan="9"><object id="FlashID" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" width="1002" height="204">
      <param name="movie" value="images/top.swf" />
      <param name="quality" value="high" />
      <param name="wmode" value="opaque" />
      <param name="swfversion" value="8.0.35.0" />
      <!-- �� param ��ǩ��ʾʹ�� Flash Player 6.0 r65 �͸��߰汾���û��������°汾�� Flash Player��������������û���������ʾ���뽫��ɾ���� -->
      <param name="expressinstall" value="Scripts/expressInstall.swf" />
      <!-- ��һ�������ǩ���ڷ� IE �����������ʹ�� IECC ����� IE ���ء� -->
      <!--[if !IE]>-->
      <object type="application/x-shockwave-flash" data="images/top.swf" width="1002" height="204">
        <!--<![endif]-->
        <param name="quality" value="high" />
        <param name="wmode" value="opaque" />
        <param name="swfversion" value="8.0.35.0" />
        <param name="expressinstall" value="Scripts/expressInstall.swf" />
        <!-- ��������������������ʾ��ʹ�� Flash Player 6.0 �͸��Ͱ汾���û��� -->
        <div>
          <h4>��ҳ���ϵ�������Ҫ���°汾�� Adobe Flash Player��</h4>
          <p><a href="http://www.adobe.com/go/getflashplayer"><img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif" alt="��ȡ Adobe Flash Player" width="112" height="33" /></a></p>
        </div>
        <!--[if !IE]>-->
      </object>
      <!--<![endif]-->
    </object></td>
  </tr>
  <tr>
    <td colspan="9"><img src="images/index_02.gif" width="1002" height="9" /></td>
  </tr>
  <tr>
    <td><img src="images/index_03.gif" width="174" height="45" /></td>
    <td><a href="../index.htm"><img src="images/index_04.gif" width="73" height="45" /></a></td>
    <td><a href="../grzq.htm"><img src="images/index_05.gif" width="89" height="45" /></a></td>
    <td><a href="../sszx.htm"><img src="images/index_06.gif" width="84" height="45" /></a></td>
    <td><a href="../hyzf.htm"><img src="images/index_07.gif" width="84" height="45" /></a></td>
    <td><a href="../bbs/index.htm"><img src="images/index_08.gif" width="85" height="45" /></a></td>
    <td><a href="../wtjd_syzn-type-0.htm"><img src="images/index_09.gif" width="82" height="45" /></a></td>
    <td><a href="../kfzx.htm"><img src="images/index_10.gif" width="124" height="45" /></a></td>
    <td><img src="images/index_11.gif" width="207" height="45" /></td>
  </tr>
  <tr>
    <td colspan="9"><img src="images/index_12.gif" width="1002" height="6" /></td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td><img src="images/001.gif" width="936" height="22" /></td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  background="images/bg1.gif">
  <tr>
    <td width="9">&nbsp;</td>
    <td width="188"><table style="CURSOR: pointer" onclick="" border="0" 
                  cellspacing="0" cellpadding="0" width="185">
      
        <tr>
          <td><a href="./new_allhy.htm" target="_blank"><img border="0" src="images/01.gif" width="185" height="36" /></a></td>
        </tr>
        <tr>
          <td background="images/02.gif" width="185" align="right"><table border="0" cellspacing="0" cellpadding="0" width="158"><A href="http://www.51lover.org/new_allhy.htm" target=_blank>
               <tr>
                <td height="5px"></td>
              </tr>
              <tr>
                <td align="left" class="basic"><b>�� ע �᣺<%=(long)(CacheTools.getAll_user()*CacheTools.v1) %>��</b></td>
              </tr> 
              <tr>
                <td align="left" class="basic"><b>����������<%=(long)(CacheTools.getAllUserVday()*CacheTools.v3)%>��</b></td>
              </tr>
              <tr>
                <td align="left" class="basic"><b>���շ��ʣ�<%=(long)(CacheTools.getAccessToday()*CacheTools.v4)%>��</b></td>
              </tr>
              <!--  <tr>
                <td  align="left" class="basic"><b>Ŀǰ���ߣ�<%=(long)(CacheTools.getAllOnline()*CacheTools.v5)%>��</b></td>
              </tr>-->
            </A>
          </table></td>
        </tr>
        <tr>
          <td><a href="./new_allhy.htm" 
                        target="_blank"><img border="0" src="images/03.gif" 
                        width="185" height="21" /></a></td>
        </tr>
      
    </table></td>
    <td><table width="729" border="0" cellpadding="0" 
                  cellspacing="0" style="MARGIN-TOP: 0px; MARGIN-LEFT: 1px">
      
        <tr>
          <td class="bk05" bgcolor="#a6c9ea" height="137" valign="top"><table border="0" cellspacing="0" cellpadding="0" width="700" 
                        align="center">
            
              <tr>
                <td width="30"><img src="images/index_19.gif" 
                              width="30" height="35" /></td>
                <td class="tit01" background="images/index_20.gif"><table border="0" cellspacing="0" cellpadding="0" 
                              width="100%">
                  
                    <tr>
                      <td width="125">[51�������Ĺ���]</td>
                      <td width="520">
                      <%
									Wtjd wtjd = WTJDMng.getGgNews();
										if (wtjd.getStime() != null) {
					  %>
                      <marquee style="WIDTH: 99%" 
                                onmouseover="this.stop();" 
                                onmouseout="this.start();" scrollamount="2" 
                                scrolldelay="2">
                        <a 
                                href="./gonggao-id-<%=wtjd.getId()%>.htm" 
                                target="_blank"><%=wtjd.getAsk()%> </a>
                      </marquee>
                      <%
						 }
					  %>
                      </td>
                    </tr>
                  
                </table></td>
                <td width="30"><img src="images/index_22.gif" 
                              width="30" height="35" /></td>
              </tr>
            
          </table>
           <%
//�ж��û�����
  Userinfo grwhqUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
  int flag = 0;
  if(grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
    flag = SysDefine.SYSTEM_HY_TYPE_vip;
    //vip��Ա
    else if (grwhqUser != null && grwhqUser.getFlag() != null && grwhqUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
    flag = SysDefine.SYSTEM_HY_TYPE_nvip;
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
}else if(flag == SysDefine.SYSTEM_HY_TYPE_nvip)
{
%><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> ����!��ӭ����51��������&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: ����; color: blue; font-size: " >�˳���½<span/></a></td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>���ĵȼ���</strong><br /></td>
            <td width="90%" class="style02">VIP��Ա   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ʣ�����ޣ�</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%>  </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>����Ȩ�ޣ�</strong></td>
            <td class="style02">16���������������޴β鿴ȫ������ע���Ա����ϸ��ϵ�취�����ͺͲ鿴���ԡ�<br />
               ��ͨ��Ա��ȫ��Ȩ��<!-- �����ﲨ�� --></td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_NOR)
{
%><table width="700" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2" align="center" class="tit09"><span class="tit03"><%=grwhqUser.getLcname()%></span> ����!��ӭ����51��������&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: ����; color: blue; font-size: " >�˳���½<span/></a></td>
          </tr>
          <tr>
            <td height="6" colspan="2" align="center"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
          </tr>
          <tr>
            <td width="10%" class="style02"><strong>���ĵȼ���</strong><br /></td>
            <td width="90%" class="style02">��ͨ��Ա   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;ʣ�����ޣ�</strong>&nbsp;�� </td>
          </tr>
          <tr>
            <td valign="top" class="style02" style="padding-top:2px;"><strong>����Ȩ�ޣ�</strong></td>
            <td class="style02">5�������������鿴��Ա�����������ϡ� �鿴���ԡ�˭�����ҡ��ҿ���˭������չʾ�Լ����ϣ�����Ƭ����<br />ʹ�����Ͽ������á���������/����������̳������10��Ȩ�ޡ�</td>
          </tr>
</table>
<%
}else if(flag == SysDefine.SYSTEM_HY_TYPE_vip)
{
%>
            <table border="0" cellspacing="0" cellpadding="0" width="700" 
                        align="center">
              
                <tr>
                  <td class="tit09" colspan="2" align="middle"><span 
                              class="tit03"><%=grwhqUser.getLcname()%></span> ����!��ӭ����51��������&nbsp;&nbsp;&nbsp;&nbsp;<a href="logout.jsp"  ><span style="font-family: ����; color: blue; font-size: " >�˳���½<span/></a></td>
                </tr>
                <tr>
                  <td height="6" colspan="2" align="middle"><img 
                              src="images/1px.gif" width="1" height="1" /></td>
                </tr>
                <tr>
                  <td class="style02" 
                              width="10%"><strong>���ĵȼ���</strong><br /></td>
                  <td class="style02" width="90%">�׽�VIP��Ա ������������<strong>ʣ�����ޣ�</strong>&nbsp;<%=DateTools.dateToString(grwhqUser.getZzsj(),false)%> </td>
                </tr>
                <tr>
                  <td style="PADDING-TOP: 2px" class="style02" 
                            valign="top"><strong>����Ȩ�ޣ�</strong></td>
                  <td 
                              class="style02">16���������������޴β鿴ȫ������ע���Ա��������֤��Ա����ϸ��ϵ�취��<br />
                   ��ͨ��Ա��ȫ��Ȩ�ޡ����ͺͲ鿴���ԡ����������������Լ�����ϵ�취��</td>
                </tr>
              
            </table>
            <%} %>
            </td>
        </tr>
      
    </table></td>
    <td width="9">&nbsp;</td>
  </tr>
</table>
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  background="images/bg3.gif">
  <tr>
    <td width="9">&nbsp;</td>
    <td><table border="0" cellspacing="0" cellpadding="0" width="918" align="center">
      <tbody>
        <tr>
          <td height="1" colspan="3"><img src="images/1px.gif" width="1" 
          height="1" /></td>
        </tr>
        <tr>
          <td width="10"><img src="images/07.gif" width="10" height="36" /></td>
          <td class="tit09" background="images/08.gif" align="center"><span class="style03"><%=dqname%>��������</span></td>
          <td width="7"><img src="images/09.gif" width="7" height="36" /></td>
        </tr>
      </tbody>
    </table></td>
    <td width="9">&nbsp;</td>
  </tr>
</table>
<div id="page_bg">
<div id="page_bottom">
<table width="936" border="0" align="center" cellpadding="0" cellspacing="0"  >
  <tr>
    <td width="9">&nbsp;</td>
    <td valign="top" style="border-left: 2px solid #A6C9EA; border-bottom:2px solid #A6C9EA;  border-right:1px solid #a0c3e2; ">
    
    <style type="text/css"> 

.woaicss {width:915px; height:auto; overflow:hidden; margin:0px auto; margin-top:10px }
.woaicss_title {width:900px; height:30px; background:#fff url(images/btn_bg2.png) no-repeat; overflow:hidden;}
.woaicss_title li {display:block; float:left; margin:0 ; display:inline; text-align:center; padding-top:2px}
.woaicss_title li a {display:block; width:auto; heigth:30px; line-height:34px; color:#fff; font-weight:bold}
.woaicss_title li a:hover {color:#f0f0f0; text-decoration:underline;}
.woaicss_title_bg1 {background-position:0 0;}
.woaicss_title_bg2 {background-position:0 -30px;}
.woaicss_title_bg3 {background-position:0 -60px;}
.woaicss_con {display:block; width:910px; min-height:500px;  padding-top:10px;  color:#666 ; overflow:hidden;  }

</style>

<div class="woaicss">
  <div class="woaicss">
    <script language="javascript"> 
	function woaicssq(num){
	for(var id = 1;id<=2;id++)
	{
	var MrJin="woaicss_con"+id;
	if(id==num)
	document.getElementById(MrJin).style.display="block";
	else
	document.getElementById(MrJin).style.display="none";
	}
	if(num==1) 
	document.getElementById("woaicsstitle").className="woaicss_title woaicss_title_bg1";
	if(num==2)
	document.getElementById("woaicsstitle").className="woaicss_title woaicss_title_bg2";
	}
  </script>
    <ul class="woaicss_title woaicss_title_bg1" id="woaicsstitle">
      <li style=" width:105px"><a onmouseover="javascript:woaicssq(1)">����֤��Ա</a></li>
      <li style=" width:105px"><a onmouseover="javascript:woaicssq(2)">δ��֤��Ա</a></li>
    </ul>
    <div class="woaicss_con" id="woaicss_con1" style="display:block;">
			
	<iframe src="area2-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" width="910px" height="770px" scrolling="no" style="background-color=transparent" frameborder="0"></iframe>		 
    </div>
    
    <div class="woaicss_con" id="woaicss_con2" style="display:none;">
			 
	
	<iframe src="area1-address-<%=address+"-sex-"+sex+"-jyyx-"+jyyx+"-hyzk-"+hyzk+"-yx-"+yx%>.htm" width="910px" height="770px" scrolling="no" style="background-color=transparent" frameborder="0"></iframe>		 
			 
			 
    </div>

    
  </div>
  
</div>
    </td>
    
    <td width="9">&nbsp;</td>
  </tr>
</table>
</div></div>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
  
    <tr>
      <td colspan="8">&nbsp;</td>
    </tr>
    <tr>
      <td width="3%">&nbsp;</td>
      <td width="33%" align="left" class="banquan" valign="top"> �� Ӫ �̣�<a href="http://www.51lover.org/veiwwt-id-1080.htm" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">���ػ���&middot;�Ͼ��������缼�����޹�˾</a><br />
        �ء���ַ�������Ͼ�ʯ��·107�Ż�������7��<br />
        ҵ��绰��(025) 85519991 <br />
        ��Ȩ�ţ�<a href="http://www.51lover.org/logo/zzq2.jpg" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">��������-2012-J-3105</a><br /></td>
      <td width="4%">&nbsp;</td>
      <td colspan="2" class="banquan" align="left" valign="top"> ��ѿͷ��绰��<b><font style="font-size: 15px" color=""><strong>4000680001</strong></font></b><br />
        �ͷ�ʱ�䣺��һ������   9��00-21��00<br />
        ��Ӫ���֤��ţ�<a href="http://www.51lover.org/logo/icp.jpg" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">��B2-20090263</a><br />
       51��������  ��Ȩ����  <br /></td>
      <td width="4%">&nbsp;</td>
      <td width="28%" colspan="2" class="banquan" valign="top"> ���ɹ��ʣ��й�&middot;���շ���������ʦ������ <br />
        ����֧�֣�<a href="http://www.chinapay.com/newportal" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">�й���������֧����˾</a><br />
       ��վ�����ţ�<a href="http://www.miibeian.gov.cn/" target="_blank" style=" border-bottom-style: solid; border-bottom-color:#ffffff; border-bottom-width:1px;" class="link01">��ICP��11046501</a>  <br />
        </td>
    </tr>
  
</table>
<table width="800" border="0" align="center" cellpadding="0" cellspacing="20">
  <tr>
	<td align="right" style="padding-right:5px"><a href="http://www.itrust.org.cn/" target="_blank"><img src="images/AAA.jpg" border="0"></a></td>
	<td align="left" style="padding-left:5px"><a href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1680527550" target="_blank"><img src="images/AAA2.jpg" border="0"></a></td>
  </tr>
</table>
<style>
    #top22{
        width:300px;
		height:140px;
        position:fixed;
        _position:absolute;
        bottom:0;
        right:0;
		_top:expression(eval(document.documentElement.scrollTop+document.documentElement.clientHeight-this.offsetHeight-(parseInt(this.currentStyle.marginTop,10)||0)-(parseInt(this.currentStyle.marginBottom,10)||0)));
    }

    *html{
        background-image:url(about:blank);
        background-attachment:fixed;
    }
</style>

<div id="top22" style="display:none">
	<%if(loginUser!=null){ %>
<iframe allowTransparency="true" id="HtmlEditor" name="HtmlEditor"   src = "xttj.jsp" frameborder="0" scrolling="no" >
</iframe>  

<%}%>
</div>
<script type="text/javascript">
<!--
swfobject.registerObject("FlashID");
//-->
</script>
</body>
</html>
