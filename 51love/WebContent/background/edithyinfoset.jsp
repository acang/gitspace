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
  List list = HbmOperator.list("from Hyset as o where o.hyid="+loginUser.getHyid());
  Hyset hyset = null;
  if(list != null && list.size() > 0)
    hyset = (Hyset)list.get(0);
  else
    hyset = new Hyset();

    int base = 0;
    int pic = 0;
    int tel = 0;
    int sjtel = 0;
    int qq= 0;
    int email = 0;
    if(hyset.getHyid() != null)
    {
        if(hyset.getSetbase() != null)
          base = hyset.getSetbase().intValue();
        if(hyset.getSetpic() != null)
          pic = hyset.getSetpic().intValue();
        if(hyset.getSettel() != null)
          tel = hyset.getSettel().intValue();
        if(hyset.getSetsjtel() != null)
          sjtel = hyset.getSetsjtel().intValue();
        if(hyset.getSetqq() != null)
          qq = hyset.getSetqq().intValue();
        if(hyset.getSetmail() != null)
          email = hyset.getSetmail().intValue();
    }
	
	List listreceive = HbmOperator.list("from UserReceiveSet as o where o.hyid="+loginUser.getHyid());
  UserReceiveSet userReceiveSet = null;
  if(listreceive != null && listreceive.size() > 0)
    userReceiveSet = (UserReceiveSet)listreceive.get(0);
  int receiveyesno = 0;
    int receivetype = 0;
    if (userReceiveSet!=null){
	    if (userReceiveSet.getReceiveyesno()!=null){
	    	receiveyesno=userReceiveSet.getReceiveyesno().intValue();
	    }
	    if (userReceiveSet.getReceivetype()!=null){
	    	receivetype=userReceiveSet.getReceivetype().intValue();
	    }
    }



String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");

if(bizaction.equals("04"))
{
  String s = GRZQMng.adminUpdateHyset(request);
  String s1 = UserReceiveSetMng.userupdateUserReceiveSet(request,loginUser);

  if(s == null && s1==null)
    out.println("<script language='javascript'>alert('���Ѿ��޸��˻�Ա������Ϣ��');</script>");
  else
    out.println("<script language='javascript'>alert('"+s1+"��');</script>");
  return;
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
  <table  id="t3"  width="60%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
              <form name="sethyzt" method="POST" target="sframe" action="edithyinfoset.jsp">
           <input type="hidden" name="bizaction" value="04"/>
           <input type="hidden" name="id" value="<%=loginUser.getHyid()%>">
           <input type="hidden" name="isdel" value="<%=isdel%>">
	 <tr>
       <td height="25" colspan="2" align="center" class="tdc" ><strong>��������</strong></td>
     </tr>
     <tr>
       <td width="45%" height="25" align="center" class="tdc" ><strong>����״̬</strong></td>
       <td width="55%" height="25"  align="left"><select name="setzt" id="select">
           <option value="<%=SysDefine.SYSTEM_HYSET_HYZT_WAIT%>" <%if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_WAIT) out.print("selected");%>>�ȴ���</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT%>" <%if(loginUser.getSetzt() != null && loginUser.getSetzt().longValue() == SysDefine.SYSTEM_HYSET_HYZT_NOT_WAIT) out.print("selected");%>>�������</option>
       </select>       </td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>��������</strong></td>
       <td height="25"  align="left"><select name="setbase" id="setbase">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_ALL%>" <%if(base==SysDefine.SYSTEM_HYSET_OPEN_ALL) out.print("selected");%>>�������˿���</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_REG%>" <%if(base==SysDefine.SYSTEM_HYSET_OPEN_REG) out.print("selected");%>>��ע���Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(base==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
         </select>       </td>
     </tr>
     <tr>
       <td height="25" align="center" class="tdc" ><strong>����Ӱ��/�ļ�</strong></td>
       <td height="25"  align="left"><select name="setpic" id="select2">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_ALL%>" <%if(pic==SysDefine.SYSTEM_HYSET_OPEN_ALL) out.print("selected");%>>�������˿���</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_REG%>" <%if(pic==SysDefine.SYSTEM_HYSET_OPEN_REG) out.print("selected");%>>��ע���Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(pic==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(pic==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>����ѿ���</option>
       </select></td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>�̶��绰�趨</strong></td>
       <td height="25"  align="left"><select name="settel" id="select4">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(tel==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(tel==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>����ѿ���</option>
       </select></td>
     </tr>
     <tr>
       <td height="25" align="center" class="tdc" ><strong>�ֻ��趨</strong></td>
       <td height="25"  align="left"><select name="setsjtel" id="select4">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(sjtel==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(sjtel==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>����ѿ���</option>
       </select></td>
     </tr>
     <tr >
       <td height="25" align="center" class="tdc" ><strong>QQ�趨</strong></td>
       <td height="25"  align="left"><select name="setqq" id="select3">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(qq==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(qq==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>����ѿ���</option>
       </select></td>
     </tr>
     <tr>
       <td height="25" align="center" class="tdc" ><strong>E-mail�趨</strong></td>
       <td height="25"  align="left"><select name="setmail" id="select3">
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_VIP%>" <%if(email==SysDefine.SYSTEM_HYSET_OPEN_VIP) out.print("selected");%>>��vip��Ա����</option>
           <option value="<%=SysDefine.SYSTEM_HYSET_OPEN_FRIEND%>" <%if(email==SysDefine.SYSTEM_HYSET_OPEN_FRIEND) out.print("selected");%>>����ѿ���</option>
       </select></td>
     </tr>
     <tr>
	       <td width="45%" height="25" align="center" class="tdc" ><strong>��վ��Ϣ���գ�</strong></td>
	       <td width="55%" height="25"  align="left">
	       <select id="receiveyesno" name="receiveyesno">
	         <option value="0" <%if(receiveyesno == 0) out.print("selected");%>>����</option>
	         <option value="1" <%if(receiveyesno == 1) out.print("selected");%>>������</option>
	       </select>
	       </td>
	     </tr>
	     <tr >
	       <td height="25" align="center" class="tdc" ><strong>���շ�ʽ��</strong></td>
	       <td height="25"  align="left">
	       <select id="receivetype" name="receivetype">
	         <option value="0" <%if(receivetype==0) out.print("selected");%>>����</option>
	         <option value="1" <%if(receivetype==1) out.print("selected");%>>�ֻ�</option>
	         <option value="2" <%if(receivetype==2) out.print("selected");%>>����</option>
	       </select>
	       </td>
	     </tr>
     <tr>
       <td height="25" align="left" >&nbsp;</td>
       <td height="25"  align="left"><input  name="submit3" type="submit" class="button1" value="ȷ���޸�" width="94" height="28" /></td>
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
