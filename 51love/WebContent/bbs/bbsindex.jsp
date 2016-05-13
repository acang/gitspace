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
        lanmu_name = "���Ѷ�̬";
    }
    if("3".equals(sortid)){
        lanmu_name = "���ѹ���";
    }
    if("12".equals(sortid)){
        lanmu_name = "���ѹ���";
    }
    if("9".equals(sortid)){
        lanmu_name = "���ѹ���";
    }
    if(sortid.length() ==0)
    {
        out.println("��ѡ������!");
        return;
    }


    if(SysCommonFunc.getNumberFromString(sortid,0)==0)
    {
        out.println("��ѡ������!");

        System.out.println("sqlע��"+sortid);
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
        out.println("���鿴�����ⲻ����!");
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
<title>51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��</title>
<meta name="description" content="51����������վ?�й�������ҵ���Ʒ�ơ����ܹ�ϵ���������¡�����ѵ����ȫ��λ֧������������ʮ����Ӫ��ǧ���Ա���������飬��51���ѿ�ʼ��" />
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="keywords" content="51��������-���ܽ��� �������� ͬ�ǽ��� �������� ����ѵ�� ����ѵ��" />
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
            ����������</a></div><span style=" float:left"><a href="index.jsp"><strong>��Ա����</strong></a>&nbsp;&gt;&nbsp;<strong><%=lanmu_name%></strong></span></div>
    <div class="box02">
      <table width="100%" border="0" cellspacing="0" cellpadding="0">

          <tr>
            <th width="50"><strong>״̬</strong></th>
            <th><strong>����</strong></th>
            <th width="130"><strong>����</strong></th>
            <%--<th width="50"><strong>�ظ�</strong></th>--%>
            <%--<th width="50"><strong>����</strong></th>--%>
            <%--<th width="150"><strong>��󷢱�ʱ��</strong></th>--%>
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
                    zt ="<span class='tj'><strong>[����]</strong></span>";
                    title="<span class='tj'><strong>"+bb.getTitle()+"</strong></span>";
                }
                if(bb.getOntop() != null && bb.getOntop().intValue() ==1)
                {
                    zt="<span class='zd'><strong>[�ö�]</strong></span>";
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
		alert('����δͨ����ˣ��뱣�ֵ绰��ͨ');
		return false;
	}else{
		return true;
	}
}

</script>
      <div align="center"><div onclick="fabuaa();" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px;"> 
           <a href="javascript:void(0);" style="background-color:#21648f; height:40px; line-height:40px; text-align:center; color:#FFF; width:150px;"> ����������</a> </div></div>
      <div class="Paging" style="height:40px;padding-top:15px;">


                  <form name="go2to" id="go2to" method="post" action="bbsindex.jsp">
                  <input type="hidden" name="cpages" value="<%=cpage%>" />
                  <input type="hidden" name="tcounts" value="<%=qr.rowCount%>">
                  <input type="hidden" name="sortid" value="<%=sortid%>"/>
                      <%
                if(cpage == 1)
                    out.println("<a href='###'>��    ҳ</a><a href='###'>��һҳ</a>");
                else
                {
                    out.println("<a href='javascript:turn(1)'>��    ҳ</a>");
                    out.println("<a href='javascript:turn("+prepage+")'>��һҳ</a>");
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
//                    out.println("<a href='###'>��һҳ</a><a href='###'>βҳ</a>");
                }

                else
                {
                    out.println("<a href='javascript:turn("+nextpage+")'>��һҳ</a>");
//                    out.println("<a href='javascript:turn("+totalPage+")'>βҳ</a>");
                }
            %>
              <%--&nbsp; <a>��<%=totalCount%>��������</a> &nbsp;--%>

          </form>
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
      <div class="erweima"><img src="../images/weixin_erweima.jpg" alt="" width="120" height="120"/><br/>΢�Ź��ںţ��ƶ�վ��</div>
      <div class="erweima"><img src="../images/kf_img.jpg" alt="" width="120"  /><br/>�ͷ��绰</div>
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
        	alert("�����οͣ����ȵ�½��ע�ᣡ");
           showLogin("bbsindex.jsp?sortid=<%=sortid%>","addtopic.jsp?sortid=<%=sortid%>");
     <%

} else{
	if(loginUser.getIsdel()!=null && loginUser.getIsdel()==2){
		%>
		alert('����δͨ����ˣ��뱣�ֵ绰��ͨ');
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
