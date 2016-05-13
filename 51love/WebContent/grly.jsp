<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.Userinfo" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.obj.Hyly" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.obj.Userother" %>

<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('��¼�ѳ�ʱ�������µ�¼��');history.go(-1);</script>");
        return;
    }else{
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ-�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv=��Cache-Control�� content=��no-transform�� />
<meta http-equiv=��Cache-Control�� content=��no-siteapp�� />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/lcmbase.js"></script>
    <script type="text/JavaScript">
        <!--
        function MM_openBrWindow(theURL,winName,features) { //v2.0
            window.open(theURL,winName,features);
        }
        function check()
        {
            if (isNaN(go2to.page.value))
                alert("����ȷ��дת��ҳ����");
            else if (go2to.page.value=="")
            {
                alert("������ת��ҳ����");
            }
            else
                go2to.submit();
        }
        //-->
        function turn(pages)
        {

            if (isNaN(pages))
            {
                alert("����ȷ��дת��ҳ����");
                return;
            }
            document.go2to.cpages.value=pages+"";

            document.go2to.submit();
            //go2to.page.value
        }
    </script>
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    String delid = SysCommonFunc.getStrParameter(request, "delid");
    if(delid.length() > 0) //ɾ��
    {
        try
        {
            HbmOperator.executeSql("delete from hyly where id = " + delid + " and hyid = " + loginUser.getHyid());
        }catch(Exception e){}
    }

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 8;
    if(delid.length() > 0)
        tcount = 0;

    QueryResult qr = null;
    String sql = "from Hyly as o where o.hyid = "+ loginUser.getHyid() + " order by o.id desc";
    if(tcount > 0)
        qr = QueryRecord.queryByHbm(sql, pagesize, cpage, false, tcount);
    else
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;
    List list = qr.resultList;
%>
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
<div class="wrapper1250 cm_block01">
  <div class="block01">
      <div class="box01"> <span class="tx">
            <%
                if(uother!=null && uother.getUserphoto1()!=null && !"".equals(uother.getUserphoto1())){
                    String left_small_pic ="../"+afilepathsmall+File.separator+uother.getUserphoto1();
            %>
      <img src="<%=left_small_pic%>" alt=""/>
       <%
       }else{
       %>
          <img src="images/nopic2.gif" alt=""/>
       <%
           }
       %>
      </span>
          <p class="zl"><strong><%=grwhqUser.getLcname()%></strong></p>
          <div class="lm_name">
              <h2>���˲���ר��</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>�յ�������</h2>
      </div>
      <div style="clear:both"></div>
        <%
            for(int i =0;i < list.size();i ++)
            {
                Hyly hyly = (Hyly)list.get(i);
        %>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <%
              if(!hyly.getFromid().toString().equals("0") && !hyly.getFromid().toString().equals("-1"))
              {
          %>
        <tr>
          <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;�����ˣ�</strong><strong style="color:#069"><a href="perinfo.jsp?id=<%=hyly.getFromid()%>" target="_blank"><%=hyly.getFromname()%></a></strong></td>
          <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;ʱ�䣺</strong><%=DateTools.dateToString(hyly.getLytime(), true)%></td>
        </tr>
        <tr>
          <td colspan="2" style="border-bottom:0;">&nbsp;&nbsp;<%=hyly.getContent()%></td>
        </tr>
        <tr>
          <td colspan="2" style="text-align:right;">
              <a href="grly.jsp?delid=<%=hyly.getId()%>&cpages=<%=cpage%>"><img src="images/del.png"></a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="reperly.jsp?fromid=<%=hyly.getFromid()%>&fromname=<%=hyly.getFromname()%>"
               target="_blank"  rel="gb_page_center[617, 350]" title="�ظ�"><img src="images/reply.png"></a> </td>
        </tr>
          <%
          }
          else
          {
          %>
          <tr>
              <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;�����ˣ�</strong><strong style="color:#069">����Ա</strong></td>
              <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;ʱ�䣺</strong><%=DateTools.dateToString(hyly.getLytime(),true)%></td>
          </tr>
          <tr>
              <td colspan="2" style="border-bottom:0;">&nbsp;&nbsp;<%=hyly.getContent()%></td>
          </tr>
          <tr>
              <td colspan="2" style="text-align:right;">

                  <a href="grly.jsp?delid=<%=hyly.getId()%>&cpages=<%=cpage%>">ɾ��</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="reperly.jsp?fromid=<%=hyly.getFromid()%>&fromname=<%=hyly.getFromname()%>"
                     rel="gb_page_center[617, 350]" title="�ظ�">�ظ�</a>
              </td>
          </tr>
          <%
              }
          %>
      </table>
        <%
            }
        %>

      <div style="clear:both"></div>
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
    </div>
    <div style="clear:both"></div>
  </div>
  <div class="block02">
    <div class="box02">
      <div class="lm_name">
        <h2>ɨ���ά��</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>
<form id="pageform" name="turn" method="Post" action="grly.jsp" target="_self">
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
