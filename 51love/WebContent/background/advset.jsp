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
      out.println("<script language='javascript'>alert('�Բ�������Ȩ���ӹ���Ա�����ϣ�');history.go(-1);</script>");
      return;
   }
   
   if(adminLoginInfo.getFlag().intValue() != 10 && adminLoginInfo.getFlag().intValue() != 5)
   {
      out.println("<script language='javascript'>history.go(-1);</script>");
      return;
   }
   String ok=SysCommonFunc.getStrParameter(request,"ok");
   String ok2=SysCommonFunc.getStrParameter(request,"ok2");
   int biz = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"biz"),0);
   int biz2 = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"biz2"),0);
   int biz3 = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"biz3"),0);
   Date now=new Date();
   
   if(ok.equals("1"))
   {
   String advmembername=SysCommonFunc.getStrParameter(request,"adminname");
   String sql5="select adv_member_code from ADV_MEMBER order by ADV_MEMBER_CODE desc";
   List list4 = (List)QueryRecord.query(sql5);
   DynaBean db4 =null;
   if(list4.size()>0)
   {
   		db4 = (DynaBean)list4.get(0);
   }
   Advmember advmember=new Advmember();
   advmember.setId(SysCommonFunc.getSequenceIdForOracle("SEQ_ADV_MEMBER"));
   advmember.setAdvmembername(advmembername);
   int code = Integer.parseInt(db4.get("adv_member_code").toString());
   int code2 =code+1;
   advmember.setAdvmembercode(new Integer(code2));
   advmember.setFlag(new Integer(1));
   advmember.setCreatetime(now);
   String advType =SysCommonFunc.getStrParameter(request,"advType");
   String memo =SysCommonFunc.getStrParameter(request,"memo");
   advmember.setAdvType(advType);
   advmember.setMemo(memo);
   advmember.setOper(adminLoginInfo.getAdminname());
   String sql2 = "select id from ADV_MEMBER where ADV_MEMBER_NAME ='"+advmembername+"'";
   List list = (List)QueryRecord.query(sql2);
   /**  delete by linyu 20151026  �ƹ��˺͹���Ա����	  
   String sql3="select id from ADMININFO where adminname = '"+advmembername+"' and flag != 4";
   List list2 = (List)QueryRecord.query(sql3);
   if(list2.size()>0)
   {
	   out.println("<script>alert('�ƹ����û��ѱ�ʹ�ã�');history.go(-1);</script>");
	   return;
   }
   **/
   if(list.size()>0)
   {
	   out.println("<script>alert('�ƹ��������ѱ�ʹ�ã�');history.go(-1);</script>");
	   return;
   }
 
try
{
 Vector saveList = new Vector();
 MutSeaObject mso = new MutSeaObject();
 mso.setHbmSea(advmember, MutSeaObject.SEA_HBM_INSERT);
 saveList.add(mso);
 HbmOperator.SeaMutData(saveList);
 /**   delete by linyu 20151026  �ƹ��˺͹���Ա����	  
 String s = AdminMng.addAdmin(request);
 if(s == null)
 {
    out.println("<script langauge=javascript>alert('���Ѿ��ɹ�����ƹ��ˣ�');</script>");
 }
 else
 {
    out.println("<script langauge=javascript>alert('"+s+"��');</script>");
 }
 if(list.size()!=0)
 {
	out.println("<script>alert('����ƹ�����Ϣ�ɹ�')</script>");
 }
 **/
 out.println("<script>alert('����ƹ�����Ϣ�ɹ�')</script>");
}catch(Exception e)
{
  System.out.println("�����ƹ��˳���"+e.getMessage());
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
	   String sqlarray2[] = new String[delid.length];
	   String sql ="";
       for(int i =0;i < delid.length;i ++)
       {
    	   sqlarray[i] = "update Adv_member set flag =0 , createtime = sysdate,oper=' "+adminLoginInfo.getAdminname()+"' where id="+delid[i];
    	   sqlarray2[i] = "delete from admininfo where adminname =(select adv_member_name from adv_member where id = "+delid[i]+")";
       }
       HbmOperator.executeSql(sqlarray);
       HbmOperator.executeSql(sqlarray2);
       tcount = 0;
   }
}

   tcount = 0;

   int pagesize = 15;

   ///�õ��û��б�
   String sql = "from Advmember where flag=1 order by flag desc ,id asc";
   if(biz%2 ==1 && biz!=0)
   {
	   sql="from Advmember flag=1 order by flag asc";
   }
   if(biz%2 ==0 && biz!=0)
   {
	   sql="from Advmember flag=1 order by flag desc";
   }
   biz=biz+1;
   
   if(biz2%2 ==1 && biz2!=0)
   {
	   sql="from Advmember flag=1 order by adv_member_code desc";
   }
   if(biz2%2 ==0 && biz2!=0)
   {
	   sql="from Advmember flag=1 order by adv_member_code asc";
   }
   biz2=biz2+1;
   
   if(biz3%2 ==1 && biz3!=0)
   {
	   sql="from Advmember flag=1 order by createtime desc";
   }
   if(biz3%2 ==0 && biz3!=0)
   {
	   sql="from Advmember flag=1 order by createtime asc";
   }
   biz3=biz3+1;

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
<title>51lover��������</title>
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
	if (checkspace(document.form1.adminname.value))
	{
		alert('�������ƹ������ƣ�');
		return false;
	}

	if(!confirm('��ȷ��Ҫ���ɸ��ƹ��ˣ�'))
	{
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
		 alert("����ȷ��дת��ҳ����");
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
        <td align="center">�ƹ��˹���</td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="form1" method="post" action="advset.jsp">
  <input type="hidden" name="bizaction" value="01">
  <table width="98%" border="1" align="center" cellpadding="1" cellspacing="1"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="23%" align="center" class="tdc"><strong>�����ƹ�������</strong></td>
      <td width="77%" align="left">
      <input name="adminname" type="text" id="adminname"></td>
    </tr>

    <tr >
      <td align="center" class="tdc"><strong>�����ƹ�������</strong></td>
      <td align="left">
          <input name="memo" type="text" id="memo"><input type="hidden" name="flag" value="4"> </td>
    </tr>
    <tr >
      <td align="center" class="tdc"><strong>�����ƹ㷽ʽ</strong></td>
      <td align="left">
      	  <select name="advType">
      	  	<option value="1">����վ</option>
      	    <option value="2">�ƶ�վ</option>
      	  </select>
       </td>
    </tr>
    <tr >
      <td colspan="2" align="center">
          ��<input type="hidden" value="1" name ="ok"> 
      <input type="submit" name="Submit2"  class="button1" value="����" onClick="return check();">      </td>
    </tr>
  </table>
</form>
<br>




<form name="go2to" method="Post" action="advset.jsp">
                            <input type="hidden" name="cpages" value="<%=cpage%>" />
                            <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                            <input type="hidden" value="2" name ="ok2" id="ok2"> 

  <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
    <tr >
      <td width="5%" align="center" class="tdc"></td>
      <td width="5%" height="30" align="center" class="tdc"><strong>���</strong></td>
      <td width="7%" height="30" align="center" class="tdc"><strong><a href="advset.jsp?biz=<%=biz%>">״̬</a></strong></td>
      <td width="10%" height="30" align="center" class="tdc"><strong>�ƹ�������</strong></td>
      <td width="23%" height="30" align="center" class="tdc"><strong>�ƹ�������</strong></td>
      <td width="5%" height="30" align="center" class="tdc"><strong>�ƹ㷽ʽ</strong></td>
      <td width="25%" height="30" align="center" class="tdc"><strong><a href="advset.jsp?biz2=<%=biz2%>">�ƹ����</a></strong></td>
      <td width="10%" height="30" align="center" class="tdc"><strong><a href="advset.jsp?biz3=<%=biz3%>">����ʱ��</a></strong></td>
      <td width="10%" height="30" align="center" class="tdc"><strong>����Ա</strong></td>
    </tr>
<%
for(int i =0;i < qr.resultList.size();i ++)
{
   Advmember temp = (Advmember)qr.resultList.get(i);
   String sqlu="select memo from admininfo where adminname='"+temp.getAdvmembername()+"'";
   List listu = (List)QueryRecord.query(sqlu);
   DynaBean dbu =null;
   if(listu.size()>0)
   {
    dbu = (DynaBean)listu.get(0);
   }
%>
    <tr>
      <td align="center"><input type="checkbox" name="delid" value=<%=temp.getId()%>></td>
      <td height="30" align="center"><%=(cpage-1)*20+i+1%></td>
      <td height="30" align="center"><%=temp.getFlag().intValue()== 1 ?"����":"<font color ='red'>ɾ��</font>"%></td>
      <td height="30" align="center"><a href='advset.jsp?mid=<%=temp.getId()%>'><%=temp.getAdvmembername()%></a></td>
      <td height="30" align="center"><%=temp.getMemo()%></td>
      <td height="30" align="center"><%="1".equals(temp.getAdvType())?"����վ":"�ƶ�վ"%></td>
      <td height="30" align="center">
      <%
        if("1".equals(temp.getAdvType())){
        
        %>
        	http://www.51lover.org/?advid=<%=temp.getAdvmembercode()%>
		<%
        }else{
        %>
		http://www.51lover.org/mobile?advid=<%=temp.getAdvmembercode()%> 
      <%
        } 
        %>
      </td>
      <td height="30" align="center"><%=DateTools.dateToString(temp.getCreatetime(),false)%></td>
      <td height="30" align="center"><%=temp.getOper()%></td>
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
  out.println("<font class='info_link'>��    ҳ&nbsp;&nbsp;��һҳ&nbsp;&nbsp; </font> ");
else
{
  out.println("<a href='javascript:turn(1)' class='info_link'>��    ҳ</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
}
if(cpage >= totalPage )
  out.println("<font class='info_link'>��һҳ&nbsp;&nbsp;βҳ&nbsp;&nbsp;  </font> ");
else
{
  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>βҳ</a>&nbsp;&nbsp;");
}
%>
ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>�� &nbsp;&nbsp;
<font color='000064'> ת����<input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18' value="">ҳ</font>&nbsp;&nbsp;<input class=button type='button' value='ȷ ��' onclick=turn(document.go2to.turnpage.value) style='font-family: ����; font-size: 9pt; color: #000073; position: relative; height: 19'></td>
    </tr>
    <tr align="center" >
      <td height="30" colspan="8"><input type="submit" name="Submit3" value="ɾ��" class="button1">
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
<%
    String mid = SysCommonFunc.getStrParameter(request,"mid");
    System.out.println("mid = >>>>>>>>>" + mid);
    String queryone = "select adv_member_name,adv_member_code,flag from adv_member where id ='"+mid+"'";
    String name = "";
    String code = "";
    List list = (List)QueryRecord.query(queryone);
    System.out.println("list.size() = " + list.size());
    if(list!=null && list.size()>0){
        DynaBean  one_adv = (DynaBean)list.get(0);
        name =  (String)one_adv.get("adv_member_name");
       code = one_adv.get("adv_member_code").toString();
    }




%>
<table>
    <tr>
        <td>�ƹ�������</td>
        <td><input type="text" value="<%=name%>"></td>
    </tr>
    <tr>
        <td>�ƹ����</td>
        <td><input type="text" value="<%=code%>"></td>
    </tr>
    <tr>
        <td colspan="2"><input type="button" value="�޸�"></td>

    </tr>
</table>


</body>
</html>


