<%@ page contentType="text/html; charset=gbk"%>
<%@ taglib uri="/FCKeditor.tld.tld" prefix="FCK"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
	Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
	String contextPath = request.getContextPath();
	String basePath = contextPath + "/commonlib/fckeditor/";
	String skinPath = contextPath
			+ "/commonlib/fckeditor/editor/skins/office2003/";
	String imageBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Image&Connector=connectors/jsp/connector";
	String linkBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Connector=connectors/jsp/connector";
	String flashBrowserURL = contextPath
			+ "/commonlib/fckeditor/editor/filemanager/browser/default/browser.jsp?Type=Flash&Connector=connectors/jsp/connector";
	String imageUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Image";
	String linkUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=File";
	String flashUploadURL = contextPath
			+ "/fckeditor/editor/filemanager/upload/simpleuploader?Type=Flash";
%>
<%
	String bizaction = SysCommonFunc.getStrParameter(request,
			"bizaction");
	String kfzxtype = SysCommonFunc
			.getStrParameter(request, "kfzxtype");
	String email = SysCommonFunc.getStrParameter(request,"email");
	String id = SysCommonFunc.getStrParameter(request, "id");
	if (bizaction.equals("add")) {
		//判断邮件来自客服中心还是用户发送
		Kfzx kfzx = KFZXMng.getKfzxFromId(id);
		if (kfzx!=null){
			if (kfzx.getSource()==0){
				///发送邮件
				String s = KFZXMng.sendBack(request);
				String sql= "update kfzx set email2 = '"+email+"',deletename= '"+adminLoginInfo.getAdminname()+"' where id="+id;
			    HbmOperator.executeSql(sql);
				if (s == null) {
					//out.println("<script langauge=javascript>alert('发送成功！');window.location.href='../kfzxlist.jsp?ntype="+kfzxtype+"';</script>");
					out
							.println("<script langauge=javascript>alert('发送成功！');window.top.close();</script>");
					return;
				} else {
					out.println("<script langauge=javascript>alert('" + s
							+ "！');</script>");
				}
			}else{
				//手机
				if (kfzx.getMobileoremail()==0){
					UserInfoSendReply userInfoSendReply=new UserInfoSendReply();
	   				userInfoSendReply.setHyid(kfzx.getHyid());
	   				userInfoSendReply.setUsername(kfzx.getUsername());
	   				userInfoSendReply.setContent(SysCommonFunc.getTextFromHtml(SysCommonFunc.getStrParameter(request, "content")));
	   				userInfoSendReply.setHdate(new Date(System.currentTimeMillis()));
	   				userInfoSendReply.setSendorreply(0);
	   				userInfoSendReply.setSender(adminLoginInfo.getAdminname());
	   				userInfoSendReply.setSendtype(1);
	   				userInfoSendReply.setMobileoremail(0);
   					userInfoSendReply.setMobileoremailc(kfzx.getEmail2());
   					userInfoSendReply.setStatus(1);
   					Long msgid=UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
   					//发送手机短信
   					String result=SMSTools.sendMobileJs(kfzx.getEmail2(),SysCommonFunc.getTextFromHtml(SysCommonFunc.getStrParameter(request, "content")),msgid.toString());
   					UserInfoSendReply newuserInfoSendReply=new UserInfoSendReply();
   					newuserInfoSendReply=UserInfoSendReplyMng.getUserInfoSendReply(msgid);
   					if (newuserInfoSendReply!=null){
	   					if (result.indexOf("#")<=0){
	   						newuserInfoSendReply.setStatus(Integer.parseInt(result));
	   						HbmOperator.update(newuserInfoSendReply);
	   					}
   					}
				}else{
					UserInfoSendReply userInfoSendReply=new UserInfoSendReply();
	   				userInfoSendReply.setHyid(kfzx.getHyid());
	   				userInfoSendReply.setUsername(kfzx.getUsername());
	   				userInfoSendReply.setContent(SysCommonFunc.getStrParameter(request, "content"));
	   				userInfoSendReply.setHdate(new Date(System.currentTimeMillis()));
	   				userInfoSendReply.setSendorreply(0);
	   				userInfoSendReply.setSender(adminLoginInfo.getAdminname());
	   				userInfoSendReply.setSendtype(1);
	   				userInfoSendReply.setMobileoremail(1);
   					userInfoSendReply.setMobileoremailc(kfzx.getEmail2());
   					UserInfoSendReplyMng.insertUserInfoSendReply(userInfoSendReply);
   					//发送邮件内容
   					MailTools.reMail2(SysCommonFunc.getStrParameter(request, "title"),userInfoSendReply.getContent(),kfzx.getEmail2());
				}
				String s = KFZXMng.updateKfzx(request);
				String sql= "update kfzx set deletename= '"+adminLoginInfo.getAdminname()+"' where id="+id;
			    HbmOperator.executeSql(sql);
				if (s == null) {
					//out.println("<script langauge=javascript>alert('发送成功！');window.location.href='../kfzxlist.jsp?ntype="+kfzxtype+"';</script>");
					out
							.println("<script langauge=javascript>alert('发送成功！');window.top.close();</script>");
					return;
				} else {
					out.println("<script langauge=javascript>alert('" + s
							+ "！');</script>");
				}
			}
		}

	}
	
	
	Kfzx kfzx = KFZXMng.getKfzxFromId(id);
	if (kfzx.getZtai() == null || kfzx.getZtai().intValue() == 0)
		HbmOperator.executeSql("update kfzx set ztai = 1 where id="
				+ id);
