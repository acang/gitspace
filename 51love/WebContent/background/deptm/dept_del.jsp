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
     out.println("alert('ɾ���ɹ���');\n");

     out.println("</script>\n");
}else if(result == 1)
{
       out.println("<script>\n");
     out.println("alert('ɾ������,�ò����»����Ӳ��ţ�');\n");
     out.println("</script>\n");
}else if(result == 2)
{
       out.println("<script>\n");
     out.println("alert('ɾ�������ò����»�����Ա��');\n");
     out.println("</script>\n");
}
    out.println("<script>\n");
     out.println("window.close()");
     out.println("</script>\n");

%>
