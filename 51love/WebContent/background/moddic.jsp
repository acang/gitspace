<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%
  request.setCharacterEncoding("gbk");
  String dtype = request.getParameter(SessionNameDefine.DIC_TYPE_NAME);
  String dicid = request.getParameter(SessionNameDefine.DIC_ID_NAME);
  Dictype dt = null;
  if(dtype == null || (dt=DicTypeMap.getDicType(dtype))==null)
  {
     out.println("<script>\n");
     out.println("alert('û���ҵ����ֵ�����');\n");
     out.println("window.close();");
     out.println("</script>\n");
     return;
  }
  /**
   * �����޸Ĳ���
   */
  /////////////
  String dicnumber = request.getParameter("dicnumber");
  String dicname   = request.getParameter("dicname");
  String extend1   = request.getParameter("extend1");
  String extend2   = request.getParameter("extend2");
  String extend3   = request.getParameter("extend3");
  if(dicnumber != null)
  {
     Dic dictemp = new Dic();
     dictemp.setDicid(new Integer(SysCommonFunction.getIntegerByString(dicid)));
     dictemp.setContent(dicname==null?"":dicname);
     dictemp.setDicnumber(new Integer(SysCommonFunction.getIntegerByString(dicnumber)));
     dictemp.setDictype(dtype);
     dictemp.setExtend1(extend1 == null ? "":extend1);
     dictemp.setExtend2(extend2 == null ? "":extend2);
     dictemp.setExtend3(extend3 == null ? "":extend3);
     dictemp = DicMap.insertOrUpdateDic(dictemp);
     out.println("<script>\n");
     out.println("alert('���³ɹ���');\n");
     out.println("top.opener.location.reload();");
     out.println("parent.close();");
     out.println("window.close();");
     out.println("</script>\n");
     dicid = dictemp.getDicid().intValue()+"";
  }

  /////////////


  Dic dic = null;
  if(dicid != null)
  {
     dic = DicMap.getDic(dicid);
  }
  if(dicid == null)
    dicid = "0";

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
<link href="../style/css.css" rel="stylesheet" type="text/css">
    <script language=javascript src="../script/common.js"></script>
<script language="javascript">
function checkfrm(frm)
{

   if(trim(frm.dicnumber.value) == "")
   {
      alert("�������ֵ��ţ�");
      return false;
   }
   if (!isNumber(frm.dicnumber.value))
   {
       alert('�ֵ��ű���Ϊ����');
       return false;
   }
   if(trim(frm.dicname.value) == "")
   {
      alert("�������ֵ����ƣ�");
      return false;
   }
   return true;
}
</script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">�ֵ�����ά��</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<iframe name="dicFrm" style="display:none"></iframe>
<form action="moddic.jsp" method="POST" onSubmit="return checkfrm(this);" target="dicFrm">
<table width="500"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#D8D8D8" class="txt" style="border-collapse:collapse ">
       <input type="hidden" name="<%=SessionNameDefine.DIC_TYPE_NAME%>" value="<%=dtype%>">
       <input type="hidden" name="<%=SessionNameDefine.DIC_ID_NAME%>" value="<%=dicid%>">

       <tr valign="middle">
          <td width="96" height="36" align="center">�ֵ��ţ�</td>
          <td width="354" height="36"><input name="dicnumber" type="text" class="input3" id="dicnumber" value="<%=dic==null?"":dic.getDicnumber().intValue()+""%>"></td>
        </tr>
        <tr valign="middle">
          <td width="96" height="36" align="center">
            �ֵ����ƣ�</td>
          <td height="36"><input name="dicname" type="text" class="input3" id="dicname" value="<%=dic==null?"":dic.getContent()%>"></td>
        </tr>
        <%
        if(SysCommonFunction.checkPS(dt.getExtenduse(),0,'1'))
        {
        %>
        <tr valign="middle">
          <td height="36" align="center"><%=dt.getExtend1name()%></td>
          <td height="36"><textarea name="extend1" cols="64" rows="5" class="txt" id="extend1"><%=dic==null?"":dic.getExtend1()%></textarea></td>
        </tr>
        <%
        }
        %>
        <%
        if(SysCommonFunction.checkPS(dt.getExtenduse(),1,'1'))
        {
        %>
        <tr valign="middle">
          <td height="36" align="center"><%=dt.getExtend2name()%></td>
          <td height="36"><textarea name="extend2" cols="64" rows="5" class="txt" id="extend2"><%=dic==null?"":dic.getExtend2()%></textarea></td>
        </tr>
        <%
        }
        %>
        <%
        if(SysCommonFunction.checkPS(dt.getExtenduse(),2,'1'))
        {
        %>
        <tr valign="middle">
          <td height="36" align="center"><%=dt.getExtend3name()%></td>
          <td height="36"><textarea name="extend3" cols="64" rows="5" class="txt" id="extend3"><%=dic==null?"":dic.getExtend3()%></textarea></td>
        </tr>
        <%
        }
        %>
        <tr valign="middle">
          <td height="40" colspan="2" align="center"><input name="" type="submit" class="button1"  value="ȷ����">
            ��
              <input name="reset" type="reset" class="button1" value="�ء�д">
            ��
            <input name="close" type="button" class="button1" onClick="window.close();" value="�ء���"></td>
        </tr>
</table>
</form>
</body>
</html>

