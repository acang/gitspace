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
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="java.math.BigDecimal"%>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
int adminflag = 0;
if(adminLoginInfo.getFlag() != null)
  adminflag = adminLoginInfo.getFlag().intValue();
String hyid = SysCommonFunc.getStrParameter(request,"id");
String username = SysCommonFunc.getStrParameter(request,"username");
if(username != null && username.length() > 0)
{
    List templist = HbmOperator.list("from Userinfo as o where o.username='"+username+"' ");
    if(templist != null && templist.size() > 0)
    {
        Userinfo uuuui = (Userinfo)templist.get(0);
        hyid = uuuui.getHyid().toString();
    }
}
int i = 0;
if(hyid.length() ==0)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}

String checkhyid = SysCommonFunc.getStrParameter(request,"checkhyid");
if(checkhyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set  VACSJTEL=1 where hyid = " + checkhyid);
}
String uncheckhyid = SysCommonFunc.getStrParameter(request,"uncheckhyid");
if(uncheckhyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set ISVCATION=0, VACSJTEL=0 where hyid = " + uncheckhyid);
}
String shenhehyid = SysCommonFunc.getStrParameter(request,"shenhehyid");
if(shenhehyid.length() >0)
{
	HbmOperator.executeSql("update USERINFO set  ISVCATION=1 where hyid = " + shenhehyid);
}


Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1"))
  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
else{
	List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
    if(templist != null && templist.size() > 0)
    {
    	loginUser = (Userinfo)templist.get(0);
    }
}
//  loginUser = HYRegMng.getUserinfoByHyid(hyid);
if(loginUser == null)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}else{
	if (loginUser.getVacsjtel()==1){
		i = 1;
	}else if(loginUser.getVacemail()==1){
		i = 0;
	} else{
		i = 2;
	}
}

//����Ů��Ա����ʱ��
if (loginUser.getSex()!=null && loginUser.getSex().equals("11")){
	HbmOperator.executeSql("update USERINFO set regtime5=sysdate where hyid = " + hyid);
}

