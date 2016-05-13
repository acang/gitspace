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
  //ְԱID
  Employee emp = UserMap.getOneEmployee(eid);

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

  int uSuccess = 0;//���ݿ����״̬ 0Ϊ����ʧ�ܣ�1Ϊ�ɹ�
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
       alert('���³ɹ���');
       parent.close();
       parent.opener.location.reload();
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
