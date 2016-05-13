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
        out.println("<script language='javascript'>alert('登录已超时，请重新登录！');history.go(-1);</script>");
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
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站-中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv=”Cache-Control” content=”no-transform” />
<meta http-equiv=”Cache-Control” content=”no-siteapp” />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
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
                alert("请正确填写转到页数！");
            else if (go2to.page.value=="")
            {
                alert("请输入转到页数！");
            }
            else
                go2to.submit();
        }
        //-->
        function turn(pages)
        {

            if (isNaN(pages))
            {
                alert("请正确填写转到页数！");
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
    if(delid.length() > 0) //删除
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
              <h2>个人操作专区</h2>
          </div>
          <%@ include file="grleft.jsp"%>
      </div>
    <div class="box02">
      <div class="lm_name">
        <h2>收到的留言</h2>
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
          <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;留言人：</strong><strong style="color:#069"><a href="perinfo.jsp?id=<%=hyly.getFromid()%>" target="_blank"><%=hyly.getFromname()%></a></strong></td>
          <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;时间：</strong><%=DateTools.dateToString(hyly.getLytime(), true)%></td>
        </tr>
        <tr>
          <td colspan="2" style="border-bottom:0;">&nbsp;&nbsp;<%=hyly.getContent()%></td>
        </tr>
        <tr>
          <td colspan="2" style="text-align:right;">
              <a href="grly.jsp?delid=<%=hyly.getId()%>&cpages=<%=cpage%>"><img src="images/del.png"></a>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="reperly.jsp?fromid=<%=hyly.getFromid()%>&fromname=<%=hyly.getFromname()%>"
               target="_blank"  rel="gb_page_center[617, 350]" title="回复"><img src="images/reply.png"></a> </td>
        </tr>
          <%
          }
          else
          {
          %>
          <tr>
              <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;留言人：</strong><strong style="color:#069">管理员</strong></td>
              <td style="width:200px;background-color:#f2f4f8"><strong>&nbsp;&nbsp;时间：</strong><%=DateTools.dateToString(hyly.getLytime(),true)%></td>
          </tr>
          <tr>
              <td colspan="2" style="border-bottom:0;">&nbsp;&nbsp;<%=hyly.getContent()%></td>
          </tr>
          <tr>
              <td colspan="2" style="text-align:right;">

                  <a href="grly.jsp?delid=<%=hyly.getId()%>&cpages=<%=cpage%>">删除</a>
                  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <a href="reperly.jsp?fromid=<%=hyly.getFromid()%>&fromname=<%=hyly.getFromname()%>"
                     rel="gb_page_center[617, 350]" title="回复">回复</a>
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
                 out.println("<a href='###'>首    页</a>&nbsp;&nbsp;<a href='###'>上一页</a>");
             else
             {
                 out.println("<a href='javascript:turn(1)'>首    页</a>");
                 out.println("<a href='javascript:turn("+prepage+")'>上一页</a>");
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
                 out.println("<a href='###'>下一页</a>&nbsp;&nbsp;<a href='###'>尾页</a>");
             else
             {
                 out.println("<a href='javascript:turn("+nextpage+")'>下一页</a>");
                 out.println("<a href='javascript:turn("+totalPage+")'>尾页</a>");
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
        <h2>扫描二维码</h2>
      </div>
      <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
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
