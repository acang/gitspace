<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%
    String username = SysCommonFunc.getStrParameter(request,"username");
    String hyid     = SysCommonFunc.getStrParameter(request,"hyid");
    String tjid     = SysCommonFunc.getStrParameter(request,"tjid");
    if(tjid != null && tjid.length() > 0)
    {
        session.setAttribute("tjid",tjid);
    }

    Userinfo userinfo = HYRegMng.getHalfUserInfoByHyid(hyid);
    Userinfo userinfo2=HYRegMng.getUserinfoByUsername(username);
    if(userinfo != null && !userinfo.getUsername().toLowerCase().equals(username.toLowerCase()))
    {
        userinfo = null;
    }

    if(userinfo == null)
    {
        out.println("<script>alert('û���ҵ��û���Ϣ�������Ѿ������')</script>");
        return;
    }
    if(userinfo2!=null)
    {
        out.println("<script>alert('������Ϣ��ע�ᣡ');location.href='reg.jsp';</script>");
        return;
    }
    String ssreg = System.currentTimeMillis()+"";
    session.setAttribute("ssreg",ssreg);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
<script src="js/Popup.js"></script>
<script src="js/tom_reg2.js"></script>
<script language="JavaScript">
function tan()
{
    document.getElementById('lcname1').style.display ='none';
    document.getElementById('qggx1').style.display ='none';
    document.getElementById('lxqr1').style.display ='none';
    document.getElementById('jyly1').style.display ='none';
    alert("��ϲ������֤�ɹ�! ��������������.");
}
function tag_byteLen(str) {
    var len = 0;

    for (var i = 0; i < str.length; i++) {
        var code = str.charCodeAt(i);
        if (code > 255) {
            len += 2;
        }
        else {
            len += 1;
        }
    }
    return len;
}

function askCheck(){
    if (checkspace(document.personal.ask.value)){
        document.getElementById("askinfo").innerHTML="<font color='red'>�����������뱣�������⣡��</font>";
        return;
    }
    document.getElementById("askinfo").innerHTML="";
}
function answerCheck(){
          askCheck();
    if (checkspace(document.personal.answer.value)){
        document.getElementById("answerinfo").innerHTML="<font color='red'>�����������뱣���Ĵ𰸣���</font>";
        return;
    }
    document.getElementById("answerinfo").innerHTML="";
    if (document.personal.answer.value==document.personal.ask.value){
        document.getElementById("answerinfo").innerHTML="<font color='red'>�����뱣���𰸲��ܺ����뱣��������ͬ����</font>";
        return;
    }
    document.getElementById("answerinfo").innerHTML="";
}

function lcnameCheck(){
    answerCheck();
    if (checkspace(document.personal.lcname.value)){
        document.getElementById("lcnameinfo").innerHTML="<font color='red'>�������������ǳƣ���</font>";
        return;
    }
    document.getElementById("lcnameinfo").innerHTML="";
    var s =document.personal.lcname.value ;
    if (tag_byteLen(s)>12)
    {
        document.getElementById("lcnameinfo").innerHTML="<font color='red'>����������ǳƲ��ܳ���6����,�������</font>";
        return ;
    }
    document.getElementById("lcnameinfo").innerHTML="";
    var shu="0123456789";
    var s =document.personal.lcname.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        document.getElementById("lcnameinfo").innerHTML="<font color='red'>����������ǳƺ���������ϵ�취������,�������</font>";
        return ;
    }
    document.getElementById("lcnameinfo").innerHTML="";
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        document.getElementById("lcnameinfo").innerHTML="<font color='red'>����������ǳƺ���������ϵ�취������,�������</font>";
        return ;
    }
    document.getElementById("lcnameinfo").innerHTML="";

}


function addressCheck(){
    lcnameCheck();
    if (document.personal.s1.value=='-1')
    {
        document.getElementById("addressinfo").innerHTML="<font color='red'>����ַ�����п����</font>";
        return;
    }
    document.getElementById("addressinfo").innerHTML="";
    if(document.personal.s2.value=="-1" || document.personal.s2.value=="")
    {
        document.getElementById("addressinfo").innerHTML="<font color='red'>�����е�ַ�����п����</font>";
        return;
    }
    document.getElementById("addressinfo").innerHTML="";
    if(document.personal.s3.value=="" || document.personal.s3.value=="����")
    {
        document.getElementById("addressinfo").innerHTML="<font color='red'>�����������ĵ�ַ�������ƣ���</font>";
        return;
    }
    document.getElementById("addressinfo").innerHTML="";
}