Userother uother = HYRegMng.getUserOtherByHyid(hyid);
if(uother == null)
{
  uother = new Userother();
  uother.setJyly("");
  uother.setLxqr("");
  uother.setQggx("");
}

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
if(bizaction.equals("01"))
{
  String s = HYRegMng.adminModUserInfo(request,adminLoginInfo,loginUser,uother);
  if(s == null){
     out.println("<script language='javascript'>location.href=location.href;</script>");
     //response.sendRedirect("edithyinfo.jsp");
	 //���������Ϣ
     String tjsql = "update checkinfo set sex= '"+loginUser.getSex()+"' where hyid=" +hyid;
	 HbmOperator.executeSql(tjsql);
  }else
    out.println("<script language='javascript'>alert('"+s+"');</script>");
  return;
}
//if(bizaction.equals("02"))
//{
//  String s = HYRegMng.adminSHUserinfo(request,adminLoginInfo,loginUser,uother);
//  if(s == null)
//    out.println("<script language='javascript'>alert('���Ѿ��޸���������');</script>");
//  else
//    out.println("<script language='javascript'>alert('"+s+"��');</script>");
//  return;
//}

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
<!--
function test()
{
var jyyx01,i,j=0;
if (checkspace(document.personal.lcname.value)){
alert('�����������ǳƣ�');
document.personal.lcname.focus();
return false;
}
var s =document.personal.lcname.value ;
if (s.length>12)
{
alert('��������ǳƲ��ܳ���6����,������');
document.personal.lcname.focus();
return false;
}
//var shu="0123456789";
//var s =document.personal.lcname.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('��������ǳƺ���������ϵ�취������,������');
//document.personal.lcname.focus();
//return false;
//}
j=0;
//var x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('��������ǳƺ���������ϵ�취������,������');
//document.personal.lcname.focus();
//return false;
//}

var jyyx01=""
i=0;
j=0;
  for (i=0;i<document.personal.jyyx.length;i++) {
       if (document.personal.jyyx[i].checked)
	   { j=1+j;
	   jyyx01=jyyx01+"1"
	   }else
	   {
	   jyyx01=jyyx01+"0"
	   }

  }
  
  if (j==0||j>=5) {
      alert("��ѡ�������򣡲��Ҳ��������")
      return (false);
  }
document.personal.jyyx01.value="1"+jyyx01;


if (checkspace(document.personal.csdate.value)){
alert('��ѡ�����ĳ������ڣ�');
document.personal.csdate.focus();
return false;
}
var dtEnd = new Date();
var dtStart = document.personal.csdate.value.substr(0,4);
if ((dtEnd.getFullYear() - dtStart<16)||(dtEnd.getFullYear() - dtStart>70))
{
alert('��������С��16�꣬����ע�ᣡ');
return false;
}
//if (checkspace(document.personal.qggx.value)){
//alert('�����������鰮��ϵ�Ŀ�����');
//document.personal.qggx.focus();
//return false;
//}

//var shu="0123456789";
//var s =document.personal.qggx.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('��������鰮��ϵ����������ϵ�취������,������');
//document.personal.qggx.focus();
//return false;
//}
//j=0;
//var x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('��������鰮��ϵ����������ϵ�취������,������');
//document.personal.qggx.focus();
//return false;
//}
//if ((document.personal.qggx.value.length<2) || (document.personal.qggx.value.length>300))
//{
//alert('Ϊ��֤����Ч�����鰮��ϵ����20�����ϣ����ܳ���300�֣���������д�κ���ϵ��ʽ');
//document.personal.qggx.focus();
//return false;
//}
//if (checkspace(document.personal.lxqr.value)){
//alert('�����������������ˣ�');
//document.personal.lxqr.focus();
//return false;
//}
//if ((document.personal.lxqr.value.length<2) || (document.personal.lxqr.value.length>300))
//{
//alert('Ϊ��֤����Ч����������������20�����ϣ����ܳ���300�֣���������д�κ���ϵ��ʽ');
//document.personal.lxqr.focus();
//return false;
//}
//var shu="0123456789";
//var s =document.personal.qggx.value ;
//if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('����������Թ�ϵ����������ϵ�취������,������');
//document.personal.qggx.focus();
//return false;}
//var m = document.personal.lxqr.value;
//if (((m.indexOf("http")>=0)||(m.indexOf("www")>=0)||(m.indexOf("@")>=0)))
//{
//alert('��������������˺���������ϵ�취������,������');
//document.personal.lxqr.focus();
//return false;
//}
//j=0;
//var x=0;
//for (i=0;i<m.length;i++)
//{
//if ((shu.indexOf(m.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('��������������˺���������ϵ�취������,������');
//document.personal.lxqr.focus();
//return false;
//}


//if (checkspace(document.personal.jyly.value)){
//alert('���������Ľ������ԣ�');
//document.personal.jyly.focus();
//return false;
//}
//if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
//{
//alert('Ϊ��֤����Ч������������20�����ϣ����ܳ���300�֣���������д�κ���ϵ��ʽ');
//document.personal.jyly.focus();
//return false;
//}
//	 s =document.personal.jyly.value ;
//	 if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
//{
//alert('������������к���������ϵ�취������,������');
//document.personal.jyly.focus();
//return false;
//}
//j=0;
//x=0;
//for (i=0;i<s.length;i++)
//{
//if ((shu.indexOf(s.charAt(i)))>=0 )
//   {
//    j=j+1;
//   if (j==6)
//    {x=1;
//        }
//   }
//else
//{   j=0;
//      }
//}
//
//if (x==1) {
//alert('������������к���������ϵ�취������,������');
//document.personal.jyly.focus();
//return false;
//}
var qggx1 = document.personal.qggx.value;
var lxqr1 = document.personal.lxqr.value;
var jyly1 = document.personal.jyly.value;
if (((qggx1.indexOf("script")>=0)||(qggx1.indexOf("<")>=0)||(qggx1.indexOf(">")>=0)))
{
alert('��������鰮��ϵ����Υ������,������');
document.personal.qggx.focus();
return false;
}
if (((lxqr1.indexOf("script")>=0)||(lxqr1.indexOf("<")>=0)||(lxqr1.indexOf(">")>=0)))
{
alert('��������������˺���Υ������,������');
document.personal.lxqr.focus();
return false;
}
if (((jyly1.indexOf("script")>=0)||(jyly1.indexOf("<")>=0)||(jyly1.indexOf(">")>=0)))
{
alert('������Ľ������Ժ���Υ������,������');
document.personal.jyly.focus();
return false;
}

if ((checkspace(document.personal.email.value)) && (checkspace(document.personal.oicq.value)) && (checkspace(document.personal.sjtel.value)) && (checkspace(document.personal.tel.value)))
{
alert("����������һ����ϵ������");
return false;
}
return true;
}

