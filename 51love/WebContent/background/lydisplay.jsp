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
	   
	   String bizaction = SysCommonFunc.getStrParameter(request,"bizaction");
	   String sqlt="";
	   DynaBean dbt =null;
	   List listt =null;
	   if(bizaction.equals("1"))
	   {
	    String lyid = SysCommonFunc.getStrParameter(request,"lyid");
	   	sqlt="select * from kfzx where id ="+lyid;
        listt=QueryRecord.query(sqlt);
	    dbt =(DynaBean)listt.get(0);
	   }
	   if(bizaction.equals("0"))
	   {
  		String ordid = SysCommonFunc.getStrParameter(request,"ordid");
  		sqlt="select * from cart where ordid ="+ordid;
        listt=QueryRecord.query(sqlt);
	    dbt =(DynaBean)listt.get(0);
	   }
	      
	   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
	   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
	   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
	   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
	   String wttype = SysCommonFunc.getStrParameter(request,"wttype");
	   
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
        <td align="center"><%=bizaction.equals("1")?"�鿴����":"�鿴����" %></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
<br>
 <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"   bordercolor="D8D8D8" class="txt" style="border-collapse:collapse" >
 <%if(bizaction.equals("1")) 
 {
 %>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>��������</strong></td>
    <td height="25"><%=DateTools.dateToString((Date)dbt.get("n_date"),true)%></td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>��ϵ�绰</strong></td>
    <td width="81%" height="25"><%=dbt.get("tel")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>E-mail</strong></td>
    <td height="25"><%=dbt.get("email")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>����</strong></td>
    <td height="25"><%=dbt.get("n_title")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>��������</strong></td>
    <td height="25"><%=dbt.get("n_text")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>�ظ�����</strong></td>
    <td height="25"><%=dbt.get("n_content")%></td>
  </tr>
    <%
    }
    %>
    
 <%if(bizaction.equals("0")) 
 {
 %>
   <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>����</strong></td>
    <td height="25"><%=DateTools.dateToString((Date)dbt.get("sjtime"),true)%></td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>������</strong></td>
    <td width="81%" height="25"><%=dbt.get("ordid")%> </td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>�����û���</strong></td>
    <td width="81%" height="25"><%=dbt.get("username")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>������Ŀ</strong></td>
    <td height="25"><%=dbt.get("name")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>�۸�</strong></td>
    <td height="25"><%=dbt.get("transamt")%>Ԫ</td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>����������</strong></td>
    <td height="25"><%=dbt.get("zsname")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>��ϵ�绰</strong></td>
    <td height="25"><%=dbt.get("tel")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>�����ʼ�</strong></td>
    <td height="25"><%=dbt.get("email")%></td>
  </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>סַ</strong></td>
    <td height="25"><%=dbt.get("address")%></td>
  </tr>
     <%
         int paymodetemp = 0;
         String pay_str = "";
         if(dbt.get("paymode")!=null){
             paymodetemp =  Integer.valueOf(dbt.get("paymode").toString());
         }

         if(paymodetemp ==0)
             pay_str = "��";
         if(paymodetemp ==1)
             pay_str = "����";
         if(paymodetemp ==2)
             pay_str = "΢��";
         if(paymodetemp ==3)
             pay_str = "֧����";
         if(paymodetemp ==4)
             pay_str = "���л��";
        if(paymodetemp ==5)
            pay_str = "�ֻ�վ֧����";
        if(paymodetemp ==6)
        	pay_str = "΢��վ΢��֧��";
     %>
     <tr>
         <td height="25" align="center" nowrap class="tdc"><strong>֧����ʽ</strong></td>
         <td height="25"><%=pay_str%></td>
     </tr>
  <tr>
    <td height="25" align="center" nowrap class="tdc"><strong>֧�����</strong></td>
    <td height="25"><%=dbt.get("trans") != null && String.valueOf(dbt.get("trans")).equals("1") ? "�ɹ�":"���ɹ�"%></td>
  </tr>
  <tr>
    <td width="19%" height="25" align="center" nowrap class="tdc"><strong>�������</strong></td>
    <td width="81%" height="25"><%=dbt.get("upgrade") != null && String.valueOf(dbt.get("upgrade")).equals("1") ? "�ɹ�":"���ɹ�"%>    </td>
  </tr>
   <tr>
        <td height="25" align="center" nowrap class="tdc"><strong>�Ƽ��ͷ�</strong></td>
        <td height="25"><%=dbt.get("simplename")%></td>
      </tr>
    <%
    }
    %>
</table>
</body>
</html>


