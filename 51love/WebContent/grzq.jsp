<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.obj.extend.DicList" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.common.SysCommonFunc" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />


<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
<script src="js/Popup.js"></script>
<script src="js/tom_reg2.js"></script>
<script type="text/javascript">
function tan()
{
    document.getElementById('lcname1').style.display ='none';
    document.getElementById('qggx1').style.display ='none';
    document.getElementById('lxqr1').style.display ='none';
    document.getElementById('jyly1').style.display ='none';
}

function tag_byteLen(str) {
    var len = 0;

    for (var i = 0; i < str.length; i++) {
        var code = str.charCodeAt(i);
        if (code > 255) {
            len += 2;
        }
        else {
            len += 1;
        }
    }

    return len;
}
function test()
{
    var jyyx01,i,j=0;
    if (checkspace(document.personal.password.value)||document.personal.password.value == 'null'){
        alert('���������룡');
        document.personal.password.focus();
        return false;
    }
    if (document.personal.password.value!=document.personal.repassword.value)
    {
        alert('��������������벻һ�£�����������!');
        document.personal.password.focus();
        return false;
    }
    if (checkspace(document.personal.ask.value)||document.personal.ask.value == 'null'){
        alert('���������뱣�������⣡');
        document.personal.ask.focus();
        return false;
    }
    if (checkspace(document.personal.answer.value)||document.personal.answer.value == 'null'){
        alert('���������뱣���Ĵ𰸣�');
        document.personal.answer.focus();
        return false;
    }
    if (checkspace(document.personal.lcname.value)){
        alert('�����������ǳƣ�');
        document.personal.lcname.focus();
        return false;
    }
    var s =document.personal.lcname.value ;
    if (tag_byteLen(s)>12)
    {
        alert('��������ǳƲ��ܳ���6����,������');
        document.personal.lcname.focus();
        return false;
    }
    if ( s.indexOf("�ֻ���Ա")>=0 )
    {
        alert('���޸������ǳƣ�');
        document.personal.lcname.focus();
        return false;
    }
    var shu="0123456789";
    var s =document.personal.lcname.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('��������ǳƺ���������ϵ�취������,������');
        document.personal.lcname.focus();
        return false;
    }
    var qggx1 = document.personal.qggx.value;
    var lxqr1 = document.personal.lxqr.value;
    var jyly1 = document.personal.jyly.value;
    if (((qggx1.indexOf("script")>=0)||(qggx1.indexOf("<")>=0)||(qggx1.indexOf(">")>=0)))
    {
        alert('��������鰮��ϵ����Υ������,������');
        document.personal.qggx.focus();
        return false;
    }
    if (((lxqr1.indexOf("script")>=0)||(lxqr1.indexOf("<")>=0)||(lxqr1.indexOf(">")>=0)))
    {
        alert('��������������˺���Υ������,������');
        document.personal.lxqr.focus();
        return false;
    }
    if (((jyly1.indexOf("script")>=0)||(jyly1.indexOf("<")>=0)||(jyly1.indexOf(">")>=0)))
    {
        alert('������Ľ������Ժ���Υ������,������');
        document.personal.jyly.focus();
        return false;
    }
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }
    if (x==1) {
        alert('��������ǳƺ���������ϵ�취������,������');
        document.personal.lcname.focus();
        return false;
    }

    if (document.personal.s1.value=="-1" || document.personal.s1.value=="")
    {
        alert('��ѡ�����ĵ�ַ��');
        document.personal.s1.focus();
        return false;
    }

    if (document.personal.s2.value=="-1" || document.personal.s2.value=="")
    {
        alert('��ѡ�����ĳ��е�ַ��');
        document.personal.s1.focus();
        return false;
    }

    if (document.personal.s3.value=="" || document.personal.s3.value=="����")
    {
        alert('���������ĵ�ַ�������ƣ�');
        document.personal.s3.focus();
        return false;
    }
	if (document.personal.year.value=="" )
    {
        alert('����������������ݣ�');
        document.personal.year.focus();
        return false;
    }
    if (document.personal.month.value=="" )
    {
        alert('���������������·ݣ�');
        document.personal.month.focus();
        return false;
    }
    if (document.personal.day.value=="" )
    {
        alert('�����������������ڣ�');
        document.personal.day.focus();
        return false;
    }
    if (checkspace(document.personal.csdate.value)){
        alert('��ѡ�����ĳ������ڣ�');
        document.personal.csdate.focus();
        return false;
    }
    var dtEnd = new Date();
    var dtStart = document.personal.csdate.value.substr(0,4);
    if ((dtEnd.getFullYear() - dtStart<16)||(dtEnd.getFullYear() - dtStart>70))
    {
        alert('��������С��16�꣬����ע�ᣡ');
        return false;
    }
    var xgtz01="",yyap01=""
    i=0;
    j=0;
    for (i=0;i<document.personal.xgtz.length;i++) {
        if (document.personal.xgtz[i].checked)
        {
            j=1+j;
            xgtz01=xgtz01+"1"
        }
        else{
            xgtz01=xgtz01+"0"
        }
    }
    if (j==0||j>=5) {
        alert("��ѡ�������Ը����������Ҳ��������")
        return (false);
    }
    document.personal.xgtz01.value=xgtz01;
    i=0;
    j=0;
    for (i=0;i<document.personal.yyap.length;i++) {
        if (document.personal.yyap[i].checked)
        {
            j=1+j;
            yyap01=yyap01+"1"
        }
        else{
            yyap01=yyap01+"0"
        }
    }
    if (j==0||j>=5) {
        alert("��ѡ������ҵ�ల�ţ����Ҳ��������")
        return (false);
    }
    document.personal.yyap01.value=yyap01;
    var jyyx01=""
    i=0;
    j=0;
    for (i=0;i<document.personal.jyyx.length;i++) {
        if (document.personal.jyyx[i].checked)
        { j=1+j;
            jyyx01=jyyx01+"1"
        }else
        {
            jyyx01=jyyx01+"0"
        }

    }
    if (j==0||j>=5) {
        alert("��ѡ�������򣡲��Ҳ��������")
        return (false);
    }
    document.personal.jyyx01.value="1"+jyyx01;
    if (checkspace(document.personal.qggx.value)){
        alert('�����������鰮��ϵ�Ŀ�����');
        document.personal.qggx.focus();
        return false;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('��������鰮��ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return false;
    }
    j=0;
    var x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('��������鰮��ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return false;
    }

    if (checkspace(document.personal.lxqr.value)){
        alert('�����������������ˣ�');
        document.personal.lxqr.focus();
        return false;
    }

    var shu="0123456789";
    var s =document.personal.qggx.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('����������Թ�ϵ����������ϵ�취������,������');
        document.personal.qggx.focus();
        return false;}
    var m = document.personal.lxqr.value;
    if (((m.indexOf("http")>=0)||(m.indexOf("www")>=0)||(m.indexOf("@")>=0)))
    {
        alert('��������������˺���������ϵ�취������,������');
        document.personal.lxqr.focus();
        return false;
    }
    j=0;
    var x=0;
    for (i=0;i<m.length;i++)
    {
        if ((shu.indexOf(m.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('��������������˺���������ϵ�취������,������');
        document.personal.lxqr.focus();
        return false;
    }


    if (checkspace(document.personal.jyly.value)){
        alert('���������Ľ������ԣ�');
        document.personal.jyly.focus();
        return false;
    }
    if ((document.personal.jyly.value.length<20) || (document.personal.jyly.value.length>300))
    {
        alert('Ϊ��֤����Ч������������20�����ϣ����ܳ���300�֣���������д�κ���ϵ��ʽ');
        document.personal.jyly.focus();
        return false;
    }
    s =document.personal.jyly.value ;
    if (((s.indexOf("http")>=0)||(s.indexOf("www")>=0)||(s.indexOf("@")>=0)))
    {
        alert('������������к���������ϵ�취������,������');
        document.personal.jyly.focus();
        return false;
    }
    j=0;
    x=0;
    for (i=0;i<s.length;i++)
    {
        if ((shu.indexOf(s.charAt(i)))>=0 )
        {
            j=j+1;
            if (j==6)
            {x=1;
            }
        }
        else
        {   j=0;
        }
    }

    if (x==1) {
        alert('������������к���������ϵ�취������,������');
        document.personal.jyly.focus();
        return false;
    }

    if (checkspace(document.personal.sjtel.value))
    {
        alert("�������ֻ�����");
        document.personal.sjtel.focus();
        return false;
    }

//    if (checkspace(document.personal.oicq.value))
//    {
//        alert("������qq����");
//        document.personal.oicq.focus();
//        return false;
//    }

	if(!confirm('�޸����ϻὫ������������Ϊ�����״̬����վ���Ա��������ʵ�󼤻������������ߣ�')) {
		return false;
	}
    return true;
}
  
function checkspace(checkstr) {
    var str = '';
    for(i = 0; i < checkstr.length; i++) {
        str = str + ' ';
    }
    return (str == checkstr);
}
   function zuheYMD(){
   
		var year = document.personal.year.value;
		var month = document.personal.month.value;
		var day = document.personal.day.value;
		
		if(month.length<2){
			month = "0"+month;
		}
		if(day.length<2){
			day = "0"+day;
		}
       document.personal.csdate.value=  year+"-"+month+"-"+day;
   }

</script>

</head>

<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    String username = request.getParameter("username");
    long uL = 0;
    try
    {
        uL=Long.parseLong(loginUser.getUsername());
    }catch(Exception e)
    {

    }

    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼����');showLogin('index.jsp','grzq.jsp');</script>");
        return;
    }else{
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
%>

<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();
%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
  <div class="box01"> <span class="tx">
      <%
         if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())
         &&new File("E:\\web\\lover51\\upload\\hyimgsmall\\"+uother.getUserphoto1()).exists()){
          String left_small_pic ="../"+afilepathsmall+File.separator+uother.getUserphoto1();
      %>
      <img src="<%=left_small_pic%>" alt=""/>
       <%
           }else{
       %>
          <img src="images/nopic2.gif" alt=""/>

       <%
           }
       %>
  </span>
      <%
          String lcname = "";
          if(grwhqUser!=null){
              lcname =  grwhqUser.getLcname();
          }
      %>
      
      <p class="zl"><a href="perinfo.jsp?id=<%=loginUser.getHyid()%>"><strong><%=lcname%></strong></a></p>
      
      <div class="lm_name">
          <h2>���˲���ר��</h2>
      </div>
      <%@ include file="grleft.jsp"%>
  </div> 
    <div class="box02">
      <div class="lm_name">
        <h2>�����޸�</h2>
      </div>
      <form name="personal" method="post" action="userinfoupdate.jsp" onSubmit="return test()" >
