<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.common.SysDefine" %>

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
</head>
<body class="cm_bbsxq">
<%@ include file="head.jsp"%>
<%
    String title = SysCommonFunc.getStrParameter(request,"title");
    String content = SysCommonFunc.getStrParameter(request,"content");
    String sortid_str= SysCommonFunc.getStrParameter(request,"sortid");

    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }


    String lanmu_name = "";
    Long sortid = Long.parseLong(sortid_str);

        if(13 == sortid){
            lanmu_name = "���Ѷ�̬";
        }
        if(3 == sortid){
            lanmu_name = "���ѹ���";
        }
        if(12 == sortid){
            lanmu_name = "���ѹ���";
        }
        if(9 == sortid){
            lanmu_name = "���ѹ���";
        }


%>

<div class="wrapper1250 cm_block01" style="margin-top:8px;">
    <div class="box01" style="background-color:#f7f7f7; padding-left:15px; width:1085px;font-size:14px; height:40px; line-height:40px; margin-bottom:8px;">
        <span style=" float:left"><a href="bbs/index.htm" style="font-size:14px">
            <strong>��Ա����</strong></a>&nbsp;&gt;&nbsp;
            <a href="bbs/bbsindex.jsp?sortid=<%=sortid%>" style="font-size:14px"><strong><%=lanmu_name%></strong></a>&nbsp;&gt;&nbsp;
            <strong><%=title%></strong></span></div>
    <div class="block01">

        <div class="box01">
            <span class="tx"></span>
            <ul>
                <li><strong>��̳�ȼ���</strong></li>
                <li><strong>�� �� ����</strong>Xƪ</li>
                <li><strong>�� �� ����</strong>Xƪ</li>
                <li><strong>����������</strong>Xƪ </li>
                <li><strong>�𡡡��ң�</strong>X���</li>
                <li><strong>����ʱ�䣺</strong></li>
                <div style="text-align: center"><strong>�� �� �ˣ�<span  style="color: #21648f" >XXX</span></strong></div>
            </ul>
        </div>
        <div class="box02">
            <div class="lm_name">
                <span style=" float:left; font-size:14px;">&nbsp;&nbsp;&nbsp;                </span>
                <span style=" float:right; font-size:14px; padding-right:20px;">������<strong style="color:#F00; font-size:18px">X</strong>ƪ</span>
            </div>
            <div class="content" style="font-size:16px">
                <h1 style="text-align:center; font-size:24px;line-height:30px;margin-bottom:10px;"><%=title%></h1>
                <%=content%></div>
        </div>
        <div style="clear:both"></div>
    </div>



</html>