function xgtzCheck(){
    addressCheck();
    var xgtz01="";
   var  i=0;
   var j=0;
    for (i=0;i<document.personal.xgtz.length;i++) {
        if (document.personal.xgtz[i].checked)
        {
            j=1+j;
            xgtz01=xgtz01+"1"
        }
        else{
            xgtz01=xgtz01+"0"
        }

    }

    if (j==0||j>=5) {
          document.getElementById("xgtzinfo").innerHTML="<font color='red'>����ѡ�������Ը����������Ҳ����������</font>";
        return;
    }


    document.personal.xgtz01.value=xgtz01;
    document.getElementById("xgtzinfo").innerHTML="";
}
function yyshCheck(){
    xgtzCheck();
var yyap01="";
    var i=0;
    var j=0;
    for (i=0;i<document.personal.yyap.length;i++) {
        if (document.personal.yyap[i].checked)
        {
            j=1+j;
            yyap01=yyap01+"1"
        }
        else{
            yyap01=yyap01+"0"
        }
    }
    if (j==0||j>=5) {
         document.getElementById("yyshinfo").innerHTML="<font color='red'>����ѡ������ҵ�ల�ţ����Ҳ����������</font>";
        return;
    }
    document.personal.yyap01.value=yyap01;
    document.getElementById("yyshinfo").innerHTML="";
}
function jyyxCheck(){
    yyshCheck();
    var jyyx01="";
    var i=0;
    var j=0;
    for (i=0;i<document.personal.jyyx.length;i++) {
        if (document.personal.jyyx[i].checked)
        { j=1+j;
            jyyx01=jyyx01+"1";
        }else
        {
            jyyx01=jyyx01+"0";
        }

    }
    if (j==0||j>=5) {
        document.getElementById("jyyxinfo").innerHTML="<font color='red'>����ѡ�������򣡲��Ҳ����������</font>";
        return;
    }
    document.personal.jyyx01.value="1"+jyyx01;
    document.getElementById("jyyxinfo").innerHTML="";
}

function qggxCheck(){
     jyyxCheck();
    var qggx1 = document.personal.qggx.value;
    if (checkspace(document.personal.qggx.value)){
        document.getElementById("qggxinfo").innerHTML="<font color='red'>�������������鰮��ϵ�Ŀ�������</font>";
        return;
    }
    document.getElementById("qggxinfo").innerHTML="";
    if (document.personal.qggx.value.length>200){
        document.getElementById("qggxinfo").innerHTML="<font color='red'>���鰮��ϵ���Ȳ��ܳ���200�ַ�����</font>";
        return ;
    }
    document.getElementById("qggxinfo").innerHTML="";
    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        document.getElementById("qggxinfo").innerHTML="<font color='red'>����������鰮��ϵ����������ϵ�취�����ݣ���</font>";
        return ;
    }
    document.getElementById("qggxinfo").innerHTML="";
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        document.getElementById("qggxinfo").innerHTML="<font color='red'>����������鰮��ϵ����������ϵ�취�����ݣ���</font>";
        return;
    }
    document.getElementById("qggxinfo").innerHTML="";

    var result = getRepeatData(qggx1);
    if (result!="")
    {
        document.getElementById("qggxinfo").innerHTML="<font color='red'>����������������鰮��ϵ���ԣ���</font>";
        return false;
    }
    document.getElementById("qggxinfo").innerHTML="";
}