<table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02">
              <tbody>
                <tr>
                  <td style="width:120px;" align="right" bgcolor="#D6E6F3" class="bk04"><strong>�û�����</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><strong><%=loginUser.getUsername()%></strong></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���룺</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                      <input name="password" type="password" class="txt01" id="password" value="<%=loginUser.getPassword()%>"/>
                        ��10λ�����ַ���</td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�������룺</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                        <input name="repassword" type="password" class="txt01" id="repassword2" value="<%=loginUser.getPassword()%>"/>
                        ���磺������</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���뱣�����⣺</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="ask" type="text" class="txt01" id="ask2"  maxlength="40" value="<%=loginUser.getAsk()%>"/>
                    ���磺�ҵ�ĸ�׽�ʲô����</td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>���뱣���𰸣�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="answer" type="text" class="txt01" id="answer2"  maxlength="40" value="<%=loginUser.getAnswer()%>"/>
                      ���磺������</td>
                </tr>
                
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�����Ա�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                 	<% 
                 	if(loginUser.getSex()==null || loginUser.getSex().trim().length()<1){
                 		%>
                 		<select name="sex" id="sex">
                 			<%=DicList.getDicListOption(SysDefine.DIC_SEX, loginUser.getSex())%>
                  		</select>
                 		<%
                 	}else{
                 		String sexShow="10".equals(loginUser.getSex().trim())?"��":"Ů";
                 		%>
                 		<strong><%=sexShow%></strong>
                 		<%
                 	}
                 	
                 	%>

                      
                    &nbsp;&nbsp;
                    <!-- ���Ա�һ����д�ύ�������޸ģ�ֻ�ܲ鿴�������ϣ���׼ȷ��д���� --></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:5px;"><strong>�ǡ��ƣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <input name="lcname" type="text" class="txt01" id="lcname2" value="<%=loginUser.getLcname()%>" size="12" maxlength="12"/>
                      ����һ�������Ľ����ǳƣ�<div id="lcname1" style="display:none"><font color="red">���ǳ��к������дʣ����޸ģ���</font></div></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>סַ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                      <select name="s1" id="s1" onchange="SetCity(this,document.personal.s2)">
                      <%
                          if(loginUser.getS1()!=null){
                       %>
                          <option value="<%=loginUser.getS1()%>" selected="selected"><%=loginUser.getS1()%></option>
                       <%} %>
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
                      <select name="s2" id="s2">
                      <%
                          if(loginUser.getS2()!=null){
                       %>
                          <option value="<%=loginUser.getS2()%>" selected="selected"><%=loginUser.getS2()%></option>
                       <%} %>
                          
                      </select>
                      <input name="s3" type="text" class="input02" id="s3" value="<%=loginUser.getS3() == null ? "����":loginUser.getS3()%>" size="12" maxlength="5"/>  <%File name=null;if(username!=null){name = new File(username);}%>
                    </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�� �գ�</strong></td>

                    <input name="csdate" type="hidden" id="csdate" value="<%=DateTools.dateToString(loginUser.getCsdate(),false)%>"/>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="year" onchange="zuheYMD()">
                      <%
                          Date csDate = loginUser.getCsdate();
                          String year_month_day = "";
                          if(csDate!=null){
                               year_month_day = DateTools.dateToString(csDate,false);
                          }
                          
                          String year = "";
                          String month = "";
                          String day = "";
                          if(year_month_day!=null && !"".equals(year_month_day)){
                              year = year_month_day.substring(0,4);
                              month = year_month_day.substring(5,7);
                              day = year_month_day.substring(8,10);
                          }
                      %>
                      <option value="<%=year%>"><%=year%></option>
                      <option value="1945">1945</option>
                      <option value="1946">1946</option>
                      <option value="1947">1947</option>
                      <option value="1948">1948</option>
                      <option value="1949">1949</option>
                      <option value="1950">1950</option>
                      <option value="1951">1951</option>
                      <option value="1952">1952</option>
                      <option value="1953">1953</option>
                      <option value="1954">1954</option>
                      <option value="1955">1955</option>
                      <option value="1956">1956</option>
                      <option value="1957">1957</option>
                      <option value="1958">1958</option>
                      <option value="1959">1959</option>
                      <option value="1960">1960</option>
                      <option value="1961">1961</option>
                      <option value="1962">1962</option>
                      <option value="1963">1963</option>
                      <option value="1964">1964</option>
                      <option value="1965">1965</option>
                      <option value="1966">1966</option>
                      <option value="1967">1967</option>
                      <option value="1968">1968</option>
                      <option value="1969">1969</option>
                      <option value="1970">1970</option>
                      <option value="1971">1971</option>
                      <option value="1972">1972</option>
                      <option value="1973">1973</option>
                      <option value="1974">1974</option>
                      <option value="1975">1975</option>
                      <option value="1976">1976</option>
                      <option value="1977">1977</option>
                      <option value="1978">1978</option>
                      <option value="1979">1979</option>
                      <option value="1980">1980</option>
                      <option value="1981">1981</option>
                      <option value="1982">1982</option>
                      <option value="1983">1983</option>
                      <option value="1984">1984</option>
                      <option value="1985">1985</option>
                      <option value="1986">1986</option>
                      <option value="1987">1987</option>
                      <option value="1988">1988</option>
                      <option value="1989">1989</option>
                      <option value="1990">1990</option>
                      <option value="1991">1991</option>
                      <option value="1992">1992</option>
                      <option value="1993">1993</option>
                      <option value="1994">1994</option>
                      <option value="1995">1995</option>
                      <option value="1996">1996</option>
                      <option value="1997">1997</option>
                      <option value="1998">1998</option>
                      <option value="1999">1999</option>
                    </select>
                    ��
                    <select name="month" onchange="zuheYMD()">
                        <option value="<%=month%>"><%=month%></option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                    </select>
                    ��
                    <select name="day" onchange="zuheYMD()">
                        <option value="<%=day%>"><%=day%></option>
                      <option value="1">1</option>
                      <option value="2">2</option>
                      <option value="3">3</option>
                      <option value="4">4</option>
                      <option value="5">5</option>
                      <option value="6">6</option>
                      <option value="7">7</option>
                      <option value="8">8</option>
                      <option value="9">9</option>
                      <option value="10">10</option>
                      <option value="11">11</option>
                      <option value="12">12</option>
                      <option value="13">13</option>
                      <option value="14">14</option>
                      <option value="15">15</option>
                      <option value="16">16</option>
                      <option value="17">17</option>
                      <option value="18">18</option>
                      <option value="19">19</option>
                      <option value="20">20</option>
                      <option value="21">21</option>
                      <option value="22">22</option>
                      <option value="23">23</option>
                      <option value="24">24</option>
                      <option value="25">25</option>
                      <option value="26">26</option>
                      <option value="27">27</option>
                      <option value="28">28</option>
                      <option value="29">29</option>
                      <option value="30">30</option>
                      <option value="31">31</option>
                    </select>
                    �� </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>Ѫ�ͣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="sx" id="select3">
                      <%=DicList.getDicListOption(SysDefine.DIC_XX ,loginUser.getSx())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>������</strong>
                      <select name="xz" id="select4">
                          <%=DicList.getDicListOption(SysDefine.DIC_XZ ,loginUser.getXz())%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>��ߣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <select name="sg" size="1" class="border" id="select5">
                      <%=DicList.getDicListOption(SysDefine.DIC_SG ,loginUser.getSg())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>����</strong>��
                          <select name="tz" size="1" class="border" id="select6">
                              <%=DicList.getDicListOption(SysDefine.DIC_TZ ,loginUser.getTz())%>
                          </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<strong>��ɫ</strong>��
                              <select name="fs" size="1" class="border" id="select7">
                                  <%=DicList.getDicListOption(SysDefine.DIC_FS ,loginUser.getFs())%>
                              </select>
                    </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>����״����</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="hyzk" size="1" class="border" id="select10">
                      <%=DicList.getDicListOption(SysDefine.DIC_HYZH ,loginUser.getHyzk())%>
                  </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�Ļ��̶ȣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">  <%
                      String o = "";
                      if(loginUser.getWhcd()!=null){
                          o =  loginUser.getWhcd().toString();
                      }

                      if(o.equals("11")){
                          o = "12";
                      }else{
                          o = loginUser.getWhcd();
                      }
                  %>
                      <select name="whcd" size="1" class="border" id="select8">

                          <%=DicList.getDicListOption(SysDefine.DIC_WHCD ,o)%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>ְҵ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="zy" size="1" class="border" id="zy">
                      <%=DicList.getDicListOption(SysDefine.DIC_ZY ,loginUser.getZy())%>
                  </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>��н��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><select name="yx" size="1" class="border" id="select9">
                      <%=DicList.getDicListOption(SysDefine.DIC_YX ,loginUser.getYx())%>
                  </select>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>ס����</strong>
                      <select name="zf" size="1" class="border" id="yx">
                          <%=DicList.getDicListOption(SysDefine.DIC_ZF ,loginUser.getZf())%>
                      </select></td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;"><strong>�Ը�������</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                      <ul>
                          <%
                              String xgtz01= "000000000000000";
                              if(loginUser.getXgtz()!= null && loginUser.getXgtz().length() == 15){
                                  xgtz01 = loginUser.getXgtz();
                              }


                          %>
                        <li><input name="xgtz" type="checkbox" id="xgtz002" value="1" <%if(xgtz01.charAt(0) == '1') out.print("checked");%>>������</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz012" value="1" <%if(xgtz01.charAt(1) == '1') out.print("checked");%> />�����ֹ�</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz022" value="1" <%if(xgtz01.charAt(2) == '1') out.print("checked");%>/>��Ȥ��Ĭ</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz032" value="1" <%if(xgtz01.charAt(3) == '1') out.print("checked");%>/>ֱˬ�ɴ�</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz042" value="1" <%if(xgtz01.charAt(4) == '1') out.print("checked");%>/>׷��̼�</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz052" value="1" <%if(xgtz01.charAt(5) == '1') out.print("checked");%>>����С��</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz062" value="1" <%if(xgtz01.charAt(6) == '1') out.print("checked");%>/>��ʵ��ֱ</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz072" value="1" <%if(xgtz01.charAt(7) == '1') out.print("checked");%>/>��������</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz082" value="1" <%if(xgtz01.charAt(8) == '1') out.print("checked");%>/>��������</li>
                        <li> <input name="xgtz" type="checkbox" id="xgtz092" value="1" <%if(xgtz01.charAt(9) == '1') out.print("checked");%>/>С�Ľ���</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz102" value="1"  <%if(xgtz01.charAt(10) == '1') out.print("checked");%>>��������</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz112" value="1"  <%if(xgtz01.charAt(11) == '1') out.print("checked");%>/>����Ƹ�</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz122" value="1"  <%if(xgtz01.charAt(12) == '1') out.print("checked");%>/>ѭ�浸��</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz132" value="1"  <%if(xgtz01.charAt(13) == '1') out.print("checked");%>/>���Թ���</li>
                        <li><input name="xgtz" type="checkbox" id="xgtz142" value="1"  <%if(xgtz01.charAt(14) == '1') out.print("checked");%>/>��������</li>
                          <input type="hidden" name="xgtz01" />
                      </ul>
                      <div style="clear:both"></div>
                  </div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="padding-top:7px;"><strong>ҵ������ţ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                  	<ul>
                        <%
                            String yyap01= "00000000000";
                            if(loginUser.getYyap()!= null && loginUser.getYyap().length() == 11){
                                yyap01 = loginUser.getYyap();
                            }
                        %>
                  	<li><input name="yyap" type="checkbox" id="yyap002" value="1" <%if(yyap01.charAt(0) == '1') out.print("checked");%>/>�� �� ��</li>
                  	<li><input name="yyap" type="checkbox" id="yyap012" value="1" <%if(yyap01.charAt(1) == '1') out.print("checked");%>/>�� �� ��</li>
                  	<li><input name="yyap" type="checkbox" id="yyap022" value="1" <%if(yyap01.charAt(2) == '1') out.print("checked");%>/>��������</li>
                  	<li><input name="yyap" type="checkbox" id="yyap032" value="1"  <%if(yyap01.charAt(3) == '1') out.print("checked");%>/>�ϡ�����</li>
                  	<li><input name="yyap" type="checkbox" id="yyap042" value="1"  <%if(yyap01.charAt(4) == '1') out.print("checked");%>/>�� ��OK</li>
                  	<li><input name="yyap" type="checkbox" id="yyap052" value="1" <%if(yyap01.charAt(5) == '1') out.print("checked");%>/>�� �� ��</li>
                  	<li><input name="yyap" type="checkbox" id="yyap062" value="1" <%if(yyap01.charAt(6) == '1') out.print("checked");%>/>�Ȳ�����</li>
                  	<li><input name="yyap" type="checkbox" id="yyap072" value="1" <%if(yyap01.charAt(7) == '1') out.print("checked");%>/>�����˶�</li>
                  	<li><input name="yyap" type="checkbox" id="yyap082" value="1"  <%if(yyap01.charAt(8) == '1') out.print("checked");%>/>��׬Ǯ</li>
                  	<li><input name="yyap" type="checkbox" id="yyap092" value="1" <%if(yyap01.charAt(9) == '1') out.print("checked");%>/>
                        <input type="hidden" name="yyap01" />�������</li>
                  	<li><input name="yyap" type="checkbox" id="yyap102" value="1" <%if(yyap01.charAt(10) == '1') out.print("checked");%>/>�ύ����</li>
                  </ul>
                  <div style="clear:both"></div>
                  </div>
                        </td>
                </tr>
                </tbody>
                </table>
             <table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" width="100%" style="margin-top:5px;">
              	<tbody>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04" style="width:120px;"><strong>��������</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  <div class="CheckboxList">
                  <ul>
                      <%
                          String jyyx01= "00000000";
                          if(loginUser.getJyyx()!= null && loginUser.getJyyx().toString().length() == 6)
                              jyyx01 = loginUser.getJyyx().toString();
                      %>
                  	<li><input name="jyyx" type="checkbox" id="jyyx002" value="1"   <%if(jyyx01.charAt(1) == '1') out.print("checked");%> >������</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx012" value="2"   <%if(jyyx01.charAt(2) == '1') out.print("checked");%> >���ܹ�ϵ</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx022" value="3"   <%if(jyyx01.charAt(3) == '1') out.print("checked");%> >�� ��</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx032"  value="4"  <%if(jyyx01.charAt(4) == '1') out.print("checked");%> />���</li>
                  	<li><input name="jyyx" type="checkbox" id="jyyx042"  value="5"  <%if(jyyx01.charAt(5) == '1') out.print("checked");%> />����
                        <input type="hidden" name="jyyx01" />
                    </li>
                  </ul>
                  <div style="clear:both"></div>
                  </div>
                 </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�鰮��ϵ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  ����Ϊ���顢�������԰��Ĺ�ϵ��ʲô��������д�κ���ϵ��ʽ<br/>
                      <%
                      String qggx_str = "";
                          if(uother!=null){
                              if(uother.getQggx()!=null &&! "null".equals(uother.getQggx())){
                                          qggx_str =  uother.getQggx();
                                    }
                          }
                      %>
                      <textarea name="qggx" cols="70" rows="5" class="put" id="qggx2"><%=qggx_str%></textarea><br/>
                  <div id="qggx1"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�������ˣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  Ϊ��֤����Ч��������ϸ�������������ˣ���������д�κ���ϵ��ʽ<br/>
                      <%
                               String lxqr_content = "";
                          if(uother!=null && uother.getLxqr()!=null && !"null".equals(uother.getLxqr())){
                              lxqr_content = uother.getLxqr();
                          }
                      %>
                      <textarea name="lxqr" cols="70" rows="5" id="textarea2"><%=lxqr_content%></textarea><br/>
                  <div id="lxqr1"></div>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�������ԣ�</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">
                  Ϊ��֤����Ч������������20�����ϣ���������д�κ���ϵ��ʽ<br/>
                      <%
                          String jyly_content = "";
                          if(uother!=null && uother.getJyly()!=null && !"null".equals(uother.getJyly())){
                              jyly_content = uother.getJyly();
                                   if(name!=null){
                                       name.delete();
                                   }

                          }
                      %>
                      <textarea name="jyly" cols="70" rows="5" id="textarea"><%=jyly_content%></textarea><br/>
                  <div id="jyly1"></div>
                  </td>
                </tr>
                </tbody>
                </table>
                <table border="0" align="center" cellpadding="4" cellspacing="0" class="reg_tab02" width="100%" style="margin-top:5px;">
              	<tbody>
                <tr>
                  <td align="right" bgcolor="#FFFFFF" class="bk04"><strong>��ϵ��ʽ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">������д������ʵ��ϵ��ʽ���Ա���վ��˼�������Ա������ϵ��</td>
                </tr>
                <tr>
                  <td style="width:120px;" align="right" bgcolor="#D6E6F3" class="bk04"><strong><strong>�ֻ���</strong></strong></td>
                  <td bgcolor="#FFFFFF" class="bk04">


                      <%
                          if (loginUser.getVacsjtel()== 1){
                      %>
                      <strong><%=loginUser.getSjtel() == null ? "" : loginUser.getSjtel()%></strong>
                      <span style="background-color:#090; height:20px;margin-left:10px;
                color:#FFF">����֤</span> &nbsp;
                      <input type="button" class="button1" onClick="modifysjtel();" value="������֤" />
                      <%
                          }else{
                      %>



                      <input name="sjtel" type="text" class="input02" id="sjtel2" size="24" maxlength="20" value="<%=loginUser.getSjtel() == null ? "" : loginUser.getSjtel()%>" <%=(loginUser.getVacsjtel()== 1 && loginUser.getIsvcation() == 1 ) ? "readonly=\"true\"":"false"%>/>

                      <%
                          }
                      %>
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>�̶��绰��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <input name="tel" type="text" class="input02" id="tel2" size="24" maxlength="20" value="<%=loginUser.getTel()==null ? "":loginUser.getTel()%>" />
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>QQ��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"><input name="oicq" type="text" class="input02" id="oicq2" size="24" maxlength="20" value="<%=loginUser.getOicq() == null ? "":loginUser.getOicq()%>" />
                  </td>
                </tr>
                <tr>
                  <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>E-mail��</strong></td>
                  <td bgcolor="#FFFFFF" class="bk04"> <input name="email" type="text" class="input02" id="email" size="24" maxlength="50" value="<%=loginUser.getEmail() == null ? "":loginUser.getEmail()%>" <%=(loginUser.getVacemail()== 1 && loginUser.getIsvcation() == 1 ) ? "readonly=\"true\"":"false"%>/>
                      <%
                          if (loginUser.getVacemail()== 1 && loginUser.getIsvcation() == 1 ){
                      %>

                      &nbsp;<strong><font color='red' size='2.5'>������֤��</font></strong>&nbsp;&nbsp;
                      <%
                          }
                      %>
                  </td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#D6E6F3" class="bk04"><strong>΢�ţ�</strong></td>
                    <td bgcolor="#FFFFFF" class="bk04">
                        <input name="wx" type="text" class="input02" id="wx" size="24" maxlength="50" value="<%=loginUser == null ? "":loginUser.getWx()%>" />
                     </td>
                </tr>
              </tbody>
            </table>
            <div class="MyBtn">
               <input name="bsendsms" type="submit" value="�ύ�޸�" class="btn">
            </div>
  </form>
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
<%
if("2".equals(loginUser.getIsdel()+"")){
	out.println("<script language='javascript'>alert('�������ϻ�δͨ��������ߣ����ǽ������绰��ʵ���뱣�ֵ绰��ͨ��');</script>");
}
%>
<script>

function modifysjtel(){
	if(!confirm('�޸����ϻὫ������������Ϊ�����״̬����վ���Ա��������ʵ�󼤻������������ߣ�')) {
		return false;
	}
	window.location.href='grsjyz.jsp';
 }
</script>

</body>
</html>
