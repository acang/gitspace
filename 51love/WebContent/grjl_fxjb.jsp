<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.obj.*" %>
<%@ page import="com.web.common.*" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.*"%>  
<%@ page import="java.text.*"%>
<%@ page import="java.sql.Date"%>
<%@ page import="java.sql.Timestamp"%>
<%@ page import="com.web.bean.*" %>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="com.lover.mng.BBSMng" %>

<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('��¼�ѳ�ʱ�������µ�¼��');history.go(-1);</script>");
        return;
    }

    Bbsuser bu = BBSMng.getBbsuserByHyid(loginUser.getHyid().toString());	
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
</head>
<body class="cm_grzx">
  <div class="block01">
		<table width="100%" border="1" style="border-color:#fffacd" cellspacing="0" cellpadding="0" >
          <tbody>
            <tr>
            	<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>΢�ŷ�����</strong></td>
				<td width="12%" align="center" style="background-color:#f2f4f8; height: 30px"><strong>��������</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>�Ƽ�����</strong></td>
				<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>������</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>ɾ��������</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>ԭ���</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>�½��</strong></td>
        		<td width="16%" align="center" style="background-color:#f2f4f8;" ><strong>�ܽ��</strong></td>
			</tr>
			<%
		        if(bu == null)
		        {
		    %>
			<tr>
				<td align="center" colspan="8">û�м�¼</td>
			</tr>
			<%
			}else{
			%>
			<tr>
			<td width="5%" align="center"><%=bu.getSharenumber()==null?0:bu.getSharenumber()%></td>
            	<%
            long topicold = bu.getTopics()==null?0:bu.getTopics();
            long topicnew = bu.getTopicsnew()==null?0:bu.getTopicsnew();
        %>
       <td width="5%" align="center"><%=topicold+topicnew%></td>
        <td width="5%" align="center"><%=bu.getCommend()==null?0:bu.getCommend()%></td>
        <td width="5%" align="center">
            <%
                 long replynum = bu.getReplynum()==null?0:bu.getReplynum();
				 long resum = bu.getResum()==null?0:bu.getResum();	
            %>
            <%=resum+replynum%>
        </td>

        <td width="5%" align="center"><%=bu.getDelresum()==null?0:bu.getDelresum()%></td>
        <td width="5%" align="center" ><%=bu.getMoneys()==null?0:bu.getMoneys()%> </td>
        <td width="5%" align="center" ><%=bu.getMoneynew()==null?0:bu.getMoneynew()%> </td>
        <%
            long moneyold = bu.getMoneys()==null?0:bu.getMoneys();
            long moneynew = bu.getMoneynew()==null?0:bu.getMoneynew();
        %>
        <td width="5%" align="center" ><%=moneyold+moneynew%> </td>
        </tr>
            <%
				}
			%>
          </tbody>
    </table>

    <div style="clear:both;"></div>
    
    <div class="block01" style="font-size: 18px;">
		<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
          <tbody>
           <tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			</tr>
            <tr>
            	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top" colspan="2">
					<strong>&nbsp;&nbsp;��΢�ŷ�����̳���£��Լ�����̳�����������ͻ��������Ի�ý�ҽ������������<br/>
					���������£�</strong><br/>
				</td>
			</tr>
            <tr>
            	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					1��
				</td>
				<td>
				 �����˷������̳���·���΢������Ȧ��΢�ź��ѡ��ֻ�QQȺ���ж��ٴ��Ķ��ͽ�����<br/>
				 �ٸ���ҡ�һ��΢������Ȧ���м����ˣ�����һƪ����ʸߵ�����ͨ������׬ȡ��ʮ����<br/>
				 �ٽ�ҡ�<br/>
				</td>
			</tr>
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					2�� 
					</td>
					<td>
					 ���ͨ������̳����������100���/ƪ���������������л�Ա��������ÿ�������ٽ�����<br/>
					 8����ҡ�<br/>
					</td>
			</tr>
			 
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					3��
					</td>
					<td>
					��̳��������8���/���������Ļ�����������Ա���ޣ���ÿ�������ٽ�����2����ҡ���<br/>
					�л����ᱻɾ������˫���۳������˵Ľ�ң�����16�����/ƪ����<br/>
					Υ�����ɻ����������ݡ��������޹ء����ƻ��ظ������ݡ����и�����ϵ�취�����ݡ�<br/>
					</td>
			</tr>
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					4�� 
					</td>
					<td>
					ÿ�������۽������10000���ʱ���Ϳ��Ի�ȡһ����VIP��Ա�����۵�20000���ʱ����<br/>
					��ȡһ���ڰ׽�VIP��Ա����ʱ���ڡ�<a href="./kfzx.htm" target="_blank" style="color: blue">��ϵ����</a>���������룬�Ա����Ա��ʵ����<br/>
					</td>
			</tr>
			<tr>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			<td>&nbsp;</td>
			</tr>
			
          </tbody>
        </table>
    </div>
    
    
</div>
</body>
</html>
