<%@ page contentType="text/html; charset=gbk" %>
<%@ page import="com.web.obj.*"%>
<%@ page import="com.web.common.*"%>
<%@ page import="java.util.*"%>
<%@ page import="hibernate.db.*"%>
<%@ page import="com.web.bean.*"%>
<%
    String cpages = SysCommonFunc.getStrParameter(request,"cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    int pagesize = 20;
    String state = SysCommonFunc.getStrParameter(request,"state");
    String lanmuName = "申请链接";
    String sql ="from Friend as o where o.state="+state+" order by  o.applydate desc";
    if("0".equals(state)){
        lanmuName = "申请链接";
        sql ="from Friend as o where o.state="+state+" order by  o.applydate desc";
    }
    if("1".equals(state)){
        lanmuName = "在用链接";
        sql ="from Friend as o where o.state="+state+" order by  o.type asc , o.bianhao asc";
    }
    if("2".equals(state)){
        lanmuName = "暂停链接";
    }


    QueryResult qr = null;
    if(tcount > 0){
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage,false,tcount);
    }else{
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
    }
    List list = qr.resultList;
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;

   String[] delid = request.getParameterValues("delid");
   if(delid != null && delid.length >0)
   {
       String sqlarray[] = new String[delid.length];
       for(int i =0;i < delid.length;i ++)
         sqlarray[i] = "delete from friend where id="+delid[i];
       HbmOperator.executeSql(sqlarray);
   }



%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=lanmuName%></title>
<link href="style/css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
body {
	margin-left: 0px;
	margin-top: 0px;
	margin-right: 0px;
	margin-bottom: 0px;
	scrollbar-3dlight-color:#8CABDE;
	scrollbar-highlight-color:#eeeeee;
	scrollbar-face-color:#E8F1FF;
	scrollbar-arrow-color:#8CABDE;
	scrollbar-shadow-color:#8CABDE;
	scrollbar-darkshadow-color:#eeeeee;
	scrollbar-base-color:#F0F0F0;
	scrollbar-track-color:#F2F7FF;
}
-->
</style>
</head>
<body>
<table width="100%" height="63"  border="0" cellpadding="0" cellspacing="0">
  <tr>
    <td width="56"><img src="images/popwin1_01.gif" width="56" height="63"></td>
    <td width="219" align="center" background="./images/popwin1_02.gif"><table width="100%" height="31"  border="0" cellpadding="0" cellspacing="0" class="poptitle">
      <tr>
        <td align="center"><%=lanmuName%></td>
      </tr>
    </table></td>
    <td width="61"><img src="./images/popwin1_03.gif" width="61" height="63"></td>
    <td background="./images/popwin1_04.gif">&nbsp;</td>
    <td width="40"><img src="./images/popwin1_06.gif" width="40" height="63"></td>
  </tr>
</table>
 <form name="go2to" method="Post" action="friend.jsp" onSubmit="return test();">
         <input type="hidden" name="cpages" value="<%=cpage%>" />
         <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
  <table width="98%" border="1" align="center" cellpadding="0" cellspacing="0"    bordercolor="D8D8D8" class="txt" style="border-collapse:collapse">
   <tr>
        <td width="5%" height="40" align="center" class="tdc" ><strong>选定</strong></td>
        <td width="5%" height="40" align="center" class="tdc" ><strong>序号</strong></td>
       <td width="10%" height="40" align="center" class="tdc" ><strong>提交时间</strong></td>
        <td width="12%" height="40" align="center" class="tdc" ><strong>网站名称</strong></td>
        <td width="12%" height="40" align="center" class="tdc" > <strong>网站logo</strong></td>
        <td width="20%" height="40" align="center" class="tdc" ><strong>网　　址</strong></td>
        <td width="10%" height="40" align="center" class="tdc" ><strong>联系人</strong></td>
        <td width="10%" height="40" align="center" class="tdc" ><strong>联系电话</strong></td>
       <%
         if("1".equals(state) || "2".equals(state) ){
       %>
       <td width="5%" height="40" align="center" class="tdc" ><strong>排序</strong></td>
        <%}%>
       <%
           if( "1".equals(state) ){
       %>
       <td width="7%" height="40" align="center" class="tdc" ><strong>链接方式</strong></td>
       <%}%>

    </tr>
