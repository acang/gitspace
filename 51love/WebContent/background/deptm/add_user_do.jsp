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
  //����ID
  String eaccount = request.getParameter("eaccount") == null ?
                          "" : request.getParameter("eaccount");
  //��¼�ʺ�
  String name = request.getParameter("name") == null ?
                          "" : request.getParameter("name");
  //����
  String aliasname = request.getParameter("aliasname") == null ?
                          "" : request.getParameter("aliasname");
  //����
  String address = request.getParameter("address") == null ?
                          "" : request.getParameter("address");
  //��ͥסַ
  String phone = request.getParameter("phone") == null ?
                          "" : request.getParameter("phone");
  //�绰����
  String position = request.getParameter("position") == null ?
                          "" : request.getParameter("position");
  //ְ��
  String sort = request.getParameter("sort") == null ?
                          "" : request.getParameter("sort");
  //����
  String isadmin = request.getParameter("isadmin") == null ?
                          "" : request.getParameter("isadmin");
  //�Ƿ񳬼�����Ա
  String epassword = request.getParameter("epassword") == null ?
                          "" : request.getParameter("epassword");
  //����
  Employee emp = new Employee();
  int iSuccess = 0;//���ݿ����״̬ 0Ϊ����ʧ�ܣ�1Ϊ�ɹ�
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
   if (confirm('�����ɹ����Ƿ����������Ա��') == true) {
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
   alert('����ʧ�ܣ������ԣ�');
   parent.location.reload();
</script>
<%
  }
%>
