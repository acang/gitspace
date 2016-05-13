<%@ page contentType="text/html; charset=GBK" language="java"  errorPage="" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.lover.mng.GRZQMng" %>
<%@ page import="com.lover.mng.OpLogMng" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="java.io.File" %>
<%@ page import="com.web.obj.Userarticle" %>
<%@ page import="java.util.List" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="java.util.Calendar" %>
<%@ page import="com.web.common.DateTools" %>
<%@ page import="java.util.*"%>
<%@ page import="java.util.Date" %>
<%
    String subColumn = SysCommonFunc.getStrParameter(request, "subColumn");
    if(subColumn==null || "".equals(subColumn)){
        subColumn = "1";
    }
    int photoNum = 0;
    if(uother!=null && uother.getUserphoto1() != null && uother.getUserphoto1().length() > 0)
    {
        photoNum += 1;
    }
    if(uother!=null && uother.getUserphoto2() != null && uother.getUserphoto2().length() > 0)
    {
        photoNum += 1;
    }
    if(uother!=null && uother.getUserphoto3() != null && uother.getUserphoto3().length() > 0)
    {
        photoNum += 1;
    }
    if(uother!=null && uother.getUserphoto4() != null && uother.getUserphoto4().length() > 0)
    {
        photoNum += 1;
    }
    if(uother!=null && uother.getUserphoto5() != null && uother.getUserphoto5().length() > 0)
    {
        photoNum += 1;
    }
    Calendar cal2 = Calendar.getInstance();
    Date csdate = new Date();
    if(loginUser.getCsdate()!=null){
        csdate = loginUser.getCsdate();
    }
    cal2.setTime(csdate);
    int start2 = cal2.get(Calendar.YEAR)-5;
    int end2 = cal2.get(Calendar.YEAR)+20;
    String sDate2=start2+"-01-01";
    String eDate2=end2+"-12-31";
    Date regtime2 = loginUser.getRegtime();
    String regdate2 = DateTools.DateToString(regtime2, "yyyy-MM-dd");
   // 给秋波的数量在左侧显示用的
    QueryResult qbqr = null;
    String qbsql = "";
    if("11".equals(loginUser.getSex())){
        qbsql = "select q.id,q.SENDUSERID,q.SENDUSERNAME,q.SENDTIME,u.LCNAME,q.zt from Db_Qiubo q join USERINFO u on q.SENDUSERID=u.HYID where q.postuserid = "+loginUser.getHyid() +" order by sendtime desc";

    }else{
        qbsql = "select q.id,q.SENDUSERID,q.SENDUSERNAME,q.SENDTIME,u.LCNAME,q.zt from Db_Qiubo q join USERINFO u on q.SENDUSERID=u.HYID where q.postuserid = "+loginUser.getHyid() +" union all select f.id,f.SENDUSERID,f.SENDUSERNAME ,f.SENDTIME,u.LCNAME , f.id from Db_QiuboFs f join USERINFO u on f.SENDUSERID=u.HYID where u.CSDATE>=to_date('"+sDate2+"','YYYY-MM-DD') and u.CSDATE<=to_date('"+eDate2+"','YYYY-MM-DD') and u.s1='"+loginUser.getS1()+"' and u.sex='11' and sendtime >=to_date('"+regdate2+"','YYYY-MM-DD')";

    }
    try {
        qbqr = QueryRecord.queryByDynaResultSet(qbsql, 20, 1);
    } catch (Exception e) {
        System.out.println(e.getMessage());
        e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
    }
    int qbtotalCount = qbqr.rowCount;
//    //给留言数量在左侧展示用的
    QueryResult lyqr = null;
    String lysql = "from Hyly as o where o.hyid = "+ loginUser.getHyid();
    int lytcount  = 0;
    if(lytcount > 0){
        lyqr = QueryRecord.queryByHbm(lysql, 20, 1, false, lytcount);
    }else{
        lyqr = QueryRecord.queryByHbm(lysql,20,1);
    }
    int lytotalCount = lyqr.rowCount;
%>
<script>
function hrefclicektest(){
	if(2==<%=loginUser.getIsdel() %>){
		alert('您还未通过审核，请保持电话畅通!');
		return false;
	}else{
		return true;
	}
}

</script>

    <ul>
        <li><a href="grzq.jsp?subColumn=1" <%if("1".equals(subColumn)){%>class="current"<%}%>>资料修订</a></li>
        <li><a onclick="return hrefclicektest();" href="gryj.jsp?subColumn=2" <%if("2".equals(subColumn)){%>class="current"<%}%>>影集/文集修订<span style="color:#FF0">(<%=photoNum%>)</span></a></li>
        <li><a onclick="return hrefclicektest();" href="grkf.jsp?subColumn=4" <%if("4".equals(subColumn)){%>class="current"<%}%>>设置</a></li>
        <li><a href="grzqwkgs.jsp?subColumn=5" <%if("5".equals(subColumn)){%>class="current"<%}%>>我看过谁</a></li>
        <li><a href="grhy.jsp?subColumn=6" <%if("6".equals(subColumn)){%>class="current"<%}%>>好友名单/黑名单</a></li>
        <li><a href="grqb.jsp?subColumn=7" <%if("7".equals(subColumn)){%>class="current"<%}%>>收到的秋波<span style="color:#FF0">(<%=qbtotalCount%>)</span></a></li>
        <li><a href="grly.jsp?subColumn=8" <%if("8".equals(subColumn)){%>class="current"<%}%>>收到的留言<span style="color:#FF0">(<%=lytotalCount%>)</span></a></li>
		<!-- li><a href="grjl.jsp?subColumn=9" <%if("9".equals(subColumn)){%>class="current"<%}%>> <span id="grjllink" >分享奖励</span></a></li> -->
		<li><a href="grjl_bjd.jsp?subColumn=10" <%if("10".equals(subColumn)){%>class="current"<%}%> > <span id="grjllink3" >白金豆使用情况</span></a></li>
		<%--<li><a href="grly.jsp?subColumn=10" <%if("10".equals(subColumn)){%>class="current"<%}%>>收到的留言</a></li>--%>
        <%--<li><a href="fxjljy.jsp?subColumn=9" <%if("9".equals(subColumn)){%>class="current"<%}%>>分享交流奖励</a></li>--%>
    </ul>
