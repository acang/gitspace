<%@ page contentType="text/html; charset=GBK" %>
<%@ page import="com.web.common.*" %>
<%@ page import="com.lover.mng.*" %>
<%@ page import="java.net.URL" %>

<%
   String strOne = request.getHeader("referer");
    String pathOne = "";
    if (strOne != null) {
        URL urlOne = new URL(strOne);
        pathOne = urlOne.getHost();
    }
    String strTwo = request.getRequestURL().toString();
    String pathTwo = "";
    if (strTwo != null) {
        URL urlTwo = new URL(strTwo);
        pathTwo = urlTwo.getHost();
    }
%>
<%
    System.out.println(!pathOne.equals(pathTwo));
    if (!pathOne.equals(pathTwo)) {
%>

      ��ֹ��վ�ⲿ�ύ��������

<%}%>
<%
    String username = SysCommonFunc.getStrParameter(request, "username");
    if (username.length() == 0) {
%>

<script language=javascript>
    alert('�û�������Ϊ��');
    window.history.go(-1);

</script>
<%
        return;
    }
    String tel = SysCommonFunc.getStrParameter(request, "tel");
    if (tel.length() == 0) {
%>
<script language=javascript>

    alert('�绰���벻��Ϊ��');
    window.history.go(-1);
</script>

<%
        return;
    }
    String email = SysCommonFunc.getStrParameter(request, "email");
    if (email.length() == 0) {
%>
<script language=javascript>

    alert('�����ʼ�����Ϊ��');
    window.history.go(-1);
</script>

<%
        return;
    }

    String ntitle = SysCommonFunc.getStrParameter(request, "ntitle");
    String ntext = SysCommonFunc.getStrParameter(request, "ntext");
    if (ntext.length() == 0) {
%>
<script language=javascript>
    alert('���ݲ���Ϊ��');
    window.history.go(-1);
</script>

<%
        return;
    }
    if (ntext.length() > 250 || ntext.toLowerCase().indexOf("href") > -1) {
%>


<script language=javascript>
   alert('���ݲ��ܳ���250������,�����в�������볬����');
    window.history.go(-1);
</script>

<%
        return;
    }
    String s = KFZXMng.userAddKfzx(request, email);
    if (s == null) {
%>
<script language=Javascript>
    alert("�ύ�ɹ���лл");
    window.location.href = 'kfzx.htm';
</script>
<%
} else {
%>
<script language=Javascript>
    alert("<%=s%>");
    window.history.go(-1);
</script>
<%
    }
%>
