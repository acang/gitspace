<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="java.io.File" %>



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
    <script type="text/javascript">

        function sendSms()
        {
            if (checkspace(document.personal.sjtel.value)){
                alert('����д�����ֻ����롣�ƶ�����ͨ�������ֻ����������֤!');
                 document.personal.sjtel.focus();
                return;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.personal.sjtel.value))
            {
                alert("�ֻ����벻��ȷ!");
                return;
            }else{
                document.getElementById("sjtel2").value =  document.personal.sjtel.value;
                document.getElementById("csendsms").submit();
                   }
        }

        function checkspace(checkstr) {
            var str = '';
            for(i = 0; i < checkstr.length; i++) {
                str = str + ' ';
            }
            return (str == checkstr);
        }

        function test()
        {
            if (checkspace(document.personal.sjtel.value)){
                alert('����д�����ֻ����롣�ƶ�����ͨ�������ֻ����������֤!');
                document.personal.sjtel.focus();
                return false;
            }

            var reg = /^1[3|4|5|7|8]\d{9}$/;
            if(!reg.test(document.personal.sjtel.value))
            {
                alert("�ֻ����벻��ȷ!");
                return false;
            }

            if (checkspace(document.personal.verycode.value)){
                document.personal.verycode.focus();
                return false;
            }
            return true;
        }

    </script>

</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    long uL = 0;
    try
    {
        uL=Long.parseLong(loginUser.getUsername());
    }catch(Exception e)
    {

    }
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼��ע��');showLogin();</script>");
        return;
    }else{
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
    String sp = System.currentTimeMillis()+"";
    session.setAttribute("sp",sp);
%>
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
      <div class="box01"> <span class="tx">
            <%
                if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
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
          <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
          <div class="lm_name">
              <h2>���˲���ר��</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>�ֻ���֤</h2>
      </div>
        <form name="personal" method="post" action="usersjyz.jsp" onSubmit="return test()" >
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td width="100" align="right">�û�����</td>
            <td><%=loginUser.getUsername()%></td>
          </tr>
          <tr>
            <td align="right">�ֻ����룺</td>
            <td><label>
                <input name="sjtel" type="text" class="input02" id="sjtel"  maxlength="40" value="<%=loginUser.getSjtel() == null ? "" : loginUser.getSjtel()%>"/>

                ������д��ʵ���ֻ����룩</label></td>
          </tr>
        </table>
        <div class="MyBtn" style="line-height:40px;">

            <input type="submit" name="Submit3" value="  �� �� �� ֤  "  class="btn"/><br/>
        </div>
      </form>
        <form id="csendsms" name="csendsms" action="sendsmsyj.jsp" method="post" target="cname">
            <input name="sp" value="<%=sp%>" type="hidden"/>
            <input name="sjtel2" id="sjtel2" value="" type="hidden"/>
        </form>
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>

<iframe  name="cname" src="#" width="0" height="0" frameborder="0"></iframe>

</body>
</html>
