<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="java.util.Date" %>

<%

String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
String biz = SysCommonFunc.getStrParameter(request,"biz");
String id = SysCommonFunc.getStrParameter(request,"id");
String wttype = SysCommonFunc.getStrParameter(request,"wttype");
String cpages = SysCommonFunc.getStrParameter(request,"cpages");
int id2=0;
if(biz.equals("1"))
{
	if(bizaction.equals("add"))
{
     String s = WTJDMng.preWtjd(request);
     id2= Integer.parseInt(s);
      if(s.length()< 5)
      {
         out.println("<script langauge=javascript>window.open('../../veiwwt-id-"+id2+".htm');</script>");
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"��');</script>");
      }

  }
}
else
{
if(bizaction.equals("add"))
{
     String s = WTJDMng.addOrModWtjd(request);
      if(s == null)
      {
         out.println("<script langauge=javascript>alert('����ɹ���');</script>");
          if("5".equals(wttype)){
              response.sendRedirect("../newslist5.jsp");
          }else{
              response.sendRedirect("../newslist.jsp?cpages="+cpages);
          }

         return ;
      }
      else
      {
         out.println("<script langauge=javascript>alert('"+s+"��');</script>");
      }

  }
  }



  Wtjd wtjd = null;
  Bcb  bcb  = null;

  if(id.length() >0)
     wtjd = WTJDMng.getWtjdFromid(id);
     else
     wtjd =WTJDMng.getWtjdFromid(String.valueOf(id2));
  bcb = null;
  if(wtjd != null && wtjd.getAnswer() != null)
    bcb = BCBMng.getBcbFromid(wtjd.getAnswer().toString());
  String content = bcb == null? "":SysCommonFunc.getStringFromBlob(bcb.getContent());
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
    <script language=javascript src="../../script/common.js"></script>
    <script type="text/javascript" src="../../ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        window.onload = function()
        {
            CKEDITOR.replace('content');//FContent�������Ӧ�ı���
        };

        //����ͼƬ ������༭��
        function InsertHTML(s) {
            var editor = CKEDITOR.instances.content; //FContent�������Ӧ�ı���
            if (editor.mode == 'wysiwyg') {
                editor.insertHtml(s);
            }
            CKEDITOR.dialog.getCurrent().hide();//���ص�����
        }

    </script>
<script language="javascript">
function checkfrm(frm)
{
   if (trim(document.all("title").value) == "") {
       alert('���ⲻ����Ϊ�գ�����д��');
       document.all("title").focus();
       return false;
   }
   var s =document.getElementById('title').value;
   var l = 0;
   var a = s.split("");
   for (var i=0;i<a.length;i++) {
   if (a[i].charCodeAt(0)<299) {
   l++;
   } else {
     l+=2;
   }
 }

    if(l>=37)
    {
	   alert("����������18�����֣�");
           return false;
    }

   form1.submit();
}

function checkfrm2(frm)
{

   if (trim(document.all("title").value) == "") {
       alert('���ⲻ����Ϊ�գ�����д��');
       document.all("title").focus();
       return false;
   }


   var s =document.getElementById('title').value;
   var l = 0;
   var a = s.split("");
   for (var i=0;i<a.length;i++) {
   if (a[i].charCodeAt(0)<299) {
   l++;
   } else {
     l+=2;
   }
 }

    if(l>=37)
    {
	   alert("����������18�����֣�");
           return false;
    }
   document.form1.biz.value = "1";
   form1.submit();
}

</script>
<link rel="stylesheet" type="text/css" media="all" href="../../commonlib/calendar/calendar-win2k-cold-1.css" title="win2k-cold-1" />
	<script type="text/javascript" src="../../commonlib/calendar/calendar.js"></script>

	<!-- language for the calendar -->
	<script type="text/javascript" src="../../commonlib/calendar/lang/calendar-zh.js"></script>

	<!-- the following script defines the Calendar.setup helper function, which makes
		   adding a calendar a matter of 1 or 2 lines of code. -->
	<script type="text/javascript" src="../../commonlib/calendar/calendar-setup.js"></script>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="../images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="../images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
        <tr>
          <td align="center">��վ��̬</td>
        </tr>
    </table></td>
    <td width="61"><img src="../images/popwin1_03.gif" width="61" height="63"></td>
    <td background="../images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="../images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>

<form action="wtnews_mod.jsp" method="POST"  name="form1" id="form1" >
  <table width="100%"  border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#999999" class="txt" style="border-collapse:collapse ">
    <input type="hidden" name="id" value="<%=wtjd==null? "":wtjd.getId().toString()%>">
    <input type="hidden" name="id2" value="<%=id2%>">
    <input type="hidden" name="bcbid" value="<%=bcb == null? "":bcb.getId().toString()%>">
    <input type="hidden" name="bizaction" value="add">
    <input type="hidden" name="biz" value="">
	<input type="hidden"name="wttype" id="wttype"  value="<%=wttype%>">
      <%
          if("5".equals(wttype)){
      %>
    <tr valign="middle">
      <td width="20%" height="32" align="center" class="tdc"><strong>
       ������

      </strong></td>
      <td width="80%"><input name="title" type="text" class="input3" id="title"  style="width:20% " value="<%=wtjd == null? "":wtjd.getAsk()%>"></td>
    </tr>
      <%
          }else{
      %>
     <input name="bianhao" type="hidden" value="001">
     <input name="title" type="hidden" value="��վ��̬">
      <%--<input name="stime" type="hidden" value="<%=DateTools.dateToString(new Date(),true)%>">--%>
      <tr valign="middle">
      <td width="166" height="32" align="center" class="tdc"><strong>����ʱ��</strong></td>
      <td width="1073"><input name="stime" type="text" class="input3" id="stime"  value="<%=wtjd == null ? "" : DateTools.dateToString(wtjd.getStime(),false)%>">
          <img src="../../commonlib/calendar/img.gif" width="20" height="14" id="endt">
          <script type="text/javascript">
              Calendar.setup({
                  inputField     :    "stime",      // id of the input field
                  ifFormat       :    "%Y-%m-%d",       // format of the input field
                  showsTime      :    false,            // will display a time selector
                  button         :    "endt",   // trigger for the calendar (button ID)
                  singleClick    :    true,           // double-click mode
                  step           :    1                // show all years in drop-down boxes (instead of every other year as default)
              });
          </script></td>
  </tr>
      <%
          }
      %>


    <tr valign="middle">
      <td height="25" colspan="2" align="center">
          <textarea cols="25" id="content" name="content" rows="10"><%=content%></textarea>
        </td>
    </tr>
    <tr valign="middle">
    
      <td height="40" colspan="2" align="center">
          <%
              if(!"5".equals(wttype) && !"2".equals(wttype)){
          %>
          <input name="" type="button" class="button1"  value="Ԥ����" onClick="checkfrm2();">
          <%}%>
      &nbsp;&nbsp;<input name="" type="button" class="button1"  value="ȷ����" onClick="checkfrm();">
            </td>
    </tr>
  </table>
</form>
<ckeditor:replace replace="content" basePath="/ckeditor/" />
</body>
</html>

