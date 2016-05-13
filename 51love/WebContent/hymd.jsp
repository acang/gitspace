<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.common.SysDefine" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.lover.mng.GRZQMng" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.obj.Hygl" %>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('��¼�ѳ�ʱ�������µ�¼��');history.go(-1);</script>");
        return;
    }

    String cpages = SysCommonFunc.getStrParameter(request, "cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 20;


%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-�D�й�AAA��������ཻ����վ����Ա�鲼�������ѣ��㶫���ѣ��Ϻ����ѣ����ս��ѵ�ȫ������ʡ�С�51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���400������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    
</head>
<body class="cm_grzx" style="height:600px">
<div class="box02">
    <div class="lm_name">

    <table width="100%" border="1" style="border-color:#fffacd" cellspacing="0" cellpadding="0" >
    <tr>
        <td width="100" align="center" style="background-color:#f2f4f8; width:30px; height: 30px"><strong>���</strong></td>
        <td width="250" align="center" style="background-color:#f2f4f8; width:400px;"><strong>�ǳ�</strong></td>
        <td align="center" style="background-color:#f2f4f8; width:130px;"><strong>����</strong></td>
    </tr>
    <%
        //sql="select top 300 * from hygl where sqtype=8 and myid='' order by riqi desc, id desc";

        QueryResult qr = GRZQMng.getHYMD(loginUser, SysDefine.SYSTEM_HYGL_FRIEND, cpage, pagesize);
        int totalPage = qr.pageCount;
        int totalCount = qr.rowCount;
        cpage = qr.pageNum;
        int prepage = cpage-1;
        int nextpage = cpage+1;

        List list = qr.resultList;
        if(list == null || list.size()==0)
        {
    %>
    <tr>
        <td align="center" colspan="3">û�к���</td>

    </tr>
    <%
    }else{
        for(int i =0;i < list.size();i ++)
        {
            Hygl hygl = (Hygl)list.get(i);
    %>
    <tr>
        <td align="center"><%=(cpage-1)*pagesize +(i+1)%></td>
        <td align="center"><a href="perinfo.jsp?id=<%=hygl.getSqid()%>" target="_blank" class="link05"><%=hygl.getSqlc()%></a></td>
        <td align="center">
            <a href="hymd01.jsp?bizaction=02&id=<%=hygl.getId()%>" class="link10"><img src="images/del.png"></a>
            <a href="hymd01.jsp?bizaction=03&id=<%=hygl.getId()%>" class="link10">���������</a>
    </tr>
    <%
            }
        }

    %>

</table>
    </div>
</div> </div>
<div class="Paging">
    <%
        int startpage = 0;
        if((cpage-5) <=0){
            startpage = 1;
        }else{
            startpage = cpage-5;
        }
        if(cpage == 1)
            out.println("<a href='###'>��    ҳ</a>&nbsp;&nbsp;<a href='###'>��һҳ</a>");
        else
        {
            out.println("<a href='javascript:turn(1)'>��    ҳ</a>");
            out.println("<a href='javascript:turn("+prepage+")'>��һҳ</a>");
        }
        for (int j = startpage; j < startpage + 9; j++) {
            if (j <= totalPage) {
                if (j == cpage) {
                    out.println("<a href='javascript:turn(" + j + ")' class='Check'>" + j + "</a>");
                } else {
                    out.println("<a href='javascript:turn(" + j + ")'>" + j + "</a>");
                }
            }
        }

        if(cpage >= totalPage )
            out.println("<a href='###'>��һҳ</a>&nbsp;&nbsp;<a href='###'>βҳ</a>");
        else
        {
            out.println("<a href='javascript:turn("+nextpage+")'>��һҳ</a>");
            out.println("<a href='javascript:turn("+totalPage+")'>βҳ</a>");
        }
    %>
    <div style="clear:both;"></div>
</div>
</body>
<form id="pageform" name="turn" method="Post" action="hymd.jsp" target="_self">
    <input type="hidden" name="cpages" value="<%=cpage%>" />
    <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
</form>

<script>
    function turn(a){
        pageform.cpages.value=a;
        pageform.submit();
    }
</script>

</html>
