<%@ page contentType="text/html; charset=gb2312" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*,
                 com.web.map.*"%>

<%
  String eid = request.getParameter("eid") == null ?
                          "" : request.getParameter("eid");
  //职员ID
  Employee emp = UserMap.getOneEmployee(eid);

  String eaccount = request.getParameter("eaccount") == null ?
                          "" : request.getParameter("eaccount");
  //登录帐号
  String name = request.getParameter("name") == null ?
                          "" : request.getParameter("name");
  //姓名
  String aliasname = request.getParameter("aliasname") == null ?
                          "" : request.getParameter("aliasname");
  //别名
  String address = request.getParameter("address") == null ?
                          "" : request.getParameter("address");
  //家庭住址
  String phone = request.getParameter("phone") == null ?
                          "" : request.getParameter("phone");
  //电话号码
  String position = request.getParameter("position") == null ?
                          "" : request.getParameter("position");
  //职务
  String sort = request.getParameter("sort") == null ?
                          "" : request.getParameter("sort");
  //排序
  String isadmin = request.getParameter("isadmin") == null ?
                          "" : request.getParameter("isadmin");
  //是否超级管理员
  String epassword = request.getParameter("epassword") == null ?
                          "" : request.getParameter("epassword");
  //密码

  int uSuccess = 0;//数据库操作状态 0为操作失败，1为成功
  try {
     emp.setName(name);
     emp.setAddress(address);
     emp.setAliasname(aliasname);
     emp.setEaccount(eaccount);
     emp.setEpassword(epassword);
     emp.setPhone(phone);
     emp.setPosition(Integer.parseInt(position));
     if (sort.equals("0")) {
         emp.setSort(0);
     }
     else {
         emp.setSort(1);
     }
     emp.setIsadmin(Integer.parseInt(isadmin));

     HbmOperator.update(emp);
     uSuccess = 1;
   }
  catch (Exception e) {
     System.out.println("Hibernate insert Error:" + e.getMessage());
  }

  if (uSuccess == 1) {
%>
<script language="JavaScript">
       alert('更新成功！');
       parent.close();
       parent.opener.location.reload();
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
