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
        out.println("<script language='javascript'>alert('登录已超时，请重新登录！');history.go(-1);</script>");
        return;
    }

    Bbsuser bu = BBSMng.getBbsuserByHyid(loginUser.getHyid().toString());	
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
</head>
<body class="cm_grzx">
  <div class="block01">
		<table width="100%" border="1" style="border-color:#fffacd" cellspacing="0" cellpadding="0" >
          <tbody>
            <tr>
            	<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>微信分享数</strong></td>
				<td width="12%" align="center" style="background-color:#f2f4f8; height: 30px"><strong>主题贴数</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>推荐贴数</strong></td>
				<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>回帖数</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>删除回帖数</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>原金币</strong></td>
        		<td width="12%" align="center" style="background-color:#f2f4f8;" ><strong>新金币</strong></td>
        		<td width="16%" align="center" style="background-color:#f2f4f8;" ><strong>总金币</strong></td>
			</tr>
			<%
		        if(bu == null)
		        {
		    %>
			<tr>
				<td align="center" colspan="8">没有记录</td>
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
					<strong>&nbsp;&nbsp;在微信分享论坛文章，以及在论坛发布主题帖和回帖均可以获得金币奖励，具体分享奖<br/>
					励政策如下：</strong><br/>
				</td>
			</tr>
            <tr>
            	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					1、
				</td>
				<td>
				 将适宜分享的论坛文章分享到微信朋友圈、微信好友、手机QQ群，有多少次阅读就奖励多<br/>
				 少个金币。一般微信朋友圈都有几百人，发布一篇点击率高的文章通常都能赚取几十到几<br/>
				 百金币。<br/>
				</td>
			</tr>
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					2、 
					</td>
					<td>
					 审核通过的论坛主题帖获赠100金币/篇，若您的主题帖有会员回帖，则每个回帖再奖励您<br/>
					 8个金币。<br/>
					</td>
			</tr>
			 
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					3、
					</td>
					<td>
					论坛回帖获赠8金币/个，若您的回帖被其他会员点赞，则每个点赞再奖励您2个金币。下<br/>
					列回帖会被删除，则双倍扣除回帖人的金币（即扣16个金币/篇）：<br/>
					违反法律或不文明的内容、与主题无关、复制或重复的内容、含有各种联系办法的内容。<br/>
					</td>
			</tr>
			 <tr>
			 	<td width="8%" valign="top">&nbsp;</td>
				<td valign="top">
					4、 
					</td>
					<td>
					每当您积累金币数到10000金币时，就可以换取一年期VIP会员，积累到20000金币时，可<br/>
					换取一年期白金VIP会员。届时请在“<a href="./kfzx.htm" target="_blank" style="color: blue">联系我们</a>”留言申请，以便管理员核实办理。<br/>
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
