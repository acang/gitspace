<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="org.apache.commons.beanutils.*"%>
<%@ page import="com.web.bean.*"%>
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
String area="";
if (loginUser.getArea()!=null){
	area=loginUser.getArea();
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
//   Date cdate = new Date(System.currentTimeMillis());
//   String s = DateTools.dateToString(cdate,true);
//   String sql = "update userinfo set tjsj = to_date('"+s+"','YYYY-MM-DD HH24:MI:SS') where hyid = "+loginUser.getHyid();
//   HbmOperator.executeSql(sql);
//   out.println("<script language='javascript'>alert('���Ѿ��ɹ������ô˻�ԱΪ�����»�Ա��');</script>");
    String type = "9";
    String sql2 = "update userinfo set important = important+1 where  important >90 and  important<120";
    HbmOperator.executeSql(sql2);
    String sql = "update userinfo set important = " + type+"1  where  hyid = " +loginUser.getHyid();
    HbmOperator.executeSql(sql);
    out.println("<script language='javascript'>alert('���ѳɹ������˳����»�Ա��');</script>");
    if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto2()!=null && !"".equals(uother.getUserphoto2())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto2(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto2(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto3()!=null && !"".equals(uother.getUserphoto3())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto3(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto3(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto4()!=null && !"".equals(uother.getUserphoto4())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto4(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto4(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto5()!=null && !"".equals(uother.getUserphoto5())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto5(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto5(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}

//if(bizaction.equals("07"))
//{
//   String sql= "update userinfo set tjsj = null where hyid = " +loginUser.getHyid();
//   HbmOperator.executeSql(sql);
//   out.println("<script language='javascript'>alert('���Ѿ��ɹ���ȡ���˻�Ա�ĳ����»�Ա��');</script>");
//}
//    if(bizaction.equals("06"))
//    {
//        int hots = SysCommonFunc.getNumberFromString(SysCommonFunc.getStrParameter(request,"hots"),0);
//        String sql = "update userinfo set hots = " + hots + " where  hyid = " + loginUser.getHyid();
//        HbmOperator.executeSql(sql);
//        out.println("<script language='javascript'>alert('���ѳɹ�����������ֵ��');</script>");
//    }

if(bizaction.equals("08"))
{
   String type = "";
    if("11".equals(loginUser.getSex())){
        type="1";
        String sql2 = "update userinfo set important = important+1 where  important >10 and  important<17";
        HbmOperator.executeSql(sql2);
    }
    if("10".equals(loginUser.getSex())){
        type="0";
        String sql2 = "update userinfo set important = important+1 where  important >0 and  important<7";
        HbmOperator.executeSql(sql2);
     }

    String sql = "update userinfo set important = " + type+"1  where  hyid = " +loginUser.getHyid();
   HbmOperator.executeSql(sql);
   out.println("<script language='javascript'>alert('���ѳɹ���������ҳ�ص��Ա��');</script>");
    if(uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto2()!=null && !"".equals(uother.getUserphoto2())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto2(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto2(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto3()!=null && !"".equals(uother.getUserphoto3())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto3(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto3(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto4()!=null && !"".equals(uother.getUserphoto4())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto4(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto4(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
    if(uother.getUserphoto5()!=null && !"".equals(uother.getUserphoto5())){
        try {
            ImageUtil.resizePhotoJpg2("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto5(),"E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto5(),190,230);
        } catch (Exception e) {
            e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
        }
    }
}
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
	     DynaBean dbt =null;
	     Map map=new HashMap();
	     String sqlt="select adv_member_name,adv_member_code from adv_member order by adv_member_code asc";
	     List listt=(List)QueryRecord.query(sqlt);
	     if(listt.size()>0)
	     {
	     	for(int o =0;o<listt.size();o++)
	     	{
	        	dbt =(DynaBean)listt.get(o);
	        	map.put(dbt.get("adv_member_code").toString(),dbt.get("adv_member_name"));
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
</table>
  <%
    Vipuserrecord vpu = VIPMng.getVipLastRecordFromHyid(loginUser.getHyid().toString());
%>
   <table   id="t4"  width="60%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
     <form method="POST" target="sframe" name="fset">
       <input type="hidden" name="bizaction" value="">
       <input type="hidden" name="id" value="<%=loginUser.getHyid()%>"/>
       <input type="hidden" name="isdel" value="<%=isdel%>"/>
     <tr>
       <td height="25" colspan="2" align="center" class="tdc" ><strong>��Ա״̬</strong></td>
     </tr>
     <tr >
       <td width="290" height="25" align="center" class="tdc" ><strong>��Ա�ȼ�</strong></td>
       <td width="455" height="25" align="left" ><%=LoverTools.getHyDj(loginUser)%></td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>��������</strong></td>
       <td height="25" ><%=vpu == null ? "":DateTools.dateToString(vpu.getCzsj(),false)%></td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>��Ч����</strong></td>
       <td height="25" ><%=DateTools.dateToString(loginUser.getZzsj(),false)%></td>
     </tr>
      <tr >
       <td height="25" align="center" class="tdc" ><strong>�鿴����</strong></td>
       <td height="25" ><%=area%></td>
     </tr>
         <tr >
             <td height="25" align="center" class="tdc" ><strong>�� �� ֵ</strong></td>
             <td height="25" ><input name="hots" type="text" value="<%=loginUser.getHots() == null ? "":loginUser.getHots().toString()%>"></td>
         </tr>

     <tr>
       <td height="25" colspan="2" align="center" >
           <input type="button" name="Submit1" value="�����Ա" onClick="javascript:fsetf('05')">
           <input type="button" name="Submit3" value="�ص��Ա" onClick="javascript:fsetf('08')">

           <%--<input type="button" name="Submit3" value="��ҳ�ص��Ƽ�" onClick="javascript:fsetf('05')">--%>

           <%--<input type="button" name="Submit" value="���������Ƽ�" onClick="javascript:fsetf('06')">--%>

           <%--<input type="button" name="Submit2" value="ȡ���ص��Ƽ�" onClick="javascript:fsetf('07')">--%>
       </td>
     </tr>
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
