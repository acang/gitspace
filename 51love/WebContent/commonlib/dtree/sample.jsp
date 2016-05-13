<%@ page contentType="text/html; charset=GBK" %>
<html>
<head>
<title>
dtree样例
</title>
<link rel="StyleSheet" href="css/dtree.css"type="text/css" />
<script language="JavaScript" src="dtree.js"></script>
</head>
<body bgcolor="#ffffff">
<div class="dtree">
<script type="text/javascript">
    d = new dTree('d','<%=request.getContextPath()%>');
    d.config.target = "dframe";
    d.add('function_0',-1,'目录树');
    d.add('function_1','function_0','第一级别目录','role/list.jsp','');
    d.add('function_2','function_0','第一级别目录无连接');
    d.add('function_3','function_2','第二级别目录无连接');
    d.add('function_4','function_2','第一级别目录无连接');



    document.write(d);
</script>
</div>
</body>
</html>
