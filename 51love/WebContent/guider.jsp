<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.lover.mng.*"%>
<%@ page import="com.web.bean.*"%>
<%@ page import="org.apache.commons.beanutils.DynaBean" %>
<%
   String cpages = SysCommonFunc.getStrParameter(request,"cpages");
   int cpage = SysCommonFunc.getNumberFromString(cpages,1);
   String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
   int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);

   String type = SysCommonFunc.getStrParameter(request,"type");
   if(type.length() ==0)
   {
     type = "0";
   }
   int pagesize = 100;

   ///得到用户列表
   String sql = "select * from wtjd  where wttype =0 order by  to_number(bianhao) asc";
   QueryResult qr = null;
   if(tcount > 0){
       qr = QueryRecord.queryByDynaResultSet(sql, pagesize, cpage);
   }else{
       qr = QueryRecord.queryByDynaResultSet(sql, pagesize, cpage);
   }

//   int totalPage = qr.pageCount;
//   int totalCount = qr.rowCount;
//   cpage = qr.pageNum;
//   int prepage = cpage-1;
//   int nextpage = cpage+1;
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
</head>
<body class="cm_syzn">
<%@ include file="head.jsp"%>
<div class="wrapper1250 cm_block01" style="margin-top:8px;">
  <div class="block02">
    <div class="lm_name02">
      <h2>使用指南</h2>
    </div>
    <div style="clear:both"></div>
      	
    <ul class="list">
        <%
            for(int i=0;i < qr.resultList.size();i ++)
            {
                DynaBean db = (DynaBean)qr.resultList.get(i);
        %>
    	<li><a href="javascript:gotoAsk(<%=db.get("id").toString()%>)">●&nbsp;<span style="color: #185983"><%=db.get("ask").toString()%></span></a></li>
        <%
            }
        %>

    </ul>
    <div style="clear:both"></div>
    <dl>
    <%
		for(int i=0;i < qr.resultList.size();i ++)
		{
            DynaBean db = (DynaBean)qr.resultList.get(i);
	%>
        <%
        Bcb  bcb1  = null;
        bcb1 = null;
        if(db.get("answer") != null)
            bcb1 = BCBMng.getBcbFromid(db.get("answer").toString());
        String s = bcb1 == null? "":SysCommonFunc.getStringFromBlob(bcb1.getContent());

    %>
        <table  id="question<%=db.get("id")%>">
            <tr>
                <td><span style="color: #185983;font-size:14px"><strong>问：</strong></span></td>
                <td><span style="color: #185983"><%=db.get("ask").toString()%></span></td>
            </tr>
            <tr>
                <td valign="top"><span style="color: #185983;font-size:14px"><strong>答：</strong></span></td>
                <td><%=s%></td>
            </tr>
        </table>

  	<%
		}
	%>
    </dl>


  </div>
  
      <div class="block02t">
        <div class="lm_name">
          <h2>扫描二维码</h2>
        </div>
        <div class="erweima"><img src="images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>微信公众号（移动站）</div>
        <div class="erweima"><img src="images/kf_img.jpg" alt="" width="120"  /><br/>客服电话</div>
      <div style="clear:both"></div>
    </div>
  <div style="clear:both"></div>
</div>
<script>
    function gotoAsk(a){
       var ques = document.getElementById("question"+a);
        var posY = ques.offsetTop;
         window.scrollTo(0,posY+50);
    }

</script>
<%@ include file="bottom.jsp"%></body>
</html>