%>
<html>
	<head>
		<title></title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color: #8CABDE;
	scrollbar-highlight-color: #eeeeee;
	scrollbar-face-color: #E8F1FF;
	scrollbar-arrow-color: #8CABDE;
	scrollbar-shadow-color: #8CABDE;
	scrollbar-darkshadow-color: #eeeeee;
	scrollbar-base-color: #F0F0F0;
	scrollbar-track-color: #F2F7FF;
	fontsize: 14px;
}
-->
</style>
		<link href="../style/css.css" rel="stylesheet" type="text/css">
		<script language=javascript src="../../script/common.js"></script>
		<script language="javascript">
function checkfrm(frm) {

		if (trim(document.all("title").value) == "") {
			alert('标题不可以为空，请填写！');
			document.all("title").focus();
			return false;
		}
		//获得编辑器的内容！
		var editor = FCKeditorAPI.GetInstance("content");
		var con = editor.EditorDocument.body.innerText;
		if (con.length > 500) {
			alert('回复内容不可大于500字！');
			return false;
		}
		form1.submit();
	}
</script>
<style="text/css">
<!--
body,td,th {
	font-size: 14px;
}
-->
</style>
	</head>
	<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">留言回复</td>
      </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>

		<form action="viewkfzx.jsp" method="POST" name="form1" id="form1">
			<input type="hidden" name="kfzxtype" value="<%=kfzx.getNtype()%>" />
			<table width="80%" border="1" align="center" cellpadding="0"
				cellspacing="0" bordercolor="#999999" class="txt"
				style="border-collapse: collapse">
				<input type="hidden" name="bizaction" value="add">
				<input type="hidden" name="id" value="<%=id%>">
				<tr valign="middle">
					<td width="89" height="25" align="center" class="tdc">
						<strong>姓名</strong>
					</td>
					<td width="187" height="25"><%=kfzx.getUsername()%></td>
					<td width="95" height="25" align="center" class="tdc">
						<strong>联系电话</strong>
					</td>
					<td width="176" height="25"><%=kfzx.getTel()== null ? "" :kfzx.getTel()%></td>
					<td width="119" height="25" align="center" class="tdc">
						<strong>电子邮件</strong>
					</td>
					<td width="321" height="25"><%=kfzx.getEmail()== null ? "" :kfzx.getEmail()%></td>
				</tr>
				<tr valign="middle">
					<td width="89" height="25" align="center" class="tdc">
						<strong><strong>标题</strong>
						</strong>
					</td>
					<td width="187" height="25"><%=kfzx.getNtitle()== null ? "" :kfzx.getNtitle()%></td>
					<td width="95" height="25" align="center" class="tdc">
						<strong>留言时间</strong>
					</td>
					<td width="176" height="25"><%=DateTools.dateToString(kfzx.getNdate(), true)%></td>
					<td width="119" height="25" align="center" class="tdc">
						<strong>发送人</strong>
					</td>
					<td width="321" height="25"><%=kfzx.getIpaddress()%></td>
				</tr>

				<tr valign="middle">
					<td height="50" align="center" class="tdc">
						<strong>内容</strong>
					</td>
					<td height="50" colspan="5"><%=kfzx.getNtext()== null ? "" :kfzx.getNtext().replaceAll("href","aa")%></td>
				</tr>

				<tr valign="middle" class="tdc">
					<td height="25" colspan="6" align="center">
						&nbsp;
					</td>
				</tr>
				<tr valign="middle" class="tdc">
					<td height="40" colspan="6" align="center">
						<strong>回复留言</strong>
					</td>
				</tr>
				<tr valign="middle">
					<td height="35" align="center" class="tdc">
						<strong>回复到</strong>
					</td>
					<td height="35" colspan="5">
						<input name="email" type="text" class="input3" id="email3"
							style="width: 90%" value="<%=kfzx.getEmail2()== null ? "" :kfzx.getEmail2()%>">
						<input name="senduser" type="hidden" class="input3" id="senduser"
							 value="51交友中心">

					</td>				
				</tr>
				<tr valign="middle">
					<td width="89" height="35" align="center" class="tdc">
						<strong>标题</strong>
					</td>
					<td height="35" colspan="5">
						<input name="title" type="text" class="input3" id="title"
							style="width: 90%" value="<%="RE:" + kfzx.getNtitle()%>">
					</td>
				</tr>
				<tr valign="middle">
					<td height="27" colspan="6" align="center">
						<FCK:editor id="content" basePath="<%=basePath%>"
							skinPath="<%=skinPath%>" width="95%" height="200"
							toolbarSet="ALL" imageBrowserURL="<%=imageBrowserURL%>"
							linkBrowserURL="<%=linkBrowserURL%>"
							flashBrowserURL="<%=flashBrowserURL%>"
							imageUploadURL="<%=imageUploadURL%>"
							linkUploadURL="<%=linkUploadURL%>"
							flashUploadURL="<%=flashUploadURL%>"><%=kfzx.getNcontent() == null ? "" : kfzx.getNcontent()%>
						</FCK:editor>
					</td>
				</tr>
				<tr valign="middle">
					<td height="40" colspan="6" align="center">
						<input name="" type="button" class="button1" value="确　定"
							onClick=checkfrm();>
					</td>
				</tr>
			</table>
		</form>
	</body>
</html>

