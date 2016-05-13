<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="java.util.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%
  Bcb b = null;

    String  hsql = "from Bcb as o where o.id="+SysCommonFunc.getStrParameter(request,"cid");
    List list = HbmOperator.list(hsql);
     b = list == null || list.size()==0 ? null : (Bcb)list.get(0);

  String s = b == null ? "":SysCommonFunc.getStringFromBlob(b.getContent());
%>
<html>
<head>
<title>
searchoplogarticleview
</title>
</head>
<body bgcolor="#ffffff">
<%=s%>
</body>
</html>
