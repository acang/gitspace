<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.obj.extend.*"%>
<%@ page import="com.common.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.servlet.*"%>
<%@ page import="java.io.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.lover.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
  String wtid = SysCommonFunc.getStrParameter(request,"wtid");
  String stime = SysCommonFunc.getStrParameter(request,"stime");


  String sql = "update wtjd set stime = to_date('"+stime+"','YYYY-MM-DD') where id = " + wtid;
  HbmOperator.executeSql(sql);

%>
<script language="javascript">
    if("2".equals(wtid)){
        location.href='newslist.jsp';
    }
    if("3".equals(wtid)){
        location.href='newslist3.jsp';
    }
    if("4".equals(wtid)){
        location.href='newslist4.jsp';
    }
</script>
