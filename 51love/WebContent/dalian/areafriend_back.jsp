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
     else if(uri.indexOf("shanhai") > -1)
       address = "shanhai";
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
     
  }



   String address1="";
   String s2 = "";
   if(address.equals("beijing"))
   {
   		address1="����";
   }
   if(address.equals("nanjing"))
   {
   		address1="����";
   		s2 = "�Ͼ�";
   }
   if(address.equals("tianjin"))
   {
   		address1="���";
   		s2 = "���";
   }
   if(address.equals("chongqing"))
   {
   		address1="����";
   		s2 = "����";
   }
   if(address.equals("fuzhou")){
   		address1="����";
   		s2 ="����";
   }
   if(address.equals("guangzhou"))
   {
   		address1="�㶫";
   		s2 = "����";
   }
   if(address.equals("shenzhen"))
   {
   		address1="�㶫";
   		s2 = "����";
   }
   if(address.equals("chengdu"))
   {
   		address1="�Ĵ�";
   		s2 = "�ɶ�";
   }
   if(address.equals("wuhan"))
   {
   		address1="����";
   		s2 = "�人";
   }
   if(address.equals("xian"))
   {
   		address1="����";
   		s2 = "����";
   }
   if(address.equals("zhengzhou"))
   {
   		address1="����";
   		s2 = "֣��";
   }
   if(address.equals("suzhou"))
   {
   		address1="����";
   		s2 = "����";
   }
   if(address.equals("jinan"))
   {
   		address1="ɽ��";
   		s2 = "����";
   }
   if(address.equals("hangzhou"))
   {
   		address1="�㽭";
   		s2 = "����";
   }
   if(address.equals("changsha"))
   {
   		address1="����";
   		s2 = "��ɳ";
   }
   if(address.equals("qingdao"))
   {
   		address1="ɽ��";
   		s2 = "�ൺ";
   }
   if(address.equals("shijiazhuang"))
   {
   		address1="�ӱ�";
   		s2 = "ʯ��ׯ";
   }
   if(address.equals("dongguan"))
   {
   		address1="�㶫";
   		s2 = "��ݸ";
   }
   if(address.equals("haerbin"))
   {
   		address1="������";
   		s2 = "������";
   }
   if(address.equals("shenyang"))
   {
   		address1="����";
   		s2 = "����";
   }
   if(address.equals("hefei"))
   {
   		address1="����";
   		s2 = "�Ϸ�";
   }
   if(address.equals("taiyuan"))
   {
   		address1="ɽ��";
   		s2 = "̫ԭ";
   }

   if(address.equals("guangdong"))
   {
   		address1="�㶫";
   }

   if(address.equals("shanhai"))
   {
   		address1="�Ϻ�";
   }

   if(address.equals("jiangsu"))
   {
   		address1="����";
   }
   if(address.equals("shandong"))
   {
   		address1="ɽ��";
   }
   if(address.equals("zhejiang"))
   {
   		address1="�㽭";
   }
   if(address.equals("hunan"))
   {
   		address1="����";
   }
   if(address.equals("henan"))
   {
   		address1="����";
   }
   if(address.equals("sichuan"))
   {
   		address1="�Ĵ�";
   }
   if(address.equals("hubei"))
   {
   		address1="����";
   }
   if(address.equals("hebei"))
   {
   		address1="�ӱ�";
   }
   if(address.equals("liaoning"))
   {
   		address1="����";
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

   QueryResult qr = null;  qr = QueryRecord.queryByHbm(sql,pagesize,cpage);


   long step = System.currentTimeMillis()-start;

   System.out.println("time="+step/1000);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=s2%>����-51��������</title>
<META content= "<%=s2%>����-51�������ġ��й�AAA��������ཻ����վ����Ա�鲼<%=s2%>�����ؼ�������51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���400������н��ѻ�Ա��" name="description">
<META content="51��������-��<%=s2%>����" name="keywords">
<link href="./images/index.css" rel="stylesheet" type="text/css" />
<link href="./images/style.css" rel="stylesheet" type="text/css" />
<script src="Scripts/AC_RunActiveContent.js" type="text/javascript"></script>
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
<%@ include file="../header1.jsp"%>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0" style="margin-top:-2px;">
  <tr>
    <td width="32">&nbsp;</td>
    <td valign="top" background="images/reg/bg3.gif"><div id="zwbg05">
      <div id="zwbg07">
        <table width="918" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr>
            <td height="1" colspan="3"><img src="images/grzq/1px.gif" width="1" height="1" /></td>
            </tr>
          <tr>
            <td width="10"><img src="images/reg/07.gif" width="10" height="36" /></td>
            <td align="center" background="images/reg/08.gif" class="tit09"><%=s2%>��������</td>
            <td width="7"><img src="images/reg/09.gif" width="7" height="36" /></td>
          </tr>
        </table>
       <table width="918" border="0" align="center" cellpadding="0" cellspacing="0">

  <tr>
    <td><table class="ssjg" border="0" cellpadding="2" cellspacing="1" bgcolor="#77a9d5">

            <tr>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">���</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">�ǳ�</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">����</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">�Ա�</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">���</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">��н</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">��ַ</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">��������</span></td>
              <td height="40" align="center" class="ssjg_title"><span class="ssjg_title">����״̬</span></td>
            </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Userinfo temp = (Userinfo)qr.resultList.get(i);
   String lcname = temp.getLcname();
   Date csdate = temp.getCsdate();
   Date cdate  = new Date(System.currentTimeMillis());
   String age = "δ֪";
   if(csdate != null)
     age  = (cdate.getYear()-csdate.getYear())+"";
   String vsex = DicList.getDicValue(SysDefine.DIC_SEX,temp.getSex(),1);
   String vhyzk = DicList.getDicValue(SysDefine.DIC_HYZH,temp.getHyzk(),1);
   String vyx   = DicList.getDicValue(SysDefine.DIC_YX,temp.getYx(),1);
         String vs1 =  (temp.getS2() == null ? "":temp.getS2());
   if(vs1.equals("��������"))
     vs1 = "����";
   if(vs1.equals("�Ϻ��Ϻ�"))
     vs1 = "�Ϻ�";
   if(vs1.equals("������"))
     vs1 = "���";
   if(vs1.equals("��������"))
     vs1 = "����";
   if(vs1.equals("������"))
     vs1 = "���";
   if(vs1.equals("���Ű���"))
     vs1 = "����";
   String vjyyx = LoverTools.getJYYXDes(temp);
   String jyzt = LoverTools.getJYZTDes(temp);

%>


            <tr>
                  <td align="center" bgcolor="#D6E6F3" ><strong><%=(cpage-1)*pagesize+i+1%></strong></td>
                  <td  align="center" bgcolor="#FFFFFF">
                  <a href="../perinfo-id-<%=temp.getHyid()%>.htm" target="_blank" class="new_link06"><strong><%=lcname%></strong></a>                  </td>
                  <td align="center" bgcolor="#FFFFFF" ><%=age%></td>
                  <td align="center" bgcolor="#FFFFFF" ><%=vsex%></td>
                  <td align="center" bgcolor="#FFFFFF" ><%=vhyzk%></td>
                  <td align="center" bgcolor="#FFFFFF" ><%=vyx%></td>
                  <td align="center" bgcolor="#FFFFFF" ><%=vs1%></td>
                  <td align="center" bgcolor="#FFFFFF" ><%=vjyyx%></td>
                  <td align="center" bgcolor="#FFFFFF" class="new_tit08"><%=jyzt%></td>
                </tr>
<%
}
%>
    </table>
 <table class="area_right" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td><img src="images/2010-4/search.jpg" width="160" height="24" /></td>
  </tr>
  <tr>
    <td class="search"><table class="search_list" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td class="fenlei">���Ա�ѡ��</td>
      </tr>
      <tr>
        <td class="xux" style="padding-bottom:8px;">
        <ul>
        <li <%=sex.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=sex.equals("0") ? "style=\"color: #FFFFFF\"":""%> >����</a></li>
        <li <%=sex.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=10 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=sex.equals("10") ? "style=\"color: #FFFFFF\"":""%> >˧��</a></li>
        <li <%=sex.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=11 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=sex.equals("11") ? "style=\"color: #FFFFFF\"":""%> >��Ů</a></li>
        </ul></td>
        </tr>
      <tr>
        <td class="fenlei">������״��ѡ��</td>
      </tr>
      <tr>
        <td class="xux" style="padding-bottom:8px;">
        <ul>
        <li <%=hyzk.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=0 %>-yx-<%=yx %>.htm" <%=hyzk.equals("0") ? "style=\"color: #FFFFFF\"":""%> >����</a></li>
        <li <%=hyzk.equals("11") ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=11 %>-yx-<%=yx %>.htm" <%=hyzk.equals("11") ? "style=\"color: #FFFFFF\"":""%> >�ѻ�</a></li>
        <li <%=hyzk.equals("10") ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=10 %>-yx-<%=yx %>.htm"  <%=hyzk.equals("10") ? "style=\"color: #FFFFFF\"":""%> >δ��</a></li>
        </ul></td>
        </tr>
      <tr>
        <td class="fenlei ">����нѡ��</td>
      </tr>

      <tr>
        <td ><ul>
          <li <%=yx.equals("0")  ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=0 %>.htm" <%=yx.equals("0") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >����</a></li>
        </ul>        </td>
      </tr>
      <tr>
        <td ><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=10 %>.htm"  <%=yx.equals("10") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >2��Ԫ����</a></td>
      </tr>
      <tr>
        <td ><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=11 %>.htm"   <%=yx.equals("11") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >2-5��Ԫ</a></td>
      </tr>
      <tr>
        <td ><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=12 %>.htm"   <%=yx.equals("12") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >5-10��Ԫ</a></td>
      </tr>
      <tr>
        <td ><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=13 %>.htm"  <%=yx.equals("13") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >10-100��Ԫ </a></td>
      </tr>
      <tr>
        <td class="xux"><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=jyyx %>-hyzk-<%=hyzk %>-yx-<%=14 %>.htm"  <%=yx.equals("14") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >100��Ԫ���� </a></td>
      </tr>
      <tr>
        <td class="fenlei">����������ѡ��</td>
      </tr>
      <tr>
        <td><ul>
          <li <%=jyyx.equals("")  ? "style=\"background:#0099CC\"":""%>><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=0 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=jyyx.equals("0") ? "style=\"color: #FFFFFF\"":""%> >����</a></li>
        </ul>        </td>
      </tr>
      <tr>
        <td>
           <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=1 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm"  <%=jyyx.equals("1") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%>>������</a>
          <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=2 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=jyyx.equals("2") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >��������</a>          </td>
      </tr>
      <tr>
        <td>
          <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=3 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm" <%=jyyx.equals("3") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >ͬ������</a>
          <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=4 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm"  <%=jyyx.equals("4") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >����</a>        </td>
      </tr>
      <tr>
        <td>
          <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=5 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm"  <%=jyyx.equals("5") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >Eҹ��</a>
          <a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=6 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm"  <%=jyyx.equals("6") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >���</a>        </td>
      </tr>
      <tr>
        <td><a href="areafriend-address-<%=address %>-sex-<%=0 %>-jyyx-<%=7 %>-hyzk-<%=hyzk %>-yx-<%=yx %>.htm"  <%=jyyx.equals("7") ? "style=\"color: #FFFFFF;background-color:#0099CC\"":""%> >����</a></td>
      </tr>
      <tr>
        <td>&nbsp;</td>
      </tr>



    </table></td>
  </tr>
  <tr>
    <td><a href="../sszx.htm"><img src="images/2010-4/search1.jpg" width="160" height="55" border="0" style="margin-top:3px;" /></a></td>
  </tr>
