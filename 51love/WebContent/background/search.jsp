<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
String isdel = SysCommonFunc.getStrParameter(request,"isdel");
String title = "������Ա";
String action = "editinfo.jsp";
if(isdel.equals("1"))
{
  title = "������ɾ����Ա";
  action = "editinfodel.jsp";
}
String stime = (String)session.getAttribute("stime");
String etime = (String)session.getAttribute("etime");

List adminList = AdminMng.getAdminList();
String czry    = SysCommonFunc.getStrParameter(request,"czry");
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
<script src="tom_reg.js"></script>
<link rel="stylesheet" type="text/css" media="all" href="../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../commonlib/calendar/calendar-setup.js"></script>
</head>

<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center"><%=title%></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
<form name="personal" method="post" action="<%=action%>">
  <input type="hidden" name="isdel" value="<%=isdel%>">

  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0" class="txt">
    <tr class="font12">
      <td width="102" height="32" align="center" class="tdc" ><strong>�û���</strong></td>
      <td width="355" height="32" align="left" >
      <input name="username" type="text" class="input3" id="username">      </td>
      <td width="84" height="32" align="center" class="tdc" ><strong>E-mail</strong></td>
      <td width="407" height="32" align="left" ><input name="email" type="text" class="input3" id="email2">      </td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>�ǳ�</strong></td>
      <td height="32" align="left" ><input name="lcname" type="text" class="input3" id="lcname"></td>
      <td height="32" align="center" class="tdc" ><strong>QQ</strong></td>
      <td height="32" align="left" ><input name="oicq" type="text" class="input3" id="oicq2"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>�Ա�</strong></td>
      <td height="32" align="left" ><font size="2">
                                  <select name="sex" size="1" class="border" id="sex">
                                    <option selected value="0">����</option>
                                   <%=DicList.getDicListOption(SysDefine.DIC_SEX,"-1")%>
                                  </select>
      </font>      </td>
      <td height="32" align="center" class="tdc" ><strong>�ֻ�����</strong></td>
      <td height="32" align="left" ><input name="sjtel" type="text" class="input3" id="sjtel3"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>ѧ��</strong></td>
      <td height="32" align="left" ><select name="whcd" id="select2">
        <option selected value="0">����</option>
        <%=DicList.getDicListOption(SysDefine.DIC_WHCD,"-1")%>
      </select></td>
      <td height="32"  align="center" class="tdc"><strong>�̶��绰</strong></td>
      <td height="32" align="left" ><font size="2">
        <input name="tel" type="text" class="input3" id="tel">
      </font></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>����״��</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="hyzk" size="1" class="border" id="select5">
          <option selected value="0">����</option>
          <%=DicList.getDicListOption(SysDefine.DIC_HYZH,"-1")%>
        </select>
      </font></td>
      <td height="32"  align="center" class="tdc"><strong>����</strong></td>
      <td height="32" align="left" ><font size="2">��
          <select name="agestart" size="1" class="border" id="select3">
            <option selected value="0">����</option>
            <%
                              for(int i=16;i < 71;i ++)
                              {
                              %>
            <option  value="<%=i%>"><%=i%></option>
            <%
                              }
                                %>
          </select>
��
<select name="ageend" size="1" class="border" id="select4">
  <option selected value="0">����</option>
  <%
                              for(int i=16;i < 71;i ++)
                              {
                              %>
  			<option  value="<%=i%>"><%=i%></option>
  			<%
                              }
                                %>
</select>
      </font></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>���</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="sg" size="1" class="border" id="select6">
          <option selected value="0">����</option>
          <%=DicList.getDicListOption(SysDefine.DIC_SG,"-1")%>
        </select>
      </font></td>
      <td height="32"  align="center" class="tdc"><strong>סַ</strong></td>
      <td height="32" align="left" ><select name="s1" onChange="SetCity()">
        <option value="0" selected>ȫ��</option>
        <option value="����">����</option>
        <option value="���">���</option>
        <option value="�ӱ�">�ӱ�</option>
        <option value="ɽ��">ɽ��</option>
        <option value="���ɹ�">���ɹ�</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="������">������</option>
        <option value="�Ϻ�">�Ϻ�</option>
        <option value="����">����</option>
        <option value="�㽭">�㽭</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="ɽ��">ɽ��</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="�㶫">�㶫</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="�Ĵ�">�Ĵ�</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="����">����</option>
        <option value="�ຣ">�ຣ</option>
        <option value="����">����</option>
        <option value="�½�">�½�</option>
        <option value="���">���</option>
        <option value="����">����</option>
        <option value="̨��">̨��</option>
        <option value="����">����</option>
      </select>
        <select name="s2">
          <option value="0" selected>ȫ��</option>
      </select></td>
    </tr>
    
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>������Ƭ</strong></td>
      <td height="32" align="left" ><select name="isimg" id="select7">
        <option value="-1" selected>����</option>
        <option value="1">��</option>
        <option value="0">��</option>
      </select></td>
      <td height="32"  align="center" class="tdc"><strong>�Ƿ�VIP</strong></td>
      <td height="32" align="left" ><select name="vip1" id="select8">
        <option value="-1" selected>����</option>
        <option value="1">��</option>
        <option value="0">����</option>
      </select></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>����</strong></td>
      <td height="32"  align="left"><select name="orderby" id="select12">
          <option value="0">ע��ʱ��</option>
          <option value="1">��½ʱ��</option>
          <option value="2">����ʱ��</option>
          <option value="3">VIP����ʱ��</option>
          <option value="4">ɾ��ʱ��</option>
      </select></td>
      <td height="32" align="center" class="tdc" ><strong>�����</strong></td>
      <td height="32"  align="left"><select name="shr" id="select11">
          <option value="-1">����</option>
          <option value="0">û��</option>
          <option value="1">��</option>
        </select>
      <input name="shrname" type="text" id="shrname2" size="10"></td>
    </tr>

    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>��ʼʱ��</strong></td>
      <td height="32" align="left" ><input name="starttime" type="text" class="input3" id="singname4"  value="<%=stime == null ? "":stime%>">
		        <img src="../commonlib/calendar/img.gif" width="20" height="14" id="startt">
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "starttime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "startt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script></td>
      <td height="32"  align="center" class="tdc"><strong>��ֹʱ��</strong></td>
      <td height="32" align="left" ><input name="endtime" type="text" class="input3" id="singname5"  value="<%=etime == null ? "":etime%>">
      <img src="../commonlib/calendar/img.gif" width="20" height="14" id="endt">
      <script type="text/javascript">
    Calendar.setup({
        inputField     :    "endtime",      // id of the input field
        ifFormat       :    "%Y-%m-%d",       // format of the input field
        showsTime      :    false,            // will display a time selector
        button         :    "endt",   // trigger for the calendar (button ID)
        singleClick    :    true,           // double-click mode
        step           :    1                // show all years in drop-down boxes (instead of every other year as default)
    });
