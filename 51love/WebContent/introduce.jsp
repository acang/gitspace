<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.obj.Wtjd" %>
<%@ page import="com.web.obj.Bcb" %>
<%@ page import="com.lover.mng.BCBMng" %>
<%
    String id = SysCommonFunc.getStrParameter(request, "id");
    Wtjd wtjd1 = null;
    Bcb bcb1  = null;
    wtjd1 = WTJDMng.getWtjdFromid(id);
    bcb1 = null;
    if(wtjd1 != null && wtjd1.getAnswer() != null)
        bcb1 = BCBMng.getBcbFromid(wtjd1.getAnswer().toString());
    String s = bcb1 == null? "":SysCommonFunc.getStringFromBlob(bcb1.getContent());
%><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <style type="text/css">
        <!--
        .STYLE2 {color: #21648F}
        -->
    </style>
    
</head>
<body class="cm_gsjj">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
    <div class="block01">
        <div class="lm_name"><h2>��������</h2></div>
        <ul>
            <li><a href="introduce.jsp?id=1773446" <% if("1773446".equals(id)){  %> class="current" <%}%>>��վ����</a></li>
            <li><a href="introduce.jsp?id=1773447" <% if("1773447".equals(id)){  %> class="current" <%}%>>��վ֤��</a></li>
            <!-- <li><a href="aboutus.jsp" class="current">��վ��̬</a></li>-->
            <li><a href="kfzx.jsp" target="_self">��ϵ����</a></li>
        </ul>
    </div>
    <div class="block02">
        <div class="lm_name">
        <h2><%=wtjd1 == null?"":wtjd1.getAsk()%></h2>
        </div>
        <div class="content">
            <%=bcb1 == null? "": SysCommonFunc.getStringFromBlob(bcb1.getContent())%>
        </div>
   </div>
     <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
</html>
