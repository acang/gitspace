<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.lover.mng.BCBMng" %>
<%@ page import="com.web.obj.Bcb" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.obj.Wtjd" %>

<%

    Wtjd wtjd1 = null;
    Bcb bcb1  = null;
    wtjd1 = WTJDMng.getGgNews();
    bcb1 = null;
    if (wtjd1 != null){
        if (wtjd1.getWttype()==1){
            if (wtjd1.getIslink()!=null && wtjd1.getIslink()==1){
                response.sendRedirect(wtjd1.getLinkurl());
            }
        }
    }
    if(wtjd1 != null && wtjd1.getAnswer() != null)
        bcb1 = BCBMng.getBcbFromid(wtjd1.getAnswer().toString());
%>

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
<body class="cm_syzn">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01" style="margin-top:8px;">
    <div class="block02">
        <div class="lm_name02">
            <h2><div style="text-align:center" > <strong><%=wtjd1 == null?"":wtjd1.getAsk()%></strong></div></h2>
        </div>
        <div style="clear:both"></div>
        <div style="margin:8px 100px; border:#CCC 1px solid; padding:10px; background-color:#F5F5F5; font-size:14px">
            <%=bcb1 == null? "": SysCommonFunc.getStringFromBlob(bcb1.getContent())%>
        </div>


    </div>
    <div class="block02t">
        <div class="lm_name">
            <h2>ɨ���ά��</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
        <div style="clear:both"></div>
    </div>
    <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
