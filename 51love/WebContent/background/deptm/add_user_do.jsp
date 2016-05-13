<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="com.web.obj.extend.*,
                 com.web.map.*"%>

<%

  String deptid = request.getParameter("deptid") == null ?
                          "" : request.getParameter("deptid");
  //部门ID
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
  Employee emp = new Employee();
  int iSuccess = 0;//数据库操作状态 0为操作失败，1为成功
  System.out.println("iSuccess = "+iSuccess);
  try {
     emp.setEid(new Integer(SysCommonFunction.getSequenceId(SysParaDefine.WEB_ALL_SEQU_NAME)));
     System.out.println("emp.getEid() = "+emp.getEid());
     emp.setName(name);
     emp.setAddress(address);
     emp.setEdeptid(Integer.parseInt(deptid));
     emp.setAliasname(aliasname);
     emp.setEaccount(eaccount);
     emp.setEpassword(epassword);
     emp.setPhone(phone);
     emp.setPosition(Integer.parseInt(position));
     if (sort.equals("0")) {
         emp.setSort(0);
         HbmOperator.executeSql("update employee set sort=sort+1 where eid <>'" + SysCommonFunction.getSequenceId(SysParaDefine.WEB_ALL_SEQU_NAME) + "'");
     }
     else {
         emp.setSort(SysCommonFunction.getSequenceId(SysParaDefine.WEB_ALL_SEQU_NAME));
     }
     emp.setIsadmin(Integer.parseInt(isadmin));
     emp.setUseable(Integer.parseInt(SysParaDefine.IS_MAY_USE));

     HbmOperator.insert(emp);
     iSuccess = 1;

   }
  catch (Exception e) {
     System.out.println("Hibernate insert Error:" + e.getMessage());
  }

  if (iSuccess == 1) {
%>
<script language="JavaScript">
   if (confirm('新增成功，是否继续新增人员？') == true) {
       parent.location.reload();
       parent.opener.location.reload();
   }
   else {
       parent.close();
       parent.opener.location.reload();
   }
  // return;

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
