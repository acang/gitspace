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
<%@ page import="com.common.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%
Admininfo adminLoginInfo = (Admininfo)session.getAttribute(SysDefine.SESSION_ADMIN_LOGIN_NAME);
String hyid = SysCommonFunc.getStrParameter(request,"id");
Userinfo loginUser = null;
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
if(isdel.equals("1")){
	  loginUser = HYRegMng.getDelUserInfoByHyid(hyid);
	}else{
		List templist = HbmOperator.list("from Userinfo as o where o.hyid="+hyid);
	    if(templist != null && templist.size() > 0)
	    {
	    	loginUser = (Userinfo)templist.get(0);
	    }
	}
Userother uother = HYRegMng.getUserOtherByHyid(hyid);
if(uother == null)
{
  uother = new Userother();
  uother.setJyly("");
  uother.setLxqr("");
  uother.setQggx("");
  uother.setHyid(loginUser.getHyid());
  uother.setUsername(loginUser.getUsername());
  HbmOperator.insert(uother);
}

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");

if(bizaction.equals("05"))
{
   Date cdate = new Date(System.currentTimeMillis());
   String s = DateTools.dateToString(cdate,true);
   String sql = "update userinfo set tjsj = to_date('"+s+"','YYYY-MM-DD HH24:MI:SS') where hyid = "+loginUser.getHyid();
   HbmOperator.executeSql(sql);
   out.println("<script language='javascript'>alert('���Ѿ��ɹ������ô˻�ԱΪ��ҳ�Ƽ���');</script>");
}

if(bizaction.equals("07"))
{
   String sql= "update userinfo set tjsj = null where hyid = " +loginUser.getHyid();
   HbmOperator.executeSql(sql);
   out.println("<script language='javascript'>alert('���Ѿ��ɹ���ȡ���˻�Ա����ҳ�Ƽ���');</script>");
}

if(bizaction.equals("06"))
{
   int hots = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"hots"),0);
   String sql = "update userinfo set hots = " + hots + " where  hyid = " + loginUser.getHyid();
   HbmOperator.executeSql(sql);
   out.println("<script language='javascript'>alert('���ѳɹ�����������ֵ��');</script>");
}



%>

<%
String sql = "from Vipuserrecord o where o.hyid = "+loginUser.getHyid() +"and o.czsj>=to_date('2011-1-1','yyyy-mm-dd') order by o.id desc ";
QueryResult qr = null;
qr = QueryRecord.queryByHbm(sql,100,1,false,0);
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

<body>
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
      <!-- <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a> --></td>
  </tr>
  <%
	     DynaBean dbt1 =null;
	     Map map=new HashMap();
	     String sqlt1="select adv_member_name,adv_member_code from adv_member order by adv_member_code asc";
	     List listt1=(List)QueryRecord.query(sqlt1);
	     if(listt1.size()>0)
	     {
	     	for(int o =0;o<listt1.size();o++)
	     	{
	        	dbt1 =(DynaBean)listt1.get(o);
	        	map.put(dbt1.get("adv_member_code").toString(),dbt1.get("adv_member_name"));
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
    <td height="25" colspan="8" >���ѣ���ǰ�޸ĵĻ�Ա��ţ�<STRONG><%=loginUser.getHyid()%></STRONG>�� ����ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getRegtime(),true)%></STRONG>����ע��ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getRegtime3(),true)%></STRONG>������½ʱ�䣺<STRONG><%=DateTools.dateToString(loginUser.getLasttime(),true)%></STRONG>����
    </td>
  	</tr>
    <tr>
    <td height="25" colspan="8" >�û�����<STRONG><%=loginUser.getUsername()%></STRONG>�� �ǳƣ�<STRONG><%=loginUser.getLcname()%></STRONG>
     	����ע��IP��<STRONG><%=loginUser.getHttpip()%></STRONG>&nbsp;&nbsp;��Դ���<STRONG><%=map.get(loginUser.getVip()+"")%></STRONG>�� ����״̬��<STRONG><%=jyzt %></STRONG>�� ��Ա�ȼ���<STRONG><%=hytype%></STRONG>�� ����ֵ��<STRONG><%=loginUser.getHots().toString()%></STRONG>
    </td>
  	</tr>
    <tr>
      <td height="25" colspan="8" align="left" valign="middle" class="tdc">����</td>
    </tr>
</table>
  <%
    //Vipuserrecord vpu = VIPMng.getVipLastRecordFromHyid(loginUser.getHyid().toString());
%>
   <table   id="t4"  width="80%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
     <form method="POST" target="sframe" name="fset">
       <input type="hidden" name="bizaction" value="">
       <input type="hidden" name="id" value="<%=loginUser.getHyid()%>"/>
       <input type="hidden" name="isdel" value="<%=isdel%>"/>
     						<tr>
                                <td width="8%" align="center" nowrap="nowrap" height="32"><strong>���</strong></td>
                                <td width="15%" align="center" ><strong>����ʱ��</strong></td>
                                <td width="15%" align="center" nowrap="nowrap"  ><strong>��������</strong></td>
                                <td width="15%" align="center" nowrap="nowrap"  ><strong>������Ŀ</strong></td>
                                <td width="15%" align="center" ><strong>�������</strong></td>
                                <td width="15%" align="center" ><strong>����ʱ��</strong></td>
                                <td width="15%" align="center" ><strong>������/����ʱ��</strong></td>
                              </tr>
                              <%
for(int i =0;i < qr.resultList.size();i ++)
{
   Vipuserrecord vpu = (Vipuserrecord)qr.resultList.get(i);
   
   	String sqlt="select ordid from cart where trans =1 and upgrade = 1 and username='"+vpu.getSqhy()+"' order by id desc";
	List listt=QueryRecord.query(sqlt);
	DynaBean dbt=null;
	if(listt.size()>0)
	{
		dbt=(DynaBean)listt.get(0);
	}
	
	String sqll="select l.lyid,k.n_date from lycart l left join kfzx k on l.lyid = k.id where l.hyid = "+vpu.getHyid()+" and l.updatetime = to_date('"+DateTools.dateToString(vpu.getCzsj(),true)+"','YY-MM-DD HH24:mi:ss')";
	List listl=QueryRecord.query(sqll);
	DynaBean dbl=null;
	String lyt="";
	String lyi="";
	if(listl.size()>0)
	{
		dbl=(DynaBean)listl.get(0);
		lyt=DateTools.dateToString((Date)dbl.get("n_date"),true);
		lyi=String.valueOf(dbl.get("lyid"));
	}
%>

                              <tr>
                                <td  align="center" height="30"><%=(i+1)%></td>
                                <td  align="center"><%=DateTools.dateToString(vpu.getCzsj(),true) %></td>
                                <td align="center"><%=vpu.getArea() %></td>
								<td align="center"><%=vpu.getName() %></td>
								<td align="center"><%=vpu.getTransamt()%></td>
								<td align="center"><%=DateTools.dateToString(vpu.getZzsj(),false)%></td>
								<td align="center">
                                    <a href ="<%=(vpu.getCzry().equals("����")||vpu.getCzry().equals("֧����"))?"lydisplay.jsp?bizaction=0&ordid="+dbt.get("ordid"):"channel/viewkfzx.jsp?id="+lyi%>" target="_blank">
                                        <%=(vpu.getCzry().equals("����")||vpu.getCzry().equals("֧����"))?dbt.get("ordid"):lyt%>
                                    </a>
                                </td>
                              </tr>
<%
}
%>
     </form>
</table>
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
</script>
