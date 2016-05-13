<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.web.obj.Wtjd" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.lover.mng.BCBMng" %>
<%@ page import="com.web.obj.Bcb" %>
<%

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts, 0);

    String type = SysCommonFunc.getStrParameter(request,"type");
    if(type.length() ==0)
    {
        type = "0";
    }
    int pagesize = 6;

    ///�õ��û��б�
    String sql = "from Wtjd as o where o.wttype =2 and o.stime is not null order by o.stime desc";

    QueryResult qr = null;
    if(tcount > 0)
        qr = QueryRecord.queryByHbm(sql, pagesize, cpage);
    else
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
    <title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
    <meta name="description" content="51��������-�й���������ཻ����վ����Ա�鲼��������,�㶫����,�Ϻ�����,���ս��ѵ�ȫ������ʡ�С�
    51���������Ƚ�רҵ����ݳ�ֵ,�ѻ���1000������н��ѻ�Ա��" />
    <meta http-equiv=��Cache-Control�� content=��no-transform�� />
    <meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
    <meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
    <link href="css/css.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery.js"></script>
    <script type="text/javascript" src="js/lcmbase.js"></script>
    <style type="text/css">
        <!--
        .STYLE2 {color: #21648F}
        -->
    </style>
    
</head>
<body class="cm_gsjj">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01">
    <div class="block01">
        <div class="lm_name"><h2>��������</h2></div>
        <ul>
            <li><a href="introduce.jsp?id=1773446">��վ����</a></li>
            <li><a href="introduce.jsp?id=1773447">��վ֤��</a></li>
            <!-- <li><a href="aboutus.jsp" class="current">��վ��̬</a></li>-->
            <li><a href="kfzx.jsp" target="_self">��ϵ����</a></li>
        </ul>
    </div>
    <div class="block02">
        <div class="lm_name">
            <h2>��վ��̬</h2>
        </div>
        <ul class="news">
            <%
                for(int i=0;i < qr.resultList.size();i ++)
                {
                    Wtjd wtjd1 = (Wtjd)qr.resultList.get(i);
                    String cdate = "";
                 //   if(type.equals("2"))
                 //   {
                        Date cdatee=wtjd1.getStime();
                        SimpleDateFormat sdf=new SimpleDateFormat("yyyy��MM��dd��");
                        cdate=sdf.format(cdatee)+"&nbsp;&nbsp";
                  //  }
                    wtjd1 = WTJDMng.getWtjdFromid(wtjd1.getId()+"");
                    Bcb bcb1 = null;
                    if(wtjd1 != null && wtjd1.getAnswer() != null)
                        bcb1 = BCBMng.getBcbFromid(wtjd1.getAnswer().toString());
                    String s = bcb1 == null? "":SysCommonFunc.getStringFromBlob(bcb1.getContent());
            %>
            <table width="100%">
                <tr>
                    <td width="5%"></td>
                    <td width="95%" style="color:#999;"><%=cdate%></td>
                </tr>
                <tr>
                    <td valign="top" align="right" style= "border-bottom:1px solid #ddd;"><span class="STYLE2">��</span> </td>
                    <td style= "border-bottom:1px solid #ddd;"><%=s%></td>
                </tr>
            </table>


            <%
                }
            %>
        </ul>


        <div style="height:30px"></div>

        <div class="Paging" style="height:40px;">
            <form name="go2to" id="go2to" method="post" action="bbsindex.jsp">
                <input type="hidden" name="cpages" value="<%=cpage%>" />
                <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">

                <%
                    int startpage = 0;
                    if((cpage-5) <=0)
                        startpage = 1;
                    else
                        startpage = cpage-5;

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



            </form>
            <div style="clear:both;"></div>
        </div>
    </div>
    <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
<form id="pageform" name="turn" method="Post" action="aboutus.jsp" target="_self">
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