function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

function view(t1,t2,t3,t4)
{
    document.getElementById(t1).style.display = "block";
    document.getElementById(t2).style.display = "none";
    document.getElementById(t3).style.display = "none";
    document.getElementById(t4).style.display = "none";
}

function cccc(){
	if('<%=i%>' ==1){
		//document.getElementById("sjtel").readOnly=true;
		document.getElementById("sjtel").style.backgroundColor="grey";
		document.getElementById("email").readOnly=false;
		
	}else if ('<%=i%>'== 0){
		document.getElementById("email").readOnly=true;
		document.getElementById("email").style.backgroundColor="#A8A8A8";
		document.getElementById("sjtel").readOnly=false;
	} else{
		document.getElementById("sjtel").readOnly=false;
		document.getElementById("email").readOnly=false;
	}
}


<!--

function MM_openBrWindow1(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->

</script>

</head>

<body onload="cccc()">
<table width="80%" height="63"  border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">ά����Ա������Ϣ</td>
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
      <a href="edithyinfoset.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a>&nbsp;&nbsp;
      <a href="edithyinfostat.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա״̬</a>&nbsp;&nbsp;
      <a href="edithyinfoupd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">������¼</a>&nbsp;&nbsp;
	  <!-- <a href="hybjd.jsp?id=<%=hyid%>&isdel=<%=isdel%>">�׽𶹼�¼</a>&nbsp;&nbsp; -->
	  <a href="hyxx.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ϣ�շ�</a>&nbsp;&nbsp;
	  <a href="hyfw.jsp?id=<%=hyid%>&isdel=<%=isdel%>">���ʼ�¼</a>&nbsp;&nbsp;
<a href="hycheck.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ա���</a>&nbsp;&nbsp;
	  <!-- <a href="edithyinfoxxjs.jsp?id=<%=hyid%>&isdel=<%=isdel%>">��Ϣ��������</a>&nbsp;&nbsp; -->
    </td>
      <td>
      <a href="gogrzq.jsp?id=<%=hyid%>&isdel=<%=isdel%>" target="_blank">�������ר��</a>&nbsp;&nbsp;
      <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a></td>
  </tr>
</table>
  <table id="t1"  width="80%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
<form name="personal" id="personal" method="post" action="edithyinfo.jsp?id=<%=hyid%>&isdel=<%=isdel%>" onSubmit="return test()" >
  <input type="hidden" name="bizaction" value="01">
  <input type="hidden" name="id" value="<%=loginUser.getHyid()%>" />
  <input type="hidden" name="isdel" value="<%=isdel%>">
   <%
   String thyid = loginUser.getHyid().toString();
   String tusername = loginUser.getUsername();
   String tlcname   = loginUser.getLcname();
   String tpassword = loginUser.getPassword();
   String task      = loginUser.getAsk();
   String tanswer   = loginUser.getAnswer();
   String tcsdate   = DateTools.dateToString(loginUser.getCsdate(),false);
   String taddress  = (loginUser.getS1() == null ? "":loginUser.getS1()) + (loginUser.getS2() == null ? "":loginUser.getS2());
   int flag=loginUser.getFlag();

   if(taddress.equals("��������"))
     taddress = "����";
   if(taddress.equals("�Ϻ��Ϻ�"))
     taddress = "�Ϻ�";
   if(taddress.equals("������"))
     taddress = "���";
   if(taddress.equals("��������"))
     taddress = "����";
   if(taddress.equals("������"))
     taddress = "���";
   if(taddress.equals("���Ű���"))
     taddress = "����";

   String txx       = DicList.getDicValue(SysDefine.DIC_XX,loginUser.getSx(),1);
   String tzf       = DicList.getDicValue(SysDefine.DIC_ZF,loginUser.getZf(),1);
   String txz       = DicList.getDicValue(SysDefine.DIC_XZ,loginUser.getXz(),1);
   String tfs       = DicList.getDicValue(SysDefine.DIC_FS,loginUser.getFs(),1);
   String ttel      = loginUser.getTel()==null? "":loginUser.getTel();
   String tsjtel    = loginUser.getSjtel() == null ? "":loginUser.getSjtel();
   String tqq       = loginUser.getOicq() == null ? "":loginUser.getOicq();
   String temail    = loginUser.getEmail() == null ? "":loginUser.getEmail();
   String isvca     = loginUser.getIsvcation() == 1 ? "����֤" : "δ��֤";
   
   //�ж��ֻ����̶��绰��QQ�������Ƿ����ɧ�����Σ�����λ��ֵ��ʾ��ÿλ���������֣�0��1���ֱ�����ǲ����ͺ���ɧ�Ŵʡ���λ���ֱַ����ֻ����̶��绰��QQ������
   String s1="0"; //�ֻ�
   String s2="0"; //�̶��绰
   String s3="0"; //QQ
   String s4="0"; //����
   String shield=loginUser.getShield()==null?"":loginUser.getShield();
   if (shield.length()==4){
       s1=shield.substring(0,1);
       s2=shield.substring(1,2);
       s3=shield.substring(2,3);
       s4=shield.substring(3,4);
   }
   %>

    <tr>
      <td height="25" colspan="8" align="left" valign="middle" class="tdc"><STRONG>��ţ�</STRONG><%=loginUser.getHyid()%>����<STRONG>����ʱ�䣺</STRONG><%=DateTools.dateToString(loginUser.getRegtime(),true)%>����<STRONG>ע��ʱ�䣺</STRONG><%=DateTools.dateToString(loginUser.getRegtime3(),true)%>����<STRONG>��½ʱ�䣺</STRONG><%=DateTools.dateToString(loginUser.getLasttime(),true)%>����<STRONG>ע��IP��</STRONG><%=loginUser.getHttpip()%></td>
    </tr>
    <%
	     DynaBean dbt =null;
	     Map map=new HashMap();
	     String sqlt="select adv_member_name,adv_member_code from adv_member order by adv_member_code asc";
	     List listt=(List)QueryRecord.query(sqlt);
	     if(listt.size()>0)
	     {
	     	for(int o =0;o<listt.size();o++)
	     	{
	        	dbt =(DynaBean)listt.get(o);
	        	map.put(dbt.get("adv_member_code").toString(),dbt.get("adv_member_name"));
	        }
	      }
	      
	      //����״̬
	      //��Ա�ȼ�
	      String hytype = "��ͨ";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_vip)
	         hytype = "�׽�";
	      if(loginUser.getFlag() != null && loginUser.getFlag().intValue() == SysDefine.SYSTEM_HY_TYPE_nvip)
	         hytype = "VIP";
	         
	      String jyzt="";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT) 
	      	jyzt="�ȴ���";
	      if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
	      	jyzt="�������";
     %>
    <tr>
    
    
      <td height="25" colspan="8" align="left" valign="middle" class="tdc"><STRONG>��Դ���</STRONG><%=map.get(loginUser.getVip()+"")%>��<strong>�Ƿ���֤��</strong><%=isvca %> ��<STRONG>����״̬��<%=jyzt %></STRONG>����<STRONG>��Ա�ȼ���</STRONG><%=hytype%>����<STRONG>����ֵ��</STRONG><%=loginUser.getHots().toString()%>����<STRONG>�Ƿ��Ƽ���</STRONG><%=(loginUser.getIstj()!=null &&loginUser.getIstj()==1)?"�Ƽ�":"δ�Ƽ�"%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>�û���</strong></td>
      <td width="14%" align="center" valign="middle" ><%=tusername%></td>
      <td width="9%" height="25" align="center" valign="middle" class="tdc"><strong>����</strong></td>
      <td width="14%" align="center" valign="middle" ><%if (adminflag==10) {%>
      		<%=tpassword%><% } else {%>
       		<%if (flag==25 || flag==30) {%>
       			******
       		<%}else {%>
       			<%=tpassword%><%} %><%} %></td>
      <td width="11%" align="center" valign="middle" nowrap class="tdc" ><strong>��������</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (adminflag==10) {%>
      		<%=task%><% } else {%>
      		******
      <%} %>
      </td>
      <td width="9%" align="center" valign="middle" nowrap class="tdc" ><strong>�����</strong></td>
      <td width="21%" height="25" align="center" valign="middle" >
      <%if (adminflag==10) {%>
      		<%=tanswer%><% } else {%>
      		******
      <%} %>
      </td>
    </tr>


    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>�ǳ�</strong></td>
      <td width="14%" align="center" valign="middle" ><input name="lcname" type="text" class="txt" id="lcname2" value="<%=tlcname%>" size="12"/></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>�Ա�</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="sex" id="sex">
        <%=DicList.getDicListOption(SysDefine.DIC_SEX,loginUser.getSex())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>סַ</strong></td>
      <td width="14%" align="center" valign="middle" >
      <select name="s1" id="s1" onchange="SetCity(this,document.personal.s2)">
                      <%
                          if(loginUser.getS1()!=null){
                       %>
                          <option value="<%=loginUser.getS1()%>" selected="selected"><%=loginUser.getS1()%></option>
                       <%} %>
                          <option value="����">����</option>
                          <option value="���">���</option>
                          <option value="�ӱ�">�ӱ�</option>
                          <option value="ɽ��">ɽ��</option>
                          <option value="���ɹ�">���ɹ�</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="������">������</option>
                          <option value="�Ϻ�">�Ϻ�</option>
                          <option value="����">����</option>
                          <option value="�㽭">�㽭</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="ɽ��">ɽ��</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="�㶫">�㶫</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="�Ĵ�">�Ĵ�</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="����">����</option>
                          <option value="�ຣ">�ຣ</option>
                          <option value="����">����</option>
                          <option value="�½�">�½�</option>
                          <option value="���">���</option>
                          <option value="����">����</option>
                          <option value="̨��">̨��</option>
                          <option value="����">����</option>
                      </select>
                      <select name="s2" id="s2">
                      <%
                          if(loginUser.getS2()!=null){
                       %>
                          <option value="<%=loginUser.getS2()%>" selected="selected"><%=loginUser.getS2()%></option>
                       <%} %>
                          
                      </select>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>����</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><input name="s3" type="text" id="s3" value="<%=loginUser.getS3() == null ?"":loginUser.getS3()%>"></td>
    </tr>

    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong><strong>����</strong></strong></td>
      <td width="14%" align="center" valign="middle" ><input name="csdate" type="text" id="csdate2" value="<%=tcsdate%>" size="15"></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>��н</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="yx" size="1" class="border" id="select9">
        <%=DicList.getDicListOption(SysDefine.DIC_YX ,loginUser.getYx())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>Ѫ��</strong></td>
      <td width="14%" align="center" valign="middle" ><%=txx%></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>ס��</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><%=tzf%></td>
    </tr>

    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc" style="padding-top:5px;"><strong>����</strong></td>
      <td width="14%" align="center" valign="middle" ><%=txz%></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>���</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="sg" size="1" class="border" id="select5">
        <%=DicList.getDicListOption(SysDefine.DIC_SG ,loginUser.getSg())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>����</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="tz" size="1" class="border" id="select6">
        <%=DicList.getDicListOption(SysDefine.DIC_TZ ,loginUser.getTz())%>
      </select></td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>��ɫ</strong></td>
      <td width="21%" height="25" align="center" valign="middle" ><%=tfs%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>����״��</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="hyzk" size="1" class="border" id="select10">
        <%=DicList.getDicListOption(SysDefine.DIC_HYZH ,loginUser.getHyzk())%>
      </select></td>
      <td width="9%" align="center" valign="middle" nowrap class="tdc" ><strong>�Ļ��̶�</strong></td>
      <td width="14%" align="center" valign="middle" ><select name="whcd" size="1" class="border" id="select8">
        <%=DicList.getDicListOption(SysDefine.DIC_WHCD ,loginUser.getWhcd())%>
      </select></td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>�ֻ���֤</strong></td>
      <td width="14%" align="center" valign="middle" ><%=isvca %></td>
      <td width="9%" align="center" valign="middle" class="tdc" >
      <strong>&nbsp;</strong>
      <%
      if("����֤".equals(isvca)){
    	  %>
    	  <input class="button1 " type='button' value="��δ��֤" width="85" height="28" onclick="checkuserinfo();document.uncheckuserinfo.submit();"/>
    	  <%
      }
      %>
	</td>
      <td width="21%" height="25" align="center" valign="middle" >
      &nbsp;
      </td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>�̶��绰</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s2.equals("1")) {%>
      	<input name="tel" type="text"  id="tel2" size="15" maxlength="20" style="font-size:15px;color='red';font-weight:bold;" value="<%=ttel%>">
       <%
       }else{
       %>
        <input name="tel" type="text"  id="tel2" size="15" maxlength="20" value="<%=ttel%>">
        <%} %>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>�ֻ�</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s1.equals("1")) {%>
      	<input name="sjtel" id ="sjtel" type="text" class="txt" id="sjtel2" size="15" style="font-size:15px;color='red';font-weight:bold;" maxlength="20" value="<%=tsjtel%>" />
      <%
       }else{
       %>
       <input name="sjtel" id ="sjtel" type="text" class="txt" id="sjtel2" size="15" maxlength="20" value="<%=tsjtel%>" />
       <%} %>
      </td>
      <td width="11%" align="center" valign="middle" class="tdc" ><strong>QQ</strong></td>
      <td width="14%" align="center" valign="middle" >
      <%if (s3.equals("1")) {%>
      	<input name="oicq" type="text" class="txt" id="oicq2" size="15" maxlength="20" style="font-size:15px;color='red';font-weight:bold;" value="<%=tqq%>" />
       <%
       }else{
       %>
       	<input name="oicq" type="text" class="txt" id="oicq2" size="15" maxlength="20" value="<%=tqq%>" />
       <%} %>
      </td>
      <td width="9%" align="center" valign="middle" class="tdc" ><strong>E-mail</strong></td>
      <td width="21%" height="25" align="center" valign="middle" >
      <%if (s4.equals("1")) {%>
      	<input name="email" id="email" type="text"  id="email" size="22" maxlength="40" style="font-size:15px;color='red';font-weight:bold;" value="<%=temail%>" />
       <%
       }else{
       %>
        <input name="email" id="email" type="text"  id="email" size="22" maxlength="40" value="<%=temail%>" />
       <%} %>
      </td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><span style="padding-top:7px;"><strong>�Ը�����</strong></span></td>
      <td height="25" colspan="7" align="left" valign="middle" ><%=LoverTools.getXgtzdes(loginUser)%></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><span style="padding-top:7px;"><strong>ҵ�ల��</strong></span></td>
      <td height="25" colspan="7" align="left" valign="middle" ><%=LoverTools.getYYapdes(loginUser)%></td>
    </tr>
    <tr>
      <td width="8%" height="28" align="center" valign="middle" nowrap class="tdc"><strong>��������</strong></td>
      <td height="28" colspan="7" align="left" valign="middle" ><%
                     String jyyx01= "000000";
                     if(loginUser.getJyyx()!= null && loginUser.getJyyx().toString().length() == 6)
                       jyyx01 = loginUser.getJyyx().toString();
                  %>
          <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
            <tr>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx002" value="1"  <%if(jyyx01.charAt(1) == '1') out.print("checked");%> >
                ������</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx012" value="2"   <%if(jyyx01.charAt(2) == '1') out.print("checked");%> >
                  ���ܹ�ϵ</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx022" value="3"  <%if(jyyx01.charAt(3) == '1') out.print("checked");%> >
                ����</td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx032" value="4"   <%if(jyyx01.charAt(4) == '1') out.print("checked");%> >
                ��� </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx042" value="5"   <%if(jyyx01.charAt(5) == '1') out.print("checked");%> >
                ����<input type="hidden" name="jyyx01" id="jyyx01" /></td>
            </tr>
            <!-- <tr>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx032" value="5"   <%//if(jyyx01.charAt(4) == '1') out.print("checked");%> >
                ���� </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx041" value="7"   <%//if(jyyx01.charAt(5) == '1') out.print("checked");%> >
                Eҹ�� </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx052" value="8"   <%//if(jyyx01.charAt(6) == '1') out.print("checked");%> >
                ��� </td>
              <td width="20%"><input name="jyyx" type="checkbox" id="jyyx062" value="9"   <%//if(jyyx01.charAt(7) == '1') out.print("checked");%> >
                ���� </td>
              <td width="20%"><input type="hidden" name="jyyx01" id="jyyx01" />              </td>
            </tr> -->
      </table></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>�鰮��ϵ</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="qggx" cols="80" rows="3" class="put" id="qggx2"><%=uother == null ? "":uother.getQggx()%></textarea></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>��������</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="lxqr" cols="80" rows="3" id="textarea2"><%=uother == null ? "":uother.getLxqr()%></textarea></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>��������</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><textarea name="jyly" cols="80" rows="3" id="textarea"><%=uother == null ? "":uother.getJyly()%></textarea></td>
    </tr>
    <tr align="center">
      <td height="25" colspan="8" valign="middle" nowrap>&nbsp;</td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>�����</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><input name="shr" type="text" id="shr" value="<%=loginUser.getShr() == null ? "":loginUser.getShr()%>"></td>
    </tr>
    <tr>
      <td width="8%" height="25" align="center" valign="middle" nowrap class="tdc"><strong>������</strong></td>
      <td height="25" colspan="7" align="left" valign="middle" ><input name="shqk" type="text" id="shqk" value="<%=loginUser.getShqk() == null ? "":loginUser.getShqk()%>"></td>
    </tr>
    <tr>
      <td height="25" colspan="8" align="center"><input  name="submit" type="submit" class="button1 " value="ȷ���޸�" width="94" height="28" />    </td>
    </tr>
    </form>
    <tr><td height="25" colspan="8" align="center"></td></tr>
    <tr>
      <td height="25" colspan="8" align="center">
      	<form name="qiubo" method="post" onSubmit="return checkqb()" action="saveqiubo.jsp" target="sframe" >
	        <input type="hidden" name="qbname" value="<%=tusername%>">
	      	<input  name="submit" type="submit" class="button1 " value="�ﲨƥ��" width="94" height="28" />
	    </form>  
      </td>
    </tr>
    <tr>
      <td height="25" colspan="11" align="center">&nbsp;</td>
    </tr>
                                  <tr>
      <td height="25" colspan="11" align="center">&nbsp;</td>
    </tr>
