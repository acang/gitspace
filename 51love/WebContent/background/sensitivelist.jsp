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
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
   Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
   if(adminLoginInfo.getFlag() == null)
   {
      out.println("<script language='javascript'>alert('对不起！您无权增加管理员的资料！');history.go(-1);</script>");
      return;
   }
   
   if(adminLoginInfo.getFlag().intValue() != 10 && adminLoginInfo.getFlag().intValue() != 1)
   {
      out.println("<script language='javascript'>history.go(-1);</script>");
      return;
   }
   String ok=SysCommonFunc.getStrParameter(request,"ok");
   String ok2=SysCommonFunc.getStrParameter(request,"ok2");
   
   if(ok.equals("1"))
   {
   String sensitiveword=SysCommonFunc.getStrParameter(request,"sensitive");
   Sensitive sensitive=new Sensitive();
   sensitive.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_SENSITIVE"));
   sensitive.setSensitive(sensitiveword);
   String sql2 = "select id from SENSITIVE where SENSITIVE ='"+sensitiveword+"'";
   List list = QueryRecord.query(sql2);
   
   if(list.size()>0)
   {
	   out.println("<script>alert('已经有此敏感词！');history.go(-1);</script>");
	   return;
   }
	   
try
{
 Vector saveList = new Vector();
 MutSeaObject mso = new MutSeaObject();
 mso.setHbmSea(sensitive, MutSeaObject.SEA_HBM_INSERT);
 saveList.add(mso);
 HbmOperator.SeaMutData(saveList);
 if(list.size()!=0)
 {
	out.println("<script>alert('添加敏感词成功')</script>");
 }
}catch(Exception e)
{
  System.out.println("新增敏感词出错"+e.getMessage());
}
   }
   
   
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
   String wttype = SysCommonFunc.getStrParameter(request,"wttype");

if(ok2.equals("2"))
{
   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
	   String sqlarray[] = new String[delid.length];
	   String sql ="";
       for(int i =0;i < delid.length;i ++)
       {
    	   sqlarray[i] = "delete from sensitive where id="+delid[i];
       }
       HbmOperator.executeSql(sqlarray);
       tcount = 0;
   }
}

   tcount = 0;

   int pagesize = 15;

   ///得到用户列表
   String sql = "from Sensitive order by id asc";

   QueryResult qr = null;
   if(tcount > 0)
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage,false,tcount);
   else
     qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
   int totalPage = qr.pageCount;
   int totalCount = qr.rowCount;
   cpage = qr.pageNum;
   int prepage = cpage-1;
   int nextpage = cpage+1;
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>51交友中心</title>
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

<script language="JavaScript">
function checknumber(String) 
{ 
	var Letters = "1234567890"; 
	var i; 
	var c; 
	for( i = 0; i < String.length; i ++ ) 
	{ 
		c = String.charAt( i ); 
		if (Letters.indexOf( c ) ==-1) 
		{ 
			return true; 
		} 
	} 
	return false; 
}
function sub(c)
{
	document.go2to.ok2.value=c;
	document.go2to.submit();
}
function check()
{
	if (checkspace(document.form1.sensitive.value))
	{
		alert('请输入敏感词！');
		return false;
	}
}



function checkspace(checkstr) {
  var str = '';
  for(i = 0; i < checkstr.length; i++) {
    str = str + ' ';
  }
  return (str == checkstr);
}

function turn(pages)
{
   if (isNaN(pages))
   {
		 alert("请正确填写转到页数！");
                return;
   }
   document.go2to.cpages.value=pages+"";
   document.go2to.submit();
   //go2to.page.value
}

function coper(bizaction,opid)
{
   document.go2to.bizaction.value=bizaction;
   document.go2to.opid.value=opid;
   document.go2to.submit();
}
</script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center">敏感词管理</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="sensitivelist.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="23%" align="center" class="tdc"><strong>新增敏感词</strong></td>
      <td width="77%" align="left">
      <input name="sensitive" type="text" id="sensitive"></td>
    </tr>
    
    <tr >
      <td colspan="2" align="center">
          　<input type="hidden" value="1" name ="ok"> 
      <input type="submit" name="Submit2"  class="button1" value="新增" onClick="return check();">      </td>
    </tr>
  </table>
</form>
<br>




<form name="go2to" method="Post" action="sensitivelist.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" value="2" name ="ok2" id="ok2"> 

  <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="5%" align="center" class="tdc"></td>
      <td width="15%" height="30" align="center" class="tdc"><strong>序号</strong></td>
      <td width="80%" height="30" align="center" class="tdc"><strong>敏感词</strong></td>

    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Sensitive temp = (Sensitive)qr.resultList.get(i);
%>
    <tr>
      <td align="center"><input type="checkbox" name="delid" value=<%=temp.getId()%>></td>
      <td height="30" align="center"><%=(cpage-1)*15+i+1%></td>
      <td height="30" align="center"><%=temp.getSensitive()%></td>
    </tr>
<%
}
%>

    <tr >
      <td height="30" colspan="8" align="center" valign="middle">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="8" align="center" valign="middle">
<%
if(cpage == 1)
  out.println("<font class='info_link'>首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; </font> ");
else
{
  out.println("<a href='javascript:turn(1)' class='info_link'>首    页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>上一页</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("<font class='info_link'>下一页&nbsp;&nbsp;尾页&nbsp;&nbsp;  </font> ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>下一页</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>尾页</a>&nbsp;&nbsp;");
}
%>
页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条 &nbsp;&nbsp;
<font color='000064'> 转到第<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">页</font>&nbsp;&nbsp;<input class=button type='button' value='确 定' onclick=turn(document.go2to.turnpage.value) style='font-family: 宋体; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr align="center" >
      <td height="30" colspan="8"><input type="submit" name="Submit3" value="删除" class="button1">
        </td>
    </tr>
    <tr >
      <td height="30" colspan="8">&nbsp;</td>
    </tr>
    <tr >
      <td height="30" colspan="8"> <div align="center">
          </div></td>
    </tr>
</table>
 </form>




</body>
</html>


