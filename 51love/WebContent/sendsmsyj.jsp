<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.SMSTools" %>
<%
String sjtel = SysCommonFunc.getStrParameter(request,"sjtel2");
sjtel = sjtel.toLowerCase();
%>
<%
if(sjtel == null || sjtel.trim().length() ==0)
{
%>
<script language='javascript'>{alert('�������ֻ����룡');window.close();}</script>
<%
  return;
} 
 %>
 

<%
   String s = SMSTools.sendSjyz(sjtel,request);
%>

<%
if(s != null)
{
%>

<script language='javascript'>{alert('<%=s%>');window.close();}</script>
<%
}else{
	
%>

 <script language='javascript'>{alert('ע����֤���ѷ��͵������ֻ�����2������û���յ��������µ��[��ȡ������֤��]��ť���ע����֤�룬������ֻ�������֤');window.close();}</script>

<%
    }
%>.