function lxqrCheck(){
    qggxCheck();
    var lxqr1 = document.personal.lxqr.value;
    if (checkspace(document.personal.lxqr.value)){
        document.getElementById("lxqrinfo").innerHTML="<font color='red'>�������������������ˣ���</font>";
        return;
    }
    document.getElementById("lxqrinfo").innerHTML="";
    if (document.personal.lxqr.value.length>600){
        document.getElementById("lxqrinfo").innerHTML="<font color='red'>���������˳��Ȳ��ܳ���600�ַ�����</font>";
        return ;
    }
    document.getElementById("lxqrinfo").innerHTML="";
    if (((lxqr1.indexOf("script")>=0)||(lxqr1.indexOf("<")>=0)||(lxqr1.indexOf(">")>=0)))
    {
        document.getElementById("lxqrinfo").innerHTML="<font color='red'>����������������˺���Υ������,�������</font>";
        return;
    }
    document.getElementById("lxqrinfo").innerHTML="";
    s =document.personal.lxqr.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        document.getElementById("lxqrinfo").innerHTML="<font color='red'>��������������к���������ϵ�취������,�������</font>";
        return;
    }
    document.getElementById("lxqrinfo").innerHTML="";
    var result = getRepeatData(lxqr1);
    if (result!="")
    {
        document.getElementById("lxqrinfo").innerHTML="<font color='red'>�����������������������������</font>";
        return;
    }
    document.getElementById("lxqrinfo").innerHTML="";
}



function jylyCheck(){
    lxqrCheck();
    var jyly1 = document.personal.jyly.value;
    if (checkspace(document.personal.jyly.value)){
        document.getElementById("jylyinfo").innerHTML="<font color='red'>�����������Ľ������ԣ���</font>";
        return;
    }
    document.getElementById("jylyinfo").innerHTML="";
    if (document.personal.jyly.value.length>600){
        document.getElementById("jylyinfo").innerHTML="<font color='red'>���������Գ��Ȳ��ܳ���600�ַ�����</font>";
        return;
    }
    document.getElementById("jylyinfo").innerHTML="";
    if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
    {
        document.getElementById("jylyinfo").innerHTML="<font color='red'>��Ϊ��֤����Ч������������20�����ϣ���������д�κ���ϵ��ʽ��</font>";
        return;
    }
    document.getElementById("jylyinfo").innerHTML="";
      var s =document.personal.jyly.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        document.getElementById("jylyinfo").innerHTML="<font color='red'>��������������к���������ϵ�취������,�����</font>";
        return;
    }
    document.getElementById("jylyinfo").innerHTML="";
    var result = getRepeatData(jyly1);
    if (result!="")
    {
        document.getElementById("jylyinfo").innerHTML="<font color='red'>��������������Ľ������ԣ�</font>";
        return;
    }
    document.getElementById("jylyinfo").innerHTML="";
}