</table>
<form name="checkuserinfof" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="checkhyid" value="<%=hyid%>">
</form>
<form name="uncheckuserinfo" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="uncheckhyid" value="<%=hyid%>">
</form>
<form name="shenhe" method="post" action="edithyinfo.jsp?id=<%=hyid %>&isdel=0" >
	 <input type="hidden" name="shenhehyid" value="<%=hyid%>">
</form>
</body>
</html>
<iframe  name="sframe" src="#" width="0" height="0" style="display:none"></iframe>
<script type="text/JavaScript">
function crphoto(pid)
{
  if(!confirm('ȷ��ɾ����ͼƬ��')) return false;
  document.rphoto.p.value=pid;
  document.rphoto.submit();
}

function fsetf(actionid)
{

  document.fset.bizaction.value=actionid;
  document.fset.submit();
}

function checkqb()
{
   /*if(document.qiubo.qbname.value == "")
   {
       alert("�������ﲨ�����û�����");
      return false;
   }*/
   if(confirm("�Ƿ��ﲨƥ��û�Ա?"))
   {
	  return true;
   }else
	  return false;
   return true;
}
function checkuserinfo()
{
   if(confirm("����Ҫ�޸�������֤���"))
   {
	  return true;
   }else
	  return false;
}

function shenheinfo()
{
   if(confirm("����Ҫ�޸�����������"))
   {
	  return true;
   }else
	  return false;
}
</script>
