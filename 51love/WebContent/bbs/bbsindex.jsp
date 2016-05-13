<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="com.lover.mng.BBSMng" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.obj.*" %>
<%
    String sortid = SysCommonFunc.getStrParameter(request,"sortid");
    String lanmu_name = "";
    if("13".equals(sortid)){
        lanmu_name = "交友动态";
    }
    if("3".equals(sortid)){
        lanmu_name = "交友观念";
    }
    if("12".equals(sortid)){
        lanmu_name = "交友攻略";
    }
    if("9".equals(sortid)){
        lanmu_name = "交友故事";
    }
    if(sortid.length() ==0)
    {
        out.println("请选择主题!");
        return;
    }


    if(SysCommonFunc.getNumberFromString(sortid,0)==0)
    {
        out.println("请选择主题!");

        System.out.println("sql注入"+sortid);
        return;
    }
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if (loginUser!=null){
        String vurl="";
        vurl=request.getRequestURL().toString();
        if (request.getQueryString()!=null){
            vurl+="?"+request.getQueryString();
        }
        UserVisitMng.insertUserVisit(loginUser.getHyid(), vurl);
    }
    Bbssort bsort = BBSMng.getBbssort(sortid);
    if(bsort == null)
    {
        out.println("您查看的主题不存在!");
        return;
    }

    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request, "tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
      int pagesize = 15;
    String sql = "from Bb as o where o.reId =0 and o.sortid="+sortid + " and o.ischeck=1 order by o.ontop desc,o.commend desc, o.reTime desc,o.stime desc";

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
<title>51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练</title>
<meta name="description" content="51交友中心网站?中国交友行业领军品牌。亲密关系、终生伴侣、情商训练，全方位支持您的情感生活。十年运营，千万会员，美满感情，从51交友开始！" />
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="51交友中心-亲密交友 浪漫交友 同城交友 终生伴侣 情商训练 婚恋训练" />
<link href="../css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript" src="../js/lcmbase.js"></script>
</head>

<body class="cm_bbs">
<%@ include file="head.jsp"%>

<div class="wrapper1250 cm_block01">
  <div class="block01">
    <div class="box01" style="background-color:#f7f7f7; padding-left:15px; width:871px; height:40px; line-height:40px;">
        <div onclick="fabuaa();"><a href="###" style="float:right; background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px;">
            发布主题帖</a></div><span style=" float:left"><a href="index.jsp"><strong>会员交流</strong></a>&nbsp;&gt;&nbsp;<strong><%=lanmu_name%></strong></span></div>
    <div class="box02">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">

          <tr>
            <th width="50"><strong>状态</strong></th>
            <th><strong>主题</strong></th>
            <th width="130"><strong>作者</strong></th>
            <%--<th width="50"><strong>回复</strong></th>--%>
            <%--<th width="50"><strong>人气</strong></th>--%>
            <%--<th width="150"><strong>最后发表时间</strong></th>--%>
          </tr>
        </thead>
        <tbody>
        <%

            for(int i=0;i < qr.resultList.size();i ++)
            {
                Bb bb = (Bb)qr.resultList.get(i);
                String title = bb.getTitle();
                String zt    = "";

                if(bb.getCommend() != null && bb.getCommend().intValue() ==1)
                {
                    zt ="<span class='tj'><strong>[新帖]</strong></span>";
                    title="<span class='tj'><strong>"+bb.getTitle()+"</strong></span>";
                }
                if(bb.getOntop() != null && bb.getOntop().intValue() ==1)
                {
                    zt="<span class='zd'><strong>[置顶]</strong></span>";
                    title="<span class='zd'><strong>"+bb.getTitle()+"</strong></span>";
                }
        %>
          <tr <%=i%2==0?"class='tr_even'":""%>>
            <td><%=zt%></td>
            <td><a target="_blank" href="../disp_bbs-bbsid-<%=bb.getId()%>.htm"><%=title%></a>
            </td>
              <%
                  if(bb.getUserId()!=749693){
              %>
            <td><a href="../perinfo-id-<%=bb.getUserId()%>.htm" target="_blank"><%=bb.getAuthor()%></a></td>
              <%
                  }else{
                      %>
              <td><%=bb.getAuthor()%></td>
              <%
                  }
              %>
            <%--<td><%=bb.getReCount()%></td>--%>
            <%--<td><%=bb.getHits()%></td>--%>
            <%--<td><%if(bb.getOntop() == null || (bb.getOntop() != null && bb.getOntop().intValue() !=1)) {%>--%>
                <%--<%=DateTools.dateToString(bb.getReTime(), true)%>--%>
                <%--<%} %></td>--%>
          </tr>
        <%
            }
        %>
        </tbody>
      </table>
      </br>
      
      <script>
function hrefclicektest(){
	if(2==<%=loginUser.getIsdel() %>){
		alert('您还未通过审核，请保持电话申通');
		return false;
	}else{
		return true;
	}
}

</script>
      <div align="center"><div onclick="fabuaa();" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px;"> 
           <a href="javascript:void(0);" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px;"> 发布主题帖</a> </div></div>
      <div class="Paging" style="height:40px;padding-top:15px;">


                  <form name="go2to" id="go2to" method="post" action="bbsindex.jsp">
                  <input type="hidden" name="cpages" value="<%=cpage%>" />
                  <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                  <input type="hidden" name="sortid" value="<%=sortid%>"/>
                      <%
                if(cpage == 1)
                    out.println("<a href='###'>首    页</a><a href='###'>上一页</a>");
                else
                {
                    out.println("<a href='javascript:turn(1)'>首    页</a>");
                    out.println("<a href='javascript:turn("+prepage+")'>上一页</a>");
                }
                int startpage = 0;
                int endpage = 12;
                if(cpage>=12){
                    startpage = cpage-5;
                    endpage =(cpage+7)>totalPage?totalPage:(cpage+7);
                }
                 if(totalPage<12){
                     endpage =totalPage;
                 }
                for(int i=startpage;i<endpage;i++){
                    if((i+1)==cpage){
                        out.println("<a href='javascript:turn("+(i+1)+")' class='Check'>"+(i+1)+"</a>");
                    }else{
                        out.println("<a href='javascript:turn("+(i+1)+")'>"+(i+1)+"</a>");
                    }

                }

                if(cpage >= totalPage ){
//                    out.println("<a href='###'>下一页</a><a href='###'>尾页</a>");
                }

                else
                {
                    out.println("<a href='javascript:turn("+nextpage+")'>下一页</a>");
//                    out.println("<a href='javascript:turn("+totalPage+")'>尾页</a>");
                }
            %>
              <%--&nbsp; <a>共<%=totalCount%>条主题帖</a> &nbsp;--%>

          </form>
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
      <div class="erweima"><img src="../images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
      <div class="erweima"><img src="../images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
    </div>
  </div>
  <div style="clear:both"></div>
</div>
<%@ include file="bottom.jsp"%>
</body>

<script>
    function turn(a){
        document.go2to.cpages.value=a;
        document.go2to.submit();
    }

    function fabuaa(){
      <%
        if (loginUser == null) {
        %>
        	alert("您是游客，请先登陆或注册！");
           showLogin("bbsindex.jsp?sortid=<%=sortid%>","addtopic.jsp?sortid=<%=sortid%>");
     <%

} else{
	if(loginUser.getIsdel()!=null && loginUser.getIsdel()==2){
		%>
		alert('您还未通过审核，请保持电话申通');
		<%
	}else{
   		%>
        window.open("../addtopic.jsp?sortid=<%=sortid%>");
		<%
	}
   }%>
    }
</script>
</html>
