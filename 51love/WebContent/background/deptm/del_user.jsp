<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*,
                 com.web.map.*"%>

<%
  String empId = request.getParameter("empId") == null ?
                          "" : request.getParameter("empId");
  //职员ID
  Employee emp = UserMap.getOneEmployee(empId);

  int dSuccess = 0; //数据库操作状态 0为失败，1为成功
  try {
    emp.setUseable(Integer.parseInt(SysParaDefine.IS_NOT_MAY_USE));
    HbmOperator.update(emp);
    dSuccess = 1;
  }
  catch (Exception e) {
    System.out.println("Hibernate Update Error:" + e.getMessage());
  }

  if (dSuccess == 1) {
%>
<script language="JavaScript">
   alert('删除成功！');
   parent.location.reload();
</script>
<%
  }
  else {
%>
<script language="JavaScript">
   alert('操作失败，请重试！');
   parent.location.reload();
</script>
<%
  }
%>
