<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.obj.Wtjd" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<%

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts, 0);

    String type = SysCommonFunc.getStrParameter(request,"type");
    if(type.length() ==0)
    {
        type = "0";
    }
    int pagesize = 10;

    ///�õ��û��б�
    String sql = "from Wtjd as o where o.wttype ="+type+" and o.stime is not null order by o.bianhao desc";

    QueryResult qr = null;
    if(tcount > 0)
        qr = QueryRecord.queryByHbm(sql, pagesize, cpage);
    else
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
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
</head>
<body class="cm_gsjj">
<div class="wrapper1250 cm_block01">
<div class="block02">

</div>
</div>
</body>
</html>

