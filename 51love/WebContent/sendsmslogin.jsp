<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.SMSTools" %>
<%
	String sjtel = SysCommonFunc.getStrParameter(request,"sjtel");
	sjtel = sjtel.toLowerCase();
	String s = SMSTools.sendSjdl(sjtel,request);
	if(s != null)
	{
%>
       <script language='javascript'>{alert('<%=s%>');window.parent.location.replace('grzq.jsp');}</script>
    <%}else{ %>
 	   <script language='javascript'>{alert('У�����ѷ��͵������ֻ�����2������û���յ��������µ��[��ѻ�ȡУ����]��ť���У����');window.close();}</script>

<%
    }
%>