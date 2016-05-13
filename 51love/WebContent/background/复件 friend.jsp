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
   String sql ="from Friend as o where o.state="+state+" order by  o.bianhao asc";

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
<title>�������ӹ���</title>
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
        <td align="center">�������ӹ���</td>
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
        <td width="34" height="40" align="center" class="tdc" ><strong>ѡ��</strong></td>
        <td width="50" height="40" align="center" class="tdc" ><strong>���</strong></td>
       <td width="100" height="40" align="center" class="tdc" ><strong>�ύʱ��</strong></td>
        <td width="143" height="40" align="center" class="tdc" ><strong>��վ����</strong></td>
        <td width="143" height="40" align="center" class="tdc" > <strong>��վlogo</strong></td>
        <td width="70" height="40" align="center" class="tdc" ><strong>������ַ</strong></td>
        <td width="*" height="40" align="center" class="tdc" ><strong>��վ����</strong></td>
        <td width="100" height="40" align="center" class="tdc" ><strong>��ϵ��</strong></td>
        <td width="100" height="40" align="center" class="tdc" ><strong>��ϵ�绰</strong></td>
         <td width="50" height="40" align="center" class="tdc" ><strong>����</strong></td>
       <%
         if("1".equals(state) || "2".equals(state) ){
       %>
       <td width="50" height="40" align="center" class="tdc" ><strong>����</strong></td>
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
        <td height="40" align="center"><%=fr.getApplydate()!=null?fr.getApplydate().toString().substring(0,10):""%></td>
        <td height="40" align="center"><a href="friendEdit.jsp?mid=<%=fr.getId()%>"><%=fr.getNetname()%></a></td>
        <td height="40" align="center"> <a href="<%=fr.getNethttp()%>" target="_blank"><img src="<%= fr.getNetlogo()%>" width="125" height="45" border="0"></a></td>
        <td height="40" align="left"><%=fr.getNethttp()==null?"":fr.getNethttp()%></td>
        <td height="*" align="center"><%=fr.getMemo()==null?"":fr.getMemo()%></td>
        <td height="40" align="center"><%=fr.getMan()==null?"":fr.getMan()%></td>
        <td height="40" align="center"><%=fr.getTel()==null?"":fr.getTel()%></td>
              <%
                String addlink  = "<span style='color:red'>��</span>";
                  if(fr.getAddlink()!=null){
                        if(fr.getAddlink() ==1){
                             addlink  = "<span style='color:green'>��</span>";
                        }
                  }
              %>
        <td height="40" align="center"><%=addlink%></td>
        <%
            if("1".equals(state) || "2".equals(state) ){
        %>
        <td height="40" align="center"><%=fr.getBianhao()==null?"":fr.getBianhao()%></td>
        <%}%>
     </tr>
<%
}

%>
    <tr>
      <td height="40" colspan="11" align="center" >
          <input name="del" type="submit" class="button1" value="ɾ��">
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <input name="add" type="button" class="button1" onclick="javascript:window.location.href='friendEdit.jsp'" value="���">
          <input name="add" type="button" class="button1" onclick="javascript:setLink()" value="����">
      </td>
      </tr>
    <tr>
      <td height="40" colspan="12" align="center" >
          <%
              if(cpage == 1)
                  out.println("<font class='info_link'>��    ҳ&nbsp;&nbsp;��һҳ&nbsp;&nbsp; </font> ");
              else
              {
                  out.println("<a href='javascript:turn(1)' class='info_link'>��    ҳ</a>&nbsp;&nbsp;");
                  out.println("<a href='javascript:turn("+prepage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
              }
              if(cpage >= totalPage )
                  out.println("<font class='info_link'>��һҳ&nbsp;&nbsp;βҳ&nbsp;&nbsp;  </font> ");
              else
              {
                  out.println("<a href='javascript:turn("+nextpage+")' class='info_link'>��һҳ</a>&nbsp;&nbsp;");
                  out.println("<a href='javascript:turn("+totalPage+")' class='info_link'>βҳ</a>&nbsp;&nbsp;");
              }
          %>
          ҳ�Σ�<%=cpage%>/<%=totalPage%>ҳ &nbsp;&nbsp; ��<%=totalCount%>�� &nbsp;&nbsp;
          <font color='000064'> ת����
            <input type='text' name='turnpage' size=5 maxLength=8 style='font-size: 9pt; color:#00006A; position: relative; height: 18'
                                          value="">ҳ</font>&nbsp;&nbsp;
          <input class=button type='button' value='ȷ ��' onclick='turn(document.go2to.turnpage.value)'
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
        if(!confirm('ȷ��ɾ��������������')) return false;
    }


function turn(pages)
{
    if (isNaN(pages))
    {
        alert("����ȷ��дת��ҳ����");
        return;
    }
    document.go2to.cpages.value=pages+"";
    document.go2to.submit();
}

 function setLink(){
      var ids = document.getElementsByName("delid");
     var strs= "";
     for(var i=0;i<ids.length;i++){
       if(ids[i].checked==true){
           strs += ids[i].value+",";
        }
     }
     var str = strs.split(",");
    if(str.length<2){
        alert("��ѡ��һ����¼��");
    }
     if(str.length>2){
         alert("����ѡ�������¼��");
     }
     if(str.length == 2){
    document.location.href="friendEdit.jsp?mid="+str[0];
     }

 }

</script>



