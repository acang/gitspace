<%@ page contentType="text/html; charset=GBK" language="java" errorPage="" %>
<%@ page import="com.lover.mng.UserVisitMng" %>
<%@ page import="com.web.common.SysCommonFunc" %>
<%@ page import="com.web.bean.QueryResult" %>
<%@ page import="java.util.*" %>
<%@ page import="com.web.bean.QueryRecord" %>
<%@ page import="hibernate.db.HbmOperator" %>
<%@ page import="com.lover.mng.HYRegMng" %>
<%@ page import="com.web.obj.Meview" %>
<%@ page import="com.web.obj.Userother" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.io.File" %>

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
</head>
<body class="cm_grzx">
<%@ include file="head.jsp"%>
<%
    Userinfo loginUser = (Userinfo)session.getAttribute(SysDefine.SESSION_LOGINNAME);
    Userother uother = (Userother)session.getAttribute(SysDefine.SESSION_LOGINNAME_OTHER);
    if(loginUser == null)
    {
        out.println("<script language='javascript'>alert('�����οͣ�����Ȩ�޲��������ȵ�¼��ע��');showLogin();</script>");
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

<%
    String cpages = SysCommonFunc.getStrParameter(request, "cpages");
    int cpage = SysCommonFunc.getNumberFromString(cpages,1);
    String tcounts = SysCommonFunc.getStrParameter(request,"tcounts");
    int tcount  = SysCommonFunc.getNumberFromString(tcounts,0);
    QueryResult qr = null;
    List wkgs = null;
    String sql = "from Meview as v where v.myId="+loginUser.getHyid()+" and v.viewId <> "+loginUser.getHyid()+" order by v.viewTime desc";
    int pagesize = 10;
    if(tcount > 0)
        qr = QueryRecord.queryByHbm(sql, pagesize, cpage, false, tcount);
    else
        qr = QueryRecord.queryByHbm(sql,pagesize,cpage);
    wkgs = qr.resultList;
    int totalPage = qr.pageCount;
    int totalCount = qr.rowCount;
    cpage = qr.pageNum;
    int prepage = cpage-1;
    int nextpage = cpage+1;

%>
<%
    String afilepath = SysCommonFunc.getPhotoView();
    String afilepathsmall = SysCommonFunc.getPhotoSmallView();

%>
<div class="wrapper1250 cm_block01">
    <div class="block01">
           <div class="box01"> <span class="tx">
                 <%
                     if (uother!=null && uother.getUserphoto1() != null && !"".equals(uother.getUserphoto1())) {
                         String left_small_pic = "../" + afilepathsmall + File.separator + uother.getUserphoto1();
                 %>
                  <img src="<%=left_small_pic%>" alt=""/>
                   <%
                   } else {
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
                <h2>�ҿ���˭</h2>
            </div>
            <div style="clear:both"></div>
            <ul class="pic_list">
                <%

                    Userinfo uinfo = null;
                    List uulist = null;
                    Meview view = null;
                    Userother userother123 = null;
                    boolean isvery = false;
                    int i=0;
                    for( i=0; i<wkgs.size();i++){
                        view = (Meview)wkgs.get(i);

                        userother123 = HYRegMng.getUserOtherByHyid(view.getViewId().toString());
                        uulist = HbmOperator.list("from Userinfo as o where o.hyid='"
                                + view.getViewId() + "' and o.isdel=0");
                         Date csdatet = new Date(System.currentTimeMillis());        
                         Date cdate  = new Date(System.currentTimeMillis());
                         String age = "δ֪";
                         String vs1 = "δ֪";
                        if(uulist!=null && uulist.size()>0){
                            uinfo = (Userinfo)uulist.get(0);
                            csdatet = uinfo.getCsdate();
                            //add by gaojianhong 20120821 for ����ISVCATION�Ƿ���֤�ֶ� start
		                        isvery = false;
		                        if(uinfo.getIsvcation()==1)
		                            isvery = true;
		                        //add by gaojianhong 20120821 for ����ISVCATION�Ƿ���֤�ֶ� end
		                          vs1 = (uinfo.getS1() == null ? "":uinfo.getS1()) + (uinfo.getS2() == null ? "":uinfo.getS2());
		                        if(vs1.equals("��������"))
		                            vs1 = "����";
		                        if(vs1.equals("�Ϻ��Ϻ�"))
		                            vs1 = "�Ϻ�";
		                        if(vs1.equals("������"))
		                            vs1 = "���";
		                        if(vs1.equals("��������"))
		                            vs1 = "����";
		                        if(vs1.equals("������"))
		                            vs1 = "���";
		                        if(vs1.equals("���Ű���"))
		                            vs1 = "����";
		                        if(csdate != null)
		                            age  = (cdate.getYear()-csdatet.getYear())+"";
		                        }
		                       
                        
                        

                %>
                <%
                    String ly="";
                    if(userother123 != null && userother123.getJyly()!=null&&userother123!=null&&userother123.getJyly().length()>30){
                        ly = userother123.getJyly().substring(0,30);
                    }else if(userother123!= null && userother123.getJyly()!=null&&userother123!=null &&userother123.getJyly().length()<=30 ){
                        ly = userother123.getJyly();
                    }else{
                        ly="";
                    }
                %>

                <li><span class="tx">

                    <a href="perinfo-id-<%=uinfo.getHyid()%>.htm" target="_blank">
                        <%
                            if(userother123!=null && userother123.getUserphoto1()!=null){

                        %>
                        <img src="../<%=afilepathsmall+File.separator+userother123.getUserphoto1() %>" alt="">
                        <%}else{%>
                        <img src="images/nopic2.gif" alt="">
                        <%}%>
                    </a></span>
                    <a href="perinfo-id-<%=uinfo.getHyid()%>.htm" target="_blank" class="name"><%=uinfo.getLcname() %></a>
                    <span class="yyz">  <%if(isvery) {%>����֤<%} %></span>
                    <p class="txt03"><%=uinfo.getSex().equals("11")?"Ůʿ":"��ʿ" %>, <%=age %>��, <%=vs1 %></p>
                    <p class="txt02"> <strong>�������ԣ�</strong><%=ly%></p>
                </li>
               <%}%>

            </ul>
            <div class="Paging">
                <%
                    int startpage = 0;
                    if((cpage-5) <=0){
                        startpage = 1;
                    }else{
                        startpage = cpage-5;
                    }


                    if(cpage == 1){
                        out.println("<a href='###'>��    ҳ</a><a href='###'>��һҳ</a>");
                    }else
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

                    if(cpage >= totalPage){
                        out.println("<a href='###'>��һҳ</a>&nbsp;&nbsp;<a href='###'>βҳ</a>");
                    }else
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
<iframe  name="sframe" src="#" width="0" height="0" style="display:none"></iframe>
<form id="pageform" action="grzqwkgs.jsp" target="_self">
    <input name="cpages" type="hidden" value="1">
</form>
</body>
<script>
    function turn(a){
        pageform.cpages.value=a;
        pageform.submit();
    }
</script>
</html>
