<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>

<%
//δ�����ܣ��жϸ�����������������õ� û�и���״̬�ж��Ƿ���ʾ��ϸ��ϵ��ʽ��ť
Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
String number= SysCommonFunc.getStrParameter(request,"number");
String hyid = SysCommonFunc.getStrParameter(request,"id");
if(hyid.length() ==0)
{
  out.println("<script language='javascript'>alert('��Ա��Ϣ�����ڣ�');window.close();</script>");
  return;
}

if(SysCommonFunc.getNumberFromString(hyid,0)==0)
{
      out.println("<script language='javascript'>alert('��Ա��Ϣ�����ڣ�');window.close();</script>");

   System.out.println("sqlע��"+hyid);
   return;
}

Userinfo hyInfo = HYRegMng.getUserinfoByHyid(hyid);
if(hyInfo ==null)
{
  out.println("<script language='javascript'>alert('��Ա��Ϣ�����ڣ�');window.close();</script>");
  return;
}

Userother uother = HYRegMng.getUserOtherByHyid(hyid);

          String jyzt ="";
          if(hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT)
            jyzt = "�ȴ���";
          else if(hyInfo.getSetzt().intValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT)
            jyzt = "�������";
          String jyyx01 = "00000000";
          if(hyInfo.getJyyx() != null && hyInfo.getJyyx().toString().length() ==8)
             jyyx01 = hyInfo.getJyyx().toString();
          String jyyx = "";
          for(int i=0;i < 7;i ++)
          {
             if(jyyx01.charAt(i+1) == '1')
               jyyx = jyyx + SysDefine.jyyxArray[i]+"&nbsp;&nbsp;";
          }

String afilepath = SysCommonFunc.getPhotoView();
String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%=hyInfo.getLcname()%>-����Ӱ��-51��������</title>
<META content="<%=uother == null ? "":uother.getJyly()%> <%=uother == null ? "":uother.getQggx()%>" name="description">
<META content="<%=jyyx%>��Ӱ���ļ���<%=hyInfo.getS1() == null? "":hyInfo.getS1()%>���ѣ�<%=hyInfo.getLcname()%>" name="keywords">

<script>
<!--

function MM_openBrWindow1(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}

function MM_openBrWindow(theURL,winName,features) { //v2.0
  window.open(theURL,winName,features);
}
//-->


function click() {
alert('��ֹ���ƣ�') }
function click1() {
if (event.button==2) {alert('��ֹ���ƣ�') }}
function CtrlKeyDown(){
if (event.ctrlKey) {alert('��ֹ���ƣ�') }}
document.onkeydown=CtrlKeyDown;
document.onselectstart=click;
document.onmousedown=click1;


</script>

</head>

<body onpaste="return false;" onselectstart="return false;" oncopy="return false;" oncut="return false;">

                        <%
                        if(number.equals("1"))
                        {
                        %>
           <a href="getphoto.jsp?number=1&id=<%=hyid%>"><img src="../<%=afilepath+File.separator+uother.getUserphoto1()%>" border="0"></a>
                       <%
                        }
                       %>
                       
                        <%
                        if(number.equals("2"))
                        {
                        %>
           <a href="getphoto.jsp?number=2&id=<%=hyid%>"><img src="../<%=afilepath+File.separator+uother.getUserphoto2()%>" border="0"></a>
                       <%
                        }
                       %>
                        <%
                        if(number.equals("3"))
                        {
                        %>
           <a href="getphoto.jsp?number=3&id=<%=hyid%>"><img src="../<%=afilepath+File.separator+uother.getUserphoto3()%>" border="0"></a>
                       <%
                        }
                       %>
                        <%
                        if(number.equals("4"))
                        {
                        %>
           <a href="getphoto.jsp?number=4&id=<%=hyid%>"><img src="../<%=afilepath+File.separator+uother.getUserphoto4()%>" border="0"></a>
                       <%
                        }
                       %>
                        <%
                        if(number.equals("5"))
                        {
                        %>
           <a href="getphoto.jsp?number=5&id=<%=hyid%>"><img src="../<%=afilepath+File.separator+uother.getUserphoto5()%>" border="0"></a>
                       <%
                        }
                       %>
</body>
</html>

