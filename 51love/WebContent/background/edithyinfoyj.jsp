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
if(hyid.length() ==0)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
}
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
if(loginUser == null)
{
   out.println("��Ա��Ϣ�����ڣ������²���");
   return;
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

if(bizaction.equals("03"))
{
  String s = GRZQMng.adminRemovePhotoA(request,uother,loginUser);
  //OpLogMng.addOpLog(loginUser,adminLoginInfo,request,OpLogMng.OP_LOG_U_R_PHOTO);
  if(s == null)
    out.println("<script language='javascript'>alert('���Ѿ�ɾ������Ƭ��');window.parent.location.href='edithyinfoyj.jsp?id="+hyid+"&isdel="+isdel+"'</script>");
  else
    out.println("<script language='javascript'>alert('"+s+"��');</script>");
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
      <!-- <a href = "talktohy.jsp?id=<%=hyid%>&isdel=<%=isdel%>">����</a> -->
    </td>
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
  <table id="t2"  width="100%"  border="0" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
     <tr>
       <td height="30">
	   <table width="80%" border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
         <tr>
           <td width="122" align="center"><%
                  String afilepath =request.getContextPath() +"/"+InitEnvironment.getSystemProValue(SysDefine.ENV_ANNEXPATH_PATH);
                  %>
               <%
                  if(uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0
                  &&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists())
                  {
                  %>
               <a href="edithyphoto.jsp?id=<%=hyid%>&isdel=<%=isdel%>&photo=1" target="_blank"> <img src="<%=afilepath+File.separator+uother.getUserphoto1()%>" width="122" height="140" border="0" align="middle"> </a>
               <%
                  }
                  else
                  {
                  %>
               <img src='../images/nopic2.gif' width='122' height='140'>             <%
                  }
                    %>           </td>
           <td width="122" align="center"><%
                  if(uother.getUserphoto2() != null && uother.getUserphoto2().length() > 0
                		  &&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists())
                  {
                  %>
               <a href="edithyphoto.jsp?id=<%=hyid%>&isdel=<%=isdel%>&photo=2" target="_blank"> <img src="<%=afilepath+File.separator+uother.getUserphoto2()%>" width="122" height="140" border="0"> </a>
               <%
                  }
                  else
                  {
                  %>
               <img src='../images/nopic2.gif' width='122' height='140'>
               <%
                  }
                    %>           </td>
           <td width="122" align="center">
             <%
                  if(uother.getUserphoto3() != null && uother.getUserphoto3().length() > 0&&new File("E:\\web\\lover51\\upload\\hyimg\\"+uother.getUserphoto1()).exists())
                  {
                  %>
             <a href="edithyphoto.jsp?id=<%=hyid%>&isdel=<%=isdel%>&photo=3" target="_blank"> <img src="<%=afilepath+File.separator+uother.getUserphoto3()%>" width="122" height="140" border="0"> </a>
             <%
                  }
                  else
                  {
                  %>
             <img src='../images/nopic2.gif' width='122' height='140'>
             <%
                  }
                    %>
           </td>
           <td width="122" align="center"><%
                  if(uother.getUserphoto4() != null && uother.getUserphoto4().length() > 0)
                  {
                  %>
               <a href="edithyphoto.jsp?id=<%=hyid%>&isdel=<%=isdel%>&photo=4" target="_blank"> <img src="<%=afilepath+File.separator+uother.getUserphoto4()%>" width="122" height="140" border="0"> </a>
               <%
                  }
                  else
                  {
                  %>
               <img src='../images/nopic2.gif' width='122' height='140'>
               <%
                  }
                    %>           </td>
           <td width="122" align="center"><%
                  if(uother.getUserphoto5() != null && uother.getUserphoto5().length() > 0)
                  {
                  %>
               <a href="edithyphoto.jsp?id=<%=hyid%>&isdel=<%=isdel%>&photo=5" target="_blank"> <img src="<%=afilepath+File.separator+uother.getUserphoto5()%>" width="122" height="140" border="0"> </a>
               <%
                  }
                  else
                  {
                  %>
               <img src='../images/nopic2.gif' width='122' height='140'>
               <%
                  }
                    %>           </td>
         </tr>
         <form name="rphoto" method="POST" target="sframe" action="edithyinfoyj.jsp">
           <input type="hidden" name="bizaction" value="03"/>
           <input type="hidden" name="id" value="<%=loginUser.getHyid()%>">
           <input type="hidden" name="isdel" value="<%=isdel%>">
           <input type="hidden" name="p" value="">
         </form>
         <tr>
           <td height="25" align="center"><a href="javascript:crphoto('1');" class="button1">ɾ��</a> </td>
           <td height="25" align="center"><a href="javascript:crphoto('2');" class="button1">ɾ��</a></td>
           <td height="25" align="center"><a href="javascript:crphoto('3');" class="button1">ɾ��</a> </td>
           <td height="25" align="center"><a href="javascript:crphoto('4');" class="button1">ɾ��</a> </td>
           <td height="25" align="center"><a href="javascript:crphoto('5');" class="button1">ɾ��</a> </td>
         </tr>
         <tr>
           <td height="25" colspan="5" align="center"><input name="Submit" type="button" class="button1" onClick="MM_openBrWindow1('upload_pic.jsp?hyid=<%=loginUser.getHyid()%>&isdel=<%=isdel%>','dd','width=500,height=120')" value="�ϴ���Ƭ"/></td>
         </tr>
       </table></td>
     </tr>
	    <tr>
       <td height="30">
	   <table width="80%"  border="1" align="center" cellpadding="0" cellspacing="0"  bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">

         <%
                List articleList = GRZQMng.getUserArticleList(loginUser);
		  for( int i=0 ;i <  8; i ++)
                  {
                    boolean haveArticle=false;
                    Userarticle uarticle = null;
                    if(articleList != null && i < articleList.size())
                    {
                      haveArticle=true;
                      uarticle=(Userarticle)articleList.get(i);
                    }
              %>
         <tr >
           <td width="483" align="left"  style="font-size:15px;"><%
            if(haveArticle)
            {
            %>
	       [�����ļ�]
               <a href="#" onClick="MM_openBrWindow('upload_wj.jsp?hyid=<%=loginUser.getHyid()%>&articleid=<%=uarticle.getId()%>&isdel=<%=isdel%>','51lover��������','scrollbars=yes,width=700,height=600')"><%=uarticle.getTitle()%></a>
               <%
            }else
            {
            out.println("���޴���");
            }
            %></td>
           <td width="91" align="left"><%
              if(haveArticle)
            {
            %>
               <a href="../veiwnews.jsp?id=<%=loginUser.getHyid()%>&articleid=<%=uarticle.getId()%>&wjfy=1"> <img src="../images/grzq/btn_ck.gif" width="63" height="22" border="0" /></a>
               <%
           }else
           {
           %>
               <img src="../images/grzq/btn_ck.gif" width="63" height="22" border="0" />
               <%
           }
                        %></td>
           <td width="87" align="left"><%
              if(haveArticle)
            {

            %>
               <a href="upload_wj.jsp?delid=<%=uarticle.getId()%>&cid=<%=uarticle.getContentid()%>&hyid=<%=loginUser.getHyid()%>&isdel=<%=isdel%>" target="sframe"><img src="../images/grzq/btn_sc.gif" width="63" height="22" border="0" /></a>
               <%
              }else
              {
              %>
               <img src="../images/grzq/btn_sc.gif" width="63" height="22" border="0" />
               <%
              }
                        %></td>
         </tr>
         <%
                  }
                  %>
         <tr >
           <td height="25" colspan="3" align="center"  style="font-size:15px;"><%
                   if(articleList != null && articleList.size() > 7)
                   {
                   %>
             �����ļ���������ɾ�������ϴ���
             <%
                   }else
                   {
                  %>
             <input type="button" name="Submit23" value="�ϴ��ļ�" onClick="MM_openBrWindow1('upload_wj.jsp?hyid=<%=hyid%>&isdel=<%=isdel%>','dd','width=600,height=280')">
             </a>
             <%
                   }
                  %></td>
         </tr>
       </table></td>
     </tr>
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