</table>    </td>
  </tr>
  <tr>

  <td height="50" align="center" >                <p>&nbsp;</p>
    <form name="go2to" method="post" action="areafriend.jsp">
                            <input type="hidden" name="sex" value="<%=sex%>"/>
                            <input type="hidden" name="address" value="<%=address%>" />
                            <input type="hidden" name="hyzk" value="<%=hyzk%>" />
                            <input type="hidden" name="yx" value="<%=yx%>" />
                            <input type="hidden" name="jyyx" value="<%=jyyx%>" />
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">


ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ
 <%
int startpage = 0;
if((cpage-5) <=0)
  startpage = 1;
else
  startpage = cpage-5;

if(cpage == 1)
{
  //out.println("��ҳ&nbsp;��һҳ&nbsp; ");
}
else
{
  out.println("<a href='areafriend-cpages-1-sex-"+sex+"-address-"+address+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>�� ҳ</a>&nbsp;&nbsp;<a href='areafriend-cpages-"+prepage+"-sex-"+sex+"-address-"+address+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>��һҳ</a>&nbsp;&nbsp;");
}

for(int i =startpage;i < startpage+10; i ++)
{
  if(i < totalPage && i != cpage)
     out.println("<a href='areafriend-cpages-"+i+"-sex-"+sex+"-address-"+address+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>"+i+"</a>&nbsp;&nbsp;");
  else if(i == cpage)
     out.println("<span style=\"color:#FF0000;font-size:16px\"><strong>"+i+"</strong></span>&nbsp;&nbsp;");
    //out.println("<input  name=\"textfield\" type=\"text\" class=\"input02 page_input\" value=\""+i+"\" onclick=\"javascript:turn('"+i+"')\" readonly />");

     //
}


if(cpage >= totalPage )
{
  //out.println("��һҳ&nbsp;βҳ&nbsp; ");
}
else
{
  out.println("<a href='areafriend-cpages-"+nextpage+"-sex-"+sex+"-address-"+address+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>��һҳ</a>&nbsp;&nbsp;<a href='areafriend-cpages-"+totalPage+"-sex-"+sex+"-address-"+address+"-hyzk-"+hyzk+"-yx-"+yx+"-jyyx-"+jyyx+"-tcounts-"+qr.rowCount+".htm'>βҳ</a>&nbsp;&nbsp;");
}
%>

<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'>
  &nbsp; ��<%=totalCount%>����Ա &nbsp;
</font>

</form></td>
  </tr>
</table>

      </div>
    </div></td>
    <td width="33">&nbsp;</td>
  </tr>
</table>
<table width="1002" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="33"></td>
    <td style="padding:4px 0px;"><img src="images/reg/grzq_49.gif" width="936" height="4" /></td>
    <td width="33"></td>
  </tr>
</table>
<div id=bottom>
<table cellSpacing=0 cellPadding=0 width="100%" align=center border=0>

  <tr>
    <td class=banquan align=right width="49%">51����������վ��Ӫ�̣�<A class=link01
      style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.htgroup.com.cn/jsht-ry.htm"
      target=_blank>���ػ������Ͼ��������缼�����޹�˾</A><br>
      ��ַ���Ͼ�����·359���ؽ��³ǹ�ί��4��<br>��Ӫ���֤���:<a
      class=link01 style="BORDER-BOTTOM: #ffffff 1px solid"
      href="http://www.51lover.org/logo/icp.jpg"
      target=_blank>��B2-20090263</A><br>��վ������:<a class=link01
      style="border-bottom: #ffffff 1px solid"
      href="http://www.miibeian.gov.cn/" target=_blank>��ICP��05003319��</a> </td>
    <td width="2%">&nbsp;</td>
    <td class=banquan width="49%" colSpan=2>���ɹ��ʣ��й������շ���������ʦ������ <br>����֧�֣�<A
      class=link01 style="border-bottom:#ffffff 1px solid"
      href="http://www.chinapay.com/newportal"
      target=_blank>�й���������֧����˾</A><BR>51�������� ��Ȩ���� <br>��Ȩ��:<A class=link01
      style="border-bottom: #ffffff 1px solid"
      href="http://www.51lover.org/logo/zzq2.jpg"
      target=_blank>������10-2010-J-240</A></td></tr>
  <tr>
    <td colSpan=4 height=10></td></tr></table>
	<table width="100%" >
	<tr>
	<td align="right" style="padding-right:1px"><a href="http://www.itrust.org.cn/" target="_blank"><IMG src="../images/AAA.jpg" border="0"></a></td>
	<td align="left" style="padding-left:1px"><a href="http://www.itrust.org.cn/yz/pjwx.asp?wm=1680527550" target="_blank"><IMG src="../images/AAA2.jpg" border="0"></a></td>
	</tr>
	</table>
</div>
</body>
</html>





