<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.map.*"%>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%
String deptid = request.getParameter("deptid");
int result = DeptMap.delDept(deptid);
System.out.println(result);
if(result == 0)
{
     out.println("<script>\n");
     out.println("alert('删除成功！');\n");

     out.println("</script>\n");
}else if(result == 1)
{
       out.println("<script>\n");
     out.println("alert('删除出错,该部门下还有子部门！');\n");
     out.println("</script>\n");
}else if(result == 2)
{
       out.println("<script>\n");
     out.println("alert('删除出错，该部门下还有人员！');\n");
     out.println("</script>\n");
}
    out.println("<script>\n");
     out.println("window.close()");
     out.println("</script>\n");

%>