function test()
{
    var jyyx01,i,j=0;
    if (checkspace(document.personal.answer.value)){
        alert('���������뱣�������⣡');
        document.personal.answer.focus();
        return;
    }

    if (document.personal.answer.value==document.personal.ask.value){
        alert('���뱣���𰸲��ܺ����뱣��������ͬ��');
        document.personal.answer.focus();
        return;
    }
    if (checkspace(document.personal.answer.value)){
        alert('���������뱣���Ĵ𰸣�');
        document.personal.answer.focus();
        return;
    }

    if (document.personal.answer.value==document.personal.ask.value){
        alert('���뱣���𰸲��ܺ����뱣��������ͬ��');
        document.personal.answer.focus();
        return;
    }

    if (checkspace(document.personal.lcname.value)){
        alert('�����������ǳƣ�');
        document.personal.lcname.focus();
        return;
    }
    var s =document.personal.lcname.value ;
    if (tag_byteLen(s)>12)
    {
        alert('��������ǳƲ��ܳ���6����,������');
        document.personal.lcname.focus();
        return ;
    }
    var shu="0123456789";
    var s =document.personal.lcname.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('��������ǳƺ���������ϵ�취������,������');
        document.personal.lcname.focus();
        return ;
    }
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('��������ǳƺ���������ϵ�취������,������');
        document.personal.lcname.focus();
        return ;
    }
    if (document.personal.s1.value=='-1')
    {
        alert('��ַ�����п��');
        document.personal.s1.focus();
        return;
    }
    if(document.personal.s2.value=="-1" || document.personal.s2.value=="")
    {
        alert('���е�ַ�����п��');
        document.personal.s1.focus();
        return;
    }

    if(document.personal.s3.value=="" || document.personal.s3.value=="����")
    {
        alert('���������ĵ�ַ�������ƣ�');
        document.personal.s1.focus();
        return;
    }

    var xgtz01="",yyap01="",jyyx01=""
    i=0;
    j=0;
    for (i=0;i<document.personal.xgtz.length;i++) {
        if (document.personal.xgtz[i].checked)
        {
            j=1+j;
            xgtz01=xgtz01+"1"
        }
        else{
            xgtz01=xgtz01+"0"
        }

    }

    if (j==0||j>=5) {
        alert("��ѡ�������Ը����������Ҳ��������")
        return;
    }

    document.personal.xgtz01.value=xgtz01;

    i=0;
    j=0;
    for (i=0;i<document.personal.yyap.length;i++) {
        if (document.personal.yyap[i].checked)
        {
            j=1+j;
            yyap01=yyap01+"1"
        }
        else{
            yyap01=yyap01+"0"
        }
    }
    if (j==0||j>=5) {
        alert("��ѡ������ҵ�ల�ţ����Ҳ��������")
        return;
    }
    document.personal.yyap01.value=yyap01;

    i=0;
    j=0;
    for (i=0;i<document.personal.jyyx.length;i++) {
        if (document.personal.jyyx[i].checked)
        { j=1+j;
            jyyx01=jyyx01+"1";
        }else
        {
            jyyx01=jyyx01+"0";
        }

    }
    if (j==0||j>=5) {
        alert("��ѡ�������򣡲��Ҳ��������")
        return;
    }
    document.personal.jyyx01.value="1"+jyyx01;

    if (checkspace(document.personal.qggx.value)){
        alert('�����������鰮��ϵ�Ŀ�����');
        document.personal.qggx.focus();
        return;
    }

    if (document.personal.qggx.value.length>200){
        alert('�鰮��ϵ���Ȳ��ܳ���200�ַ���');
        document.personal.qggx.focus();
        return ;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('��������鰮��ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return ;
    }
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('��������鰮��ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return;
    }

    if (checkspace(document.personal.lxqr.value)){
        alert('�����������������ˣ�');
        document.personal.lxqr.focus();
        return;
    }

    if (document.personal.lxqr.value.length>600){
        alert('�������˳��Ȳ��ܳ���600�ַ���');
        document.personal.lxqr.focus();
        return ;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('����������Թ�ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return;
    }
    var m = document.personal.lxqr.value;
    if (((m.indexOf("http")>=0)||(m.indexOf("www")>=0)||(m.indexOf("@")>=0)))
    {
        alert('��������������˺���������ϵ�취������,������');
        document.personal.lxqr.focus();
        return;
    }
    j=0;
    var x=0;
    for (i=0;i<m.length;i++)
    {
        if ((shu.indexOf(m.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('��������������˺���������ϵ�취������,������');
        document.personal.lxqr.focus();
        return;
    }


    if (checkspace(document.personal.jyly.value)){
        alert('���������Ľ������ԣ�');
        document.personal.jyly.focus();
        return;
    }
    if (document.personal.jyly.value.length>600){
        alert('�������Գ��Ȳ��ܳ���600�ַ���');
        document.personal.jyly.focus();
        return;
    }
    if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
    {
        alert('Ϊ��֤����Ч������������20�����ϣ���������д�κ���ϵ��ʽ');
        document.personal.jyly.focus();
        return;
    }
    s =document.personal.jyly.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('������������к���������ϵ�취������,������');
        document.personal.jyly.focus();
        return;
    }
    var qggx1 = document.personal.qggx.value;
    var lxqr1 = document.personal.lxqr.value;
    var jyly1 = document.personal.jyly.value;

    if (((qggx1.indexOf("script")>=0)||(qggx1.indexOf("<")>=0)||(qggx1.indexOf(">")>=0)||(qggx1.indexOf("null")>=0|| (qggx1==""))))
    {
        alert('��������鰮��ϵ����Υ������,������');
        document.personal.qggx.focus();
        return false;
    }
      var result = getRepeatData(qggx1);
    if (result!="")
    {
        alert('��������������鰮��ϵ���ԣ�');
        document.personal.qggx.focus();
        return false;
    }

    if (((lxqr1.indexOf("script")>=0)||(lxqr1.indexOf("<")>=0)||(lxqr1.indexOf(">")>=0)))
    {
        alert('��������������˺���Υ������,������');
        document.personal.lxqr.focus();
        return false;
    }
     result = getRepeatData(lxqr1);
    if (result!="")
    {
        alert('���������������������������');
        document.personal.lxqr.focus();
        return false;
    }
    if (((jyly1.indexOf("script")>=0)||(jyly1.indexOf("<")>=0)||(jyly1.indexOf(">")>=0)))
    {
        alert('������Ľ������Ժ���Υ������,������');
        document.personal.jyly.focus();
        return false;
    }
    result = getRepeatData(jyly1);
    if (result!="")
    {
        alert('������������Ľ������ԣ�');
        document.personal.jyly.focus();
        return false;
    }
    j=0;
    x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('������������к���������ϵ�취������,������');
        document.personal.jyly.focus();
        return;
    }

    if (checkspace(document.personal.sjtel.value))
    {
        alert("�������ֻ�����");
        document.personal.sjtel.focus();
        return ;
    }
    var reg = /^1[3|4|5|7|8]\d{9}$/;
    if(!reg.test(document.personal.sjtel.value))
    {
        alert("�ֻ����벻��ȷ!");
        document.personal.sjtel.focus();
        return;
    }
    document.personal.submit();
 }

function checkspace(checkstr) {
    var str = '';
    for(i = 0; i < checkstr.length; i++) {
        str = str + ' ';
    }
    return (str == checkstr);
}
function Check(){
    document.cform.username.value=document.personal.username.value;
    document.cform.submit();

}

function getRepeatData(data){
    var data_array=data.split("");
    var result ="";
    for(var i=0;i<data_array.length;i++){
        if(data_array[i]!="" &&data_array[i+1]!="" &&data_array[i+2]!="" &&data_array[i+3]!="" ){
            if(data_array[i]==data_array[i+1] &&data_array[i]==data_array[i+2] &&data_array[i]==data_array[i+3]){
                result = data_array[i]+"���ֳ���4��";
                break;
            }
        }
    }
    return result;
}
</script>
</head>
<body class="reg"  onpaste="return false;" onselectstart="return false;" oncopy="return false;" oncut="return false;">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
  <div class="lm_name">
    <h2>��ʵע�ᣬ�ҵ����ĵ����ѣ�</h2>
  </div>
  <div class="step_box"><span>1���û�������������</span><span class="current">2�����ƻ������ϼ���ϵ��ʽ</span><span>3���ύ���</span></div>
  <div style="clear:both"></div>
  <form name="personal" method="post" action="afterreg2newuser.jsp">
  <input name="biz_action" value="01" type="hidden">
  <input name="username" value="<%=userinfo.getUsername()%>" type="hidden">
  <input name="hyid" value="<%=userinfo.getHyid()%>" type="hidden">
  <input name="ssreg" value="<%=ssreg%>" type="hidden"/>
<table width="888" border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" style="margin-bottom:0">
              <tbody>
              	<tr>
                  <td colspan="2" align="center" bgcolor="#D6E6F3" class="bk04" style="color:red;">
                  <div class="lm_name" style="text-align:center;font-size:17px;height:30px;"><strong>�뱾����ʵ��д�������ֵ绰��ͨ���ͷ���˺󼤻����ߡ��粻Ը����ˣ�����ע�ᣬ�����˷�����ʱ�䣡 </strong> </div>
                  </td>
                </tr>
                <tr>
                  <td width="200" align="right" bgcolor="#D6E6F3" class="bk04"><strong>�û�����</strong></td>
                  <td bgcolor="#FFFFFF"><strong><%=userinfo.getUsername()%></strong></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���뱣�����⣺</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="ask" type="text" class="txt01" id="ask" value="" onblur="askCheck()">
                    ���磺�ҵ�ĸ�׽�ʲô����<div id="askinfo"></div></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���뱣���𰸣�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="answer" type="text" class="txt01" id="answer" value="" onblur="answerCheck()">
                      ���磺������<div  id="answerinfo"></div></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�����Ա�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="sex" id="sex">
                      <%=DicList.getDicListOption(SysDefine.DIC_SEX, "-1")%>
                      </select>������ʵѡ���޷��޸ģ�
                  </td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04" style="padding-top:5px;"><strong>�ǡ��ƣ�</strong></td>
                  <td  bgcolor="#FFFFFF" class="bk04">
                      <input name="lcname" type="text" class="txt01" id="lcname" size="12" maxlength="12"  style="width:200px;" value="" onblur="lcnameCheck()" />
                      ����һ�������Ľ����ǳƣ�<div id="lcnameinfo"></div></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���գ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <select name="year">
                          <%
                              Date cDate = new Date(System.currentTimeMillis());
                              int year = cDate.getYear()+1900;
                              for(int i =year-70;i <(year-15);i ++)
                              {
                          %>
                           <option value="<%=i%>"><%=i%></option>
                          <%
                              }
                          %>
                      </select>
                      ��
                      <select name="month">
                          <%
                              for(int i =1;i <13;i ++)
                              {
                          %>

                          <option value="<%=i%>"><%=i%></option>
                          <%
                              }
                          %>
                      </select>
                      ��
                      <select name="day">
                          <%
                              for(int i =1;i <32;i ++)
                              {
                          %>

                          <option value="<%=i%>"><%=i%></option>
                          <%
                              }
                          %>
                      </select>
                      ��
                      <!-- ���Ա�һ����д�ύ�������޸ģ�ֻ�ܲ鿴�������ϣ���׼ȷ��д���� --></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>סַ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <select name="s1" id="s1" onchange="SetCity(this,document.personal.s2)">
                          <option value="-1" selected>��ѡ��</option>
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
                      <select name="s2" id="s2" style="width:80px;">
                          <option value="-1" selected>��ѡ��</option>
                      </select>
                      <input name="s3" type="text" class="input02" id="s3" value="����" size="12" maxlength="5" onclick="this.value=''" onblur="addressCheck()"/>
                      <div id="addressinfo"></div>
                    </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>��ߣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <select name="sg" size="1" class="border" id="sg" onclick="addressCheck()">
                      <%=DicList.getDicListOption(SysDefine.DIC_SG,"-1")%>
                  </select>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>����</strong>��
                          <select name="tz" size="1" class="border" id="select7">
                              <%=DicList.getDicListOption(SysDefine.DIC_TZ,"-1")%>
                          </select>
                          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>��ɫ</strong>��
                              <select name="fs" size="1" class="border" id="fs">
                                  <%=DicList.getDicListOption(SysDefine.DIC_FS,"-1")%>
                              </select>               </td>
                </tr>


                
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>Ѫ�ͣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="sx" id="sx">
                      <%=DicList.getDicListOption(SysDefine.DIC_XX,"-1")%>
                  </select>
                      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;   &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>������</strong>
                      <select name="xz" id="xz">
                          <%=DicList.getDicListOption(SysDefine.DIC_XZ,"-1")%>
                      </select>
                   </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>����״����</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="hyzk" size="1" class="border" id="hyzk">
                      <%=DicList.getDicListOption(SysDefine.DIC_HYZH,"-1")%>
                  </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�Ļ��̶ȣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="whcd" size="1" class="border" id="whcd">
                      <%=DicList.getDicListOption(SysDefine.DIC_WHCD,"-1")%>
                  </select>
                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <strong>ְҵ��</strong>
                      <select name="zy" size="1" class="border" id="zy">
                          <%=DicList.getDicListOption(SysDefine.DIC_ZY,"-1")%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>��н��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="yx" size="1" class="border" id="yx">
                      <%=DicList.getDicListOption(SysDefine.DIC_YX,"-1")%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>ס����</strong>
                      <select name="zf" size="1" class="border" id="zf">
                          <%=DicList.getDicListOption(SysDefine.DIC_ZF,"-1")%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;"><strong>�Ը�������</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td style="border-bottom:none; width:100px; padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz00" value="1">������</td>
                          <td style="border-bottom:none; width:100px;padding:0; height:20px;">
                            <input name="xgtz" type="checkbox" id="xgtz19" value="1">�����ֹ�</td>
                          <td style="border-bottom:none; width:100px;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz02" value="1" />��Ȥ��Ĭ</td>
                          <td style="border-bottom:none; width:100px;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz03" value="1" />ֱˬ�ɴ�</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz04" value="1" />׷��̼�</td>
                        </tr>
                        <tr>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz05" value="1">����С��</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz06" value="1" />��ʵ��ֱ</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz07" value="1" />��������</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz08" value="1" />��������</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz09" value="1" />С�Ľ���</td>
                        </tr>
                        <tr>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz10" value="1">��������</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz11" value="1" />����Ƹ�</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz12" value="1" />ѭ�浸��</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz13" value="1" />���Թ���</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="xgtz" type="checkbox" id="xgtz14" value="1" />
                              <input type="hidden" name="xgtz01"></td>
                        </tr>
                      </tbody>
                    </table>
                      <div id="xgtzinfo"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;border-bottom:#21648f 1px dashed"><strong>ҵ������ţ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04" style="border-bottom:#21648f 1px dashed"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td style="border-bottom:none;width:100px;padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap00" value="1" onclick="xgtzCheck()"/>�� �� ��</td>
                          <td style="border-bottom:none;width:100px;padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap13" value="1"  onclick="xgtzCheck()"/>�� �� ��</td>
                          <td style="border-bottom:none;width:100px;padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap02" value="1"  onclick="xgtzCheck()"/>��������</td>
                          <td style="border-bottom:none;width:100px;padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap03" value="1"  onclick="xgtzCheck()"/>�ϡ�����</td>
                          <td style="border-bottom:none;padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap04" value="1"  onclick="xgtzCheck()"/>�� ��OK</td>
                        </tr>
                        <tr>
                          <td style="border-bottom:none; padding:0; height:20px;">
                            <input name="yyap" type="checkbox" id="yyap05" value="1" onclick="xgtzCheck()">�� �� ��</td>
                          <td style="border-bottom:none; padding:0; height:20px;"> 
                            <input name="yyap" type="checkbox" id="yyap06" value="1" onclick="xgtzCheck()">�Ȳ�����</td>
                          <td style="border-bottom:none; padding:0; height:20px;">
                            <input name="yyap" type="checkbox" id="yyap07" value="1" onclick="xgtzCheck()">�����˶�</td>
                          <td style="border-bottom:none; padding:0; height:20px;"> 
                            <input name="yyap" type="checkbox" id="yyap08" value="1" onclick="xgtzCheck()">��׬Ǯ</td>
                          <td style="border-bottom:none; padding:0; height:20px;">
                            <input name="yyap" type="checkbox" id="yyap09" value="1" onclick="xgtzCheck()">�������
                            <input type="hidden" name="yyap01"></td>
                        </tr>
                        <tr>
                          <td style="border-bottom:none; padding:0; height:20px;">
                              <input name="yyap" type="checkbox" id="yyap10" value="1"  onclick="xgtzCheck()"/>�ύ����</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                          <td style="border-bottom:none; padding:0; height:20px;">&nbsp;</td>
                        </tr>
                      </tbody>
                    </table>
                      <div id="yyshinfo"></div>
                  </td>
                </tr>
                </tbody>
                </table>
                <table width="888" border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" style="margin-top:1px; padding:0; margin-bottom:0">
                <tbody>
                <tr>
                  <td align="right" width="200"  bgcolor="#D6E6F3" class="bk04" style="border-top:#21648f 1px solid"><strong>��������</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"  style="border-top:#21648f 1px solid"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                      <tbody>
                        <tr>
                          <td style="border-bottom:none;width:100px; padding:0; height:20px;"><input name="jyyx" type="checkbox" id="jyyx002" value="1"  onclick="yyshCheck()"/>
                            �� �� ��</td>
                          <td style="border-bottom:none;width:110px; padding:0; height:20px;"><input name="jyyx" type="checkbox" id="jyyx012" value="2"  onclick="yyshCheck()"/>
                            �� �� �� ϵ</td>
                          <td style="border-bottom:none;width:100px; padding:0; height:20px;"><input name="jyyx" type="checkbox" id="jyyx022" value="3"  onclick="yyshCheck()"/>
                            �顡��</td>
                          <td style="border-bottom:none;width:100px; padding:0; height:20px;"><input name="jyyx" type="checkbox" id="jyyx032" value="4"  onclick="yyshCheck()"/>
                            �㡡��</td>
                          <td style="border-bottom:none; padding:0; height:20px;"><input name="jyyx" type="checkbox" id="jyyx042" value="5"  onclick="yyshCheck()"/>
                            �䡡��
                              <input type="hidden" name="jyyx01" />
                          </td>
                        </tr>
                      </tbody>
                    </table>
                      <div id="jyyxinfo"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04"><strong>�鰮��ϵ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">����Ϊ���顢�������԰��Ĺ�ϵ��ʲô��������д�κ���ϵ��ʽ
                  <br/>
                      <textarea name="qggx" cols="58" rows="4" value="" style="width:98%" onblur="qggxCheck()" onclick="jyyxCheck()"></textarea>
                      <div id="qggxinfo"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04"><strong>�������ˣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">Ϊ��֤����Ч��������ϸ�������������ˣ�������д�κ���ϵ��ʽ<br/>
                          <textarea name="lxqr" cols="" rows="4" value="" style="width:98%" onblur="lxqrCheck()"></textarea>
                          <div id="lxqrinfo"></div></td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04" style="border-bottom:#21648f 1px dashed"><strong>�������ԣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04" style="border-bottom:#21648f 1px dashed">Ϊ��֤����Ч������������20�����ϣ�������д�κ���ϵ��ʽ<br/>
                          <textarea name="jyly" cols="" rows="6" value="" style="width:98%" onblur="jylyCheck()"></textarea>
                          <div id="jylyinfo"></div></td>
                </tr>
              </tbody>
                </table>
                <table width="888" border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" style="margin-top:1px; padding:0; margin-bottom:0">
                <tbody>
                <tr>
                  <td align="right" width="200"  bgcolor="#FFFFFF" class="bk04" style="border-top:#21648f 1px solid"><strong>��ϵ��ʽ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04" style="border-top:#21648f 1px solid">(����д������ʵ��ϵ��ʽ���Ա���վ��˼�������Ա������ϵ��ע����뵽����ר�����п����趨)</td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04"><strong><strong>�ֻ���</strong></strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><input name="sjtel" type="text" class="input02" size="30" value="">
                    �����ͬʱ֧���ֻ����ŵ�½��</td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04"><strong>�̶��绰��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><input name="tel" type="text" class="input02" size="30" value=""></td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04"><strong>QQ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><input name="oicq" type="text" class="input02" size="30">
                  </td>
                </tr>
                <tr>
                  <td align="right"  bgcolor="#D6E6F3" class="bk04" style="border:0;"><strong>E-mail��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04" style="border:0;"><input name="email" type="text" class="input02" size="30" value="@">
                  </td>
                </tr>
                <tr>
                    <td align="right" valign="top" bgcolor="#D6E6F3" class="bk04"><strong>΢�ţ�</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04"><input name="wx" type="text" class="input02" size="30" value="" />
                    </td>
                </tr>
                <tr>
                  <td colspan="2" align="center" bgcolor="#D6E6F3" style="border:0; padding:30px 0;"><input name="bsendsms" type="button" id="bsendsms"  onClick="javascript:test();" value="�ύ���" class="btn"></td>
                </tr>
              </tbody>
            </table>
  </form>
  <div style="clear:both"></div>
  <div class="erweima_box" style="top:108px">
    <div class="lm_name02">
      <h2>ɨ���ά��</h2>
    </div>
    <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
    <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
  </div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>

<form name="cform" action="checkuname.jsp" method="post" target="cname">
    <input name="username" value="" type="hidden"/>
</form>
<iframe name="cname" id="cname" src="" height="0" width="0">
</iframe>

<script language="javascript">

    SetCity(document.personal.s1,document.personal.s2);

</script>