</script></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>��ԴIP</strong></td>
      <td height="32" align="left" ><select name="isip" id="select9">
        <option value="-1">����</option>
        <option value="0">û��</option>
        <option value="1">��</option>
      </select>
      <input name="httpip" type="text" class="input3" size="10"></td>
      <td height="32" align="center" class="tdc" ><strong>��Դ��ַ</strong></td>
      <td height="32" align="left" ><select name="isurl" id="select10">
        <option value="-1">����</option>
        <option value="0">û��</option>
        <option value="1">��</option>
      </select>
      <input name="httpurl" type="text" class="input3" size="10"></td>
    </tr>
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>��Դ���</strong></td>
      <td height="32" align="left" >

      <select name="advid" id="advid">
        <option value="0" selected>����</option>
       <%
      List list = HbmOperator.list("from Advmember as o where o.flag = 1");
      for(int j=0;j<list.size();j++)
      {
      	Advmember adv=(Advmember)list.get(j);
       %>
        <option value="<%=adv.getAdvmembercode()%>"><%=adv.getAdvmembername()%></option>
        <%
        	}
         %>
         <option value="50">�ֻ�վ</option>
         <option value="51">΢��վ</option>
      </select></td>
      <td height="32" align="center" class="tdc" ><strong>����</strong></td>
      <td height="32" align="left" ><font size="2">
        <select name="tz" size="1" class="border" id="tz">
          <option selected value="0">����</option>
          <%=DicList.getDicListOption(SysDefine.DIC_TZ,"-1")%>
        </select>
      </font></td>
    </tr>
    <%
    		if(isdel.equals("1"))
			{
     %>
    
    <tr class="font12">
    <td height="32" align="center" class="tdc" ><strong>ɾ����</strong></td>
    <td width="46%" height="22" align="left"><select name="czry" id="czry">
    <option value="">����</option>
       <%
       for(int i=0;i < adminList.size();i ++)
       {
          Admininfo temp = (Admininfo)adminList.get(i);
          String se = "";
          if(czry.equals(temp.getAdminname()))
           se = "selected";
       %>
       <option value="<%=temp.getAdminname()%>" <%=se%>><%=temp.getAdminname()%></option>
       <%
       }
       %>
                                      </select></td>
                                      <td ></td>
    </tr>

<%} %>
<tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>�Ƿ���֤</strong></td>
      <td height="32" align="left" ><select name="isv" id="select12">
        <option value="-2">����</option>
        <option value="1">����֤</option>
        <option value="0">δ��֤</option>
        
      </select>
      </td>
      <td height="32" align="center" class="tdc" ><strong>��������</strong></td>
      <td height="32" align="left" >
      	<select name="jyyx" size="1" class="border" id="jyyxzz">
           <option selected value="0">����</option>
           <option value="1">������</option>
           <option value="2">���ܹ�ϵ</option>
           <!-- <option value="3">ͬ������</option> -->
           <option value="3">����</option>
             <!--<option value="5">Eҹ��</option>-->
           <option value="4">���</option>
           <option value="5">����</option>
         </select>
      </td>
    </tr>
    
    <tr class="font12">
      <td height="32" align="center" class="tdc" ><strong>��Ա״̬</strong></td>
      <td height="32" align="left" ><select name="checkstatu" id="select13">
        <option value="-2">����</option>
        <option value="0">��Ч</option>
        <option value="2">�����</option>
        <option value="1">ɾ��</option>
        
      </select>
      </td>
      <td height="32" align="center" class="tdc" ><strong>�Ƿ��Ƽ�</strong></td>
      <td height="32" align="left" ><select name="istj" id="select14">
        <option value="-1">����</option>
        <option value="0">���Ƽ�</option>
        <option value="1">�Ƽ�</option>
      </select>
      </td>
    </tr>

    <tr class="font12">
      <td height="32" colspan="4" align="center" ><input type="submit" name="Submit" value="������"  class="button1"></td>
    </tr>
        <tr>
      <td height="25" colspan="5" align="center" >&nbsp;</td>
    </tr>
        <tr>
      <td height="25" colspan="5" align="center" >&nbsp;</td>
    </tr>
  </table>
</form>

</body>
</html>