<%
for(int i=0;i < list.size();i ++)
{
   Friend fr = (Friend)list.get(i);
%>
    <tr>
        <td height="40" align="center"><input name="delid" type="checkbox" id="id" value=<%=fr.getId()%>></td>
        <td height="40"  align="center"><%=(cpage-1)*pagesize+i+1%></td>
        <td height="40" align="center"><%=fr.getApplydate()!=null?fr.getApplydate().toString().substring(0,19):""%></td>
        <td height="40" align="center"><a href="friendEdit.jsp?mid=<%=fr.getId()%>"><%=fr.getNetname()%></a></td>
        <td height="40" align="center">
            <%
               if(fr.getNetlogo()!=null){
                   String imageurl = "";
                  if(fr.getNetlogo().indexOf("http")>=0){
                      imageurl = fr.getNetlogo();
                  }else{
                      imageurl = "../linkpic/"+fr.getNetlogo();
                  }
            %>
            <img src="<%=imageurl%>" width="125" height="45" border="0">
             <%}else{%>
       无
            <%}%>
        </td>
        <td height="40" align="center"><a href="<%=fr.getNethttp()==null?"###":fr.getNethttp()%>" target="_blank">
            <%=fr.getNethttp()==null?"":fr.getNethttp()%></a></td>
        <td height="40" align="center"><%=fr.getMan()==null?"":fr.getMan()%></td>
        <td height="40" align="center"><%=fr.getTel()==null?"":fr.getTel()%></td>
        <%
            if("1".equals(state) || "2".equals(state) ){
        %>
        <td width="50" height="40" align="center" class="tdc" ><strong><%=fr.getBianhao()==null?"":fr.getBianhao()%></strong></td>
        <%}%>
        <%
            if( "1".equals(state) ){
        %>
        <td width="50" height="40" align="center" class="tdc" ><strong><%="0".equals(fr.getType())?"文字":"图片"%></strong></td>
        <%}%>

     </tr>
<%
}

%>
    <tr>
      <td height="40" colspan="11" align="center" >
         <% if("0".equals(state)){

         %>
          <input name="del" type="submit" class="button1" value="删除">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <input name="add" type="button" class="button1" onclick="javascript:window.location.href='friendEdit.jsp'" value="添加">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
          <%
              }
              if ("1".equals(state)) {
          %>
          <input name="del" type="submit" class="button1" value="删除">
          <%
              }
              if ("2".equals(state)) {
          %>
          <input name="del" type="submit" class="button1" value="删除">
          <%
              }
          %>



      </td>
      </tr>
    <tr>
      <td height="40" colspan="12" align="center" >
          <%
              if(cpage == 1)
                  out.println("<font class='info_link'>首    页&nbsp;&nbsp;上一页&nbsp;&nbsp; </font> ");
              else
              {
                  out.println("<a href='javascript:turn(1)' class='info_link'>首    页</a>&nbsp;&nbsp;");
                  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>上一页</a>&nbsp;&nbsp;");
              }
              if(cpage >= totalPage )
                  out.println("<font class='info_link'>下一页&nbsp;&nbsp;尾页&nbsp;&nbsp;  </font> ");
              else
              {
                  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>下一页</a>&nbsp;&nbsp;");
                  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>尾页</a>&nbsp;&nbsp;");
              }
          %>
          页次：<%=cpage%>/<%=totalPage%>页 &nbsp;&nbsp; 共<%=totalCount%>条 &nbsp;&nbsp;
          <font color='000064'> 转到第
            <input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18'
                                          value="">页</font>&nbsp;&nbsp;
          <input class=button type='button' value='确 定' onclick='turn(document.go2to.turnpage.value)'
                 style='font-size: 9pt; color: #000073; position: relative; height: 19'>
       </td>
    </tr>
   </table>
</form>


</body>
</html>

<script language="JavaScript">
    function test()
    {
        if(!confirm('确认删除此友情链接吗？')) return false;
    }


function turn(pages)
{
    if (isNaN(pages))
    {
        alert("请正确填写转到页数！");
        return;
    }
    document.go2to.cpages.value=pages+"";
    document.go2to.submit();
}

    function setLink() {
        var ids = document.getElementsByName("delid");
        var strs = "";
        for (var i = 0; i < ids.length; i++) {
            if (ids[i].checked == true) {
                strs += ids[i].value + ",";
            }
        }
        var str = strs.split(",");
        if (str.length < 2) {
            alert("请选择一条记录！");
        }
        if (str.length > 2) {
            alert("不能选择多条记录！");
        }
        if (str.length == 2) {
            document.location.href = "friendEdit.jsp?mid=" + str[0];
        }

    }

</script>



